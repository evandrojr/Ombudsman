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

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Collection;
import java.util.Comparator;
import java.util.Locale;
import java.util.TreeSet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.ActionMessages;

import br.gov.serpro.ouvidoria.controller.gerencial.administracao.FuncionarioCtrl;
import br.gov.serpro.ouvidoria.controller.gerencial.administracao.SubOrgaoCtrl;
import br.gov.serpro.ouvidoria.dao.DaoException;
import br.gov.serpro.ouvidoria.model.Funcionario;
import br.gov.serpro.ouvidoria.model.PersistentObject;
import br.gov.serpro.ouvidoria.model.SubOrgao;
import br.gov.serpro.ouvidoria.struts.DispatchActionSupport;
import br.gov.serpro.ouvidoria.util.Constants;

/**
 * Objetivo: Manter tabela de SubOrgão
 * 
 * @author SERPRO
 * @version $Revision: 1.1.2.5 $, $Date: 2011/10/21 12:51:36 $
 * @version 0.1, 2004/12/27
 */
public class AtualizarSubOrgaoAction extends DispatchActionSupport {


	public ActionForward listar(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		Long funcionarioId = (Long) request.getSession().getAttribute(
				Constants.PA_FUNCIONARIO);

		FuncionarioCtrl funcionarioCtrl = new FuncionarioCtrl(getDaoFactory());

		Funcionario funcionario = (Funcionario) funcionarioCtrl
				.get(funcionarioId);

		Collection lista = null;
		if (funcionario.getNivelAtuacao() == Funcionario.NA_ORGAO) {
			SubOrgaoCtrl subOrgaoCtrl = new SubOrgaoCtrl(getDaoFactory());
			lista = subOrgaoCtrl.listarTodosSubOrgaos(getOrgao(request));
		} else {
			Comparator ordem = new Comparator() {
				public int compare(Object obj1, Object obj2) {
					PersistentObject pobj1 = (PersistentObject) obj1;
					PersistentObject pobj2 = (PersistentObject) obj2;
					if (pobj1 != null && pobj1.getDescricao() != null) {
						return pobj1.getDescricao().compareTo(
								pobj2.getDescricao());
					}
					return 0;
				}
			};
			lista = new TreeSet(ordem);
			lista.addAll(funcionario.getListaTodosSubOrgaos());
		}
		request.setAttribute("listarSubOrgaos", lista);

		return mapping.findForward("listar");
	}


	public ActionForward exibir(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		final String id = request.getParameter("id");

		SubOrgao subOrgao = null;
		if (id == null || id.trim().length() == 0) {
			subOrgao = new SubOrgao();
		} else {
			SubOrgaoCtrl subOrgaoCtrl = new SubOrgaoCtrl(getDaoFactory());
			subOrgao = subOrgaoCtrl.get(new Long(id));
		}

		request.setAttribute("function", request.getParameter("function"));
		request.setAttribute("subOrgao", subOrgao);

		return mapping.findForward("exibir");
	}

	public ActionForward salvar(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		ActionMessages msgs = new ActionMessages();

		final String id = request.getParameter("id");
		final String descricao = request.getParameter("descricao");
		final String dataInicioVigencia = request
				.getParameter("dataInicioVigencia");
		final String horaInicioVigencia = request
				.getParameter("horaInicioVigencia");
		final String dataFimVigencia = request.getParameter("dataFimVigencia");
		final String horaFimVigencia = request.getParameter("horaFimVigencia");

		SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy hh:mm",
				new Locale("pt", "BR"));

		if (descricao == null || descricao.trim().length() == 0) {
			msgs.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
					"error.atualizarSubOrgao.descricao"));
		}

		Timestamp inicioVigencia = null;
		if (id == null || id.trim().length() == 0) {
			try {
				inicioVigencia = new Timestamp(sdf.parse(
						dataInicioVigencia + " " + horaInicioVigencia)
						.getTime());
			} catch (ParseException e) {
				msgs.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
						"error.atualizarSubOrgao.dataVigencia"));
			}
		} else {
			if (dataInicioVigencia != null
					&& dataInicioVigencia.trim().length() > 0) {
				try {
					inicioVigencia = new Timestamp(sdf.parse(
							dataInicioVigencia + " " + horaInicioVigencia)
							.getTime());
				} catch (ParseException e) {
					msgs.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
							"error.atualizarSubOrgao.dataVigencia"));
				}
			}

		}

		Timestamp fimVigencia = null;
		if (dataFimVigencia != null && dataFimVigencia.trim().length() > 0) {
			try {
				fimVigencia = new Timestamp(sdf.parse(
						dataFimVigencia + " " + horaFimVigencia).getTime());
			} catch (ParseException e) {
				msgs.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
						"error.atualizarSubOrgao.dataVigencia"));
			}
		}

		if (!msgs.isEmpty()) {
			saveErrors(request, msgs);
			return mapping.findForward("error");
		}

		SubOrgaoCtrl subOrgaoCtrl = new SubOrgaoCtrl(getDaoFactory());
		try {

			if (id != null && id.trim().length() > 0) {
				subOrgaoCtrl.update(getOrgao(request), id, descricao,
						inicioVigencia, fimVigencia);
				msgs.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
						"message.atualizarSubOrgao.alterar"));
			} else {
				subOrgaoCtrl.insert(getOrgao(request), descricao,
						inicioVigencia, fimVigencia);
				msgs.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
						"message.atualizarSubOrgao.incluir"));

			}

		} catch (DaoException daoe) {
			msgs.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
					"error.atualizarSubOrgao"));
		}

		saveMessages(request, msgs);

		return mapping.findForward("success");
	}

	public ActionForward excluir(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		ActionMessages msgs = new ActionMessages();

		final String id = request.getParameter("id");
		final String dataFimVigencia = request.getParameter("dataFimVigencia");
		final String horaFimVigencia = request.getParameter("horaFimVigencia");

		SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy hh:mm",
				new Locale("pt", "BR"));
		String message = null;
		try {
			final Timestamp vigencia = new Timestamp(sdf.parse(
					dataFimVigencia + " " + horaFimVigencia).getTime());

			SubOrgaoCtrl subOrgaoCtrl = new SubOrgaoCtrl(getDaoFactory());
			subOrgaoCtrl.delete(getOrgao(request), id, vigencia);
			message = "message.atualizarSubOrgao.excluir";
		} catch (ParseException e) {
			message = "error.atualizarSubOrgao.dataVigencia";
		}

		msgs.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(message));
		saveMessages(request, msgs);
		return mapping.findForward("success");
	}
}