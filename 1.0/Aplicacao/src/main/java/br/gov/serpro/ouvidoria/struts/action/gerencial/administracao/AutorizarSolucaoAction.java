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
package br.gov.serpro.ouvidoria.struts.action.gerencial.administracao;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.ActionMessages;
import org.apache.struts.action.DynaActionForm;

import br.gov.serpro.ouvidoria.controller.andamento.SolucaoCtrl;
import br.gov.serpro.ouvidoria.dao.DaoException;
import br.gov.serpro.ouvidoria.model.EstadoSolucao;
import br.gov.serpro.ouvidoria.model.Solucao;
import br.gov.serpro.ouvidoria.struts.DispatchActionSupport;

/**
 * Objetivo: Aprovar ou Reprovar uma solução
 * 
 * @author SERPRO
 * @version $Revision: 1.1.2.3 $, $Date: 2011/10/18 17:57:41 $
 * @version 0.1, Date: 2005/01/06
 */
public class AutorizarSolucaoAction extends DispatchActionSupport {

    /**
     * Aprova o Script. Realiza dois forwards: um em caso de sucesso e outro em
     * caso de falha
     * 
     * @param mapping
     * @param form
     *            ActionForm, caso necessário
     * @param request
     * @param response
     *  
     */
    public ActionForward AprovarSolucao(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        ActionMessages errorMsgs = new ActionMessages();

        DynaActionForm _form = (DynaActionForm) form;

        String id = _form.getString("idSolucao");

        try {
            SolucaoCtrl ctrlSolucao = new SolucaoCtrl(getDaoFactory());

            // Verifica se foi passado o id do script
            if (id != null) {
                Solucao solucao = ctrlSolucao.get(new Long(id));

                // Se não encontrou o script, reporta o erro
                if (solucao == null) {
                    errorMsgs.add(ActionMessages.GLOBAL_MESSAGE,
                            new ActionMessage("error.script.notFound"));
                    saveMessages(request, errorMsgs);
                } else {
                    // Aprova o script
                	solucao.setEstado(EstadoSolucao.APROVADO);

                    // Salva o script
                    ctrlSolucao.save(solucao);
                }
            }

        } catch (DaoException e) {
            errorMsgs.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
                    "error.script.excecao"));
            saveMessages(request, errorMsgs);
        }

        if (errorMsgs.isEmpty()) {
            return (mapping.findForward("success"));
        }
        return (mapping.findForward("failure"));
    }

    /**
     * Reprova o Script. Realiza dois forwards: um em caso de sucesso e outro em
     * caso de falha
     * 
     * @param mapping
     * @param form
     *            ActionForm, caso necessário
     * @param request
     * @param response
     *  
     */
    public ActionForward ReprovarSolucao(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        ActionMessages errorMsgs = new ActionMessages();

        DynaActionForm _form = (DynaActionForm) form;

        String id = _form.getString("idSolucao");
        String obs = _form.getString("txtObs");

        try {
            SolucaoCtrl ctrlSolucao = new SolucaoCtrl(getDaoFactory());

            // Verifica se foi passado o id do Solucao
            if (id != null) {
                Solucao solucao = ctrlSolucao.get(new Long(id));

                // Se não encontrou o Solucao, reporta o erro
                if (solucao == null) {
                    errorMsgs.add(ActionMessages.GLOBAL_MESSAGE,
                            new ActionMessage("error.solucao.notFound"));
                    saveMessages(request, errorMsgs);
                } else {
                    // Reprova o solucao
                    solucao.setEstado(EstadoSolucao.REPROVADO);
                    solucao.setObservacao(obs);

                    // Salva o solucao
                    ctrlSolucao.save(solucao);
                }
            }

        } catch (DaoException e) {
            errorMsgs.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
                    "error.solucao.excecao"));
            saveMessages(request, errorMsgs);
        }

        if (errorMsgs.isEmpty()) {
            return (mapping.findForward("success"));
        }
        return (mapping.findForward("failure"));
    }

}