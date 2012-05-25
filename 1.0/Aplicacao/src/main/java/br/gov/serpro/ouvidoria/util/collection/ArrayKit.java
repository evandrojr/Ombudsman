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

/**
 * @author SERPRO
 * @version $Revision: 1.1.2.1 $, $Date: 2011/10/21 18:46:40 $
 */
public class ArrayKit {

	public ArrayKit() {
	}

	public static final Object[] concat(Object a, Object b) {
		return concat(a, new Object[] { b });
	}

	public static final Object[] concat(Object a[], Object b) {
		return concat(a, new Object[] { b });
	}

	public static final Object[] concat(Object a, Object b[]) {
		return concat(new Object[] { a }, b);
	}

	public static final Object[] concat(Object a[], Object b[]) {
		return concat(a, b, new Object[a.length + b.length]);
	}

	public static final Object[] concat(Object a, Object b[], Object dest[]) {
		return concat(new Object[] { a }, b, dest);
	}

	public static final Object[] concat(Object a[], Object b[], Object dest[]) {
		int aLen = a.length;
		int bLen = b.length;
		System.arraycopy(((Object) (a)), 0, ((Object) (dest)), 0, aLen);
		System.arraycopy(((Object) (b)), 0, ((Object) (dest)), aLen, bLen);
		return dest;
	}

	public static final byte[] concat(byte a[], byte b[], byte dest[]) {
		int aLen = a.length;
		int bLen = b.length;
		System.arraycopy(a, 0, dest, 0, aLen);
		System.arraycopy(b, 0, dest, aLen, bLen);
		return dest;
	}

	public static final int search(int keys[], int key) {
		for (int i = keys.length - 1; i >= 0; i--)
			if (key == keys[i])
				return i;

		return -1;
	}

	public static final int search(Object keys[], Object key) {
		if (keys != null) {
			for (int i = keys.length - 1; i >= 0; i--)
				if (key == keys[i])
					return i;

		}
		return -1;
	}

	public static final int searchEqual(Object keys[], Object key) {
		if (keys != null) {
			for (int i = keys.length - 1; i >= 0; i--)
				if (key == null && keys[i] == null || key.equals(keys[i]))
					return i;

		}
		return -1;
	}

	public static final int[] clone(int a[], int len, int curentSize) {
		int nKeys[] = new int[len];
		System.arraycopy(a, 0, nKeys, 0, curentSize);
		return nKeys;
	}

	public static final Object[] clone(Object a[], int len, int curentSize) {
		Object nArray[] = new Object[len];
		System.arraycopy(((Object) (a)), 0, ((Object) (nArray)), 0, curentSize);
		return nArray;
	}

	public static final int[] makeRoom(int a[], int len, int currentSize) {
		int nArray[] = new int[len];
		System.arraycopy(a, 0, nArray, 0, currentSize);
		return nArray;
	}

	public static final void insert(Object a[], int index, int count) {
		int copyCount = a.length - index;
		System.arraycopy(((Object) (a)), index + count, ((Object) (a)), index,
				copyCount);
	}

	public static final void remove(Object a[], int index, int count) {
		int copyCount = a.length - index - count;
		System.arraycopy(((Object) (a)), index + count, ((Object) (a)), index,
				copyCount);
	}

	public static final void remove(Object a, int index, int count) {
		int aLen = -1;
		if (a instanceof int[])
			aLen = ((int[]) a).length;
		else if (a instanceof Object[])
			aLen = ((Object[]) a).length;
		int copyCount = aLen - index - count;
		System.arraycopy(a, index + count, a, index, copyCount);
	}
}
