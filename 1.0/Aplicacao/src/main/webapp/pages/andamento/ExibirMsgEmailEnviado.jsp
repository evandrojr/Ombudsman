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
	<a tabindex="3" title="voltar para página anterior" href="javascript:history.go(-1)" >voltar</a>
  </p>
</div>
</body>
</html:html>
