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
<%@ taglib uri="/tags/struts-bean"  prefix="bean"%>
<%@ taglib uri="/tags/struts-html"  prefix="html"%>

<script language='javascript'>

function setaFocoInicio(){
   document.getElementById("mensagem").focus();   
}

// Dispara a ação de acordo com o parâmetro informado	
function disparaAcao() {	
	var baseHref = location.protocol + "//" + location.host + location.pathname;
		
    // Se foi passada uma ação a ser executada, executa-se a mesma
    // na própria janela da mensagem
    
    var acao = document.forms[0].txtAcao.value;    
    
	if (acao == "") {	
	    // Caso não tenha sido passada uma ação específica,
	    // chama-se a tela acima da tela de mensagem, onde
	    // será executada uma ação
		
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

<!-- Parâmetro comum -->

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