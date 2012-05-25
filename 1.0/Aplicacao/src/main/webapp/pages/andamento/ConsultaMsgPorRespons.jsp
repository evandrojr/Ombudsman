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
<% /*
   -- Módulo:       Andamento
   -- 
   -- Descrição:    O especialista consulta mensagens da sua responsabilidade
   -- 
   -- Versão:       1.0
   -- Data:         08/12/2004
  */
%>

<%@ taglib uri="/tags/struts-logic" prefix="logic" %>
<%@ taglib uri="/tags/struts-bean"  prefix="bean"%>
<%@ taglib uri="/tags/struts-html"  prefix="html"%>

<html:html lang="pt">

<head>
	<html:base />
	<meta http-equiv='Content-Type' content='text/html; charset=iso-8859-1'>
	<title></title>

<!-- Biblioteca javascript  -->
	<%@ include file="../js/header2.inc.jsp" %>
	<script language="JavaScript1.2" src="../js/data.js"></script>

</head>

<script language="JavaScript">

		function validaForm() {
			var innerHtmlMsgErros = '';
		
			if (( document.forms[0].chkpend.checked    == false ) &&
    			( document.forms[0].chkand.checked     == false ) &&
		        ( document.forms[0].chkatraso.checked  == false ) &&
        		( document.forms[0].chkcritico.checked == false ))
        	{
				innerHtmlMsgErros += formataErro('Informe o estado da mensagem a ser consultado'); 	     
		    }        

			if ((( document.forms[0].txtDatIni.value != '' )  && 
				 ( document.forms[0].txtDatFim.value == '' )) || 
				(( document.forms[0].txtDatIni.value == '' )  && 
				 ( document.forms[0].txtDatFim.value != '' )))
			{
				innerHtmlMsgErros += formataErro('Informe o período a ser consultado');
		    }
        
			 // Valida a data inicial
		    if ( document.forms[0].txtDatIni.value != '' )
		    {
				if ( ! CriticarData(document.forms[0].txtDatIni ))
				{
		 	        innerHtmlMsgErros += formataErro('Data início do período inválida, use o formato dd/mm/aaaa');
		        }
			}    

			// Valida a data final
			if ( document.forms[0].txtDatFim.value != '' )
			{
		        if (! CriticarData(document.forms[0].txtDatFim ))
        		{
		 	        innerHtmlMsgErros += formataErro('Data fim do período inválida, use o formato dd/mm/aaaa');
		        }
			}
		
			// Se as datas estiverem preenchidas, 
			// verifica se a data inicial &eacute; maior que a final
			var dataI = document.forms[0].txtDatIni.value;
			var dataF = document.forms[0].txtDatFim.value;

			if (( dataI != '' ) &&
				( dataF != '' ))
			{
				if ( dataMaior( dataI, "", dataF, "" ) ) {
			 		innerHtmlMsgErros += formataErro('Data início do período maior que a data final');
		  		}
		  	}  		     
		
		if( innerHtmlMsgErros == '')
		{
	    	document.forms[0].submit();            
		}
		else
		{
			var texto = innerHtmlMsgErros;
	    	setaFocoOnLoad();
		}
	}

   function setaFocoInicio(){
       var focusControl = document.getElementById("erro");
       focusControl.focus();
   }

// Seta o foco ao carregar a tela

	function setaFocoOnLoad(){
	var pesquisa = "<%= session.getAttribute("possuiPesquisa")%>";

		if ( pesquisa == "sim" ){
			document.forms[0].submit();
		}
		document.getElementById("MsgInicial").focus();
	}

	function onLoad()
	{
		document.forms[0].txtDatIni.setAttribute( 'dataType', 'date' );
		document.forms[0].txtDatFim.setAttribute( 'dataType', 'date' );
		afterPageBody();
		javascript:setaFocoOnLoad();
		
	}
</script>

<!-- Estilo para impressao -->
	<link rel='stylesheet' type='text/css' media='print' href='../estilo_print.css'>
	<link rel='stylesheet'  media='all' href='../<bean:write name="_LAYOUT_" property="esquemaCores"/>/estilo_conteudo.css' type='text/css'>

<body onload="onLoad();">

<div id="content">

<html:form action="/ListaMsgPorRespons" method="get" target="listaMsgPorRespons">

<logic:empty name="perfilOuvidor">
    <h1 tabindex="1" align=left id="MsgInicial">MENSAGENS SOB SUA RESPONSABILIDADE:</h1>
</logic:empty>
<logic:notEmpty name="perfilOuvidor">
    <h1 tabindex="1" align=left id="Msg">MENSAGENS:</h1>
</logic:notEmpty>

<%
    String sConteudo = "";
    int linha = 0;
%>

<table cellpadding='0' cellspacing='0' border='0'  width="100%">
<tr>
	<td align='left'>
        <table cellpadding=0 cellspacing=0 border=0 width="100%" >
            <tr> 
                <logic:notEmpty name="perfilOuvidor">
                    <td colspan="2"><STRONG tabindex="2">SITUAÇÃO GERAL DA OUVIDORIA</STRONG></td>
                    <td width="1">&nbsp;</td>
                    <td colspan="2"><STRONG tabindex="6">MENSAGENS SOB SUA RESPONSABILIDADE</STRONG>   
                    </td>
                </logic:notEmpty>                    
                <logic:empty name="perfilOuvidor">
                    <td colspan="2"></td>
                </logic:empty>
            </tr>			
			
            <logic:iterate name="lstTotaisMsgs" id="totalMsg"> 
                <%  
                     // Muda cor da linha para totais de Msg em Atraso e em Atraso Crítico
                     linha++;
                     					 
                     if ( (linha == 3) || (linha == 4)) {
                         sConteudo = "contentRedVerdana";
                     } else {
                         sConteudo = "contentBlueVerdana";
                     }                     
                %>

                <tr>
                    <logic:notEmpty name="perfilOuvidor"> 
                        <td width="30%" class="<%= sConteudo %>" >
                            <div tabindex="3" >
                            &nbsp;
                            <B class="<%= sConteudo %>"><bean:write name="totalMsg" property="descricao"  /></B>
                            </div>
                        </td>
                        <td class="<%= sConteudo %>" >
                            <div tabindex="3"  >
                            <B class="<%= sConteudo %>"><bean:write name="totalMsg" property="totalMsgOrgao"  /></B>
                            </div>
                        </td>               
                        <td width="1" class="<%= sConteudo %>">&nbsp;</td>
                    </logic:notEmpty> 

					<!--  Descrição das mensagens	-->
					<td width="30%" class="<%= sConteudo %>" >
                        <!-- Caso haja mensagens na situação em questão, exibe-se um link para o primeiro acionamento -->
                        <logic:notEqual  name="totalMsg" property="totalMsgFunc" value="0">
	                        <html:link 	action="ExibeMsgPorRespons" 
	                        			paramId="primeiroAcionamentoId"  
	                        			paramName="totalMsg"  
	                        			paramProperty="primeiroAcionamentoId" 
	                        			tabindex="6" 
	                        			target="listaMsgPorRespons">&nbsp;
		                        
		                        <B class="<%= sConteudo %>">
		                        	<bean:write name="totalMsg" property="descricao"  />
		                        </B>
		                        
	                        </html:link>
                        </logic:notEqual>
						<logic:equal  name="totalMsg" property="totalMsgFunc" value="0">                        
	                        &nbsp;
	                        <B tabindex="6"><bean:write name="totalMsg" property="descricao"  /></B>
						</logic:equal>
                    </td>

					<!--  Totais das mensagens	-->
					<td class="<%= sConteudo %>">
                    	<!-- Caso haja mensagens na situação em questão, exibe-se um link para o primeiro acionamento -->
                    	<logic:notEqual  name="totalMsg" property="totalMsgFunc" value="0">
	                        <html:link action="ExibeMsgPorRespons" 
	                        paramId="primeiroAcionamentoId"  
	                        paramName="totalMsg"  paramProperty="primeiroAcionamentoId" tabindex="6">                        
	                        <B class="<%= sConteudo %>"><bean:write name="totalMsg" property="totalMsgFunc"  /></B>
	                        </html:link>
                        </logic:notEqual>
						<logic:equal  name="totalMsg" property="totalMsgFunc" value="0">                        
	                        <B tabindex="6"><bean:write name="totalMsg" property="totalMsgFunc"  /></B>
						</logic:equal>	                        
                    </td>
                </tr>
			</logic:iterate>

            <tr>		
	    		<logic:notEmpty name="perfilOuvidor"> 	
	        		<td width='30%' class="contentBlackVerdana"> 
                       <div tabindex="4">   
                       &nbsp;&nbsp;<B>TOTAL</B> 
	        		   </div> 
	        		</td>
	        		<td class="contentBlackVerdana">
	        		   <div tabindex="5"> 
	        		   <B><bean:write name="TotalMsgOrgao" /></B> 
	        		   </div>
	        		</td>
                    <td width="1">&nbsp;</td>
                </logic:notEmpty>

				<td width='30%' class="contentBlackVerdana">
	    		    <div tabindex="7">  
	    		    &nbsp;&nbsp;<B>TOTAL</B> 
	    		    </div> 
	    		</td>
	    		<td class="contentBlackVerdana"> 
	    		    <div tabindex="8" >
	    		    <B><bean:write name="TotalMsgFunc" /></B>
	    		    </div>
	    		</td>
     		</tr>               

       </table>
    </td>
</tr>

<tr>
	<td><hr DESIGNTIMESP="25454">
        &nbsp;      
   	    
	    <table cellpadding='1' cellspacing='0' border='0' width="100%">
	    <tr  align='left'>		
		    <td colspan='2' class='contentBold'>
		        &nbsp;<div tabindex="20"><b>BUSCA DE MENSAGENS:</b></div>
		    </td>
	    </tr>		
	    <tr>
		    <td>
		        <table cellpadding='0' cellspacing='1' border='0' width="100%">
	            <tr>
			        <td class='tdHeader3'>
			            <div tabindex="21"><b>Estados:</b></div>
			    	</td>	
				</tr>	
				<tr>
  				    <td class='tdHeader4'  id="estados">
  				        <label for="cPend">
  				        
	  				        <logic:notEqual value="S" name="chkpend" scope="session" >
								<input type='checkbox' tabindex="22" name='chkpend' id="cPend"  value='S' />&nbsp;Pendente  <br>
							</logic:notEqual>
	
	  				        <logic:equal value="S" name="chkpend" scope="session" >
								<input type='checkbox' tabindex="22" name='chkpend' id="cPend"  value='S' checked="checked" />&nbsp;Pendente  <br>
							</logic:equal>
						
						</label>
						
						<label for="cAnd">
						
  				        <logic:equal value="S" name="chkand" scope="session" >
							<input type='checkbox' tabindex="23" name='chkand'  id="cAnd"  value='S' checked="checked" >&nbsp;Em andamento <br>
						</logic:equal>
						
						<logic:notEqual value="S" name="chkand" scope="session" >
							<input type='checkbox' tabindex="23" name='chkand'  id="cAnd"  value='S' >&nbsp;Em andamento <br>
						</logic:notEqual>

						</label>						
						
						<label for="cAtraso">
						
  				        <logic:notEqual value="S" name="chkatraso" scope="session" >
							<input type='checkbox' tabindex="24" name='chkatraso'  id="cAtraso" value='S' >&nbsp;Em atraso <br>
						</logic:notEqual>
						
						<logic:equal value="S" name="chkatraso" scope="session" >
							<input type='checkbox' tabindex="24" name='chkatraso'  id="cAtraso" value='S' checked="checked" >&nbsp;Em atraso <br>
						</logic:equal>

						</label>
						
						<label for="cCritico">
						
  				        <logic:notEqual value="S" name="chkcritico" scope="session" >
							<input type='checkbox' tabindex="25" name='chkcritico' id="cCritico" value='S' >&nbsp;Em atraso crítico				
						</logic:notEqual>
						
						<logic:equal value="S" name="chkcritico" scope="session" >
							<input type='checkbox' tabindex="25" name='chkcritico' id="cCritico" value='S' checked="checked" >&nbsp;Em atraso crítico				
						</logic:equal>

						</label>
						<div>&nbsp</div>						
				    </td>	
				</tr>	
			    </table>
			</td>
			<td>
			    <table cellpadding='0' cellspacing='1' border='0' width="100%">
				<tr>
						<td class='tdHeader3' colspan="2">
							<div>&nbsp</div>
						</td>
				</tr>
		        <tr>
				    <td class='tdHeader3'>
						<label for="protocolo">Protocolo: </label>
                    </td>
				    <td class='tdHeader4'>

				    <logic:present scope="session" name= "txtProtocolo">
				    	<input name='txtProtocolo' tabindex="26" size='10' class="text" maxlength="10" id="protocolo" value=<%= session.getAttribute("txtProtocolo")%> >
					</logic:present>

				    <logic:notPresent scope="session" name= "txtProtocolo">
				    	<input name='txtProtocolo' tabindex="26" size='10' class="text" maxlength="10" id="protocolo" value="">
					</logic:notPresent>

                    </td>
				</tr>	
		        <tr>
				    <td class='tdHeader3'>
						<label for="periodo">Período: </label>
                    </td>
				    <td class='tdHeader4'>

						<logic:present name="txtDatIni" scope="session" >
                        	<input name='txtDatIni' tabindex="26" size='10' class="text" maxlength="10" id="periodo" value=<%= session.getAttribute("txtDatIni")%> > 
						</logic:present>
						
						<logic:notPresent name="txtDatIni" scope="session" >
                        	<input name='txtDatIni' tabindex="26" size='10' class="text" maxlength="10" id="periodo"> 
						</logic:notPresent>
						                        
                        <label for="ate">at&eacute;  

							<logic:present name="txtDatFim" scope="session" >
	                        	<input name='txtDatFim' tabindex="27" size='10' class="text" maxlength="10" id="ate" value=<%= session.getAttribute("txtDatFim")%>>
							</logic:present>

							<logic:notPresent name="txtDatFim" scope="session" >
	                        	<input name='txtDatFim' tabindex="27" size='10' class="text" maxlength="10" id="ate">
							</logic:notPresent>
                        
                        </label>
                    </td>
				</tr>	
				<tr>
				    <td class='tdHeader3'><label for="ptipomsg">Tipo de Mensagem:</label> </td>						
				    <td class='tdHeader4'>	
				    	
				    	<logic:present name="txtTipoMsg" scope="session" >
	                        <html:select property="txtTipoMsg" tabindex="28" styleClass="text" styleId="ptipomsg" value='<%=session.getAttribute("txtTipoMsg").toString()%>'>
                            <html:option value="0">Todos</html:option>
    	                    <html:options collection="lstTipoMsg" property="id" labelProperty="descricao" />    
        	                </html:select>
                        </logic:present>
			
				    	<logic:notPresent name="txtTipoMsg" scope="session">
	                        <html:select property="txtTipoMsg" tabindex="28" styleClass="text" styleId="ptipomsg" >
                            <html:option value="0">Todos</html:option>
    	                    <html:options collection="lstTipoMsg" property="id" labelProperty="descricao" />    
        	                </html:select>
                        </logic:notPresent>
				    
				    </td>
				</tr>	
				<tr>
				    <td class='tdHeader3'><label for="passunto">Assunto:</label> </td>						
				    <td class='tdHeader4'>
				    
				    <logic:present name="txtAssunto" scope="session">
                        <html:select property="txtAssunto" tabindex="29" styleClass="text" styleId="passunto" value='<%=session.getAttribute("txtAssunto").toString()%>' >
	                        <html:option value="0">Todos</html:option>
	                        <html:options collection="lstAssuntos" property="id" labelProperty="descricao"/>    
                        </html:select>
                    </logic:present>    

				    <logic:notPresent name="txtAssunto" scope="session">
                        <html:select property="txtAssunto" tabindex="29" styleClass="text" styleId="passunto">
	                        <html:option value="0">Todos</html:option>
	                        <html:options collection="lstAssuntos" property="id" labelProperty="descricao"/>    
                        </html:select>
                    </logic:notPresent>    
 				    </td>
				</tr>	
			    </table>
		    </td>
	 	</tr>		
	    <tr>
			<td colspan='2' align='middle' class='tdHeader1'>
                <label for="consultar mensagens"> 
			    <input type='button' tabindex="31" value='Buscar' name='buscar' class='button' onClick="javascript:validaForm();"  title='Consultar Mensagens'>
                </label> 
			</td>
		</tr>		
		</table>	    
	</td>
</tr>

</table>

	<logic:notPresent name="ordenacao" scope="session">
		<INPUT TYPE="hidden" NAME="ordenacao" VALUE="dataAcionamento">
	</logic:notPresent>
	
	<logic:present name="ordenacao" scope="session">
		<INPUT TYPE="hidden" NAME="ordenacao" VALUE=<%= session.getAttribute("ordenacao") %>>
	</logic:present>

</div>

<table cellpadding='2' cellspacing='0' border='0' width='100%'>
	<tr>
		<td>
			 
			<iframe src='_blank.htm' id="listaMsgPorRespons" name="listaMsgPorRespons"
			        longdesc='Lista de Mensagens por Responsabilidade' frameborder='0' width='100%' height='0' >
			</iframe>
			
			<% //include file="ListaMsgPorRespons.jsp"%>
		</td>
	</tr>
</table>
<br>
<table cellpadding='2' cellspacing='0' border='0' width='100%'>
	<tr>
		<td>
			<iframe src='_blank.htm' id="detalheAcionamentoResposta" name="detalheAcionamentoResposta"
			        longdesc='Lista de Detalhe de Mensagem por Responsabilidade' frameborder='0' width='100%' height='0'>
			</iframe>
		</td>
	</tr>
</table>
<hr>
<p class="voltar"> 
	<a title="voltar para página anterior" href="javascript:history.go(-1)" >voltar</a>
</p>

</html:form>

</body>
</html:html>
