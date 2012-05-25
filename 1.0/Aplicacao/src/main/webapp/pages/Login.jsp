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

<%--
  /*
   -- Sistema:      Ouvidoria
   -- M�dulo:       Geral
   -- Aplica��o:    Login
   -- 
   -- Descri��o:    Login da Aplica��o
   -- 
   -- Vers�o:       1.0
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
				innerHtmlMsgErros += formataErro('CPF inv�lido, use 11 d�gitos sem separadores.');		
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
	<p tabindex="4" title="�rea de acesso restrito aos funcion�rios da ouvidoria">�rea de acesso restrito aos funcion�rios da ouvidoria.</p>

	<% 
		if( request.getAttribute("sessaoExpirada") != null && ( (Boolean) request.getAttribute("sessaoExpirada") ).equals(Boolean.TRUE) ) {
	%>
		<p tabindex="4" title="Sess�o expirada">A sua sess�o foi encerrada por inatividade. Por favor, efetue o Login novamente.</p>
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

