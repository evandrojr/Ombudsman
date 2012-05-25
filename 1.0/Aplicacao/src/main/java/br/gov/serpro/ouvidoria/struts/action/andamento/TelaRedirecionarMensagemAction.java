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

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.DynaActionForm;

import br.gov.serpro.ouvidoria.controller.andamento.RedirecionarMensagemCtrl;
import br.gov.serpro.ouvidoria.model.Acionamento;
import br.gov.serpro.ouvidoria.struts.ActionSupport;

/**
 * 
 * @author SERPRO
 * @version $Revision: 1.1.2.3 $, $Date: 2011/10/18 17:57:04 $
 * @version 0.1, 2007/12/20
 */
public class TelaRedirecionarMensagemAction extends ActionSupport {

	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		ActionErrors errors = new ActionErrors();
		RedirecionarMensagemCtrl redirecionarMensagemCtrl = new RedirecionarMensagemCtrl(
				getDaoFactory());

		String idAcionamento = request.getParameter("idAcionamento");

		Acionamento acionamento = redirecionarMensagemCtrl
				.getAcionamento(new Integer(idAcionamento));

		DynaActionForm _form = (DynaActionForm) form;

		Integer subOrgao = (Integer) _form.get("subOrgao");

		Integer localidade = (Integer) _form.get("localidadeOcorrencia");

		Integer assunto = (Integer) _form.get("assunto");

		request.setAttribute("listaSubOrgaos", redirecionarMensagemCtrl
				.getListaSubOrgao(this.getOrgao(request)));

		if (acionamento.getRespostaAcionamento() != null
				&& acionamento.getRespostaAcionamento().getTitulo() != null) {
			request.setAttribute("titulo", acionamento.getRespostaAcionamento()
					.getTitulo());
		}

		if ((subOrgao != null) && (subOrgao.intValue() != 0)) {
			request.setAttribute("listaAssunto", redirecionarMensagemCtrl
					.getListaAssunto(subOrgao));

			request.setAttribute("listaLocalidadeOcorrencia",
					redirecionarMensagemCtrl
							.getListaLocalidadeOcorrencia(subOrgao));
		}

		if ((localidade != null) && (localidade.intValue() != 0)) {
			request.setAttribute("consultor", redirecionarMensagemCtrl.getConsultor(subOrgao, assunto, localidade));
		}

		if (!errors.isEmpty()) {
			return (mapping.findForward("failure"));
		}
		return (mapping.findForward("success"));
	}
}