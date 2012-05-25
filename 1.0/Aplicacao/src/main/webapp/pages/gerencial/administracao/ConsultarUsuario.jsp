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
   -- Sistema:     Ouvidoria
   -- Módulo:      Gerencial
   -- Aplicação:   Gestor de Sistema
   -- 
   -- Versão:      1.0
   -- Data:        08/01/2005
   -- 
  */
--%>

<%@ taglib uri="/tags/struts-bean" prefix="bean"%>
<%@ taglib uri="/tags/struts-html" prefix="html"%>

<html lang="pt">
<head>
	<title>Manter Tipos de Mensagem</title>
	<html:base />
	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
	<link rel="stylesheet"  media="all" href="../../<bean:write name="_LAYOUT_" property="esquemaCores"/>/estilo_conteudo.css" type="text/css">
	
	<script type="text/javascript" charset='iso-8859-1'>
		<!-- //
		function onLoad(){
			try { document.getElementById("titulo").focus(); } catch(e) {}
		}

		function link(frame, url) {
			var baseHref = location.protocol + "//" + location.host + location.pathname;
			window.frames[frame].document.location.href= baseHref  + url;		
		}
		// -->
	</script>
	
</head>
<body onload="javascript:onLoad();">
	


	<div id="content">
		<h1 id="titulo" title="Administrar Usuário" tabindex="1">Administrar Usuário</h1>
		<table cellpadding="0" cellspacing="0" border="0" width="100%">
			<tr>
				<td>
			    	<table height="100%" cellpadding="2" cellspacing="1" border="0" width="100%">
			    		<form action="../../../gerencial/AtualizarUsuario.do" target="lista" method="get">
			    		<input type="hidden" name="action" value="listar" />
				    	<tr>
				        	<td class="tdHeader3" align='middle' width="20%">
				        		<input accesskey="i" title="Incluir Usuário" type="button" style="width: 100px;" value="Incluir Usuário" class="button" onClick="link('detalhe', '../../../gerencial/AtualizarUsuario.do?action=exibir&function=incluir');">
				        	</td>
				        	<td class="tdHeader3" width="15%">
				        		<label for="pchave" accesskey="T">Palavra-chave:</label>
				        	</td>
				   		    <td class="tdHeader4" width="65%">
						      	<input type="text" tabindex="5" size="50" name="pchave" class="text" id="pchave" maxlength="50">
					    	</td>				
						</tr>
						<tr>
						 <td colspan='3' align='middle' class='tdHeader1'>
			                <label for="consultar usuario"> 
						    <input type='button' tabindex="8" value='Buscar' name='buscar' class='button' onClick="javascript:document.forms[0].submit();"  title='Clique para efetuar a consulta'>
			                </label> 
						</td>
						</tr>
						</form>
				    </table>
				</td>
			</tr>
			<tr><td>&nbsp;</td></tr>
			<tr>
				<td>
					<!-- iframe src="../../../gerencial/AtualizarUsuario.do?action=listar" tabindex="2" -->
					<iframe src="../../../gerencial/Vazio.do" tabindex="2"
							id="lista" name="lista" longdesc="listagem" width="100%"
							height="200" scrolling="0" marginwidth="0" marginheight="0" frameborder="0">
					</iframe>
				</td>
			</tr>
			<tr>
				<td>
					<iframe src='../../../gerencial/Vazio.do' tabindex="2" id="detalhe" name="detalhe" longdesc="detalhe" width="100%" 
							height="0" scrolling="auto" marginwidth="0" marginheight="0" frameborder="0">
					</iframe>
				</td>
			</tr>
		</table>

		<hr>
		<p class="voltar"> 
			<a title="voltar para página anterior" href="javascript:history.go(-1)" >voltar</a>
		</p>
	</div>
</body>
</html>
