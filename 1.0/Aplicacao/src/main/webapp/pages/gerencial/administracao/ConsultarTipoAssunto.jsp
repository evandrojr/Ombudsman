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

<% /*
   -- Sistema:      Ouvidoria
   -- Módulo:       Gerencial
   -- Aplicação:    Gestor de Sistema
   -- 
   -- Versão:       1.0
   -- Data:         03/01/2005  
   -- 
  */
%>

<%@ taglib uri="/tags/struts-logic" prefix="logic" %>
<%@ taglib uri="/tags/struts-bean" prefix="bean"%>
<%@ taglib uri="/tags/struts-html" prefix="html"%>

<html lang="pt">
	<head>
		<title>Manter Tipos de Assunto</title>
		<html:base />
		<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
		<link rel="stylesheet"  media="all" href="../../<bean:write name="_LAYOUT_" property="esquemaCores"/>/estilo_conteudo.css" type="text/css">			
<script type="text/javascript" charset='iso-8859-1'>
 function onLoad(){
  document.getElementById("titulo").focus();
 }
</script>

	</head>


	<body onload="onLoad();">


		<div id="content">
			<h1 id="titulo" title="manter tabela de assuntos de mensagens" tabindex="1">Manter tabela de Assuntos de Mensagens</h1>
			<table cellpadding="0" cellspacing="0" border="0" width="100%">

				<tr>
					<td>
						<iframe tabindex="2" src="../../../gerencial/AtualizarTipoAssunto.do?action=listar" tabindex="11" id="lista" name="lista" longdesc="listagem" width="100%" height="200" scrolling="0" marginwidth="0" marginheight="0" frameborder="0"></iframe>
					</td>
				</tr>

				<tr>
					<td height="4">
					</td>
				</tr>

				<tr>
					<td>
						<iframe tabindex="3" src='../../../gerencial/Vazio.do' tabindex="11" id="detalhe" name="detalhe" longdesc="detalhe" width="100%" height="0" scrolling="0" marginwidth="0" marginheight="0" frameborder="0"></iframe>
					</td>
				</tr>
			</table>
			<hr>
			<p class="voltar"> 
				<a tabindex="4" title="voltar para página anterior" href="javascript:history.go(-1)" >voltar</a>
			</p>

		</div>
	</body>
</html>
