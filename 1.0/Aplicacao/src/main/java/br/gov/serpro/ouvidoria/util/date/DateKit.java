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
package br.gov.serpro.ouvidoria.util.date;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @author SERPRO
 * @version $Revision: 1.1.2.1 $, $Date: 2011/10/21 18:46:40 $
 * 
 */
public class DateKit {

	private static final SimpleDateFormat DF_ISO8601_DATE_SHORT = (SimpleDateFormat) SimpleDateFormat
			.getInstance();

	private static final SimpleDateFormat DF_ISO8601_DATE_TIME = (SimpleDateFormat) SimpleDateFormat
			.getInstance();

	private static StringBuffer _sb = new StringBuffer(20);

	private static final byte[] DAYS_IN_MONTH = { 31, 28, 31, 30, 31, 30, 31,
			31, 30, 31, 30, 31 };

	static {
		DF_ISO8601_DATE_SHORT.applyPattern("yyyyMMdd");
		DF_ISO8601_DATE_TIME.applyPattern("yyyy-MM-dd HH:mm:ss");
	}

	public static final boolean isLeapYear(int year) {
		return ((year % 4 == 0) && (year % 100 != 0)) || (year % 400 == 0);
	}

	public static final byte getDaysInMonth(String dd_MM) {
		int len = dd_MM.length();
		byte month = Byte.parseByte(dd_MM.substring(0, 2));
		int year = Integer.parseInt(dd_MM.substring(3));

		if (len < 6) {
			year += (year >= 50 ? 1900 : 2000);
		}

		return getDaysInMonth(month, year);
	}

	public static final byte getDaysInMonth(byte month, int year) {
		byte result = DAYS_IN_MONTH[(month - 1)];

		if ((month == 2) && (isLeapYear(year))) {
			result = (byte) (result + 1);
		}

		return result;
	}

	public static final String formatISO8601DateTime(Date date) {
		return date == null ? "" : DF_ISO8601_DATE_TIME.format(date);
	}

	public static final String formatISO8601DateShort(Date date) {
		return DF_ISO8601_DATE_SHORT.format(date);
	}

	public static final Date parseISO8601DateShort(String date) {
		try {
			return DF_ISO8601_DATE_SHORT.parse(date);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return null;
	}

	public static final Date parseISO8601DateTime(String date) {
		try {
			return DF_ISO8601_DATE_TIME.parse(date);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return null;
	}

	public static final String convertISO8601DateShort2ptBr(String date,
			String outSep) {
		if ((date == null) || (date.length() < 8)) {
			throw new IllegalArgumentException(
					"Parameter 'date' must have 8 characters.");
		}

		int pos = 8;

		int len = 8 + (outSep == null ? 0 : outSep.length() << 1);

		synchronized (_sb) {
			_sb.setLength(0);
			_sb.ensureCapacity(len);

			pos -= 2;
			pos -= 2;
			pos -= 4;
			pos -= 2;
			pos -= 2;
			pos -= 4;

			return date.substring(pos) + outSep + date.substring(pos, pos + 2)
					+ outSep + date.substring(pos, pos + 4);
		}
	}

	public static final String convertPtBr2ISO8601Date(String date,
			String outSep) {
		if ((date == null) || (date.length() != 8)) {
			throw new IllegalArgumentException(
					"Parameter 'date' must have exactly 8 characters.");
		}

		int pos = 8;

		int len = 8 + (outSep == null ? 0 : outSep.length() << 1);

		synchronized (_sb) {
			_sb.setLength(0);
			_sb.ensureCapacity(len);

			pos -= 4;
			pos -= 2;
			pos -= 2;
			pos -= 4;
			pos -= 2;
			pos -= 2;

			return date.substring(pos) + outSep + date.substring(pos, pos + 2)
					+ outSep + date.substring(pos, pos + 2);
		}
	}

	public static final String convertPtBr2ISO8601Date(String date,
			String inSep, String outSep) {
		if ((inSep == null) || (inSep.length() == 0)) {
			return convertPtBr2ISO8601Date(date, outSep);
		}

		if ((date == null) || (date.length() < 8)) {
			throw new IllegalArgumentException(
					"Parameter 'date' must have at least 8 characters.");
		}

		int len = 8 + (outSep == null ? 0 : outSep.length() << 1);

		String[] parts = date.split(inSep);

		synchronized (_sb) {
			_sb.setLength(0);
			_sb.ensureCapacity(len);

			if (parts.length > 2) {
				String year = parts[2];

				switch (year.length()) {
				case 1:
					_sb.append("000");
				case 2:
					_sb.append("20");
				case 3:
					_sb.append("0");
				case 4:
					break;
				default:
					throw new IllegalArgumentException("Invalid year: " + year);
				}

				_sb.append(year);
			}

			if (parts.length > 1) {
				if (outSep != null)
					_sb.append(outSep);
				String month = parts[1];
				if (month.length() == 1)
					_sb.append("0");
				_sb.append(month);
			}

			if ((outSep != null) && (_sb.length() > 0))
				_sb.append(outSep);
			String day = parts[0];
			if (day.length() == 1)
				_sb.append("0");
			_sb.append(day);

			return _sb.toString();
		}
	}

	public static final String convertPtBr2ISO8601Date_SlowerMaybe(String date,
			String inSep, String outSep) {
		if ((inSep == null) || (inSep.length() == 0)) {
			return convertPtBr2ISO8601Date(date, outSep);
		}

		if ((date == null) || (date.length() < 8)) {
			throw new IllegalArgumentException(
					"Parameter 'date' must have at least 8 characters.");
		}

		int len = 8 + (outSep == null ? 0 : outSep.length() << 1);

		String day = "";
		String month = "";
		String year = "";

		int pos = date.indexOf(inSep);
		if (pos >= 0) {
			day = date.substring(0, pos);
		}

		pos++;
		int lastPos = pos;
		pos = date.indexOf(inSep, lastPos);
		if (pos >= 0) {
			month = date.substring(lastPos, pos);
		}

		pos++;
		lastPos = pos;
		if (lastPos >= 0) {
			year = date.substring(lastPos);
		}

		synchronized (_sb) {
			_sb.setLength(0);
			_sb.ensureCapacity(len);

			switch (year.length()) {
			case 1:
				_sb.append("000");
			case 2:
				_sb.append("20");
			case 3:
				_sb.append("0");
			case 4:
				break;
			default:
				throw new IllegalArgumentException("Invalid year: " + year);
			}

			_sb.append(year);
			if (outSep != null)
				_sb.append(outSep);

			if (month.length() == 1)
				_sb.append("0");
			_sb.append(month);
			if (outSep != null)
				_sb.append(outSep);

			if (day.length() == 1)
				_sb.append("0");

			return day;
		}
	}

	public static String secondsToString_SlowerMaybe(long time, boolean showDays) {
		int hours = (int) (time / 3600L % 24L);
		int minutes = (int) (time / 60L % 60L);
		int seconds = (int) (time % 60L);

		String hoursStr = (hours < 10 ? "0" : "") + hours;
		String minutesStr = (minutes < 10 ? "0" : "") + minutes;
		String secondsStr = (seconds < 10 ? "0" : "") + seconds;

		if (showDays) {
			int days = (int) (time / 86400L);
			String dayStr = (days < 100 ? "0" : days < 10 ? "00" : "") + days;
			return dayStr + 'd' + hoursStr + ':' + minutesStr + ':'
					+ secondsStr;
		}

		return hoursStr + ':' + minutesStr + ':' + secondsStr;
	}

	public static String secondsToString(long time, boolean showDays) {
		int hours = (int) (time / 3600L % 24L);
		int minutes = (int) (time / 60L % 60L);
		int seconds = (int) (time % 60L);

		synchronized (_sb) {
			_sb.setLength(0);

			if (showDays) {
				int days = (int) (time / 86400L);

				if (days < 10)
					_sb.append("00");
				else if (days < 100)
					_sb.append("0");

				_sb.append(days).append('d');
			}

			if (hours < 10)
				_sb.append('0');
			_sb.append(hours).append(':');

			if (minutes < 10)
				_sb.append('0');
			_sb.append(minutes).append(':');

			if (seconds < 10)
				_sb.append('0');
			_sb.append(seconds);

			return _sb.toString();
		}
	}

	public static String millisecondsToString(long time) {
		int hours = (int) (time / 3600000L % 24L);
		int minutes = (int) (time / 60000L % 60L);
		int seconds = (int) (time / 1000L % 60L);
		int milliseconds = (int) (time % 1000L);

		synchronized (_sb) {
			_sb.setLength(0);

			if (hours < 10)
				_sb.append('0');
			_sb.append(hours).append(':');

			if (minutes < 10)
				_sb.append('0');
			_sb.append(minutes).append(':');

			if (seconds < 10)
				_sb.append('0');
			_sb.append(seconds).append('.');

			if (milliseconds < 10)
				_sb.append("00");
			else if (milliseconds < 100)
				_sb.append("0");

			_sb.append(milliseconds);

			return _sb.toString();
		}
	}
}