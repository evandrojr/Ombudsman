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
	<title>Recuperar Código de Acesso</title>
</head>

<body onLoad="javascript: document.getElementById('titulo').focus();">

<div id="content"> 
  <h1 id="titulo" tabindex="1">Código de Acesso</h1>
	
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
			<td class="tdHeader3" id="codigoAcesso" title="Código de Acesso"><label tabindex="4">Código de Acesso:</label></td>
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
	<a tabindex="6" title="Voltar para página anterior" href="javascript:history.go(-1)">voltar</a>
  </p>
</div>
</body>
</html:html>
