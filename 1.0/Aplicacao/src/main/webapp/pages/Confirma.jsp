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

<%@ taglib uri="/tags/struts-logic" prefix="logic" %>
<%@ taglib uri="/tags/struts-bean" prefix="bean"%>
<%@ taglib uri="/tags/struts-html" prefix="html"%>

<script language='javascript'>

function setaFocoInicio(){
   var focusControl = document.getElementById("confirmacao");
   focusControl.focus();
}

function disparaAcao() {	
	var action = document.forms[0].action.value; 	
	window.opener.<%= request.getParameter("action") %>();
	window.close();
}
	
</script>

<html:html lang="pt">
<head>
<html:base />
<meta http-equiv='Content-Type' content='text/html; charset=iso-8859-1'>
<title>Confirma��o</title>
</head>

<link rel='stylesheet' type='text/css' media='all'   href='<bean:write name="_LAYOUT_" property="esquemaCores"/>/estilo_conteudo.css'>
<link rel='stylesheet' type='text/css' media='print' href='<bean:write name="_LAYOUT_" property="esquemaCores"/>/estilo_print.css'>
<body class="tdHeader4" onload="javascript:setaFocoInicio();" style="margin: 10px 1em;">
<div  class="tdHeader4" align="left">

<form>

<input type="hidden" name="action"   value="<%= request.getParameter("action") %>">

<!-- Verifica se foi passada uma pergunta como par�metro -->
<%
   String pergunta = "";
	
   if (request.getParameter("pergunta") != null) {
	   pergunta = request.getParameter("pergunta");
   } else {
       pergunta = "Confirma a opera��o?";
   }
 
%>

<h2 id="confirmacao" tabindex="1">Confirma��o</h2>

<label tabindex="2">
<p Align="LEFT">
<ul>
	<li><%= pergunta %></li>
</ul>
</p>
</label>

<table cellpadding='2' cellspacing='1' border='0'  width='100%'>
<tr>
	<td class='tdHeader1' align='center'>
      	<input type='button' class='button' value='Sim' tabindex="3" onClick='javascript:disparaAcao()' title='Sim'>
	</td>
	<td class='tdHeader1' align='center'>
      	<input type='button' class='button' value='N�o' tabindex="4" onClick='window.close()' title='N�o'>
	</td>
</tr>
</table>
</form> 
</div>
</body>
</html:html>