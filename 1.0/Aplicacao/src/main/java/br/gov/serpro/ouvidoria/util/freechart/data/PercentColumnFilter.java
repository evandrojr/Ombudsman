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

import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * @author SERPRO
 * @version $Revision: 1.1.2.1 $, $Date: 2011/10/21 18:47:36 $
 */
public class PercentColumnFilter implements CategoryDatasetFilterListener {

	public PercentColumnFilter(String totalField) {
		this.totalField = totalField;
	}

	public Number filterValue(Number value, Comparable rowKey,
			Comparable columnKey, Object data) {
		double total;
		try {
			total = ((ResultSet) data).getDouble(totalField);
		} catch (SQLException e) {
			e.printStackTrace();
			total = -100D;
		}
		double p = value.doubleValue();
		return p != 0.0D ? new Double((100D * p) / total) : DOUBLE_ZERO;
	}

	protected String totalField;
	public static final Double DOUBLE_ZERO = new Double(0.0D);

}