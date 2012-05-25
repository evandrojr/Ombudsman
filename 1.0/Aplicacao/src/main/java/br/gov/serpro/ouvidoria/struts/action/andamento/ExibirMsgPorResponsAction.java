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

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.ActionMessages;

import br.gov.serpro.ouvidoria.controller.AcionamentoCtrl;
import br.gov.serpro.ouvidoria.controller.HistoricoCtrl;
import br.gov.serpro.ouvidoria.dao.DaoException;
import br.gov.serpro.ouvidoria.model.Acionamento;
import br.gov.serpro.ouvidoria.model.Historico;
import br.gov.serpro.ouvidoria.model.MeioEnvioResposta;
import br.gov.serpro.ouvidoria.struts.ActionSupport;
import br.gov.serpro.ouvidoria.util.Constants;
import br.gov.serpro.ouvidoria.util.Utilitario;

/**
 * Objetivo: Exibir a mensagem selecionada para que a mesma seja respondida,
 * redirecionada ou reclassificada
 * 
 * @author SERPRO
 * @version $Revision: 1.1.2.3 $, $Date: 2011/10/18 17:57:04 $
 * @version 0.1, 2004/12/16
 */
public class ExibirMsgPorResponsAction extends ActionSupport {

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

		// ActionErrors errors = new ActionErrors();
		ActionMessages errorMsgs = new ActionMessages();

		try {

			AcionamentoCtrl ctrlAcion = new AcionamentoCtrl(getDaoFactory());

			// Recupera o Id do acionamento a ser exibido
			Long acionamentoId = new Long(request
					.getParameter("primeiroAcionamentoId"));

			// Recupera o acionamento a partir do id
			Acionamento acionamento = ctrlAcion.get(acionamentoId);

			if (acionamento == null) {
				errorMsgs.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
						"error.mensagem.notFound"));

				saveMessages(request, errorMsgs);
				return (mapping.findForward("failure"));
			}

			request.setAttribute("acionamento", acionamento);

			// Verifica se o meio de envio de resposta é por telefone/fax
			if ((acionamento.getAcionador().getMeioEnvioRespostaOrgao()
					.getMeioEnvioResposta().getId().longValue() == MeioEnvioResposta.TELEFONE
					.getId().longValue())
					|| (acionamento.getAcionador().getMeioEnvioRespostaOrgao()
							.getMeioEnvioResposta().getId().longValue() == MeioEnvioResposta.FAX
							.getId().longValue())) {
				request.setAttribute("meioRespostaTel", "S");
			} else {
				request.setAttribute("meioRespostaTel", "N");
			}

			// Se o acionamento possuir resposta, retorna o título da mesma
			// para a tela de exibição da mensagem
			if (acionamento.getRespostaAcionamento() == null) {
				request.setAttribute("titulo", "");
			} else {
				request.setAttribute("titulo", acionamento
						.getRespostaAcionamento().getTitulo());
			}
			request.setAttribute("idAcionamento", acionamento.getId());

			// Recupera o nome e o diretório dos arquivos anexos

			String nomeAnexo = acionamento.getMensagem().getArquivoAnexo();
			String nomeMsgDigitalizada = acionamento.getMensagem()
					.getMensagemDigitalizada();

			String caminho = "/".concat("anexos/").concat(
							this.getOrgao(request).getConfiguracoes()
									.getNomeDiretorioOrgao()).concat("/");

			// seta o nome dos anexos no request
			request.setAttribute("nomeAnexo", nomeAnexo);
			request.setAttribute("nomeMsgDigitalizada", nomeMsgDigitalizada);
			request.setAttribute("diretorioAnexo", caminho);

			request.setAttribute("asessionid", Utilitario.encrypt(
					Constants.DES_KEY, acionamento.getId().toString()));

			// Se o acionamento foi redirecionado, recupera o último histórico
				String remetente = "";
				Long idRemetente = null;
				HistoricoCtrl histCtrl = new HistoricoCtrl(getDaoFactory());
				List lstHist = histCtrl.consultaHistAcionamento(acionamento);
					
				if (lstHist!=null && !lstHist.isEmpty()) {
					Historico histRedirec = (Historico) lstHist.get(0);
					remetente = histRedirec.getFuncionario().getNome();
					idRemetente = histRedirec.getFuncionario().getId();
				
					request.setAttribute("remetenteRedirec", remetente);
					request.setAttribute("idRemetenteRedirec", idRemetente);
				}
			
			if( acionamento.getFuncionario().getConsultor()!= null &&
				acionamento.getFuncionario().getConsultor().equals("on")){
				request.setAttribute("consultor", acionamento.getFuncionario().getConsultor());
			}
		} catch (DaoException e) {
			errorMsgs.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
					"error.mensagem.excecao"));
			saveMessages(request, errorMsgs);
		}

		if (errorMsgs.isEmpty()) {
			return (mapping.findForward("success"));
		}
		return (mapping.findForward("failure"));
	}

}