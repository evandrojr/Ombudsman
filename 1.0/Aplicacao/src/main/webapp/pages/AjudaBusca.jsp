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

function onLoad(){
	
	window.parent.document.getElementById("fmeSelecao").style.height = 380;
}

// Mostra resultado da busca
function mostraResultado() {
	// Trata Href 
	<%	String domain = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();   %>	

	// Monta parâmetros a serem passados à ação
	var parametros = "?txtBusca=" + document.forms[0].txtBusca.value;		                 

	// Exibe o resultado da consulta no iFrame 1
    window.frames[0].location = "<%= domain %>" + '/AjudaConsulta.do' + parametros;    

}

</script>

<html:html lang="pt">
<head>
<html:base />
<meta http-equiv='Content-Type' content='text/html; charset=iso-8859-1'>
</head>

<link rel='stylesheet' type='text/css' media='all'   href='<bean:write name="_LAYOUT_" property="esquemaCores"/>/estilo_conteudo.css'>
<link rel='stylesheet' type='text/css' media='print' href='<bean:write name="_LAYOUT_" property="esquemaCores"/>/estilo_print.css'>
<body  onload="javascript:onLoad();" style="margin: 5px 5px 5px 0px;">

<div align="left">

<form>

<table cellpadding='2' cellspacing='0' border='0' width='100%'>
    <tr>
        <td width="30%" height="100%">
			<table border="0" cellpadding="2" cellspacing="1" align="center" width="100%" height=27>
				<tr>
					<td class=tdHeader3 width=100% height="100%">
						<label for="ptexto">Busca:</label>
					</td>
				</tr>
			</table>
		</td>
		<td width="70%" height="100%">
			<table border="0" cellpadding="2" cellspacing="1" align="center" width="100%" height="100%">
				<tr>
					<td class=tdHeader4 valign=top>
						&nbsp;
						<input type='text' tabindex="6" size='20' name='txtBusca' class='text' id="ptexto">
					</td>
				</tr>
			</table>
		</td>		
	</tr>
	<tr>
		<td colspan='2' align='middle' class='tdHeader1'>
    	    <label for="consultar ajuda"> 
		    <input type='button' tabindex="3" value='Buscar' name='buscar' class='button' onClick="javascript:mostraResultado();"  title='Clique para efetuar a consulta'>
	        </label> 
		</td>
	</tr>											

</table>
				
<!-- <table cellpadding='0' cellspacing='0' border='0'  width='100%' height="80%">
	<tr>
		<td> -->
			<iframe src='_blank.htm' id="fmeBusca" name='fmeBusca' longdesc='Busca de Ajuda' 
				frameborder='0' width='100%' height='95%' >
			</iframe>
<!--		</td>
	</tr>
</table> -->

</form> 

</div>

</body>

</html:html>