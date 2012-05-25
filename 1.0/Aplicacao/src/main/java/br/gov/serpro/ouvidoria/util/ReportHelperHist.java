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
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.oro.text.perl.Perl5Util;
import org.jfree.chart.labels.CategoryLabelGenerator;
import org.jfree.chart.labels.PieSectionLabelGenerator;
import org.jfree.data.category.CategoryDataset;
import org.jfree.data.general.PieDataset;

import br.gov.serpro.ouvidoria.controller.gerencial.administracao.OrgaoCtrl;
import br.gov.serpro.ouvidoria.dao.DaoFactory;
import br.gov.serpro.ouvidoria.dao.hibernate.HibernateDaoFactory;
import br.gov.serpro.ouvidoria.model.Orgao;
import br.gov.serpro.ouvidoria.util.freechart.data.DBUtilsKit;
import br.gov.serpro.ouvidoria.util.freechart.data.EnhancedJDBCPieDataset;
import br.gov.serpro.ouvidoria.util.freechart.data.JDBCFlatCategoryDataset;
import br.gov.serpro.ouvidoria.util.freechart.data.PercentColumnFilter;
import br.gov.serpro.ouvidoria.util.freechart.data.PieDatasetFilterListener;
import br.gov.serpro.ouvidoria.util.freechart.data.StringKit;

/**
 * 
 * @author SERPRO
 * @version $Revision: 1.1.2.4 $, $Date: 2011/10/21 18:53:46 $
 * @version 0.1, Date: 2005/01/28
 */
public class ReportHelperHist {

	private final static Perl5Util p5Util = new Perl5Util();

	private static final class TotalQueryFilter extends PercentColumnFilter
			implements CategoryLabelGenerator, PieDatasetFilterListener,
			PieSectionLabelGenerator {

		private Map map = null;

		private NumberFormat formatter;

		public TotalQueryFilter(String totalField) {
			super(totalField);
			this.map = new HashMap();
			formatter = NumberFormat.getPercentInstance();
			formatter.setMinimumFractionDigits(2);
		}

		public final Number filterValue(Number value, Comparable rowKey,
				Comparable columnKey, Object data) {

			if (columnKey == null)
				columnKey = "";

			Number result = super.filterValue(value, rowKey, columnKey, data);

			if (result != PercentColumnFilter.DOUBLE_ZERO)
				this.map.put(rowKey.toString() + "|" + columnKey.toString(),
						this.formatter
								.format(((Double) result).doubleValue() / 100d)
								+ " (" + value.toString() + ")");

			return result;

		}

		public Number filterValue(Comparable key, Number value, Object data) {
			return filterValue(value, key, null, data);
		}

		public final String generateLabel(CategoryDataset dataset, int series,
				int category) {
			Object result = this.map.get(dataset.getRowKey(series).toString()
					+ "|" + dataset.getColumnKey(category).toString());
			return result == null ? "" : result.toString();
		}

		public String generateSectionLabel(PieDataset dataset, Comparable key) {
			Object result = this.map.get(key.toString() + "|");
			return result == null ? "" : result.toString();
		}

	}

	public static List getRecordList(HttpServletRequest request)
			throws SQLException {
		return getRecordList(request, "count");
	}

	public static List getRecordList(HttpServletRequest request,
			String totalField) throws SQLException {
		String query = getQuery(request);
		List result = DBUtilsKit.selectAsListMap(query);
		result.add(new Double(100f / ReportKit.getCountFromList(result,
				totalField)));
		return result;

	}

	public static Object getDataSet(String index, String[] sel_meio_envio,
			String chart_type, boolean detailed, String timeDomain,
			String h_locais, Orgao orgao, String txt_periodo_i,
			String txt_periodo_f, String i_local) throws SQLException {

		boolean isLine = chart_type.indexOf("line") >= 0;

		String query = getQuery(index, sel_meio_envio, chart_type, detailed,
				timeDomain, i_local == null || i_local.length() == 0 ? h_locais
						: i_local, orgao, txt_periodo_i, txt_periodo_f);

		boolean index1 = "1".equals(index);
		boolean index2 = "2".equals(index);
		boolean index4 = "4".equals(index);

		if (index1) {

			Object ds = ReportKit.getDataSet(chart_type, false, null, false);

			if (ds instanceof EnhancedJDBCPieDataset) {
				EnhancedJDBCPieDataset pds = (EnhancedJDBCPieDataset) ds;
				pds.getColumnHelper().setCustomMapping(new int[] { 1, 4 });
				TotalQueryFilter tqf = new TotalQueryFilter("AVALIADOS");
				pds.setFilter(tqf);
				pds.setLabelGenerator(tqf);
				pds.executeQuery(query, true);
				return ds;
			}

			JDBCFlatCategoryDataset dataSet = (JDBCFlatCategoryDataset) ds;
			// TIME LOCAL RESPONDIDOS AVALIADOS SATISFATORIOS
			dataSet.getColumnHelper().setCustomMapping(
					detailed ? (!isLine ? new int[] { 2, 1, 5 } : new int[] {
							2, 1, 5 }) : (isLine ? new int[] { -1, 1, 4 }
							: new int[] { 1, -2, 4 }));

			TotalQueryFilter tqf = new TotalQueryFilter("AVALIADOS");
			dataSet.setFilter(tqf);
			dataSet.setLabelGenerator(tqf);

			dataSet.executeQuery(query, true);
			dataSet.fillGaps();
			return dataSet;

		} else if (index4) {
			Object ds = ReportKit.getDataSet(chart_type, false, null, false);

			if (ds instanceof EnhancedJDBCPieDataset) {
				EnhancedJDBCPieDataset pds = (EnhancedJDBCPieDataset) ds;
				pds.getColumnHelper().setCustomMapping(new int[] { 1, 3 });
				TotalQueryFilter tqf = new TotalQueryFilter("COUNT");
				pds.setFilter(tqf);
				pds.setLabelGenerator(tqf);
				pds.executeQuery(query, true);
				return ds;
			}

			JDBCFlatCategoryDataset dataSet = (JDBCFlatCategoryDataset) ds;
			// TIME LOCAL RESPONDIDOS AVALIADOS SATISFATORIOS
			dataSet.getColumnHelper().setCustomMapping(
					detailed ? (!isLine ? new int[] { 2, 1, 4 } : new int[] {
							2, 1, 4 }) : (isLine ? new int[] { -1, 1, 3 }
							: new int[] { 1, -2, 3 }));

			TotalQueryFilter tqf = new TotalQueryFilter("COUNT");
			dataSet.setFilter(tqf);
			dataSet.setLabelGenerator(tqf);

			dataSet.executeQuery(query, true);
			dataSet.fillGaps();
			return dataSet;

		} else if (index2) {

			Object ds = ReportKit.getDataSet(chart_type, false, null, false);

			if (ds instanceof EnhancedJDBCPieDataset) {
				EnhancedJDBCPieDataset pds = (EnhancedJDBCPieDataset) ds;
				pds.getColumnHelper().setCustomMapping(new int[] { 1, 3 });
				pds.executeQuery(query, true);
				return ds;
			}

		}

		return ReportKit.getDataSet(chart_type, (detailed || index2)
				|| chart_type.indexOf("line") >= 0, query, true);

	}

	public static String getQuery(HttpServletRequest request) {

		boolean detail = false;
		final DaoFactory daoFactory = new HibernateDaoFactory();

		if ("d".equalsIgnoreCase(request.getParameter("r_modo_exibicao")))
			detail = true;

		OrgaoCtrl orgaoCtrl = new OrgaoCtrl(daoFactory);

		Orgao orgao = (Orgao) orgaoCtrl.get((String) request.getSession()
				.getAttribute(Constants.ID_SESSAO_ORGAO));


		return getQuery(request.getParameter("sel_indicador"), request
				.getParameterValues("sel_meio_envio"), request
				.getParameter("sel_tipo_grafico"), detail, request
				.getParameter("sel_agrupamento"), request
				.getParameter("h_locais"), orgao, request
				.getParameter("txt_periodo_i"), request
				.getParameter("txt_periodo_f"));

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
	public static String getQuery(String index, String[] sel_meio_envio,
			String chart_type, boolean detailed, String timeDomain,
			String h_locais, Orgao orgao, String txt_periodo_i,
			String txt_periodo_f) {

		/*
		 * # {0} = TIME # {1} = TIME (if detailed, add 'loco.fields,') # {2} =
		 * from_tables (if detailed, add loco.left_join) # {3} = where_tables #
		 * {4} = date local # {5} = group_by (add time_domain. if detailed, add
		 * ',loco.fields') # {6} = date local a_in # {7} = date local a_in2 #
		 * {8} = {time match} = TIME {AND a_in.COD_LOCAL_OCORR =
		 * a.COD_LOCAL_OCORR} a_in # {9} = {time match} = TIME {AND
		 * a_in2.COD_LOCAL_OCORR = a.COD_LOCAL_OCORR} a_in2
		 * 
		 * ih.select.1=SELECT {1} COUNT(a.COD_ACNMNT) AS COUNT\,\ \ (SELECT
		 * COUNT(a.COD_ACNMNT) FROM acionamento a_in\, respostaacionamento
		 * r_in\, tipoavaliacaoresposta t_in\ \ WHERE a_in.COD_RESP =
		 * r_in.COD_RESP AND r_in.COD_TIPO_AVAL_RESP = t_in.COD_TIPO_AVAL_RESP \ \
		 * AND {6} \ \ AND {8} \) AS AVALIADOS\,\ \ (SELECT COUNT(a.COD_ACNMNT)
		 * FROM acionamento a_in2\, respostaacionamento r_in2\,
		 * tipoavaliacaoresposta t_in2\ \ WHERE a_in2.COD_RESP = r_in2.COD_RESP
		 * AND r_in2.COD_TIPO_AVAL_RESP = t_in2.COD_TIPO_AVAL_RESP \ \ {7} \ \
		 * AND t_in2.IND_TIPO_AVAL_RESP = 'P'\ \ AND {9} \) AS SATISFATORIOS\ \
		 * FROM acionamento a\, estadoacionamento e {1}\ \ WHERE {4} {3} GROUP
		 * BY TIME{5} ih.from_tables.1= ih.where_tables.1=a.COD_ESTADO_ACNMNT =
		 * e.COD_ESTADO_ACNMNT AND e.COD_ESTADO_ACNMNT IN (5\, 6)
		 * 
		 * 
		 * #ie.select.2=SELECT {0}{4} SUM( DATEDIFF(r.DAT_ENVIO_RESP\,
		 * r.DAT_RESP_ACNMNT) ) / COUNT(a.COD_ACNMNT) AS MEDIA_DIAS\,
		 * COUNT(a.COD_ACNMNT) AS COUNT\ #\ FROM acionamento a {1} WHERE {2}{3}
		 * #ie.from_tables.2=\, estadoacionamento e\, respostaacionamento r \,
		 * acionador u \, meioenvioresposta m
		 * #ie.where_tables.2=a.COD_ESTADO_ACNMNT = e.COD_ESTADO_ACNMNT AND
		 * a.COD_RESP = r.COD_RESP AND a.COD_ACNDOR = u.COD_ACNDOR\ #\ AND
		 * u.COD_MEIO_ENVIO_RESP_ORGAO = m.COD_MEIO_ENV_RESP AND
		 * e.COD_ESTADO_ACNMNT = 6 AND m.COD_MEIO_ENV_RESP IN (4\, 5\, 3)
		 */

		final String baseQuery = ReportKit.getConfig().getString(
				"ih.select." + index);
		String groupBy = "";
		String orgaoField = !detailed && "2".equals(index) ? "'"
				+ orgao.getDescricao() + "' as orgao, " : "";

		if ("2".equals(index))
			groupBy = " GROUP BY TIME";

		String dateCrit = ReportKit.getDateCrit(txt_periodo_i, txt_periodo_f);
		String locCrit = ReportKit.getLocationCrit(h_locais);

		final String timeField = ReportKit.getConfig().getString(
				"ie.time." + timeDomain)
				+ ", ";

		String firstFields = timeField;

		String fromTable = ReportKit.getConfig().getString(
				"ih.from_tables." + index);

		if (detailed) {
			firstFields += (firstFields.length() > 0 ? " " : "")
					+ ReportKit.getConfig().getString("loco.fields") + ", ";
			fromTable += " "
					+ ReportKit.getConfig().getString("loco.left_join");
			groupBy += (groupBy.length() > 0 ? ", " : ", ")
					+ ReportKit.getConfig().getString("loco.fields");
		}

		String whereTable = ReportKit.getConfig().getString(
				"ih.where_tables." + index);

		String query;
		String subSelect;

		if ("1".equals(index)) {
			/*
			 * # {5} = group_by (add time_domain. if detailed, add
			 * ',loco.fields') # {6} = date local a_in # {7} = date local a_in2 #
			 * {8} = {time match} = TIME {AND a_in.COD_LOCAL_OCORR =
			 * a.COD_LOCAL_OCORR} a_in # {9} = {time match} = TIME {AND
			 * a_in2.COD_LOCAL_OCORR = a.COD_LOCAL_OCORR} a_in2
			 * 
			 * subSelect = MessageFormat.format(subSelect, new Object[] {
			 * p5Util.substitute(A_LOCO_DOT,
			 * p5Util.substitute("s/\\sAS\\sTIME,//i", timeField)), detailed ?
			 * p5Util.substitute("s/(a_in.COD_LOCAL_OCORR)\\s(IN \\(.*?\\))/$1 =
			 * a.COD_LOCAL_OCORR/", locoDotProc) : locoDotProc });
			 * 
			 */
			final String A_LOCO_DOT = "s/(\\s|\\(|^)(loco|a)([. ])/$1$2_in$3/ig";
			final String A_LOCO_DOT2 = "s/(\\s|\\(|^)(loco|a)([. ])/$1$2_in2$3/ig";

			String locoDotProc = p5Util.substitute(A_LOCO_DOT, dateCrit
					.substring(5)
					+ locCrit);
			String locoDotProc2 = p5Util.substitute(A_LOCO_DOT2, dateCrit
					.substring(5)
					+ locCrit);

			query = MessageFormat
					.format(
							baseQuery,
							new Object[] {
									timeField,
									firstFields,
									fromTable,
									whereTable,
									dateCrit + locCrit,
									groupBy,
									detailed ? p5Util
											.substitute(
													"s/(a_in.COD_LOCAL_OCORR)\\s(IN \\(.*?\\))/$1 = a.COD_LOCAL_OCORR/",
													locoDotProc)
											: locoDotProc,
									detailed ? p5Util
											.substitute(
													"s/(a_in2.COD_LOCAL_OCORR)\\s(IN \\(.*?\\))/$1 = a.COD_LOCAL_OCORR/",
													locoDotProc2)
											: locoDotProc2,
									p5Util.substitute(A_LOCO_DOT, p5Util
											.substitute("s/\\sAS\\sTIME,//i",
													timeField))
											+ "= TIME",
									p5Util.substitute(A_LOCO_DOT2, p5Util
											.substitute("s/\\sAS\\sTIME,//i",
													timeField))
											+ "= TIME" });

		} else if ("4".equals(index)) {
			/*
			 * # {4} = subquery # TOTAL DE ATENDIMENTOS NO PRAZO # SELECT
			 * time_domain, COUNT(a.COD_ACNMNT) AS COUNT GROUP BY time_domain
			 * ih.select.4=SELECT {0} COUNT(a.COD_ACNMNT) AS COUNT\, ({4}) AS
			 * COUNT_IN FROM acionamento a {1} WHERE {2} GROUP BY TIME{3}
			 * ih.subselect.4=SELECT COUNT(a_in.COD_ACNMNT) FROM acionamento
			 * a_in\ \ WHERE a_in.IND_ATEND_PRAZO = ''1'' AND {0} = TIME AND {1}
			 * ih.from_tables.4= ih.where_tables.4=1=1
			 * 
			 * String subQuery =
			 * MessageFormat.format(ReportKit.getConfig().getString("if.base_subquery"),
			 * new Object[] { detailed ? " " + p5Util.substitute(A_LOCO_DOT,
			 * ReportKit.getConfig().getString("loco.left_join")) : "",
			 * p5Util.substitute(A_LOCO_DOT, dateCrit.substring(5) + locCrit),
			 * p5Util.substitute(A_LOCO_DOT,
			 * p5Util.substitute("s/\\sAS\\sTIME,//i", timeField)), detailed ? "
			 * and loco_in.DSC_LOCAL_OCORR = " +
			 * ReportKit.getConfig().getString("loco.fields") : "" });
			 * 
			 */

			final String A_LOCO_DOT = "s/(\\s|\\(|^)(loco|a)([. ])/$1$2_in$3/ig";
			String locoDotProc = p5Util.substitute(A_LOCO_DOT, dateCrit
					.substring(5)
					+ locCrit);

			subSelect = ReportKit.getConfig()
					.getString("ie.subselect." + index);
			subSelect = MessageFormat
					.format(
							subSelect,
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

			String meios = "";

			if (sel_meio_envio != null && sel_meio_envio.length > 0) {
				
				meios = "m.COD_MEIO_ENV_RESP IN ("+ StringKit.join(sel_meio_envio) + ") AND ";
			}

			query = MessageFormat.format(baseQuery, new Object[] {
					firstFields,
					fromTable,
					("2".equals(index) ? meios : "") + whereTable + dateCrit
							+ locCrit,
					groupBy
							+ ("2".equals(index) ? " ORDER BY a.DAT_ACNMNT"
									: ""), orgaoField });

		}

		return query;
	}

}