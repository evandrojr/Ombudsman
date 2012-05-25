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
   -- M�dulo:       Andamento
   -- 
   -- Descri��o:    O acionador consulta a resposta de um acionamento informando o n&uacute;mero do protocolo e o 
   -- 		  c�digo de acesso caso o org�o esteja configurado para us�-lo.
   -- 
   -- Vers�o:       1.0
   -- Data:         26/11/2004   
  */
%>

<%@ taglib uri="/tags/struts-logic" prefix="logic" %>
<%@ taglib uri="/tags/struts-bean" prefix="bean"%>
<%@ taglib uri="/tags/struts-html" prefix="html"%>

<html:html lang="pt">

<head>
	<html:base />
	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
	<meta name="Keywords" content="acessibilidade, guia, serpro, inclus�o, defici�ncia, recomenda��es, necessidade especial, ouvidoria" />
	<link rel="stylesheet"  media="all" href="../<bean:write name="_LAYOUT_" property="esquemaCores"/>/estilo_conteudo.css" type="text/css">
	<link rel="stylesheet" type="text/css" media="print" href="../estilo_print.css">
	
	<title>Consulte sua Resposta</title>

	<!-- Bibliotecas javascript  -->
	<script language="JavaScript" src="../js/util.js"></script>

	<script language="JavaScript">

	function onLoad(){
		document.getElementById("titulo").focus();
	}

	function validaForm(possuiCodigoAcesso){
		var numeroProtocolo;
		var codigoAcesso;
		var ok;
		var innerHtmlMsgErros = '';
		
		ok = true;
		numeroProtocolo	= document.forms[0].numeroProtocolo.value;
		
		if(numeroProtocolo==""){
			innerHtmlMsgErros += formataErro('Protocolo deve ser preenchido');
			ok = false;
		}
		
		if(!isInteger(numeroProtocolo)){
			innerHtmlMsgErros += formataErro('O protocolo deve conter somente numeros');
			ok = false;
		}
		
		if(possuiCodigoAcesso=="true"){
			codigoAcesso	= document.forms[0].codigoAcesso.value;
			if(codigoAcesso==""){
				innerHtmlMsgErros += formataErro('C�digo de Acesso deve ser preenchido');
				ok = false;
			}
		}

		if(!ok){
			var texto = innerHtmlMsgErros;
			abreAlerta(texto);
			return false;
		}

		return true;	

	}
	
	function RecuperarCodigo(){
		numeroProtocolo	= document.forms[0].numeroProtocolo.value;
		document.getElementById("recuperarCodigo").href ="../../andamento/RecuperaCodigoAcesso.do?action=consultar&numeroProtocolo=" + numeroProtocolo;
	}

	</script>
</head>

<body onLoad="onLoad();">

<div id="content"> 
  <h1 id="titulo" tabindex="1">CONSULTE SUA RESPOSTA</h1>

  <p tabindex="4">Preencha os campos abaixo.</p>
  <html:form action="/ExibirResposta" method="get">
	<h2>   </h2>
	<table cellpadding="2" cellspacing="1" border="0" width="318" align="center" style="WIDTH: 318px">
		<tr> 
			<td class="tdHeader3" id="nomeProtocolo" title="Protocolo">
				<label for="protocolo">Protocolo: <font class="asterisco">*</font></label>
			</td>
			<td class="tdHeader4" colspan="4">
				<input type="text" tabindex="5" name="numeroProtocolo" class="text" id="protocolo" onchange="RecuperarCodigo()" maxlength="7">
			</td>
		</tr>
		
		<logic:equal name="possuiCodigoAcesso" scope="request" value="true">
			<tr> 
				<td class="tdHeader3" id="nomeCodigoAcesso" title="Codigo de Acesso">
					<label for="codigoAcesso">C�digo de Acesso: <font class="asterisco">*</font></label>
				</td>
				<td class="tdHeader4" colspan="4">
					<input type="Password" tabindex="6" name="codigoAcesso" class="text" id="codigoAcesso">
				</td>
			</tr>
			<tr> 
				<td class="tdHeader4" colspan="5" align="middle" headers ="end endem">
					<a id="recuperarCodigo" tabindex="7" href="../../andamento/RecuperaCodigoAcesso.do?action=consultar">Esqueceu seu c�digo de acesso?</a>
				</td>
			</tr>
		</logic:equal>

		<tr> 
			<td class="tdHeader1" colspan="5"> 
				<input type="submit" tabindex="8" name="submit" value="Confirmar" class="button" 
					onclick="return validaForm('<%= request.getAttribute("possuiCodigoAcesso")%>')" 
					onkeypress="return validaForm('<%= request.getAttribute("possuiCodigoAcesso")%>')"
					alt="Clique para efetuar a consulta">
				<input type="reset" tabindex="9" name="reset" value="Limpar" class="button" alt="Clique para limpar os campos"> 
			</td>
	    </tr>
	</table>
  </html:form>
  <p></p>
  <hr>
  <p class="voltar"> 
	<a tabindex="10" title="Voltar para p�gina anterior" href="javascript:history.go(-1)">voltar</a>
  </p>
</div>
</body>
</html:html>
