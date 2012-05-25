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
   -- Sistema:      Ouvidoria
   -- Módulo:       Geral
   -- Aplicação:    Menu
   -- 
   -- Descrição:    Menu da Aplicação
   -- 
   -- Data:         10/12/2004
*/
--%>
<%@ taglib uri="/tags/struts-html" prefix="html" %>
<%@ taglib uri="/tags/struts-bean" prefix="bean" %>

<% String domain = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath(); %>

<% Long funcionarioLogado = (Long) request.getSession().getAttribute(br.gov.serpro.ouvidoria.util.Constants.PA_FUNCIONARIO); %>

<html  lang="pt-br">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"> 
<meta http-equiv="no-cache">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="expires" CONTENT="Wed, 26 Feb 1997 08:21:57 GMT">
<title>Menu</title>
<html:base/>


<link rel="stylesheet" href="<bean:write name="_LAYOUT_" property="esquemaCores"/>/estilo_capa_int.css" type="text/css">

<script type="text/javascript">function Go(){return}</script>
<% if (request.getSession().getAttribute(br.gov.serpro.ouvidoria.util.Constants.PA_FUNCIONARIO) == null ) { %>
	<script src="../MenuJavaScript.do" type="text/javascript"></script>
<% } else { %>

	<script src="../MenuJavaScriptLogged.do" type="text/javascript"></script>
	<script src="../pages/js/util.js"        type="text/javascript"></script>
	<script type="text/javascript" charset='iso-8859-1'>
	<!-- 
	
	/* Rotina para mostrar a mensagem de sessão expirada */
	
	var AgntUsr = navigator.userAgent.toLowerCase();
	var Exp     = AgntUsr.indexOf("msie")!=-1?1:0;
	
	function abreAlertaGeral(titulo, texto) {
		var baseHref = location.protocol + "//" + location.host + location.pathname;		
		novaJanela( baseHref + "../../pages/AlertaGeral.jsp?titulo=" + titulo + "&texto=" + texto, "Erro", 450, 180, 0, 0, 300, 200 ); 
	}

	function getCookieVal (offset) {
	  var endstr = document.cookie.indexOf (";", offset);
	  if (endstr == -1)
	    endstr = document.cookie.length;
	  return unescape(document.cookie.substring(offset, endstr));
	}
	
	function GetCookie (name) {
	  var arg  = name + "=";
	  var alen = arg.length;
	  var clen = document.cookie.length;
	  var i = 0;
	  while (i < clen) {
	    var j = i + alen;
	    if (document.cookie.substring(i, j) == arg)
	      return getCookieVal (j);
	    i = document.cookie.indexOf(" ", i) + 1;
	    if (i == 0) break; 
	  }
	  return null;
	}

	isTimeout.lastValue = null;
	isTimeout.lastDate  = new Date();
	isTimeout.alert     = false;
	isTimeout.maxInactiveInterval = <%= ( request.getSession().getMaxInactiveInterval() * 1000 ) %>;

	function isTimeout() {
		var value = GetCookie("<%= br.gov.serpro.ouvidoria.util.Constants.PA_EXPIRE %>");
		if(isTimeout.lastValue == value) {
			var now  = new Date();
			var mili = parseInt( now.getTime() - isTimeout.lastDate.getTime() );
			if( mili > ( isTimeout.maxInactiveInterval + 60000) ) {
			 	window.clearInterval(isTimeout.interval);
				abreAlertaGeral("Aviso", "<li>Esta sessão foi encerrada por inatividade.<br>Faça o Login novamente.</li>");
				window.parent.frames['conteudo'].location = ((Exp?'':'../') + 'Logoff.do');
			} else if ( !isTimeout.alert && mili >= ( isTimeout.maxInactiveInterval - 120000 )  ) {
				isTimeout.alert = true;
				abreAlertaGeral("Aviso", "<li>Esta sessão cairá em 2 minutos.</li>");
			}
		} else {
			isTimeout.alert     = false;
			isTimeout.lastValue = value;
			isTimeout.lastDate  = new Date();
	    } 
	}	
	isTimeout.interval  = window.setInterval('isTimeout()', 10000);
	// -->	
	</script>
<% } %>
<script src="menu9_com.js" type="text/javascript"></script>
</head>
<%
String linkImagem;
%>
<body>
<DIV>
<iframe id="iFrameMenu" frameborder="0" scrolling="no" src="" name="iFrameMenu" style="visibility: hidden; position: absolute; z-index: 1002; top:200px; left:200px; width: 500px; height: 500px; "></iframe>
</DIV>
<div class="ug" id="ug">
	<table width="100%" cellpadding="0" cellspacing="0" border="0" style="background-color: <bean:write name="_LAYOUT_" property="corCabecalhoLogo"/>;">
	<tr>
		<td align=left >

		<% linkImagem = (String) request.getAttribute("linkImagemLogo");
			if ( (linkImagem == null || linkImagem.equals("")) ) { 
		%>
			<img height=20 tabindex="1" alt="<bean:write name="_LAYOUT_" property="descricaoImagemLogo"/>" src="<bean:write name="_LAYOUT_" property="imagemLogo"/>">
		<% }else{ %>
			<a href="<bean:write name="_LAYOUT_" property="linkImagemLogo"/>" target="_blank"><img height=20 tabindex="1" alt="<bean:write name="_LAYOUT_" property="descricaoImagemLogo"/>" src="<bean:write name="_LAYOUT_" property="imagemLogo"/>"></a>
		<% } %>
		</td>
		<td align=right>
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
	  		<% linkImagem = (String) request.getAttribute("linkImagemBanner");
			   if ( (linkImagem == null || linkImagem.equals("")) ) { 
			%>
	  			<img height="60" tabindex="3" alt="<bean:write name="_LAYOUT_" property="descricaoImagemBanner"/>" src="<bean:write name="_LAYOUT_" property="imagemBanner"/>" border=1>
		  	<% }else{ %>
				<a href="<bean:write name="_LAYOUT_" property="linkImagemBanner"/>" target="_blank"><img height="60" tabindex="3" alt="<bean:write name="_LAYOUT_" property="descricaoImagemBanner"/>" src="<bean:write name="_LAYOUT_" property="imagemBanner"/>" border=1></a>
			<% } %>		
  		</td>
  	</tr>
	</table>
</div>
<div class="menu" id="menu" style="position:absolute; z-index:101;">
</div>
<div class="botaoSair" id="botaoSair" style="z-index: 1000;">
			<% 
			   if (funcionarioLogado != null) { 
			%>
	  			<a href="<%= domain %>/Logoff.do" target="conteudo" tabindex="20" title="Sair do Sistema">
		  	<% } else { %>
				<a href="<bean:write name="_LAYOUT_" property="linkImagemBanner"/>" target="_top" tabindex="20" title="Sair do Sistema">
			<% } %>	
		<img alt="Sair do Sistema" id="btnSair" width="50" height="25" border="0" src="images/SistFr02BotSair01.gif" onMouseOver="javascript:this.src='images/SistFr02BotSair02.gif'" onMouseOut="javascript:this.src='images/SistFr02BotSair01.gif'">
	</a>
</div>	
</body>
</html>