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
<% /*
   -- Sistema:      Ouvidoria
   -- Módulo:       Gerencial
   -- Aplicação:    Gestor de Conte&uacute;do
   -- 
   -- Descrição:    O gestor consulta o banco de scripts para alteraçao/exclusão
   --               ou chama a tela de inclusão
   -- 
   -- Versão:       1.0
   -- Data:         27/12/2004
   --   
  */
%>

<%@ taglib uri="/tags/struts-logic" prefix="logic" %>
<%@ taglib uri="/tags/struts-bean" prefix="bean"%>
<%@ taglib uri="/tags/struts-html" prefix="html"%>

<html:html lang="pt">

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<head>
<html:base />

<title>Atualizar Cadastro</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link rel="stylesheet"  media="all" href="../../<bean:write name="_LAYOUT_" property="esquemaCores"/>/estilo_conteudo.css" type="text/css">
<!-- Estilo para impressao -->
<link rel="stylesheet" type="text/css" media="print" href="../../estilo_print.css">

<script language="JavaScript">
<!--
function MM_reloadPage(init) {  //reloads the window if Nav4 resized
  if (init==true) with (navigator) {if ((appName=="Netscape")&&(parseInt(appVersion)==4)) {
    document.MM_pgW=innerWidth; document.MM_pgH=innerHeight; onresize=MM_reloadPage; }}
  else if (innerWidth!=document.MM_pgW || innerHeight!=document.MM_pgH) location.reload();
}
MM_reloadPage(true);
// -->
</script>

</head>


<script type="text/javascript" charset='iso-8859-1'>

// Mostra o resultado da consulta
function mostraResultado(){

	// Tira o parametro passado para identificar qual a funcionalidade
	var link = location.href;
	link = link.split("?");    
	
	document.forms[0].inclusao.value = 'N';	
	
    // limpa os iFrames
    window.frames[0].location = link + '../../../gerencial/Vazio.do';
    window.frames[1].location = link + '../../../gerencial/Vazio.do';

	// Monta parâmetros a serem passados à ação
	var parametros = "?action=" + document.forms[0].action.value + 
			                 "&txtAssunto=" + document.forms[0].txtAssunto.value +  
			                 "&txtEstado=" + document.forms[0].txtEstado.value +  			                 
			                 "&txtChave=" + document.forms[0].txtChave.value +
			                 "&txtEditar=" + document.forms[0].txtEditar.value ;	

	// Exibe o resultado da consulta no iFrame 1
	// window.frames[0].location= link + '../../../gerencial/ListarBancoScripts.do' + parametros;    
	window.frames[0].location= link + '../../../gerencial/ListarBancoScripts.do' + parametros;    
}

// Mostra campos para entrada dos dados do novo script
function mostraDetalheNovo(){

	// Tira o parametro passado para identificar qual a funcionalidade
	var link = location.href;
	link = link.split("?"); 
	
    // limpa o iFrame
    window.frames[1].location = link + '../../../gerencial/Vazio.do';

	document.forms[0].inclusao.value = 'S';	
	window.frames[0].location = link + '../../../gerencial/ExibeScripts.do';
}

// Reabre a consulta. Função a ser chamada após a efetivação
// da alteração ou exclusão
function reabrir() {

	// Tira o parametro passado para identificar qual a funcionalidade
	var link = location.href;
	link = link.split("?"); 
	
	// Caso tenha-se incluído uma nova solução, abre-se para nova consulta
	if (document.forms[0].inclusao.value == 'S') {
		window.location = link;
	} else {
	// Caso tenha-se alterado/excluído uma solução, exibe-se a consulta novamente 
 	    mostraResultado();
 	}
}

// Seta o foco ao carregar a tela
function setaFocoOnLoad(){
	document.getElementById("MsgInicial").focus();
}
   
</script> 

<body onload="javascript:setaFocoOnLoad();" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">




<div id="content">

<h1 tabindex="1" id="MsgInicial" ><%= (String) ("N".equals(request.getAttribute("txtEditar"))?"Utilização de Scripts":"Manter Scripts") %></h1>

<html:form action="ListarBancoScripts">

<table width="100%" border="0" cellpadding="2" cellspacing="0" align="center" height="30">
	<tr> 		    
		<td align="center">
			<table cellpadding="2" cellspacing="1" border="0" align="center" width="100%" height="100%">
				<tr>
					<td align="center" class="tdHeader3" width="100%">
						<input type="button" name="Submit" value="Novo Script" class="button" onClick="mostraDetalheNovo()" tabindex="2" >
		        	</td>
				</tr>
			</table>
		</td>
		<td> 
			<table cellpadding="2" cellspacing="1" border="0" align="center" width="100%" height="100%">
				<tr>
					<td class="tdHeader3" width="30%">
						<label for="passunto">Tipo Assunto:</label>
					</td>
					<td class="tdHeader4" height="100%" valign ="middle">
					    <html:select property="txtAssunto" tabindex="3" styleClass="text" styleId="passunto" >
						    <html:option value="0">Selecione</html:option>
					        <html:options collection="lstAssuntos" property="id" labelProperty="descricao"/>    
				        </html:select>				        
			        </td>
				</tr>
			</table>
	    </td>
	    
	   <td> 
			<table cellpadding="2" cellspacing="1" border="0" align="center" width="100%" height="100%">
				<tr>
					<td class="tdHeader3" width="40%">
						<label for="estado">Estado do Script:</label>
					</td>
					<td class="tdHeader4" height="100%" valign ="middle">
					    <html:select property="txtEstado" tabindex="3" styleClass="text" styleId="estado">
						    <html:option value="0">Selecione</html:option>
					        <html:options collection="listaTodosEstadosScripts" property="id" labelProperty="descricao"/>
				        </html:select>
			        </td>
				</tr>
			</table>
	    </td>

	    <td>
			<table cellpadding="2" cellspacing="1" border="0" align="center" width="100%" height="100%">
				<tr> 
					<td class="tdHeader3" height="100%">
						<label for="pchave">Palavra Chave:</label>
					</td>
					<td class="tdHeader4" valign ="middle">&nbsp; 
						<input class=text name="txtChave" id="pchave" tabindex="4">
					</td>		  
		        </tr>
			</table>
		</td>		
	</tr>
	<tr>
	 <td colspan='4' align='middle' class='tdHeader1'>
                <label for="consultar scripts"> 
			    <input type='button' tabindex="5" value='Buscar' name='buscar' class='button' onClick="javascript:mostraResultado();"  title='Clique para efetuar a consulta'>
                </label> 
	</td>
	</tr>
</table>
<br>

<!-- ----------------------------------------------------------------- -->

<table cellpadding="0" cellspacing="0" border="0"  width="100%">
<tr>
	<td>
		<iframe tabindex="6" src='_blank.htm' name='lista' id='lista' longdesc='Lista de Scripts' border='0' 
				width='100%' height="0" scrolling="0" marginwidth="0" marginheight="0" frameborder="0">
		</iframe>
	</td>
</tr>
</table>

<!-- ----------------------------------------------------------------- -->

<table cellpadding="0" cellspacing="0" border="0"  width="100%">
<tr>
	<td>
		<iframe tabindex="7" src='_blank.htm' name='detalhe' id='detalhe' longdesc='Detalhe do Script' border='0' 
				width='100%' height="0" scrolling="0" marginwidth="0" marginheight="0" frameborder="0" >
		</iframe>
	</td>
</tr>
</table> 

<!-- ----------------------------------------------------------------- -->
 

<hr>
<p class="voltar"> 
	<a tabindex="100" title="voltar para página anterior" href="javascript:history.go(-1)">voltar</a>
</p>

<html:hidden property="action"   value="ListarBcoScripts" />
<html:hidden property="inclusao" value="N" />

<input type="hidden" id="txtEditar" name="txtEditar" value="<bean:write name="txtEditar"/>">

</html:form>

</div>

</body>
</html:html> 
