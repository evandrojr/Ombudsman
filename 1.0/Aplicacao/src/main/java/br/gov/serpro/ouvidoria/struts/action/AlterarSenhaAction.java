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
package br.gov.serpro.ouvidoria.struts.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.ActionMessages;
import org.apache.struts.validator.DynaValidatorForm;

import br.gov.serpro.ouvidoria.controller.LoginCtrl;
import br.gov.serpro.ouvidoria.model.Funcionario;
import br.gov.serpro.ouvidoria.struts.ActionSupport;
import br.gov.serpro.ouvidoria.util.Constants;

/**
 * Objetivo: Funcionalidade de Alteração de senha
 * 
 * @author SERPRO
 * @version $Revision: 1.1.2.4 $, $Date: 2011/10/20 15:30:36 $
 * @version 0.1, 2005/04/01
 */
public class AlterarSenhaAction extends ActionSupport {


    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        DynaValidatorForm dynaForm = (DynaValidatorForm) form;

        String login = dynaForm.getString("login");
        String senhaAntiga = dynaForm.getString("senhaAntiga");
        String senhaNova = dynaForm.getString("senhaNova");
        String senhaNovaConfirmacao = dynaForm
                .getString("senhaNovaConfirmacao");

        ActionMessages errors = new ActionMessages();

        if (senhaNova == null || senhaNova.trim().length() < 6) {
            errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
                    "alterarSenha.senhaNova.error"));
        } else if (!senhaNova.equals(senhaNovaConfirmacao)) {
            errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
                    "alterarSenha.senhaConfirmacao.error"));
        }

        if (!errors.isEmpty()) {
            saveErrors(request, errors);
            return mapping.findForward("error");
        }

        LoginCtrl ctrlLogin = new LoginCtrl(getDaoFactory());

        Funcionario funcionario = ctrlLogin.alteraSenha(getOrgao(request),
                login, senhaAntiga, senhaNova);

        if (funcionario == null) {

            errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
                    "login.error"));

            saveErrors(request, errors);

            return mapping.findForward("error");
        }

        request.getSession(true).setAttribute(Constants.PA_FUNCIONARIO,
                funcionario.getId());

        return mapping.findForward("success");
    }
}