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
   var focusControl = document.getElementById("mensagem");
   focusControl.focus();
}

// Dispara a a��o de acordo com o par�metro informado	
function disparaAcao() {	
    var parametros = "";
	var baseHref = location.protocol + "//" + location.host + location.pathname;

    // Caso a a��o seja Responder Msg, retorna para a tela de
    // de consulta � msgs por responsabilidade

	window.opener.document.forms[0].target="conteudo";
	window.opener.document.forms[0].action=baseHref + "../../../andamento/"+"ConsultaMsgPorRespons.do"
	window.opener.document.forms[0].submit();

    window.close();    

}
	
</script>

<html:html lang="pt">

<head>
<html:base />
<meta http-equiv='Content-Type' content='text/html; charset=iso-8859-1'>
<title>Mensagem</title>
</head>

<link rel='stylesheet'  media='all' href='../<bean:write name="_LAYOUT_" property="esquemaCores"/>/estilo_conteudo.css' type='text/css'>
<link rel='stylesheet' type='text/css' media='print' href='../estilo_print.css'>
<body class="tdHeader4" onload="javascript:setaFocoInicio();" style="margin: 10px 1em;">

<div id="content">

<form name="frm" action method="post">

<h2 id="mensagem" title="mensagem" tabindex="1">Mensagem</h2>
    
<p tabindex="2" Align="LEFT">
   <logic:equal name="txtAcao" value="ResponderMsg"> 
      <B><bean:message key="responder.mensagem.sucesso"/></B>      
   </logic:equal> 
   <logic:equal name="txtAcao" value="SalvarRascunho"> 
      <B><bean:message key="salvar.rascunho.sucesso"/></B>
   </logic:equal>    
</p>

<p tabindex="3" Align="LEFT">
	<logic:present name="EnvioEmail"> 
    	<B><bean:message key="responder.mensagem.envioEmail"/></B>
    </logic:present> 
</p>    


<table cellpadding='2' cellspacing='1' border='0'  width='100%'>
<tr>
	<td class='tdHeader1' align='center'>
		<label for="sim">
      	<input type='button' class='button' value='OK' tabindex="4" onClick='javascript:disparaAcao()' title='OK'>
        </label>
	</td>
</tr>
</table>

<!-- Par�metros para as a��es Responder Msg e Salvar Rascunho -->
<INPUT TYPE=hidden NAME="idAcionamento" VALUE="<%= request.getAttribute("idAcionamento") %>">
<INPUT TYPE=hidden NAME="txtAcao"       VALUE="<%= request.getAttribute("txtAcao") %>">
<INPUT TYPE=hidden NAME="idRemetenteRedirec" VALUE="<%= request.getAttribute("idRemetenteRedirec") %>">


</form> 

</div>
</body>
</html:html>