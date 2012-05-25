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

<%	String domain = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath(); %>	

<script language='javascript'>
function onLoad(){
	abreConteudo();
}

// Abre Indice da funcionalidade (id da funcionalidade na sess�o)
function abreIndice() {
	window.frames[0].location = "<%= domain %>" + '/AjudaIndice.do';	
}

// Abre Conte&uacute;do da funcionalidade (id da funcionalidade na sess�o)
function abreConteudo() {
	window.frames[0].location = "<%= domain %>" + '/AjudaConteudo.do';	
}

// Abre Busca da ajuda da funcionalidade (id da funcionalidade na sess�o)
function abreBusca() {
	window.frames[0].location = "<%= domain %>" + '/pages/AjudaBusca.jsp';	;
}

function conteudo() {
	var url = "<%= domain %>" + '/AjudaConteudo.do';
	
	return url;
}

</script>

<html:html lang="pt">
<head>
<html:base />
<meta http-equiv='Content-Type' content='text/html; charset=iso-8859-1'>
</head>

<link rel='stylesheet' type='text/css' media='all'   href='<bean:write name="_LAYOUT_" property="esquemaCores"/>/estilo_conteudo.css'>
<link rel='stylesheet' type='text/css' media='print' href='<bean:write name="_LAYOUT_" property="esquemaCores"/>/estilo_print.css'>
<body  onload="onLoad();" style="margin: 10px 0 0 5px;">

<div align="left">

<form>

<img src="images/spacer.gif" tabindex="1" border="1" name="imgLista" >
<table border="0" width="100%" cellpadding="0" cellspacing="0">
<tr>
	<td>
	<table align="left" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td><input type="button" class="button" value="Busca"       onclick="javascript:abreBusca();" ></td>
		<td><input type="button" class="button" value="Conte&uacute;do"  onclick="javascript:abreConteudo();" ></td>
		<td><input type="button" class="button" value="�ndice"       onclick="javascript:abreIndice();" ></td>
	</tr>
	</table>
	</td>
	<td width="100%">&nbsp;</td>
</tr>
</table>

<table cellpadding='0' cellspacing='0' border='0'  width='100%' height="90%">
	<tr align="left" valign="top">
		<td>
			<iframe
				src="_blank.htm" 
				id="fmeSelecao" 
				name='fmeSelecao' 
				longdesc='Sele��o de Ajuda' 
				border='0' 
				width='100%' 
				height="0" 
				scrolling="0" 
				marginwidth="0" 
				marginheight="0" 
				frameborder="0">
			</iframe>
		</td>
	</tr>
</table>
</form>
</div>
</body>
</html:html>