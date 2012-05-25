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

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.ActionMessages;
import org.apache.struts.action.DynaActionForm;

import br.gov.serpro.ouvidoria.controller.AcionamentoCtrl;
import br.gov.serpro.ouvidoria.dao.DaoException;
import br.gov.serpro.ouvidoria.model.Acionamento;
import br.gov.serpro.ouvidoria.model.EstadoAcionamento;
import br.gov.serpro.ouvidoria.struts.ActionSupport;

/**
 * Objetivo: Salvar o rascunho da resposta ao acionamento
 * 
 * @author SERPRO
 * @version $Revision: 1.1.2.3 $, $Date: 2011/10/18 17:57:04 $
 */
public class SalvarRascunhoRespAction extends ActionSupport {

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

        DynaActionForm _form = (DynaActionForm) form;
        ActionMessages errorMsgs = new ActionMessages();

        // Recupera parâmetros da requisição
        String lsTitulo = _form.getString("txtTitulo");
        String lsResp = _form.getString("txtResposta");
        String lidAcion = _form.getString("idAcionamento");
        String lsAcao = _form.getString("txtAcao");
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
            } else {
                Timestamp hoje = new Timestamp(System.currentTimeMillis());

                // Salva rascunho da resposta
                acionamento.salvarRascunhoRespostaAcionamento(lsTitulo, lsResp,
                        hoje,idSolucao);

                /*
                 * if (acionamento.getRespostaAcionamento() == null) {
                 * acionamento.setRespostaAcionamento(new
                 * RespostaAcionamento());
                 * acionamento.getRespostaAcionamento().setTitulo(lsTitulo);
                 * acionamento.getRespostaAcionamento().setTexto(lsResp);
                 * acionamento.getRespostaAcionamento().setData(hoje);
                 * acionamento.setEstadoAcionamento(EstadoAcionamento.RESPONDIDO); }
                 */

                //acionamento.setEstadoAcionamento(EstadoAcionamento.RESPONDIDO);
                acionamento.setEstadoAcionamento(EstadoAcionamento.EM_ANDAMENTO);
                
                ctrlAcion.save(acionamento);
            }

            // Repassa os parâmetros para a tela de mensagem de sucesso
            request.setAttribute("idAcionamento", lidAcion);
            request.setAttribute("txtAcao", lsAcao);

        } catch (DaoException e) {
            errorMsgs.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
                    "error.respondermsg.salvar"));
            saveMessages(request, errorMsgs);
        }

        if (errorMsgs.isEmpty()) {
            return (mapping.findForward("success"));
        }
        return (mapping.findForward("failure"));

    }

}