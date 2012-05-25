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

import java.net.URL;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Comparator;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.commons.configuration.Configuration;
import org.apache.commons.configuration.ConfigurationException;
import org.apache.commons.configuration.PropertiesConfiguration;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.log4j.Logger;

import br.gov.serpro.ouvidoria.util.collection.ListArrayTable;
import br.gov.serpro.ouvidoria.util.date.DateKit;
import br.gov.serpro.ouvidoria.util.freechart.data.DBUtilsKit;
import br.gov.serpro.ouvidoria.util.freechart.data.EnhancedJDBCPieDataset;
import br.gov.serpro.ouvidoria.util.freechart.data.JDBCFlatCategoryDataset;
import br.gov.serpro.ouvidoria.util.freechart.data.QueryKit;
import br.gov.serpro.ouvidoria.util.freechart.data.StringKit;

/**
 * 
 * @author SERPRO
 * @version $Revision: 1.1.2.6 $, $Date: 2011/11/07 12:42:44 $
 * @version 0.1, Date: 2005/01/28
 */
public final class ReportKit {
	
	static final Log log = LogFactory.getLog(ReportKit.class); 

	static final String CHART_COLORS = "chart.colors";

	static final String TABLE_LIST = "ii.table.names";

	static final String II_COMBO_QUERY = "ii.combo_query.";

	static final String SEL_TABELA = "sel_tabela";

	static final String II_FROM_TABLES = "ii.from_tables.";

	static final String II_WHERE_TABLES = "ii.where_tables.";

	static final String II_COD_INSTIT_TABLES = "ii.cod_instit_tables";

	private static Configuration config;

	private ReportKit() {
		// DO NOTHING
	}

	static Configuration getConfig() {

		if (config != null) {
			log.info("----------- > CONFIG no reportKit:" + config);
			return config;
		}

		try {
			log.info("------------>>CONFIG no reportKit, dentro do try:"
					+ config);
			config = getSingleConfiguration("report-config.properties");
			log.info("Config : " + config);
			DBUtilsKit.init(config);
		} catch (ConfigurationException e) {
			e.printStackTrace();
		}

		return config;

	}

	private static Configuration getSingleConfiguration(String configStr)
			throws ConfigurationException {
		//URL configURL = ReportHelperInt.class.getResource(configStr);
		String configPath = "/" + configStr;
		URL configURL = Thread.currentThread().getContextClassLoader().getResource(configPath);
		log.info("configURL: " + configURL);
		if (configURL == null) {
			throw new ConfigurationException(
					"Não foi possível achar o recurso '" + configStr + "'.");
		}

		PropertiesConfiguration config = new PropertiesConfiguration(configURL);
		log.debug("Config loaded: " + config);
		return config;
	}

	public static String[] getColorList() {
		return getConfig().getStringArray(ReportKit.CHART_COLORS);
	}

	static String getDateCrit(String txt_periodo_i, String txt_periodo_f) {

		boolean isNullI = txt_periodo_i == null || txt_periodo_i.length() < 1;
		boolean isNullF = txt_periodo_f == null || txt_periodo_f.length() < 1;

		if (isNullI && isNullF)
			return "";

		if (!(isNullI || isNullF))
			return " AND a.DAT_ACNMNT BETWEEN '"
					+ DateKit.convertPtBr2ISO8601Date(txt_periodo_i, "/", "-")
					+ "' AND '"
					+ DateKit.convertPtBr2ISO8601Date(txt_periodo_f, "/", "-")
					+ " 23:59:59'";

		if (isNullI)
			return " AND a.DAT_ACNMNT <= '"
					+ DateKit.convertPtBr2ISO8601Date(txt_periodo_f, "/", "-")
					+ " 23:59:59'";

		return " AND a.DAT_ACNMNT >= '"
				+ DateKit.convertPtBr2ISO8601Date(txt_periodo_i, "/", "-")
				+ "'";

	}

	static String getDateCritUnion(String txt_periodo_i, String txt_periodo_f) {

		boolean isNullI = txt_periodo_i == null || txt_periodo_i.length() < 1;
		boolean isNullF = txt_periodo_f == null || txt_periodo_f.length() < 1;

		if (isNullI && isNullF)
			return "";

		if (!(isNullI || isNullF))
			return " atend.DAT_ATEND BETWEEN '"
					+ DateKit.convertPtBr2ISO8601Date(txt_periodo_i, "/", "-")
					+ "' AND '"
					+ DateKit.convertPtBr2ISO8601Date(txt_periodo_f, "/", "-")
					+ " 23:59:59'";

		if (isNullI)
			return " atend.DAT_ATEND <= '"
					+ DateKit.convertPtBr2ISO8601Date(txt_periodo_f, "/", "-")
					+ " 23:59:59'";

		return " atend.DAT_ATEND >= '"
				+ DateKit.convertPtBr2ISO8601Date(txt_periodo_i, "/", "-")
				+ "'";

	}

	static String getLocationCrit(String locais_ocorrencia) {
		return getLocationCrit(locais_ocorrencia == null ? null
				: locais_ocorrencia.split(","));
	}

	/**
	 * @return
	 */
	static String getLocationCrit(String[] locais_ocorrencia) {
		return locais_ocorrencia == null || locais_ocorrencia.length < 1 ? ""
				: " AND a.COD_LOCAL_OCORR IN ("
						+ StringKit.join(locais_ocorrencia, ",") + ")";
	}

	public static String getLocationCaption(String id) throws SQLException {
		String query = "select DSC_LOCAL_OCORR from localidadeocorrencia where COD_LOCAL_OCORR = "
				+ id;
		return DBUtilsKit.selectAsArray(query)[0].toString();
	}

	public static ListArrayTable getLocationNames(String ids)
			throws SQLException {
		String query = "select COD_LOCAL_OCORR, DSC_LOCAL_OCORR from localidadeocorrencia where COD_LOCAL_OCORR in ("
				+ ids + ") order by COD_LOCAL_OCORR";
		Comparator comparator = new Comparator() {

			public final int compare(Object pO1, Object pO2) {

				Object o1 = ((Object[]) pO1)[0];
				Object o2 = ((Object[]) pO2)[0];

				if (o1 instanceof String)
					o1 = new Integer(o1.toString());

				if (o2 instanceof String)
					o2 = new Integer(o2.toString());

				return ((Comparable) o1).compareTo(o2);

			}
		};

		return DBUtilsKit.selectAsListArrayTable(query, comparator);
	}

	public static String getLocationCaptions(String ids) throws SQLException {
		String query = "select i.DSC_INSTIT, l.DSC_LOCAL_OCORR from localidadeocorrencia l join instituicao i on i.cod_instit = l.cod_instit where l.COD_LOCAL_OCORR in ("
				+ ids + ") order by i.DSC_INSTIT, l.DSC_LOCAL_OCORR";
		StringBuffer sb = new StringBuffer(1024);
		List list = DBUtilsKit.selectAsListArray(query);
		Object[] el;
		String lastInst = null;

		for (Iterator iter = list.iterator(); iter.hasNext();) {

			el = (Object[]) iter.next();

			if (!el[0].equals(lastInst)) {
				sb.append("<br/>").append(lastInst = (String) el[0])
						.append(": ");
			}

			sb.append(el[1]).append(", ");

		}
		sb.setLength(sb.length() - 2);
		return sb.toString();
	}

	/**
	 * @param chart_type
	 * @param transpose
	 * @param query
	 * @param normalizeOnGrandTotalPercent
	 * @return
	 * @throws SQLException
	 */
	static Object getDataSet(String chart_type, boolean transpose,
			String query, boolean normalizeOnGrandTotalPercent)
			throws SQLException {

		Connection con = DBUtilsKit.getDataSource().getConnection();

		try {

			if (chart_type.indexOf("pie") >= 0) {
				EnhancedJDBCPieDataset epds = new EnhancedJDBCPieDataset(con);
				if (query != null)
					epds.executeQuery(query);

				return epds;
			}

			JDBCFlatCategoryDataset flatCategoryDataset = new JDBCFlatCategoryDataset(
					con);
			flatCategoryDataset.getColumnHelper().setDefaultRowKey("Total");
			flatCategoryDataset.getColumnHelper().setDefaultColumnKey("Total");
			flatCategoryDataset.setTranspose(transpose);

			if (query != null) {

				flatCategoryDataset.executeQuery(query, true);

				if (normalizeOnGrandTotalPercent) {
					flatCategoryDataset.normalizeOnGrandTotalPercent();
				}

				flatCategoryDataset.fillGaps();

			}
			return flatCategoryDataset;

		} finally {
			if (con != null && query != null)
				try {
					con.close();
				} catch (Exception e) {
					// DO NOTHING
				}

		}

	}

	static int getCountFromList(List list) {
		return getCountFromList(list, "count");
	}

	static int getCountFromList(List list, String column) {

		int result = 0;

		for (Iterator iter = list.iterator(); iter.hasNext();) {
			Map element = (Map) iter.next();
			if (element == null)
				continue;
			Number n = (Number) element.get(column);
			if (n == null)
				continue;
			result += n.intValue();
		}

		return result;

	}

	public static boolean getExistsFromQuery(String query) throws SQLException {

		if (query == null)
			return false;

		String existsQuery = QueryKit.asExistsQuery(query);

		try {
			return "1".equals(DBUtilsKit.selectAsArray(existsQuery)[0]
					.toString());

		} catch (NumberFormatException e) {
			SQLException sqle = new SQLException();
			sqle.initCause(e);
			throw sqle;
		}

	}

	/**
	 * @param list
	 * @param sb
	 */
	static void toJSArray(Iterator iter, StringBuffer sb) {
		// [ [1, 'Avaliação boa'], [2, 'Avalia&ccedil;&atilde;o ruim'] ]

		String idKey = "id";
		String descKey = "descricao";

		sb.append("[ ");
		ReportKit.mapList2String(iter, idKey, descKey, sb);
		sb.append(" ]");

	}

	/**
	 * @param iter
	 * @param idKey
	 * @param descKey
	 * @param sb
	 */
	static void mapList2String(Iterator iter, String idKey, String descKey,
			StringBuffer sb) {

		while (iter.hasNext()) {

			Map el = (Map) iter.next();
			if (!el.get(idKey).equals("")) {
				Object elID = el.get(idKey);

				sb.append("[");

				if (elID instanceof String)
					sb.append("'").append(elID).append("'");
				else
					sb.append(elID);

				sb.append(",'").append(el.get(descKey)).append("'],");

			}

		}

		sb.setLength(sb.length() - 1);

	}

}