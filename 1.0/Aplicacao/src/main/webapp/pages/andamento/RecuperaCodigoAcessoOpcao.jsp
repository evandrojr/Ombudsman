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
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<%@ taglib uri="/tags/struts-logic" prefix="logic" %>
<%@ taglib uri="/tags/struts-bean" prefix="bean"%>
<%@ taglib uri="/tags/struts-html" prefix="html"%>

<html:html lang="pt">
<head>
	<title>Recuperar Código de Acesso</title>
	<html:base/>
	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
	<link rel="stylesheet"  media="all" href="../<bean:write name="_LAYOUT_" property="esquemaCores"/>/estilo_conteudo.css" type="text/css">

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
	<h1 id="titulo" tabindex="2">RECUPERAÇÃO DO CÓDIGO DE ACESSO</h1>

	<logic:equal name="opcao" value="0">
		<p><label tabindex="3">Não &eacute; possível recuperar o código de acesso, pois não houve cadastramento de Pergunta e Reposta nem de email no Acionamento</label></p>		
	</logic:equal>
		
	<logic:equal name="opcao" value="1">
		<p tabindex="4">Responda a pergunta cadastrada.<br><br>
			<font class="asterisco">*</font>
			<font class="obrigatorio">campo com preenchimento obrigatório</font>
		</p>

		<table width="318" cellspacing="1" cellpadding="3" align="center">
		<html:form action="/RecuperaCodigoAcessoTela" method="post">
		<input type='hidden' name='numeroProtocolo' value='<%= request.getAttribute("numeroProtocolo")%>'/>
		<input type='hidden' name='action' value='recuperar'/>

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
				<input tabindex="7" class="text" maxlength="100" id="respostaUsuario" name="respostaUsuario">
			</TD>
		</TR>
		<TR>
			<td class="tdHeader1" colspan="5"> 
				<input type="submit" tabindex="8" name="submit" value="Confirmar" class="button" 
					onclick="return validaForm('<%= request.getAttribute("campoValidacao")%>')" 
					alt="Clique para efetuar a consulta">
				<input type="reset" tabindex="9" name="reset" value="Limpar" class="button" alt="Clique para limpar os campos"> 
			</td>
		</TR>
		</html:form>
		</table>
	</logic:equal>
	<logic:equal name="opcao" value="2" >
		<table width="400" cellspacing="1" cellpadding="3" align="center">
		<html:form action="/RecuperaCodigoAcessoSubmit" method="post">
		<input type='hidden' name='numeroProtocolo' value='<%= request.getAttribute("numeroProtocolo")%>'/>
		<input type='hidden' name='action' value='recuperar'/>
		<input type='hidden' name='formaRecuperacao' value='1'/>
		<tr>
			<td class="tdHeader4">
				<label tabindex="3">Desejo que meu código de acesso seja enviado para o e-mail cadastrado</label>
			</td>
		</tr>
			<td class="tdHeader1" align="center">
				<input type="submit" tabindex="4" value="Sim" class="button" alt="Clique para efetuar enviar o e-mail"/>
			</td>
		</tr>
		</html:form>
		</table>
	</logic:equal>
	<logic:equal name="opcao" value="3" >
		<ul>
			<a href='../../andamento/RecuperaCodigoAcessoSubmit.do?action=recuperar&numeroProtocolo=<%= request.getAttribute("numeroProtocolo")%>&formaRecuperacao=1' tabindex='3'><li>Desejo que meu código de acesso seja enviado para o e-mail cadastrado</li></a>	
			<a href='../../andamento/RecuperaCodigoAcessoSubmit.do?action=recuperar&numeroProtocolo=<%= request.getAttribute("numeroProtocolo")%>&formaRecuperacao=2' tabindex='4'><li>Desejo responder a pergunta que cadastrei</li></a>
		</ul>
	</logic:equal>
	<p></p>
    <hr>
	<p class="voltar"> 
		<a tabindex="10" title="Voltar para página anterior" href="javascript:history.go(-1)">voltar</a>
	</p>
</div>
</body>
</html:html>
