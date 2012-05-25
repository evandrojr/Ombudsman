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
package br.gov.serpro.ouvidoria.struts.action.gerencial.relatorios;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.ActionMessages;
import br.gov.serpro.ouvidoria.struts.ActionSupport;
import br.gov.serpro.ouvidoria.util.Constants;
import br.gov.serpro.ouvidoria.util.ParamBean;
import br.gov.serpro.ouvidoria.util.ReportHelperFormula;
import br.gov.serpro.ouvidoria.util.ReportHelperInt;
import br.gov.serpro.ouvidoria.util.ReportKit;

/**
 * Mostra (em indicadoresInternos-results.jsp) o resultado da pesquisa feita em
 * indicadoresInternos.jsp
 * 
 * @author SERPRO
 * @version $Revision: 1.1.2.5 $, $Date: 2011/10/21 11:19:59 $
 * @version 0.1, Date: 2005/01/31
 */
public class IndicadoresFormulaAction extends ActionSupport {
    
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        
        ActionMessages errors = new ActionMessages();
        
        try {
            
            ParamBean params = new ParamBean();
            
            params.setWidth(300);
            
            request.setAttribute("params", params);
            
            request.setAttribute("if_tabela_array", ReportHelperInt
                    .getComboListsAsArray(request));
            
            String query = ReportHelperFormula.getQuery(request);
            
            if (!ReportKit.getExistsFromQuery(query)) {
                request.setAttribute("errorMsg", "Não foram encontrados acionamentos para os parâmetros informados.");
                return mapping.findForward("same");
            }
            
            List rl = ReportHelperFormula.getRecordList(request);
            
            request.setAttribute("recordList", rl);
            request.setAttribute("query", query);
            request.setAttribute("orgao", this.getOrgao(request));
            
        } catch (Exception e) {
            if( Constants.DEBUG)
                e.printStackTrace(System.out);
            
            errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
                    "error.indicadores.exception"));
            
            saveErrors(request, errors);
        }
        
        return (mapping.findForward(errors.isEmpty() ? "success" : "error"));
        
    }
    
}