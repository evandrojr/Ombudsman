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

import java.sql.Timestamp;
import java.util.Collection;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.ActionMessages;
import org.apache.struts.action.DynaActionForm;

import br.gov.serpro.ouvidoria.controller.acionamento.AtendimentoCtrl;
import br.gov.serpro.ouvidoria.controller.andamento.AssuntoCtrl;
import br.gov.serpro.ouvidoria.controller.gerencial.administracao.ScriptCtrl;
import br.gov.serpro.ouvidoria.dao.DaoException;
import br.gov.serpro.ouvidoria.model.Assunto;
import br.gov.serpro.ouvidoria.model.EstadoScript;
import br.gov.serpro.ouvidoria.model.Orgao;
import br.gov.serpro.ouvidoria.model.Script;
import br.gov.serpro.ouvidoria.struts.DispatchActionSupport;
import br.gov.serpro.ouvidoria.util.Constants;

/**
 * Objetivo: Disparar as ações cadastrais do banco de Scripts.
 * 
 * @author SERPRO
 * @version $Revision: 1.1.2.6 $, $Date: 2011/10/21 12:51:36 $
 * @version 0.1, 2004/12/27
 */
public class AtualizarScriptsAction extends DispatchActionSupport {

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
    public ActionForward ListarBcoScripts(ActionMapping mapping,
            ActionForm form, HttpServletRequest request,
            HttpServletResponse response) throws Exception {
    	    	
        ActionMessages errorMsgs = new ActionMessages();

        try {        	
        	
            ScriptCtrl ctrlScript = new ScriptCtrl(getDaoFactory());

            DynaActionForm _form = (DynaActionForm) form;

            String lAssunto = _form.getString("txtAssunto");            
            String lChave = _form.getString("txtChave");
            String lEstado = _form.getString("txtEstado");
                       
            // Informa se usuario pode atualizar Scripts
            String lsEditar = request.getParameter("txtEditar");
            request.setAttribute("txtEditar", lsEditar);
                       
            // Recupera órgão do funcionário
            Orgao org = getOrgao(request);
           

            // Recupera lista de scripts de acordo com os parâmetros informados
            Collection lstScript = ctrlScript.listaScripts(lAssunto, lChave, lEstado,
                    org);
            

            // Passa a lista de scripts através da requisição
            request.setAttribute("lstScripts", lstScript);            
            request.setAttribute("totalScripts", String.valueOf(lstScript
                    .size()));

        } catch (DaoException e) {
            errorMsgs.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
                    "error.script.excecao"));

            saveMessages(request, errorMsgs);
            if (Constants.DEBUG) {
                System.out.println(e.getMessage());
                e.printStackTrace();
            }
        }

        if (errorMsgs.isEmpty()) {
            return (mapping.findForward("success"));
        }

        return (mapping.findForward("failure"));
    }

    /**
     * Altera o Script. Realiza dois forwards: um em caso de sucesso e outro em
     * caso de falha
     * 
     * @param mapping
     * @param form
     *            ActionForm, caso necessário
     * @param request
     * @param response
     *  
     */
    public ActionForward AlterarScript(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        ActionMessages errorMsgs = new ActionMessages();
        ActionMessages Msgs = new ActionMessages();

        DynaActionForm _form = (DynaActionForm) form;

        String lAssunto = _form.getString("txtAssunto");
        String lTexto = _form.getString("txtTexto");
        String lTitulo = _form.getString("txtTitulo");
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
                    // Altera os dados

                    script.setDescricao(lTexto);
                    script.setTitulo(lTitulo);

                    // Recupera Assunto
                    AssuntoCtrl ctrlAssnt = new AssuntoCtrl(getDaoFactory());
                    Assunto assunto = ctrlAssnt.get(new Long(lAssunto));

                    script.setAssunto(assunto);
                    script.setEstado(EstadoScript.PENDENTE);

                    // Salva o script
                    ctrlScript.save(script);

                    // Mensagem de alteração OK
                    Msgs.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
                            "alterar.script.sucesso"));
                    saveMessages(request, Msgs);
                }

                // Passa através da requisição a solução escolhida
                // e a ação chamadora, caso exista
                request.setAttribute("Script", script);
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
     * Excluir o Script. Realiza dois forwards: um em caso de sucesso e outro em
     * caso de falha
     * 
     * @param mapping
     * @param form
     *            ActionForm, caso necessário
     * @param request
     * @param response
     *  
     */
    public ActionForward ExcluirScript(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        ActionMessages errorMsgs = new ActionMessages();
        ActionMessages Msgs = new ActionMessages();

        DynaActionForm _form = (DynaActionForm) form;

        String id = _form.getString("idScript");

        try {
            ScriptCtrl ctrlScript = new ScriptCtrl(getDaoFactory());

            // Verifica se o script já foi utilizado em atendimento
            AtendimentoCtrl ctrlAtd = new AtendimentoCtrl(getDaoFactory());
            Script script = ctrlScript.get(new Long(id));
            List lstAtd = ctrlAtd.listaAtendimentosScript(script);

            // Se há atendimentos associados ao script em questão,
            // faz-se a exclusão lógica
            if (!lstAtd.isEmpty()) {
                script.setEstado(EstadoScript.INATIVO);

                // Salva o script
                ctrlScript.save(script);
            } else {
                // Se não há atendimentos associados ao script em questão,
                // faz-se a exclusão física
                ctrlScript.delete(new Long(id));
            }

            // Mensagem de exclusão OK
            Msgs.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
                    "exlcuir.script.sucesso"));
            saveMessages(request, Msgs);

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
     * Incluir o Script. Realiza dois forwards: um em caso de sucesso e outro em
     * caso de falha
     * 
     * @param mapping
     * @param form
     *            ActionForm, caso necessário
     * @param request
     * @param response
     *  
     */
    public ActionForward IncluirScript(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        ActionMessages errorMsgs = new ActionMessages();
        ActionMessages Msgs = new ActionMessages();

        DynaActionForm _form = (DynaActionForm) form;

        String lAssunto = _form.getString("txtAssunto");
        String lTexto = _form.getString("txtTexto");
        String lTitulo = _form.getString("txtTitulo");
        try {
            ScriptCtrl ctrlScript = new ScriptCtrl(getDaoFactory());

            Script script = new Script();

            // Inclui o script
            script.setDescricao(lTexto);
            script.setTitulo(lTitulo);
            script.setEstado(EstadoScript.PENDENTE);
            script.setDataCadastramento(new Timestamp(System
                    .currentTimeMillis()));

            // Recupera Assunto
            AssuntoCtrl ctrlAssnt = new AssuntoCtrl(getDaoFactory());
            Assunto assunto = ctrlAssnt.get(new Long(lAssunto));

            script.setAssunto(assunto);

            // Salva o script
            ctrlScript.save(script);

            // Mensagem de inclusão OK
            Msgs.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
                    "incluir.script.sucesso"));
            saveMessages(request, Msgs);

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