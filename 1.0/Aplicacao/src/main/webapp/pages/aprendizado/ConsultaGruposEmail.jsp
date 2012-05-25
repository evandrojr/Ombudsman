<%--
 Sistema de Ouvidoria: um canal através do qual os usuários
 podem encaminhar suas reclamações, elogios e sugestões.
 
 Copyright (C) 2011 SERPRO
 
 Este programa é software livre; você pode redistribuí-lo e/ou
 modificá-lo sob os termos da Licença Pública Geral GNU, conforme
 publicada pela Free Software Foundation; tanto a versão 2 da
 Licença como (a seu critério) qualquer versão mais nova.
 
 Este programa é distribuído na expectativa de ser útil, mas SEM
 QUALQUER GARANTIA; sem mesmo a garantia implícita de
 COMERCIALIZAÇÃO ou de ADEQUAÇÃO A QUALQUER PROPÓSITO EM
 PARTICULAR. Consulte a Licença Pública Geral GNU para obter mais
 detalhes.
 
 Você deve ter recebido uma cópia da Licença Pública Geral GNU,
 sob o título "LICENCA.txt", junto com esse programa. Se não,
 acesse o Portal do Software Público Brasileiro no endereço
 http://www.softwarepublico.gov.br/ ou escreva para a Fundação do
 Software Livre (FSF) Inc., 51 Franklin St, Fifth Floor, Boston,
 MA 02111-1301, USA.
 
 Contatos através do seguinte endereço internet:
 http://www.serpro.gov.br/sistemaouvidoria/
--%>
<%--
 /*
   -- Módulo:        Aprendizado
   -- 
   -- Descrição:    O ouvidor consulta os grupos de email para alteraçao/exclusão
   --                     ou chama a tela de inclusão
   -- 
   -- Versão:       1.0
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
 	        innerHtmlMsgErros += formataErro('Data início do período inválida, use o formato dd/mm/aaaa');
	        ok = false;                    
        } else {
           FormataData(document.forms[0].txtDatIni);
        }       
    }    
	
    // Valida a data final
    if (document.forms[0].txtDatFim.value != '') {
        if (! CriticarData(document.forms[0].txtDatFim) ) {
 	        innerHtmlMsgErros += formataErro('Data fim do período inválida, use o formato dd/mm/aaaa.');
	        ok = false;                    
        } else {
           FormataData(document.forms[0].txtDatFim);
        }       
	}

	// Valida o período
    if ( ( (document.forms[0].txtDatIni.value != '')  && 
	       (document.forms[0].txtDatFim.value == '') ) ||
         ( (document.forms[0].txtDatIni.value == '')  && 
	       (document.forms[0].txtDatFim.value != '') ) )  {
        innerHtmlMsgErros += formataErro('Informe o período completo');
        ok = false;                    		   
    }	
	
	// Se as datas estiverem preenchidas, 
	// verifica se a data inicial &eacute; maior que a final
	var dataI = document.forms[0].txtDatIni.value;
	var dataF = document.forms[0].txtDatFim.value;
	
	if ( (dataI != '') && (dataF != '') ) {
		if ( dataMaior( dataI, "", dataF, "" ) ) {
	 		innerHtmlMsgErros += formataErro('Data início do período maior que a data final');
		    ok = false;                    
  		}
  	}  		     
		
	if(ok){
		// Monta parâmetros a serem passados à ação
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

// Reabre a consulta. Função a ser chamada após a efetivação
// da alteração ou exclusão
function reabrir() {
	// Caso tenha-se incluído uma nova solução, abre-se para nova consulta
	if (document.forms[0].inclusao.value == 'S') {
		window.location = location.href;
	} else {
	// Caso tenha-se alterado/excluído uma solução, exibe-se a consulta novamente 
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
				<label for="periodo">Período: </label>
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
	<a tabindex="8" title="voltar para página anterior" href="javascript:history.go(-1)">voltar</a>
</p>

<html:hidden property="action"  value="Listar" />
<html:hidden property="inclusao"  value="N" />

</html:form>

</div>

</body>
</html:html> 
