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
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">

<% /*
   -- Módulo:       Gerencial
   -- 
   -- Descrição:    Saída padrão para Mensagens de Sucesso
   -- Versão:       1.0
   -- Data:         10/12/2004
  */
%>

<%@ taglib uri="/tags/struts-bean" prefix="bean" %>
<%@ taglib uri="/tags/struts-html" prefix="html" %>
<%@ taglib uri="/tags/struts-logic" prefix="logic" %>

<html:html lang="pt">
<head>
<html:base/>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>Sucesso</title>
	<script language="JavaScript">
	<!-- // 
	function onLoad(){
		try {
	        window.parent.document.getElementById("detalhe").style.height = document.body.scrollHeight;			
			document.body.style.marginTop   = "0px";
		    document.body.style.marginLeft   = "0px";
			document.body.style.marginRight = "0px";
			document.body.style.marginBottom = "0px";			
			window.parent.frames["lista"].location.reload();
			var focusControl = document.getElementById("titulo");
		focusControl.focus();
		} catch (e) {
		}
	}
	// -->
	</script>
</head>
<link rel="stylesheet"  media="all" href="../../<bean:write name="_LAYOUT_" property="esquemaCores"/>/estilo_conteudo.css" type="text/css">
<body onLoad="onLoad();" style="margin: 0px 0px;">
<div id="content">
  <h1 id="titulo" title="operação realizada com sucesso" tabindex="1">Sucesso</h1>
	<ul>
		<html:messages id="message" message="true">
        <li tabindex="2" title="<%= message %>"><%= message %></li>
		</html:messages>
	</ul>
  <hr>
  <p class="voltar"> 
  	<a tabindex="3" title="fechar a tela" href="../../../gerencial/Vazio.do" >fechar</a>
  </p>
</div>
</body>
</html:html>
