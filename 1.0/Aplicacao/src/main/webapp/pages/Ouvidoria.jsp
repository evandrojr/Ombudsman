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
<% 
  /*
   -- Sistema:      Ouvidoria
   -- M�dulo:       Geral
   -- Aplica��o:    Ouvidoria.jsp
   -- 
   -- Descri��o:    Sa�da padr�o para Org�os n�o cadastrados
   -- 
   -- Vers�o:       1.0
   -- Data:         04/01/2005
  */
%>

<%@ taglib uri="/tags/struts-html" prefix="html" %>

<html:html lang="pt">
<head>
<html:base/>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link rel="stylesheet"  media="all" href="estilo_conteudo.css" type="text/css">
<title>Aten��o</title>
	<script language="JavaScript">
	<!-- //
	function onLoad(){
		var focusControl = document.getElementById("titulo");
		focusControl.focus();
	}
	// -->
	</script>
</head>
<body onLoad="onLoad();">
<div id="content">
  <h1 id="titulo" tabindex="1" title="Aten��o">P�gina n�o encontrada</h1>
  <br>
  <label tabindex="2" title="Ouvidoria n�o cadastrada no sistema">
            <p>Nossas desculpas...</p>
            <p>O item que voc� requisitou n�o existe nesse servidor ou n�o pode ser servido.</p>
            <p>Por favor verfique o endere�o informado. </p>
            <p>Obrigado.</p>
  </label>
  <br>
  <hr>
  <p class="voltar"> 
  	<a tabindex="3" title="voltar para p�gina anterior" href="javascript:history.go(-1)" >voltar</a>
  </p>
</div>
</body>
</html:html>
