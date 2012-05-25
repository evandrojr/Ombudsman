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

<html:html lang="pt">

<head>
<html:base />
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>Email Enviado</title>

	<script language="JavaScript">

	function onLoad(){
		document.getElementById("titulo").focus();
	}

	</script>
</head>

<link rel="stylesheet"  media="all" href="../<bean:write name="_LAYOUT_" property="esquemaCores"/>/estilo_conteudo.css" type="text/css">
<!-- Estilo para impressao -->
<link rel="stylesheet" type="text/css" media="print" href="../estilo_print.css">
<body onLoad="onLoad();">
<div id="content">
  <h1 id="titulo" tabindex="1">Email enviado</h1>
	<p></p>
	<p></p>
	<label tabindex="2"><p><bean:message key="email.enviado"/></p></label>
	<p></p>
	<p></p>
	<hr>
  <p class="voltar"> 
	<a tabindex="3" title="voltar para p�gina anterior" href="javascript:history.go(-1)" >voltar</a>
  </p>
</div>
</body>
</html:html>
