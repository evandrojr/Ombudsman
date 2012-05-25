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
<h2 id="tituloErro" tabindex="1">Corrija o preenchimento do formulário e confirme o envio</h2>

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
