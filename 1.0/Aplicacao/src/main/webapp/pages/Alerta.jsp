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
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<%@ taglib uri="/tags/struts-logic" prefix="logic"%>
<%@ taglib uri="/tags/struts-bean" prefix="bean"%>
<%@ taglib uri="/tags/struts-html" prefix="html"%>
<%@ taglib uri="http://jakarta.apache.org/taglibs/log-1.0" prefix="log" %>

<html:html lang="pt">
<head>
<html:base />
<meta http-equiv='Content-Type' content='text/html; charset=Windows-1252'>
<title>Erro no preenchimento</title>
</head>

<script language='javascript' charset='UTF-8' >

function setaFocoInicio(){
	try {
		setTimeout('self.focus()', 1000 );
		var focusControl = document.getElementById("tituloErro");
		focusControl.focus();
	} catch (e) {}
}
	
</script>

<link rel='stylesheet' media='all'
	href='<bean:write name="_LAYOUT_" property="esquemaCores"/>/estilo_conteudo.css'
	type='text/css'>

<body class="tdHeader4" onload="javascript:setaFocoInicio();" style="margin: 10px 1em;">

<div class="tdHeader4" align="left">
<h2 id="tituloErro" tabindex="1">Corrija o preenchimento do formul�rio e confirme o envio</h2>

<div id="areaErro" style="overflow: auto; width: 100%; height: 100px;">
<ul tabindex="2">
	<% System.out.println(request.getParameter("error").toString()); %>
	<%= request.getParameter("error")%>
</ul>
</div>

<table cellpadding='2' cellspacing='1' border='0' width='100%'>
	<TBODY>
		<tr>
			<td class='tdHeader1' align='center'><input type='button'
				class='button' value='Fechar' onClick='window.close()' title=' title='Fechar'></td>
		</tr>
	</TBODY>
</table>
</div>
</body>
</html:html>
