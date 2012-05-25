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

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html   lang="pt-br">

<head>
<html:base />
	
<title>Consulta Usuários por Perfil</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link rel="stylesheet"  media="all" href="../../<bean:write name="_LAYOUT_" property="esquemaCores"/>/estilo_conteudo.css" type="text/css">
<!-- Estilo para impressao -->
<link rel="stylesheet" type="text/css" media="print" href="../../estilo_print.css">
<script language="JavaScript">
<!--

<!--
function MM_reloadPage(init) {  //reloads the window if Nav4 resized
  if (init==true) with (navigator) {if ((appName=="Netscape")&&(parseInt(appVersion)==4)) {
    document.MM_pgW=innerWidth; document.MM_pgH=innerHeight; onresize=MM_reloadPage; }}
  else if (innerWidth!=document.MM_pgW || innerHeight!=document.MM_pgH) location.reload();
}
MM_reloadPage(true);
// -->
//-->

</script>
</head>

<!-- Bibliotecas javascript  -->
<script language="JavaScript" src="../../js/util.js"></script>
<script language="JavaScript" src="../../js/data.js"></script>

<script type="text/javascript" charset='iso-8859-1'>
function mostraResultado(){
	var ok = true;
	var innerHtmlMsgErros = '';	

    // limpa os iFrames
    window.frames[0].location = location.href + '../../../gerencial/Vazio.do';
    window.frames[1].location = location.href + '../../../gerencial/Vazio.do';
	
	// Críticas
    // Valida o período
	
	if(ok){
		// Monta parâmetros a serem passados à ação
		var parametros = "?txtPerfil=" + document.forms[0].txtPerfil.value;
								 
		// Exibe o resultado da consulta no iFrame 1
	    window.frames[0].location = location.href + '../../../gerencial/ListaUsuarioPerfil.do' + parametros;    		
		
	} else {
		var texto = innerHtmlMsgErros;
		abreAlerta(texto);		    
		onLoad();
	}			

}

// Seta o foco ao carregar a tela
function setaFocoOnLoad(){
	document.getElementById("MsgInicial").focus();
} 


</script>

<body onload="javascript:setaFocoOnLoad();" >
	


	<div id="content">
		<h1 tabindex="1" id="MsgInicial" >Consultar Usuários por Perfil</h1>
			<html:form action="/ListaUsuarioPerfil" method="POST" target="iFrame1">	

				<table cellpadding='2' cellspacing='0' border='0' width='100%'>
				    <tr>
				        <td width="30%" height="100%">
							<table border="0" cellpadding="2" cellspacing="1" align="center" width="100%" height=27>
								<tr>
									<td class=tdHeader3 width=100% height="100%">
										<label for="pPerfil">Perfil:</label>
									</td>
								</tr>
							</table>
						</td>
						<td width="70%" height="100%">
							<table border="0" cellpadding="2" cellspacing="1" align="center" width="100%" height="100%">
								<tr>
									<td class=tdHeader4 valign=top>
										&nbsp;&nbsp;
									    <html:select property="txtPerfil" tabindex="2" styleClass="text" styleId="pPerfil" >
										    <html:option value="0">Selecione</html:option>
									        <html:options collection="lstPerfil" property="id" labelProperty="descricao"/>
								        </html:select>
									</td>
								</tr>
							</table>
						</td>						
					</tr>
					<tr>
						<td colspan='2' align='middle' class='tdHeader1'>
			                <label for="consultar usuários por perfil"> 
						    <input type='button' tabindex="3" value='Buscar' name='buscar' class='button' onClick="javascript:mostraResultado();"  title='Clique para efetuar a consulta'>
			                </label> 
						</td>
					</tr>											
				</table>
				<br>
				<table cellpadding="0" cellspacing="0" border="0"  width="100%">
					<tr>
						<td>
							<iframe tabindex="8" src='_blank.htm' name='iFrame1' id='iFrame1' longdesc='Lista de Usuários' 
								border='0' width='100%' height="0" scrolling="0" marginwidth="0" marginheight="0" frameborder="0" >
							</iframe>
						</td>
					</tr>
				</table>
				<hr>
				<table cellpadding="0" cellspacing="0" border="0"  width="100%">
					<tr>
						<td>
							<iframe tabindex="9" src='_blank.htm' name='iFrame2' id='iFrame2' longdesc='Detalhe do Usuário' 
			        				border='0' width='100%' height="0" scrolling="0" marginwidth="0" marginheight="0" frameborder="0" >
			        		</iframe>
						</td>
					</tr>
				</table>
				<p class="voltar"> 
					<a tabindex="10" title="voltar para página anterior" href="javascript:history.go(-1)" >voltar</a>
				</p>
			</html:form> 
		</div>
	</body>
</html>
