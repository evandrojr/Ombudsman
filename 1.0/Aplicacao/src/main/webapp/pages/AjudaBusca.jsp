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
	
	window.parent.document.getElementById("fmeSelecao").style.height = 380;
}

// Mostra resultado da busca
function mostraResultado() {
	// Trata Href 
	<%	String domain = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();   %>	

	// Monta par�metros a serem passados � a��o
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