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
import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.ActionMessages;

import br.gov.serpro.ouvidoria.controller.andamento.AssuntoCtrl;
import br.gov.serpro.ouvidoria.controller.gerencial.administracao.FuncionarioCtrl;
import br.gov.serpro.ouvidoria.model.Assunto;
import br.gov.serpro.ouvidoria.model.Funcionario;
import br.gov.serpro.ouvidoria.model.Orgao;
import br.gov.serpro.ouvidoria.model.Perfil;
import br.gov.serpro.ouvidoria.struts.ActionSupport;
import br.gov.serpro.ouvidoria.util.Constants;

/**
 * Objetivo: Chamar a tela de entrada de parâmetros para a consulta a mensagens
 * respondidas
 * 
 * @author SERPRO
 * @version $Revision: 1.1.2.5 $, $Date: 2011/10/21 12:51:36 $
 */
public class ConsultarMsgRespondidaAction extends ActionSupport {

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

        // Recupera órgão do contexto
        Orgao org = getOrgao(request);        
        
        // Recupera o Funcionário logado
        Long funcionarioId = (Long) request.getSession().getAttribute(Constants.PA_FUNCIONARIO);        
    	FuncionarioCtrl funcionarioCtrl = new FuncionarioCtrl(getDaoFactory());    	
    	Funcionario func = (Funcionario) funcionarioCtrl.get(funcionarioId);  

        Collection lstAssuntos = null;
        
        // Caso o funcionário logado seja um Administrador,
        // Consulta-se os assuntos associados aos sub-órgão do 
        // órgão do contexto
        if (func.getPerfil().getId().longValue() == Perfil.ADMINISTRADOR.getId().longValue()) {       	
        	lstAssuntos = org.getListaTodosAssuntos();
        } else {
            // Caso o funcionário logado não seja um Administrador,        	
	        // Recupera lista de assuntos associado aos órgãos no
	        // qual o funcionário atua para preenchimento da "combo"
	        lstAssuntos = func.getListaAssuntosComAtuacao("Ambos");
        }
                
        if (lstAssuntos != null) {
	        // Retira o assunto GLOBAL
	        AssuntoCtrl assntCtrl = new AssuntoCtrl(getDaoFactory());
	        Assunto assnt = assntCtrl.get(new Long(1));
	        lstAssuntos.remove(assnt);
	
	        if (lstAssuntos.isEmpty()) {
	            errorMsgs.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
	                    "error.orgao.semassunto"));
	            saveMessages(request, errorMsgs);
	        }
        }
        
        // Recupera lista de Tipos de Mensagem
        Collection lstTipoMsg = org.getListaTipoMensagem();
        if (lstTipoMsg.isEmpty()) {
            errorMsgs.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
                    "error.orgao.semTipoMsg"));
            saveMessages(request, errorMsgs);
        }

        // Passa a lista de assuntos e de tipos de mensagem
        request.setAttribute("lstAssuntos", lstAssuntos);
        request.setAttribute("lstTiposMsg", lstTipoMsg);

        if (errorMsgs.isEmpty()) {
            return (mapping.findForward("success"));
        }
        return (mapping.findForward("failure"));
    }

}