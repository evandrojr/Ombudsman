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
<%--
/*
   -- Módulo:       Gerencial
   -- 
   -- Descrição:    O administrador mant&eacute;m os dados dos parâmetros gerais
   -- 
   -- Versão:       1.0
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
		innerHtmlMsgErros += formataErro( 'Endereço do servidor de email deve ser preenchido');
		ok = false;
	}
	
	var tempo = document.forms[0].txtTempoLimite.value;
	if ( tempo == null || tempo == ""  || !isInteger(tempo) ) {
		innerHtmlMsgErros += formataErro( 'Tempo limite de resposta inválido');
		ok = false;
	}

	var extensao1 = document.forms[0].txtExtensaoNaoPermitida.value;
	if ( extensao1 == null || extensao1 == "" ) {
		innerHtmlMsgErros += formataErro( 'Extensões de arquivos permitidos devem ser preenchidas');
		ok = false;
	}

	var extensao2 = document.forms[0].txtExtensaoPermitida.value;
	if ( extensao2 == null || extensao2 == "" ) {
		innerHtmlMsgErros += formataErro( 'Extensões de arquivos permitidos devem ser preenchidas');
		ok = false;
	}
	
	var dirContexto = document.forms[0].txtDirContexto.value;
	if ( dirContexto == null || dirContexto == "" ) {
		innerHtmlMsgErros += formataErro( 'Diretório raiz da aplicação deve ser preenchido');
		ok = false;
	}
	
	var limiteColunaGrafico = document.forms[0].txtlimiteColunaIndicadores.value;	
	if ( limiteColunaGrafico == null || limiteColunaGrafico == ""  || !isInteger(limiteColunaGrafico) ) {
		innerHtmlMsgErros += formataErro( 'N&uacute;mero máximo de colunas para exibição nos gráficos de indicadores inválido');
		ok = false;
	}

	var limiteFalhasLogin = document.forms[0].limiteFalhasLogin.value;	
	if ( limiteFalhasLogin == null || limiteFalhasLogin == ""  || !isInteger(limiteFalhasLogin) ) {
		innerHtmlMsgErros += formataErro( 'N&uacute;mero máximo de falhas no login inválido');
		ok = false;
	}
	
	var tempoBloqueioLogin = document.forms[0].tempoBloqueioLogin.value;	
	if ( tempoBloqueioLogin == null || tempoBloqueioLogin == ""  || !isInteger(tempoBloqueioLogin) ) {
		innerHtmlMsgErros += formataErro( 'Tempo de bloqueio do login inválido');
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

// Reabre a tela. Função a ser chamada após a efetivação
// da alteração ou exclusão
function reabrir() {
	window.location = 'ExibirParametrosGerais.do';	
}

</script>

<head>
<title>Manter Parâmetros Gerais</title>
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
<h1 tabindex="1" id="MsgInicial" title="parâmetros gerais" tabindex="1">Manter Parâmetros Gerais</h1>

<p style="text-align: left" id="cpo" tabindex="1"><font class="asterisco">*</font><font class="obrigatorio">campo com preenchimento obrigatório</font></p>

<table cellpadding="2" cellspacing="1" border="0" align="center" width="100%">
  <tr> 
    <td height="23"><STRONG> <div tabindex="20">Descrição</div></STRONG></td>
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
	  Extensão de arquivos permitidos na hora de anexar documento a mensagem (lista de extensões de arquivo separadas por ";" )&nbsp;<font class="asterisco">*</font> 
      </div>
    </td>
    <td class="tdHeader3" id="maenome" align="left">
      <input type="TEXT" name="txtExtensaoNaoPermitida" SIZE=45 MAXLENGTH=254 tabindex="27" value="<bean:write name="Parametros" property="extensoesArquivoAnexoNaoPermitidos" />" >
    </td>	
  </tr>
  <tr> 
    <td class="tdHeader4" id="maenome">
	  <div tabindex="28">
	  Extensão de arquivos permitidos na hora de anexar a imagem digitalizada (lista de extensões de arquivo separadas por ";" )&nbsp;<font class="asterisco">*</font>
      </div>
    </td>
    <td class="tdHeader4" id="maenome" align="left"> 
      <input type="TEXT" name="txtExtensaoPermitida" MAXLENGTH=254 tabindex="29" value="<bean:write name="Parametros" property="extensoesMensagemDigitalizadaPermitidas" />" >
    </td>	
  </tr>
  <tr> 
    <td class="tdHeader3" id="maenome">
	  <div tabindex="30">Diretório raiz da aplicação&nbsp;<font class="asterisco">*</font></div>
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
	<a tabindex="35" title="voltar para página anterior" href="javascript:history.go(-1)" >voltar</a>	
</p>

</div>

<INPUT TYPE="hidden" Name="idParametro" VALUE="<bean:write name="Parametros" property="id" />" >
<INPUT TYPE="hidden" Name="action"      VALUE="alterarParametros" >

</html:form>

</body>
</html>
