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
   -- Descrição:    A atendente solicita o envio da resposta de um acionamento por email.
   -- 
   -- Versão:       1.0
   -- Data:         20/12/2004   
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
	
	<title>Enviar Resposta por Email</title>

	<!-- Bibliotecas javascript  -->
	<script language="JavaScript" src="../js/util.js"></script>

	<script language="JavaScript">

	function onLoad(email){
		document.getElementById("titulo").focus();
		document.forms[0].email.value = email;
	}

	/* 
		Função que faz validação de email
		Só exige que haja algum caracter antes do arroba,
		algum caracter entre o arroba e um ponto e algum caracter depois
		do ponto
	*/
	function validaEmail(email){
		var arroba;
		var ponto;
		var stringAntesArroba;
		var stringDepoisArroba1;
		var stringDepoisArroba2;
		
		arroba = email.indexOf("@");
		if (arroba == -1) return false;
		
		stringAntesArroba = email.substring(0,arroba);
		if (stringAntesArroba.length <= 0) return false;	
		
		email = email.substring(arroba+1);
		ponto = email.indexOf('.');
		if (ponto == -1) return false;
		
		stringDepoisArroba1 = email.substring(0,ponto);
		if (stringDepoisArroba1.length <= 0) return false;	
		
		stringDepoisArroba2 = email.substring(ponto+1);
		if (stringDepoisArroba2.length <= 0) return false;	

		return true;
	}
	
	function validaForm(){
		var email;
		var ok;
		var innerHtmlMsgErros = '';
		
		ok = true;
		email	= document.forms[0].email.value;
		
		if(email==""){
			innerHtmlMsgErros += formataErro('Email &eacute; um campo obrigatório');
			ok = false;
		}
		else{
			if (!validaEmail(email)){
				innerHtmlMsgErros += formataErro('Email cont&eacute;m um valor inválido');
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

	</script>
</head>

<body onLoad="onLoad('<%= request.getAttribute("email")%>');">


<div id="content"> 
  <h1 id="titulo" tabindex="1">Confirme o email</h1>
	
  <p tabindex="4">Confirme ou altere o email para envio da resposta.</p>
  
  <html:form action="/EnviarEmail" method="post">

	<input type="hidden" name="idAcionamento" value="<%= request.getAttribute("idAcionamento")%>">
	
	<h2>   </h2>
	<table cellpadding="2" cellspacing="1" border="0" width="318" align="center" style="WIDTH: 318px">
		<tr> 
			<td class="tdHeader3" id="nomeProtocolo" title="Protocolo"><label tabindex="5">Protocolo:</label></td>
			<td class="tdHeader4" colspan=4>
				<label tabindex="6"><%= request.getAttribute("numeroProtocolo")%></label>
			</td>
	</tr>
		
		<tr> 
			<td class="tdHeader3" id="email" title="Email"><label for="email">Email:</label></td>
			<td class="tdHeader4" colspan="4">&nbsp;
				<input type="text" tabindex="7" name="email" class="text" id="email" style="WIDTH: 200px">
			</td>
		</tr>

		<tr> 
			<td class="tdHeader1" colspan="5"> 
				<input type="submit" tabindex="8" name="submit" value="Confirmar" class="button" 
					onclick="return validaForm()" 
					onkeypress="return validaForm()"
					alt="Clique para enviar o email">
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
