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

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.ActionMessages;
import org.apache.struts.action.DynaActionForm;

import br.gov.serpro.ouvidoria.controller.andamento.ConsultarBancoScriptsCtrl;
import br.gov.serpro.ouvidoria.controller.gerencial.administracao.FuncionarioCtrl;
import br.gov.serpro.ouvidoria.dao.DaoException;
import br.gov.serpro.ouvidoria.model.Funcionario;
import br.gov.serpro.ouvidoria.struts.ActionSupport;
import br.gov.serpro.ouvidoria.util.Constants;
import br.gov.serpro.ouvidoria.util.Utilitario;

/**
 * Objetivo: listar os scripts que atendem a string de busca e ao assunto
 * informados.
 * 
 * @author SERPRO
 * @version $Revision: 1.1.2.3 $, $Date: 2011/10/18 17:57:04 $
 * @version 0.1, 2004/12/17
 */
public class ListarBancoScriptsAction extends ActionSupport {

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

        List scripts = null;
        ActionErrors errors = new ActionErrors();

        try {
            ConsultarBancoScriptsCtrl consultarBancoScriptsCtrl = new ConsultarBancoScriptsCtrl(
                    getDaoFactory());

            DynaActionForm _form = (DynaActionForm) form;

            String lsTexto = Utilitario.trataPlic(_form.getString("txtBusca"));
            String lsAssunto = _form.getString("txtAssunto");
            String lsAtivo = _form.getString("chkAtivoBanco");
            String lsInAtivo = _form.getString("chkInativoBanco");
            String situacao = "";

            // Trata checkboxes selecionados
            if (((lsAtivo == null) && (lsInAtivo == null))
                    || ((lsAtivo.equalsIgnoreCase("S")) && (lsInAtivo
                            .equalsIgnoreCase("S")))) {
                situacao = "Ambos";
            } else if ((lsAtivo != null) && (lsAtivo.equalsIgnoreCase("S"))) {
                situacao = "Ativo";
            } else if ((lsInAtivo != null) && (lsInAtivo.equalsIgnoreCase("S"))) {
                situacao = "Inativo";
            }

            // Recupera o Funcionário logado
            Long funcionarioId = (Long) request.getSession().getAttribute(Constants.PA_FUNCIONARIO);
            
        	FuncionarioCtrl funcionarioCtrl = new FuncionarioCtrl(getDaoFactory());
        	
        	Funcionario func = (Funcionario) funcionarioCtrl.get(funcionarioId);  

            // recupera os scripts
            scripts = consultarBancoScriptsCtrl.ListarScript(lsTexto,
                    lsAssunto, func, situacao);

            if (scripts == null) {
                errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
                        "error.script.notFound"));
            }

            request.setAttribute("listarScripts", scripts);

        } catch (DaoException e) {
            errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
                    "error.script.excecao"));
        }

        if (!errors.isEmpty()) {
            saveMessages(request, errors);
            return (mapping.findForward("failure"));
        }

        return (mapping.findForward("success"));

    }
}