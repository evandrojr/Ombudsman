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
   -- Aplicação:    AlteraSenha
   -- 
   -- Descrição:    Alterar Senha do Funcionario
   -- 
   -- Versão:       1.0
   -- Data:         03/12/2004
  */
--%>

<%@ taglib uri="/tags/struts-bean" prefix="bean" %>
<%@ taglib uri="/tags/struts-html" prefix="html" %>
<%@ taglib uri="/tags/struts-logic" prefix="logic" %>

<html lang="pt-br">

<head>
<html:base />
<title>Login</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link rel="stylesheet" media="all" href="<bean:write name="_LAYOUT_" property="esquemaCores"/>/estilo_conteudo.css" type="text/css">
</head>

<body>

<script src="js/util.js" type="text/javascript"></script>

<div id="content"><a name="topo"></a>

<h1 id="titulo" title="Alterar Senha" tabIndex="1">Alterar Senha</h1>

<logic:messagesPresent>
<script type="text/javascript" charset='iso-8859-1'>
  <!-- //
	function _abreAlerta(texto) {
		var baseHref = location.protocol + "//" + location.host + location.pathname;
		novaJanela( baseHref + "../../pages/Alerta.jsp?error=" + texto, "Erro", 450, 230, 0, 0, 300, 200 ); 
	}
	var innerHtmlMsgErros = '';
	<html:messages id="message" message="false">
		innerHtmlMsgErros += formataErro('<%= message %>');
	</html:messages>
	_abreAlerta(innerHtmlMsgErros);
  // -->
</script>

<script type="text/javascript" language="JavaScript">
  <!-- //
	function validaFormulario() {
		var innerHtmlMsgErros    = '';
		var ok                   = true;

		var cpf                  = document.forms[0].login.value;
		var senhaAntiga          = document.forms[0].senhaAntiga.value;
		var senhaNova            = document.forms[0].senhaNova.value;
		var senhaNovaConfirmacao = document.forms[0].senhaNovaConfirmacao.value;
		
		if ( cpf == null || cpf == "" || !validaCPF(cpf) ) {
			innerHtmlMsgErros += formataErro('CPF inválido, use 11 dígitos sem separadores.');
		}

        innerHtmlMsgErros += CriticaString( document.forms[0].senhaAntiga, 1, 8, 'Senha' );
        innerHtmlMsgErros += CriticaString( document.forms[0].senhaNova, 6, 8, 'Nova Senha' );
        innerHtmlMsgErros += CriticaString( document.forms[0].senhaNovaConfirmacao, 6, 8, 'Confirmação da Nova Senha' );
		
		if ( senhaNova != senhaNovaConfirmacao ) {
	        innerHtmlMsgErros += formataErro('A confirmação da nova senha não confere');
		}
		
		if( innerHtmlMsgErros != "")
		{
			_abreAlerta(innerHtmlMsgErros);
		}	else {
			return true;
		}
		return false;
	}
  // -->
</script>

</logic:messagesPresent>

<logic:messagesNotPresent>
<script type="text/javascript" language="JavaScript">
  <!-- //
	var focusControl = document.getElementById("titulo");
	focusControl.focus();
  // -->
</script>
</logic:messagesNotPresent>

<p tabindex="4" title="Área de acesso restrito aos funcionários da ouvidoria">Área de acesso restrito aos funcionários da ouvidoria.</p>

<h2></h2>

<html:form action="/AlterarSenhaSubmit.do" method="post" onsubmit="return validaFormulario();">

	<table cellpadding="2" cellspacing="1" border="0" width="318" align="center" style="width: 318px; height: 90px">
	     <tr> 
 	     	<td class="tdHeader3"><label for="login">CPF:</label></td>
		    <td class="tdHeader4" colspan=4 valign ="top">&nbsp;<html:text styleId="login" tabindex="5" 				styleClass="text" property="login" maxlength="11" /></td>
	     </tr>
	     <tr> 
           	<td class="tdHeader3"><label for="senhaAntiga">Senha atual:</label></td>
	    	<td class="tdHeader4" colspan=4>&nbsp;<html:password styleId="senhaAntiga" tabindex="6" styleClass="text" 				maxlength="8" redisplay="false" property="senhaAntiga" /></td>
	     </tr>
	     <tr> 
           	<td class="tdHeader3"><label for="senhaNova">Nova senha:</label></td>
	    	<td class="tdHeader4" colspan=4>&nbsp;<html:password styleId="senhaNova" tabindex="7" styleClass="text" 				maxlength="8" redisplay="false" property="senhaNova"/></td>
	     </tr>
	     <tr> 
           	<td class="tdHeader3"><label for="senhaNovaConfirmacao">Confirma nova senha:</label></td>
	    	<td class="tdHeader4" colspan=4>&nbsp;<html:password styleId="senhaNovaConfirmacao" tabindex="8" styleClass="text" 				maxlength="8" redisplay="false" property="senhaNovaConfirmacao" /></td>
	     </tr>
	     <tr> 
			<td class="tdHeader1" colspan="5"> 
	        <html:submit value="Confirmar" tabindex="9"  styleClass="button"/>
      	    <html:reset  value="Limpar"    tabindex="10" styleClass="button"/> 
	        </td>
	     </tr>
	</table>
</html:form>
<p></p>
<hr>
<p class="voltar"> 
<a tabindex="13" title="Voltar para página anterior" href="javascript:history.go(-1)">voltar</a>
</p>
</div>
</body>

</html>
