/*
 * $Id: site-common.js,v 1.1.2.1 2011/10/11 12:15:20 03323620941 Exp $
 * 
 * Common functions for the site
 * Author: Elifarley Callado Coelho Cruz
 */

var DEFAULT_INPUT_TRANSFORM = "none";

var tipos_grafico_options = [ ['pie3d', 'Pizza'], ['verticalbar3d', 'Barra'], ['line', 'Linha'] ];

var tipos_grafico = new Array();
tipos_grafico['verticalbar3d'] = 'Barra';
tipos_grafico['line'] = 'Linha';
tipos_grafico['pie3d'] = 'Pizza';

var modos_exibicao = ['Consolidado', 'Detalhado'];

var agrupamento = {
	index: 'dwmsy',
	items: ['Di&aacute;rio', 'Semanal', 'Mensal', 'Semestral', 'Anual'],
	itemUnits: ['dia', 'semana', 'm&ecirc;s', 'semestre', 'ano'],
	
	fromChar: function(c) { var i = this.index.indexOf(c); return i >= 0 ? this.items[i] : 'INEXISTENTE'; },
	fromCharAsUnit: function(c) { var i = this.index.indexOf(c); return i >= 0 ? this.itemUnits[i] : 'INEXISTENTE'; },
	
	getDateSpan: function(frm) {
		getDateSpan(frm);	
	}
	
};

function getDateSpan(frm) {

	if (!datesAreValid(frm)) return null;

	// alert(1 + Date.fromPtBr(frm.txt_periodo_i.value).getMonthWeek());

	var agr = getSelectedValue(frm.sel_agrupamento);
	var old_agr = agr;

	var unitIndex = 'dwmsy'.indexOf(agr);
	var format = ['dddd', 'w', 'MMMM', 'S/yyyy', 'yyyy'][unitIndex];

	switch (agr) {
		case 's': agr = '1S'; break;
		case 'm': agr = '1M'; break;
		default: agr = '1' + agr;
	}
	
	var result = Date.span(frm.txt_periodo_i.value, frm.txt_periodo_f.value, agr, format, 1000, true);
	
	if (old_agr == 'w') return result.iterate(function(item, index) {return 'Semana ' + item;});
	if (old_agr == 's') return result.iterate(function(item, index) {return item.toString().replace(/\d/, function(s) {switch(s) {case '1': return 'Primeiro Semestre'; case '2': return 'Segundo Semestre';} });});
	
	return result;

}	

function datesAreValid(frm) {
  return frm.txt_periodo_i.value && frm.txt_periodo_f.value && isValidDate(frm.txt_periodo_i.value) && isValidDate(frm.txt_periodo_f.value) && ( convertPtBr2ISO8601DateShort(frm.txt_periodo_i.value) <= convertPtBr2ISO8601DateShort(frm.txt_periodo_f.value) ) ;
}

function writeRounded(val, n, fixedLen) {
  document.write(val.toFixed(n === 0 ? 0 : n || 2).toString().padLeft(fixedLen || 6).replace(/\s/g, '&nbsp;'));
}

var adder = {
 sum: [],
 add: function (key, v) {
  if (!this.sum[key]) {
    this.sum[key] = v;
    return;
  }
  this.sum[key] += v;
 },

 writeSum: function (key) {
   document.write(this.sum[key]);
 },

 getSum: function (key) {
   return this.sum[key];
 }

};

// Extra

Array.prototype.filter = function(c) {
  for (var i = 0; i < this.length; i++)
     if (c(this[i], i))
      this.splice(i--, 1);
  return this;
};

Array.prototype.iterate = function(c) {
   for (var i = 0; i < this.length; i++)
    this[i] = c(this[i], i);
   return this;
};

Array.prototype.indexOf = function(element) {
  for (var i = this.length; i > -1 && element != this[i]; i--);
  return i;
};

function afterPageBody() {
	
	var theForm = document.forms[0];

	if (theForm) {
		installAttributesOnForm(theForm);
		installReturnHandler();
		focusToFirst(theForm);
	}

	theForm = document.forms[1];
	if (theForm) {
		installAttributesOnForm(theForm);
	}
	
	// installMsgTab(10, 5); // 10, 5

}

function installAttributesOnForm(theForm) {

	// var theForm = document.forms[0];
	
	if (!theForm)
		return;
		
	var el;
	for(var i = theForm.elements.length - 1; i >= 0; i--) {
    
    el = theForm.elements[i];
    
		elTransform = el.getAttribute(TRANSFORM_ATTRIBUTE);

    if (
      el.getAttribute(DATATYPE_ATTRIBUTE) || 
      (el.type == 'textarea' && el.getAttribute('maxlength')) ||
      ( (DEFAULT_INPUT_TRANSFORM && DEFAULT_INPUT_TRANSFORM != 'none') || (elTransform && elTransform != 'none') )
    ) installMask(el);
    
  }

}

function installMask(obj) {

	// addEvent(obj, "keypress", fdt_doKeyPress, false);
	// addEvent(obj, "keypress", textAreaMaxLength_doKeyPress, false);
	addEvent(obj, "keypress", site_doKeyPress, false);
	addEvent(obj, "blur", site_doBlur, false);

}

function site_doKeyPress(e) {
  if (!textAreaMaxLength_doKeyPress(e)) return false; 
  return fdt_doKeyPress(e);
}

function site_doBlur(e) {
	textTransform(getEventSource(e)); // TODO Put textTransform in separate file.
  textAreaMaxLength_doBlur(e);
  return fdt_doBlur(e);
}

/**
 * Called by fdt_doBlur(e).
 *
 */
function handleInvalidField(el, msg) {
  el.title = msg;
  cssKit.addClass(el, 'validationError');
  el.focus();
  if (isTextField(el)) el.select();
  return false;
}

// -----

