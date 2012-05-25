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

import org.apache.log4j.Category;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.ActionMessages;
import org.apache.struts.action.DynaActionForm;

import br.gov.serpro.ouvidoria.controller.AcionamentoCtrl;
import br.gov.serpro.ouvidoria.controller.andamento.EnviarEmailCtrl;
import br.gov.serpro.ouvidoria.controller.andamento.RedirecionarMensagemCtrl;
import br.gov.serpro.ouvidoria.dao.DaoException;
import br.gov.serpro.ouvidoria.model.Acionamento;
import br.gov.serpro.ouvidoria.model.EstadoAcionamento;
import br.gov.serpro.ouvidoria.model.Funcionario;
import br.gov.serpro.ouvidoria.model.MeioEnvioResposta;
import br.gov.serpro.ouvidoria.model.Orgao;
import br.gov.serpro.ouvidoria.struts.ActionSupport;
import br.gov.serpro.ouvidoria.util.Constants;
import br.gov.serpro.ouvidoria.util.Utilitario;

/**
 * Objetivo: Responder a mensagem escohida
 * 
 * @author SERPRO
 * @version $Revision: 1.1.2.6 $, $Date: 2011/10/18 17:57:04 $
 * @version 0.1, 2004/12/21
 */
public class ResponderMsgAction extends ActionSupport {

	/**
	 * Método de execução da ação. Realiza dois forwards: um em caso de sucesso
	 * e outro em caso de falha
	 * 
	 * @param mapping
	 * @param form
	 *            ActionForm, caso necessário
	 * @param request
	 * @param response
	 * 
	 */
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		final Category log = Category.getInstance(ResponderMsgAction.class
				.getName());
		DynaActionForm _form = (DynaActionForm) form;
		ActionMessages errorMsgs = new ActionMessages();

		// Recupera parámetros da requisição
		String lsTitulo = _form.getString("txtTitulo");
		String lsResp = _form.getString("txtResposta");
		String lidAcion = _form.getString("idAcionamento");
		String lsAcao = _form.getString("txtAcao");
		String lidRemetenteRedirec = _form.getString("idRemetenteRedirec");
		String stSolucao = _form.getString("idSolucao");
        
        Long idSolucao=null;
        
        if (stSolucao!=null && !stSolucao.trim().equals("")){
        	idSolucao=(new Long(stSolucao));
        }

		// Responde ao acionamento
		try {

			AcionamentoCtrl ctrlAcion = new AcionamentoCtrl(getDaoFactory());

			// Recupera o acionamento a partir do id
			Acionamento acionamento = ctrlAcion.get(new Long(lidAcion));

			if (acionamento == null) {
				errorMsgs.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
						"error.mensagem.notFound"));

				saveMessages(request, errorMsgs);
			} else if (lidRemetenteRedirec != null
					&& !lidRemetenteRedirec.equals("")) {

				// retorna ao ouvidor que redirecionou a msg ao especialista
				// consultor
				RedirecionarMensagemCtrl redirecionarMensagemCtrl = new RedirecionarMensagemCtrl(
						getDaoFactory());
				Funcionario ouvidor = null;

				ouvidor = redirecionarMensagemCtrl.obterOuvidor(new Long(lidRemetenteRedirec));
				
				if (ouvidor != null) {
					acionamento.setFuncionario(ouvidor);
				}

				Timestamp hoje = new Timestamp(System.currentTimeMillis());
				// Finaliza resposta ao acionamento
				acionamento.finalizarRespostaConsultor(lsTitulo, lsResp, hoje, idSolucao);
				redirecionarMensagemCtrl.salvarAcionamento(acionamento);
				ctrlAcion.save(acionamento);
				// Repassa os parámetros para a tela de mensagem de sucesso
				request.setAttribute("idAcionamento", lidAcion);
				request.setAttribute("txtAcao", lsAcao);

			} else {
				Timestamp hoje = new Timestamp(System.currentTimeMillis());

				// Finaliza resposta ao acionamento
				acionamento
						.finalizarRespostaAcionamento(lsTitulo, lsResp, hoje, idSolucao);

				// acionamento.setEstadoAcionamento(EstadoAcionamento.RESPONDIDO);
				ctrlAcion.save(acionamento);

				// Verifica se a opção de recebimento da resposta for email.
				if (acionamento.getAcionador().getMeioEnvioRespostaOrgao()
						.getMeioEnvioResposta().getId().longValue() == MeioEnvioResposta.EMAIL
						.getId().longValue()) {

					EnviarEmailCtrl envioEmail = new EnviarEmailCtrl(
							getDaoFactory());
					Orgao orgao = getOrgao(request);

					String lsEnderecoUrl = "";

					try {

						int tamanho = request.getRequestURL().length();

						lsEnderecoUrl = request.getRequestURL().substring(0,
								(tamanho - 32));

						log.info("endereco: " + lsEnderecoUrl);

						String enc = Utilitario.encrypt(Constants.DES_KEY,
								orgao.getId().toString());
						
						Integer numProtocolo = acionamento.getNumeroProtocolo();
						
						String codigoAcesso = "";
						
						if (this.getOrgao(request).getConfiguracoes().getPossuiCodigoAcesso()
								.booleanValue()) {
							codigoAcesso = acionamento.getAcionador().getInformacoesConsultaAcionamento().getCodigoAcesso();
							codigoAcesso = "&codigoAcesso="+codigoAcesso+"&osessionid=".concat(enc);
						}
						lsEnderecoUrl=lsEnderecoUrl+"andamento/ExibirResposta.do?action=consultar&numeroProtocolo="+numProtocolo;
						lsEnderecoUrl=lsEnderecoUrl+codigoAcesso;
						lsEnderecoUrl=lsEnderecoUrl+"&osessionid=".concat(enc);

						log.info("endereco: " + lsEnderecoUrl);

					} catch (Exception e) {

						log.info("ERRO:::" + e.getMessage());
						log.info("ERRO:::" + e.getCause());
						log.info("ERRO:::" + e.getStackTrace());
						return (mapping.findForward("failure"));
					}

					boolean emailOK = envioEmail.enviarEmail(acionamento,
							orgao, lsEnderecoUrl);

					// Passa atributo ao request comunicando o envio do email
					if (emailOK == true) {
						request.setAttribute("EnvioEmail", "OK");
						// Altera estado do acionamento para enviado
						acionamento
								.setEstadoAcionamento(EstadoAcionamento.ENVIADO);
						ctrlAcion.save(acionamento);
					}
				}
			}

			// Repassa os parámetros para a tela de mensagem de sucesso
			request.setAttribute("idAcionamento", lidAcion);
			request.setAttribute("txtAcao", lsAcao);
			this.geraHistorico(request, acionamento);

		} catch (DaoException e) {
			errorMsgs.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
					"error.respondermsg.salvar"));
			saveMessages(request, errorMsgs);
			if (Constants.DEBUG) {
				System.out.println("ERRO: " + e.getMessage());
				e.printStackTrace(System.out);
			}
		}

		if (errorMsgs.isEmpty()) {
			return (mapping.findForward("success"));
		}
		return (mapping.findForward("failure"));

	}
}