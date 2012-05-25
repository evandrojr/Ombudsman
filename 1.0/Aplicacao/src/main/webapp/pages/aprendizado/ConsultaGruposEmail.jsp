<%--
 Sistema de Ouvidoria: um canal atrav�s do qual os usu�rios
 podem encaminhar suas reclama��es, elogios e sugest�es.
 
 Copyright (C) 2011 SERPRO
 
 Este programa � software livre; voc� pode redistribu�-lo e/ou
 modific�-lo sob os termos da Licen�a P�blica Geral GNU, conforme
 publicada pela Free Software Foundation; tanto a vers�o 2 da
 Licen�a como (a seu crit�rio) qualquer vers�o mais nova.
 
 Este programa � distribu�do na expectativa de ser �til, mas SEM
 QUALQUER GARANTIA; sem mesmo a garantia impl�cita de
 COMERCIALIZA��O ou de ADEQUA��O A QUALQUER PROP�SITO EM
 PARTICULAR. Consulte a Licen�a P�blica Geral GNU para obter mais
 detalhes.
 
 Voc� deve ter recebido uma c�pia da Licen�a P�blica Geral GNU,
 sob o t�tulo "LICENCA.txt", junto com esse programa. Se n�o,
 acesse o Portal do Software P�blico Brasileiro no endere�o
 http://www.softwarepublico.gov.br/ ou escreva para a Funda��o do
 Software Livre (FSF) Inc., 51 Franklin St, Fifth Floor, Boston,
 MA 02111-1301, USA.
 
 Contatos atrav�s do seguinte endere�o internet:
 http://www.serpro.gov.br/sistemaouvidoria/
--%>
<%--
 /*
   -- M�dulo:        Aprendizado
   -- 
   -- Descri��o:    O ouvidor consulta os grupos de email para altera�ao/exclus�o
   --                     ou chama a tela de inclus�o
   -- 
   -- Vers�o:       1.0
   -- Data:         02/02/2005   
  */
--%>

<%@ taglib uri="/tags/struts-logic" prefix="logic" %>
<%@ taglib uri="/tags/struts-bean" prefix="bean"%>
<%@ taglib uri="/tags/struts-html" prefix="html"%>

<html:html lang="pt">

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<head>
<html:base />

<title>Atualizar Grupos de Email</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link rel="stylesheet"  media="all" href="../<bean:write name="_LAYOUT_" property="esquemaCores"/>/estilo_conteudo.css" type="text/css">
<!-- Estilo para impressao -->
<link rel="stylesheet" type="text/css" media="print" href="../estilo_print.css">

<script language="JavaScript">
<!--
function MM_reloadPage(init) {  //reloads the window if Nav4 resized
  if (init==true) with (navigator) {if ((appName=="Netscape")&&(parseInt(appVersion)==4)) {
    document.MM_pgW=innerWidth; document.MM_pgH=innerHeight; onresize=MM_reloadPage; }}
  else if (innerWidth!=document.MM_pgW || innerHeight!=document.MM_pgH) location.reload();
}
MM_reloadPage(true);
// -->
</script>

</head>

<!-- Biblioteca javascript  -->
<%@ include file="../js/header.inc.jsp" %>
<script language="JavaScript" src="../js/util.js"></script>
<script language="JavaScript" src="../js/data.js"></script>

<script type="text/javascript" charset='iso-8859-1'>


// Mostra o resultado da consulta
function mostraResultado(){
	var ok;
	var innerHtmlMsgErros = '';
	
	// Trata Href
	var basehref = location.href;
	var i = basehref.lastIndexOf('/');
	basehref = basehref.substring(0, i + 1);	 
	
	document.forms[0].inclusao.value = 'N';	
	ok = true;     
	
    // limpa os iFrames
    window.frames[0].location = basehref + 'Vazio.do';
    window.frames[1].location = basehref + 'Vazio.do';
	
    // Valida a data inicial
    if (document.forms[0].txtDatIni.value != '') {
        if (! CriticarData(document.forms[0].txtDatIni) ) {
 	        innerHtmlMsgErros += formataErro('Data in�cio do per�odo inv�lida, use o formato dd/mm/aaaa');
	        ok = false;                    
        } else {
           FormataData(document.forms[0].txtDatIni);
        }       
    }    
	
    // Valida a data final
    if (document.forms[0].txtDatFim.value != '') {
        if (! CriticarData(document.forms[0].txtDatFim) ) {
 	        innerHtmlMsgErros += formataErro('Data fim do per�odo inv�lida, use o formato dd/mm/aaaa.');
	        ok = false;                    
        } else {
           FormataData(document.forms[0].txtDatFim);
        }       
	}

	// Valida o per�odo
    if ( ( (document.forms[0].txtDatIni.value != '')  && 
	       (document.forms[0].txtDatFim.value == '') ) ||
         ( (document.forms[0].txtDatIni.value == '')  && 
	       (document.forms[0].txtDatFim.value != '') ) )  {
        innerHtmlMsgErros += formataErro('Informe o per�odo completo');
        ok = false;                    		   
    }	
	
	// Se as datas estiverem preenchidas, 
	// verifica se a data inicial &eacute; maior que a final
	var dataI = document.forms[0].txtDatIni.value;
	var dataF = document.forms[0].txtDatFim.value;
	
	if ( (dataI != '') && (dataF != '') ) {
		if ( dataMaior( dataI, "", dataF, "" ) ) {
	 		innerHtmlMsgErros += formataErro('Data in�cio do per�odo maior que a data final');
		    ok = false;                    
  		}
  	}  		     
		
	if(ok){
		// Monta par�metros a serem passados � a��o
		var parametros = "?action=" + document.forms[0].action.value + 
								 "&txtDatIni=" +  document.forms[0].txtDatIni.value + 
								 "&txtDatFim=" +  document.forms[0].txtDatFim.value +
				                 "&txtChave=" + document.forms[0].txtChave.value;	
	
		// Exibe o resultado da consulta no iFrame 1
	    window.frames[0].location= basehref + 'ListarGruposEmail.do' + parametros;    
	} else {
		var texto = innerHtmlMsgErros;
		abreAlerta(texto);		
	    setaFocoOnLoad();	  	    
	}
	
}

// Mostra campos para entrada dos dados do novo script
function mostraDetalheNovo(){
	
	// Trata Href
	var basehref = location.href;
	var i = basehref.lastIndexOf('/');
	basehref = basehref.substring(0, i + 1);	 

    // limpa o iFrame
    window.frames[1].location = basehref + 'Vazio.do';

	document.forms[0].inclusao.value = 'S';	
	window.frames[0].location= basehref + 'ExibirGruposEmail.do';
}

// Reabre a consulta. Fun��o a ser chamada ap�s a efetiva��o
// da altera��o ou exclus�o
function reabrir() {
	// Caso tenha-se inclu�do uma nova solu��o, abre-se para nova consulta
	if (document.forms[0].inclusao.value == 'S') {
		window.location = location.href;
	} else {
	// Caso tenha-se alterado/exclu�do uma solu��o, exibe-se a consulta novamente 
 	    mostraResultado();
 	}
}

// Seta o foco ao carregar a tela
function setaFocoOnLoad(){
	
	document.getElementById("MsgInicial").focus();
}
   
</script> 

<body onload="javascript:setaFocoOnLoad();" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">

<div id="content">

<h1 tabindex="1" id="MsgInicial" >Atualizar Grupos de Email</h1>

<html:form action="ListarGruposEmail">
	
<table width="100%" border="0" cellpadding="0" cellspacing="0" align="center">
  <tr> 		    
  	<td>
		<table cellpadding="2" cellspacing="1" border="0" align="center" width="100%" height="100%">
			<tr>
				<td align="center" class="tdHeader3" width="100%">					
					<input type="button" name="Submit" value="Novo Grupo" class="button" onClick="mostraDetalheNovo()" tabindex="2" >
	        	</td>
			</tr>
		</table>	  
    </td>
	<td>
	  <table cellpadding="2" cellspacing="1" border="0" align="center" width="95%" height="100%">
        <tr> 
			<td class='tdHeader3' width="30%">
				<label for="periodo">Per�odo: </label>
		    </td>
		    <td class='tdHeader4'>
		        <input name='txtDatIni' tabindex="2" size='10' class="text" maxlength="10" id="periodo"> 
		        <label for="ate">at&eacute;  
		        <input name='txtDatFim' tabindex="3" size='10' class="text" maxlength="10" id="ate">
		        </label>
		    </td>
		</tr>	
	  </table>
	</td>
    <td> 
      <table cellpadding="2" cellspacing="1" border="0" align="center" width="100%" height="100%">
        <tr> 
          <td class="tdHeader3" width="100"><label for="pchave">Palavra Chave:</label></td>
          <td class="tdHeader4" valign ="top">&nbsp; 
            <input class=text name="txtChave" id="pchave" tabindex="4">
          </td>
        </tr>
      </table>
    </td>   
  </tr>
  <tr>
	<td colspan='3' align='middle' class='tdHeader1'>
	    <label for="consultar grupos de email"> 
	    <input type='button' tabindex="5" value='Buscar' name='buscar' class='button' onClick="javascript:mostraResultado();"  title='Clique para efetuar a consulta'>
	    </label> 
	</td>
  </tr>											
  
</table>
<br>

	<table cellpadding="0" cellspacing="0" border="0"  width="100%">
		<tr>
			<td>
				<iframe tabindex="6" src='_blank.htm' name='lista' id='lista' longdesc='Lista' border='0' 
				          width='100%' height="0" scrolling="0" marginwidth="0" marginheight="0" frameborder="0">
				</iframe>
			</td>
		</tr>
	</table>

	<table cellpadding="0" cellspacing="0" border="0"  width="100%">
		<tr>
			<td>
				<iframe tabindex="7" src='_blank.htm' name='detalhe' id='detalhe' longdesc='Detalhe do Script' border='0' 
			          width='100%' height="0" scrolling="0" marginwidth="0" marginheight="0" frameborder="0" ></iframe>
			</td>
		</tr>
	</table> 

<hr>
<p class="voltar"> 
	<a tabindex="8" title="voltar para p�gina anterior" href="javascript:history.go(-1)">voltar</a>
</p>

<html:hidden property="action"  value="Listar" />
<html:hidden property="inclusao"  value="N" />

</html:form>

</div>

</body>
</html:html> 
