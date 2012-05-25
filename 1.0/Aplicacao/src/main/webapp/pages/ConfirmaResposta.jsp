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

<script language='javascript'>

function setaFocoInicio(){
   var focusControl = document.getElementById("confirmacao");
   focusControl.focus();
}

// Dispara a ação de acordo com o parâmetro informado	
function disparaAcao() {	
    var parametros = "";

    if (document.forms[0].txtAcao.value == "ResponderMsg") {
        parametros = "?txtTitulo=" + document.forms[0].txtTitulo.value +
                     "&txtResposta=" + document.forms[0].txtResposta.value +
                     "&idAcionamento=" + document.forms[0].idAcionamento.value +
                     "&idRemetenteRedirec=" + document.forms[0].idRemetenteRedirec.value +
                     "&txtAcao=" + document.forms[0].txtAcao.value; 

        window.location = "RespondeAcionamento.do" + parametros;    
    } 
    else if (document.forms[0].txtAcao.value == "SalvarRascunho") {
        parametros = "?txtTitulo=" + document.forms[0].txtTitulo.value +
                     "&txtResposta=" + document.forms[0].txtResposta.value +
                     "&idAcionamento=" + document.forms[0].idAcionamento.value +
                     "&idRemetenteRedirec=" + document.forms[0].idRemetenteRedirec.value +
                     "&txtAcao=" + document.forms[0].txtAcao.value; 

        window.location = "SalvaRascunhoResp.do" + parametros;        
    } 
    //-----  Atualizar banco de Script
    else if ( (document.forms[0].txtAcao.value == "AlterarScript") || 
              (document.forms[0].txtAcao.value == "ExcluirScript") ) {
        parametros = "?txtTitulo=" + document.forms[0].txtTitulo.value +
                     "&txtAssunto=" + document.forms[0].txtAssunto.value +
                     "&txtTexto=" + document.forms[0].txtTexto.value +
                     "&idScript=" + document.forms[0].idScript.value +
                     "&action=" + document.forms[0].txtAcao.value +
                     "&txtAcao=" + document.forms[0].txtAcao.value; 

        window.location = document.forms[0].txtAcao.value + ".do" + parametros;        
    }

}
	
</script>

<html:html lang="pt">

<head>
<html:base />
<meta http-equiv='Content-Type' content='text/html; charset=iso-8859-1'>
<title>Confirmação</title>
</head>

<link rel='stylesheet'  media='all' href='<bean:write name="_LAYOUT_" property="esquemaCores"/>/estilo_conteudo.css' type='text/css'>
<link rel='stylesheet' type='text/css' media='print' href='estilo_print.css'>
<body onload="javascript:setaFocoInicio();" style="margin: 10px 1em;">
<div id="content">

<form>

<h2 id="confirmacao" tabindex="1">Confirmação</h2>

<p tabindex="2" Align="LEFT">
   <logic:equal name="txtAcao" value="ResponderMsg"> 
      <B><bean:message key="responder.mensagem.confirma"/></B>
   </logic:equal>    
   <logic:equal name="txtAcao" value="SalvarRascunho"> 
      <B><bean:message key="salvar.rascunho.confirma"/></B>
   </logic:equal> 
   <logic:equal name="txtAcao" value="AlterarScript"> 
      <B><bean:message key="alterar.script.confirma"/></B>
   </logic:equal> 
   <logic:equal name="txtAcao" value="ExcluirScript"> 
      <B><bean:message key="excluir.script.confirma"/></B>
   </logic:equal> 
</p>

<table cellpadding='2' cellspacing='1' border='0'  width='100%'>
<tr>
	<td class='tdHeader1' align='center'>
		<label for="sim">
      	<input type='button' class='button' value='Sim' tabindex="2" onClick='javascript:disparaAcao()' title='Sim'>
        </label>
	</td>
	<td class='tdHeader1' align='center'>
		<label for="nao">
      	<input type='button' class='button' value='Não' tabindex="3" onClick='window.close()' title='Não'>
        </label>
	</td>
</tr>
</table>

<!-- Parâmetros comuns -->
<INPUT TYPE=hidden NAME="txtAcao"       VALUE="<%= request.getAttribute("txtAcao") %>">

<!-- Parâmetros para as ações Responder Msg e Salvar Rascunho -->
<INPUT TYPE=hidden NAME="idAcionamento" VALUE="<%= request.getAttribute("idAcionamento") %>">
<INPUT TYPE=hidden NAME="txtResposta"   VALUE="<%= request.getAttribute("txtResposta") %>">
<INPUT TYPE=hidden NAME="txtTitulo"     VALUE="<%= request.getAttribute("txtTitulo") %>">
<INPUT TYPE=hidden NAME="idRemetenteRedirec" VALUE="<%= request.getAttribute("idRemetenteRedirec") %>">

<!-- Parâmetros para as ações Alterar/Excluir Script -->
<INPUT TYPE=hidden NAME="txtAssunto"    VALUE="<%= request.getAttribute("txtAssunto") %>">
<INPUT TYPE=hidden NAME="txtTexto"      VALUE="<%= request.getAttribute("txtTexto") %>">
<INPUT TYPE=hidden NAME="idScript"      VALUE="<%= request.getAttribute("idScript") %>">

<!-- OBS: Esta ação tamb&eacute;m utiliza o parâmetro txtTitulo -->		

</form> 

</div>
</body>
</html:html>