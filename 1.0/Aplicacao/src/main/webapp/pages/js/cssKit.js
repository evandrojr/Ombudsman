/**
 * Created on Dec 27, 2004 - 14:30:00 PM
 * $Id: cssKit.js,v 1.1.2.1 2011/10/11 12:15:20 03323620941 Exp $
 * CSS-related stuff
 * @author Copyright (C) 2004 Elifarley Callado Coelho Cruz <elifarley@yahoo.com>
 * @version 1.0
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

var cssKit = {

	getWidth: function(el) {
		return parseInt(el.style.width);
	},

	getHeight: function(el) {
		return parseInt(el.style.height);
	},

	setWidth: function(el, val, unit) {
		if (!unit) unit = 'px';
		el.style.width = val + unit;
	},

	setHeight: function(el, val, unit) {
		if (!unit) unit = 'px';
		el.style.width = val + unit;
	},

	setSize: function(el, width, height, unit) {
		if (!height) height = width;
		if (!unit) unit = 'px';
		el.style.width  = width + unit;
		el.style.height = height + unit;
	},

  setVisible: function(el, b) {
	  if (!el) return;
	  el.style.visibility = b ? 'visible' : 'hidden';
  },
  
  addClass: function(el, className) {
    el.className += ' ' + className;
  },

  removeClass: function(el, className) {
    var elClass = el.className;
    if (!elClass || elClass.indexOf(className) < 0) return false;
    el.className = elClass.replace(new RegExp('\s*' + className, 'g'), '');
    return true;
  }

}