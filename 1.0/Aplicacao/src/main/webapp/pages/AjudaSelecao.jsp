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

<%	String domain = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath(); %>	

<script language='javascript'>
function onLoad(){
	abreConteudo();
}

// Abre Indice da funcionalidade (id da funcionalidade na sessão)
function abreIndice() {
	window.frames[0].location = "<%= domain %>" + '/AjudaIndice.do';	
}

// Abre Conte&uacute;do da funcionalidade (id da funcionalidade na sessão)
function abreConteudo() {
	window.frames[0].location = "<%= domain %>" + '/AjudaConteudo.do';	
}

// Abre Busca da ajuda da funcionalidade (id da funcionalidade na sessão)
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
		<td><input type="button" class="button" value="Índice"       onclick="javascript:abreIndice();" ></td>
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
				longdesc='Seleção de Ajuda' 
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