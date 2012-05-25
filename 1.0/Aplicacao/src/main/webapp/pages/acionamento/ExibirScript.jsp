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

<!-- TagLibs Struts -->
<%@ taglib uri="/tags/struts-logic" prefix="logic" %>
<%@ taglib uri="/tags/struts-bean"  prefix="bean"%>
<%@ taglib uri="/tags/struts-html"  prefix="html"%>

<html:html lang="pt">

	<head>
		<html:base />
		<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
		<meta name="Keywords" content="acessibilidade, guia, serpro, inclusão, deficiência, recomendações, necessidade especial, ouvidoria" />
		<link rel="stylesheet"  media="all" href="../<bean:write name="_LAYOUT_" property="esquemaCores"/>/estilo_conteudo.css" type="text/css">
		<title>Busca de Scripts</title>
	</head>
	
	<script type="text/javascript" charset='iso-8859-1'>
		function onLoad() {
			window.parent.document.getElementById("exibeScript").style.height = this.document.body.scrollHeight;
			document.getElementById("imgDetalhe").focus();
		}
	</script>
	
	<body  style="margin: 0px 0px;" tabindex="1" onload="onLoad();">
		<form>
    	<table border="0" width="100%" cellpadding="0" cellspacing="0">
      	<tr>
        	<td align="left"><img src="../<bean:write name="_LAYOUT_" property="esquemaCores"/>/pasta_detalha.gif" name="imgDetalhe" id="imgDetalhe" tabindex="2" alt="Script Escolhido"><table cellpadding="2" cellspacing="1" border="0" width="100%">
	          	<tr>
		          	<td colspan=2>
		            	
		            	<table cellpadding="0" cellspacing="1" border="0"  width="100%">
	        		    	<tr>
		         	      	<td class="contentBold">
	                    	<html:hidden name="ScriptForm" property="id"/>
	                    	<div tabindex="2">
								<bean:message key="prompt.script"/> : <bean:write name="ScriptForm" property="titulo"/>
							</div> 
	                    </td>
		                </tr>
		                <tr>
			              	<td class="tdHeader4">
	                    	<div tabindex="3">
	                      	<bean:write name="ScriptForm" property="descricaoFormatada"/>
				        	</div>	
	  			        	</td>
			            </tr>		
	                </table>
	            
		            </td>
            	</tr>	
				
				<tr>
					<td class="tdHeader1right">
						<input tabindex="11" type="button" name="atende" value="Atende" class="button" 
							onClick="return window.parent.RegistrarAtendimento();"
							onkeypress="return window.parent.RegistrarAtendimento();"
							alt="Clique para registrar o que o Script atendeu">
					</td>
					<td class="tdHeader1left">
						<input tabindex="12" type="button" name="NaoAtende" value="Não Atende" class="button" 
							onClick="return window.parent.CadastrarAcionamento();"
							onkeypress="return window.parent.CadastrarAcionamento();"
							alt="Clique para cadastrar um novo acionamento">
					</td>
				</tr>				

			</table>
          </td>
        </tr>	
    	</table>
		</form>		
</body>
</html:html>
