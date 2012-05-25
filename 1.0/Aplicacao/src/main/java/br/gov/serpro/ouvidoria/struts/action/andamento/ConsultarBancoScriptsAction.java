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

import java.util.ArrayList;
import java.util.Collection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import br.gov.serpro.ouvidoria.controller.gerencial.administracao.FuncionarioCtrl;
import br.gov.serpro.ouvidoria.model.Funcionario;
import br.gov.serpro.ouvidoria.struts.ActionSupport;
import br.gov.serpro.ouvidoria.util.Constants;

/**
 * Objetivo: Chamar a tela de entrada de parâmetros para a consulta ao banco de
 * scripts passando uma string de busca e a lista de assuntos.
 * 
 * @author SERPRO
 * @version $Revision: 1.1.2.3 $, $Date: 2011/10/18 17:57:04 $
 * @version 0.1, 2004/12/07
 */
public class ConsultarBancoScriptsAction extends ActionSupport {
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

        Collection lstAssunto = null;

        // Recupera o Funcionário logado
        Long funcionarioId = (Long) request.getSession().getAttribute(Constants.PA_FUNCIONARIO);
        
    	FuncionarioCtrl funcionarioCtrl = new FuncionarioCtrl(getDaoFactory());
    	
    	Funcionario func = (Funcionario) funcionarioCtrl.get(funcionarioId);  

        // Recupera lista de assuntos para preenchimento da "combo"
        lstAssunto = func.getListaAssuntosComAtuacao("Ambos");

        if (lstAssunto != null)
            request.setAttribute("lstAssuntos", lstAssunto);
        else
            request.setAttribute("lstAssuntos", new ArrayList());

        return (mapping.findForward("success"));
    }
}