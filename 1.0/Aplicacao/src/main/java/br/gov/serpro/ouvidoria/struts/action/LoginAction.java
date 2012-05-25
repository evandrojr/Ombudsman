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
import br.gov.serpro.ouvidoria.controller.gerencial.administracao.FuncionarioCtrl;
import br.gov.serpro.ouvidoria.model.Funcionario;
import br.gov.serpro.ouvidoria.struts.DispatchActionSupport;
import br.gov.serpro.ouvidoria.util.Constants;

/**
 * Objetivo: Efeturar o Login do Funcionario no Site
 * 
 * @author SERPRO
 * @version $Revision: 1.1.2.4 $, $Date: 2011/10/20 15:30:36 $
 * @version 0.1, 2004/11/11
 */
public class LoginAction extends DispatchActionSupport {

    public ActionForward sessaoExpirada(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        request.setAttribute("sessaoExpirada", Boolean.TRUE);
        
        return mapping.findForward("exibir");

    }

    public ActionForward exibir(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        request.setAttribute("textoOuvidoria", this.getOrgao(request)
                .getConfiguracoes().getTextoApresentacaoOuvidoria());

        request.setAttribute("suporteUsuario", this.getOrgao(request)
                .getConfiguracoes().getUrlSuporteUsuario());

        return mapping.findForward("exibir");
    }

    public ActionForward submit(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        ActionMessages errors = new ActionMessages();

        DynaValidatorForm dynaForm = (DynaValidatorForm) form;


        Long funcionarioId = (Long) request.getSession().getAttribute(Constants.PA_FUNCIONARIO);
        
    	FuncionarioCtrl funcionarioCtrl = new FuncionarioCtrl(getDaoFactory());
    	
    	Funcionario funcionario = (Funcionario) funcionarioCtrl.get(funcionarioId);  	
    	

        if (funcionario != null) {
            return mapping.findForward("success");
        }

        String login = dynaForm.getString("login");
        String senha = dynaForm.getString("senha");

        if ((login == null) || (login.trim().length() <= 0)) {
            errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
                    "login.error"));
            saveErrors(request, errors);
            return mapping.findForward("error");
        }

        if ((senha == null) || (senha.trim().length() <= 0)) {
            errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
                    "login.error"));
            saveErrors(request, errors);
            return mapping.findForward("error");
        }

        LoginCtrl ctrlLogin = new LoginCtrl(getDaoFactory());

        funcionario = ctrlLogin.validaFuncionario(getOrgao(request), login,
                senha);

        final int tentativaSenha = ctrlLogin.getValidaSenha();

        if (tentativaSenha == 1) {

            errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
                    "senha.bloqueada"));
            saveErrors(request, errors);
            return mapping.findForward("error");

        } else if (tentativaSenha == 2) {

            errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
                    "senha.alerta.bloqueio"));
            saveErrors(request, errors);
            return mapping.findForward("error");

        } else if (tentativaSenha == 3) {

            errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
                    "senha.error"));
            saveErrors(request, errors);
            return mapping.findForward("error");

        } else if (funcionario == null) {

            errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
                    "login.error"));
            saveErrors(request, errors);
            return mapping.findForward("error");
        }

        request.getSession(true).setAttribute(Constants.PA_FUNCIONARIO,
                funcionario.getId());

        geraHistorico(request);

        return mapping.findForward("success");
    }
}