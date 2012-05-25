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

import java.util.Collection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.ActionMessages;

import br.gov.serpro.ouvidoria.controller.MenuCtrl;
import br.gov.serpro.ouvidoria.model.ConfiguracoesOrgao;
import br.gov.serpro.ouvidoria.model.Funcionario;
import br.gov.serpro.ouvidoria.model.Orgao;
import br.gov.serpro.ouvidoria.struts.ActionSupport;

/**
 * Objetivo: Montar o Menu da Aplicação
 * 
 * @author SERPRO
 * @version $Revision: 1.1.2.4 $, $Date: 2011/10/20 15:30:36 $
 * @version 0.1, 2005/01/11
 */
public class MenuJsAction extends ActionSupport {


    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        Funcionario funcionario = (Funcionario) this.getFuncionario(request);

        if (funcionario == null) {
            Orgao orgao = (Orgao) this.getOrgao(request);

            // path para login sem certificado digital
            String pathLogin = "/../Login.do?action=exibir";

            ConfiguracoesOrgao config = orgao.getConfiguracoes();
            if (config != null
                    && config.getExigeCertificadoDigitalOrgao() != null
                    && config.getExigeCertificadoDigitalOrgao().booleanValue()) {
                // path para login com certificado digital
                pathLogin = "../../../login";
            }

            request.setAttribute("path", pathLogin);

            return mapping.findForward("not_logged");
        }

        // montar o menu para o funcionário
        MenuCtrl ctrlMenu = new MenuCtrl(getDaoFactory());
        Collection menu = ctrlMenu.getMenu(funcionario);
        if (menu == null) {
            ActionMessages errors = new ActionMessages();
            errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
                    "login.error"));
            saveErrors(request, errors);

            return mapping.findForward("error");
        }

        request.setAttribute("menu", menu);

        return mapping.findForward("logged");
    }
}
