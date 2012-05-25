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
package br.gov.serpro.ouvidoria.util.freechart.data.persistence;

import java.util.NoSuchElementException;
import java.util.StringTokenizer;

/**
 * @author SERPRO
 * @version $Revision: 1.1.2.1 $, $Date: 2011/10/21 18:47:37 $
 */
public class DelimitedStringRecord {

	private String data;
	private StringTokenizer st;
	private int pos;
	private String delim;

	public static final DelimitedStringRecord getInstance(String data) {
		DelimitedStringRecord result = new DelimitedStringRecord("\t");
		result.setData(data);
		return result;
	}

	public static String[][] string2resultSetArray(String s) {
		String rowSep = ";";
		String colSep = "\\|";
		String rows[] = s.split(rowSep);
		int rowCount = rows.length;
		String cols[] = rows[0].split(colSep);
		int colCount = cols.length;
		String result[][] = new String[rowCount][colCount];
		result[0] = cols;
		for (int row = 1; row < rowCount; row++)
			result[row] = rows[row].split(colSep);

		return result;
	}

	private DelimitedStringRecord(String delim) {
		setDelim(delim);
	}

	public final void setDelim(String delim) {
		this.delim = delim;
	}

	public final void setData(String data) {
		this.data = data;
		rewind();
	}

	public final int countColumns() {
		return st.countTokens();
	}

	public final String getColumn(int pos) {
		assertPos(pos);
		return getCurrentColumn();
	}

	public final String getCurrentColumn() {
		try {
			pos++;
			return st.nextToken();
		} catch (NoSuchElementException e) {
			pos--;
		}
		return null;
	}

	protected final void rewind() {
		st = data != null ? new StringTokenizer(data, delim) : null;
		pos = 0;
	}

	protected final void assertPos(int pos) {
		int delta = pos - this.pos;
		if (delta < 0) {
			rewind();
			delta = pos;
		}
		if (delta > 0)
			skip(delta);
	}

	protected final void skip(int delta) {
		while (--delta >= 0) {
			st.nextElement();
			pos++;
		}
	}
}
