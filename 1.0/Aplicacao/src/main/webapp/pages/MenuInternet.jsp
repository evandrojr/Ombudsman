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
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%--
/*
   -- Sistema:      Ouvidoria
   -- Módulo:       Geral
   -- Aplicação:    Menu
   -- 
   -- Descrição:    Menu da Aplicação Internet
   -- 
   -- Versão:       1.0
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
