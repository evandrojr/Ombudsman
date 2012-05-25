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
<!-- ExibeSolucaoPendente.jsp -->

<% /*
   -- Sistema:  	Ouvidoria
   -- M�dulo:      Gerencial
   -- Perfil:       	Ouvidor Assistente
   -- 
   -- Descri��o:	O ouvidor assistente verifica a solu��o pendente,
   --               	aprovando-os ou reprovando-os
   -- 
   -- Vers�o:      1.0
   -- Data:         	24/01/2007
  */
%>

<%@ taglib uri="/tags/struts-logic" prefix="logic" %>
<%@ taglib uri="/tags/struts-bean" prefix="bean"%>
<%@ taglib uri="/tags/struts-html" prefix="html"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html   lang="pt-br">

	<head>
		<html:base />
		
		<title>Autorizar Solu��o</title>
		<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
		<link rel="stylesheet"  media="all" href="../../<bean:write name="_LAYOUT_" property="esquemaCores"/>/estilo_conteudo.css" type="text/css">
		<!-- Estilo para impressao -->
		<link rel="stylesheet" type="text/css" media="print" href="../../estilo_print.css">
		<script language="JavaScript">
		
			<!--
			function MM_reloadPage(init) {  //reloads the window if Nav4 resized
			  if (init==true) with (navigator) {if ((appName=="Netscape")&&(parseInt(appVersion)==4)) {
			    document.MM_pgW=innerWidth; document.MM_pgH=innerHeight; onresize=MM_reloadPage; }}
			  else if (innerWidth!=document.MM_pgW || innerHeight!=document.MM_pgH) location.reload();
			}
			MM_reloadPage(true);
			// -->
		
		</script>
	</head>

	<script type="text/javascript" charset='iso-8859-1'>
	
		// Caso o ouvidor reprove a solu��o, poder� colocar uma OBS
		function abreOBS() {
		
		// Chama novamente a exibi��o da solu��o, passando um indicativo de exibi��o da OBS
			window.location = location.href + '&exibeOBS=S';		
		
			if ( document.getElementById('txtOBS') ) {
				document.getElementById('txtOBS').focus();		
			}
		}
		
		// Dispara acao para aprovar a solu��o
		function aprovar(){
			document.forms[0].action.value = "AprovarSolucao";
			
			// Trata Href
			var basehref = location.href;
			var i = basehref.lastIndexOf('/');
			basehref = basehref.substring(0, i + 1);
			
			window.parent.location = basehref + "AutorizarSolucao.do?action=" + document.forms[0].action.value + 
												"&idSolucao="+document.forms[0].idSolucao.value;
		}
		
		// Dispara acao para reprovar a solu��o
		function reprovar(){
			document.forms[0].action.value = "ReprovarSolucao";	
			
			// Trata Href
			var basehref = location.href;
			var i = basehref.lastIndexOf('/');
			basehref = basehref.substring(0, i + 1);
			
			
			window.parent.location = basehref + "AutorizarSolucao.do?action=" + document.forms[0].action.value + 
								                 "&idSolucao="+document.forms[0].idSolucao.value + 
								                 "&txtObs="+document.forms[0].txtObs.value;
		}
		
		// Fun��o a ser executada na carga da tela
		function onLoad() {	
			window.parent.document.getElementById("detalhe").style.height = this.document.body.scrollHeight;				
			document.getElementById('imgDetalhe').focus();
		}
	
	</script>
	
	<body onload="javascript:onLoad();"  style="margin: 0px 0px;">
	


		<html:form action="AutorizarSolucao.do" method="post">
		<table cellpadding="2" cellspacing="0" border="0" align="center" width=100%>
		
			<td align="left"><img accesskey="d" tabindex="2" name="imgDetalhe" src="../../<bean:write name="_LAYOUT_" property="esquemaCores"/>/pasta_detalha.gif" alt="Detalhe da Solu��o"><table cellpadding="2" cellspacing="1" border="0" align="center" width="100%">

            <TR>  
		    <td class="tdHeader3" width="80"><label for="tituloId">Assunto:</label></td>
		    <td class="tdHeader4" colspan="4" align="left"> 
		      <div align="left">      
		        <input id="assuntoId" name="assunto" size="79" READONLY 
		         VALUE="<bean:write name="Solucao" property="assunto.descricao" />" 
		         tabindex="3">
			   
			  </div>
		    </td>
		    </TR>

		    <TR>
            <td class="tdHeader3" width="80"><label for="tituloId">T�tulo:</label></td>
		    <td class="tdHeader4" colspan="4" align="left"> 
		      <div align="left">      
		        <input id="tituloId" name="titulo" size="79" READONLY 
		         VALUE="<bean:write name="Solucao" property="titulo" />" 
		         tabindex="4">
			    
			  </div>
		    </td>
            </TR>
		    
		    
		    <TR>
		    <td class="tdHeader3"><label for="texto">Texto:</label></td>
		    <td class="tdHeader4" colspan="4" align="left"> 
		      <div align="left">
		        <textarea id="texto" name="texto" READONLY style="width:500px; height:90px" tabindex="5"><bean:write name="Solucao" property="texto" /></textarea>
		      </div>
		    </td>
		    </TR>
		    
		</table>
		
		<logic:equal  name="exibeOBS"  value="N">
			<table cellpadding="2" cellspacing="1" border="0" align="center" width=100%>
			  <tr> 
			    <td class="tdHeader3" id="maenome" colspan="5">
			      <div align="center">
			        <input type="button" name="botao" value="Aprovar"  class="button" onClick="aprovar()"  tabindex="6">
			        <input type="button" name="botao" value="Reprovar" class="button" onClick="abreOBS()"  tabindex="7" >
			      </div>
			    </td>
			  </tr>
			</table>
		</logic:equal>
		
		<logic:equal  name="exibeOBS"  value="S">
			<table cellpadding="2" cellspacing="1" border="0" align="center" width=100%>
			  <TR>
			    <td class="tdHeader3" width="80"><label for="txtObs">Observa��es:</label></td>
			    <td class="tdHeader4" align="left"> 
			      <div align="left"> 
			        <textarea id="txtOBS" name="txtObs" style="width:500px; height:50px" tabindex="5"></textarea>
			      </div>
			    </td>
			  </TR>
			</table>
			<table cellpadding="2" cellspacing="1" border="0" align="center" width=100%>
			  <tr> 
			    <td class="tdHeader3" id="maenome" colspan="5" align=center>
			        <input type="button" name="botao" value="Reprovar" class="button" onClick="reprovar()" tabindex="6">
			    </td>
			  </tr>
			</table>
		</logic:equal>
		
		<INPUT TYPE="hidden" NAME="action"   VALUE="" >
		<INPUT TYPE="hidden" NAME="idSolucao" VALUE=<bean:write name="Solucao" property="id"/> >
		
		</html:form>
	
	</body>
</html>
