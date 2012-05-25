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

import java.util.Collection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessages;
import org.apache.struts.action.DynaActionForm;

import br.gov.serpro.ouvidoria.controller.PerfilCtrl;
import br.gov.serpro.ouvidoria.controller.gerencial.administracao.FuncionarioCtrl;
import br.gov.serpro.ouvidoria.model.Funcionario;
import br.gov.serpro.ouvidoria.model.Perfil;
import br.gov.serpro.ouvidoria.struts.ActionSupport;


/**
 * Objetivo: Listar os usuários por perfil
 * 
 * @author SERPRO
 * @version $Revision: 1.1.2.5 $, $Date: 2011/10/21 12:51:36 $
 * @version 0.1, 2004/12/27
 */
public class ListarUsuarioPerfilAction extends ActionSupport {

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

        ActionMessages errorMsgs = new ActionMessages();

        // Recupera os parâmetros informados
        DynaActionForm _form = (DynaActionForm) form;

        String lPerfil = _form.getString("txtPerfil");

        FuncionarioCtrl funcCtrl = new FuncionarioCtrl(getDaoFactory());
        Funcionario func = (Funcionario) this.getFuncionario(request);
        
        
        // Recupera o órgão do funcionário
        //Orgao org = getOrgao(request);

        // Recupera lista de funcionários por perfil
        // que estejam no mesmo sub-órgão do gestor        
        Collection lstFunc = funcCtrl.listaFuncionarioPorPerfil(getOrgao(request), func, lPerfil);

        // Passa a lista de funcionários consultados
        request.setAttribute("lstFuncionarios", lstFunc);
        request.setAttribute("totalFunc", String.valueOf(lstFunc.size()));

        // Se foi escolhido um perfil, recupera-se
        // suas informações
        if (!lPerfil.equals("0")) {
            // Recupera Perfil selecionado
            PerfilCtrl perfilCtrl = new PerfilCtrl(getDaoFactory());
            Perfil perfil = perfilCtrl.get(new Long(lPerfil));

            request.setAttribute("perfil", perfil);
        }

        if (errorMsgs.isEmpty()) {
            return (mapping.findForward("success"));
        }
        return (mapping.findForward("failure"));
    }

}