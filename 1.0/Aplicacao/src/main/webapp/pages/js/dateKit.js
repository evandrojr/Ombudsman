/**
 * Created on Nov 2, 2004 - 17:00:00 PM
 * $Id: dateKit.js,v 1.1.2.2 2011/10/25 12:43:24 81127731572 Exp $
 * Date validation and handling
 * @author Copyright (C) 2004 Elifarley Callado Coelho Cruz <elifarley@yahoo.com>
 * @version 1.2
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 * 
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 * 
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA 
 */

var CURRENT_YEAR = (new Date()).getFullYear().toString();
var expandYear = true;
var dateSeparator = '/';
var timeSeparator = ':';

// 1 day in milliseconds
Date.DAY_IN_MILLIS = 1000 * 60 * 60 * 24;

/**
 * Get/sets the array of names of the days of a week, starting "Sunday". Static property. 
 */
// Date.dayNames = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"];
Date.dayNames = ["Domingo", "Segunda", "Terça", "Quarta", "Quinta", "Sexta", "Sábado"];

/**
 * Get/sets the array of names of the days of a week, starting "Sun". Static property.
 */
// Date.abbreviatedDayNames = ["Sun", "Mon", "Tues", "Wed", "Thu", "Fri", "Sat"];
Date.abbreviatedDayNames = ["Dom", "Seg", "Ter", "Qua", "Qui", "Sex", "Sab"];

/**
 * Get/sets the array of names of the months of the Gregorian calendar. Static property.
 */
// Date.monthNames = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
Date.monthNames = ["Janeiro", "Fevereiro", "Março", "Abril", "Maio", "Junho", "Julho", "Agosto", "Setembro", "Outubro", "Novembro", "Dezembro"];

/**
 * Get/sets the array of names of the months of the Gregorian calendar. Static property.
 */
// Date.abbreviatedMonthNames = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];
Date.abbreviatedMonthNames = ["Jan", "Fev", "Mar", "Abr", "Mai", "Jun", "Jul", "Ago", "Set", "Out", "Nov", "Dez"];

/**
 * Get/sets the AM designator. Default is "AM". Static property.
 */
Date.AMDesignator = "AM";

/**
 *  Get/sets the PM designator. Default is "PM". Static property.
 */
Date.PMDesignator = "PM";

// (0 - 6)
Date.prototype.getFirstWeekDayInMonth = function() {
  return (new Date(this.getFullYear(), this.getMonth(), 1)).getDay();
}

// (0 - 5)
Date.prototype.getMonthWeek = function() {
  return Math.floor( (this.getDate() - 1 + this.getFirstWeekDayInMonth()) / 7 );
}

// Week in year (0 - 52)
Date.prototype.getYearWeek = function() {
  return '## TODO ##';// TODO
}

// 0 - 365
Date.prototype.getYearDay = function() {
  return '## TODO ##';// TODO
}

// (0 - 1)
Date.prototype.getSemester = function() {
  return Math.floor(this.getMonth() / 7);
}

Date.getDaysInMonth = function(m, y) {
  return [31, (Date.isLeapYear(y) ? 29 : 28), 31, 30, 31, 30, 31, 31, 30, 31, 30, 31][m - 1];
}

Date.isLeapYear = function(y) {
  if (!y) y = CURRENT_YEAR;
  return (y % 4 == 0 && y % 100 != 0) || y % 400 == 0;
}

/**
 * Returns true if instance day is a weekend.
 *
 * @syntax dateObj.isWeekEnd();
 * @return Boolean
 */
Date.prototype.isWeekEnd = function() {
  return this.getDay() == 0 || this.getDay() == 6;
}

/**
 * Returns true if instance day is a weekday.
 *
 * @syntax dateObj.isWeekDay();
 * @return Boolean
 */
Date.prototype.isWeekDay = function() {
  return this.getDay() != 0 && this.getDay() != 6;
}

/**
 * Returns the name of the weekday for instance. e.g. "Monday".
 *
 * @syntax dateObj.getDayName();
 * @return String
 */
Date.prototype.getDayName = function() {
  return Date.dayNames[this.getDay()];
}

/**
 * Returns name of the Gregorian month for instance, e.g. "December".
 *
 * @syntax dateObj.getMonthName()
 * @return String
 */
Date.prototype.getMonthName = function() {
  return Date.monthNames[this.getMonth()];
}

/**
 * Returns an integer representing the number of steps necessary
 * to reach endDate (but without passing it) starting from startDate plus one.
 *
 * @syntax Date.stepCount(startDate, endDate, step[, format])
 * @param  startDate     The Date (or String) object representing the initial date.
 * @param  endDate       The Date (or String) object representing the final date.
 *         step          step of the form '#u', with 'u' in 'smhdwMSy'.
 *                       (e.g.: '1w' represents a one-week step)
 *         format        Default is "h:mm tt"(Short meridiem).
 * @return Array
 */
Date.stepCount = function(startDate, endDate, step) {
  var a = Date.span(startDate, endDate, step, 's'); 
  return a ? a.length : 0;
};

/**
 * Returns an array of strings representing time units between
 * startDate and endDate separated by specified 'step' .
 *
 * @syntax Date.span(startDate, endDate, step[, format])
 * @param  startDate     The Date (or String) object representing the initial date.
 * @param  endDate       The Date (or String) object representing the final date.
 *         step          step of the form '#u', with 'u' in 'smhdwMSy'.
 *                       (e.g.: '1w' represents a one-week step)
 *         format        Default is "h:mm tt"(Short meridiem).
 * @return Array
 */
Date.span = function(startDate, endDate, step, format, limit, closedEnd) {
  
  if (!startDate || !endDate) return null;

  if (!isDate(startDate)) startDate = Date.fromPtBr(startDate);
  if (!isDate(endDate)) endDate = Date.fromPtBr(endDate);
  
  var endDateInt = endDate.getTime();
  
  var stepUnit = step.charAt(step.length - 1);
  var unitIndex = 'smhdwMSy'.indexOf(stepUnit);
  if ( unitIndex < 0) return null;

  step = parseInt(step);
  if (isNaN(step) || step <= 0) return null;
  
  if (!format) {
    format = ["hh:mm:ss tt", "h:mm tt", "yyyy-MM-dd hh tt", "yyyy-MM-dd", "yyyy-MM-dd (w)", "yyyy-MM-dd", "yyyy-MM-dd"][unitIndex];
  }
  var result = [];
  var i = startDate;
  if (!limit) limit = 1000;
  var lastDateInt;

  while (i.getTime() <= endDateInt && (limit == -1 || limit-- > 0)) {
    lastDateInt = i.getTime();
    result.push(i.toString(format));
    
    switch (stepUnit) {
      case 's': i.addSeconds(step); break;
      case 'm': i.addMinutes(step); break;
      case 'h': i.addHours(step); break;
      case 'd': i.addDays(step); break;
      case 'w': i.addDays(step * 7); break;
      case 'M': i.addMonths(step); break;
      case 'S': i.addMonths(step * 6); break;
      case 'y': i.addYears(step); break;
      default: break;
    }
    
  }

  if (closedEnd && lastDateInt < endDateInt) { //  && i.getTime() > endDateInt
    var endDateStr = endDate.toString(format);
    if (result.length && result[result.length - 1] != endDateStr) result.push(endDateStr);
  }
  
  return result;
  
};

/**
 * Adds specified years to the Date object.
 *
 * @syntax dateObj.addYears(noOfYears);
 * @param  noOfYears   Number of years to add.
 * @return Date
 */
Date.prototype.addYears = function(n) {
  this.setFullYear(this.getFullYear() + n);
  return this;
}

/**
 * Adds specified months to the Date object. The 
 *
 * @syntax dateObj.addMonths(noOfMonths);
 * @param  noOfMonths   Number of months to add.
 * @return Date
 */
Date.prototype.addMonths = function(n) {
  var day = this.getDate();
  this.setMonth(this.getMonth() + n);
  if (day > this.getDate()) {
    this.addDays(-this.getDate());
  }
  return this;
}

/**
 * Adds specified days to the Date object.
 *
 * @syntax dateObj.addDays(noOfDays);
 * @param  noOfDays   Number of days to add.
 * @return Date
 */
Date.prototype.addDays = function(n) {
  this.setDate(this.getDate() + n);
  return this;
}

/**
 * addHours
 * Adds specified hours to the Date object.
 *
 * @syntax dateObj.addHours(noOfHours)
 * @param  noOfHours   Number of hours to add.
 * @return Date
 */
Date.prototype.addHours = function(n) {
  this.setHours(this.getHours() + n);
  return this;
}

/**
 * Adds specified minutes to the Date object.
 *
 * @syntax dateObj.addMinutes(noOfMinutes);
 * @param  noOfMinutes    Number of minutes to add.
 * @return Date
 */
Date.prototype.addMinutes = function(n) {
  this.setMinutes(this.getMinutes() + n);
  return this;
}

/**
 * Adds specified seconds to the Date object.
 *
 * @syntax date.addSeconds(noOfSeconds);
 * @param  noOfSeconds   Number of seconds to add.
 * @return Date
 */
Date.prototype.addSeconds = function(n) {
  this.setSeconds(this.getSeconds() + n);
  return this;
}

/**
 * Returns string representation of instance using the specified format string.
 *
 * Overrides native toString() method. Inspired from Microsoft.NET DateTime structure.
 *
 * @syntax dateObj.toString(formatString)
 * @param formatString   Format is a combination of following, e.g. "ddd MMM yy" returns "Tue Dec 02".
 * hh   - 12-hour clock with leading zero if single-digit.
 * h    - 12-hour clock without leading zero.
 * HH   - 24-hour clock with leading zero.
 * H    - 24-hour clock without leading zero.
 * mm   - Minutes with leading zero.
 * m    - Minutes without leading zero.
 * ss   - Seconds with leading zero.
 * s    - Seconds without leading zero.
 * tt   - AM/PM designator.
 * ww   - Week of the year.
 * w    - Week of the month (1 - 6)
 * dddd - Full name of the day of the week.
 * ddd  - Abbreviated name of the day of the week.
 * dd   - Day of month with leading zero.
 * d    - Day of month without leading zero.
 * a    - Day of the year (1 - 366) without leading zeroes.
 * aaa  - Day of the year (001 - 366) with leading zeroes.
 * MMMM - Full name of month.
 * MMM  - Abbreviated name of month.
 * MM   - Month with leading zero.
 * M    - Month without leading zero.
 * S    - Semester (1 - 2)
 * yyyy - Full 4-digit year.
 * yy   - 2-digit year.
 * @return String
 */
Date.prototype.toString = function(s) {

  if (!s) return this.toUTCString();

  var self = this;
  return s.replace(/hh|h|HH|H|mm|m|ss|s|yyyy|yy|S|ww|w|aaa|a|dddd|ddd|dd|d|MMMM|MMM|MM|M|tt/g, 
    function(s) {
      switch (s) {
        case "hh":
          return (self.getHours() < 13 ? self.getHours() : (self.getHours() - 12)).toString().padLeft(2, '0');
        case "h":
          return self.getHours()< 13 ? self.getHours() : (self.getHours() - 12);
        case "HH":
          return self.getHours().toString().padLeft(2, '0');
        case "H":
          return self.getHours();
        case "mm":
          return self.getMinutes().toString().padLeft(2, '0');
        case "m":
          return self.getMinutes();
        case "ss":
          return self.getSeconds().toString().padLeft(2, '0');
        case "s":
          return self.getSeconds();
        case "yyyy":
          return self.getFullYear();
        case "yy":
          return self.getFullYear().toString().substring(2, 4);
        case "S":
          return self.getSemester() + 1;
        case "ww": 
          // See http://www.techonthenet.com/oracle/functions/to_char.htm
          // See http://sunsite.mff.cuni.cz/MIRRORS/ftp.mysql.com/doc/en/Date_and_time_functions.html
          return self.getYearWeek() + 1;
        case "w":
          return self.getMonthWeek() + 1;
        case "aaa":
          return (self.getYearDay() + 1).toString().padLeft(3, '0');
        case "a":
          return self.getYearDay() + 1;
        case "dddd":
          return self.getDayName();
        case "ddd":
          return Date.abbreviatedDayNames[self.getDay()];
        case "dd":
          return self.getDate().toString().padLeft(2, '0');
        case "d":
          return self.getDate();
        case "MMMM":
          return self.getMonthName();
        case "MMM":
          return Date.abbreviatedMonthNames[self.getMonth()];
        case "MM":
          return (self.getMonth() + 1).toString().padLeft(2, '0');
        case "M":
          return self.getMonth() + 1;
        case "tt":
          return self.getHours() < 12 ? Date.AMDesignator : Date.PMDesignator;
      }
    }
  );
  
}

///Utility

/**
 * Returns string representation of instance in a convenient format, 
 * e.g. "Tuesday, 17 December, 2002".
 *
 * @syntax dateObj.toLongDateString();
 * @return String
 */
Date.prototype.toLongDateString = function() {
  return this.toString("dddd, dd MMMM, yyyy");
}

/**
 * Returns string representation of time hh:mm with either AM or PM appended accordingly.
 *
 * @syntax dateObj.toShortMeridiem()
 * @return String
 */
Date.prototype.toShortMeridiem = function() {
  return this.toString("h:mm tt");
}

/**
 * Returns string representation of time hh:mm:ss with either AM or PM appended accordingly.
 *
 * @syntax dateObj.toLongMeridiem();
 * @return String
 */
Date.prototype.toLongMeridiem = function() {
  return this.toString("h:mm:ss tt");
}

/**
 * Returns an array containing the month and day corresponding to easter for the given year.
 *
 * @syntax Date.easter();
 * @return [easterMonth, easterDay]
 */
Date.easter = function(y) { // Gregorian
  // after E G Richards, Algorithm P - upper limit ~ AD 112000?
  var aa = Math.floor(y / 100);
  var bb = aa - Math.floor(aa / 4);
  var cc = y % 19;
  var dd = (15 + 19 * cc + bb - Math.floor( (aa + 1 - Math.floor( (aa + 8) / 25)) / 3)) % 30;
  var ee = dd - Math.floor((cc + 11 * dd) / 319);
  // var s = 22 + ee + (140004 -  y - Math.floor(y / 4)    + bb - ee) % 7;
  var s = 22 + ee + (140004 - (y + Math.floor(y / 4)) % 7 + bb - ee) % 7;
  // Extra %7 greatly increases year range - jrs 20021012
  var easterMonth = 3 + Math.floor(s / 32);
  var easterDay = 1 + (s - 1) % 31;
  return [easterMonth, easterDay];
};

Date.fromISO8601 = function(dateStr) {
  var parts = dateStr.toString().split(/\D+/);
  if (!parts || parts.length < 1) return null;
  
  switch (parts.length) {
    case 1: return new Date(parts[0], 0);
    case 2: return new Date(parts[0], parts[1]);
    case 3: return new Date(parts[0], parts[1], parts[2]);
    case 4: return new Date(parts[0], parts[1], parts[2], parts[3]);
    case 5: return new Date(parts[0], parts[1], parts[2], parts[3], parts[4]);
    case 6: return new Date(parts[0], parts[1], parts[2], parts[3], parts[4], parts[5]);
    default: return null;
  }
  
};

Date.fromPtBr = function(dateStr) {
  var parts = Date.normalizedPtBr(dateStr);
  return parts ? new Date(parts[2], parts[1] - 1, parts[0]) : null;
};

Date.normalizeYear = function(y) {
  if (!y) return null;
  y = y.toString();
  switch(y.length) {
    case 4: return y;
    case 1: return CURRENT_YEAR.substring(0, 3) + y;
    case 2: return CURRENT_YEAR.substring(0, 2) + y;
  }
}

Date.normalizedPtBr = function (dt) {

  if (!dt) return null;
  
  var parts = dt.toString().split(/\D+/);
  
  if (!parts || parts.length != 3) {
    return null;
  }

  var tempDate;
  tempDate = parts[2];
  if (tempDate.length != 4) parts[2] = Date.normalizeYear(tempDate);

  tempDate = parts[1];
  if (tempDate.length == 1) parts[1] = '0' + tempDate;

  tempDate = parts[0];
  if (tempDate.length == 1) parts[0] = '0' + tempDate;

  return parts;
  
};

/**
 * 
 * old name: ddMMyyyy2yyyyMMdd
 */
function convertPtBr2ISO8601DateShort(dt, outSep) {
  
  if (arguments.length < 2) outSep = '-';
  
  return Date.normalizedPtBr(dt).reverse().join(outSep);
  
}

/**
 * Old name: yyyyMMdd2ddMMyyyy
 */
function convertISO8601DateShort2ptBr(dt, outSep) {
  
  // inSep = '';
  
  if (!dt) return '';
  
  if (arguments.length < 2) outSep = dateSeparator;
  
  var len = dt.length;
  if (len >= 8) return dt.toString().replace(/(\d{4})\D?(\d{2})\D?(\d{2})/g, '$3' + outSep + '$2' + outSep + '$1');

  var result = '';

  if (len > 6)
    result += dt.substring(6, 8);

  if (len > 4)
    result += outSep + dt.substring(4, 6);

  if (len > 0)
    result += outSep + dt.substring(0, 4);
  
  // alert(result);
  
  return result;
  
}

/**
 * Old name: yyyyMMddWithTime2ddMMyyyyWithTime
 */
function ISO8601DateTime2ptBrDateTime(date) {
  date = date.toString().trim();
  var  p = date.indexOf(' ');
  return convertISO8601DateShort2ptBr(date.substring(0, p)) + date.substring(p); 
  
}

/**
 * Returns true if the argument represents a valid date in the form dd/MM/yyyy.
 */
function isValidDate(userDate, sep) {

  if (!userDate) return false;

  if (arguments.length < 2) sep = dateSeparator;

  var parts = userDate.split(sep);
  if (!parts || parts.length != 3) return false;

  var MIN_YEAR = 1000;
  var MAX_YEAR = 9999;
  parts[1]--;
  if (expandYear && parts[2].length == 2) parts[2] = Date.normalizeYear(parts[2]);
  var d = new Date(parts[2], parts[1], parts[0]);
  return (MIN_YEAR <= parts[2] && parts[2] <= MAX_YEAR ) && d.getDate() == parts[0] && d.getMonth() == parts[1] && d.getFullYear() == parts[2];

}

/**
 * Returns true if it's a partially valid date.
 */
function isPartialDate_old(sDate) {

  switch (sDate.length) {
  case 0:
    return false;
  case 1:
    sDate += sDate.charAt(0) == '0' ? '1' : '0';
  case 2 :
    sDate += dateSeparator;
  case 3:
    sDate += '01' + dateSeparator + '2000';
    break;
  case 4:
    sDate += sDate.charAt(3) == '0' ? '1' : '0';
  case 5:
    sDate += dateSeparator;
  case 6:
    sDate += '2000';
    break;
  case 7:
    sDate += '000';
    break;
  case 8:
    sDate += '00';
    break;
  case 9:
    sDate += '0';
    break;
  case 10:
    break;
  default:
    return false;
  }

  return isValidDate(sDate);

}

/**
 * Returns true if it's a partially valid date.
 * Accepts input of the form '1/9/05'.
 */
function isPartialDate(sDate) {

  var lastChar = sDate.charAt(sDate.length - 1);

  switch (sDate.length) {

  case 0:
    return false;

  case 1:
    sDate = (lastChar == '0' ? '1' : '0') + sDate;
  case 2 :
    if (sDate.charAt(1) == dateSeparator)
      sDate = '0' + sDate;
    else
      sDate += dateSeparator;
  case 3:
    if (sDate.charAt(1) == dateSeparator) 
      sDate += dateSeparator + '2000';
    else
      sDate += '01' + dateSeparator + '2000';
    break;

  case 4:
    
    if (sDate.charAt(3) == dateSeparator) {
      sDate += '2000';
      break;
    }
      
    if (sDate.charAt(2) == dateSeparator) {
      if (sDate.charAt(3) == '0')
        sDate += '1';
      else
        sDate = sDate.substring(0, 3) + '0' + sDate.charAt(3);
    }
  case 5:
    if (sDate.charAt(3) == dateSeparator) {
      sDate = sDate.substring(0, 4) + '200' + sDate.charAt(4);
      break;
    }

    if (sDate.charAt(4) != dateSeparator) {
      sDate += dateSeparator;
    } else {
      sDate += '2000';
      break;
    }
    
  case 6:

    if (sDate.charAt(3) == dateSeparator) {
      // sDate = sDate.substring(0, 4) + '20' + sDate.substring(4);
      // will 2-digit years be valid ?
      break;
    }

    if (sDate.charAt(4) == dateSeparator) {
      sDate = sDate.substring(0, 5) + '200' + sDate.charAt(5);
      break;
    }

    sDate += '2000';
    break;

  case 7:

    if (sDate.charAt(3) == dateSeparator) {
      sDate += '0';
      break;
    }

    if (sDate.charAt(4) == dateSeparator) {
      // sDate = sDate.substring(0, 5) + '20' + sDate.substring(5);
      // will 2-digit years be valid ?
      break;
    }

    if (sDate.charAt(6) == '0')
      sDate += '0';
    else
      sDate += '000';
      
    break;

  case 8:

    if (sDate.charAt(4) == dateSeparator) {
      sDate += '0';
      
    } else if (sDate.charAt(5) == dateSeparator) {
      // sDate += '00';
      // will 2-digit years be valid ?
    }

    break;

  case 9:

    if (sDate.charAt(5) == dateSeparator) {
      sDate += '0';
    }

    break;

  case 10:
    break;

  default:
    return false;

  }

  return isValidDate(sDate);

}

function doDateKeyPress(el, newVal) {

  var addSep = false;

  var lastChar = newVal.charAt(newVal.length - 1);
  var lastIsSep = lastChar == dateSeparator;

  switch (newVal.length) {

  case 1:
    if (newVal > 3) newVal = '0' + newVal + dateSeparator;
    break;

  case 2:
    if (lastIsSep) {
      newVal = '0' + newVal;
    } else {
      newVal += dateSeparator;
    }
    break;

  case 3:
    if (!lastIsSep) {
      newVal = '0' + newVal;
      if (lastChar > 2) newVal = newVal.substring(0, 3) + '0' + lastChar + dateSeparator;
    }
    break;

  case 4:
    if (newVal.charAt(2) == dateSeparator) {
      if (lastChar > 1) newVal = newVal.substring(0, 3) + '0' + lastChar + dateSeparator;
    }
    break;

  case 5:
    if (lastIsSep) {
      newVal = newVal.substring(0, 3) + '0' + newVal.charAt(3) + dateSeparator;
    } else {
      newVal += dateSeparator;
    }
    break;

  case 7:
    if (lastChar == '0') {
      newVal = newVal.substring(0, 6) + CURRENT_YEAR.substring(0, 2) + lastChar;
    }

  }

  el.value = newVal;

}

// Time handling

function isValidTime(userTime) {

  var sep = ':';

  if (!userTime) return false;

  var parts = userTime.split(sep);
  if (!parts || parts.length < 2 || parts.length > 4) return false;
  if (parts.length == 2) { parts[2] = 0; parts[3] = 0; }
  if (parts.length == 3) parts[3] = 0;

  var d = new Date(2000, 0, 1, parts[0], parts[1], parts[2], parts[3]);
  return d.getHours() == parts[0] && d.getMinutes() == parts[1] && d.getSeconds() == parts[2] && d.getMilliseconds() == parts[3]
    && d.getFullYear() == 2000 && d.getMonth() == 0 && d.getDate() == 1;

}

/**
 * Returns true if it's a partially valid date.
 * Accepts input of the form '1/9/05'.
 */
function isPartialTime(sTime) {

  // Allows only hh:mm
  if (sTime.length > 5) return false;

  var lastChar = sTime.charAt(sTime.length - 1);
  
  switch (sTime.length) {

  case 0:
    return false;

  case 1:
    sTime = '0' + sTime;
  case 2 :
    if (sTime.charAt(1) == timeSeparator)
      sTime = '0' + sTime;
    else
      sTime += timeSeparator;
  case 3:
    if (sTime.charAt(1) == timeSeparator) 
      sTime += timeSeparator + '00';
    else
      sTime += '00' + timeSeparator + '00';

    break;

  case 4:
    
    if (sTime.charAt(3) == timeSeparator) {
      sTime += '00';
      break;
    }
      
    if (sTime.charAt(2) == timeSeparator) {
      if (sTime.charAt(3) == '0')
        sTime += '1';
      else
        sTime = sTime.substring(0, 3) + '0' + sTime.charAt(3);
    }
  case 5:
  /*
  1:05:
  01:5:
  01:05
  */
  
     // Allows only hh:mm
    if (sTime.charAt(2) != timeSeparator) {
      return false;

    } else {
      break;

    }
    
    if (sTime.charAt(3) == timeSeparator) {
      sTime += '00';
      break;
    }

    if (sTime.charAt(4) != timeSeparator) {
      sTime += timeSeparator;
    } else {
      sTime += '00';
      break;
    }
    
  case 6:
  /*
  1:4:30
  1:04:3
  01:4:3
  01:04:
  */

    if (sTime.charAt(3) == timeSeparator) {
      break;
    }

    if (sTime.charAt(4) == timeSeparator) {
      sTime = sTime.substring(0, 5) + '0' + sTime.charAt(5);
      break;
    }

    sTime += '00';
    break;

  case 7:
  /*
  1:04:30
  01:4:30
  01:04:3
  */

    if (sTime.charAt(5) == timeSeparator)
      sTime = sTime.substring(0, 6) + '0' + sTime.charAt(6);
      
    break;

  case 8:
    break;

  default:
    return false;

  }

  return isValidTime(sTime);

}

function doTimeKeyPress(el, newVal) {
  var addSep = false;

  var lastChar = newVal.charAt(newVal.length - 1);
  var lastIsSep = lastChar == timeSeparator;

  switch (newVal.length) {

  case 1:
    if (newVal > 2) newVal = '0' + newVal + timeSeparator;
    break;

  case 2:
    if (lastIsSep) {
      newVal = '0' + newVal;
    } else {
      newVal += timeSeparator;
    }
    break;

  case 3:
    if (!lastIsSep) {
      newVal = '0' + newVal;
      if (lastChar > 5) newVal = newVal.substring(0, 3) + '0' + lastChar; // + timeSeparator;
    }
    break;

  case 4:
    if (newVal.charAt(2) == timeSeparator) {
      if (lastChar > 5) newVal = newVal.substring(0, 3) + '0' + lastChar; // + timeSeparator;
    }
    break;

  case 5:
    if (lastIsSep) {
      newVal = newVal.substring(0, 3) + '0' + newVal.charAt(3) + timeSeparator;
    } else {
      // newVal += timeSeparator;
    }
    break;

  case 7:
  /*
  03:06:7
  */

    if (newVal.charAt(5) == timeSeparator) {
      if (lastChar > 5) newVal = newVal.substring(0, 6) + '0' + lastChar + timeSeparator;
    }

    break;

  }

  el.value = newVal;

}