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
<html:base />

<head>
<meta http-equiv='Content-Type' content='text/html; charset=iso-8859-1'>
<title>Confirma��o</title>

<script language='javascript'>

function setaFocoInicio(){
   var focusControl = document.getElementById("confirmacao");
   focusControl.focus();
}

// Dispara a a��o de acordo com o par�metro informado	
function disparaAcao(vAcao) {	
    var parametros = "";	
	var baseHref = location.protocol + "//" + location.host + location.pathname;
	
	
    if (vAcao == "ResponderMsg") {
        document.forms["cResposta"].txtResposta.value = window.opener.document.forms[0].txtResposta.value;
        document.forms["cResposta"].action = baseHref + "../../../andamento/RespondeAcionamento.do";    
    } else if (vAcao == "SalvarRascunho") {
        document.forms["cResposta"].txtResposta.value = window.opener.document.forms[0].txtResposta.value;
		document.forms["cResposta"].action = baseHref + "../../../andamento/SalvaRascunhoResp.do";       
    }
    document.forms["cResposta"].submit();

}
</script>

</head>

<link rel='stylesheet'  media='all' href='../<bean:write name="_LAYOUT_" property="esquemaCores"/>/estilo_conteudo.css' type='text/css'>
<link rel='stylesheet' type='text/css' media='print' href='../estilo_print.css'>
<body class="tdHeader4" onload="javascript:setaFocoInicio();" style="margin: 10px 1em;">
<div id="content">

<form method="post" name="cResposta">

<h2 id="confirmacao" tabindex="1">Confirma��o</h2>

<p tabindex="2" Align="LEFT">
   <logic:equal name="txtAcao" value="ResponderMsg"> 
      <B><bean:message key="responder.mensagem.confirma"/></B>
   </logic:equal>    
   <logic:equal name="txtAcao" value="SalvarRascunho"> 
      <B><bean:message key="salvar.rascunho.confirma"/></B>
   </logic:equal> 
</p>



<table cellpadding='2' cellspacing='1' border='0'  width='100%'>
<tr>
	<td class='tdHeader1' align='center'>
		<label for="sim">
      	<input type='button' class='button' value='Sim' tabindex="2" onClick='javascript:disparaAcao("<bean:write name="txtAcao"/>")' title='Sim'>
        </label>
	</td>
	<td class='tdHeader1' align='center'>
		<label for="nao">
      	<input type='button' class='button' value='N�o' tabindex="3" onClick='window.close()' title='N�o'>
        </label>
	</td>
</tr>
</table>

<!-- Par�metros para as a��es Responder Msg e Salvar Rascunho -->
<INPUT TYPE=hidden NAME="idAcionamento" VALUE="<%= request.getAttribute("idAcionamento") %>">
<INPUT TYPE=hidden NAME="txtResposta"   VALUE="<%= request.getAttribute("txtResposta") %>">
<INPUT TYPE=hidden NAME="txtTitulo"     VALUE="<%= request.getAttribute("txtTitulo") %>">
<INPUT TYPE=hidden NAME="txtAcao"       VALUE="<%= request.getAttribute("txtAcao") %>">
<INPUT TYPE=hidden NAME="idRemetenteRedirec" VALUE="<%= request.getAttribute("idRemetenteRedirec") %>">
<INPUT TYPE=hidden NAME="idSolucao" VALUE="<%= request.getAttribute("idSolucao") %>">

</form> 

</div>
</body>
</html:html>