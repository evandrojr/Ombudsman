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

<!-- TagLibs Struts -->
<%@ taglib uri="/tags/struts-logic" prefix="logic" %>
<%@ taglib uri="/tags/struts-bean"  prefix="bean"%>
<%@ taglib uri="/tags/struts-html"  prefix="html"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html:html lang="pt">

<head>
	<html:base/>	
	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
	<meta name="Keywords" content="acessibilidade, guia, serpro, inclus�o, defici�ncia, recomenda��es, necessidade especial, ouvidoria" />
	<link rel="stylesheet"  media="all" href="../<bean:write name="_LAYOUT_" property="esquemaCores"/>/estilo_conteudo.css" type="text/css">
	<link rel="stylesheet" type="text/css" media="print" href="../estilo_print.css">

	<title>Recuperar C�digo de Acesso</title>

	<!-- Bibliotecas javascript  -->
	<script language="JavaScript" src="../js/util.js"></script>

	<script language="JavaScript">

	function onLoad(){
		document.getElementById("titulo").focus();
	}
	
	function validaForm(){
		var numeroProtocolo;
		var formaRecuperacao;
		var innerHtmlMsgErros = '';
		
      	innerHtmlMsgErros += CriticaNumero( document.forms[0].elements["numeroProtocolo"], 6, 9, 0, 'Protocolo' );

		if(innerHtmlMsgErros!=''){
			var texto = innerHtmlMsgErros;
			abreAlerta(texto);
			return false;
		}

		return true;	

	}

	</script>
</head>

<body onLoad="onLoad();">

<div id="content">
	<html:form action="/RecuperaCodigoAcessoSubmit" method="post">
	<input type="hidden" name="action" value="consultar">
	<h1 id="titulo" tabindex="1">RECUPERA��O DO C�DIGO DE ACESSO</h1>
	<p tabindex="4">Preencha o seu Protocolo para recuperar seu C�digo de Acesso e poder acessar a resposta da sua mensagem.<br><br>
	<font class="asterisco">*</font>
	<font class="obrigatorio">campo com preenchimento obrigat�rio</font>
	</p>
	<p></p>
		<table cellSpacing="1" cellPadding="2" width="318" align="center" border="0" style="WIDTH: 470px">
			<tr> 
				<td class="tdHeader3" id="nomeProtocolo" title="Protocolo" width="100">
					<label for="numeroProtocolo">Protocolo: <font class="asterisco">*</font></label>
				</td>
				<td class="tdHeader4" colspan="4">
					<input type="text" tabindex="5" name="numeroProtocolo" class="text" id="numeroProtocolo" maxlength="9"
						<% if (request.getParameter("numeroProtocolo") != null){ %>
						value="<%= request.getParameter("numeroProtocolo")%>"
						<%}%>
						>
				</td>
			</tr>
			<tr> 
				<td class="tdHeader1" colspan="5"> 
					<input type="submit" tabindex="7" name="submit" value="Confirmar" class="button" 
						onclick="return validaForm()" 
						alt="Clique para efetuar a consulta">
					<input type="reset" tabindex="8" name="reset" value="Limpar" class="button" alt="Clique para limpar os campos"> 
				</td>
		    </tr>
		</table>
  <p></p>
  <hr>
  <p class="voltar"> 
	<a tabindex="9" title="Voltar para p�gina anterior" href="javascript:history.go(-1)">voltar</a>
  </p>
</html:form>
</div>
</body>
</html:html>
