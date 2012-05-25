/**
 * Created on Nov 2, 2004 - 17:00:00 PM
 * $Id: frm-rh.js,v 1.1.2.1 2011/10/11 12:15:20 03323620941 Exp $
 * Allows the return key to change focus
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
<script type="textjavascript" src="frm.js"></script>
*/ 


// -------------------------
// Return handling (to act as a tab key)
// -------------------------

function installReturnHandler() {
  // TODO Under IE, installing an event handler for the document and another for an input prevents the input events from happening.
  /*
	document.onkeydown = returnHanlder; 
	if ( !isIE ) { 
	  document.captureEvents( Event.KEYDOWN|Event.KEYUP ); 
  } 
	*/
	addEvent(document, 'keydown', returnHanlder, true);

}

function returnHanlder(e) {
	// TODO FIX: under Mozilla, keydown cannot be cancelled.
 
	if (!e) {
		alert('No event at returnHanlder!');
		return true;
	}

	var source = getEventSource(e);
	var k = getKey(e);
	
	if ( k != 13 ) return true;
	
	if ( 'button,submit'.indexOf(source.type) != -1) { 
		return true;
	}

	var nextField = getNextInTabOrder(source);
	
	if (!nextField) {
		//if (e.cancelable) e.preventDefault();
		cancelEvent(e);
		return false;
	}

	// alert(nextField.name);
	
	if ( 'submit,button'.indexOf(nextField.type) != -1) { // TODO maybe exclude the test for button ...
		// submit, we finished all fields 
		//nextField.focus();
		nextField.click();
		return true;
	}

	// we are not done yet, send focus to next box 
	nextField.focus();
	if (isTextField(nextField)) nextField.select();

	cancelEvent(e);
	return false; 
	
}