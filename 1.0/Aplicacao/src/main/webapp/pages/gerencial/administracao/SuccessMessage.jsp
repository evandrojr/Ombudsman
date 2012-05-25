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
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">

<% /*
   -- M�dulo:       Gerencial
   -- 
   -- Descri��o:    Sa�da padr�o para Mensagens de Sucesso
   -- Vers�o:       1.0
   -- Data:         10/12/2004
  */
%>

<%@ taglib uri="/tags/struts-bean" prefix="bean" %>
<%@ taglib uri="/tags/struts-html" prefix="html" %>
<%@ taglib uri="/tags/struts-logic" prefix="logic" %>

<html:html lang="pt">
<head>
<html:base/>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>Sucesso</title>
	<script language="JavaScript">
	<!-- // 
	function onLoad(){
		try {
	        window.parent.document.getElementById("detalhe").style.height = document.body.scrollHeight;			
			document.body.style.marginTop   = "0px";
		    document.body.style.marginLeft   = "0px";
			document.body.style.marginRight = "0px";
			document.body.style.marginBottom = "0px";			
			window.parent.frames["lista"].location.reload();
			var focusControl = document.getElementById("titulo");
		focusControl.focus();
		} catch (e) {
		}
	}
	// -->
	</script>
</head>
<link rel="stylesheet"  media="all" href="../../<bean:write name="_LAYOUT_" property="esquemaCores"/>/estilo_conteudo.css" type="text/css">
<body onLoad="onLoad();" style="margin: 0px 0px;">
<div id="content">
  <h1 id="titulo" title="opera��o realizada com sucesso" tabindex="1">Sucesso</h1>
	<ul>
		<html:messages id="message" message="true">
        <li tabindex="2" title="<%= message %>"><%= message %></li>
		</html:messages>
	</ul>
  <hr>
  <p class="voltar"> 
  	<a tabindex="3" title="fechar a tela" href="../../../gerencial/Vazio.do" >fechar</a>
  </p>
</div>
</body>
</html:html>
