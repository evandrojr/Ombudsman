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
   -- Descri��o:    A atendente solicita o envio da resposta de um acionamento por email.
   -- 
   -- Vers�o:       1.0
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
	<meta name="Keywords" content="acessibilidade, guia, serpro, inclus�o, defici�ncia, recomenda��es, necessidade especial, ouvidoria" />
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
		Fun��o que faz valida��o de email
		S� exige que haja algum caracter antes do arroba,
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
			innerHtmlMsgErros += formataErro('Email &eacute; um campo obrigat�rio');
			ok = false;
		}
		else{
			if (!validaEmail(email)){
				innerHtmlMsgErros += formataErro('Email cont&eacute;m um valor inv�lido');
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
	<a tabindex="10" title="Voltar para p�gina anterior" href="javascript:history.go(-1)">voltar</a>
  </p>
</div>
</body>
</html:html>
