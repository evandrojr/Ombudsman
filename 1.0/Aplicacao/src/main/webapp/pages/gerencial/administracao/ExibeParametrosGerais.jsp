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
<%--
/*
   -- M�dulo:       Gerencial
   -- 
   -- Descri��o:    O administrador mant&eacute;m os dados dos par�metros gerais
   -- 
   -- Vers�o:       1.0
   -- Data:         10/01/2005
  */
--%>

<%@ taglib uri="/tags/struts-logic" prefix="logic" %>
<%@ taglib uri="/tags/struts-bean" prefix="bean"%>
<%@ taglib uri="/tags/struts-html" prefix="html"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html   lang="pt-br">


<html:base />

<!-- Biblioteca javascript  -->
<script language="JavaScript" src="../../js/util.js"></script>

<script type="text/javascript" charset='iso-8859-1'>

// Critica dados alterados
function validaParametros() {
	var ok = true;
	var innerHtmlMsgErros = '';
	
    // Critica campos
	if ( ( document.forms[0].txtHostEmail.value == null) || 
	     ( document.forms[0].txtHostEmail.value == "" ) ) {
		innerHtmlMsgErros += formataErro( 'Endere�o do servidor de email deve ser preenchido');
		ok = false;
	}
	
	var tempo = document.forms[0].txtTempoLimite.value;
	if ( tempo == null || tempo == ""  || !isInteger(tempo) ) {
		innerHtmlMsgErros += formataErro( 'Tempo limite de resposta inv�lido');
		ok = false;
	}

	var extensao1 = document.forms[0].txtExtensaoNaoPermitida.value;
	if ( extensao1 == null || extensao1 == "" ) {
		innerHtmlMsgErros += formataErro( 'Extens�es de arquivos permitidos devem ser preenchidas');
		ok = false;
	}

	var extensao2 = document.forms[0].txtExtensaoPermitida.value;
	if ( extensao2 == null || extensao2 == "" ) {
		innerHtmlMsgErros += formataErro( 'Extens�es de arquivos permitidos devem ser preenchidas');
		ok = false;
	}
	
	var dirContexto = document.forms[0].txtDirContexto.value;
	if ( dirContexto == null || dirContexto == "" ) {
		innerHtmlMsgErros += formataErro( 'Diret�rio raiz da aplica��o deve ser preenchido');
		ok = false;
	}
	
	var limiteColunaGrafico = document.forms[0].txtlimiteColunaIndicadores.value;	
	if ( limiteColunaGrafico == null || limiteColunaGrafico == ""  || !isInteger(limiteColunaGrafico) ) {
		innerHtmlMsgErros += formataErro( 'N&uacute;mero m�ximo de colunas para exibi��o nos gr�ficos de indicadores inv�lido');
		ok = false;
	}

	var limiteFalhasLogin = document.forms[0].limiteFalhasLogin.value;	
	if ( limiteFalhasLogin == null || limiteFalhasLogin == ""  || !isInteger(limiteFalhasLogin) ) {
		innerHtmlMsgErros += formataErro( 'N&uacute;mero m�ximo de falhas no login inv�lido');
		ok = false;
	}
	
	var tempoBloqueioLogin = document.forms[0].tempoBloqueioLogin.value;	
	if ( tempoBloqueioLogin == null || tempoBloqueioLogin == ""  || !isInteger(tempoBloqueioLogin) ) {
		innerHtmlMsgErros += formataErro( 'Tempo de bloqueio do login inv�lido');
		ok = false;
	}
	
	if(ok == false) {
		var texto = innerHtmlMsgErros;
		abreAlerta(texto);		
	} else {
		document.forms[0].submit();
	}

	setaFocoOnLoad();
}

// Seta o foco ao carregar a tela
function setaFocoOnLoad(){
   setFocusById('MsgInicial');
} 

// Reabre a tela. Fun��o a ser chamada ap�s a efetiva��o
// da altera��o ou exclus�o
function reabrir() {
	window.location = 'ExibirParametrosGerais.do';	
}

</script>

<head>
<title>Manter Par�metros Gerais</title>
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

<body onload="setaFocoOnLoad();" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">


<html:form  action="AtualizarParametrosGerais" method="POST"> 

<div id="content">
<h1 tabindex="1" id="MsgInicial" title="par�metros gerais" tabindex="1">Manter Par�metros Gerais</h1>

<p style="text-align: left" id="cpo" tabindex="1"><font class="asterisco">*</font><font class="obrigatorio">campo com preenchimento obrigat�rio</font></p>

<table cellpadding="2" cellspacing="1" border="0" align="center" width="100%">
  <tr> 
    <td height="23"><STRONG> <div tabindex="20">Descri��o</div></STRONG></td>
    <td height="23"><STRONG> <div tabindex="21">Valor</div></STRONG></td>
  </tr>

  <tr> 
    <td class="tdHeader3" id="maenome" width="70%">
	  <div tabindex="22">
      <bean:message key="prompt.host.email" />&nbsp;<font class="asterisco">*</font>
      </div>
    </td>
    <td class="tdHeader3" id="maenome" align="left"> 
      <input type="TEXT" name="txtHostEmail" MAXLENGTH=100 tabindex="23" value="<bean:write name="Parametros" property="servidorSMTP"/>" >
    </td>	
  </tr>
  <tr> 
    <td class="tdHeader4" id="maenome">
	  <div tabindex="24">
      <bean:message key="prompt.tempo.limite" />&nbsp;<font class="asterisco">*</font>
      </div>
    </td>
    <td class="tdHeader4" id="maenome" align="left"> 
      <input type="TEXT" name="txtTempoLimite" MAXLENGTH=4 tabindex="25" value="<bean:write name="Parametros" property="tempoAcessoBaseFuncionarios" />" >
    </td>	
  </tr>
  <tr> 
    <td class="tdHeader3" id="maenome">
	  <div tabindex="26">
	  Extens�o de arquivos permitidos na hora de anexar documento a mensagem (lista de extens�es de arquivo separadas por ";" )&nbsp;<font class="asterisco">*</font> 
      </div>
    </td>
    <td class="tdHeader3" id="maenome" align="left">
      <input type="TEXT" name="txtExtensaoNaoPermitida" SIZE=45 MAXLENGTH=254 tabindex="27" value="<bean:write name="Parametros" property="extensoesArquivoAnexoNaoPermitidos" />" >
    </td>	
  </tr>
  <tr> 
    <td class="tdHeader4" id="maenome">
	  <div tabindex="28">
	  Extens�o de arquivos permitidos na hora de anexar a imagem digitalizada (lista de extens�es de arquivo separadas por ";" )&nbsp;<font class="asterisco">*</font>
      </div>
    </td>
    <td class="tdHeader4" id="maenome" align="left"> 
      <input type="TEXT" name="txtExtensaoPermitida" MAXLENGTH=254 tabindex="29" value="<bean:write name="Parametros" property="extensoesMensagemDigitalizadaPermitidas" />" >
    </td>	
  </tr>
  <tr> 
    <td class="tdHeader3" id="maenome">
	  <div tabindex="30">Diret�rio raiz da aplica��o&nbsp;<font class="asterisco">*</font></div>
    </td>
    <td class="tdHeader3" id="maenome" align="left"> 
      <input type="TEXT" name="txtDirContexto" SIZE=45 MAXLENGTH=254 tabindex="31" value="<bean:write name="Parametros" property="diretorioContextoAplicacao" />" >
    </td>	
  </tr>
  <tr> 
    <td class="tdHeader4" id="maenome">
	  <div tabindex="32">
      <bean:message key="prompt.numero.limite.colunas" />&nbsp;<font class="asterisco">*</font>
      </div>
    </td>
    <td class="tdHeader4" id="maenome" align="left"> 
      <input type="TEXT" name="txtlimiteColunaIndicadores" MAXLENGTH=2 tabindex="32" value="<bean:write name="Parametros" property="limiteColunaIndicadores" />" >
    </td>	
  </tr>
  <tr> 
    <td class="tdHeader4" id="maenome">
	  <div tabindex="33">
      <bean:message key="prompt.qtd.tentativas.bloqueio" />&nbsp;<font class="asterisco">*</font>
      </div>
    </td>
    <td class="tdHeader4" id="maenome" align="left"> 
      <input type="TEXT" name="limiteFalhasLogin" MAXLENGTH=2 tabindex="33" value="<bean:write name="Parametros" property="limiteFalhasLogin" />" >
    </td>	
  </tr>  
  <tr> 
    <td class="tdHeader4" id="maenome">
	  <div tabindex="34">
      <bean:message key="prompt.tempo.bloqueio.login" />&nbsp;<font class="asterisco">*</font>
      </div>
    </td>
    <td class="tdHeader4" id="maenome" align="left"> 
      <input type="TEXT" name="tempoBloqueioLogin" MAXLENGTH=4 tabindex="34" value="<bean:write name="Parametros" property="tempoBloqueioLogin" />" >
    </td>	
  </tr>  
  <tr> 
    <td class="tdHeader3" id="maenome" colspan="2">
      <div align="center"> 
        <input type="button" name="botao" value="Alterar" class="button" onClick="validaParametros()" tabindex="35">
      </div>
    </td>
  </tr>
</table>
<br>
<hr>
<p class="voltar"> 
	<a tabindex="35" title="voltar para p�gina anterior" href="javascript:history.go(-1)" >voltar</a>	
</p>

</div>

<INPUT TYPE="hidden" Name="idParametro" VALUE="<bean:write name="Parametros" property="id" />" >
<INPUT TYPE="hidden" Name="action"      VALUE="alterarParametros" >

</html:form>

</body>
</html>
