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

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.MessageFormat;
import java.text.NumberFormat;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.oro.text.perl.Perl5Util;
import org.jfree.chart.labels.CategoryLabelGenerator;
import org.jfree.data.category.CategoryDataset;

import br.gov.serpro.ouvidoria.controller.gerencial.administracao.OrgaoCtrl;
import br.gov.serpro.ouvidoria.dao.DaoFactory;
import br.gov.serpro.ouvidoria.dao.hibernate.HibernateDaoFactory;
import br.gov.serpro.ouvidoria.model.Orgao;
import br.gov.serpro.ouvidoria.util.freechart.data.CategoryDatasetFilterListener;
import br.gov.serpro.ouvidoria.util.freechart.data.DBUtilsKit;
import br.gov.serpro.ouvidoria.util.freechart.data.JDBCFlatCategoryDataset;

/**
 * 
 * @author SERPRO
 * @version $Revision: 1.1.2.4 $, $Date: 2011/10/21 18:53:46 $
 * @version 0.1, Date: 2005/01/28
 */
public class ReportHelperFormula {

	private static final class TotalQueryFilter implements
			CategoryDatasetFilterListener, CategoryLabelGenerator {

		private Map map = null;

		private NumberFormat formatter;

		private static Double DOUBLE_ZERO = new Double(0);

		public TotalQueryFilter() {
			this.map = new HashMap();
			formatter = NumberFormat.getPercentInstance();
			formatter.setMinimumFractionDigits(2);
		}

		public final Number filterValue(Number value, Comparable rowKey,
				Comparable columnKey, Object data) {

			double total;
			try {
				total = ((ResultSet) data).getDouble("COUNT");
			} catch (SQLException e) {
				e.printStackTrace();
				total = -100d;
			}

			double p = value.doubleValue() / total;

			if (p == 0)
				return DOUBLE_ZERO;

			this.map.put(rowKey.toString() + "|" + columnKey.toString(),
					this.formatter.format(p) + " (" + value.toString() + ")");

			return new Double(p * 100d);

		}

		public final String generateLabel(CategoryDataset dataset, int series,
				int category) {
			Object result = this.map.get(dataset.getRowKey(series).toString()
					+ "|" + dataset.getColumnKey(category).toString());
			return result == null ? "" : result.toString();
		}

	}

	private final static Perl5Util p5Util = new Perl5Util();

	public static List getRecordList(HttpServletRequest request)
			throws SQLException {

		String query = getQuery(request);

		List result = DBUtilsKit.selectAsListMap(query);
		result.add(new Double(100f / ReportKit.getCountFromList(result)));
		return result;

	}

	public static Object getDataSet(String h_formula, String chart_type,
			boolean detailed, String timeDomain, String h_locais, Orgao orgao,
			String txt_periodo_i, String txt_periodo_f) throws SQLException {

		Object ds = ReportKit.getDataSet(chart_type, false, null, false);

		String query = getQuery(h_formula.split(","), chart_type, detailed,
				timeDomain, h_locais, orgao, txt_periodo_i, txt_periodo_f);

		boolean isLine = chart_type.indexOf("line") >= 0;

		JDBCFlatCategoryDataset dataSet = (JDBCFlatCategoryDataset) ds;
		dataSet.getColumnHelper().setCustomMapping(
				detailed ? (!isLine ? new int[] { 1, 2, 4 } : new int[] { 2, 1,
						4 }) : (isLine ? new int[] { -1, 1, 3 } : new int[] {
						1, -2, 3 }));

		TotalQueryFilter tqf = new TotalQueryFilter();
		dataSet.setFilter(tqf);
		dataSet.setLabelGenerator(tqf);

		dataSet.executeQuery(query, true);
		dataSet.fillGaps();
		return dataSet;

	}

	public static String getQuery(HttpServletRequest request) {

		boolean detail = false;
		final DaoFactory daoFactory = new HibernateDaoFactory();

		if ("d".equalsIgnoreCase(request.getParameter("r_modo_exibicao")))
			detail = true;

		OrgaoCtrl orgaoCtrl = new OrgaoCtrl(daoFactory);

		Orgao orgao = (Orgao) orgaoCtrl.get((String) request.getSession()
				.getAttribute(Constants.ID_SESSAO_ORGAO));

		String[] formulaItems = request.getParameter("h_formula").split(",");

		return getQuery(formulaItems, request.getParameter("sel_tipo_grafico"),
				detail, request.getParameter("sel_agrupamento"),
				request.getParameter("h_locais"), orgao,
				request.getParameter("txt_periodo_i"),
				request.getParameter("txt_periodo_f"));

	}

	private final static int[] hasAcionadorArray = { 1, 2, 3, 6, 7, 9, 10 };

	/**
	 * @param formulaItems
	 * @param chart_type
	 * @param detailed
	 * @param timeDomain
	 * @param h_locais
	 * @param orgao
	 * @param txt_periodo_i
	 * @param txt_periodo_f
	 * @return A query correspondente aos par&acirc;metros passados.
	 */
	public static String getQuery(String[] formulaItems, String chart_type,
			boolean detailed, String timeDomain, String h_locais, Orgao orgao,
			String txt_periodo_i, String txt_periodo_f) {

		final String baseQuery = ReportKit.getConfig().getString(
				"if.base.select");

		String groupBy = "";

		String dateCrit = ReportKit.getDateCrit(txt_periodo_i, txt_periodo_f);
		String locCrit = ReportKit.getLocationCrit(h_locais);

		String firstFields = "";
		String fromTable = "";
		String fromTableSub = "";
		String index = "";
		String tableValue = "";

		final String timeField = ReportKit.getConfig().getString(
				"ie.time." + timeDomain)
				+ ", ";

		firstFields = timeField;
		boolean usesAcionador = false;
		String formulaCrit = "";

		for (int i = 0; i < formulaItems.length; i++) {
			String[] tableValues = formulaItems[i].split("=");
			index = tableValues[0];
			tableValue = tableValues.length < 2 ? "" : tableValues[1];

			fromTableSub += " "
					+ ReportKit.getConfig()
							.getString("if.from_tables." + index);
			formulaCrit += (formulaCrit.length() == 0 ? "" : " AND ")
					+ ReportKit.getConfig().getString(
							"if.where_tables." + index);

			formulaCrit += " AND "
					+ (tableValue.length() == 0 ? "IFNULL("
							+ ReportKit.getConfig().getString(
									"ii.case_field.cons." + index)
							+ ", '') = ''" : ReportKit.getConfig().getString(
							"ii.case_field.cons." + index)
							+ "="
							+ ("1".equals(index) ? "'" : "")
							+ tableValue
							+ ("1".equals(index) ? "'" : ""));

			if (!usesAcionador
					&& Arrays.binarySearch(hasAcionadorArray,
							Integer.parseInt(index)) >= 0)
				usesAcionador = true;

		}

		if (usesAcionador) {
			fromTableSub += ", acionador c ";
			formulaCrit += " AND a_in.COD_ACNDOR = c.COD_ACNDOR";
		}

		if (detailed) {
			firstFields += (firstFields.length() > 0 ? " " : "")
					+ ReportKit.getConfig().getString("loco.fields") + ", ";
			fromTable += " "
					+ ReportKit.getConfig().getString("loco.left_join");
			groupBy += (groupBy.length() > 0 ? ", " : ", ")
					+ ReportKit.getConfig().getString("loco.fields");
		}

		final String A_LOCO_DOT = "s/(\\s|\\(|^)(loco|a)([. ])/$1$2_in$3/ig";
		String locoDotProc = p5Util.substitute(A_LOCO_DOT,
				dateCrit.substring(5) + locCrit);

		String subSelect = ReportKit.getConfig().getString("if.base_subselect");
		subSelect = MessageFormat
				.format(subSelect,
						new Object[] {
								fromTableSub,
								detailed ? p5Util
										.substitute(
												"s/(a_in.COD_LOCAL_OCORR)\\s(IN \\(.*?\\))/$1 = a.COD_LOCAL_OCORR/",
												locoDotProc)
										: locoDotProc,
								p5Util.substitute(A_LOCO_DOT, p5Util
										.substitute("s/\\sAS\\sTIME,//i",
												timeField)),
								p5Util.substitute(A_LOCO_DOT, formulaCrit)
										+ (detailed ? "" : "") });

		String query = MessageFormat.format(baseQuery, new Object[] {
				firstFields, fromTable, dateCrit.substring(5) + locCrit,
				groupBy, subSelect });

		return query;
	}

}