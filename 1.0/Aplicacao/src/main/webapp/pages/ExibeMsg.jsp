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
<%@ taglib uri="/tags/struts-bean"  prefix="bean"%>
<%@ taglib uri="/tags/struts-html"  prefix="html"%>

<script language='javascript'>

function setaFocoInicio(){
   document.getElementById("mensagem").focus();   
}

// Dispara a a��o de acordo com o par�metro informado	
function disparaAcao() {	
	var baseHref = location.protocol + "//" + location.host + location.pathname;
		
    // Se foi passada uma a��o a ser executada, executa-se a mesma
    // na pr�pria janela da mensagem
    
    var acao = document.forms[0].txtAcao.value;    
    
	if (acao == "") {	
	    // Caso n�o tenha sido passada uma a��o espec�fica,
	    // chama-se a tela acima da tela de mensagem, onde
	    // ser� executada uma a��o
		
		window.close();
		window.opener.reabrir();	            
	} else {	
		window.location = baseHref + acao + ".do";
	}
}

</script>

<html:html lang="pt">

<head>
<html:base />
<meta http-equiv='Content-Type' content='text/html; charset=iso-8859-1'>
<title>Mensagem</title>
</head>

<link rel='stylesheet'  media='all' href='<bean:write name="_LAYOUT_" property="esquemaCores"/>/estilo_conteudo.css' type='text/css'>
<link rel='stylesheet' type='text/css' media='print' href='estilo_print.css'>
<body onload="javascript:setaFocoInicio();" style="margin: 10px 1em;">

<div  id="content">

<form>

<h2 id="mensagem" title="mensagem" tabindex="1">Mensagem</h2>    
<ul>
	<html:messages id="message" message="true">
        <li tabindex="2" title="<%= message %>"><%= message %></li>
    </html:messages>
</ul>

<table cellpadding='2' cellspacing='1' border='0'  width='100%'>
<tr>
	<td class='tdHeader1' align='center'>
		<label for="sim">
      	<input type='button' class='button' value='OK' tabindex="3" onClick='javascript:disparaAcao()' title='OK'>
        </label>
	</td>
</tr>
</table>

<!-- Par�metro comum -->

<logic:present name="txtAcao">
    <INPUT TYPE=hidden NAME="txtAcao"       VALUE="<%= request.getAttribute("txtAcao") %>">
</logic:present>
<logic:notPresent name="txtAcao">
    <INPUT TYPE=hidden NAME="txtAcao"       VALUE="">
</logic:notPresent>

</form> 

</div>
</body>
</html:html>