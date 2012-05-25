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

import java.util.ArrayList;
import java.util.Collection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.ActionMessages;

import br.gov.serpro.ouvidoria.controller.ControleAcessoCtrl;
import br.gov.serpro.ouvidoria.controller.andamento.ReclassificarMensagemCtrl;
import br.gov.serpro.ouvidoria.controller.gerencial.administracao.FuncionarioCtrl;
import br.gov.serpro.ouvidoria.controller.gerencial.administracao.TipoMensagemCtrl;
import br.gov.serpro.ouvidoria.model.Acionamento;
import br.gov.serpro.ouvidoria.model.Funcionalidade;
import br.gov.serpro.ouvidoria.model.Funcionario;
import br.gov.serpro.ouvidoria.model.Perfil;
import br.gov.serpro.ouvidoria.struts.ActionSupport;
import br.gov.serpro.ouvidoria.util.Constants;

/**
 * 
 * @author SERPRO
 * @version $Revision: 1.1.2.3 $, $Date: 2011/10/18 17:57:03 $
 * @version 0.1, 2004/12/21
 */
public class TelaReclassificarMensagemAction extends ActionSupport {
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		ActionMessages msgs = new ActionMessages();
		ActionErrors errors = new ActionErrors();

		ReclassificarMensagemCtrl reclassificarMensagemCtrl = new ReclassificarMensagemCtrl(
				getDaoFactory());

		TipoMensagemCtrl tipoMensagemCtrl = new TipoMensagemCtrl(
				getDaoFactory());

		Collection lstTipoMensagem = tipoMensagemCtrl.list(this
				.getOrgao(request));

		Integer idAcionamento = new Integer(request
				.getParameter("idAcionamento"));

		Long funcionarioId = (Long) request.getSession().getAttribute(
				Constants.PA_FUNCIONARIO);

		FuncionarioCtrl funcionarioCtrl = new FuncionarioCtrl(getDaoFactory());

		Funcionario funcionario = (Funcionario) funcionarioCtrl
				.get(funcionarioId);

		Acionamento acionamento = reclassificarMensagemCtrl
				.getAcionamento(idAcionamento);

		Collection lstAssuntos = null;

		if (funcionario.getPerfil().getId().intValue() == Perfil.OUVIDOR_GERAL
				.getId().intValue()
				|| funcionario.getPerfil().getId().intValue() == Perfil.OUVIDOR_ASSISTENTE
						.getId().intValue()) {

			lstAssuntos = getOrgao(request).getListaTodosAssuntos("Ativo");
			lstAssuntos.remove(acionamento.getMensagem().getAssunto());
		} else {

			lstAssuntos = reclassificarMensagemCtrl.getAssuntos(funcionario,
					acionamento.getMensagem().getAssunto());
		}

		ControleAcessoCtrl controleAcessoCtrl = new ControleAcessoCtrl(
				daoFactory);

		if (request.getSession().getAttribute(Constants.SR_FUNCIONALIDADES) != null) {

			Funcionalidade funcionalidade = new Funcionalidade();

			ArrayList regras = (ArrayList) request.getSession().getAttribute(
					Constants.SR_FUNCIONALIDADES);

			for (int i = 0; i < regras.size(); i++) {

				funcionalidade.setId(Long.valueOf(regras.get(i).toString()));

				boolean possuiAcesso = controleAcessoCtrl.acessoFuncionalidade(
						funcionario, funcionalidade);

				if (possuiAcesso) {
					if (regras.get(i).equals("44")) {
						// Código 44 representa reclassificar Assuntos
						request.setAttribute("listaAssuntos", lstAssuntos);

						if (request.getAttribute("fezSubmit") == null) {
							// Se o funcionário não trata de outros assuntos
							// além do
							// assunto do acionamento atual, exibe a mensagem
							if (lstAssuntos.isEmpty()) {
								msgs
										.add(
												ActionMessages.GLOBAL_MESSAGE,
												new ActionMessage(
														"reclassificar.funcionario.semassunto"));
								saveMessages(request, msgs);
							}

							System.out.println("lstAssuntos.isEmpty() "
									+ lstAssuntos.isEmpty());
						}

					}

					if (regras.get(i).equals("56")) {
						// Código 56 representa reclassificar Tipo Mensagem
						request.setAttribute("listaTipoMensagem",
								lstTipoMensagem);
					}
				}
			}
		}

		if (errors.isEmpty()) {
			return (mapping.findForward("success"));
		}
		return (mapping.findForward("failure"));
	}
}