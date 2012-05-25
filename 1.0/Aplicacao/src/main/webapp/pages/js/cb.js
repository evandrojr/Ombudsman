/**
 * Created on Nov 2, 2004 - 17:00:00 PM
 * $Id: cb.js,v 1.1.2.1 2011/10/11 12:15:20 03323620941 Exp $
 * Cross-browser functions
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

/*
http://www.webreference.com/js/column11/eventobjectproperties.html

The following table lists the equivalent properties of the event object in Internet Explorer 4.0x and Navigator 4.0x:

Navigator 4.0x   Description   Internet Explorer 4.0x
Property   Value   Value   Property
modifiers   Event
object
properties   Specifies which modifier keys, if any, were pressed when the event occurred. Notice the different implementation in Navigator 4.0x and Internet Explorer 4.0x.   Boolean   altKey
ctrlKey
shiftKey
pageX   Integer   Specifies the horizontal coordinate of the mouse cursor at the time of event, with respect to the target object's page (the browser window).   Integer   clientX
pageY   Integer   Specifies the vertical coordinate of the mouse cursor at the time of event, with respect to the target object's page (the browser window).   Integer   clientY
screenX   Integer   Specifies the horizontal coordinate of the mouse cursor at the time of event, with respect to the client's screen.   Integer   screenX
screenY   Integer   Specifies the vertical coordinate of the mouse cursor at the time of event, with respect to the client's screen.   Integer   screenY
target   Object   A reference of the object for which the event is intended. In other words, this is the object that fired the event.   Object   srcElement
type   String   Specifies the event type (e.g., "click", "mousedown", "keypress"). Notice that the string represents an event, not an event handler.   String   type
which   Integer   Specifies the mouse button or keyboard key code. Note that Internet Explorer 4.0x utilizes two different properties, whereas Navigator 4.0x uses only one. Also note that some code values differ with the browser.   Integer   button
keyCode

This table lists only the properties that are supported by both browsers, although not necessarily under the same name.
For example, both browsers feature a property that reflects the event's intended target.
In Navigator 4.0x, this is the target property, whereas Internet Explorer 4.0x supports it in the form of the srcElement property.
Notice that the blue text represents properties and data types that are different,
while the red text represents indentical properties and data types.
Although we specified that Navigator's pageX and pageY properties are equivalent to Internet Explorer's clientX and clientY properties,
this is only half-true. The clientX and clientY properties do not take into account any page segment that has scrolled scrolled off the viewable portion of the window.
In other words, they only reflect the position of the cursor with respect to the browser's physical window.
A simple set of mathematical equations shows how pageX and pageY (Navigator 4.0x) relate to clientX and clientY (Internet Explorer 4.0x):

pageX = clientX + document.body.scrollLeft;
pageY = clientY + document.body.scrollTop;

The following example displays the location of the mouse cursor (with respect to the page, not the browser window) in the browser's status bar:

<SCRIPT LANGUAGE="JavaScript">
<!--

var nav4 = window.Event ? true : false;

function displayLocation(e) {
  var str = "";
  if (nav4) { // Navigator 4.0x
      str += "X=" + e.pageX;
      str += ", ";
      str += "Y=" + e.pageY;
  } else { // Internet Explorer 4.0x
      str += "X=" + (event.clientX + document.body.scrollLeft);
      str += ", ";
      str += "Y=" + (event.clientY + document.body.scrollTop);
  }
  window.status = str;
}

if (nav4) // Navigator 4.0x
  document.captureEvents(Event.MOUSEMOVE);
document.onmousemove = displayLocation;

// -->
</SCRIPT>

<script language="javascript" type="text/javascript">
<!--

// Inheritance through functions:

// thanks to webreference

function superClass() {
  this.supertest = superTest; //attach method superTest
}

function subClass() {
  this.inheritFrom = superClass;
  this.inheritFrom();
  this.subtest = subTest; //attach method subTest
}

function superTest() {
  return "superTest";
}
  
function subTest() {
  return "subTest";
}


 var newClass = new subClass();

  alert(newClass.subtest()); // yields "subTest"
  alert(newClass.supertest()); // yields "superTest"
 
//-->
</script>
*/

/*

 Getter and setter examples: 
 o = {a: 7, get b() {return this.a+1; }, set c(x) {this.a = x/2}, testFunc: function(param) {alert(param)} };
 alert(o.b) -> 8
 o.c = 10
 alert(o.a) -> 5

 Boolean examples:
 alert(4 && 6) -> 6
 alert(false && 6) -> false
 alert(true && 6) -> 6
 alert(true && !!6) -> true

*/

var isDOM = !!document.getElementById; 
var isIE4 = document.all && !isDOM;
var isNS4 = !!document.layers;
var isDyn = isDOM || isIE4 || isNS4;

var isIE = !!document.all;
var isGecko = !isIE;

// ----
// 'is' example object found at http://www.crockford.com/javascript/jsmin.html
// ----
var is = {
    dom:     !!document.getElementById, 
    ns4:     !!document.layers,
    ie:      navigator.appName == 'Microsoft Internet Explorer',
    java:    navigator.javaEnabled(),
    ns:      navigator.appName == 'Netscape',
    ua:      navigator.userAgent.toLowerCase(),
    version: parseFloat(navigator.appVersion.substr(21)) ||
             parseFloat(navigator.appVersion),
    win:     navigator.platform == 'Win32'
}   
is.mac = is.ua.indexOf('mac') >= 0;
is.ie4 = document.all && !is.dom;
is.dyn = is.dom || is.ie4 || is.ns4;
if (is.ua.indexOf('opera') >= 0) {
    is.ie = is.ns = false;
    is.opera = true;
}
if (is.ua.indexOf('gecko') >= 0) {
    is.ie = is.ns = false;
    is.gecko = true;
}

// -----

function dumpAttributes(obj) {
  var result = "[";
  var val;
  for (var i in obj) {
    val = obj[i];
    if (!val) continue;
    result += i + "=" + val + ";";
  }
  
  return result + "]";
}

/**
 * Found at http://kb.mozillazine.org/JavaScript_Console
 */
function myDump(aMessage, clear) {
  var box = getRef('msgBox');
  if(box) {
    box.innerHTML = clear ? aMessage : box.innerHTML + aMessage + '<br>';
    alert(box.innerHTML);
    return;
  }
  var consoleService = Components.classes["@mozilla.org/consoleservice;1"]
                       .getService(Components.interfaces.nsIConsoleService);
  consoleService.logStringMessage("dump: " + aMessage);
}

function preloadImages(images) {
  // alert(dumpAttributes(Arguments));
  for (i = 1; i < arguments.length; i++) {
    images[i] = new Image();
    images[i].src = arguments[i];
  }
  
}

/*
var mytable = document.getElementById("myTable");
var mytbody = document.getElementById("myTbody");
var myNewtbody = document.createElement("tbody");
myNewtbody.id = "myTbody";
var docFragment = document.createDocumentFragment();
var trElem, tdElem, txtNode;
for (var j = 0; j < tableData.length; j++) {
   trElem = document.createElement("tr");
   trElem.className = "tr" + (j%2);

   tdElem = document.createElement("td");
   tdElem.className = "col0";
   txtNode = document.createTextNode(tableData[j].alpha);
   tdElem.appendChild(txtNode);
   trElem.appendChild(tdElem);
   ...
   tdElem = document.createElement("td");
   tdElem.className = "col4";
   txtNode = document.createTextNode(tableData[j].epsilon);
   tdElem.appendChild(txtNode);
   trElem.appendChild(tdElem);
   
   docFragment.appendChild(trElem);
}
myNewtbody.appendChild(docFragment);
mytable.replaceChild(myNewtbody, mytbody);
*/

function clearChildren(el) {
  while (el.childNodes.length > 0) {
    el.removeChild(el.firstChild);
  }
}

/**
 * Gecko does not provide the document.URLUnencoded property.
 */
function getDocURLUnencoded() {
  return isIE ? document.URLUnencoded : decodeURI(document.location);
}
if (!document.URLUnencoded) document.URLUnencoded = getDocURLUnencoded();

function getSty(id) {
  return isNS4 ? getRef(id) : getRef(id).style;
} 

function getRef(id) {

  var result;

  if (isDOM) {
    result = document.getElementById(id);
    if (!result) result = getElementByName(id);
    
  } else {
    result = isIE4 ? document.all[id] : document.layers[id];
  
  }
  
  return result;
  
}
document.getRef = getRef;

function getElementByName(name) {
  var elArray = document.getElementsByName(name);
  return (elArray && elArray.length > 0) ? elArray.item(0) : null;
}
document.getElementByName = getElementByName;

// Gets the amount of content that has been hidden by scrolling to the right.
function _pageXOffset() {
  return isIE ? eval('document.body.scrollLeft') : eval('window.pageXOffset');
}
// Causes conflict with overlib.js when used under IE 5.2 Mac Edition
// if (isIE) window.pageXOffset = _pageXOffset();

// Gets the amount of content that has been hidden by scrolling down.
function _pageYOffset() {
  return isIE ? eval('document.body.scrollTop') : eval('window.pageYOffset');
}
// Causes conflict with overlib.js when used under IE 5.2 Mac Edition
// if (isIE) window.pageYOffset = _pageYOffset();

function isControlKey(key) {
  // control keys
  // null, bs, tab, cr, esc // , del
  return key==null || key==0 || key==8 || key==9 || key==13 || key==27; // || key==127;
}

function isIndexable(a) {
  return isObject(a) && (a.constructor == Array || ( (!isIE && eval('a.constructor == NodeList')) || (isIE && !!a.length) ) );
}

// Remedial Javasript
// Found at http://www.crockford.com/javascript/remedial.html

function isObject(a) {
  return (a && typeof a == 'object') || isFunction(a);
}

function isUndefined(a) {
  return typeof a == 'undefined';
} 

function isNull(a) {
  return typeof a == 'object' && !a;
}

function isAlien(a) {
  return isObject(a) && typeof a.constructor != 'function';
}

function isArray(a) {
  return isObject(a) && a.constructor == Array;
}

function isDate(a) {
  return isObject(a) && a.constructor == Date;
}

function isBoolean(a) {
  return typeof a == 'boolean';
}

function isEmpty(o) {
  
  var i, v;
  
  if (isObject(o)) {
    for (i in o) {
      v = o[i];
      if (isUndefined(v) && isFunction(v)) {
        return false;
      }
    }
  }
  
  return true;
  
}

function isFunction(a) {
  return typeof a == 'function';
}

function isNumber(a) {
  return typeof a == 'number' && isFinite(a);
}

function isString(a) {
  return typeof a == 'string';
}

// IE5 doesn't support the shift() and unshift() methods of Array that NS4+ does.

if (!Array.prototype.shift) { // if this method does not exist..

  Array.prototype.shift = function() {
    var firstElement = this[0];
    this.reverse();
    this.length = Math.max(this.length-1, 0);
    this.reverse();
    return firstElement;
  };

}

if (!Array.prototype.unshift) { // if this method does not exist..
  
  Array.prototype.unshift = function() {
    this.reverse();

    for(var i = arguments.length - 1; i >= 0; i--) {
      this[this.length] = arguments[i];
    }

    this.reverse();
    return this.length;
  };
  
}

// ------------------------------------------



// ------------------------------------------
// Event-related
// ------------------------------------------

function getKey(e) {

  // Internet Explorer
  if (window.event) return window.event.keyCode;

  // GECKO
  if (e) return e.which;

  return null;

}

function getEventSource(e) {

  // Internet Explorer
  if (window.event) return window.event.srcElement;

  // GECKO
  if (e) return e.currentTarget; // if using e.target, we get the label itself instead of its form control

  return null;

}

function cancelEvent(e) {

  if (window.event) {
    window.event.returnValue = false;

  } else {
    if (e.cancelable) e.preventDefault();

  }

}

function addEvent(obj, eventType, aFunction, isCapture) {

  // W3C DOM
  if (obj && obj.addEventListener) {
    obj.addEventListener(eventType, aFunction, isCapture);
    return true;
  }

  // Internet Explorer
  if (obj && obj.attachEvent) {
    return obj.attachEvent("on" + eventType, aFunction);
  }

  return false;

}

function removeEvent(obj, eventType, aFunction, isCapture) {
    
  if (obj.removeEventListener) {
    obj.removeEventListener(eventType, aFunction, isCapture);
    return true;
  }

  if (obj.detachEvent) {
    return obj.detachEvent("on" + eventType, aFunction);
  }

  return false;

}