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
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.ActionMessages;
import org.apache.struts.action.DynaActionForm;

import br.gov.serpro.ouvidoria.controller.AcionamentoCtrl;
import br.gov.serpro.ouvidoria.controller.gerencial.administracao.FuncionarioCtrl;
import br.gov.serpro.ouvidoria.dao.DaoException;
import br.gov.serpro.ouvidoria.model.Funcionario;
import br.gov.serpro.ouvidoria.struts.ActionSupport;
import br.gov.serpro.ouvidoria.util.Constants;

/**
 * Objetivo: Listar as mensagens sob responsabilidade do usuário de acordo com
 * parâmetros informados
 * 
 * @author SERPRO
 * @version $Revision: 1.1.2.3 $, $Date: 2011/10/18 17:57:03 $
 * @version 0.1, 2004/12/15
 */
public class ListarMsgPorResponsAction extends ActionSupport {

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

		List lstMsgs = new ArrayList();
		ActionMessages errorMsgs = new ActionMessages();

		try {
			AcionamentoCtrl ctrlAcion = new AcionamentoCtrl(getDaoFactory());

			DynaActionForm _form = (DynaActionForm) form;

			// Recupera parâmetros informados para a consulta
			String lsChkPend = _form.getString("chkpend");
			String lsChkAnd = _form.getString("chkand");
			String lsChkAtraso = _form.getString("chkatraso");
			String lsChkCritico = _form.getString("chkcritico");
			String lsDatIni = _form.getString("txtDatIni");
			String lsDatFim = _form.getString("txtDatFim");
			String lsTipoMsg = _form.getString("txtTipoMsg");
			String lsAssunto = _form.getString("txtAssunto");
			String lsOrdenacao = _form.getString("ordenacao");
			String lsProtocolo = _form.getString("txtProtocolo");

			// Coloca na sessão para permitir a reconsulta ao Redirecionar uma
			// mensagem
			if (lsChkPend != null && !lsChkPend.equals("")) {
				HttpSession session = request.getSession(true);
				session.setAttribute("chkpend", "S");
			}
			if (lsChkAnd != null && !lsChkAnd.equals("")) {
				HttpSession session = request.getSession(true);
				session.setAttribute("chkand", "S");
			}
			if (lsChkAtraso != null && !lsChkAtraso.equals("")) {
				HttpSession session = request.getSession(true);
				session.setAttribute("chkatraso", "S");
			}
			if (lsChkCritico != null && !lsChkCritico.equals("")) {
				HttpSession session = request.getSession(true);
				session.setAttribute("chkcritico", "S");
			}

			if ((lsChkPend == null || (lsChkPend != null && lsChkPend
					.equals("")))
					&& (lsChkAnd == null || (lsChkAnd != null && lsChkAnd
							.equals("")))
					&& (lsChkAtraso == null || (lsChkAtraso != null && lsChkAtraso
							.equals("")))
					&& (lsChkCritico == null || (lsChkCritico != null && lsChkCritico
							.equals("")))) {

				lsChkPend = (String) (request.getSession().getAttribute(
						"chkpend") != null ? request.getSession().getAttribute(
						"chkpend") : "");

				lsChkAnd = (String) (request.getSession()
						.getAttribute("chkand") != null ? request.getSession()
						.getAttribute("chkand") : "");

				lsChkAtraso = (String) (request.getSession().getAttribute(
						"chkatraso") != null ? request.getSession()
						.getAttribute("chkatraso") : "");

				lsChkCritico = (String) (request.getSession().getAttribute(
						"chkcritico") != null ? request.getSession()
						.getAttribute("chkcritico") : "");
			}

			// Recupera o Funcionário logado
			Long funcionarioId = (Long) request.getSession().getAttribute(
					Constants.PA_FUNCIONARIO);

			FuncionarioCtrl funcionarioCtrl = new FuncionarioCtrl(
					getDaoFactory());

			Funcionario func = (Funcionario) funcionarioCtrl.get(funcionarioId);

			lstMsgs = ctrlAcion.listaMensagensEstado(func, lsChkPend, lsChkAnd,
					lsChkAtraso, lsChkCritico, lsDatIni, lsDatFim, lsTipoMsg,
					lsAssunto, lsOrdenacao, lsProtocolo);

			// Passa a lista com as mensagens consultadas através da sessao
			// e os parâmetros usados na consulta

			HttpSession session = request.getSession(true);

			session.setAttribute("chkpend", lsChkPend);
			session.setAttribute("chkand", lsChkAnd);
			session.setAttribute("chkatraso", lsChkAtraso);
			session.setAttribute("chkcritico", lsChkCritico);
			session.setAttribute("txtDatIni", lsDatIni);
			session.setAttribute("txtDatFim", lsDatFim);
			session.setAttribute("txtTipoMsg", lsTipoMsg);
			session.setAttribute("txtAssunto", lsAssunto);
			session.setAttribute("ordenacao", lsOrdenacao);
			session.setAttribute("txtProtocolo", lsProtocolo);

			if (lstMsgs != null) {
				String string = "sim";
				session.setAttribute("possuiPesquisa", string);
			}

			request.setAttribute("lstMsgs", lstMsgs);


		} catch (DaoException e) {
			errorMsgs.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
					"error.mensagem.excecao"));
		}

		if (errorMsgs.isEmpty()) {
			return (mapping.findForward("success"));
		}
		saveMessages(request, errorMsgs);
		return (mapping.findForward("failure"));

	}
}