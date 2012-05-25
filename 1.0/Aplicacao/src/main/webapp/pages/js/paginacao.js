
function getRowsCount(el) {
	return el.rows.length;
}

function getStyleBackgroundColor(el) {
	var styleSheets, cssRules; 

	styleSheets = document.styleSheets;
	if (styleSheets) {
		for(var i=0; i<styleSheets.length; i++) {
			cssRules = styleSheets[i].cssRules || styleSheets[i].rules;
			for(var j=0; j<cssRules.length; j++) {
				if ( cssRules[j].selectorText == el ) {
					return cssRules[j].style.backgroundColor; 
				}
			}
		}
	}
	return 'white';
}

function setCellBackgroundColor(el) {

	var rows = el.rows;
	var cont = rows.length;

	var even = getStyleBackgroundColor('.tdHeader3');
	var odd  = getStyleBackgroundColor('.tdHeader4');

	var color = even;
	for(var i=1; i<(cont - 1); i++) {
		color = color==even?odd:even; 
		for( var j=0; j<rows[i].cells.length;j++) {
			rows[i].cells[j].style.backgroundColor = color;
		}
	}

	/* Contador de registros */	
	if( rows[1].cells.length == 1 ) {
		var texto = rows[1].cells[0].innerHTML;
		if ( texto == "Nenhum registro encontrado." ) {
			document.getElementById("total").innerHTML = "<a href='javascript:void(0);'><strong>Total: 0 registro(s)</strong></a>";	
		}
	}	
		
}

function setElementHeight(el, cont) {

	var multiplicador = 19;
	if (arguments.length == 3 ) {
		multiplicador = parseInt(arguments[2]);
	}
	
	var height = 0;
	if(cont > 0 ) {
		height = multiplicador * ( (cont>22?22:cont) + 4 );
	}
	try {
		el.style.height = height; 
	} catch(e) {}
}

function setImageSrc() {
	for(var i=0; i<document.images.length; i++ ) {
		var img = document.images[i];
		try { 
			if ( img.id == 'prtes' ) {
				img.src = "../images/seta_prtes.gif";
			} 
			else if ( img.id == 'prtes1' ) {
				img.src = "../images/seta_prtes1.gif";
			}
			else if ( img.id == 'prtdir' ) {
				img.src = "../images/seta_prtdir.gif";
			}
			else if ( img.id == 'prtdir1' ) {
				img.src = "../images/seta_prtdir1.gif";
			}
		} catch(e) {
		}
	}
}


