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
				innerHtmlMsgErros += formataErro( 'Informe a situação a ser consultada' );
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

				<p tabindex="5" Align="LEFT" title="Informe os parâmetros para consulta">
					Informe os parâmetros para consulta.
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
			        	            	<label for="psituacao" accesskey="S">Situação:</label>
			            	        </td>
					   			    <td class='tdHeader4'>
							    	    &nbsp;
                        				<label for="enviado"> 
			    	                    	<input type='checkbox' tabindex="8" name='enviado' id="enviado" value="S">
					                        Enviados 
    	                			    </label> 
				                        <label for="nenviado">
            					            <input type='checkbox' tabindex="9" name='naoEnviado' id="nenviado" value="S" CHECKED>
											Não enviados
			        	                </label>
								    </td>				
					        	</tr>
						    </table>
				        </td>
			    	</tr>
			    	<tr>
						<td colspan='3' align='middle' class='tdHeader1'>
				            <label for="consultar andamento de solução"> 
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
					<a title="voltar para página anterior" href="javascript:history.go(-1)" >voltar</a>
				</p>
			</html:form>
		</div>
	</body>
</html:html>
