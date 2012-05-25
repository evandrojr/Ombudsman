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

<%@ taglib uri="/tags/struts-logic" prefix="logic" %>
<%@ taglib uri="/tags/struts-bean" prefix="bean"%>
<%@ taglib uri="/tags/struts-html" prefix="html"%>

<!-- Biblioteca javascript  -->
<script language="JavaScript" src="../js/util.js"></script>

<html:html lang="pt">

<head>
	<title>Redirecionar Mensagem</title>
	<html:base />
	<meta http-equiv="content-type" content="text/html;charset=iso-8859-1" />
	<meta name="Keywords" content="acionamento, redirecionar, acessibilidade, guia, serpro, inclusão, deficiência, recomendações, necessidade especial, ouvidoria" />

<!-- Estilos -->

	<link rel='stylesheet'  media='all' href='../<bean:write name="_LAYOUT_" property="esquemaCores"/>/estilo_conteudo_pop.css' type='text/css'>
	<link rel="stylesheet" type="text/css" media="print" href="../estilo_print.css">

<!-- Includes -->

	<script src="../js/util.js" type="text/javascript"></script>
<script language='javascript'>
			
			function habilita(){

				try{
					<logic:present name="listaAssunto" scope="request">
							document.getElementById('assunto').focus();
					</logic:present>
				} catch(err){}

				if(document.forms[0].tipoRedirecionamento[2].checked){
					try{
						document.getElementById( 'subOrgao' ).style.display='';
						document.getElementById( 'assunto' ).style.display='';
						document.getElementById( 'localidadeOcorrencia' ).style.display='';
						document.getElementById( 'consultor' ).style.display='none';
						document.forms[0].subOrgao.disabled=false;
						document.forms[0].assunto.disabled=false;
						document.forms[0].localidadeOcorrencia.disabled=false;
						document.forms[0].consultor.disabled=true;
						window.innerHeight = 360;
					} catch(err){}
				}else if (document.forms[0].tipoRedirecionamento[1].checked){
					try{
						document.getElementById( 'subOrgao' ).style.display='';
						document.getElementById( 'assunto' ).style.display='';
						document.getElementById( 'localidadeOcorrencia' ).style.display='';
						document.getElementById( 'consultor' ).style.display='';
						document.forms[0].subOrgao.disabled=false;
						document.forms[0].assunto.disabled=false;
						document.forms[0].localidadeOcorrencia.disabled=false;
						document.forms[0].consultor.disabled=false;
						window.innerHeight = 380;
					} catch(err){}
				
				}else{
					try{
						document.getElementById( 'subOrgao').style.display='none';
						document.getElementById( 'assunto' ).style.display='none';
						document.getElementById( 'localidadeOcorrencia' ).style.display='none';
						document.getElementById( 'consultor' ).style.display='none';
						document.forms[0].subOrgao.disabled=true;
						document.forms[0].assunto.disabled=true;
						document.forms[0].localidadeOcorrencia.disabled=true;
						document.forms[0].consultor.disabled=true;
						window.innerHeight = 320;
						
					} catch(err){}
				}
			}
			
			function exibeListas(subOrgao){
				document.body.style.cursor='wait';
				document.forms[0].action = '../../andamento/RedirecionarMensagem.do?idAcionamento=' + <%=request.getParameter("idAcionamento")%>;
				document.forms[0].submit();
			}
			
			// função para a exibição dos funcionarios
			function exibeConsultor(localidadeOcorrencia){
				document.body.style.cursor='wait';
				document.forms[0].action = '../../andamento/RedirecionarMensagem.do?idAcionamento=' + <%=request.getParameter("idAcionamento")%>;
				document.forms[0].submit();
			}
			
			function retornaStringMensagemErro(campo){
				var str;
				str  = '<li tabindex="3">';
				str += campo;
				str += ' deve ser preenchido.</li>';
				return str;
			}
			
			function redirecionar(){
				var innerHtmlErroIni = '<ul>';
				var innerHtmlErroFim = '</ul>';
				var innerHtmlMsgErros = '';

				innerHtmlMsgErros += CriticaString( document.forms[0].titulo, 3, 150, 'Título' );

				if ( document.forms[0].tipoRedirecionamento[1].checked )
				{
					if( document.forms[0].subOrgao.value == '0' )
					{
						innerHtmlMsgErros += retornaStringMensagemErro('Sub-Órgão');
					}
					try{
						if(document.forms[0].assunto.value=='0'){
							innerHtmlMsgErros += retornaStringMensagemErro('Assunto');
						}
						if(document.forms[0].localidadeOcorrencia.value=='0'){
							innerHtmlMsgErros += retornaStringMensagemErro('Localidade de Ocorrencia' );
						}
						if(document.forms[0].consultor.value=='0'){
							innerHtmlMsgErros += retornaStringMensagemErro('Consultor' );
						}
					} catch(err){}
				}
				
				if ( document.forms[0].tipoRedirecionamento[2].checked )
				{
					if( document.forms[0].subOrgao.value == '0' )
					{
						innerHtmlMsgErros += retornaStringMensagemErro('Sub-Órgão');
					}
					try{
						if(document.forms[0].assunto.value=='0'){
							innerHtmlMsgErros += retornaStringMensagemErro('Assunto');
						}
						if(document.forms[0].localidadeOcorrencia.value=='0'){
							innerHtmlMsgErros += retornaStringMensagemErro('Localidade de Ocorrencia' );
						}
					} catch(err){}
				}

				if ( (document.forms[0].tipoRedirecionamento[0].checked == false) && 
				     (document.forms[0].tipoRedirecionamento[1].checked == false) &&
					 (document.forms[0].tipoRedirecionamento[2].checked == false) ) 
				{
						innerHtmlMsgErros += '<li tabindex="3">';
						innerHtmlMsgErros += 'Informe o destino do redirecionamento';
						innerHtmlMsgErros += '</li>';	
				}
				
				if( innerHtmlMsgErros == "" ){
					abreConfirmacao("enviar");
				} else {
					abreAlerta(innerHtmlErroIni + innerHtmlMsgErros + innerHtmlErroFim);
				}
			}

			function enviar(){
				document.forms[0].action = '../../andamento/ConfirmaRedirecionarMensagem.do?idAcionamento=' + <%=request.getParameter("idAcionamento")%>;
				document.forms[0].submit();
			}
			
			function setaFocoInicial(){
				document.getElementById('titulo').focus();
			}
			
			function checaSubmit(){
				<logic:present name="semEmail" scope="request">
					abreAlertaGeral("Aviso","O novo responsável pelo acionamento não possui e-mail cadastrado.\n"+
							   "Para que ele receba notificações sobre o acionamento redirecionado \n"+ 
							   "contacte o administrador do sistema.");
				</logic:present>
				
				<logic:present name="fezSubmit" scope="request">
					// Trata Href
					var basehref = location.href;
					var i = basehref.lastIndexOf('/');
					basehref = basehref.substring(0, i + 1);
					window.opener.document.forms[0].target="conteudo"
					window.opener.document.forms[0].action=basehref + 'ConsultaMsgPorRespons.do'
					window.opener.document.forms[0].submit();
					window.close();
				</logic:present>

			}
			
	</script>
	

</head>

<body onLoad="checaSubmit();habilita();setaFocoInicial();">
	
	<div id="content"> 
		<html:form action="/ConfirmaRedirecionarMensagem"  method="post" >
			<h1 id="titulo" tabindex="1">Redirecionar Mensagens</h1>
			<p tabindex="5" Align="LEFT">
				Os campos indicados com asteriscos
				<b class="boldCor">*</b>
				são obrigatórios.
			</p>
			<table cellpadding='2' cellspacing='1' border='0' width="100%">
				<tr>
					<td class='tdHeader3' rowspan="3" width="65%">
						<label tabindex="5">
							Redirecionar para:
							<b class="boldCor">*</b>
						</label>
					</td>
					<td class='tdHeader4'>&nbsp;
						<label>
							<html:radio property='tipoRedirecionamento' tabindex="6" value="ouvidor" onclick="habilita(this.value);">
								Ouvidor
							</html:radio>	
						</label>
					</td>				
				</tr>
				<tr>
					<td class='tdHeader4'>&nbsp;
						<label>
							<html:radio property='tipoRedirecionamento' tabindex="7" value="consultor" onclick="habilita(this.value);">
									Consultor
							</html:radio>	
						</label>
					</td>				
				</tr>
				
				<tr>
					<td class='tdHeader4'>&nbsp;
						<label>
							<html:radio property='tipoRedirecionamento' tabindex="8" value="outro" onclick="habilita(this.value);">
									Outro membro da Ouvidoria
							</html:radio>
						</label>
					</td>				
				</tr>
				<tr id="subOrgao" style="display:none;">
					<td class="tdHeader3" headers="titSubOrgao">
						<label for="SubOrgão" >
							Sub-Órgão:
							<b class="boldCor">*</b>
						</label>
					</td>
					<td class='tdHeader4'>
						<html:select property="subOrgao" tabindex="9" styleClass="text" styleId="SubOrgão" disabled="true" onchange="exibeListas(this.value);">
	             			<html:option value="0">Selecione</html:option>
							<html:options collection="listaSubOrgaos" property="id" labelProperty="descricao"/>    
		             	</html:select>
					</td>
				</tr>
        		<tr id="assunto" style="display:none;">
					<td class="tdHeader3" >
						<label for="assunto" >
							Assunto:
							<b class="boldCor">*</b>
						</label>
					</td>

					<td class="tdHeader4"> 
						<logic:present name="listaAssunto" scope="request">
							<html:select property="assunto" tabindex="10" styleClass="text" styleId="SubOrgão" onchange="exibeConsultor(this.value);">
									<html:option value="0">Selecione</html:option>
									<html:options collection="listaAssunto" property="id" labelProperty="descricao"/>    
							</html:select>
						</logic:present>
						<logic:notPresent name="listaAssunto" scope="request">
							<select name="assunto" id="assunto">
								<option value="0">Selecione </option>
							</select>
						</logic:notPresent>									
					 </td>
		        </tr>					

		        <tr id="localidadeOcorrencia" style="display:none;">
					<td class="tdHeader3" >
						<label for="localidadeOcorrencia" >Localidade da Ocorrência:
							<b class="boldCor">*</b>
						</label>
					</td>

					<td class="tdHeader4"> 
						<logic:present name="listaLocalidadeOcorrencia" scope="request">
							<html:select property="localidadeOcorrencia" tabindex="11" styleClass="text" styleId="SubOrgão" onchange="exibeConsultor(this.value);">
								<html:option value="0">Selecione</html:option>
								<html:options collection="listaLocalidadeOcorrencia" property="id" labelProperty="descricao"/>    
							</html:select>
						</logic:present>			
						
						<logic:notPresent name="listaLocalidadeOcorrencia" scope="request">
							<select name="localidadeOcorrencia" id="localidadeOcorrencia">
								<option value="0">Selecione </option>
							</select>
						</logic:notPresent>									
					</td>
        		</tr>

				<!-- Escolha do funcionário consultor -->
				<tr id="consultor" style="display:none;">
					<td class="tdHeader3" >
						<label for="consultor" >Consultor:
							<b class="boldCor">*</b>
						</label>
					</td>

					
					<td class="tdHeader4"> 

						<logic:present name="consultor" scope="request">
							<html:select property="consultor" tabindex="11" styleClass="text" styleId="SubOrgão">
								<html:option value="0">Selecione</html:option>
								<html:options collection="consultor" property="id" labelProperty="nome"/>    
							</html:select>
						</logic:present>		
							
						<logic:notPresent name="consultor" scope="request">
							<select name="consultor" id="consultor">
								<option value="0">Selecione </option>
							</select>
						</logic:notPresent>									
						
					</td>
        		</tr>

				<!-- Título da Mensagem -->

				<tr>
					<td class='tdHeader3'>
						<div tabindex="12">Título:&nbsp;<b class="boldCor">*</b></div>
					</td>					
					<td class='tdHeader4'>
			    		<div tabindex="13">
    				    	<logic:notEmpty name="titulo">
								<input	name='titulo' tabindex="14" class='text' size='56'
										value="<%= request.getAttribute("titulo") %>" maxlength="150">
	    		            </logic:notEmpty>				

    		    		    <logic:empty name="titulo">
								<input name='titulo' tabindex="14" class='text' size='56' maxlength="150">
							</logic:empty>
					    </div>
					</td>		
				</tr>

				<tr>
					<td class='tdHeader3'>
						<div tabindex="13">Despacho:</div>
					</td>
					<td class='tdHeader4'>
						<html:textarea styleId="despacho" style="width: 300px; height: 230px" property="despacho" cols="32" tabindex="15"  onkeyup="textCounter(this, document.getElementById('contador'), 1000);" />
						<div id="contador">1000 caracteres restantes</div>
					</td>				
				</tr>
				<tr>
					<td class='tdHeader1' align='middle' colspan='2'>
						<input	type='button' class='button' value='Redirecionar' tabindex='15'
								onClick='redirecionar();' title='Redirecionar'>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input	type='button' class='button' value='Fechar' tabindex='16'
								onClick='window.close();' title="Fechar Janela">
					</td>
				</tr>
			</table>
		</html:form>
	</div>
</body>

</html:html>

