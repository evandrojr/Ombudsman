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

<%@ taglib uri="/tags/struts-logic" prefix="logic" %>
<%@ taglib uri="/tags/struts-bean" prefix="bean"%>
<%@ taglib uri="/tags/struts-html" prefix="html"%>

<script language='javascript'>

function setaFocoInicio(){
	try {		
		document.getElementById("tituloErro").focus();
	} catch(e) {}
}
	
</script>

<html:html lang="pt">
<html:base />
<head>
<meta http-equiv='Content-Type' content='text/html; charset=iso-8859-1'>
<title>Alerta</title>
</head>

<logic:present name="_LAYOUT_"> 
<link rel='stylesheet'  media='all' href='<bean:write name="_LAYOUT_" property="esquemaCores"/>/estilo_conteudo.css' type='text/css'>
</logic:present>

<logic:notPresent name="_LAYOUT_"> 
<link rel='stylesheet'  media='all' href='estilo_conteudo.css' type='text/css'>
</logic:notPresent>

<body class="tdHeader4" onload="javascript:setaFocoInicio();" style="margin: 10px 1em;" onblur="self.focus();">
<div class="tdHeader4" align="left">
<h2 id="tituloErro" tabindex="1"><%= request.getParameter("titulo") %></h2>
<span id="areaErro" style="overflow: auto; width: 100%; height: 100px;">
	<ul tabindex="2">
	<%= request.getParameter("texto") %>
	</ul>
</span>
<table cellpadding='2' cellspacing='1' border='0'  width='100%'>
<tr>
	<td class='tdHeader1' align='center'>
      	<input tabindex="3" type='button' class='button' value='Fechar' onClick='window.close()' title='Fechar'>
	</td>
</tr>
</table>
</div>
</body>
</html:html>