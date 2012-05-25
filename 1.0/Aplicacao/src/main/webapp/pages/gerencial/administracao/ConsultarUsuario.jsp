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

<%--
 /*
   -- Sistema:     Ouvidoria
   -- M�dulo:      Gerencial
   -- Aplica��o:   Gestor de Sistema
   -- 
   -- Vers�o:      1.0
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
		<h1 id="titulo" title="Administrar Usu�rio" tabindex="1">Administrar Usu�rio</h1>
		<table cellpadding="0" cellspacing="0" border="0" width="100%">
			<tr>
				<td>
			    	<table height="100%" cellpadding="2" cellspacing="1" border="0" width="100%">
			    		<form action="../../../gerencial/AtualizarUsuario.do" target="lista" method="get">
			    		<input type="hidden" name="action" value="listar" />
				    	<tr>
				        	<td class="tdHeader3" align='middle' width="20%">
				        		<input accesskey="i" title="Incluir Usu�rio" type="button" style="width: 100px;" value="Incluir Usu�rio" class="button" onClick="link('detalhe', '../../../gerencial/AtualizarUsuario.do?action=exibir&function=incluir');">
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
			<a title="voltar para p�gina anterior" href="javascript:history.go(-1)" >voltar</a>
		</p>
	</div>
</body>
</html>
