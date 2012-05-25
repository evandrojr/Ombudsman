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

<%--
  /*
   -- Sistema:      Ouvidoria
   -- Módulo:       Geral
   -- Aplicação:    Login
   -- 
   -- Descrição:    Login da Aplicação
   -- 
   -- Versão:       1.0
   -- Data:         03/12/2004
  */
--%>

<%@ taglib uri="/tags/struts-bean" prefix="bean" %>
<%@ taglib uri="/tags/struts-html" prefix="html" %>
<%@ taglib uri="/tags/struts-logic" prefix="logic" %>

<html 
      lang="pt-br">

<head>
<html:base />
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>Acesso Restrito</title>
<link rel="stylesheet" media="all" href="<bean:write name="_LAYOUT_" property="esquemaCores"/>/estilo_conteudo.css" type="text/css">
</head>

	<script src="js/util.js" type="text/javascript"></script>
	
	<script type="text/javascript" language="JavaScript">
	<!-- //
		function _abreAlerta(texto) {
			var baseHref = location.protocol + "//" + location.host + location.pathname;
			novaJanela( baseHref + "../../pages/Alerta.jsp?error=" + texto, "Erro", 450, 180, 0, 0, 300, 200 ); 
		}
	
		function validaFormulario() {
			var innerHtmlMsgErros = '';
			var cpf = document.forms[0].login.value;
			var senha = document.forms[0].senha.value;
	
			if ( cpf == null || !validaCPF(cpf) ) {
				innerHtmlMsgErros += formataErro('CPF inválido, use 11 dígitos sem separadores.');		
			}
	 
	        innerHtmlMsgErros += CriticaString( document.forms[0].elements["senha"], 1, 8, 'Senha' );
	
			if( innerHtmlMsgErros == '')
			{
				return true;
			}	else {
				_abreAlerta(innerHtmlMsgErros);
			}
			return false;
		}

		try { 
			if ( window.name != "conteudo" && top.parent.frames["conteudo"] ) {
				top.parent.frames["conteudo"].location = window.location;
			} 
			document.getElementById("titulo").focus(); 
		} catch(e) {}

	  // -->
	</script>

	<logic:messagesPresent>
	<script type="text/javascript" charset='iso-8859-1'>
	  <!-- //
		var innerHtmlMsgErros = '';
		<html:messages id="message" message="false">
			innerHtmlMsgErros += formataErro('<%= message %>');
		</html:messages>
//		alert(">>>"+innerHtmlMsgErros);
		_abreAlerta(innerHtmlMsgErros);
	  // -->
	</script>
	</logic:messagesPresent>

<body>

	<div id="content">

	<h1 id="titulo" title="login" tabIndex="1">Acesso Restrito</h1>
	<p tabindex="4" title="Área de acesso restrito aos funcionários da ouvidoria">Área de acesso restrito aos funcionários da ouvidoria.</p>

	<% 
		if( request.getAttribute("sessaoExpirada") != null && ( (Boolean) request.getAttribute("sessaoExpirada") ).equals(Boolean.TRUE) ) {
	%>
		<p tabindex="4" title="Sessão expirada">A sua sessão foi encerrada por inatividade. Por favor, efetue o Login novamente.</p>
	<% } %>
	
	<h2></h2>

	<html:form action="Login.do?action=submit" method="post" onsubmit="return validaFormulario();">
	    <table cellpadding="2" cellspacing="1" border="0" width="318" align="center" style="WIDTH: 318px; HEIGHT: 90px">
		    <tr> 
	 	    	<td class="tdHeader3"><label for="login">CPF:</label></td>
			    <td class="tdHeader4" colspan=4 valign ="top">&nbsp;<html:text styleId="login" tabindex="5" styleClass="text" property="login" maxlength="11"/></td>
		    </tr>
		    <tr> 
	           	<td class="tdHeader3"><label for="senha">Senha:</label></td>
		    	<td class="tdHeader4" colspan=4>&nbsp;<html:password styleId="senha" tabindex="6" styleClass="text" property="senha" redisplay="false" maxlength="8"/></td>
		    </tr>
		    <tr> 
	           	<td class="tdHeader3" colspan="5" align="center">
					<html:link 
						action="AlterarSenha" 
						target="_self"                  
						tabindex="7">
			            Alterar senha
			    	</html:link>           	
		           	<html:textarea styleId="textoCertificado" property="textoCertificado" style="display:none" value=""/>
			 	</td>
		    </tr>
		    <tr> 
				<td class="tdHeader1" colspan="5"> 
		        <html:submit value="Confirmar" tabindex="8" styleClass="button"/>
	      	    <html:reset  value="Limpar" tabindex="9" styleClass="button"/> 
		        </td>
		    </tr>
	    </table>
	</html:form>
         
<p></p>
<hr>
</div>
</body>

</html>

