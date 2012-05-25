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
<%--
 /*
   -- Sistema:      Ouvidoria
   -- M�dulo:       Global
   -- 
   -- Descri��o:   Exibe o conte&uacute;do do arquivo anexo � mensagem
   -- 
   -- Vers�o:       1.0
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
	// Valida a URL passada como par�metro
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
	<% // Se n�o encontrou o anexo => Exibe Erro  
		if ( resp == 404)  {  %>	
		<div tabindex= "2" align="center"> <B>  Arquivo anexo n�o encontrado </B></div>
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
