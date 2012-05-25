/**
 * Created on Nov 2, 2004 - 17:00:00 PM
 * $Id: frm-fdt.js,v 1.1.2.3 2011/10/25 12:43:24 81127731572 Exp $
 * Handles field data types in forms.
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
<script type="textjavascript" src="cssKit.js"></script>
<script type="textjavascript" src="cb.js"></script>
<script type="textjavascript" src="frm.js"></script>
<script type="textjavascript" src="dateKit.js"></script>
*/ 

var FRM_FDT_MSGS = new Array();

if (!FRM_FDT_MSGS['INVALID_DATE']) FRM_FDT_MSGS['INVALID_DATE'] = 'Data inválida';
if (!FRM_FDT_MSGS['INVALID_TIME']) FRM_FDT_MSGS['INVALID_TIME'] = 'Hora inválida';
if (!FRM_FDT_MSGS['INVALID_NUMBER']) FRM_FDT_MSGS['INVALID_NUMBER'] = 'Número inválido';
if (!FRM_FDT_MSGS['INVALID_INTEGER']) FRM_FDT_MSGS['INVALID_INTEGER'] = 'Número inteiro inválido';
if (!FRM_FDT_MSGS['INVALID_ALPHA']) FRM_FDT_MSGS['INVALID_ALPHA'] = 'Campo deve conter apenas letras';
if (!FRM_FDT_MSGS['INVALID_EMAIL']) FRM_FDT_MSGS['INVALID_EMAIL'] = 'Email inválido';
if (!FRM_FDT_MSGS['INVALID_CGC']) FRM_FDT_MSGS['INVALID_CGC'] = 'CGC inválido';
if (!FRM_FDT_MSGS['INVALID_CPF']) FRM_FDT_MSGS['INVALID_CPF'] = 'CPF inválido';
if (!FRM_FDT_MSGS['INVALID_MASK']) FRM_FDT_MSGS['INVALID_MASK'] = 'Campo deve seguir a máscara';
if (!FRM_FDT_MSGS['INVALID_REGEXP']) FRM_FDT_MSGS['INVALID_REGEXP'] = 'Campo deve seguir o regexp';

var DATATYPE_ATTRIBUTE = 'dataType';
var MASK_ATTRIBUTE     = 'mask';
var REGEXP_ATTRIBUTE   = 'regexp';

var MIN_VAL_ATTRIBUTE = 'minVal';
var MAX_VAL_ATTRIBUTE = 'maxVal';

var ERROR_MSG_ATTRIBUTE = 'errorMsg'; 


function fdt_doKeyPress(e) {
  var el = getEventSource(e);
  var key = getKey(e);
  
  return fdt_doKeyPress_i(e, key, el);
  
}

function fdt_doKeyPress_i(e, key, el) {

  if (!isTextField(el)) return true;

  if (key == null) return true;

  if ( isControlKey(key) ) return true;

  var keyChar = String.fromCharCode(key);

  var dataType = el.getAttribute(DATATYPE_ATTRIBUTE);
  
  // TODO find correct value when cursor position is not at last character
  var pos = el.value.length;
  var newVal = el.value + keyChar;

  if ( !isPartialValidData(newVal, dataType, el) || dataType == 'mask' ) {
    cancelEvent(e);
    return false;
  } 

  if ('date,time'.indexOf(dataType) < 0 ) {
    return true;
  }

  var mask = '';

  if (dataType == 'date') {
    doDateKeyPress(el, newVal);
  
  } else if (dataType == 'time') {
    doTimeKeyPress(el, newVal);

  } else {
  
    result = testPartialMask(el, newVal, mask);
  }
  
  cancelEvent(e);
  return false;
        
}

function isPartialValidData(val, dataType, el) {

  var result;
  
  switch (dataType) {
  
  case 'number':
    result = isPartialNumber(val);
    break;

  case 'integer':
    result = isPartialInteger(val);
    break;

  case 'alpha':
    result = isAlpha(val);
    break;

  case 'date':
    result = isPartialDate(val);
    break;
        
  case 'time':
  
    result = isPartialTime(val);
    break;
        
  case 'email':
    result = isPartialEmail(val);
    break;

  case 'mask':
    result = testPartialMask(el, val, el.getAttribute(MASK_ATTRIBUTE));
    break;

  case 'regexp':
    // result = (new RegExp(el.getAttribute(REGEXP_ATTRIBUTE))).test(val);
    // TODO implement isPartialRegExp
    result = true;
    break;

  default:
    result = true;        

  }
  
  return result;
    
}

function fdt_doBlur(e) {

  var el = getEventSource(e);

  if (!el.value) {
    removeErrorClass(el);
    return;
  }

  var msg = validateData(el);
  if (msg) {
    cancelEvent(e);
    handleInvalidField(el, msg);
    return false;
  }

  removeErrorClass(el);
  return true;

}

function removeErrorClass(el) {
  cssKit.removeClass(el, 'validationError');
}

function validateData(el) {
  
  var dataType = el.getAttribute(DATATYPE_ATTRIBUTE);

  var msg = '';
  
  var val = el.value;
  
  // TODO Get error message by calling getElementErrorMsg(), el.getAttribute(ERROR_MSG_ATTRIBUTE);
  
  switch (dataType) {
  case 'number':
    if (isNaN(val))
      msg = getElementErrorMsg(el, 'INVALID_NUMBER', val);
    else
      msg = validateMinMax(el, dataType, val);
    break;
        
  case 'integer':
    if (!isInteger(val))
      msg = getElementErrorMsg(el, 'INVALID_INTEGER', val);
    else
      msg = validateMinMax(el, dataType, val);
    break;

  case 'alpha':
    if (!isAlpha(val)) msg = getElementErrorMsg(el, 'INVALID_ALPHA', val);
    break;

  case 'date':
    if (!isValidDate(val))
      msg = getElementErrorMsg(el, 'INVALID_DATE', val);
    else
      msg = validateMinMax(el, dataType, val);
    break;
        
  case 'time':
    if (!isValidTime(val))
      msg = getElementErrorMsg(el, 'INVALID_TIME', val);
    else
      msg = validateMinMax(el, dataType, val);
    break;

  case 'email':
    if (!isValidEmail(val)) msg = getElementErrorMsg(el, 'INVALID_EMAIL', val);
    break;

  case 'cgc':
    if (!ValidateCGCCPF.isValidCGC(val)) msg = getElementErrorMsg(el, 'INVALID_CGC', val);
    break;

  case 'cpf': // TODO
    if (!ValidateCGCCPF.isValidCPF(val)) msg = getElementErrorMsg(el, 'INVALID_CPF', val);
    break;

  case 'mask':
    var mask = el.getAttribute(MASK_ATTRIBUTE);
    if (!testMask(val, mask)) msg = getElementErrorMsg(el, 'INVALID_MASK', val);
    break;

  case 'regexp':
    var regexp = el.getAttribute(REGEXP_ATTRIBUTE);
    if (!(new RegExp(regexp)).test(val)) msg = getElementErrorMsg(el, 'INVALID_REGEXP', val);
    break;

  }

  return msg;

}

function getElementErrorMsg(el, errorType, errorVal) {
  var customErrorMsg = el.getAttribute(ERROR_MSG_ATTRIBUTE);
  if (!customErrorMsg) return FRM_FDT_MSGS[errorType] + ' : ' + errorVal;
  if (customErrorMsg.indexOf('${') == 0) return eval(customErrorMsg.substring(2, customErrorMsg.length - 1) );
  return customErrorMsg;
}

function validateMinMax(el, dataType, val) {

  val = cast(val, dataType);

  var minVal = el.getAttribute(MIN_VAL_ATTRIBUTE);
  minVal = cast(minVal, dataType);
  if ( (minVal || minVal === 0)  && val < minVal) return getElementErrorMsg(el, 'MIN_VAL', minVal);

  var maxVal = el.getAttribute(MAX_VAL_ATTRIBUTE);
  maxVal = cast(maxVal, dataType);
  if ( (maxVal || maxVal === 0)  && val > maxVal) return getElementErrorMsg(el, 'MAX_VAL', maxVal);

  return '';

}

function cast(val, dataType) {

  switch (dataType) {
  case 'number':
    return parseFloat(val);

  case 'integer':
    return parseFloat(val);

  case 'date':
    return Date.fromPtBr(val);

  case 'time':
    return Date.fromPtBr(val);

  case 'cgc':
    return parseInt(val.toString().replace(/\D/, ''));

  case 'cpf': // TODO
    return parseInt(val.toString().replace(/\D/, ''));

  default:
    return val;

  }

}

function testMask(val, mask) {
  return (new RegExp(mask2regexp(mask))).test(val.toLowerCase());
}

function testPartialMask(el, val, mask) {

  var result = testMask(val, mask.substring(0, val.length));
  
  if (!result) return false;
   
  var nextMaskChar;
  var autoPad = '';
  var count = 200;
  var pos = val.length;
  
  while ( 
  (count-- > 0) && 
  (nextMaskChar = mask.charAt(pos++)) && 
  !isMaskChar(nextMaskChar) ) {
    autoPad += nextMaskChar;
  }
      
  el.value = val + autoPad;
  
  return result;
  
}

function mask2regexp(mask) {
  return '^' + mask.replace(/#/g, '\\d').replace(/@/g, '[a-z]').replace(/\./g, '\\.') + '$';
}

function isMaskChar(c) {
  return '#@'.indexOf(c) >= 0;
}

/*
function validateMask(el) {
  // xxx called twice. Why ?
  var val = el.value;
  
  var newVal = applyMask(val,  el.getAttribute(DATATYPE_ATTRIBUTE));

  if (newVal != val) {
    alert('O conteúdo do campo ' + el.name + ' era inválido.');
    el.value = newVal;
    return false;
  }

  return true;

}
*/