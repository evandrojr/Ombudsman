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
<%--
 /*
   -- Módulo:       Ancionamento
   -- 
   -- Descrição:    Lista o script de acordo com o assunto ou o texto informado
   -- 
   -- Versão:       1.0
   -- Data:         17/12/2004
  */
--%>


<!-- TagLibs Struts -->
<%@ taglib uri="/tags/struts-logic" prefix="logic" %>
<%@ taglib uri="/tags/struts-bean"  prefix="bean"%>
<%@ taglib uri="/tags/struts-html"  prefix="html"%>

<html:html lang="pt">

<head>
<html:base />

<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<meta name="Keywords" content="acessibilidade, guia, serpro, inclusão, deficiência, recomendações, necessidade especial, ouvidoria" />
<link rel="stylesheet"  media="all" href="../<bean:write name="_LAYOUT_" property="esquemaCores"/>/estilo_conteudo_pop.css" type="text/css">
<link rel="stylesheet" type="text/css" media="print" href="../estilo_print.css">
		
<title>Consultar Banco de Scripts</title>

<script language="JavaScript">

		function onLoad(){
		
			var flagEnviar = false;
			
			try {
				flagEnviar = parent.document.forms[0].flagEnviar.value;
			}catch(err){
			}
			
			if (!flagEnviar){
				document.getElementById("linkEnviar").style.visibility="hidden";
				document.getElementById("figuraEnviar").style.visibility="hidden";
			}
		
			document.getElementById("imgDetalhe").focus();
		
		}
	
		function Enviar(){
			
			try {
				parent.window.opener.document.frm_msg.txtResposta.value = document.forms[0].DescScript.value;
				
				parent.window.opener.onLoad();
			}catch(err){
			}
			
			return false;
		}

</script>	
</head>

	<body tabindex="1" onload="onLoad();" 
	      style="margin: 2px 0px;" >

		<form>
			
    	<table border="0" width="100%" cellpadding="0" cellspacing="0">
      	<tr>
        	<td align="left"><img src="../<bean:write name="_LAYOUT_" property="esquemaCores"/>/pasta_detalha.gif" name="imgDetalhe" id="imgDetalhe" tabindex="2" alt="Script Escolhido"><table cellpadding="0" cellspacing="1" border="0" width="100%">
	          	<tr>
		          	<td>
		            	
		            	<table cellpadding="2" cellspacing="1" border="0"  width="100%">
	        		    	<tr>
		         	      	<td class="contentBold">
	                    	<div tabindex="2">
													<bean:message key="prompt.script"/> : <bean:write name="ScriptForm" property="titulo"/>
												</div> 
	                    </td>
		                </tr>
		                <tr>
			              	<td class="tdHeader4">
											<a href="#" tabindex="3" id="linkEnviar"
												onClick="return Enviar();"
												onkeypress="return Enviar();"
												alt="Clique para enviar este script para a resposta da mensagem">

												<img src="../images/enviar.jpg" id="figuraEnviar" border="0" title="Enviar texto do script">
											</a>
								<br>

	                    		<div tabindex="4" id="descricao">
	                    			<bean:write name="ScriptForm" property="descricaoFormatada" filter="false"/>
				        					</div>
	  			        		</td>
			            	</tr>		
	                </table>
	            
		            </td>
            	</tr>	
            </table>
          </td>
        </tr>	
    	</table>
    	
		<script type="text/javascript" charset='iso-8859-1'>
			// Redimensiona o iFrame de detalhe da solução da tela 
			// de consulta de soluções
		    window.parent.document.getElementById("exibeScript").style.height = this.document.body.scrollHeight;		
    	</script>

		<INPUT TYPE="hidden" NAME="DescScript"  VALUE="<bean:write name="ScriptForm" property="descricao"/>">		
		
		</form>
	</body>
</html:html>
