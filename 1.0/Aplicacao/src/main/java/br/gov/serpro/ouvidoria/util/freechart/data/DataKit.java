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

import org.jfree.data.category.CategoryDataset;

/**
 * @author SERPRO
 * @version $Revision: 1.1.2.1 $, $Date: 2011/10/21 18:47:37 $
 */
public class DataKit {

	public DataKit() {
	}

	public static double calculateGrandTotal(CategoryDataset dataset) {
		double result = 0.0D;
		for (int column = dataset.getColumnCount() - 1; column >= 0; column--) {
			for (int row = dataset.getRowCount() - 1; row >= 0; row--) {
				Number value = dataset.getValue(row, column);
				if (value != null)
					result += value.doubleValue();
			}

		}

		return result;
	}

	public static double calculateSeriesTotal(CategoryDataset dataset,
			int series) {
		double result = 0.0D;
		for (int column = dataset.getColumnCount() - 1; column >= 0; column--) {
			Number value = dataset.getValue(series, column);
			if (value != null)
				result += value.doubleValue();
		}

		return result;
	}

	public static double calculateCategoryTotal(CategoryDataset dataset,
			int category) {
		double result = 0.0D;
		for (int row = dataset.getRowCount() - 1; row >= 0; row--) {
			Number value = dataset.getValue(row, category);
			if (value != null)
				result += value.doubleValue();
		}

		return result;
	}
}
