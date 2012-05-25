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
	<title>Recuperar C�digo de Acesso</title>
</head>

<body onLoad="javascript: document.getElementById('titulo').focus();">

<div id="content"> 
  <h1 id="titulo" tabindex="1">C�digo de Acesso</h1>
	
	<html:form action="/ExibirResposta" method="post">
	<input type="hidden" name="numeroProtocolo" value="<%= request.getAttribute("numeroProtocolo")%>">
	<input type="hidden" name="codigoAcesso" value="<%= request.getAttribute("codigoAcesso")%>">
	
	<table cellpadding="2" cellspacing="1" border="0" width="318" align="center" style="WIDTH: 318px">
		<tr> 
			<td class="tdHeader3" id="nomeProtocolo" title="Protocolo"><label tabindex="2">Protocolo:</label></td>
			<td class="tdHeader4" colspan=4>
				<label tabindex="3"><%= request.getAttribute("numeroProtocolo")%></label>
			</td>
	</tr>
		
		<tr> 
			<td class="tdHeader3" id="codigoAcesso" title="C�digo de Acesso"><label tabindex="4">C�digo de Acesso:</label></td>
			<td class="tdHeader4" colspan=4>
				<label tabindex="5"><%= request.getAttribute("codigoAcesso")%></label>
			</td>
	</tr>
		
	<logic:notEqual name="action" value="null">
	<tr> 
		<td class="tdHeader1" colspan="5"> 
			<input style="width: 160px;" type="submit" tabindex="7" name="submit" value="Consulte sua resposta" class="button" alt="Clique para consultar sua resposta">
		</td>
  </tr>
	</logic:notEqual>
	
	</table>
	</html:form>
  <p></p>
  <hr>
  <p class="voltar"> 
	<a tabindex="6" title="Voltar para p�gina anterior" href="javascript:history.go(-1)">voltar</a>
  </p>
</div>
</body>
</html:html>
