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
package br.gov.serpro.ouvidoria.struts.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import br.gov.serpro.ouvidoria.model.ConfiguracoesOrgao;
import br.gov.serpro.ouvidoria.model.Orgao;
import br.gov.serpro.ouvidoria.struts.ActionSupport;

/**
 * 
 * @author SERPRO
 * @version $Revision: 1.1.2.3 $, $Date: 2011/10/20 15:30:36 $
 * @version 0.1, 2005/01/11
 */
public class MenuAction extends ActionSupport {

	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		// obter o órgão e as configurações do órgão
		Orgao orgao = getOrgao(request);
		ConfiguracoesOrgao config = orgao.getConfiguracoes();
		// colocar as configurações do órgão como atributos do request
		request.setAttribute("esquemaCoresLayout", config
				.getEsquemaCoresLayout());
		request.setAttribute("imageLogo", config.getImagemLogo());
		request
				.setAttribute("nomeExibicaoOrgao", config
						.getNomeExibicaoOrgao());
		request.setAttribute("imageBanner", config.getImagemBanner());
		request.setAttribute("linkImagemBanner", config.getLinkImagemBanner());
		request.setAttribute("linkImagemLogo", config.getLinkImagemLogo());
		request.setAttribute("linkImagem3", config.getLinkImagem3());
		request.setAttribute("linkImagem4", config.getLinkImagem4());
		request.setAttribute("linkImagem5", config.getLinkImagem5());

		// determinar se a origem É "intranet" ou "internet"

		String origem = request.getParameter("origem");

		String forward = "error";

		if ("intranet".equals(origem)) {
			forward = "intranet";
		} else if ("internet".equals(origem)) {
			forward = "internet";
		}

		return mapping.findForward(forward);
	}
}