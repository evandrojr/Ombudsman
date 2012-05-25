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
<% 
  /*
   -- Sistema:      Ouvidoria
   -- M�dulo:       Geral
   -- Aplica��o:    Ouvidoria.jsp
   -- 
   -- Descri��o:    Sa�da padr�o para cadastros de acionamentos fora da vig�ncia
   -- 
   -- Vers�o:       1.0
   -- Data:         10/02/2005
   --
  */
%>

<%@ taglib uri="/tags/struts-html" prefix="html" %>
<%@ taglib uri="/tags/struts-bean" prefix="bean" %>

<html:html lang="pt">
<head>
<html:base/>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link rel="stylesheet"  media="all" href="<bean:write name="_LAYOUT_" property="esquemaCores"/>/estilo_conteudo.css" type="text/css">
<title>Aten��o</title>
	<script language="JavaScript">
	<!-- //
	function onLoad(){
		var focusControl = document.getElementById("titulo");
		focusControl.focus();
	}
	// -->
	</script>
</head>
<body onLoad="onLoad();">
<div id="content">
  <h1 id="titulo" tabindex="1" title="Aten��o">Aten��o</h1>
  <br>
	<p tabindex="2" title="Cadastro de Acionamento Encerrado">
	Prezado cidad�o,<br><br>
	Informamos que o per�odo para consultar resposta de acionamentos &eacute; de <bean:write name="_ORGAO_" property="dataInicioConsultaResposta" format="dd/MM/yyyy"/> at&eacute; <bean:write name="_ORGAO_" property="dataFimConsultaResposta" format="dd/MM/yyyy"/>.<br><br>
	Para entrar em contato conosco por outros canais de comunica��o, utilize o endere�o: <a title='Outros Canais de Comunica��o' href='../ExibirMensagemGenerica.do?titulo=Outros Canais de Comunica��o&tela=CanaisComunicacao' target='conteudo'>Outros Canais de Comunica��o</a><br><br>
	Atenciosamente,<br>
	<bean:write name="_ORGAO_" property="descricao" />  
	</p>
  <hr>
  <p class="voltar"> 
	<a tabindex="3" title="voltar para p�gina anterior" href="javascript:history.go(-1)" >voltar</a>
  </p>
</div>
</body>
</html:html>
