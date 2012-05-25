/*
 * Sistema de Ouvidoria: um canal através do qual os usuários
 * podem encaminhar suas reclamações, elogios e sugestões.
 * 
 * Copyright (C) 2011 SERPRO
 * 
 * Este programa é software livre; você pode redistribuí-lo e/ou
 * modificá-lo sob os termos da Licença Pública Geral GNU, conforme
 * publicada pela Free Software Foundation; tanto a versão 2 da
 * Licença como (a seu critério) qualquer versão mais nova.
 * 
 * Este programa é distribuído na expectativa de ser útil, mas SEM
 * QUALQUER GARANTIA; sem mesmo a garantia implícita de
 * COMERCIALIZAÇÃO ou de ADEQUAÇÃO A QUALQUER PROPÓSITO EM
 * PARTICULAR. Consulte a Licença Pública Geral GNU para obter mais
 * detalhes.
 * 
 * Você deve ter recebido uma cópia da Licença Pública Geral GNU,
 * sob o título "LICENCA.txt", junto com esse programa. Se não,
 * acesse o Portal do Software Público Brasileiro no endereço
 * http://www.softwarepublico.gov.br/ ou escreva para a Fundação do
 * Software Livre (FSF) Inc., 51 Franklin St, Fifth Floor, Boston,
 * MA 02111-1301, USA.
 * 
 * Contatos através do seguinte endereço internet:
 * http://www.serpro.gov.br/sistemaouvidoria/
 */
package br.gov.serpro.ouvidoria.struts.action.aprendizado;

import java.io.DataInputStream;
import java.io.FileInputStream;
import java.sql.Timestamp;
import java.util.List;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import br.gov.serpro.ouvidoria.controller.aprendizado.BoletimCtrl;
import br.gov.serpro.ouvidoria.controller.aprendizado.HistoricoEnvioCtrl;
import br.gov.serpro.ouvidoria.controller.gerencial.administracao.FuncionarioCtrl;
import br.gov.serpro.ouvidoria.model.Boletim;
import br.gov.serpro.ouvidoria.model.Funcionario;
import br.gov.serpro.ouvidoria.model.HistoricoEnvio;
import br.gov.serpro.ouvidoria.struts.DispatchActionSupport;
import br.gov.serpro.ouvidoria.util.Constants;
import br.gov.serpro.ouvidoria.util.Utilitario;

/**
 * Administrar as funcionalidades de Histórico de Envio
 * 
 * @author SERPRO
 * @version $Revision: 1.1.2.5 $, $Date: 2011/11/11 20:59:01 $
 * @version 0.1, 2005/02/02
 */
public class AtualizarHistoricoEnvioAction extends DispatchActionSupport {

	public ActionForward listar(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		BoletimCtrl boletimCtrl = new BoletimCtrl(getDaoFactory());

		Boletim boletim = boletimCtrl.get(new Long(request
				.getParameter("idBoletim")));

		if (boletim == null) {
			request.setAttribute("zero", "true");
			return mapping.findForward("listar");
		}

		HistoricoEnvioCtrl defaultCtrl = new HistoricoEnvioCtrl(getDaoFactory());

		List results = defaultCtrl.list(boletim.getId().toString());

		if (results.size() == 0) {
			request.setAttribute("zero", "true");
		}

		request.setAttribute("boletim", boletim);
		request.setAttribute("listar", results);

		return mapping.findForward("listar");
	}

	public ActionForward telaDistribuir(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		HistoricoEnvioCtrl defaultCtrl = new HistoricoEnvioCtrl(getDaoFactory());
		List results = defaultCtrl.getGrupos(this.getOrgao(request));

		request.setAttribute("listaGrupo", results);

		return mapping.findForward("exibirDistribuir");
	}

	public ActionForward distribuir(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		HistoricoEnvioCtrl defaultCtrl = new HistoricoEnvioCtrl(getDaoFactory());
		BoletimCtrl boletimCtrl = new BoletimCtrl(getDaoFactory());

		HistoricoEnvio itemHistorico = new HistoricoEnvio();
		// Recupera o Funcionário logado
		Long funcionarioId = (Long) request.getSession().getAttribute(
				Constants.PA_FUNCIONARIO);

		FuncionarioCtrl funcionarioCtrl = new FuncionarioCtrl(getDaoFactory());

		Funcionario funcionario = (Funcionario) funcionarioCtrl
				.get(funcionarioId);
		Boletim boletim = boletimCtrl.get(new Long(request
				.getParameter("idBoletim")));

		itemHistorico.setListaEmails(request.getParameter("listaEmails"));
		itemHistorico.setFuncionario(funcionario);
		itemHistorico.setBoletim(boletim);
		itemHistorico.setDataEnvio(new Timestamp(System.currentTimeMillis()));

		String listaBCC = "";
		StringTokenizer st = new StringTokenizer(
				itemHistorico.getListaEmails(), ";");
		while (st.hasMoreTokens()) {
			listaBCC += st.nextToken().trim() + ";";
		}

		// retira o último ";"
		listaBCC = listaBCC.substring(0, listaBCC.length() - 1);

		String strCaminhoBoletim = boletimCtrl.getParametrosGerais()
				.getDiretorioContextoAplicacao()
				+ this.getOrgao(request).getConfiguracoes()
						.getNomeDiretorioOrgao()
				+ "/boletins/boletim_"
				+ request.getParameter("idBoletim") + ".html";
		
		String domain = request.getScheme() + "://" + request.getServerName()
				+ ":" + request.getServerPort() + "/";

		String urlBoletim = domain
				+ this.getOrgao(request).getConfiguracoes()
						.getNomeDiretorioOrgao() + "/boletins/boletim_"
				+ request.getParameter("idBoletim") + ".html";

		String htmlText = "<p>Caso n&atilde;o consiga vizualizar o boletim, utilize o endere&ccedil;o: <a href=\""
				+ urlBoletim
				+ "\" target=\"boletim\">"
				+ urlBoletim
				+ "</a></p><br>";

		try {
			FileInputStream file = new FileInputStream(strCaminhoBoletim);
			DataInputStream in = new DataInputStream(file);
			byte[] b = new byte[in.available()];
			in.readFully(b);
			in.close();

			final String result = new String(b, 0, b.length, "ISO-8859-15");

			htmlText += result
					+ "<br><br><center>MENSAGEM AUTOM&Aacute;TICA: N&atilde;o responda &agrave; esta mensagem. "
					+ "Se desejar entrar em contato, acesse novamente o sistema.</center><BR>";

			if (Utilitario.enviarEmail(boletimCtrl.getParametrosGerais()
					.getServidorSMTP(), this.getOrgao(request)
					.getConfiguracoes().getRemetenteEmail(), this.getOrgao(
					request).getConfiguracoes().getRemetenteEmail(), "",
					listaBCC, "Boletim: " + boletim.getNome(), htmlText)) {
				defaultCtrl.save(itemHistorico);
			} else {
				request.setAttribute("erro", "true");
			}

		} catch (Exception e) {
			request.setAttribute("erro", "true");
			e.printStackTrace();
		}

		List results = defaultCtrl.getGrupos(this.getOrgao(request));

		request.setAttribute("listaGrupo", results);

		request.setAttribute("fechar", "true");

		return mapping.findForward("exibirDistribuir");
	}

	public ActionForward exibir(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		final String id = request.getParameter("id");

		HistoricoEnvio object = null;
		if (id == null || id.trim().length() == 0) {
			object = new HistoricoEnvio();
		} else {
			HistoricoEnvioCtrl defaultCtrl = new HistoricoEnvioCtrl(
					getDaoFactory());
			object = defaultCtrl.get(new Long(id));
		}

		request.setAttribute("object", object);
		request.setAttribute("function", request.getParameter("function"));

		return mapping.findForward("exibir");
	}

	public ActionForward exibirDetalhe(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		final String id = request.getParameter("id");

		HistoricoEnvio object = null;
		if (id == null || id.trim().length() == 0) {
			object = new HistoricoEnvio();
		} else {
			HistoricoEnvioCtrl defaultCtrl = new HistoricoEnvioCtrl(
					getDaoFactory());
			object = defaultCtrl.get(new Long(id));
		}

		request.setAttribute("object", object);
		request.setAttribute("function", request.getParameter("function"));

		return mapping.findForward("exibirDetalhe");
	}

	public ActionForward salvar(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		
		return mapping.findForward("success");
	}
}