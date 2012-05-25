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

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Category;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.ActionMessages;

import br.gov.serpro.ouvidoria.struts.ActionSupport;
import br.gov.serpro.ouvidoria.util.Constants;
import br.gov.serpro.ouvidoria.util.ParamBean;
import br.gov.serpro.ouvidoria.util.ReportHelperHist;
import br.gov.serpro.ouvidoria.util.ReportKit;

/**
 * Mostra (em indicadoresInternos-results.jsp) o resultado da pesquisa feita em
 * indicadoresInternos.jsp
 * 
 * @author SERPRO
 * @version $Revision: 1.1.2.4 $, $Date: 2011/10/18 17:57:41 $
 * @version 0.1, Date: 2005/01/30
 */
public class IndicadoresHistoricoAction extends ActionSupport {
	final Category log = Category.getInstance(IndicadoresHistoricoAction.class
			.getName());

	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		ActionMessages errors = new ActionMessages();

		try {

			log.info("################### Ind Hist Action dentro do try ##############");

			ParamBean params = new ParamBean();

			params.setWidth(300);

			request.setAttribute("params", params);
			String query = ReportHelperHist.getQuery(request);

			if (!ReportKit.getExistsFromQuery(query)) {
				request.setAttribute("errorMsg",
						"Não foram encontrados acionamentos para os parâmetros informados.");
				return mapping.findForward("same");
			}

			request.setAttribute("query", query);
			request.setAttribute("orgao", this.getOrgao(request));

		} catch (Exception e) {

			if (Constants.DEBUG)
				e.printStackTrace(System.out);

			errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
					"error.indicadores.exception"));

			saveErrors(request, errors);
		}

		return (mapping.findForward(errors.isEmpty() ? "success" : "error"));

	}

}