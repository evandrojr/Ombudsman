/**
 * Created on Nov 2, 2004 - 17:00:00 PM
 * $Id: frm.js,v 1.1.2.2 2011/10/25 12:43:24 81127731572 Exp $
 * Form-related functions
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

var AUTOFOCUS_ATTRIBUTE = "autoFocus";

var TRANSFORM_ATTRIBUTE = "text-transform";

// var DEFAULT_INPUT_TRANSFORM = "";

function isTextField(el) {
  return 'text|textarea|password'.indexOf(el.type) >= 0;
}

function isCheckableField(el) {
  return 'checkbox|radio'.indexOf(el.type) >= 0;
}

function formURLEncoded(frm, includeButtons) {

  var result = "";
  var el;

  for (var i = frm.elements.length - 1; i >= 0; i--) {
    el = frm.elements[i];
    if (el.name && el.value && (el.type != 'button' || includeButtons ) ) result += '&' + encodeURIComponent(el.name) + '=' + encodeURIComponent(el.value);
  }
  
  return result.length > 1 ? result.substring(1) : result;  

}

function clearForm(frm) {
  
  var el;

  for (var i = frm.elements.length - 1; i >= 0; i--) {

    el = frm.elements[i];
    // alert(el.name + ': ' + el.type);

    var noClear = el.getAttribute('noClear');
    if (el.disabled || (noClear && 'true' == noClear.toLowerCase()) ) continue;

    if (isTextField(el)) {
      el.value = '';

    } else if (el.type == 'select-one') {
      el.selectedIndex = getDefaultSelectedIndex(el);

    } else if (el.type.indexOf('select-multi') >= 0) {
      el.selectedIndex = -1;

    } else if (isCheckableField(el)) {
      el.checked = false;
            
    }

  }

}

function countSelected(el) {

  if (!el) return 0;

  if (isCheckableField(el)) return el.checked ? 1 : 0;
  
  if (el.type == 'select-one') {
    return el.selectedIndex < 0 ? 0 : 1;
  }

  if (!el.length) return 0;
  
  var result = 0;
  var eli;   // IE needs this

  var isCheckable = el.length?isCheckableField(el[0]):isCheckableField(el);
  for (var i = el.length - 1; i >= 0; i--) {
    if (isCheckable) {
      eli = el[i];
      if (eli && eli.checked) result++;
    } else {
      eli = el.options[i];
      if (eli && eli.selected) result++;
  
    }
  }

  return result;
}

function getSelectedValue(el, valueArray) {

  if (!el) return null;
  
  if (isCheckableField(el)) return el.checked ? (valueArray ? valueArray[0] : el.value) : null;
  
  var index;

  var arSelected = new Array();
  var eli;

  if (el.type == 'select-one') {
    index = el.selectedIndex;
    if (index < 0) return null;
    return el.options[index].value;
  }
  
  if (el.type == 'select-multiple') {

     while ((index = el.selectedIndex) != -1) {
       eli = el.options[index];
       arSelected.push( (valueArray ? valueArray[index] : eli.value) );
       eli.selected = false;
     } 
 
    if (arSelected.length < 1) return null;
    return arSelected;
    
  }

  if (isIndexable(el)) {

    for (var i = 0; i < el.length; i++) {
      eli = el[i];
      if (eli.checked) arSelected.push( (valueArray ? valueArray[index] : eli.value) );
    }

    if (arSelected.length < 1) return null;
    return arSelected;

  }

  if (isTextField(el)) return el.value;

  return null;
  
}

function selectValue(el, val) {
  
  var index;
  var selIsIndexable = isIndexable(el);
  
  if (isIndexable(val)) {
    for (var i = val.length - 1; i >= 0; i--) {
      index = getSelectIndexByValue(el, val[i]);
      // if not found, no change
      if (index < 0) continue;
      if (selIsIndexable) {
        el[i].checked = true;
      } else {
        el.options[i].selected = true;
      }
      
    }
    return val.length;
  }
  
  index = getSelectIndexByValue(el, val);

  // if not found, no change
  if (index >= 0) {
      if (selIsIndexable) {
        el[index].checked = true;
      } else {
        el.options[index].selected = true;
      }

  }

  return index;
  
}

// --------------- Checkbox control ---------------

function setCBs(mcb, cbName) {
  if (!cbName || cbName == '') cbName = 'cb';
  checkAllCBByName(cbName, mcb.checked);
}

function checkAllCBByName(cbName, b) {
  checkAllCB(document.getElementsByName(cbName), b);
}

function checkAllCB(cbArray, b) {
  
  var changed = 0;

  if (cbArray.type == 'checkbox') {
    
    if (cbArray.disabled) {
      return changed;
    }
    
    if (cbArray.checked != b) {
      changed++;
      cbArray.checked = b;
    }
    
    return changed;
  
  }
  
  if (!cbArray.length) {
    return 0;
  }

  var cb;

  for (var i = cbArray.length - 1; i >= 0; i--) {
    
    cb = cbArray[i];
    
    if (cb.type == 'checkbox' && !cb.disabled) {
      if (cb.checked != b) {
        changed++;
        cb.checked = b;
      }
    }
  
  } // for
  
  return changed;
  
}

// --------------- Select control ---------------

function populateOptions(srcArray, sel, clearAll) {
  
  var opts = sel.options;
  
  if (clearAll) opts.length = 0;
  
  if(!srcArray) return;
  
  var tableEl, len = srcArray.length;
  
  for (var i = 0; i < len; i++) {
    tableEl = srcArray[i];
    opts[i] = new Option(tableEl[1], tableEl[0]);
  }
  
}

function serializeOptions(sel, withText) {
  
  var opts = sel.options, len = sel.length;
  
  var destArray = new Array(len);
    
  var tableEl;
  
  for (var i = len - 1; i >= 0; i--) {
    tableEl = opts[i];
    destArray[i] = withText ? [tableEl.value, tableEl.text] : [tableEl.value];
  }
  
  return destArray;
  
}

function getSelectIndexByValue(sel, val) {
  if (isIndexable(sel)) 
    for (var i = sel.length - 1; i >= 0; i--) {
      if (sel[i].value == val) return i;
    }
  else
    for (var i = sel.length - 1; i >= 0; i--) {
      if (sel.options[i].value == val) return i;
    }
  
  return -1;
}

function getSelectIndexByName(sel, name) {
  for (var i = sel.length - 1; i >= 0; i--) {
    if (sel.options[i].text == name) return i;
    
  }
  return -1;
}

function getDefaultSelectedIndex(sel) {

  for (var i = sel.length - 1; i >= 0; i--) {
    if (sel.options[i].defaultSelected) return i;
  }
  // alert('not found: ' + sel.name);
  return 0;
}

function selectDefault(sel) {
  var index = getDefaultSelectedIndex(sel);
  sel.selectedIndex = index;
  return index;
}

function getSelectedName(sel) {
  var index = sel.selectedIndex;
  if (index < 0) return null;
  return sel.options[index].text;
}

function selectName(sel, name) {
  var index = getSelectIndexByName(sel, name);
  // if not found, no change
  if (index >= 0) sel.selectedIndex = index;
  return index;
}
// Option.prototype.setName = new Function("name", "return selectName(this, name);");

// -----

function processAutoFocus(container) {

  var autoFocus = container.getAttribute(AUTOFOCUS_ATTRIBUTE);
  var focusEl;
  
  if (autoFocus) {
    focusEl = container.elements[autoFocus];
    if (focusEl && !focusEl.disabled) focusEl.focus();
  }
  
  return focusEl;
  
}

function focusToFirst(container) {
  
  if (!container) return null;
  
  var firstElement = getFirstInTabOrder(container)
  
  if (!firstElement) {
    return processAutoFocus(container);
  }
  
  // alert("Setting focus to " + firstElement.name);

  if (!firstElement.disabled) firstElement.focus();
  return firstElement;

}

function getFirstInTabOrder(container) {
  return getNextInTabOrderFromForm(container, -1);
}

function getNextInTabOrderFromForm(container, minIndex) {

  if (!container) return null;

  if (!minIndex) minIndex = 0; // TODO -1 ?
  var testI = -1;
  var inf = 100000;

  var nextElement;
  var fel;

  for (var i = container.elements.length - 1; i >= 0; i--) {
    fel = container.elements[i];
    testI = fel.getAttribute('tabindex');
  
    if (!testI || testI <= minIndex) {
      continue
    }
    
    if (inf > testI) {
      inf = testI;
      nextElement = fel;
    }

  }

  /*
  if (container.elements.length > 0 && !nextElement) 
    alert("Erro!\rNem todos campos desta tela possuem o atributo 'tabindex'.\rÉ necessário que TODOS os campos possuam este atributo.");
  */
  
  // else alert(nextElement.name + " tabIndex: " + inf);

  return nextElement;

}

function getNextInTabOrder(el) {
    
  if(!el) {
    alert('No element at getNextInTabOrder!');
    return null;
  }

  // TODO el.form is too specific
  var nextElement = getNextInTabOrderFromForm(el.form, el.getAttribute('tabindex'));
  return nextElement ? nextElement : el;

}

// -------------------------
// Text transofrmation
// -------------------------

function textTransform(el) {

    var textTrans = el.getAttribute(TRANSFORM_ATTRIBUTE);
    // alert(el.name + ": " + textTrans);

    if (!textTrans) {
      if (isTextField(el) && el.type != 'password')
        textTrans = DEFAULT_INPUT_TRANSFORM;
      else
        textTrans = "none";
    }
  
     textTrans = textTrans.toLowerCase();
      
    if (textTrans == "upper")
      el.value = el.value.toUpperCase();
    else if (textTrans == "lower")
      el.value = el.value.toLowerCase();
    else if (textTrans == "none") {
      // nothing to do.
    }

}

function elementsTextTransform(container) {
  
  if (!container)
    return;
  
  for (var i = container.elements.length - 1; i >= 0; i--) {
    textTransform(container.elements[i]);
  }

}