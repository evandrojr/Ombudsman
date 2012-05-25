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

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.ActionMessages;
import org.apache.struts.action.DynaActionForm;

import br.gov.serpro.ouvidoria.controller.gerencial.administracao.OrgaoCtrl;
import br.gov.serpro.ouvidoria.model.Orgao;
import br.gov.serpro.ouvidoria.struts.ActionSupport;
import br.gov.serpro.ouvidoria.util.Constants;
import br.gov.serpro.ouvidoria.util.ParamBean;
import br.gov.serpro.ouvidoria.util.ReportHelperExt;
import br.gov.serpro.ouvidoria.util.ReportKit;

/**
 * Mostra (em indicadoresInternos-results.jsp) o resultado da pesquisa feita em indicadoresInternos.jsp
 * 
 * @author SERPRO
 * @version $Revision: 1.1.2.3 $, $Date: 2011/10/20 15:30:36 $
 * @version 0.1, Date: 2005/01/31
 */
public class IndicadoresExternosAction extends ActionSupport {
    
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        
        ActionErrors errors = new ActionErrors();
        
        DynaActionForm frm = (DynaActionForm) form;
        
        try {
            
            ParamBean params = new ParamBean();
            
            params.setWidth(300);
            
            request.setAttribute("params", params);
            String query = ReportHelperExt.getQuery(request);
            
            if (!"2".equals(frm.getString("sel_indicador")) && !ReportKit.getExistsFromQuery(query)) {
                request.setAttribute("errorMsg", "Nenhum dado encontrado.");
                return mapping.findForward("same");
            }
            
            List rl = ReportHelperExt.getRecordList(request);
            request.setAttribute("recordList", rl);
            
            OrgaoCtrl orgaoCtrl = new OrgaoCtrl(daoFactory);
            Orgao orgao = (Orgao) orgaoCtrl.get((String) request.getSession().getAttribute(Constants.ID_SESSAO_ORGAO));
            
            request.setAttribute("extra_rows_html", ReportHelperExt.getExtraRowsHTML(request.getParameter("sel_indicador"), request.getParameter("col_names"), request.getParameter("extra_rows"), "d".equalsIgnoreCase(request.getParameter("r_modo_exibicao")), rl.subList(0, rl.size() - 1), request.getParameter("h_locais"), orgao));
            request.setAttribute("query", query);
            
            
        } catch (Throwable t) {
            t.printStackTrace();
            errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
                    "error.solucao.excecao"));
        }
        
        request.setAttribute("orgao", this.getOrgao(request));
        
        return (mapping.findForward(errors.isEmpty() ? "success" : "failure"));
        
    }
    
}