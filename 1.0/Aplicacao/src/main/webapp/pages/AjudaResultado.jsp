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

<script language='javascript'>

function onLoad(){
	document.getElementById("MsgInicial").focus();
}

</script>

<html:html lang="pt">
<head>
<html:base />
<meta http-equiv='Content-Type' content='text/html; charset=iso-8859-1'>
</head>

<link rel='stylesheet' type='text/css' media='all'   href='<bean:write name="_LAYOUT_" property="esquemaCores"/>/estilo_conteudo.css'>
<link rel='stylesheet' type='text/css' media='print' href='<bean:write name="_LAYOUT_" property="esquemaCores"/>/estilo_print.css'>
<body  onload="javascript:onLoad();" style="margin: 10px 0em;">

<div  align="left">

<h1 tabindex="1" id="MsgInicial" >Resultado da Busca</h1>
	
<form>

<ul>
	<html:messages id="message" message="true">
        <li tabindex="2" title="<%= message %>"><%= message %></li>
    </html:messages>
</ul>	
	
<% int cont = 0; %>

<logic:iterate name="lstAjuda" id="ajuda" indexId="index">
	 <% cont++; %> 
     <img src='images/bullet1b.gif'>
     &nbsp;
	 <a tabindex="2" title='' href='<bean:write name="ajuda" property="htmlAjuda"  />' target='direito'>
	 <bean:write name="ajuda" property="descricao"  />
	 </a>
     <br>
</logic:iterate>

<%  if (cont < 16) {
           cont = 16;
       }
%>
<script type="text/javascript" charset='iso-8859-1'>
	window.parent.document.getElementById("fmeBusca").style.height = <%= 19 * ( (cont>16?16:cont) + 1 ) %>;
</script>
</form> 
<hr>
  <p class="voltar"><A title="imprimir esta p�gina" href="javascript:window.print()" tabindex="3">imprimir</A> 
    . <A title="topo da p�gina" href="javascript:window.location=location.href;" tabindex="4">topo</A>
</div>
</body>
</html:html>