/**
 * Created on Nov 2, 2004 - 17:00:00 PM
 * $Id: frm-taml.js,v 1.1.2.1 2011/10/11 12:15:20 03323620941 Exp $
 * Allows the attribute 'maxlength', normally used in text inputs, to work with
 * input fields of type 'textarea'.
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
<script type="textjavascript" src="cb.js"></script>
*/

function textAreaMaxLength_doKeyPress(e) {
  return textAreaMaxLength_i(getEventSource(e));
}

function textAreaMaxLength_i(el) {

	if (el.type != 'textarea' || el.value.length < el.getAttribute('maxlength') ) {
	  return true;
	}
	
  // alert('textarea >= ' + el.getAttribute('maxlength'));
  
  //cancelEvent(e);
  return false;

}

function textAreaMaxLength_doBlur(e) {

	var el = getEventSource(e);

	if (el.value) {
    limitTextArea(el);
	}

}

function limitTextArea(el) {
  
  if (el.type != 'textarea') return;

  var val = el.value;
  if (!val) return;
  
  var maxLength = el.getAttribute('maxlength');
  if (!maxLength) return;
  
  if (val.length > maxLength ) {
	  el.value = val.substring(0, maxLength);

	}
	
}