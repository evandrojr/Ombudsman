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
   -- Módulo:       Acionamento
   -- Aplicação:    Acionador
   -- 
   -- Descrição:    Tela inicial.
   -- 
   -- Versão:       1.0
   -- Data:         05/01/2004
  */
--%>

<%@ taglib uri="/tags/struts-logic" prefix="logic" %>
<%@ taglib uri="/tags/struts-bean" prefix="bean"%>
<%@ taglib uri="/tags/struts-html" prefix="html"%>

<html:html lang="pt">

<head>
<title>Abertura Sistema Ouvidoria</title>
<html:base/>
<link rel="stylesheet" href="<bean:write name="_LAYOUT_" property="esquemaCores"/>/estilo_capa_int.css" type="text/css">
</head>
<body style="margin: 0px 0px;">

<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
<tr>
	<td class="tdLeft" width="162">
		<table cellspacing=0 cellpadding=0 border=0 width=100%>
			<tr height="30%">
				<td>
					<IMG alt="Logotipo Acessibilidade" src="images/acessibilidade.gif" tabindex="1">
				</td>
			</tr>
			<tr height="70%">
				<td>
				</td>
			</tr>
			<tr height="30%">
				<td>
					<logic:notEqual name="orgao" property="id" value="43">
					<IMG alt="Produto SERPRO" src="images/serpro.gif" tabindex="2">
					</logic:notEqual>
				</td>
			</tr>			
		</table>
	</td>
	<td valign="middle" align="center" bgColor="#FFFFFF"> 
	<img alt="Logotipo Sistema Ouvidoria" src="images/SistCpMarcaSistemaPG.gif" tabindex="3">
	  <p tabindex="4">
		  <font style="font-size='70%'">
		  	<%=request.getAttribute("textoOuvidoria")%>
	      </font>
	  </p>
	  <div id=left>
      <ul>
         <li><a tabindex="5" href="<%= request.getAttribute("suporteUsuario")%>" target="_top"> :: Suporte ao Usuário :: 16/11/2011</a></li>         
      </ul>
      </div>
      </td>
	 <td class="tdRight" width="162"></td>
</tr>
</table>
</body>
</html:html>
