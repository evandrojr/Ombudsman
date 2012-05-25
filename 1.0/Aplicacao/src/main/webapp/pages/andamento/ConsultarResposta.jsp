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
   -- Módulo:       Andamento
   -- 
   -- Descrição:    O acionador consulta a resposta de um acionamento informando o n&uacute;mero do protocolo e o 
   -- 		  código de acesso caso o orgão esteja configurado para usá-lo.
   -- 
   -- Versão:       1.0
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
	<meta name="Keywords" content="acessibilidade, guia, serpro, inclusão, deficiência, recomendações, necessidade especial, ouvidoria" />
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
				innerHtmlMsgErros += formataErro('Código de Acesso deve ser preenchido');
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
					<label for="codigoAcesso">Código de Acesso: <font class="asterisco">*</font></label>
				</td>
				<td class="tdHeader4" colspan="4">
					<input type="Password" tabindex="6" name="codigoAcesso" class="text" id="codigoAcesso">
				</td>
			</tr>
			<tr> 
				<td class="tdHeader4" colspan="5" align="middle" headers ="end endem">
					<a id="recuperarCodigo" tabindex="7" href="../../andamento/RecuperaCodigoAcesso.do?action=consultar">Esqueceu seu código de acesso?</a>
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
	<a tabindex="10" title="Voltar para página anterior" href="javascript:history.go(-1)">voltar</a>
  </p>
</div>
</body>
</html:html>
