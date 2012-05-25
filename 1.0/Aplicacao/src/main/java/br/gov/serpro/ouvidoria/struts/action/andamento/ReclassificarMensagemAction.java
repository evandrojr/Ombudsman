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

import br.gov.serpro.ouvidoria.controller.andamento.ReclassificarMensagemCtrl;
import br.gov.serpro.ouvidoria.controller.gerencial.administracao.TipoMensagemCtrl;
import br.gov.serpro.ouvidoria.model.Acionamento;
import br.gov.serpro.ouvidoria.struts.ActionSupport;

/**
 *  
 * @author
 * @version $Revision: 1.1.2.3 $, $Date: 2011/10/18 17:57:03 $
 * @version 2004/12/21
 */
public class ReclassificarMensagemAction extends ActionSupport {
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		ActionErrors errors = new ActionErrors();
		ReclassificarMensagemCtrl reclassificarMensagemCtrl = new ReclassificarMensagemCtrl(
				getDaoFactory());

		TipoMensagemCtrl tipoMensagemCtrl = new TipoMensagemCtrl(
				getDaoFactory());

		DynaActionForm _form = (DynaActionForm) form;

		Integer idAcionamento = new Integer(request
				.getParameter("idAcionamento"));

		Integer idAssunto = (Integer) _form.get("assunto");

		Long idTipoMensagem = (Long) _form.get("tipoMensagem");

		Acionamento acionamento = reclassificarMensagemCtrl
				.getAcionamento(idAcionamento);

		if (idAssunto != null && idAssunto.intValue() != 0) {

			acionamento.getMensagem().setAssunto(
					reclassificarMensagemCtrl.getAssunto(idAssunto));
		}

		if (idTipoMensagem != null && idTipoMensagem.intValue() != 0) {

			acionamento.getMensagem().setTipoMensagem(
					tipoMensagemCtrl.get(idTipoMensagem));
		}

		reclassificarMensagemCtrl.salvarAcionamento(acionamento);

		request.setAttribute("fezSubmit", "true");

		/* Gera histórico, se for o caso */
		this.geraHistorico(request, acionamento);

		if (!errors.isEmpty()) {
			return (mapping.findForward("failure"));
		}
		return (mapping.findForward("success"));

	}
}