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
package br.gov.serpro.ouvidoria.util.collection;

import java.util.Collections;
import java.util.Comparator;
import java.util.List;

/**
 * @author SERPRO
 * @version $Revision: 1.1.2.1 $, $Date: 2011/10/21 18:46:40 $
 * 
 */
public class ListArrayTable {

	private boolean isSorted;
	private List list;
	private int idColIndex;
	private Object idRow[];
	private Comparator comparator;

	public ListArrayTable() {
		this(null);
	}

	public ListArrayTable(Comparator comparator) {
		if (comparator == null)
			comparator = new ArrayObjectIdComparator();
		this.comparator = comparator;
	}

	public ListArrayTable attach(List list, boolean isSorted, int idColIndex) {
		if (comparator instanceof ArrayObjectIdComparator)
			((ArrayObjectIdComparator) comparator).setIdColIndex(idColIndex);
		this.idColIndex = idColIndex;
		idRow = new Object[((Object[]) list.get(0)).length];
		this.isSorted = isSorted;
		this.list = list;
		if (!this.isSorted)
			sortById(list);
		return this;
	}

	public final Object[] getRowById(Object id) {
		idRow[idColIndex] = id;
		return (Object[]) list.get(Collections.binarySearch(list,
				((Object) (idRow)), comparator));
	}

	private void sortById(List list) {
		Collections.sort(list, comparator);
	}

}
