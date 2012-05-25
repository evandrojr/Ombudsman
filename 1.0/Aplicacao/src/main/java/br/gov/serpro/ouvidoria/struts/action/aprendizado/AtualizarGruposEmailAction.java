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

import java.sql.Timestamp;
import java.util.Collection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.ActionMessages;
import org.apache.struts.action.DynaActionForm;

import br.gov.serpro.ouvidoria.controller.aprendizado.GruposEmailCtrl;
import br.gov.serpro.ouvidoria.dao.DaoException;
import br.gov.serpro.ouvidoria.model.GruposEmail;
import br.gov.serpro.ouvidoria.model.Orgao;
import br.gov.serpro.ouvidoria.struts.DispatchActionSupport;
import br.gov.serpro.ouvidoria.util.Constants;

/**
 * Objetivo: Disparar as ações cadastrais dos Grupos de Email
 * 
 * @author SERPRO
 * @version $Revision: 1.1.2.4 $, $Date: 2011/10/20 15:30:36 $
 * @version 0.1, 2005/02/02
 */
public class AtualizarGruposEmailAction extends DispatchActionSupport {

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
    public ActionForward Listar(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        ActionMessages msgs = new ActionMessages();

        DynaActionForm _form = (DynaActionForm) form;

        String lDatIni = _form.getString("txtDatIni");
        String lDatFim = _form.getString("txtDatFim");
        String lChave = _form.getString("txtChave");

        try {
            GruposEmailCtrl grupoCtrl = new GruposEmailCtrl(getDaoFactory());

            // Recupera órgão do funcionário
            Orgao org = getOrgao(request);

            // Recupera lista de scripts de acordo com os parâmetros informados
            Collection lstGruposEmail = grupoCtrl.list(org, lDatIni, lDatFim,
                    lChave);

            // Passa a lista de scripts através da requisição
            request.setAttribute("lstGruposEmail", lstGruposEmail);

        } catch (DaoException e) {
            msgs.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
                    "error.gruposemail.excecao"));
            saveMessages(request, msgs);
        }

        if (msgs.isEmpty()) {
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
    public ActionForward AlterarGrupo(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        ActionMessages msgs = new ActionMessages();
        ActionMessages errors = new ActionMessages();

        DynaActionForm _form = (DynaActionForm) form;

        String id = _form.getString("idGrupoEmail");
        String lListaEmail = _form.getString("txtDscListaEmail");
        String lDscGrupo = _form.getString("txtDscGrupo");

        try {
            GruposEmailCtrl ctrlGrupo = new GruposEmailCtrl(getDaoFactory());

            // Verifica se foi passado o id do grupo
            if (id != null) {
                GruposEmail grupoEmail = ctrlGrupo.get(new Long(id));

                // Se não encontrou o grupo, reporta o erro
                if (grupoEmail == null) {
                    errors.add(ActionMessages.GLOBAL_MESSAGE,
                            new ActionMessage("error.gruposemail.notFound"));
                    saveMessages(request, errors);
                } else {
                    // Altera os dados
                    Timestamp hoje = new Timestamp(System.currentTimeMillis());

                    grupoEmail.setDescricao(lDscGrupo);
                    grupoEmail.setListaEmail(lListaEmail);
                    grupoEmail.setdataUltimaAlteracao(hoje);

                    // Salva o grupo
                    ctrlGrupo.save(grupoEmail);

                    // Mensagem de alteração OK
                    msgs.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
                            "alterar.gruposemail.sucesso"));
                    saveMessages(request, msgs);
                }
            }

        } catch (DaoException e) {
            errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
                    "error.gruposemail.excecao"));
            saveMessages(request, errors);
            if (Constants.DEBUG) {
                System.out.println(e.getMessage());
                e.printStackTrace();
            }
        }

        if (errors.isEmpty()) {
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
    public ActionForward ExcluirGrupo(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        ActionMessages msgs = new ActionMessages();
        ActionMessages errors = new ActionMessages();

        DynaActionForm _form = (DynaActionForm) form;

        String id = _form.getString("idGrupoEmail");

        try {
            GruposEmailCtrl ctrlGrupo = new GruposEmailCtrl(getDaoFactory());

            ctrlGrupo.delete(new Long(id));

            // Mensagem de exclusão OK
            msgs.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
                    "excluir.gruposemail.sucesso"));
            saveMessages(request, msgs);

        } catch (DaoException e) {
            errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
                    "error.gruposemail.excecao"));
            saveMessages(request, errors);
        }

        if (errors.isEmpty()) {
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
    public ActionForward IncluirGrupo(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        ActionMessages msgs = new ActionMessages();
        ActionMessages errors = new ActionMessages();

        DynaActionForm _form = (DynaActionForm) form;

        //String id = _form.getString("idGrupoEmail");
        String lListaEmail = _form.getString("txtDscListaEmail");
        String lDscGrupo = _form.getString("txtDscGrupo");

        try {
            Timestamp hoje = new Timestamp(System.currentTimeMillis());

            GruposEmailCtrl ctrlGrupo = new GruposEmailCtrl(getDaoFactory());

            GruposEmail grupoEmail = new GruposEmail();

            // Inclui o grupo de email
            grupoEmail.setDescricao(lDscGrupo);
            grupoEmail.setListaEmail(lListaEmail);
            grupoEmail.setDataCriacao(hoje);
            grupoEmail.setdataUltimaAlteracao(hoje);
            grupoEmail.setOrgao(getOrgao(request));

            // Salva o script
            ctrlGrupo.save(grupoEmail);

            // Mensagem de inclusão OK
            msgs.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
                    "incluir.gruposemail.sucesso"));
            saveMessages(request, msgs);

        } catch (DaoException e) {
            errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
                    "error.gruposemail.excecao"));
            saveMessages(request, errors);
        }

        if (errors.isEmpty()) {
            return (mapping.findForward("success"));
        }
        return (mapping.findForward("failure"));
    }

}