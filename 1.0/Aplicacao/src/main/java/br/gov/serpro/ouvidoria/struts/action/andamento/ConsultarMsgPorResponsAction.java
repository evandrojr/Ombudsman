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
import java.util.Hashtable;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.ActionMessages;

import br.gov.serpro.ouvidoria.controller.AcionamentoCtrl;
import br.gov.serpro.ouvidoria.controller.gerencial.administracao.FuncionarioCtrl;
import br.gov.serpro.ouvidoria.model.Funcionario;
import br.gov.serpro.ouvidoria.model.Instituicao;
import br.gov.serpro.ouvidoria.model.Orgao;
import br.gov.serpro.ouvidoria.model.Perfil;
import br.gov.serpro.ouvidoria.struts.ActionSupport;
import br.gov.serpro.ouvidoria.util.Constants;
import br.gov.serpro.ouvidoria.model.Acionamento;
import br.gov.serpro.ouvidoria.model.ConsultaAndamento;

/**
 * Objetivo: Chamar a tela de entrada de exibição dos totais de mensagens e
 * entrada de parâmetros para busca de mensagens
 *
 * @author SERPRO
 * @version $Revision: 1.1.2.3 $, $Date: 2011/10/18 17:57:04 $
 * @version 0.1, 2004/12/08
 */
public class ConsultarMsgPorResponsAction extends ActionSupport {
    
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
        
        //obter o funcionário logado
        Long funcionarioId = (Long) request.getSession().getAttribute(Constants.PA_FUNCIONARIO);
        FuncionarioCtrl funcionarioCtrl = new FuncionarioCtrl(getDaoFactory());
        Funcionario func = (Funcionario) funcionarioCtrl.get(funcionarioId);
        
        //obter órgão do funcionário logado
        Orgao orgao = this.getOrgao(request);
        
        // Recupera as listas de assuntos e de tipos de mensagem sobre
        // responsabilidade do funcionário
        Collection lstAssunto = func.getListaAssunto();
        Collection lstTipoMsg = func.getListaTipoMensagem();
        
        // Se funcionario não for um Ouvidor Assistente ou Geral, é necessário
        // ao menos um Tipo de Mensagem ou um Tipo de Assunto
        if ( !func.getPerfil().equals(Perfil.OUVIDOR_ASSISTENTE)
        && !func.getPerfil().equals(Perfil.OUVIDOR_GERAL) ) {
            
            if (lstAssunto.isEmpty() && lstTipoMsg.isEmpty()) {
                errorMsgs.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
                        "error.funcionario.semassunto"));
                errorMsgs.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
                        "error.funcionario.semtipomensagem"));
            }
        }
        
        if (!errorMsgs.isEmpty()) {
            saveMessages(request, errorMsgs);
            return (mapping.findForward("failure"));
        }
        
        // Verificar se o funcionário trata-se de um ouvidor. Para isso,
        // busca-se a lista de instituições nas quais o funcionário atua e
        // verifica-se se o mesmo atua em um órgão.
        Collection lstInst = func.getListaInstituicao();
        boolean isPerfilOuvidor = false;
        
        for (Iterator it = lstInst.iterator(); it.hasNext();) {
            Instituicao inst = (Instituicao) it.next();
            
            if (inst instanceof Orgao) {
                request.setAttribute("perfilOuvidor", "S");
                isPerfilOuvidor = true;
                break;
            }
        }
        
        // Instancia o objeto ctrl de acionamento
        AcionamentoCtrl acionCtrl = new AcionamentoCtrl(getDaoFactory());
        List lstAcionamentos = null;
        
        // Se o funcionário possui perfil de ouvidor, atualiza-se
        // as mensagens sob sua responsabilidade
        if (isPerfilOuvidor) {
            // Recupera-se os acionamentos sob responsabilidade do órgão
            lstAcionamentos = acionCtrl.listaMensagensEstado(orgao, "S", "S",
                    "S", "S");
        } else {
            // Recupera-se os acionamentos sob responsabilidade do
            // especialista/ouvidor assistente
            lstAcionamentos = acionCtrl.listaMensagensEstado(func, "S", "S",
                    "S", "S", "", "", "0", "0", "","");
        }
                     
        
        if (!acionCtrl.atualizaEstadoAcionamentos(converte(lstAcionamentos))) {
            errorMsgs.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
                    "error.acionamento.atualizaestado"));
            saveMessages(request, errorMsgs);
            return (mapping.findForward("failure"));
        }
        
        // Recupera informações sobre totais de mensagens
        Hashtable hshMsg = acionCtrl.informeTotaisMsgs(orgao, func);
        
        Collection lstTotaisMsg = (List) hshMsg.get("Totais");
        Long TotaisMsgFunc = (Long) hshMsg.get("Total Funcionario");
        Long TotaisMsgOrgao = (Long) hshMsg.get("Total Orgao");
        
        // Passa os valores obtidos através da requisição
        request.setAttribute("lstTotaisMsgs", lstTotaisMsg);
        request.setAttribute("TotalMsgFunc", TotaisMsgFunc);
        request.setAttribute("TotalMsgOrgao", TotaisMsgOrgao);
        request.setAttribute("lstAssuntos", lstAssunto);
        request.setAttribute("lstTipoMsg", lstTipoMsg);
        
        return (mapping.findForward("success"));
    }
    
    private List converte(List lstAcionamentos){
    	
    	List lstConsultaAcionamentos = new ArrayList();
    	
    	for (Iterator it = lstAcionamentos.iterator(); it.hasNext();){
    		Acionamento acionamento = (Acionamento)it.next();
    		ConsultaAndamento consultaAndamento = new ConsultaAndamento(acionamento.getId(),
    				                                                    acionamento.getDataPrevistaResolucaoExterna(),
    				                                                    acionamento.getEstadoAcionamento().getDescricao(),
    				                                                    acionamento.getMensagem().getAssunto().getDescricao(),
    				                                                    acionamento.getNumeroProtocolo(),
    				                                                    acionamento.getDataPrevistaResolucaoInterna(),
    				                                                    acionamento.getFuncionario().getNome(),
    				                                                    acionamento.getEstadoAcionamento().getId(),
    				                                                    acionamento.getRespostaAcionamento()==null?"":acionamento.getRespostaAcionamento().getTitulo(),
    				                                                    acionamento.getRespostaAcionamento()==null?"":acionamento.getRespostaAcionamento().getTexto()); 
	
    		
    		lstConsultaAcionamentos.add(consultaAndamento);	
    	}
    	
    	return lstConsultaAcionamentos;
    }
    
}