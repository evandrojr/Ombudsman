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

<!-- TagLibs Struts -->
<%@ taglib uri="/tags/struts-logic" prefix="logic" %>
<%@ taglib uri="/tags/struts-bean"  prefix="bean"%>
<%@ taglib uri="/tags/struts-html"  prefix="html"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html:html lang="pt">

<head>
	<html:base/>	
	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
	<meta name="Keywords" content="acessibilidade, guia, serpro, inclusão, deficiência, recomendações, necessidade especial, ouvidoria" />
	<link rel="stylesheet"  media="all" href="../<bean:write name="_LAYOUT_" property="esquemaCores"/>/estilo_conteudo.css" type="text/css">
	<link rel="stylesheet" type="text/css" media="print" href="../estilo_print.css">

	<title>Recuperar Código de Acesso</title>

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
	<h1 id="titulo" tabindex="1">RECUPERAÇÃO DO CÓDIGO DE ACESSO</h1>
	<p tabindex="4">Preencha o seu Protocolo para recuperar seu Código de Acesso e poder acessar a resposta da sua mensagem.<br><br>
	<font class="asterisco">*</font>
	<font class="obrigatorio">campo com preenchimento obrigatório</font>
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
	<a tabindex="9" title="Voltar para página anterior" href="javascript:history.go(-1)">voltar</a>
  </p>
</html:form>
</div>
</body>
</html:html>
