<!-- //

	function setFocusById(id) {
		try {
			document.getElementById(id).focus();
		} catch(e) {}
	}
	
	function novaJanela( mypage, myname, w,h, scroll, resize, LeftPosition, TopPosition) {
		var settings = 'height='+h+',width='+w+',top='+TopPosition+',left='+LeftPosition+',scrollbars='+scroll+',resizable='+resize+'';
		var win = window.open(mypage,myname,settings);
		try {
			win.window.focus();
		} catch (e) {
		}
		return win;
	}

	function abreConfirmacao(callBack) {
		var baseHref = location.protocol + "//" + location.host + location.pathname;
		novaJanela( baseHref + "../../../pages/Confirma.jsp?action=" + callBack, "Confirma", 350, 170, 0, 0, 300, 200 ); 
	}

	function abreAlerta(texto) {
		var baseHref = location.protocol + "//" + location.host + location.pathname;		
		return novaJanela( baseHref + "../../../pages/Alerta.jsp?error=" + texto, "Erro", 450, 180, 0, 0, 300, 200 ); 
	}

	function abreAlertaGeral(titulo, texto) {
		var baseHref = location.protocol + "//" + location.host + location.pathname;		
		novaJanela( baseHref + "../../../pages/AlertaGeral.jsp?titulo=" + titulo + "&texto=" + texto, "Erro", 450, 180, 0, 0, 300, 200 ); 
	}

	function montaHtmlImpressaoIndicadores(baseHref, esquemaCores, htmlContent) {
		var html = "";

		html  = '<html lang="pt">';
		html += '<head>';
		html += '<base href="' + baseHref + '/">';
		html += '<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">';
		html += '<title>Indicadores</title>';
		html += '<link rel="stylesheet" type="text/css" media="all" href="pages/' + esquemaCores + '/estilo_conteudo.css">';
		html += '<link rel="stylesheet" type="text/css" media="print" href="pages/' + esquemaCores + '/estilo_print.css">';
		html += '<script language="JavaScript">function writeRounded(a,b) {};</' + 'script>';
		html += '<script language="JavaScript">function adder() {};</' + 'script>';
		html += '</head>';
		html += '<body>';
		html += htmlContent;
		html += '</body>';
		html += '</html>';
		
		return html;		
	}
	
	function formataErro(campo) {
		var str;
		str  = '<li tabindex="3">';
		str += campo;
		str += '</li>';
		return str;
	}

	function validaHora(hora) {
		if( hora.indexOf(":") < 0 ) return false;	
		return /^([01]?[0-9]|[2][0-3])(:[0-5][0-9])?$/.test(hora); 
	}
	
	
	function isInteger(s){
		var i;
	    for (i = 0; i < s.length; i++){   
	        var c = s.charAt(i);
	        if (((c < "0") || (c > "9"))) return false;
	    }
	    return true;
	}	

	function y2k(number) {
		return ( number < 1000) ? number + 1900 : number;
	}

	function validaData( myDate ) {
		var sep = "/";

	    if (myDate.length == 10) {
    	    if (myDate.substring(2,3) == sep && myDate.substring(5,6) == sep) {
        	    var date  = myDate.substring(0,2);
            	var month = myDate.substring(3,5);
	            var year  = myDate.substring(6,10);

    	        var test = new Date(year,month-1,date);
        	    if (year == y2k(test.getYear()) && (month-1 == test.getMonth()) && (date == test.getDate())) {
            	    return true;
	            } else {
        	        return false;
            	}
	        } else {
    	        return false;
        	}
	    } else {
    	    return false;
	    }
	}
	
	function validaRetornandoData( myDate, myHour ){

		if ( !validaData(myDate) ){
			return null;
		}

		if ( !validaHora(myHour) ){
			return null;
		}

		var date  = myDate.substring(0,2);
        var month = myDate.substring(3,5);
	    var year  = myDate.substring(6,10);
		var hour  = myHour.substring(0,myHour.indexOf(':'));
		var minute = myHour.substring(myHour.indexOf(':')+1,myHour.length);

		return new Date(year,month-1,date,hour,minute);	
	}

	function validaRetornandoDataHora( myDate, myHour, label ) {
		var msgError = null;

		if ( !validaData(myDate) ){
			msgError  = formataErro( "Data de " + label + " invalida, use o formato dd/mm/aaaa" );
		}

		if ( !validaHora(myHour) ){
			msgError += formataErro( "Hora de " + label + " invalida, use o formato hh:mm" );
		}
		
		if (msgError != null) {
			return msgError;
		}

		var date  = myDate.substring(0,2);
        var month = myDate.substring(3,5);
	    var year  = myDate.substring(6,10);
		var hour  = myHour.substring(0,myHour.indexOf(':'));
		var minute = myHour.substring(myHour.indexOf(':')+1,myHour.length);

		return new Date(year,month-1,date,hour,minute);	
	}


	function dateToString(date, sep){

		var dia  = date.getDate();
        var mes  = date.getMonth() + 1;
	    var ano  = date.getFullYear();

		return (dia<10?("0"+dia):dia) + sep + (mes<10?"0"+mes:mes) + sep + ano;	
	}

	function validaDataMaior( myDate, myHour ){

		if ( !validaData(myDate) ){
			return false;
		}

		if ( !validaHora(myHour) ){
			return false;
		}

		var now = new Date();
		var hoje = new Date(y2k(now.getYear()),now.getMonth(),now.getDate(), now.getHours(), now.getMinutes());
		
		var date  = myDate.substring(0,2);
        var month = myDate.substring(3,5);
	    var year  = myDate.substring(6,10);
		var hour = myHour.substring(0,myHour.indexOf(':'));
		var minute = myHour.substring(myHour.indexOf(':')+1,myHour.length);
		
		var test = new Date(year,month-1,date,hour,minute);	
		
		if (test < hoje){
			return false;
		} else {
			return true;
		}

	}
	
	function validaCPF(cpf){ 
		var i; 
		var c = cpf.substr(0,9); 
		var dv = cpf.substr(9,2); 
		var d1 = 0; 
	
		if (cpf.length != 11){
			return false;
		}
		
		for (i = 0; i < 9; i++){ 
			d1 += c.charAt(i)*(10-i); 
		} 
	
		if (d1 == 0){ 
			return false; 
		} 
	
		d1 = 11 - (d1 % 11); 
	
		if (d1 > 9) d1 = 0; 
	
		if (dv.charAt(0) != d1) { 
			return false; 
		} 
	
		d1 *= 2; 
	
		for (i = 0; i < 9; i++){ 
			d1 += c.charAt(i)*(11-i); 
		} 
	
		d1 = 11 - (d1 % 11); 
	
		if (d1 > 9) d1 = 0; 
	
		if (dv.charAt(1) != d1){ 
			return false; 
		} 
		return true; 
	} 
	

	function limpaCampoEmBranco(item)
	{
	 	//var tmp = "";
	 	var item_length = item.value.length;
		var item_length_minus_1 = item.value.length - 1;
		var temConteudo = false;
	
		// Verifica se foi informado algo no campo
		for (index = 0; index < item_length; index++)
		{
			//alert('index: ' + index + ' - char:' + item.value.charCodeAt(index) + '*');
			
			if ((item.value.charCodeAt(index) != 32) &&
				(item.value.charCodeAt(index) != 13) &&
				(item.value.charCodeAt(index) !=  9)  &&
				(item.value.charCodeAt(index) != 10) ) {
				temConteudo = true;
			}
		}
		
		if (temConteudo == false) {
			item.value = '';
		}	
	}
	
	function isAlfaNumerico(s){
		var i;
	  
	  for (i = 0; i < s.length; i++){   
	  	var c = s.charAt(i);
	    if (c < "0") return false;
	    if ((c > "9") && (c < "A")) return false;
	    if ((c > "Z") && (c < "a")) return false;
	    if (c > "z") return false;
	  }
	  
	  return true;
	}

	// VALIDAR CNPJ
	function ValidarCNPJ(obj) {
	   var DV       = "";
	   var DVCPFCGC = "";
	   var w        = "";
	   var dvcalc   = "";
	   var Flagerro = false;
	   
	   var txtcpfcgcdev = "";
	
	   txtcpfcgcdev = AlinharTirarBrancos(obj.value);
	   txtcpfcgcdev = DeseditarCPFCGC(txtcpfcgcdev);
	   
	   if ((txtcpfcgcdev.length != 11)&&(txtcpfcgcdev.length != 14)) {
		  obj.focus();
	      return false;
	   }
	   else {
	      if (txtcpfcgcdev*1 == 0) {
	         return false;
	      }
	      else {
	         if (txtcpfcgcdev.length == 14) {
	            DVCPFCGC = txtcpfcgcdev.substring(12, 14);
	            w = txtcpfcgcdev.substring(0, 12);
	            dvcalc = (CalcDvMod11(w))
	         }
	         else { // S? pode ser 14
	         	return false;
	         }
	      }
	   } //Fim do else ... 
	   if (DVCPFCGC != dvcalc) {
		  //obj.value ="";
	      return false;
	   }

	   return true;
	
	}
	
	//----------------------------------------
	function DeseditarCPFCGC(aCPF_CGC) {
	   var s  = "";
	   var p1 = 0;
	   var p2 = 0;
	
	   s = aCPF_CGC;
	   p1 = -2;
	   p2 = p1;
	   while ((p1 != -1) || (p2 != -1)) {
	     p1 = s.indexOf("/");
	     if (p1 >= 0) {
	        s = s.substring(0, p1) + s.substring(p1+1, s.length);
	     }
	     p2 = s.indexOf("-");
	     if (p2 >= 0) {
	        s = s.substring(0, p2) + s.substring(p2+1, s.length);
	     }
	   }
	   return s;
	} 
		
	//----------------------------------
	function CalcDVMod112aInf (Valor) {
	   var DV = "";
	   for (k = 1; k <= 2; k++) {
	      var Tam = Valor.length;
	      var Soma = 0;
	      var Mult = 1;
	      for (i = Tam-1; i >= 0; i--) {
	          Mult = Mult + 1;
	          Soma = Soma + (parseInt(Valor.substring(i, i+1)*1) * Mult);
	      }
	      Quo = parseInt(Soma / 11);
	      Resto = (Soma - (Quo * 11));
	      NovoDv = 0;
	      if (Resto > 1) {
	         NovoDv = (11 - Resto);
	      }
	      //'DV = DV & Mid(Str(NovoDv), 2)
	      DV = DV + NovoDv
	      Valor = Valor + NovoDv
	   }
	   return DV
	}
	
	//------------------------------------------------------------------------------
	function CalcDvMod11(Valor) {
	  var dv    = ""; //' String 'DV calculado (dois d?gitos)
	  var k     = 0;  //' Integer 'Contadores
	  var i     = 0;  //' Integer 'Contadores
	  var Tam   = 0;  //' Integer 'Tamanho de 'Valor'
	  var Mult  = 0;  //' Integer
	  var Soma  = 0;  //' Integer
	  var Resto = 0;  //' Integer
	  var Quo   = 0;  //' Integer
	  var Nov   = 0;  //' Integer 'Valor num?rico do DV
	  for (k=1; k <= 2; k++) {
	    Tam = Valor.length;
	    Soma = 0;
	    Mult = 1;
	    for (i=Tam-1; i >= 0; i--) {
	      Mult = Mult + 1;
	      Soma = Soma + (parseInt(Valor.substring(i, i+1)*1) * Mult);
	      if (Mult == 9) {
	         Mult = 1;
	      }   
	    }
	    Quo   = parseInt(Soma / 11);
	    Resto = Soma - (Quo * 11);
	    Nov   = 0;
	
	    if (Resto > 1) {
	      Nov = (11 - Resto);
	    }
	    dv = dv + Nov
	    Valor = Valor + Nov;
	  } 
	  return dv;
	}	

	function AlinharTirarBrancos(area) {
	   var Linha  = ""; //'As String
	   var warea  = ""; //'As String
	   var w      = 0;  //'As Integer
	   var flagbr = 0;  //'As Integer
	   var TamLin = 0;  //'As Integer 'Tamanho
	   flagbr = -1;
	   Linha  = "";
	   TamLin = area.length;
	   for (w = 0; w < TamLin; w++) {
	      warea = area.substring(w, w+1);
	      if (warea != " ") {
	         if (flagbr == 1) {
	            Linha = Linha + " " + warea;
	            flagbr = 0;
	         }
	         else {
	            Linha = Linha + warea;
	            flagbr = 0;
	         }
	      }
	      else {
	         if (flagbr == 0) {
	            flagbr = 1;
	         }
	      }
	   } 
	   return Linha;
	}
	
	function textCounter(field, countfield, maxlimit) {
		if (field.value.length > maxlimit) {
			countfield.innerHTML = 0;
			countfield.innerHTML += ' caracteres restantes';
			field.value = field.value.substring(0, maxlimit);
		} else { 
			countfield.innerHTML = maxlimit - field.value.length;
			countfield.innerHTML += ' caracteres restantes';
		}
	}	

	function textCounterNoLimit(field, countfield) {
		countfield.innerHTML = field.value.length;
		countfield.innerHTML += ' caracteres';
	}	
	
	function dataMaior( DataUm, HoraUm, DataDois, HoraDois ){
		var hora   = "00";
		var minuto = "00";

		// Trata primeira data
		var dia   = DataUm.substring(0,2);
        var mes   = DataUm.substring(3,5);
	    var ano   = DataUm.substring(6,10);
	    if (HoraUm != "") {
			hora   = HoraUm.substring(0,HoraUm.indexOf(':'));
			minuto = HoraUm.substring(HoraUm.indexOf(':')+1,HoraUm.length);
		}

		var data1 = new Date(ano,mes-1,dia,hora,minuto);	

		// Trata segunda data
		var dia   = DataDois.substring(0,2);
        var mes   = DataDois.substring(3,5);
	    var ano   = DataDois.substring(6,10);
	    if (HoraDois != "") {
			hora   = HoraDois.substring(0,HoraDois.indexOf(':'));
			minuto = HoraDois.substring(HoraDois.indexOf(':')+1,HoraDois.length);
		} else {
			hora   = "00";
			minuto = "00";		
		}

		var data2 = new Date(ano,mes-1,dia,hora,minuto);	
		
		if (data1 <= data2){
			return false;
		} else {
			return true;
		}

	}
	
	// Valida lista de emails
	function validaListaEmails(listaemail){
		var arroba;
		var ponto;
		var stringAntesArroba;
		var stringDepoisArroba1;
		var stringDepoisArroba2;
		var email = "";
		
		// verifica se foi informada uma lista de fato,
		// neste caso pega-se o primeiro email para
		var posPontoVirgula = listaemail.indexOf(';');		
		if (posPontoVirgula > -1) {
		    email = listaemail.substring(0, posPontoVirgula);
		    listaemail = listaemail.substring(posPontoVirgula + 1);
		} else {
			email = listaemail;
		}
		
		//alert('posPontoVirgula ' + posPontoVirgula);
		//alert('email ' + email);
		//alert('listaemail ' + listaemail);
		
		// Enquanto houver email a ser validado
		while (email != "") {
			arroba = email.indexOf('@');
			
			if (arroba == -1) return false;
			stringAntesArroba = email.substring(0,arroba);
			if (stringAntesArroba.length <= 0){
				return false;	
			}
			email = email.substring(arroba+1);
			ponto = email.indexOf('.');
			
			if (ponto == -1) return false;
			stringDepoisArroba1 = email.substring(0,ponto);
			if (stringDepoisArroba1.length <= 0){
				return false;	
			}
			stringDepoisArroba2 = email.substring(ponto+1);
			if (stringDepoisArroba2.length <= 0){
				return false;	
			}

			if (posPontoVirgula > -1) {
				posPontoVirgula = listaemail.indexOf(';');
				if (posPontoVirgula > -1) {
				    email = listaemail.substring(0, posPontoVirgula);
				    listaemail = listaemail.substring(posPontoVirgula + 1);
				    
				    if (listaemail == "") {
						return false;    	
				    }
				} else {
					email = listaemail;
					listaemail = "";
				}
			} else {
				email = "";
			}
		}
		
		return true;
	}

	function trocaCor(cor, caixa) {		
		
		var innerHtmlMsgErros = formataErro("Codigo de cor invalido.");

		if (cor.value.length != 6) {
			abreAlerta(innerHtmlMsgErros);
			return;			
		}
		cor.value = cor.value.toUpperCase();

		var ok = true;
		var c  = null; 
		for (var i=0; i<6; i++){
			c = cor.value.charAt(i);			
		    if (!( ((c >= "0") && (c <= "9")) || ((c >= "A") && (c <= "F")) ) ) { ok = false; } 
		}	

		if (ok) {
			caixa.style.backgroundColor = cor.value;
		} else {
			abreAlerta(innerHtmlMsgErros);
		}
		
	}

// Monta mensagem de Erro

	function retornaStringMensagemErroGeral(msg){
		var str;
		str  = '<li tabindex="3">';
		str += msg;
		str += ' </li>';
		return str;
	}


    function temMaisDe( campo, minimo ) { 
        return campo.value && campo.value.replace(/\s*$/, "").replace(/\s*/, "").length >= minimo;
    }

// Criticar preenchimento de campos String

    function CriticaString( campo, minimo, maximo, rotulo )
    {
		var retorno = '';
		if( campo.value == '' && minimo > 0 )
		{
			retorno += retornaStringMensagemErroGeral( rotulo + ' deve ser preenchido');
		}
		else
		{
			if( campo.value.length > maximo )
			{
				retorno += retornaStringMensagemErroGeral( rotulo + ' deve ter no maximo ' + maximo + ' caracteres');
			}
			else
			{
	            if ( !temMaisDe( campo, minimo ) && minimo > 0 )
	            {
					retorno += retornaStringMensagemErroGeral( rotulo + ' deve ter no minimo ' + minimo + ' caracteres');
				}
			}
		}
		return retorno;
	}


    function CriticaNumero( campo, minimo, maximo, decimais, rotulo )
    {
		var retorno = CriticaString( campo, minimo, maximo, rotulo );
      	if ( decimais == 0 )
      	{
			if (!isInteger(campo.value))
			{
				retorno += formataErro( rotulo + " deve conter apenas digitos (0 a 9)");
			}
		}
		else
		{
			if ( !isNumber( campo, decimais ))
			{
				retorno += formataErro( rotulo + " deve conter apenas digitos (0 a 9) ou ponto decimal");
			}
		}

		return retorno;
	}


	function isNumber( campo, casasDecimais ){
		var pontos    = 0;
		var decimais  = -1;
		var separador = ".";
		var contador;
		var caracter;

	    for ( contador = 0; contador < campo.value.length; contador++ )
	    {


	        caracter = campo.value.charAt( contador );
	        if (
	           		(
	              		caracter < "0"
	            	||
	              		caracter > "9" 
	            	) 
	            &&
	            	caracter != separador
	           )
	        {
	        	return false;
	        }

        	if ( decimais > -1 )
        	{
		        if ( caracter == separador )
		        {
	        		return false;
	        	}
        		decimais += 1;
        	}
        	else
       	    {
		        if ( caracter == separador )
		        {
        	    	pontos   = 1;
	        		decimais = 0;
	        	}
	        }
	    }
        if ( decimais > casasDecimais ) return false;

	    return true;
	}	


	function validaNomeDiretorio( nomeCampo, tamanho, texto )
	{
		var retorno = '';
		
        retorno += CriticaString( nomeCampo, 3, tamanho, texto );
		if ( !isAlfaNumerico( nomeCampo.value ) )
		{
			retorno += retornaStringMensagemErroGeral( text + ' contem valor nao alfanumerico' );
		}
		return retorno;
	}

	function retornaIndicadoresMaxData(date, agrp, add) {
	
		maxDate = date;
		if (agrp == 'd') {
			maxDate.setDate( maxDate.getDate() + 6 );
		} else if (agrp == 'w') {
			var mes_ini = maxDate.getMonth();
			maxDate.setDate( maxDate.getDate() + ( add * 7 ) );
			if( maxDate.getMonth() > mes_ini ) {
				maxDate.setDate(1);
				maxDate.setDate( maxDate.getDate() - 1 );
			}
		} else if (agrp == 'm') {
			maxDate.setMonth( maxDate.getMonth() + add );
			maxDate.setDate(1);
			maxDate.setDate(maxDate.getDate() - 1);
		} else if (agrp == 's') {
			var mes_ini = maxDate.getMonth();
			if ( mes_ini <= 5 ) {
				maxDate.setDate(31);
				maxDate.setMonth(11);
			} else {
				maxDate.setDate(30);
				maxDate.setMonth(5);
				maxDate.setFullYear(maxDate.getFullYear() + 1);
			}	
		} else if (agrp == 'y') {
			maxDate.setFullYear( maxDate.getFullYear() + add );
			maxDate.setDate(1);
			maxDate.setMonth(0);
			maxDate.setDate(maxDate.getDate() - 1);
		}

		return maxDate;
	}

// -->