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

<%@ taglib uri="/tags/struts-logic" prefix="logic"%>
<%@ taglib uri="/tags/struts-bean"  prefix="bean" %>
<%@ taglib uri="/tags/struts-html"  prefix="html" %>

<html:html lang="pt">

	<head>
		<html:base />
		<meta http-equiv='Content-Type' content='text/html; charset=iso-8859-1'>
		<title>Listar Acionamento para Resposta</title>
		<script language="JavaScript" src="../js/util.js"></script>

		<script language="JavaScript">
   <!-- // 

   function setaFocoInicio()
   {
       var focusControl = document.getElementById( "areaErro" );
       focusControl.focus();
   }

	function validaForm() {

		var innerHtmlMsgErros  = '';

		if ( document.forms[0].numeroProtocolo.value != null &&
		     document.forms[0].numeroProtocolo.value != '' )
		{
			innerHtmlMsgErros += CriticaNumero( document.forms[0].numeroProtocolo, 6, 9, 0, 'Protocolo' );
		}  	

		if ( document.forms[0].numeroProtocolo.value == null ||
			 document.forms[0].numeroProtocolo.value == "" ) {

			if ( document.forms[0].meioEnvioResposta.value == 0 )
			{
				innerHtmlMsgErros += formataErro( 'Informe o Meio de Envio da Resposta' );
			}
		
			if (( document.forms[0].enviado.checked    == false ) &&
			    ( document.forms[0].naoEnviado.checked == false ))
			{
				innerHtmlMsgErros += formataErro( 'Informe a situa��o a ser consultada' );
			}
		}
	 
		if( innerHtmlMsgErros != '')
		{
			abreAlerta( innerHtmlMsgErros );
		}
		else
		{
			document.forms[0].submit();
		}
	}
   
	function AtualizarAcionamento(){

		var ok = false;
		var innerHtmlErroIni = '<h2 id="erro" tabindex="2">Erro</h2><ul>';
		var innerHtmlErroFim = '</ul>';
		var innerHtmlMsgErros = '';

		try {			

			var str = window.frames[0].document.forms[0].atualiza[0] + "";
			if ( str.indexOf("[object") >= 0 ) {

				var size = window.frames[0].document.forms[0].atualiza.length;
				var elem = window.frames[0].document.forms[0].atualiza;
				for ( i=0; i<size; i++ ) { 
					if( elem[i].checked ) {
						ok = true;
						break;
					}
				}
			} else {
				ok = window.frames[0].document.forms[0].atualiza.checked;
			}
			  
			if (ok) {
				document.getElementById("areaErro").innerHTML = '';
				document.getElementById("areaErro").style.visibility = 'hidden';
			
				window.frames[0].document.forms[0].submit();
				
				return true;
			}

			innerHtmlMsgErros += '<li tabindex="3">' + 'selecione um acionamento.</li>';
			document.getElementById("areaErro").innerHTML = innerHtmlErroIni + innerHtmlMsgErros + innerHtmlErroFim;
			document.getElementById("areaErro").style.visibility = 'visible';
			setaFocoInicio();

			return false;
			
		} catch(e) {
		}

		return true;
    }
   
   // -->

// Seta o foco ao carregar a tela
	function setaFocoOnLoad(){
		try {
			document.getElementById("MsgInicial").focus();
		} catch(e) {}
	}

</script> 

</head>

	<link rel='stylesheet'  media='all' href='../<bean:write name="_LAYOUT_" property="esquemaCores"/>/estilo_conteudo.css' type='text/css'>
	<link rel='stylesheet' type='text/css' media='print' href='../estilo_print.css'>

	<body onload="setaFocoOnLoad();">

		<div id="content">

			<h1 tabindex="1" id="MsgInicial" title="lista acionamento para resposta">
				Lista Acionamento para Resposta
			</h1>

			<span id="areaErro" tabindex="2" style="visibility:hidden">
			</span>

			<logic:messagesPresent>
				<h2 tabindex="2"  title="erro" id="error">Erro</h2>
				<ul>
					<html:messages id="message" message="false">
						<li tabindex="3" title="<%= message %>"><%= message %></li>
					</html:messages>
				</ul>

				<script type="text/javascript" language="JavaScript">
					<!-- //
					try {
						var focusControl = document.all["titulo"];
						focusControl.focus();
					} catch(e) {}
					// -->
				</script>

			</logic:messagesPresent>

			<html:form action="/ListarAcionamentoResposta" method="post" target="listaAcionamentoResposta">

				<p tabindex="5" Align="LEFT" title="Informe os par�metros para consulta">
					Informe os par�metros para consulta.
				</p>

				<table cellpadding='2' cellspacing='0' border='0' width='100%'>
			    	<tr>
			        	<td>
            				<table cellpadding='2' cellspacing='1' border='0' height="27" width='100%'>
					        	<tr>
					            	<td class='tdHeader3'>&nbsp;
					            		<label for="protocolo" accesskey="T">N&uacute;mero do protocolo:</label>
						            </td>
						   		    <td class='tdHeader4'>
								        &nbsp;<input type='text' tabindex="6" size="15" name='numeroProtocolo' class='text' maxlength='9' id="protocolo">
								        &nbsp;&nbsp;
								    </td>
						        </tr>
					    	</table>
				        </td>
				        <td>
						    <table cellpadding='2' cellspacing='1' border='0' height="27" width='100%'>
						        <tr>
	            					<td class='tdHeader3'>&nbsp;
	            						<label for="menvio" accesskey="A">Meio de envio:
	            						</label>
	            					</td>
							    	<td class='tdHeader4'>
								    	&nbsp;
							            <html:select property="meioEnvioResposta" tabindex="7" styleClass="text" styleId="menvio">
								            <html:option value="0">Selecione</html:option>
											<html:options collection="lstMeioEnvioResposta" property="id" labelProperty="descricao"/>
							            </html:select>
							            &nbsp;&nbsp;	                   	    
								    </td>
						        </tr>
					    	</table>
				        </td>
				        <td>
				            <table cellpadding='2' cellspacing='1' border='0' height="27" width='100%'>
						        <tr>
			    	                <td class='tdHeader3'>&nbsp;
			        	            	<label for="psituacao" accesskey="S">Situa��o:</label>
			            	        </td>
					   			    <td class='tdHeader4'>
							    	    &nbsp;
                        				<label for="enviado"> 
			    	                    	<input type='checkbox' tabindex="8" name='enviado' id="enviado" value="S">
					                        Enviados 
    	                			    </label> 
				                        <label for="nenviado">
            					            <input type='checkbox' tabindex="9" name='naoEnviado' id="nenviado" value="S" CHECKED>
											N�o enviados
			        	                </label>
								    </td>				
					        	</tr>
						    </table>
				        </td>
			    	</tr>
			    	<tr>
						<td colspan='3' align='middle' class='tdHeader1'>
				            <label for="consultar andamento de solu��o"> 
						    <input type='button' tabindex="10" value='Buscar' name='buscar' class='button' onClick="javascript:validaForm();"  title='Clique para efetuar a consulta'>
				            </label> 
						</td>
					</tr>							    	
				</table>
				<br>
				<table cellpadding='2' cellspacing='0' border='0' width='100%'>
					<tr>
						<td>
							<iframe src='_blank.htm' id="listaAcionamentoResposta" name="listaAcionamentoResposta"
							        longdesc='Lista de Acionamentos' frameborder='0' width='100%' height='0'>
							</iframe>
						</td>
					</tr>
				</table>
				<hr>
				<p class="voltar"> 
					<a title="voltar para p�gina anterior" href="javascript:history.go(-1)" >voltar</a>
				</p>
			</html:form>
		</div>
	</body>
</html:html>
