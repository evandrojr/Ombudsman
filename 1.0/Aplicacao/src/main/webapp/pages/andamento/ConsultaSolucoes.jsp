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
<% /*
   -- M�dulo:       Andamento
   -- 
   -- Descri��o:    O especialista o banco de solu��es informando um assunto (ativo/inativo) ou um texto
   -- 
   -- Vers�o:       1.0
   -- Data:         22/11/2004
  */
%>

<%@ taglib uri="/tags/struts-logic" prefix="logic" %>
<%@ taglib uri="/tags/struts-bean" prefix="bean"%>
<%@ taglib uri="/tags/struts-html" prefix="html"%>

<html:html lang="pt">

<head>
<html:base />
<meta http-equiv='Content-Type' content='text/html; charset=iso-8859-1'>
<title>Banco de Solu��es</title>

<!-- Bibliotecas javascript  -->
<script language="JavaScript" src="../js/util.js"></script>

<script language="JavaScript">

function validaForm() {
		var ok;
		var innerHtmlMsgErros = '';			
		
		// Trata Href
		var basehref = location.href;
		var i = basehref.lastIndexOf('/');
		basehref = basehref.substring(0, i + 1);	
		
		ok = true;            

        if ( (document.forms[0].chkAtivo.checked   == false) &&
             (document.forms[0].chkInativo.checked == false) ) {
			innerHtmlMsgErros += formataErro('Informe a situa��o a ser consultada');
	        ok = false;
        }
        else {
            innerHtmlMsgErros = '';
        }

        // limpa os iFrames
		window.frames[0].location= basehref + "Vazio.do";
		window.frames[1].location= basehref + "Vazio.do";

		if(ok){
	        if (document.forms[0].chkAtivo.checked == true) {
	            document.forms[0].chkAtivo.value = 'S';
	        } else {
	            document.forms[0].chkAtivo.value = 'N';
	        }	    
	        
	        if (document.forms[0].chkInativo.checked == true) {
	            document.forms[0].chkInativo.value = 'S';
	        } else {
	            document.forms[0].chkInativo.value = 'N';
	        }
		    
		    document.forms[0].submit();            
		} else {
			var texto = innerHtmlMsgErros;
			abreAlerta(texto);					
			setaFocoOnLoad();
	}
        
   }

   // Seta o foco ao carregar a tela
   function setaFocoOnLoad(){
       //var focusControl = document.getElementById("MsgInicial");
       //focusControl.focus();
	   
	   document.getElementById("MsgInicial").focus();
   }

</script>

</head>

	<link rel='stylesheet'  media='all' href="../<bean:write name="_LAYOUT_" property="esquemaCores"/>/estilo_conteudo.css" type='text/css'>
	<link rel='stylesheet' type='text/css' media='print' href='../estilo_print.css'>

	<logic:notEqual name="acaoChamadora" value="ResponderMsg">
		<body onload="javascript:setaFocoOnLoad();"  >
	</logic:notEqual>

	<logic:equal    name="acaoChamadora" value="ResponderMsg">
    	<body onload="javascript:setaFocoOnLoad();" style="margin: 10px 1em;" >
	</logic:equal>

	<div id="content">

			<h1 tabindex="1" id="MsgInicial">
				Consulta Banco de Solu��es
			</h1>
			<p tabindex="5" Align="LEFT">
				Para consultar uma solu��o, informe uma palavra chave e/ou assunto e a situa��o do assunto
			</p>

			<table cellpadding='2' cellspacing='0' border='0' width='100%'>
				<html:form action="/ListaSolucoes" method="post" target="lstSolucoes">
			    <tr>
	   	     		<td height="100%">
			            <table cellpadding='2' cellspacing='1' border='0' width='100%' height="100%" valign="center">
		    			    <tr>
				            	<td class='tdHeader3' valign="center">
				            		<label for="ptexto" accesskey="T" valign="center" align="center">
				            			Palavra Chave:
				            		</label>
				            	</td>
   			    				<td class='tdHeader4' valign="center" align="center">
							        <input type='text' tabindex="6" size='20' name='txtBusca' class='text' id="ptexto">
			    				</td>
					        </tr>
					    </table>
			        </td>
			        <td height="100%">
		    			<table cellpadding='2' cellspacing='1' border='0' width='100%' height="100%">
					        <tr>
		        			    <td class='tdHeader3' valign="center" align="center">
		        			    	<label for="passunto" accesskey="A">
		        			    		Assunto:
		        			    	</label>
		        			    </td>
							    <td class='tdHeader4' valign="center" align="center">
								    &nbsp;
				                    <html:select property="txtAssunto" tabindex="7" styleClass="text" styleId="passunto" >
									    <html:option value="0">Todos</html:option>
					                    <html:options collection="lstAssuntos" property="id" labelProperty="descricao"/>    
   	    	         			    </html:select>                     
				                    &nbsp;&nbsp;	                   	    
			    				</td>				
					        </tr>
					    </table>
			        </td>
   		     		<td height="100%">
			            <table cellpadding='2' cellspacing='1' border='0' width='100%' height="100%">
		    			    <tr>
   	    	             		<td class='tdHeader3' valign="center" align="center">
			        				&nbsp;
	                    			<label for="psituacao" accesskey="S">
	   	                 				Situa��o:
	                    			</label>
			        				&nbsp;
   	                			</td>
					   		    <td class='tdHeader4'>
									<label for="pAtivo"> 
				                        <input type='checkbox' tabindex="8" size='30' name='chkAtivo'  id="pAtivo" value="S" CHECKED>
				                        Ativo 
	            		            </label> 
	                    		    <label for="pInativo">
				                        <input type='checkbox' tabindex="9" size='30' name='chkInativo' id="pInativo" value="S" CHECKED>
	            			            Inativo
	                        		</label>
							    </td>
					        </tr>
					    </table>
			        </td>			        
			    </tr>			    
				<tr>
					<td colspan='3' align='middle' class='tdHeader1'>
		                <label for="consultar solucoes"> 
					    <input type='button' tabindex="10" value='Buscar' name='buscar' class='button' onClick="javascript:validaForm();"  title='Clique para efetuar a consulta'>
		                </label> 
					</td>
				</tr>													    	
				<INPUT TYPE="hidden" NAME="acaoChamadora"  VALUE="<%= request.getAttribute("acaoChamadora") %>">
				</html:form>
			</table>

<%
		    // Define altura dos Iframes de acordo com 
	    	// a a��o chamadora
			int AlturaIFrame1 = 0;
			int AlturaIFrame2 = 0;
%>

			<logic:equal name="acaoChamadora" value="ResponderMsg">
			</logic:equal>
	
			<table cellpadding='0' cellspacing='0' border='0'  width='100%'>
				<tr>
					<td>
						<iframe src='_blank.htm' id="lstSolucoes" name='lstSolucoes' longdesc='Lista de Solu��es' frameborder='0' width='100%' height='0'>
						</iframe>
					</td>
				</tr>
				<tr>	
					<td>
						<iframe src='_blank.htm' id='exibeSolucao' name='exibeSolucao' longdesc='Solu��o Selecionada' frameborder='0' width='100%' height='0'>
						</iframe>
					</td>
				</tr>
			</table>

			<logic:equal name="acaoChamadora" value="ResponderMsg">
				<table cellpadding='2' cellspacing='1' border='0'  width='100%'>
					<tr>
						<td class='tdHeader1' align='center'>
						    <label for="fechar">
							    <input type='button' class='button' value='Fechar' onClick='window.close()' title='Fechar Janela' tabindex="20">
						    </label>
						</td>
					</tr>
				</table>
			</logic:equal>    
			<logic:notEqual name="acaoChamadora" value="ResponderMsg">
				<hr>
				<p class="voltar"> 
					<a title="voltar para p�gina anterior" href="javascript:history.go(-1)" >voltar</a>
				</p>
			</logic:notEqual>	
	</div>
</body>
</html:html>
