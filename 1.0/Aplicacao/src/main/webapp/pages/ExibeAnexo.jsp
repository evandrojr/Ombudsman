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
   -- Módulo:       Global
   -- 
   -- Descrição:   Exibe o conte&uacute;do do arquivo anexo à mensagem
   -- 
   -- Versão:       1.0
   -- Data:          28/01/2005
  */
--%>

<%@ taglib uri="/tags/struts-logic" prefix="logic" %>
<%@ taglib uri="/tags/struts-bean" prefix="bean"%>
<%@ taglib uri="/tags/struts-html" prefix="html"%>

<%//@page import ="java.net.*"  %>

<html:html lang="pt">

<head>
<html:base />
<meta http-equiv='Content-Type' content='text/html; charset=iso-8859-1'>
<title>Arquivo Anexo</title>

<!-- Bibliotecas javascript  -->
<script language="JavaScript" src="js/util.js"></script>

<script language="JavaScript">
// Seta o foco ao carregar a tela
function setaFocoOnLoad(){
	document.getElementById("MsgInicial").focus();
}
</script>

</head>

<link rel='stylesheet'  media='all' href='<bean:write name="_LAYOUT_" property="esquemaCores"/>/estilo_conteudo.css' type='text/css'>
<link rel='stylesheet' type='text/css' media='print' href='estilo_print.css'>

<body onload="javascript:setaFocoOnLoad();" style="margin: 10px 1em;" >

<div id="content">

<h1 tabindex="1" id="MsgInicial" >Arquivo Anexo</h1>

<form>
	
<%
	// Valida a URL passada como parâmetro
	int resp = 0;
	
	String anexo = request.getParameter("urlAnexo");
	
	if( anexo != null) {
	System.out.println(anexo);
		anexo = anexo.replace('|', '&');
	System.out.println(anexo);
	}
%>

<table cellpadding='0' cellspacing='0' border='0'  width='100%'>
<tr>
	<td>
	<!--teste-->
	<% // Se não encontrou o anexo => Exibe Erro  
		if ( resp == 404)  {  %>	
		<div tabindex= "2" align="center"> <B>  Arquivo anexo não encontrado </B></div>
		<br><br>
	<% } else { %>
		<iframe src="<%= anexo %>" id="arqAnexo" name='arqAnexo' longdesc='Arquivo Anexo' frameborder='0' width='100%' height='300'></iframe>
	<% } %>	
	</td>
</tr>	
</table>

<table cellpadding='2' cellspacing='1' border='0'  width='100%'>
<tr>
	<td class='tdHeader1' align='center'>
    <label for="fechar">
    <input type='button' class='button' value='Fechar' onClick='window.close()' title='Fechar Janela' tabindex="20">
    </label>
	</td>
</tr>
</table>

<INPUT TYPE="hidden" NAME="urlAnexo"  VALUE="<%= anexo %>">

</form>
</div>
</body>
</html:html>
