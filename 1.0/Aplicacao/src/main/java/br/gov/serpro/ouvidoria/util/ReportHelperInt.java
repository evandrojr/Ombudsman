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
package br.gov.serpro.ouvidoria.util;

import java.sql.SQLException;
import java.text.MessageFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.oro.text.perl.Perl5Util;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.DynaActionForm;

import br.gov.serpro.ouvidoria.controller.gerencial.administracao.OrgaoCtrl;
import br.gov.serpro.ouvidoria.dao.DaoFactory;
import br.gov.serpro.ouvidoria.dao.hibernate.HibernateDaoFactory;
import br.gov.serpro.ouvidoria.model.Orgao;
import br.gov.serpro.ouvidoria.util.collection.ArrayKit;
import br.gov.serpro.ouvidoria.util.freechart.data.DBUtilsKit;
import br.gov.serpro.ouvidoria.util.freechart.data.StringKit;

/**
 * 
 * @author SERPRO
 * @version $Revision: 1.1.2.5 $, $Date: 2011/10/21 18:53:46 $
 * @version 0.1, Date: 2005/01/28
 */
public class ReportHelperInt {

	public final static class ReportDynaActionForm extends DynaActionForm {

		private static final long serialVersionUID = 1L;

		public void reset(ActionMapping mapping, HttpServletRequest request) {
			this.set("sel_itens_tabela", new String[0]);
		}
	}

	public static String[] getTableList() {
		String[] result = ReportKit.getConfig().getStringArray(
				ReportKit.TABLE_LIST);
		return result;
	}

	public static List getComboList(HttpServletRequest request)
			throws SQLException {

		final DaoFactory daoFactory = new HibernateDaoFactory();

		String sIndex = request.getParameter(ReportKit.SEL_TABELA);
		if (sIndex == null || sIndex.length() == 0) {
			sIndex = "-1";
		}

		OrgaoCtrl orgaoCtrl = new OrgaoCtrl(daoFactory);

		return getComboList(sIndex, (Orgao) orgaoCtrl.get((String) request
				.getSession().getAttribute(Constants.ID_SESSAO_ORGAO)));
	}

	public static String getComboListsAsArray(HttpServletRequest request)
			throws SQLException {

		// obter o órgão atual
		final DaoFactory daoFactory = new HibernateDaoFactory();
		OrgaoCtrl orgaoCtrl = new OrgaoCtrl(daoFactory);
		String idSessaoOrgao = (String) request.getSession().getAttribute(
				Constants.ID_SESSAO_ORGAO);
		Orgao orgao = (Orgao) orgaoCtrl.get(idSessaoOrgao);

		return getComboListsAsArray(orgao);
	}

	public static String getComboListsAsArray(Orgao orgao) throws SQLException {
		StringBuffer sb = new StringBuffer(15 * 1024);

		for (int i = 0; i < 12; i++) {
			ReportKit.toJSArray(_getComboList(String.valueOf(i), orgao)
					.iterator(), sb);
			sb.append(",\n");
		}
		sb.setLength(sb.length() - 2);

		return sb.toString();
	}

	public static List getComboList(String index, Orgao orgao)
			throws SQLException {
		return _getComboList(index, orgao);
	}

	private static List _getComboList(String index, Orgao orgao)
			throws SQLException {
		String query = ReportKit.getConfig().getString(
				ReportKit.II_COMBO_QUERY + index);
		if (isCodInstitTable(index)) {
			query = MessageFormat.format(query, new Object[] { orgao.getId() });
		}

		return DBUtilsKit.selectAsListMap(query);
	}

	public static boolean isCodInstitTable(String index) {
		final String[] II_COD_INSTIT_TABLE_ARRAY = ReportKit.getConfig()
				.getStringArray(ReportKit.II_COD_INSTIT_TABLES);
		return ArrayKit.searchEqual(II_COD_INSTIT_TABLE_ARRAY, index) >= 0;
	}

	public static List getRecordList(HttpServletRequest request)
			throws SQLException {
		String query = getQuery(request);
		List result = DBUtilsKit.selectAsListMap(query);
		result.add(new Double(100f / ReportKit.getCountFromList(result)));
		return result;

	}

	public static Object getDataSet(String index, String chart_type,
			boolean detailed, boolean table_on_x_axis,
			Object[] ii_itens_tabela, String[] sel_itens_tabela,
			String h_locais, Orgao orgao, String txt_periodo_i,
			String txt_periodo_f) throws SQLException {

		String query = getQuery(index, chart_type, detailed, table_on_x_axis,
				ii_itens_tabela, sel_itens_tabela, h_locais, orgao,
				txt_periodo_i, txt_periodo_f);

		Object result = ReportKit.getDataSet(chart_type,
				!(detailed && table_on_x_axis), query, true);
		return result;

	}

	public static String getQuery(HttpServletRequest request) {

		boolean table_on_x_axis = false;
		final DaoFactory daoFactory = new HibernateDaoFactory();

		if ("0".equalsIgnoreCase(request.getParameter("r_base_x")))
			table_on_x_axis = true;

		boolean detail = false;
		if ("d".equalsIgnoreCase(request.getParameter("r_modo_exibicao")))
			detail = true;

		OrgaoCtrl orgaoCtrl = new OrgaoCtrl(daoFactory);

		Orgao orgao = (Orgao) orgaoCtrl.get((String) request.getSession()
				.getAttribute(Constants.ID_SESSAO_ORGAO));

		return getQuery(request.getParameter("sel_tabela"),
				request.getParameter("sel_tipo_grafico"), detail,
				table_on_x_axis,
				new ArrayList((List) request.getAttribute("ii_itens_tabela"))
						.toArray(),
				request.getParameterValues("sel_itens_tabela"),
				request.getParameter("h_locais"), orgao,
				request.getParameter("txt_periodo_i"),
				request.getParameter("txt_periodo_f"));

	}

	private final static Perl5Util p5Util = new Perl5Util();

	public static String getNoOutrosQuery(HttpServletRequest request) {

		boolean table_on_x_axis = false;
		final DaoFactory daoFactory = new HibernateDaoFactory();

		if ("0".equalsIgnoreCase(request.getParameter("r_base_x")))
			table_on_x_axis = true;

		boolean detail = false;
		if ("d".equalsIgnoreCase(request.getParameter("r_modo_exibicao")))
			detail = true;

		String index = request.getParameter("sel_tabela");

		OrgaoCtrl orgaoCtrl = new OrgaoCtrl(daoFactory);

		Orgao orgao = (Orgao) orgaoCtrl.get((String) request.getSession()
				.getAttribute(Constants.ID_SESSAO_ORGAO));

		Object[] ii_itens_tabela = new ArrayList(
				(List) request.getAttribute("ii_itens_tabela")).toArray();
		String[] sel_itens_tabela = request
				.getParameterValues("sel_itens_tabela");

		String noOutros = getClauseForNoOutros(index, ii_itens_tabela,
				sel_itens_tabela);

		if (noOutros == null)
			return null;

		String query = getQuery(index,
				request.getParameter("sel_tipo_grafico"), detail,
				table_on_x_axis, ii_itens_tabela, sel_itens_tabela,
				request.getParameter("h_locais"), orgao,
				request.getParameter("txt_periodo_i"),
				request.getParameter("txt_periodo_f"));

		query = p5Util
				.substitute("s/(GROUP\\sBY)/" + noOutros + " $1/i", query);

		return query;

	}

	public static String getQuery(String index, String chart_type,
			boolean detailed, boolean table_on_x_axis,
			Object[] ii_itens_tabela, String[] sel_itens_tabela,
			String h_locais, Orgao orgao, String txt_periodo_i,
			String txt_periodo_f) {

		final boolean isPie = chart_type.indexOf("pie") >= 0;

		final boolean processFirstFields = !(isPie && !table_on_x_axis);

		String baseQuery = ReportKit.getConfig().getString("ii.base.sql");

		String dateCrit = ReportKit.getDateCrit(txt_periodo_i, txt_periodo_f);
		String locCrit = ReportKit.getLocationCrit(h_locais);
		String query = "";
		String queryUnion = "";
		String script = "Outros";

		String firstFieldsKey = !detailed ? "ii.firstFields.cons."
				+ (table_on_x_axis ? "table" : "loc") : "ii.firstFields.detail";

		String firstFields = ReportKit.getConfig().getString(firstFieldsKey);
		if (processFirstFields) {
			firstFields = MessageFormat.format(
					firstFields,
					new Object[] {
							ReportKit.getConfig().getString(
									"ii.case_field.cons." + index),
							getCaseForTableItems(ii_itens_tabela,
									sel_itens_tabela) });
		}

		String fromTable = ReportKit.getConfig().getString(
				ReportKit.II_FROM_TABLES + index);

		String whereTable = ReportKit.getConfig().getString(
				ReportKit.II_WHERE_TABLES + index);
		if (isCodInstitTable(index)) {
			whereTable = MessageFormat.format(whereTable,
					new Object[] { orgao.getId() });
		}

		String groupByKey = !detailed ? "ii.groupBy.cons."
				+ (table_on_x_axis ? "table" : "loc") : "ii.groupBy.detail";

		String groupBy = ReportKit.getConfig().getString(groupByKey);

		query = MessageFormat.format(
				baseQuery,
				new Object[] {
						firstFields,
						fromTable,
						whereTable,
						dateCrit,
						locCrit
								+ (table_on_x_axis ? ""
										: getWhereForTableItems(index,
												sel_itens_tabela)), groupBy });

		// UNION para totalizar acionamentos realizados por SCRIPTS
		if (index.equals("10")) {

			baseQuery = ReportKit.getConfig().getString("ii.base.sql.union");
			query = MessageFormat.format(
					baseQuery,
					new Object[] {
							firstFields,
							fromTable,
							whereTable,
							dateCrit,
							locCrit
									+ (table_on_x_axis ? ""
											: getWhereForTableItems(index,
													sel_itens_tabela)) });

			for (int i = 0; i < sel_itens_tabela.length; i++) {
				if (sel_itens_tabela[i].equals("")) {
					script = "Scripts";
					break;
				}
			}

			queryUnion = " SELECT '" + script
					+ "' as ID, count(distinct atend.cod_atend) as COUNT "
					+ " FROM atendimento atend "
					+ "    , funcionariolocalocorrencia funloc " + " WHERE "
					+ ReportKit.getDateCritUnion(txt_periodo_i, txt_periodo_f)
					+ " AND funloc.cod_func = atend.cod_func "
					+ " AND funloc.cod_local_ocorr IN (" + h_locais + ")"
					+ " GROUP BY ID";

			query = " SELECT a.ID, SUM(a.COUNT) as COUNT FROM (" + query
					+ " UNION " + queryUnion
					+ ") AS a GROUP BY a.ID ORDER BY ID";
		}

		return query;
	}

	private static String getCaseForTableItems(Object[] ii_itens_tabela,
			String[] sel_itens_tabela) {

		if (sel_itens_tabela == null || sel_itens_tabela.length < 1)
			return "";

		StringBuffer sb = new StringBuffer(1024);

		for (int i = 0; i < ii_itens_tabela.length; i++) {
			Map el = (Map) ii_itens_tabela[i];
			Object elID = el.get("id");
			if (ArrayKit.searchEqual(sel_itens_tabela, elID.toString()) < 0)
				continue;

			sb.append(" WHEN ");
			if (elID instanceof String)
				sb.append("'");
			sb.append(elID);
			if (elID instanceof String)
				sb.append("'");
			sb.append(" THEN '").append(el.get("descricao")).append("'");

		}
		return sb.toString();
	}

	private static String getClauseForNoOutros(String index,
			Object[] ii_itens_tabela, String[] sel_itens_tabela) {

		if (sel_itens_tabela == null || sel_itens_tabela.length < 1)
			return "";

		StringBuffer sb = new StringBuffer(1024);
		sb.append(" AND "
				+ ReportKit.getConfig()
						.getString("ii.case_field.cons." + index) + " in (");
		int itemCount = 0;

		for (int i = 0; i < ii_itens_tabela.length; i++) {
			Object elID = ((Map) ii_itens_tabela[i]).get("id");
			if (ArrayKit.searchEqual(sel_itens_tabela, elID.toString()) < 0)
				continue;

			if (elID instanceof String)
				sb.append("'");
			sb.append(elID);
			if (elID instanceof String)
				sb.append("',");
			else
				sb.append(",");

			itemCount++;
		}

		sb.setLength(sb.length() - 1);
		sb.append(")");

		return itemCount == 0 ? null : sb.toString();
	}

	private static String getWhereForTableItems(String index,
			String[] sel_itens_tabela) {
		if (sel_itens_tabela == null || sel_itens_tabela.length < 1)
			return "";
		String sep = "1".equals(index) ? "'" : "";

		boolean hasNull = false;

		String item;
		List list = new ArrayList(sel_itens_tabela.length);

		for (int i = 0; i < sel_itens_tabela.length; i++) {
			item = sel_itens_tabela[i];
			if (item == null || item.length() < 1) {
				hasNull = true;
				continue;
			}
			list.add(item);
		}

		final String fieldName = ReportKit.getConfig().getString(
				"ii.case_field.cons." + index);

		String result = fieldName + " IN ("
				+ StringKit.join(list.toArray(), sep, sep, ",") + ")";
		if (hasNull) {
			result = "(" + result + " OR " + fieldName + " IS NULL)";
		}

		return " AND " + result;

	}

}