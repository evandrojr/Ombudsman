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
<% /*
   -- Sistema:      Ouvidoria
   -- M�dulo:       Gerencial
   -- Aplica��o:    Gestor de Conte&uacute;do
   -- 
   -- Descri��o:    O gestor consulta o banco de solu��es para altera�ao/exclus�o
   --               ou chama a tela de inclus�o
   -- 
   -- Vers�o:       1.0
   -- Data:         04/01/2005
   --   
  */
%>

<%@ taglib uri="/tags/struts-logic" prefix="logic" %>
<%@ taglib uri="/tags/struts-bean" prefix="bean"%>
<%@ taglib uri="/tags/struts-html" prefix="html"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html   lang="pt-br">


<head>
<html:base />

<title>Atualizar Banco de Solu��es</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link rel="stylesheet"  media="all" href="../../<bean:write name="_LAYOUT_" property="esquemaCores"/>/estilo_conteudo.css" type="text/css">
<!-- Estilo para impressao -->
<link rel="stylesheet" type="text/css" media="print" href="../../estilo_print.css">
</head>

<script language="JavaScript">

// Mostra o resultado da consulta
function mostraResultado(){

	document.forms[0].inclusao.value = 'N';

    // limpa os iFrames
    window.frames[0].location = location.href + '../../../gerencial/Vazio.do';
    window.frames[1].location = location.href + '../../../gerencial/Vazio.do';
	
	// Monta par�metros a serem passados � a��o[inclusao parametro EstadoSolucao sm-98586]
	var parametros = "?action=" + document.forms[0].action.value + 
			                 "&txtAssunto=" + document.forms[0].txtAssunto.value +  
			                 "&txtChave=" + document.forms[0].txtChave.value+
   			                 "&idEstadoSolucao=" + document.forms[0].idEstadoSolucao.value;		                 

	// Exibe o resultado da consulta no iFrame 1
    window.frames[0].location = location.href + '../../../gerencial/ListaSolucoesAtualizacao.do' + parametros;    
}

// Mostra campos para entrada dos dados do novo script
function mostraDetalheNovo(){
    // limpa o iFrame
    window.frames[1].location = location.href + '../../../gerencial/Vazio.do';

	document.forms[0].inclusao.value = 'S';
	window.frames[0].location = location.href + '../../../gerencial/ExibeSolucoesAtualizacao.do';
}

// Seta o foco ao carregar a tela
function setaFocoOnLoad(){
	document.getElementById("MsgInicial").focus();
} 

// Reabre a consulta. Fun��o a ser chamada ap�s a efetiva��o
// da altera��o ou exclus�o
function reabrir() {
	// Caso tenha-se inclu�do uma nova solu��o, abre-se para nova consulta
	if (document.forms[0].inclusao.value == 'S') {
		window.location = location.href;	
	} else {
	// Caso tenha-se alterado/exclu�do uma solu��o, exibe-se a consulta novamente 
 	    mostraResultado();
 	}
}

</script>

<body onload="javascript:setaFocoOnLoad();" >




<div id="content">

<h1 tabindex="1" id="MsgInicial" >Atualizar Banco de Solu��es</h1>

<html:form action="ListaSolucoesAtualizacao">

<table width="100%" border="0" cellpadding="2" cellspacing="0" align="center" height="30">
	<tr> 		    
		<td align="center">
			<table cellpadding="2" cellspacing="1" border="0" align="center" width="100%" height="100%">
				<tr>
					<td align="center" class="tdHeader3" width="100%">
						<input type="button" name="Submit" value="Nova Solu��o" class="button" onClick="mostraDetalheNovo()" tabindex="2" >
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
					<td class="tdHeader3" width="30%">
						<label for="passunto">Estado da Solu��o:</label>
					</td>
					<td class="tdHeader4" valign ="middle">
					    <html:select property="idEstadoSolucao" tabindex="3" styleClass="text" styleId="pestado" >
						    <html:option value="0">Selecione</html:option>
					        <html:options collection="lstEstadosSolucao" property="id" labelProperty="descricao"/>    
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
        <label for="Consultar Banco de Solu��es"> 
	    <input type='button' tabindex="5" value='Buscar' name='buscar' class='button' onClick="javascript:mostraResultado();"  title='Clique para efetuar a consulta'>
        </label> 
	</td>
	</tr>
</table>

<!-- ----------------------------------------------------------------- -->

<table cellpadding="0" cellspacing="0" border="0"  width="100%">
	<tr>
		<td>
			<iframe tabindex="6" src='_blank.htm' name='lista' id='lista' longdesc='Lista de Solucoes' 
					border='0' width='100%' height="0" scrolling="0" marginwidth="0" marginheight="0" frameborder="0" >
			</iframe>
		</td>
	</tr>
</table>

<!-- ----------------------------------------------------------------- -->

<table cellpadding="0" cellspacing="0" border="0"  width="100%">
	<tr>
		<td>
			<iframe tabindex="7" src='_blank.htm' name='detalhe' id='detalhe' longdesc='Detalhe da Solucao' 
					border='0' width='100%' height="0" scrolling="0" marginwidth="0" marginheight="0" frameborder="0" >
			</iframe>
		</td>
	</tr>
</table>

<!-- ----------------------------------------------------------------- -->
  
<!-- <br> -->
<hr>
<p class="voltar"> 
	<a tabindex="8" title="voltar para p�gina anterior" href="javascript:history.go(-1)">voltar</a>
</p>
<html:hidden property="action"    value="ListarBcoSolucoes" />
<html:hidden property="inclusao"  value="N" />
</html:form>

</div>

</body>

</html>
