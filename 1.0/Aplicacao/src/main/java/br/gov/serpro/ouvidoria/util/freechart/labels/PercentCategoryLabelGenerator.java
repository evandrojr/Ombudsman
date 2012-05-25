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
package br.gov.serpro.ouvidoria.util.freechart.labels;

import java.text.MessageFormat;
import java.text.NumberFormat;

import org.jfree.chart.labels.CategoryLabelGenerator;
import org.jfree.data.category.CategoryDataset;

import br.gov.serpro.ouvidoria.util.freechart.data.DataKit;

/**
 * @author SERPRO
 * @version $Revision: 1.1.2.1 $, $Date: 2011/10/21 18:47:37 $
 */
public class PercentCategoryLabelGenerator implements CategoryLabelGenerator {

	public static final int GRAND_TOTAL_BASED = 0;
	public static final int CATEGORY_BASED = 1;
	public static final int SERIES_BASED = 2;
	public static final int FIXED = 3;
	private int basedOn;
	private double constantBase;
	private NumberFormat valueFormatter;
	private NumberFormat percentFormatter;
	private static Object formatArray[] = new Object[2];
	private String formatString;

	public PercentCategoryLabelGenerator(CategoryDataset dataset) {
		this(DataKit.calculateGrandTotal(dataset));
	}

	public PercentCategoryLabelGenerator(double constantBase) {
		this(3);
		this.constantBase = constantBase;
	}

	public PercentCategoryLabelGenerator(int basedOn) {
		valueFormatter = NumberFormat.getNumberInstance();
		percentFormatter = NumberFormat.getPercentInstance();
		formatString = "{0} ({1}%)";
		this.basedOn = basedOn;
	}

	public final NumberFormat getValueFormatter() {
		return valueFormatter;
	}

	public final void setValueFormatter(NumberFormat valueFormatter) {
		this.valueFormatter = valueFormatter;
	}

	public final NumberFormat getPercentFormatter() {
		return percentFormatter;
	}

	public final void setPercentFormatter(NumberFormat formatter) {
		percentFormatter = formatter;
	}

	public final String getFormatString() {
		return formatString;
	}

	public final void setFormatString(String formatString) {
		this.formatString = formatString;
	}

	public String generateLabel(CategoryDataset dataset, int series,
			int category) {
		String result = null;
		double base;
		switch (basedOn) {
		case 0: // '\0'
			base = DataKit.calculateGrandTotal(dataset);
			break;

		case 1: // '\001'
			base = DataKit.calculateCategoryTotal(dataset, category);
			break;

		case 2: // '\002'
			base = DataKit.calculateSeriesTotal(dataset, series);
			break;

		case 3: // '\003'
			base = constantBase;
			break;

		default:
			base = 1.0D;
			break;
		}
		Number value = dataset.getValue(series, category);
		if (value != null) {
			double v = value.doubleValue();
			synchronized (formatArray) {
				formatArray[0] = valueFormatter.format(v);
				formatArray[1] = percentFormatter.format(v / base);
				result = MessageFormat.format(formatString, formatArray);
				formatArray[0] = null;
				formatArray[1] = null;
			}
		}
		return result;
	}
}
