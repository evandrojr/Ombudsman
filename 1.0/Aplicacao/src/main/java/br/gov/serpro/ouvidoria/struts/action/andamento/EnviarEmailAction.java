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

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.ActionMessages;
import org.apache.struts.action.DynaActionForm;

import br.gov.serpro.ouvidoria.controller.andamento.EnviarEmailCtrl;
import br.gov.serpro.ouvidoria.dao.DaoException;
import br.gov.serpro.ouvidoria.model.Acionamento;
import br.gov.serpro.ouvidoria.struts.ActionSupport;
import br.gov.serpro.ouvidoria.util.Utilitario;

/**
 * Objetivo: Enviar o email para o acionador do acionamento selecionado.
 * 
 * @author SERPRO
 * @version $Revision: 1.1.2.3 $, $Date: 2011/10/18 17:57:04 $
 * @version 0.1, 2004/12/21
 */
public class EnviarEmailAction extends ActionSupport {
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

        ActionErrors errors = new ActionErrors();
        try {

            EnviarEmailCtrl enviarEmailCtrl = new EnviarEmailCtrl(
                    getDaoFactory());

            DynaActionForm _form = (DynaActionForm) form;
            Long idAcionamento = new Long(_form.get("idAcionamento").toString());
            String lsEmail = _form.get("email").toString();

            /* Valida formato do email */
            if (lsEmail.compareTo("") != 0) {
                if (!Utilitario.validaEmail(lsEmail)) {
                    errors
                            .add(ActionMessages.GLOBAL_MESSAGE,
                                    new ActionMessage(
                                            "error.acionamento.emailInvalido"));
                }
            }

            Acionamento acionamento = enviarEmailCtrl.get(idAcionamento);

            if (acionamento == null) {
                errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
                        "error.acionamento.notFound"));
            } else {
                //salvar email informado na tela
                acionamento.getAcionador().setEmail(lsEmail);
                enviarEmailCtrl.salvarAcionamento(acionamento);

                //enviar email
				String enderecoUrl = (String) request.getSession().getAttribute("enderecoUrl");

                if (!enviarEmailCtrl.enviarEmail(acionamento, this
                        .getOrgao(request),enderecoUrl))
                    errors.add(ActionMessages.GLOBAL_MESSAGE,
                            new ActionMessage("error.envioEmail"));

                //Gerar histórico
                this.geraHistorico(request, acionamento);
            }

        } catch (DaoException e) {
            errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
                    "error.envioEmail.excecao"));
        }

        if (!errors.isEmpty()) {
            saveMessages(request, errors);
            return (mapping.findForward("failure"));
        }

        return (mapping.findForward("success"));

    }
}