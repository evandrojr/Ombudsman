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
package br.gov.serpro.ouvidoria.util.freechart.data;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;

import org.jfree.chart.labels.PieSectionLabelGenerator;
import org.jfree.data.jdbc.JDBCPieDataset;

/**
 * @author SERPRO
 * @version $Revision: 1.1.2.1 $, $Date: 2011/10/21 18:47:37 $
 */
public class EnhancedJDBCPieDataset extends JDBCPieDataset {

	private static final long serialVersionUID = 1L;

	private JDBCColumnHelper columnHelper;
	private boolean appendMode;
	private boolean useFilter;
	private PieDatasetFilterListener filter;
	private PieSectionLabelGenerator labelGenerator;
	private double maxVal;
	private double grandTotal;

	public EnhancedJDBCPieDataset(Connection con) {
		super(con);
		init();
	}

	public EnhancedJDBCPieDataset(Connection con, String query)
			throws SQLException {
		this(con);
		executeQuery(query, true);
	}

	private void init() {
		columnHelper = JDBCColumnHelper.getInstance(this);
	}

	public final JDBCColumnHelper getColumnHelper() {
		return columnHelper;
	}

	public final double getMaxVal() {
		return maxVal;
	}

	public final double getGrandTotal() {
		return grandTotal;
	}

	public final boolean isAppendMode() {
		return appendMode;
	}

	public final void setAppendMode(boolean appendMode) {
		this.appendMode = appendMode;
	}

	public final PieSectionLabelGenerator getLabelGenerator() {
		return labelGenerator;
	}

	public final void setLabelGenerator(PieSectionLabelGenerator labelGenerator) {
		this.labelGenerator = labelGenerator;
	}

	public final PieDatasetFilterListener getFilter() {
		return filter;
	}

	public final void setFilter(PieDatasetFilterListener filter) {
		this.filter = filter;
		useFilter = filter != null;
	}

	public final boolean isUseFilter() {
		return useFilter;
	}

	public final void setUseFilter(boolean useFilter) {
		if (useFilter && filter == null) {
			throw new IllegalArgumentException("No filter set.");
		} else {
			this.useFilter = useFilter;
			return;
		}
	}

	public void executeQuery(String query) throws SQLException {
		executeQuery(query, false);
	}

	public void executeQuery(String query, boolean closeCon)
			throws SQLException {
		try {
			super.executeQuery(query);
		} finally {
			if (closeCon)
				close();
		}
		return;
	}

	public void executeQuery(Connection con, String query) throws SQLException {
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			statement = con.createStatement();
			resultSet = statement.executeQuery(query);
			loadFrom(resultSet);
		} finally {
			JDBCColumnHelper.closeQuietly(resultSet);
			JDBCColumnHelper.closeQuietly(statement);
		}
		return;
	}

	public void loadFrom(ResultSet resultSet) throws SQLException {
		Comparable rowKey = null;
		int indexes[] = new int[2];
		Comparable keys[] = new Comparable[1];
		ResultSetMetaData metaData = resultSet.getMetaData();
		try {
			columnHelper.computeIndexes(metaData.getColumnCount(), indexes,
					keys);
		} catch (IllegalArgumentException iae) {
			throw new SQLException(iae.getMessage());
		}
		int rowIndex = indexes[0];
		int valueIndex = indexes[1];
		rowKey = keys[0];
		int columnType = metaData.getColumnType(valueIndex);
		Number value;
		while (resultSet.next())
			if ((value = JDBCColumnHelper.asNumber(
					resultSet.getObject(valueIndex), columnType)) != null) {
				if (rowIndex > 0)
					rowKey = resultSet.getString(rowIndex);
				if (useFilter)
					value = filter.filterValue(rowKey, value, resultSet);
				double doubleVal = value.doubleValue();
				if (doubleVal > maxVal)
					maxVal = doubleVal;
				grandTotal += doubleVal;
				setValue(rowKey, value);
			}
		fireDatasetChanged();
	}
}
