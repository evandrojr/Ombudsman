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
<%--
/*
   -- Sistema:      Ouvidoria
   -- M�dulo:       Geral
   -- Aplica��o:    Menu
   -- 
   -- Descri��o:    Menu da Aplica��o Internet
   -- 
   -- Vers�o:       1.0
   -- Data:         10/12/2004
*/
--%>

<%@ taglib uri="/tags/struts-html" prefix="html" %>
<%@ taglib uri="/tags/struts-bean" prefix="bean" %>

<html  lang="pt-br">

<head>
<meta http-equiv="Content-Type" content="text/html"> 
<title>Menu</title>
<div id="menu">
	<html:base/>
</div>
<link 	rel="stylesheet" 
		href="<bean:write name="_LAYOUT_" property="esquemaCores"/>/estilo_capa_int.css" 
		type="text/css">
		
</head>

<script type="text/javascript">function Go(){return}</script>
<script src="HorizontalFrames_var.js" type="text/javascript" charset="UTF-8"></script>
<script src="menu9_com.js" type="text/javascript"></script>

<%
String linkImagem;
%>

<body>
<div class="ug" id="ug">
	<table width="100%" cellpadding="0" cellspacing="0" border="0" style="background-color: <bean:write name="_LAYOUT_" property="corCabecalhoLogo"/>;">
	<tr>
	<td align="left">
		<% linkImagem = (String) request.getAttribute("linkImagemLogo");
			if ( (linkImagem == null || linkImagem.equals("")) ) { 
		%>
			<img height=20 tabindex="1" alt="<bean:write name="_LAYOUT_" property="descricaoImagemLogo"/>" src="<bean:write name="_LAYOUT_" property="imagemLogo"/>">
		<% }else{ %>
			<a href="<bean:write name="_LAYOUT_" property="linkImagemLogo"/>" target="_blank"><img height=20 tabindex="1" alt="<bean:write name="_LAYOUT_" property="descricaoImagemLogo"/>" src="<bean:write name="_LAYOUT_" property="imagemLogo"/>"></a>
		<% } %>	
	</td>
	<td align="right">
		<% linkImagem = (String) request.getAttribute("linkImagem3");
			if ( (linkImagem == null || linkImagem.equals("")) ) { 
		%>
			<img height=20 tabindex="2" alt="<bean:write name="_LAYOUT_" property="descricaoImagem3"/>" src="<bean:write name="_LAYOUT_" property="imagem3"/>">
		<% }else{ %>
			<a href="<bean:write name="_LAYOUT_" property="linkImagem3"/>" target="_blank"><img height=20 tabindex="2" alt="<bean:write name="_LAYOUT_" property="descricaoImagem3"/>" src="<bean:write name="_LAYOUT_" property="imagem3"/>"></a>
		<% } %>	
	</td>
	</tr>
	</table>
	<table width="100%" cellpadding="0" cellspacing="0" border="0" style="height: 60px; background-color: <bean:write name="_LAYOUT_" property="corCabecalhoBanner"/>;">
	  	<tr>
	  		<td align=left>
				<% linkImagem = (String) request.getAttribute("linkImagem3");
					if ( (linkImagem == null || linkImagem.equals("")) ) { 
				%>	  		
		  			<img tabindex="3" height=60 alt="<bean:write name="_LAYOUT_" property="descricaoImagemBanner"/>" src="<bean:write name="_LAYOUT_" property="imagemBanner"/>" border=0>
				<% }else{ %>
					<a href="<bean:write name="_LAYOUT_" property="linkImagemBanner"/>" target="_blank"><img tabindex="3" height=60 alt="<bean:write name="_LAYOUT_" property="descricaoImagemBanner"/>" src="<bean:write name="_LAYOUT_" property="imagemBanner"/>" border=0></a>
				<% } %>			  			
  			</td>
  		</tr>
	</table>
</div>
<div class="menu" id="menu"></div>
<div class="botaoSair" id="botaoSair" style="z-index: 1000;">
	<a href="<bean:write name="_LAYOUT_" property="linkImagemBanner"/>" target="_top" tabindex="4">	
     	<img alt="Sair do Sistema" width="50" height="25" border="0" src="images/SistFr02BotSair01.gif" onMouseOver="javascript:this.src='images/SistFr02BotSair02.gif'" onMouseOut="javascript:this.src='images/SistFr02BotSair01.gif'">
	</a>
</div>
</body>
</html>
