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
package br.gov.serpro.ouvidoria.struts.action.aprendizado;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import br.gov.serpro.ouvidoria.model.Boletim;
import br.gov.serpro.ouvidoria.model.Funcionario;
import br.gov.serpro.ouvidoria.struts.ActionSupport;
import br.gov.serpro.ouvidoria.util.Constants;

/**
 * 
 * @author SERPRO
 * @version $Revision: 1.1.2.4 $, $Date: 2011/10/20 15:30:36 $
 * @version 0.1, 2005/02/02
 */
public class GerarBoletimAction extends ActionSupport {

    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        final String novo = request.getParameter("new");
        if (novo == null || novo.equals("true")) {
            request.getSession().setAttribute(Constants.BOLETIM, new Boletim());
            request.getSession().removeAttribute(Constants.HTML_RELATORIO);
        }
        final String htmlRelatorio = request.getParameter("htmlRelatorio");
        final String imageChart = request.getParameter("imgId");

        if (htmlRelatorio != null) {
            request.getSession().setAttribute(Constants.HTML_RELATORIO,
                    htmlRelatorio);
        }

    	Funcionario funcionario = (Funcionario) this.getFuncionario(request);    
        
        request.getSession().setAttribute(Constants.SS_FUNCIONARIO, funcionario);
    	
        request.getSession().setAttribute(Constants.IMAGE_CHART, imageChart);

        return mapping.findForward("success");
    }

}