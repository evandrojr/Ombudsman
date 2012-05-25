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
import java.text.NumberFormat;
import java.util.Iterator;
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
import br.gov.serpro.ouvidoria.util.collection.ListArrayTable;
import br.gov.serpro.ouvidoria.util.freechart.data.DBUtilsKit;
import br.gov.serpro.ouvidoria.util.freechart.data.EnhancedJDBCPieDataset;
import br.gov.serpro.ouvidoria.util.freechart.data.JDBCFlatCategoryDataset;
import br.gov.serpro.ouvidoria.util.freechart.data.persistence.DelimitedStringRecord;

/**
 * 
 * @author SERPRO
 * @version $Revision: 1.1.2.4 $, $Date: 2011/10/21 18:53:46 $
 * @version 0.1, Date: 2005/01/28
 */
public class ReportHelperExt {

	private final static Perl5Util p5Util = new Perl5Util();

	public static List getRecordList(HttpServletRequest request)
			throws SQLException {
		String query = getQuery(request);
		List result = DBUtilsKit.selectAsListMap(query);
		result.add(new Double(100f / ReportKit.getCountFromList(result)));
		return result;

	}

	private static String getLocalName(ListArrayTable locaisTable, String local) {
		Object result = locaisTable.getRowById(local)[1];
		return result == null ? "" : result.toString();
	}

	static NumberFormat formatInt = NumberFormat.getIntegerInstance();

	static NumberFormat formatFloat = NumberFormat.getNumberInstance();

	static {
		formatFloat.setMinimumFractionDigits(2);
	}

	public static String formatNumber(Object number, boolean showDecimalDigits) {
		return (showDecimalDigits ? ReportHelperExt.formatFloat
				: ReportHelperExt.formatInt).format(number);
	}

	public static String formatNumber(double number, boolean showDecimalDigits) {
		return (showDecimalDigits ? ReportHelperExt.formatFloat
				: ReportHelperExt.formatInt).format(number);
	}

	public static Object getExtraRowsHTML(String index, String colNamesStr,
			String extraRowsStr, boolean detailed, List origList,
			String h_locais, Orgao orgao) {

		if (extraRowsStr == null)
			return "";

		StringBuffer sb = new StringBuffer();

		boolean isTempoAtendimento = "1".equals(index) || "2".equals(index)
				|| "4".equals(index);

		boolean isTotalAtendNoPrazo = "4".equals(index);

		Comparable loc = null;

		String[][] extraRows = DelimitedStringRecord
				.string2resultSetArray(extraRowsStr);
		String[] colNames = colNamesStr.split(",");
		String[] locais = h_locais.split(",");
		ListArrayTable locaisTable = null;

		try {
			locaisTable = detailed ? ReportKit.getLocationNames(h_locais)
					: null;

		} catch (SQLException e) {
			e.printStackTrace();

		}

		String valueStr;

		sb.append("<TR><TH class='tdHeader1' width='60'><label tabindex=5>")
				.append("Agrupamento").append("</label></TH>\n");

		// Ouvidoria de comparação digitada pelo usuário
		for (int row = 0; row < extraRows.length; row++) {

			loc = extraRows[row][0];

			sb.append("<TH class='tdHeader1' align='middle'><label tabindex=6>")
					.append(loc).append("</label></TH>\n");
		}

		// Ouvidoria vinda do Banco de dados
		if (detailed) {
			for (int i = 0; i < locais.length; i++) {
				sb.append("<TH class='tdHeader1'><label tabindex=7>")
						.append(getLocalName(locaisTable, locais[i]))
						.append("</label></TH>\n\n");
			}
		} else {
			sb.append("<TH class='tdHeader1'><label tabindex=8>")
					.append(orgao.getDescricao()).append("</label></TH>\n\n");
		}

		sb.append("\n</TR>");

		// Header end
		int tabindex = 9;
		for (int col = 0; col < colNames.length; col++) {
			sb.append("<TR>\n");
			tabindex += col;
			// Agrupamento
			sb.append("<TD><label tabindex=" + tabindex + ">")
					.append(colNames[col]).append("</label></TD>\n");

			// Digitado pelo usuário
			for (int row = 0; row < extraRows.length; row++) {
				valueStr = extraRows[row][col + 1];

				tabindex += row;
				sb.append(
						"<TD align='middle'><label tabindex=" + tabindex + ">")
						.append(formatNumber(Float.parseFloat(valueStr),
								isTempoAtendimento))
						.append(("1".equals(index) || "4".equals(index) ? " %"
								: "")).append("</label></TD>\n");
				sb.append("<script>");
				sb.append("adder.add('COUNT-USER-" + row + "', " + valueStr
						+ ");");
				sb.append("</script>\n");

			}

			// Banco de dados
			if (detailed) {
				for (int i = 0; i < locais.length; i++) {
					Object cval;
					Object cvalDe = "";
					String cvalS = "";

					if (isTotalAtendNoPrazo) {

						cval = getByTimeAndLocal(origList, colNames[col],
								getLocalName(locaisTable, locais[i]),
								"count_in", isTempoAtendimento);
						cvalDe = getByTimeAndLocal(origList, colNames[col],
								null, "count", isTempoAtendimento);

						cvalS = (cval.toString().length() == 0 ? "0,00" : cval)
								+ " %";

					} else {
						cval = getByTimeAndLocal(origList, colNames[col],
								getLocalName(locaisTable, locais[i]),
								"2".equals(index) ? "media_dias" : "count",
								isTempoAtendimento);

						cvalS = (cval.toString().length() == 0 ? (isTempoAtendimento ? "0,00"
								: "0")
								: cval)
								+ ("1".equals(index) || "4".equals(index) ? " %"
										: "");
					}

					sb.append(
							"<TD align='middle'><label tabindex=" + tabindex
									+ ">").append(cvalS)
							.append("</label></TD>\n");

					sb.append("<script>");
					sb.append("adder.add('COUNT-DB-" + i + "', "
							+ (cval.toString().length() == 0 ? "0" : cval)
							+ ");");
					sb.append("adder.add('COUNT-DB-" + i + "-DE', "
							+ (cvalDe.toString().length() == 0 ? "0" : cvalDe)
							+ ");");
					sb.append("</script>\n");

				}

			} else {
				Object cval;
				Object cvalDe = "";
				String cvalS = "";

				if (isTotalAtendNoPrazo) {
					cval = getByTimeAndLocal(origList, colNames[col], null,
							"count_in", isTempoAtendimento);
					cvalDe = getByTimeAndLocal(origList, colNames[col], null,
							"count", isTempoAtendimento);

					cvalS = (cval.toString().length() == 0 ? "0,00" : cval)
							+ " %";

				} else {

					cval = getByTimeAndLocal(origList, colNames[col], null,
							"2".equals(index) ? "media_dias" : "count",
							isTempoAtendimento);

					cvalS = (cval.toString().length() == 0 ? (isTempoAtendimento ? "0,00"
							: "0")
							: cval)
							+ ("1".equals(index) || "4".equals(index) ? " %"
									: "");
				}
				sb.append(
						"<TD align='middle'><label tabindex=" + tabindex + ">")
						.append(cvalS).append("</label></TD>\n");

				sb.append("<script>");
				sb.append("adder.add('COUNT-DB-CONS', "
						+ (cval.toString().length() == 0 ? "0" : cval) + ");");
				sb.append("adder.add('COUNT-DB-CONS-DE', "
						+ (cvalDe.toString().length() == 0 ? "0" : cvalDe)
						+ ");");
				sb.append("</script>\n");

			}

			sb.append("\n</TR>");

		}

		if ("1".equals(index) || "4".equals(index)) {
			return sb.toString();
		}

		// Total begin
		int col = 0;
		sb.append("<TR>\n");

		// Agrupamento
		sb.append("<TD class='tdHeader3'><label tabindex=" + tabindex + ">")
				.append("Total").append("</label></TD>\n");

		// Digitado pelo usuário
		for (int row = 0; row < extraRows.length; row++) {
			valueStr = extraRows[row][col + 1];

			sb.append(
					"<TD class='tdHeader3' align='middle'><label tabindex="
							+ tabindex + ">")
					.append("<script>writeRounded(adder.getSum('COUNT-USER-"
							+ row + "'), 0, 6);</script>")
					.append("</label></TD>\n");

		}

		// Total
		// Banco de dados
		if (detailed) {
			for (int i = 0; i < locais.length; i++) {
				sb.append(
						"<TD class='tdHeader3' align='middle'><label tabindex="
								+ tabindex + ">")
						.append("<script>writeExtRounded('COUNT-DB-" + i
								+ "');</script>").append("</label></TD>\n");
			}

		} else {
			sb.append(
					"<TD class='tdHeader3' align='middle'><label tabindex="
							+ tabindex + ">")
					.append("<script>writeExtRounded('COUNT-DB-CONS');</script>")
					.append("</label></TD>\n");

		}

		sb.append("\n</TR>");

		return sb.toString();
	}

	private static String getByTimeAndLocal(List list, String time,
			String local, String colName, boolean showDecimalDigits) {

		if (time == null)
			return "time is null!!!";
		Object result;
		Map element;
		Object elTime;

		try {
			for (Iterator iter = list.iterator(); iter.hasNext();) {
				element = (Map) iter.next();
				elTime = element.get("time");

				if (elTime != null
						&& time.equals(elTime.toString())
						&& (local == null || local.equals(element
								.get("dsc_local_ocorr")))) {
					result = element.get(colName);
					return result == null ? "0" : formatNumber(result,
							showDecimalDigits);
				}

			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "";

	}

	static class ExtLabelGen implements CategoryLabelGenerator {

		private NumberFormat formatter;

		/**
         *
         */
		public ExtLabelGen(boolean showDecimalDigits) {
			this.formatter = showDecimalDigits ? ReportHelperExt.formatFloat
					: ReportHelperExt.formatInt;
		}

		public final String generateLabel(CategoryDataset dataset, int series,
				int category) {
			return "    "
					+ this.formatter.format(dataset.getValue(series, category));
		}

	}

	public static Object getDataSet(String index, String chart_type,
			boolean detailed, String timeDomain, String h_locais, Orgao orgao,
			String txt_periodo_i, String txt_periodo_f, String colNamesStr,
			String extraRowsStr) throws SQLException {

		boolean isNoPrazo = "4".equals(index);
		boolean isTempo = "1".equals(index) || "2".equals(index)
				|| "4".equals(index);

		String query = getQuery(index, chart_type, detailed, timeDomain,
				h_locais, orgao, txt_periodo_i, txt_periodo_f);

		if (extraRowsStr == null || colNamesStr == null)
			return ReportKit.getDataSet(chart_type, false, query, false);

		Object result = ReportKit.getDataSet(chart_type, true, null, false);

		Comparable loc = null;
		double value = 0;

		String[][] extraRows = DelimitedStringRecord
				.string2resultSetArray(extraRowsStr);
		String[] colNames = colNamesStr.split(",");

		String valueStr;

		if (result instanceof JDBCFlatCategoryDataset) {
			JDBCFlatCategoryDataset fcds = (JDBCFlatCategoryDataset) result;

			if (isNoPrazo)
				fcds.getColumnHelper().setCustomMapping(
						detailed ? new int[] { 2, 1, 3 }
								: new int[] { -1, 1, 3 });

			ExtLabelGen lg = new ExtLabelGen(isTempo);

			fcds.setLabelGenerator(lg);
			fcds.getColumnHelper().setDefaultRowKey(orgao.getDescricao());

			for (int row = 0; row < extraRows.length; row++) {

				String[] cols = extraRows[row];
				int colCount = cols.length;
				loc = cols[0];

				for (int col = 1; col < colCount; col++) {

					valueStr = cols[col];
					if (valueStr == null || valueStr.length() < 1)
						continue;

					value = Double.parseDouble(valueStr);

					if (detailed) {
						fcds.addValue(value, loc, colNames[col - 1]);
					} else {
						fcds.addValue(value, loc, colNames[col - 1]);
						fcds.addValue(0, orgao.getDescricao(),
								colNames[col - 1]);
					}

				}

			}

			fcds.setAppendMode(true);
			fcds.executeQuery(query, true);
			fcds.fillGaps();

		} else if (result instanceof EnhancedJDBCPieDataset) {
			EnhancedJDBCPieDataset pds = (EnhancedJDBCPieDataset) result;

			for (int row = extraRows.length - 1; row >= 0; row--) {

				String[] cols = extraRows[row];
				int colCount = cols.length;
				loc = cols[0];
				for (int col = 1; col < colCount; col++) {
					value = Double.parseDouble(cols[col]);
					pds.setValue(colNames[col - 1], value);

				}

			}

			pds.setAppendMode(true);
			pds.executeQuery(query, true);

		}

		return result;

	}

	public static String getQuery(HttpServletRequest request) {

		boolean detail = false;
		final DaoFactory daoFactory = new HibernateDaoFactory();
		if ("d".equalsIgnoreCase(request.getParameter("r_modo_exibicao")))
			detail = true;

		OrgaoCtrl orgaoCtrl = new OrgaoCtrl(daoFactory);

		Orgao orgao = (Orgao) orgaoCtrl.get((String) request.getSession()
				.getAttribute(Constants.ID_SESSAO_ORGAO));

		return getQuery(request.getParameter("sel_indicador"),
				request.getParameter("sel_tipo_grafico"), detail,
				request.getParameter("sel_agrupamento"),
				request.getParameter("h_locais"), orgao,
				request.getParameter("txt_periodo_i"),
				request.getParameter("txt_periodo_f"));

	}

	/**
	 * @param index
	 * @param chart_type
	 * @param detailed
	 * @param timeDomain
	 * @param h_locais
	 * @param orgao
	 * @param txt_periodo_i
	 * @param txt_periodo_f
	 * @return A query correspondente aos par&acirc;metros passados.
	 */
	public static String getQuery(String index, String chart_type,
			boolean detailed, String timeDomain, String h_locais, Orgao orgao,
			String txt_periodo_i, String txt_periodo_f) {

		final boolean isPie = chart_type.indexOf("pie") >= 0;

		final String baseQuery = ReportKit.getConfig().getString(
				"ie.select." + index);
		String groupBy = "";
		String orgaoField = detailed ? "" : "'" + orgao.getDescricao()
				+ "' as orgao, ";

		if (!isPie) {

			if ("2".equals(index))
				groupBy = " GROUP BY TIME";
			else if ("2".equals(index))
				groupBy = ", TIME";

		}

		String dateCrit = ReportKit.getDateCrit(txt_periodo_i, txt_periodo_f);
		String locCrit = ReportKit.getLocationCrit(h_locais);

		final String timeField = ReportKit.getConfig().getString(
				"ie.time." + timeDomain)
				+ ", ";

		String firstFields = timeField;
		String fromTable = ReportKit.getConfig().getString(
				"ie.from_tables." + index);

		if (detailed) {
			firstFields += (firstFields.length() > 0 ? " " : "")
					+ ReportKit.getConfig().getString("loco.fields") + ", ";
			fromTable += " "
					+ ReportKit.getConfig().getString("loco.left_join");
			groupBy += (groupBy.length() > 0 ? ", " : ", ")
					+ ReportKit.getConfig().getString("loco.fields");
		}

		String whereTable = ReportKit.getConfig().getString(
				"ie.where_tables." + index);

		String query;
		String subSelect;

		if ("4".equals(index)) {

			final String A_LOCO_DOT = "s/(\\s|\\(|^)(loco|a)([. ])/$1$2_in$3/ig";
			String locoDotProc = p5Util.substitute(A_LOCO_DOT,
					dateCrit.substring(5) + locCrit);

			subSelect = ReportKit.getConfig()
					.getString("ie.subselect." + index);

			subSelect = MessageFormat
					.format(subSelect,
							new Object[] {
									p5Util.substitute(A_LOCO_DOT, p5Util
											.substitute("s/\\sAS\\sTIME,//i",
													timeField)),
									detailed ? p5Util
											.substitute(
													"s/(a_in.COD_LOCAL_OCORR)\\s(IN \\(.*?\\))/$1 = a.COD_LOCAL_OCORR/",
													locoDotProc)
											: locoDotProc });

			query = MessageFormat.format(baseQuery, new Object[] { firstFields,
					fromTable, whereTable + dateCrit + locCrit, groupBy,
					subSelect });

		} else {

			query = MessageFormat
					.format(baseQuery,
							new Object[] {
									firstFields,
									fromTable,
									whereTable + dateCrit + locCrit,
									groupBy
											+ ("2".equals(index) ? " ORDER BY a.DAT_ACNMNT"
													: ""), orgaoField });

		}

		if ("1".equals(index)) {

			if (detailed) {
				query = " select a.time AS TIME, a.DSC_LOCAL_OCORR, round( (a.count / b.count) * 100, 2 ) AS COUNT from ( "
						+ query
						+ " ) as a, "
						+ " ( "
						+ " SELECT "
						+ firstFields
						+ " COUNT(a.COD_ACNMNT) AS COUNT "
						+ " FROM acionamento a LEFT JOIN localidadeocorrencia loco ON a.COD_LOCAL_OCORR = loco.COD_LOCAL_OCORR "
						+ " where 1=1"
						+ dateCrit
						+ locCrit
						+ " GROUP BY TIME, loco.DSC_LOCAL_OCORR"
						+ " ) as b "
						+ " where a.time = b.time and a.DSC_LOCAL_OCORR = b.DSC_LOCAL_OCORR";
			} else {
				query = " select a.time AS TIME, round( (a.count / b.count) * 100, 2 ) AS COUNT from ( "
						+ query
						+ " ) as a, "
						+ " ( "
						+ " SELECT "
						+ firstFields
						+ " COUNT(a.COD_ACNMNT) AS COUNT "
						+ " FROM acionamento a "
						+ " where 1=1"
						+ dateCrit
						+ locCrit
						+ " GROUP BY TIME "
						+ " ) as b "
						+ " where a.time = b.time ";
			}

		} else if ("4".equals(index)) {

			if (detailed) {
				query = " select a.time AS TIME, a.DSC_LOCAL_OCORR, round( (a.count_in / b.count) * 100, 2 ) AS COUNT_IN, b.count as COUNT from ( "
						+ query
						+ " ) as a, "
						+ " ( "
						+ " SELECT "
						+ firstFields
						+ " COUNT(a.COD_ACNMNT) AS COUNT "
						+ " FROM acionamento a LEFT JOIN localidadeocorrencia loco ON a.COD_LOCAL_OCORR = loco.COD_LOCAL_OCORR "
						+ " where 1=1"
						+ dateCrit
						+ locCrit
						+ " GROUP BY TIME, loco.DSC_LOCAL_OCORR "
						+ " ) as b "
						+ " where a.time = b.time and a.DSC_LOCAL_OCORR = b.DSC_LOCAL_OCORR";

			} else {
				query = " select a.time AS TIME, b.count as COUNT, round( (a.count_in / b.count) * 100, 2 ) AS COUNT_IN from ( "
						+ query
						+ " ) as a, "
						+ " ( "
						+ " SELECT "
						+ firstFields
						+ " COUNT(a.COD_ACNMNT) AS COUNT "
						+ " FROM acionamento a "
						+ " where 1=1"
						+ dateCrit
						+ locCrit
						+ " GROUP BY TIME "
						+ " ) as b "
						+ " where a.time = b.time ";
			}

		}

		return query;

	}

}