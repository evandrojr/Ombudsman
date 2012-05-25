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
<title>Confirmação</title>
</head>

<link rel='stylesheet' type='text/css' media='all'   href='<bean:write name="_LAYOUT_" property="esquemaCores"/>/estilo_conteudo.css'>
<link rel='stylesheet' type='text/css' media='print' href='<bean:write name="_LAYOUT_" property="esquemaCores"/>/estilo_print.css'>
<body class="tdHeader4" onload="javascript:setaFocoInicio();" style="margin: 10px 1em;">
<div  class="tdHeader4" align="left">

<form>

<input type="hidden" name="action"   value="<%= request.getParameter("action") %>">

<!-- Verifica se foi passada uma pergunta como parâmetro -->
<%
   String pergunta = "";
	
   if (request.getParameter("pergunta") != null) {
	   pergunta = request.getParameter("pergunta");
   } else {
       pergunta = "Confirma a operação?";
   }
 
%>

<h2 id="confirmacao" tabindex="1">Confirmação</h2>

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
      	<input type='button' class='button' value='Não' tabindex="4" onClick='window.close()' title='Não'>
	</td>
</tr>
</table>
</form> 
</div>
</body>
</html:html>