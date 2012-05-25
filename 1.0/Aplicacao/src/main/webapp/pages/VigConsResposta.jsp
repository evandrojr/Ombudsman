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
<% 
  /*
   -- Sistema:      Ouvidoria
   -- Módulo:       Geral
   -- Aplicação:    Ouvidoria.jsp
   -- 
   -- Descrição:    Saída padrão para cadastros de acionamentos fora da vigência
   -- 
   -- Versão:       1.0
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
<title>Atenção</title>
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
  <h1 id="titulo" tabindex="1" title="Atenção">Atenção</h1>
  <br>
	<p tabindex="2" title="Cadastro de Acionamento Encerrado">
	Prezado cidadão,<br><br>
	Informamos que o período para consultar resposta de acionamentos &eacute; de <bean:write name="_ORGAO_" property="dataInicioConsultaResposta" format="dd/MM/yyyy"/> at&eacute; <bean:write name="_ORGAO_" property="dataFimConsultaResposta" format="dd/MM/yyyy"/>.<br><br>
	Para entrar em contato conosco por outros canais de comunicação, utilize o endereço: <a title='Outros Canais de Comunicação' href='../ExibirMensagemGenerica.do?titulo=Outros Canais de Comunicação&tela=CanaisComunicacao' target='conteudo'>Outros Canais de Comunicação</a><br><br>
	Atenciosamente,<br>
	<bean:write name="_ORGAO_" property="descricao" />  
	</p>
  <hr>
  <p class="voltar"> 
	<a tabindex="3" title="voltar para página anterior" href="javascript:history.go(-1)" >voltar</a>
  </p>
</div>
</body>
</html:html>
