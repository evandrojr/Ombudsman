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
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<%@ taglib uri="/tags/struts-logic" prefix="logic" %>
<%@ taglib uri="/tags/struts-bean" prefix="bean"%>
<%@ taglib uri="/tags/struts-html" prefix="html"%>

<html:html lang="pt">

<!--Falta definir como o par�metro ser� passado-->

<head>
	<title>Recuperar C�digo de Acesso</title>
	<html:base/>
	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
	<link rel="stylesheet"  media="all" href="../<bean:write name="_LAYOUT_" property="esquemaCores"/>/estilo_conteudo.css" type="text/css">
	<!-- Estilo para impressao -->
	<link rel="stylesheet" type="text/css" media="print" href="estilo_print.css">

	<!-- Bibliotecas javascript  -->
	<script language="JavaScript" src="../js/util.js"></script>

	<script language="javascript">

	function onLoad(){
		document.getElementById("titulo").focus();
	}
	
	function validaForm( textoCampoObrigatorio )
	{
		var campoObrigatorio;
		var respostaUsuario;
		var innerHtmlMsgErros = '';
		
        innerHtmlMsgErros += CriticaString( document.forms[0].elements["respostaUsuario"], 1, 100, 'Resposta' );

		if( innerHtmlMsgErros != '' )
		{
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
	
	<h1 id="titulo" tabindex="1">RECUPERAR DO C�DIGO DE ACESSO</h1>
	<p tabindex="4">Responda a pergunta cadastrada.<br><br>
		<font class="asterisco">*</font>
		<font class="obrigatorio">campo com preenchimento obrigat�rio</font>
	</p>
	<table style="WIDTH: 318px" cellSpacing="1" cellPadding="2" width="318" align="center" border="0">
		<html:form action="/RecuperaCodigoAcessoTela" method="post">
		<input type="hidden" name="numeroProtocolo" value="<%= request.getAttribute("numeroProtocolo")%>">
		<input type="hidden" name="action" value="<%= request.getAttribute("action")%>">
		
		<TR>
			<TD class="tdHeader3" id="titPergunta" title="Pergunta" width="100">
				<label tabindex="5">Pergunta:</label>
			</TD>
			<TD class="tdHeader4" id="pergunta" headers="tit titnum" colSpan="4">&nbsp;&nbsp;
				<label tabindex="6"><%= request.getAttribute("perguntaUsuario") %></label>
			</TD>
		</TR>

		<TR>
			<TD class="tdHeader3" id="titResposta" title="Resposta" width="100">
				<label tabindex="7" for="respostaUsuario">Resposta: <font class="asterisco">*</font></label>
			</TD>
			<TD class="tdHeader4" headers="tit titsec" colSpan="4">&nbsp; 
				<INPUT tabindex="7" class="text" id="respostaUsuario" maxlength="100" name="respostaUsuario">
		      	<!--  html:text styleId="respostaUsuario" tabindex="7" size="50" maxlength="100" name="respostaUsuario" property="respostaUsuario"/ -->
			</TD>
		</TR>

		<TR>
			<td class="tdHeader1" colspan="5"> 
				<input type="submit" tabindex="8" name="submit" value="Confirmar" class="button" 
					onclick="return validaForm('<%= request.getAttribute("campoValidacao")%>')" 
					onkeypress="return validaForm('<%= request.getAttribute("campoValidacao")%>')"
					alt="Clique para efetuar a consulta">
				<input type="reset" tabindex="9" name="reset" value="Limpar" class="button" alt="Clique para limpar os campos"> 
			</td>
		</TR>
		</html:form>
	</TABLE>
	<p></p>
	<hr>
  <p class="voltar"> 
	<a tabindex="10" title="Voltar para p�gina anterior" href="javascript:history.go(-1)">voltar</a>
  </p>
</div>
</body>
</html:html>
