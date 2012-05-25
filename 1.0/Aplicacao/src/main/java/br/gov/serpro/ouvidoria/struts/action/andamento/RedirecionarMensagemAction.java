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
package br.gov.serpro.ouvidoria.struts.action.andamento;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.DynaActionForm;

import br.gov.serpro.ouvidoria.controller.andamento.RedirecionarMensagemCtrl;
import br.gov.serpro.ouvidoria.controller.gerencial.administracao.FuncionarioCtrl;
import br.gov.serpro.ouvidoria.model.Acionamento;
import br.gov.serpro.ouvidoria.model.Funcionario;
import br.gov.serpro.ouvidoria.model.Perfil;
import br.gov.serpro.ouvidoria.struts.ActionSupport;
import br.gov.serpro.ouvidoria.util.Constants;

/**
 *  
 * @author SERPRO
 * @version $Revision: 1.1.2.3 $, $Date: 2011/10/18 17:57:04 $
 * @version 0.1, 2004/12/20
 */
public class RedirecionarMensagemAction extends ActionSupport {

	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		ActionErrors errors = new ActionErrors();
		RedirecionarMensagemCtrl redirecionarMensagemCtrl = new RedirecionarMensagemCtrl(
				getDaoFactory());

		DynaActionForm _form = (DynaActionForm) form;

		String tipoRedirecionamento = (String) _form
				.get("tipoRedirecionamento");
		String despacho = (String) _form.get("despacho");
		Integer idAcionamento = new Integer(request
				.getParameter("idAcionamento"));

		Integer idLocalidadeOcorrencia = (Integer) _form
				.get("localidadeOcorrencia");
		Integer idAssunto = (Integer) _form.get("assunto");
		Integer idSubOrgao = (Integer) _form.get("subOrgao");
		String titulo = (String) _form.get("titulo");

		String consultorId = (String) _form.get("consultor");

		Acionamento acionamento = redirecionarMensagemCtrl
				.getAcionamento(idAcionamento);

		Long funcionarioId = (Long) request.getSession().getAttribute(
				Constants.PA_FUNCIONARIO);

		FuncionarioCtrl funcionarioCtrl = new FuncionarioCtrl(getDaoFactory());

		Funcionario funcionario = (Funcionario) funcionarioCtrl
				.get(funcionarioId);

		Funcionario consultor = new Funcionario();

		if (!consultorId.equals("")) {
			consultor = (Funcionario) funcionarioCtrl.get(consultorId);
		}

		if (acionamento.getRespostaAcionamento() != null) {
			acionamento.getRespostaAcionamento().setTitulo(titulo);
		} else {
			Timestamp hoje = new Timestamp(System.currentTimeMillis());

			// Salva rascunho da resposta
			acionamento.salvarRascunhoRespostaAcionamento(titulo, "", hoje,
					null);
		}

		if (tipoRedirecionamento.compareTo("outro") == 0) {
			acionamento.setLocalidadeOcorrencia(redirecionarMensagemCtrl
					.getLocalidadeOcorrencia(idLocalidadeOcorrencia));
			acionamento.getMensagem().setAssunto(
					redirecionarMensagemCtrl.getAssunto(idAssunto));

			acionamento.redirecionarAcionamento(acionamento.getMensagem()
					.getTipoMensagem(), acionamento.getMensagem().getAssunto(),
					redirecionarMensagemCtrl.getSubOrgao(idSubOrgao),
					redirecionarMensagemCtrl
							.getLocalidadeOcorrencia(idLocalidadeOcorrencia),
					funcionario, despacho, this.getOrgao(request));

			redirecionarMensagemCtrl.salvarAcionamento(acionamento);

		} else if ((tipoRedirecionamento.compareTo("consultor") == 0)
				&& (consultor != null)) {

			// Perfil consultor
			// Redirecionamento para um funcionario consultor

			acionamento.setLocalidadeOcorrencia(redirecionarMensagemCtrl
					.getLocalidadeOcorrencia(idLocalidadeOcorrencia));
			acionamento.getMensagem().setAssunto(
					redirecionarMensagemCtrl.getAssunto(idAssunto));
			acionamento.setFuncionario(consultor);
			acionamento.redirecionarAcionamentoConsultor(acionamento
					.getMensagem().getTipoMensagem(), acionamento.getMensagem()
					.getAssunto(), redirecionarMensagemCtrl
					.getSubOrgao(idSubOrgao), consultor,
					redirecionarMensagemCtrl
							.getLocalidadeOcorrencia(idLocalidadeOcorrencia),
					funcionario, despacho, this.getOrgao(request));

			redirecionarMensagemCtrl.salvarAcionamento(acionamento);

		} else {
			if (tipoRedirecionamento.compareTo("ouvidor") == 0) {
				Funcionario ouvidor = null;
				// Caso de redirecionar para ouvidor assistente
				if ((!funcionario.getPerfil().equals(Perfil.OUVIDOR_ASSISTENTE))
						&& ((!funcionario.getPerfil().equals(
								Perfil.OUVIDOR_GERAL)))) {

					ouvidor = redirecionarMensagemCtrl.obterOuvidorAssistente(
							acionamento, this.getOrgao(request));
					if (ouvidor != null) {
						acionamento.setFuncionario(ouvidor);
					} else {
						ouvidor = redirecionarMensagemCtrl.obterOuvidorGeral(
								acionamento, this.getOrgao(request));
						if (ouvidor != null) {
							acionamento.setFuncionario(ouvidor);
						}
					}

				} else {
					if (funcionario.getPerfil().equals(
							Perfil.OUVIDOR_ASSISTENTE)) {
						ouvidor = redirecionarMensagemCtrl.obterOuvidorGeral(
								acionamento, this.getOrgao(request));
						if (ouvidor != null) {
							acionamento.setFuncionario(ouvidor);
						}
					}
				}
				acionamento.setDespacho(despacho);
				redirecionarMensagemCtrl.salvarAcionamento(acionamento);
			}
		}

		if ((acionamento.getFuncionario().getEmail() == null)
				|| (acionamento.getFuncionario().getEmail() != null && acionamento
						.getFuncionario().getEmail().equals(""))) {

			request.setAttribute("semEmail", "true");
		}

		request.setAttribute("fezSubmit", "true");

		/* Gera histórico, se for o caso */
		this.geraHistorico(request, acionamento);

		if (!errors.isEmpty()) {
			return (mapping.findForward("failure"));
		}

		HttpSession session = request.getSession(true);
		session.setAttribute("possuiPesquisa", "sim");

		return (mapping.findForward("success"));

	}
}