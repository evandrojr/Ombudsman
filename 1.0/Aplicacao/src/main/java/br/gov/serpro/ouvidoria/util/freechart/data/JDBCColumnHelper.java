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

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.Statement;

import org.jfree.data.general.AbstractDataset;
import org.jfree.data.general.PieDataset;
import org.jfree.data.jdbc.JDBCCategoryDataset;
import org.jfree.data.jdbc.JDBCPieDataset;

/**
 * Classe utilizada para geração de gráficos com jFreechart
 * 
 * @author SERPRO
 * @version $Revision: 1.1.2.1 $, $Date: 2011/10/21 18:47:36 $
 * 
 */
public class JDBCColumnHelper {

	public static final JDBCColumnHelper getInstance(JDBCCategoryDataset ds) {
		return new JDBCColumnHelper(ds, ds.getTranspose());
	}

	public static final JDBCColumnHelper getInstance(JDBCPieDataset ds) {
		return new JDBCColumnHelper(ds, false);
	}

	private JDBCColumnHelper() {
		defaultRowKey = "Category 1";
		defaultColumnKey = "Series 1";
	}

	private JDBCColumnHelper(AbstractDataset dataset, boolean transpose) {
		defaultRowKey = "Category 1";
		defaultColumnKey = "Series 1";
		this.dataset = dataset;
		isPie = dataset instanceof PieDataset;
		setTranspose(transpose);
		defaultKeyMappings = getDefaultKeyMappings();
	}

	public final boolean isTranspose() {
		return transpose;
	}

	public final void setTranspose(boolean transpose) {
		this.transpose = transpose;
	}

	public final void setCustomMapping(int customMapping[]) {
		this.customMapping = customMapping;
	}

	public final int[] getCustomMapping() {
		return customMapping;
	}

	public final Comparable getDefaultColumnKey() {
		return defaultColumnKey;
	}

	public final void setDefaultColumnKey(Comparable defaultColumnKey) {
		this.defaultColumnKey = defaultColumnKey;
		defaultKeyMappings = getDefaultKeyMappings();
	}

	public final Comparable getDefaultRowKey() {
		return defaultRowKey;
	}

	public final void setDefaultRowKey(Comparable defaultRowKey) {
		this.defaultRowKey = defaultRowKey;
		defaultKeyMappings = getDefaultKeyMappings();
	}

	public final void computeIndexes(int columnCount, int indexes[],
			Comparable keys[]) throws IllegalArgumentException {
		if (columnCount <= 0)
			throw new IllegalArgumentException(
					"Zero columns returned from the database.");
		boolean transpose = isTranspose();
		boolean isPie = this.isPie;
		int nColCount = (columnCount <= 2 ? columnCount : 3) - 1;
		System.arraycopy(
				customMapping != null ? ((Object) (customMapping))
						: ((Object) ((isPie ? DEFAULT_MAPPINGS_PIE
								: DEFAULT_MAPPINGS)[transpose ? 1 : 0][nColCount])),
				0, indexes, 0, isPie ? 2 : 3);
		if (nColCount < 2 || customMapping != null)
			System.arraycopy(
					customMapping != null ? ((Object) (getKeyMapping(customMapping)))
							: ((Object) (defaultKeyMappings[transpose ? 1 : 0][nColCount])),
					0, keys, 0, isPie ? 1 : 2);
	}

	private Comparable getDefaultKey(int i) {
		switch (i) {
		case -1:
			return defaultRowKey;

		case -2:
			return defaultColumnKey;
		}
		return null;
	}

	private Comparable[] getKeyMapping(int customMapping[]) {
		Comparable result[] = { getDefaultKey(customMapping[0]),
				getDefaultKey(customMapping[1]) };
		return result;
	}

	private Comparable[][][] getDefaultKeyMappings() {
		return (new Comparable[][][] {
				new Comparable[][] {
						new Comparable[] { defaultRowKey, defaultColumnKey },
						new Comparable[] { "0", defaultColumnKey } },
				new Comparable[][] {
						new Comparable[] { defaultColumnKey, defaultRowKey },
						new Comparable[] { defaultRowKey, "0" } } });
	}

	public static final Number asNumber(Object obj, int columnType) {
		switch (columnType) {
		case -6:
		case -5:
		case 2: // '\002'
		case 3: // '\003'
		case 4: // '\004'
		case 5: // '\005'
		case 6: // '\006'
		case 7: // '\007'
		case 8: // '\b'
			return (Number) obj;

		case 91: // '['
		case 92: // '\\'
		case 93: // ']'
			return new Long(((Date) obj).getTime());

		case -1:
		case 1: // '\001'
		case 12: // '\f'
			try {
				return Double.valueOf((String) obj);
			} catch (NumberFormatException e) {
				return null;
			}
		}
		return null;
	}

	public static final void closeQuietly(Statement statement) {
		if (statement == null)
			return;
		try {
			statement.close();
		} catch (Exception exception) {
		}
	}

	public static final void closeQuietly(ResultSet resultSet) {
		if (resultSet == null)
			return;
		try {
			resultSet.close();
		} catch (Exception exception) {
		}
	}

	protected AbstractDataset dataset;
	private boolean isPie;
	protected boolean transpose;
	private int customMapping[];
	private static final int DEFAULT_MAPPINGS[][][] = {
			{ { -1, -2, 1 }, { 1, -2, 2 }, { 1, 2, 3 } },
			{ { -2, -1, 1 }, { -1, 1, 2 }, { 2, 1, 3 } } };
	private static final int DEFAULT_MAPPINGS_PIE[][][] = {
			{ { -1, 1 }, { 1, 2 } }, { { 1, -1 }, { 2, 1 } } };
	private Comparable defaultKeyMappings[][][];
	private Comparable defaultRowKey;
	private Comparable defaultColumnKey;

}