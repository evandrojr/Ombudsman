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
<%--
 /*
   -- M�dulo:       Ancionamento
   -- 
   -- Descri��o:    Lista o script de acordo com o assunto ou o texto informado
   -- 
   -- Vers�o:       1.0
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
<meta name="Keywords" content="acessibilidade, guia, serpro, inclus�o, defici�ncia, recomenda��es, necessidade especial, ouvidoria" />
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
			// Redimensiona o iFrame de detalhe da solu��o da tela 
			// de consulta de solu��es
		    window.parent.document.getElementById("exibeScript").style.height = this.document.body.scrollHeight;		
    	</script>

		<INPUT TYPE="hidden" NAME="DescScript"  VALUE="<bean:write name="ScriptForm" property="descricao"/>">		
		
		</form>
	</body>
</html:html>
