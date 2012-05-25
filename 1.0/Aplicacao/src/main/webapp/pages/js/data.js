
<!--
function DataHoje() {
	var now = new Date();
	var mName = now.getMonth() + 1;
	var dName = now.getDay() + 1;
	var dayNr = now.getDate();
	var yearNr=now.getYear();
	
	if(mName==1) Mes = "janeiro";
	if(mName==2) Mes = "fevereiro";
	if(mName==3) Mes = "mar?o";
	if(mName==4) Mes = "abril";
	if(mName==5) Mes = "maio";
	if(mName==6) Mes = "junho";
	if(mName==7) Mes = "julho";
	if(mName==8) Mes = "agosto";
	if(mName==9) Mes = "setembro";
	if(mName==10) Mes = "outubro";
	if(mName==11) Mes = "novembro";
	if(mName==12) Mes = "dezembro";
	
	if(dName==1) Day = "Domingo";
	if(dName==2) Day = "Segunda";
	if(dName==3) Day = "Ter&ccedil;a";
	if(dName==4) Day = "Quarta";
	if(dName==5) Day = "Quinta";
	if(dName==6) Day = "Sexta";
	if(dName==7) Day = "S&aacute;bado";
	if(yearNr < 2000) Year = 1900 + yearNr;
	else Year = yearNr;

	return DataHoje =(" " + Day + ", " + dayNr + " de " + Mes + " de " + Year);
}	

//---------- DeseditarValor ----------
function DeseditarValor (txtNum) {

   var s  = ""; // 'As String
   var c1 = ""; //'As String * 1
   var i  = 0;  //'As Integer

   for (i = 0; i < txtNum.length; i++) {
     c1 = txtNum.substring(i, i+1);
     if ((c1 >= "0") && (c1 <= "9")) {
       s = s + c1;
     }
   }
   return s;
}

// Critica Data
function CriticarData (objTxtData) {
   var dataCompleta = objTxtData.value;
   var txtData = DeseditarValor(dataCompleta);
   var d  = 0;
   var m  = 0;
   var a  = 0;
   var f1        = false;
   var f2        = false;
   var f3        = false;
   var FormatoOK = true;
   var retorno   = false;

   FormatoOK = ((txtData.length == 8) && eval(txtData*1 > 0) && eval(txtData*1 <= 99999999));
   if (FormatoOK) {
      d = txtData.substring(0, 2)*1;
      m = txtData.substring(2, 4)*1;
      a = txtData.substring(4, txtData.length)*1;
      fimDias = "  312831303130313130313031";
      f1 = (  (m > 0) && (m < 13) && (d > 0)  );
      f2 = ( d
             <=
             fimDias.substring((m + 1) * 2 - 2, (m + 1) * 2 - 2 + 2)*1
      );
      f3 = ((!(a % 4)) && (a != 0) && (m == 2) && (d <= 29));
      retorno = (FormatoOK && f1 && (f2 || f3));
   }

   return (FormatoOK && retorno);
}


//function FormataData(Campo, teclapres, obj) {
//    vr = obj.value;
//	vr = vr.replace( ".", "" );
//	vr = vr.replace( "/", "" );
//	vr = vr.replace( "/", "" );
//	tam = vr.length + 1;
//	if ( tam > 2 && tam < 5 )
//		{obj.value = vr.substr( 0, tam - 2  ) + '/' + vr.substr( tam - 2, tam )};
//	if ( tam >= 5 && tam <= 10 )
//		{obj.value = vr.substr( 0, 2 ) + '/' + vr.substr( 2, 2 ) + '/' + vr.substr( 4, 4 )};
//}

function FormataData(obj) {
    vr = obj.value;
	vr = vr.replace( ".", "" );
	vr = vr.replace( "/", "" );
	vr = vr.replace( "/", "" );
	tam = vr.length + 1;
	if ( tam > 2 && tam < 5 )
		{obj.value = vr.substr( 0, tam - 2  ) + '/' + vr.substr( tam - 2, tam )};
	if ( tam >= 5 && tam <= 10 )
		{obj.value = vr.substr( 0, 2 ) + '/' + vr.substr( 2, 2 ) + '/' + vr.substr( 4, 4 )};
}

// -->

