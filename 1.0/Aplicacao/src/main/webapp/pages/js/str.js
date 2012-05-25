/**
 * Created on or before Aug 16, 2004
 * $Id: str.js,v 1.1.2.1 2011/10/11 12:15:20 03323620941 Exp $
 * String-related functions
 * @author Copyright (C) 2004 Elifarley Callado Coelho Cruz <elifarley@yahoo.com>
 * @version 2.0
 * Some functions are based on a file found at
 * http://www.brainjacked.com/src/show.aspx?page=native/string
 *
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

// ------------------------------------------
// Functions returning a boolean
// ------------------------------------------

function isDigit(c) {
  return !!c && ('0' <= c) && (c <= '9') && c.length == 1;
}
String.prototype.isDigit = function() { return isDigit(this); };
  
function isLetter(c) {
  if (!c) return false;
  return ( ('a' <= c && c <= 'z') || ('A' <= c && c <= 'Z') ) && c.length == 1;
}
String.prototype.isLetter = function() { return isLetter(this); };
  
function isAlpha(val) {
  if (!val) return false;
  
  val = val.toString();
  for (var i = val.length - 1; i >= 0; i--) {
    if (!isLetter(val.charAt(i))) return false;
  }
  
  return true;
  
}
String.prototype.isAlpha = function() { return isAlpha(this); };

function isInteger(val) {
  return !isNaN(val) && parseInt(val) == parseFloat(val);
}
String.prototype.isInteger = function() { return isInteger(this); };

function isPartialNumber(val) {
  val = val.toString();
  if (val.length == 1) val += '0';
  
  return !isNaN(val) && val == val.trim();
}
String.prototype.isPartialNumber = function() { return isPartialNumber(this); };

function isPartialInteger(val) {
  val = val.toString();
  if (val.endsWith('.')) return false;
  if (val.length == 1) val += '0';
  
  return !isNaN(val) && parseInt(val) == parseFloat(val) && val == val.trim();
}
String.prototype.isPartialInteger = function() { return isPartialInteger(this); };

// Email regexp found at http://www.brainjacked.com/src/show.aspx?page=native/regexp
RegExp.emailAddress = /^([^\[\]()<>@,;:\\".]+|\"([^"\\\r]|\\.)*\")(\.([^\[\]()<>@,;:\\".]+|\"([^"\\\r]|\\.)*\"))*@(\[([^\\\[\]\r]|\\.)*\]|[^\[\]()<>@,;:\\".]+)(\.(\[([^\\\[\]\r]|\\.)*\]|[^\[\]()<>@,;:\\".]+))*$/;

function isValidEmail(email) {
  return RegExp.emailAddress.test(email);
}
String.prototype.isValidEmail = function() { return isValidEmail(this); };

function isPartialEmail(email) {

  if (!email) return false;
  email = email.toString();
  var len = email.length;
  var lastChar = email[len - 1];

  if (lastChar == '@') 
    email += 'a.org';

  else if (lastChar == '.') 
    email += 'org';

  else if (email.indexOf('@') == -1) 
    email += '@a.org';
  
  return RegExp.emailAddress.test(email);

}
String.prototype.isPartialEmail = function() { return isPartialEmail(this); };

function startsWith(src, s, caseSensitive) {

  if (!caseSensitive) {
    s = s.toLowerCase();
  }  

  var tSrc = caseSensitive ? src : src.toLowerCase();
  var p = tSrc.indexOf(s);
  return p = 0;

}
// String.prototype.startsWith = new Function("s", "caseSensitive", "return startsWith(this, s, caseSensitive);");
String.prototype.startsWith = function(s, caseSensitive) { return startsWith(this, s, caseSensitive); };

function endsWith(src, s, caseSensitive) {

  if (!caseSensitive) {
    s = s.toLowerCase();
  }  

  var tSrc = caseSensitive ? src : src.toLowerCase();
  var p = tSrc.lastIndexOf(s);
  return p >= 0 && p == src.length - s.length;

}
// String.prototype.endsWith = new Function("s", "caseSensitive", "return endsWith(this, s, caseSensitive);");
String.prototype.endsWith = function(s, caseSensitive) { return endsWith(this, s, caseSensitive); };

String.prototype.containsAny = function(testStr) {

  if (!testStr) {
    return false;
  }
  
  var src;
  var comp;
    
  if (this.length < testStr.length) {
    src = this;
    comp = testStr;  
  } else {
    src = testStr;
    comp = this;  
  }
  
  for (var i = src.length - 1; i >= 0; i--) {
    
    if (comp.indexOf(src.charAt(i)) >= 0) {
      return true;
    }
    
  }
  
  return false;

};

/**
 * Converts the string to its boolean equivalent.
 *
 * @syntax  stringObj.toBoolean();
 * @return  Boolean
 */
String.prototype.toBoolean = function() {
 
  switch(this.toString().toLowerCase()) {

    case "true":
    case "verdadeiro":
    case "vrai":
    case "t":
    case "v":
      return true;
    
    case "false":
    case "falso":
    case "falsch":
    case "f":
      return false;

    default:
      return parseInt(this) > 0;
      
  }
 
};

// ------------------------------------------

/**
 * Produces a string in which '<', '>', and '&' are replaced with their HTML entity equivalents.
 * This is essential for placing arbitrary strings into HTML texts.
 *
 * Example:
 * "if (a < b && b > c) {".entityify() -> "if (a &lt; b &amp;&amp; b &gt; c) {"
 *
 * @syntax  stringObj.entityify();
 * @return  String
 */
String.prototype.entityify = function () {
    return this.replace(/&/g, "&amp;").replace(/</g,
        "&lt;").replace(/>/g, "&gt;");
};

/**
 * Does variable substitution on the string. It scans through the string looking for expressions enclosed in { } braces.
 * If an expression is found, use it as a key on the object, and if the key has a string value or number value,
 * it is substituted for the bracket expression and it repeats. This is useful for automatically fixing URLs.
 *
 * Example:
 * param = {domain: 'valvion.com', media: 'http://media.{domain}/'};
 * url = "{media}logo.gif".supplant(param);
 * produces a url containing "http://media.valvion.com/logo.gif".
 * 
 * @syntax  stringObj.supplant(param);
 * @return  String
 */
String.prototype.supplant = function (o) {
    var i, j, s = this, v;
    for (;;) {
        i = s.lastIndexOf('{');
        if (i < 0) {
            break;
        }
        j = s.indexOf('}', i);
        if (i + 1 >= j) {
            break;
        }
        v = o[s.substring(i + 1, j)];
        if (!isString(v) && !isNumber(v)) {
            break;
        }
        s = s.substring(0, i) + v + s.substring(j + 1);
    }
    return s;
};

/**
 * Returns a quoted string.
 * This method returns a string which is like the original string except that it is wrapped in quotes
 * and all quote and backslash characters are preceded with backslash.
 *
 * @syntax  stringObj.quote();
 * @return  String
 * @see http://www.crockford.com/javascript/remedial.html
 */
String.prototype.quoteAlt = (isNS4) ? function () {
    return '"' + this.replace(/(["\\])/g, function (s) {
        return '\\' + s;
    }) + '"';
} : function () {
    return '"' + this.replace(/(["\\])/g, '\\$1') + '"';
};

/**
 * Returns instance as valid string enclosed by double-quotes.
 *
 * Existing linefeed, carriage return, double-quote, and forward-slash characters
 * are appropriately replaced by their quoted-pair equivalents so that expression 
 * occupies a single line and can be evaluated.
 *
 * @syntax  stringObj.quote();
 * @return  String
 */
String.prototype.quote = function() {
 return '"' + this.replace(/[\\"\r\n]/g,
  function(s)
  {
   switch(s) {
    case "\\": return "\\\\";
    case "\r": return "\\r";
    case "\n": return "\\n";
    case '"':  return '\\"';
   }
  }
 )+'"';
};

/**
 * Returns string wrapped inside a HTML tag with specified tagname and attributes.
 *
 * @syntax   stringObj.tag(tagname[, attributes]); 
 * @param    tagname     HTML tagname.
 * @param    attributes  Optional.
 * @return   String      Returns string of form "<tagname attributes(if any)>string</tagname>".
 */
String.prototype.tag = function(t,a) {
  return '<' + t + (a ? ' ' + a : '') + '>' + this.toString() + "</" + t + '>';
};

/**
 * Creates a hypertext link with common event handlers. Overrides fairly useless link method. 
 *
 * @syntax   stringObj.link([hyperlink][,onclickHandler][,onmouseoverHandler][,onmouseoutHandler]);
 * @param    hyperlink            Hypertext link string.
 * @param    onclickHandler       Event handler string for onClick behavior.
 * @param    onmouseoverHandler   Event handler string for onMouseOver behavior.
 * @param    onmouseoutHandler    Event handler string for onMouseOut behavior.
 * @return   String
 */
String.prototype.link = function(h, c, v, u) {
 return this.tag('a',
  (h ? 'href="' + h + '"':'')
 +(c ? ' onclick = "' + c + '"' : '')
 +(v ? ' onmouseover = "' + v + '"' : '')
 +(u ? ' onmouseout = "' + u + '"' : '')
 );
};

// ------------------------------------------

/**
 * Returns calling string with the first letter in each word capitalised.
 * @syntax stringObj.toTitleCase();
 * @return String
 */
String.prototype.toTitleCase = function() {
  return this.replace(/\b[a-z]|_[a-z]/g, function(s) { return s.toUpperCase(); } );
};

// ------------------------------------------

/**
 * Inserts string at the specified index.
 *
 * @syntax   stringObj.insertAt(insertStr, index)
 * @param    insertStr   String to insert.
 * @param    index       Index position to insert string at. 
 * @return   String
 */
String.prototype.insertAt = function(s, p) {
  return this.substring(0, p) + s + this.substr(p);
};

/**
 * Replaces string at the specified index.
 *
 * @syntax   stringObj.replaceAt(replaceStr, index);
 * @param    replaceStr   Replacing string.
 * @param    index        Index position to replace string at.
 * @return   String
 */
String.prototype.replaceAt = function(s, p) {
  return this.substring(0, p) + s + this.substr(p + s.length);
};

function insertAt(src, c, pos) {
  var len = src.length;
  if (!pos) pos = len;
  
  if (pos == 0) return c + src;
  
  if (pos == len) return src + c;
  
  if (pos > len) return src + ' '.replicate(pos - len - 1) + c;
  
  if (pos > 0) return src.substring(0, pos) + c + src.substring(pos);
  
}

// ------------------------------------------

function reverse(s) {

  var result = '';

  for (var i = s.length - 1; i >= 0; i--)
    result += (s.charAt(i));

  return result;

}
String.prototype.reverse = function() { return reverse(this); };

function replicate_old(src, n) {
  var s = '', t = src.toString();
  while (n-- > 0) s += t;
  return s;
}
function replicate(n, s) {
 
  if (arguments.length < 2 || s == undefined) s = ' ';
  
  if (n < 3) {
    if (n == 2) return s + s;
    if (n == 1) return s;
    if (n == 0) return '';
    return replicate(-n, reverse(s));
  }
  
  if (n & 1) {
    n = (n - 1) >> 1;
    var halfResult = replicate(n, s);
    return s + halfResult + halfResult;
  }
  
  n = n >> 1;
  var halfResult = replicate(n, s);
  return halfResult + halfResult;

}
// String.prototype.replicate = new Function("n", "return replicate(n, this);");
String.prototype.replicate = function(n) { return replicate(n, this); };

/**
 * Pads string with specified character to a specified length from the left.
 *
 * @syntax   stringObj.padLeft(length, padChar);
 * @param    padChar   Character for pad.
 * @param    length    Length to pad to.
 * @return   String
 */
String.prototype.padLeft = function(n, c) {
  // TODO handle case when c.length != 1
  if (n < 0) return this.padRight(-n, c);
  var delta = n - this.length;
  if (delta == 0) return this;
  return delta > 0 ? replicate(delta, c) + this : this.substring(-delta);
};

/**
 * padRight
 * Pads string with specified character to a specified length from the right.
 *
 * @syntax   stringObj.padRight(length, padChar);
 * @param    padChar   Character for pad.
 * @param    length    Length to pad to.
 * @return   String
 */
String.prototype.padRight = function(n, c) {
  // TODO handle case when c.length != 1
  if (n < 0) return this.padLeft(-n, c);
  var delta = n - this.length;
  if (delta == 0) return this;
  return delta > 0 ? this + replicate(delta, c) : this.substring(0, this.length + delta);
};

function divByTwo(n) {
  var r = n >> 1;
  return (n & 1) == 1 ? [r + 1, r] : [r, r];
}

/**
 * padRight
 * Pads string with specified character to a specified length from the right.
 *
 * @syntax   stringObj.padSides(length, padChar);
 * @param    padChar   Character for pad.
 * @param    length    Length to pad to.
 * @return   String
 */
String.prototype.padSides = function(n, c) {

  // TODO handle case when c.length != 1
  if (n < 0) return this.padLeft(-n, c);
  var delta = n - this.length;
  if (delta == 0) return this;

  var r = divByTwo(delta);
  var left =  r[0];
  var right = r[1];

  if (left > 0 && right > 0) {
    return replicate(left, c) + this + replicate(right, c);
  }

  if (left <= 0 && right <= 0) {
    return this.substring(-left, this.length() + right);
  }

  if (left <= 0) { // right > 0 
    return s.substring(-left) + replicate(right, c);
  }

  // right <= 0 && left > 0
  return replicate(left, c) + this.substring(0, this.length() + right);

}

// ------------------------------------------

/**
 * Trims string of whitespace from the left.
 *
 * @syntax  stringObj.trimLeft();
 * @return  String
 */
String.prototype.trimLeft = function() {
  return this.replace(/^\s*/, "");
};

/**
 * Trims string of whitespace from the right.
 *
 * @syntax  stringObj.trimRight();
 * @return  String
 */
String.prototype.trimRight = function() {
  return this.replace(/\s*$/, "");
}

/**
 * Skips leading and trailing whitespace
 * and returns everything in between.
 * @syntax  stringObj.trim();
 * @return  String
 */
String.prototype.trim = function() {
  return this.trimLeft().trimRight();
};

/**
 * 'Chops' the leftmost character(s) from the string.
 *
 * @syntax  stringObj.chopLeft([length])
 * @param   length   Optional. Default is 1.
 * @return  String
 */
String.prototype.chopLeft = function(n) {
  return this.substr(n||1);
};

/**
 * 'Chops' the rightmost character(s) from the string.
 *
 * @syntax  stringObj.chopRight([length])
 * @param   length   Optional. Default is 1.
 * @return  String
 */
String.prototype.chopRight = function(n) {
  return this.substring(0,this.length-(n||1));
};

function sortLetterThenNumber(a, b) {
  
  if (a == b) return 0;
  a = a.toString();
  b = b.toString();

  var src, s, comp, c, m, sn, cn;
    var result = 0;
    
  if (a.length < b.length) {
    src = a;
    comp = b;  
    m = 1;
  } else {
    src = b;
    comp = a;
    m = -1;  
  }
  
  for (var i = 0; i < src.length; i++) {
    
    s = src.charAt(i);
    c = comp.charAt(i);
    
    if (s == c) continue;
    
    sn = !isNaN(s);    
    cn = !isNaN(c);    
    
    if (sn && !cn) {
      result = 1;
      break;
    }
    
    if (!sn && cn) {
      result = -1;
      break;
    }
    
    /*
    if (sn && cn) {
      result = -1;
      break;
    }
    */
    
    result = s.toLowerCase() > c.toLowerCase() ? 1 : -1;
    break;  
    
  }
  
  return result * m;

} 

function CVSKit(cvsInfo) {

  var self = this;
  var p, p2;
  var revision, date;

  p = cvsInfo.indexOf('Revision:');
  if (p >= 0) {
    p2 = cvsInfo.indexOf('$', p + 1);
    revision = p2 >= 0 ? cvsInfo.substring(p + 9, p2).trim() : '';
  }
  
  p = cvsInfo.indexOf('Date:');
  if (p >= 0) {
    p2 = cvsInfo.indexOf('$', p + 1);
    date = p2 >= 0 ? cvsInfo.substring(p + 5, p2).trim() : '';
  }

  date = yyyyMMddWithTime2ddMMyyyyWithTime(date); 

  this.getRevision = function() {
    return revision;
  };

  this.getDate = function() {
    return date;
  };

}
