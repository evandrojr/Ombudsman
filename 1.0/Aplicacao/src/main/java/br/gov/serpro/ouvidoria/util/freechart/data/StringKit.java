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

import java.io.IOException;
import java.io.InputStream;
import java.util.Arrays;

/**
 * @author SERPRO
 * @version $Revision: 1.1.2.1 $, $Date: 2011/10/21 18:47:37 $
 */
public class StringKit {

	private static final StringBuffer _sb = new StringBuffer(512);

	private StringKit() {
		throw new RuntimeException(
				"StringKit is a container class for utility methods.");
	}

	public static int nameDistance(String s, String t) {
		String[] sa = s.toLowerCase().split(" ");
		String[] ta = t.toLowerCase().split(" ");
		int ttl = 0;

		for (int i = 0; i < sa.length; i++) {
			int st = 2147483647;

			for (int j = 0; j < ta.length; j++) {
				st = Math.min(st, levenshtein(sa[i], ta[j]));
			}

			ttl += st;
		}

		return ttl;
	}

	public static int levenshtein(String s, String t) {
		int n = s.length();
		int m = t.length();

		if (n == 0)
			return m;
		if (m == 0)
			return n;

		int[][] d = new int[n + 1][m + 1];

		for (int i = 0; i <= n; d[i][0] = (i++))
			;
		for (int j = 1; j <= m; d[0][j] = (j++))
			;
		for (int i = 1; i <= n; i++) {
			char sc = s.charAt(i - 1);

			for (int j = 1; j <= m; j++) {
				int v = d[(i - 1)][(j - 1)];
				if (t.charAt(j - 1) != sc)
					v++;
				d[i][j] = Math.min(
						Math.min(d[(i - 1)][j] + 1, d[i][(j - 1)] + 1), v);
			}

		}

		return d[n][m];
	}

	public static int hamming(String s, String t) {
		return 0;
	}

	public static boolean isDigit(char c) {
		return ('0' <= c) && (c <= '9');
	}

	public static boolean isLetter(char c) {
		return (('a' <= c) && (c <= 'z')) || (('A' <= c) && (c <= 'Z'));
	}

	public static final String isNull(String s) {
		return isNull(s, "");
	}

	public static final String isNull(String s, String nullString) {
		return s == null ? nullString : s;
	}

	public static final StringBuffer toHexString(byte[] buf, int off, int len,
			StringBuffer sb) {
		for (int i = off; i < len; i++) {
			String h = Integer.toHexString(buf[i]);
			int s = h.length();
			if (s < 2)
				sb.append('0').append(h);
			else {
				sb.append(h.substring(s - 2));
			}

		}

		return sb;
	}

	public static final StringBuffer toHexString(byte[] buf, StringBuffer sb) {
		return toHexString(buf, 0, buf.length, sb);
	}

	public static final String toHexString(byte[] buf, int off, int len) {
		return toHexString(buf, off, len, new StringBuffer(len + len))
				.toString();
	}

	public static final String toHexString(byte[] buf) {
		return toHexString(buf, 0, buf.length);
	}

	public static final byte[] toByteArray(String hex) {
		if ((hex.length() & 0x1) != 0) {
			throw new IllegalArgumentException("Invalid hex string");
		}
		byte[] buf = new byte[hex.length() >> 1];

		int i = 0;
		int bi = 0;
		for (int hlen = hex.length(); i < hlen; bi++) {
			buf[bi] = (byte) Integer.parseInt(hex.substring(i, i + 2), 16);

			i += 2;
		}

		return buf;
	}

	public static final int readLine(InputStream is, StringBuffer sb)
			throws IOException {
		int bytesRead = 0;
		byte b = 0;

		while ((b = (byte) is.read()) != -1) {
			bytesRead++;

			if (b == 13) {
				if ((b = (byte) is.read()) == 10) {
					break;
				}
				System.err.println("Missed: " + (char) b);

				if (b == -1) {
					break;
				}
			}
			sb.append((char) b);
		}

		return bytesRead;
	}

	public static final String readLine(InputStream is) throws IOException {
		synchronized (_sb) {
			_sb.setLength(0);
			return readLine(is, _sb) == 0 ? null : _sb.toString();
		}
	}

	public static final String replicate(char c, int count) {
		if (count == 0) {
			return "";
		}
		if (count < 0) {
			throw new IllegalArgumentException(
					"Parameter 'count' must be non-negative.");
		}
		synchronized (_sb) {
			_sb.setLength(0);
			return addChars(_sb, c, count).toString();
		}
	}

	public static final StringBuffer addChars(StringBuffer sb, char c, int count) {
		return addChars(sb, c, count, true);
	}

	public static final StringBuffer addChars(StringBuffer sb, char c,
			int count, boolean atRight) {
		if (count == 0) {
			return sb;
		}
		if (count < 0) {
			if (atRight) {
				int n = sb.length() + count;
				if (n < 0)
					n = 0;
				sb.setLength(n);
				return sb;
			}

			return new StringBuffer(sb.substring(-count));
		}

		char[] buf = new char[count];
		Arrays.fill(buf, c);

		if (atRight) {
			return sb.append(buf);
		}

		return new StringBuffer(sb.length() + count).append(buf).append(sb);
	}

	public static final StringBuffer rightPad(StringBuffer sb, char c, int len) {
		return addChars(sb, c, len - sb.length());
	}

	public static final StringBuffer leftPad(StringBuffer sb, char c, int len) {
		return addChars(sb, c, len - sb.length(), false);
	}

	public static final String rightPad(String s, char c, int len) {
		synchronized (_sb) {
			_sb.setLength(0);
			_sb.append(s);
			return addChars(_sb, c, len - s.length()).toString();
		}
	}

	public static final String leftPad(String s, char c, int len) {
		synchronized (_sb) {
			_sb.setLength(0);
			_sb.append(s);
			return addChars(_sb, c, len - s.length(), false).toString();
		}
	}

	public static final String join(Object[] array) {
		return join(array, ",");
	}

	public static final String join(Object[] array, String sep) {
		synchronized (_sb) {
			_sb.setLength(0);
			return join(array, sep, _sb).toString();
		}
	}

	public static final StringBuffer join(Object[] array, String sep,
			StringBuffer sb) {
		if ((array == null) || (array.length < 1))
			return sb;

		int len = array.length;

		for (int i = 0; i < len; i++) {
			sb.append(array[i]);
			if (sep == null)
				continue;
			sb.append(sep);
		}

		if (sep != null) {
			sb.setLength(sb.length() - sep.length());
		}
		return sb;
	}

	public static final String join(Object[] array, String pre, String post,
			String inner) {
		synchronized (_sb) {
			_sb.setLength(0);
			return join(array, pre, post, inner, _sb).toString();
		}
	}

	public static final StringBuffer join(Object[] array, String pre,
			String post, String inner, StringBuffer sb) {
		sb.append(pre);
		join(array, pre + inner + post, sb).append(post);
		return sb;
	}

	public static char[] chars2digits(String chars) {
		char[] ca = onlyDigitsAsChar(chars);
		int len = zeroTerminatedLength(ca);
		char[] result = new char[len];

		for (int i = 0; i < len; i++) {
			result[i] = (char) (ca[i] - '0');
		}

		return result;
	}

	public static String onlyDigits(String s) {
		char[] ca = onlyDigitsAsChar(s);
		return zeroTerminatedString(ca);
	}

	public static String zeroTerminatedString(char[] ca) {
		return (ca == null) || (ca.length == 0) ? "" : new String(ca, 0,
				zeroTerminatedLength(ca));
	}

	public static int zeroTerminatedLength(char[] ca) {
		int len = ca.length;

		for (int i = 0; i < len; i++) {
			if (ca[i] == 0) {
				return i;
			}
		}

		return len;
	}

	public static char[] onlyDigitsAsChar(String s) {
		if (s == null) {
			return new char[0];
		}
		return onlyDigitsAsChar(s, s.length());
	}

	public static char[] onlyDigitsAsChar(String s, int len) {
		if (s == null)
			return null;

		char[] list = new char[len];
		int count = 0;

		for (int i = 0; i < len; i++) {
			char c;
			if (isDigit(c = s.charAt(i))) {
				list[(count++)] = c;
			}
		}

		if (count < len) {
			list[count] = '\000';
		}

		return list;
	}
}