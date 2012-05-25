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

import br.gov.serpro.ouvidoria.controller.gerencial.administracao.ScriptCtrl;
import br.gov.serpro.ouvidoria.dao.DaoException;
import br.gov.serpro.ouvidoria.model.EstadoScript;
import br.gov.serpro.ouvidoria.model.Script;
import br.gov.serpro.ouvidoria.struts.DispatchActionSupport;

/**
 * Objetivo: Aprovar ou Reprovar um script
 * 
 * @author SERPRO
 * @version $Revision: 1.1.2.5 $, $Date: 2011/10/21 12:51:36 $
 * @version 0.1, 2004/12/27
 */
public class AutorizarScriptAction extends DispatchActionSupport {

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
    public ActionForward AprovarScript(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        ActionMessages errorMsgs = new ActionMessages();

        DynaActionForm _form = (DynaActionForm) form;

        String id = _form.getString("idScript");

        try {
            ScriptCtrl ctrlScript = new ScriptCtrl(getDaoFactory());

            // Verifica se foi passado o id do script
            if (id != null) {
                Script script = ctrlScript.get(new Long(id));

                // Se não encontrou o script, reporta o erro
                if (script == null) {
                    errorMsgs.add(ActionMessages.GLOBAL_MESSAGE,
                            new ActionMessage("error.script.notFound"));
                    saveMessages(request, errorMsgs);
                } else {
                    // Aprova o script
                    script.setEstado(EstadoScript.APROVADO);

                    // Salva o script
                    ctrlScript.save(script);
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
    public ActionForward ReprovarScript(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        ActionMessages errorMsgs = new ActionMessages();

        DynaActionForm _form = (DynaActionForm) form;

        String id = _form.getString("idScript");
        String obs = _form.getString("txtObs");

        try {
            ScriptCtrl ctrlScript = new ScriptCtrl(getDaoFactory());

            // Verifica se foi passado o id do script
            if (id != null) {
                Script script = ctrlScript.get(new Long(id));

                // Se não encontrou o script, reporta o erro
                if (script == null) {
                    errorMsgs.add(ActionMessages.GLOBAL_MESSAGE,
                            new ActionMessage("error.script.notFound"));
                    saveMessages(request, errorMsgs);
                } else {
                    // Reprova o script
                    script.setEstado(EstadoScript.REPROVADO);
                    script.setObservacao(obs);

                    // Salva o script
                    ctrlScript.save(script);
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

}