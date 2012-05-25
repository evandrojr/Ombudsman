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

import java.util.Collection;
import java.util.Comparator;
import java.util.TreeSet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.ActionMessages;

import br.gov.serpro.ouvidoria.controller.gerencial.administracao.FuncionarioCtrl;
import br.gov.serpro.ouvidoria.controller.gerencial.administracao.ParametrosGeraisCtrl;
import br.gov.serpro.ouvidoria.controller.gerencial.administracao.SubOrgaoCtrl;
import br.gov.serpro.ouvidoria.model.Funcionario;
import br.gov.serpro.ouvidoria.model.ParametrosGerais;
import br.gov.serpro.ouvidoria.model.Perfil;
import br.gov.serpro.ouvidoria.model.PersistentObject;
import br.gov.serpro.ouvidoria.struts.ActionSupport;
import br.gov.serpro.ouvidoria.util.Constants;
import br.gov.serpro.ouvidoria.util.ReportHelperInt;

/**
 * Recupera os dados utilizados na view indicadoresInternos.jsp
 * 
 * @author SERPRO
 * @version $Revision: 1.1.2.4 $, $Date: 2011/10/20 15:30:36 $
 * @version 0.1, Date: 2005/01/31
 */
public class IndicadoresFormulaControllerAction extends ActionSupport {

	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		ActionErrors errors = new ActionErrors();

		try {

			ParametrosGeraisCtrl parametrosGeraisCtrl = new ParametrosGeraisCtrl(
					getDaoFactory());

			ParametrosGerais parametrosGerais = (ParametrosGerais) parametrosGeraisCtrl
					.list().get(0);

			if (parametrosGerais == null) {
				throw new NullPointerException();
			}

			// Recupera o Funcionário logado
			Long funcionarioId = (Long) request.getSession().getAttribute(
					Constants.PA_FUNCIONARIO);
			FuncionarioCtrl funcionarioCtrl = new FuncionarioCtrl(
					getDaoFactory());
			Funcionario funcionario = (Funcionario) funcionarioCtrl
					.get(funcionarioId);

			Comparator ordem = new Comparator() {
				public int compare(Object obj1, Object obj2) {
					return ((PersistentObject) obj1).getDescricao().compareTo(
							((PersistentObject) obj2).getDescricao());
				}
			};

			/* Lista de Sub-órgãos */
			SubOrgaoCtrl subOrgaoCtrl = new SubOrgaoCtrl(getDaoFactory());
			Collection subOrgaoList = new TreeSet(ordem);

			/* Se funcionário é administrador ou tem nivel de acesso ao órgão */
			if (funcionario.getPerfil().equals(Perfil.ADMINISTRADOR)
					|| funcionario.getNivelAtuacao() == Funcionario.NA_ORGAO)
				subOrgaoList.addAll(subOrgaoCtrl
						.listarTodosSubOrgaos(getOrgao(request)));
			else {
				subOrgaoList.addAll(funcionario.getListaTodosSubOrgaos());
			}

			request.setAttribute("object", funcionario);
			request.setAttribute("maximoIndColuna", parametrosGerais
					.getLimiteColunaIndicadores());
			request.setAttribute("function", request.getParameter("function"));
			request.setAttribute("listarInstituicao", subOrgaoList);

			request.setAttribute("if_tabela_array", ReportHelperInt
					.getComboListsAsArray(request));

		} catch (Throwable t) {
			t.printStackTrace();
			errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
					"error.solucao.excecao"));
		}

		return (mapping.findForward(errors.isEmpty() ? "success" : "failure"));

	}

}