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
package br.gov.serpro.ouvidoria.struts.action.acionamento;

import java.util.ArrayList;
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

import br.gov.serpro.ouvidoria.controller.acionamento.ConsultarScriptCtrl;
import br.gov.serpro.ouvidoria.controller.gerencial.administracao.FuncionarioCtrl;
import br.gov.serpro.ouvidoria.dao.DaoException;
import br.gov.serpro.ouvidoria.model.Funcionario;
import br.gov.serpro.ouvidoria.struts.ActionSupport;
import br.gov.serpro.ouvidoria.util.Constants;

/**
 * Objetivo: listar os scripts que atendem a string de busca e ao assunto
 * informados.
 * 
 * @author SERPRO
 * @version $Revision: 1.1.2.4 $, $Date: 2011/10/18 17:57:04 $
 * @version 0.1, Date: 2004/12/08
 */
public class ListarScriptAction extends ActionSupport {

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

        List historicoTextos;
        List scripts = null;
        ActionErrors errors = new ActionErrors();

        try {
            ConsultarScriptCtrl consultarScriptCtrl = new ConsultarScriptCtrl(
                    getDaoFactory());

            DynaActionForm _form = (DynaActionForm) form;

            String lsTexto = _form.getString("txtBusca");
            String lsAssunto = _form.getString("txtAssunto");
            String lsBuscarNovamente = _form.getString("chkBuscarNovamente");

            // recuperar historico dos textos de busca usados pelo usuario
            // logado
            historicoTextos = (List) request.getSession().getAttribute(
                    "historicoTextos");

            if (historicoTextos == null)
                historicoTextos = new ArrayList();

            // se não é busca nos resultados, limpar histórico
            if ((lsBuscarNovamente != null)
                    && (!lsBuscarNovamente.equalsIgnoreCase("S"))) {
                historicoTextos.clear();
            }

            // Recupera o Funcionário logado
            Long funcionarioId = (Long) request.getSession().getAttribute(Constants.PA_FUNCIONARIO);
            
        	FuncionarioCtrl funcionarioCtrl = new FuncionarioCtrl(getDaoFactory());
        	
        	Funcionario func = (Funcionario) funcionarioCtrl.get(funcionarioId);  

            // recupera os scripts
            scripts = consultarScriptCtrl.ListarScript(lsTexto, lsAssunto,
                    func, lsBuscarNovamente, historicoTextos);

            if (scripts == null) {
                errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
                        "error.script.notFound"));
            }

            request.setAttribute("listarScripts", scripts);

            // se foi usado texto na consulta, guarda o histórico na sessão do
            // usuário logado
            if ((lsTexto != null) && (!lsTexto.equals("")))
                historicoTextos.add(lsTexto);

            // atualiza variável com o histórico
            request.getSession().setAttribute("historicoTextos",
                    historicoTextos);

        } catch (DaoException e) {
            errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
                    "error.script.excecao"));
        }

        if (errors.isEmpty()) {
            return (mapping.findForward("success"));
        }

        saveMessages(request, errors);
        return (mapping.findForward("failure"));

    }
}