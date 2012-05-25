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

<%@ taglib uri="/tags/struts-logic" prefix="logic"%>
<%@ taglib uri="/tags/struts-bean" prefix="bean"%>
<%@ taglib uri="/tags/struts-html" prefix="html"%>
<%@ page import="java.util.Map"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.Set"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="br.gov.serpro.ouvidoria.model.Assunto"%>
<%@ page import="br.gov.serpro.ouvidoria.model.LocalidadeOcorrencia"%>
<%@ taglib uri="http://jakarta.apache.org/taglibs/log-1.0" prefix="log"%>

<html:html lang="pt">
<head>
	<html:base />
	<title>FORMULÁRIO DE ACIONAMENTO À OUVIDORIA</title>
	<meta http-equiv="content-type" content="text/html;charset=iso-8859-1" />
	<meta name="Keywords" content="acessibilidade, guia, serpro, inclusão, deficiência, recomendações, necessidade especial, ouvidoria" />
	<link rel="stylesheet" media="all" href="../<bean:write name="_LAYOUT_" property="esquemaCores"/>/estilo_conteudo.css" type="text/css">

	<script type="text/javascript" charset='iso-8859-1'>
		var emw_userLogged = false;
		<logic:present name="usuarioLogado" scope="request">
			emw_userLogged = true;
		</logic:present>
		
	</script>

	<script src="../js/util.js" type="text/javascript"></script>
	<script src="../js/acionamento.js" type="text/javascript"></script>
	<script language="JavaScript">
	
	var arrayAssuntos = new Array();

	function gerenciaExibicao(document){
	
		exibeIdentificacao(document,document.forms[0].tipoAcionador.value);		
		exibeResposta(document,document.forms[0].meioEnvioResposta.value, document.forms[0].tipoAcionador.value);
		exibeDadosRecuperacao(document);
		exibeMensagem(document);
		preencheLocalidadeOcorrencia(document,document.forms[0].assunto.value,arrayAssuntos);
		<logic:equal name="flagPesquisaFuncionario" scope="request" value="true">
				document.getElementById('sexo').focus();
		</logic:equal>
		
		// Guarda matrícula informada		
		document.forms[0].MatriculaAnterior.value = document.forms[0].matriculaAcionadorFuncionario.value;					
		
		// Caso  tenha sido informado previamente o arquivo anexo, informa-se ao acionador
		 var innerHtmlMsgErros = '';
		
		<logic:messagesPresent>		
			<html:messages id="message" message="false">
				innerHtmlMsgErros += retornaStringMensagemErroGeral('<%= message %>');
			</html:messages>
		</logic:messagesPresent>	 		 
		 
		<logic:messagesNotPresent>
			<logic:equal name="msgDigitalizadaSelecionada" scope="request" value="true">
				innerHtmlMsgErros += retornaStringMensagemErroGeral('Indique novamente a mensagem digitalizada a ser anexada.  ' );			
			</logic:equal>   		
			
			<logic:equal name="anexoSelecionado" scope="request" value="true">
				innerHtmlMsgErros += retornaStringMensagemErroGeral('Indique novamente o arquivo a ser anexado.  ' );			
				document.getElementById('arquivoAnexo').focus();
			</logic:equal>   		
		</logic:messagesNotPresent>
		
		<logic:notEqual name="resultadoBuscaFunc" scope="request" value="">
			innerHtmlMsgErros += retornaStringMensagemErroGeral('<%=request.getAttribute("resultadoBuscaFunc")%>' );			
		</logic:notEqual>   		
		
		if (innerHtmlMsgErros != "") {
			abreAlertaGeral("Atenção", innerHtmlMsgErros);
		}
		
		// Se a abertura da tela, coloca-se o meio de resposta como internet por default
		if (document.forms[0].tipoMensagem.value == "0") {
			document.forms[0].meioEnvioResposta.value = "1";
			exibeResposta(document,document.forms[0].meioEnvioResposta.value, document.forms[0].tipoAcionador.value);
		}
		
		if (document.forms[0].codigoPaisTelefone.value == "") {
			document.forms[0].codigoPaisTelefone.value = "55";
		}
		if (document.forms[0].codigoPaisFax.value == "") {
			document.forms[0].codigoPaisFax.value = "55";
		}		
		
		// Atualiza o contador, caso a mensagem já esteja preenchida
		textCounter(document.forms[0].mensagem, document.getElementById('contador'),1000);
	}

		//Localidade de ocorrência sem reload
		<%
			Map hashAssuntos = (Map)request.getAttribute("hashAssunto");		
			Set assuntos = hashAssuntos.keySet();
			Iterator iter = assuntos.iterator();
			Assunto assunto = null;
		%>	
			i = 0;
		<%
			while (iter.hasNext()) {
				assunto = (Assunto) iter.next();
		%>
            	arrayAssuntos[i] = new Array();
            	arrayAssuntos[i][0] = <%=assunto.getId()%>;
            	arrayAssuntos[i][1] = new Array();
        <%
            	List localidades = (List)hashAssuntos.get(assunto);
            	Iterator iter2 = localidades.iterator();
        %>    	
            	j=0;
        <%    	
            	while (iter2.hasNext()) {
	            	LocalidadeOcorrencia local = (LocalidadeOcorrencia) iter2.next();
	    %>
	            	arrayAssuntos[i][1][j] = new Array();
	            	arrayAssuntos[i][1][j][0] = "<%= local.getId()%>";
	            	arrayAssuntos[i][1][j][1] = "<%= local.getDescricao()%>";
	             j+=1;	
        <%
            	}
        %>
            i+=1;	
        <%
            }        
		%>

	function buscaFuncionario(){
		<% if ( "intranet".equals( request.getSession().getAttribute(br.gov.serpro.ouvidoria.util.Constants.SS_ORIGEM) ) ) { %>
			<logic:equal name="flagPermitePesquisaFuncionario" scope="request" value="true">			
				if ( (document.forms[0].matriculaAcionadorFuncionario.value != '') &&
	                 (document.forms[0].matriculaAcionadorFuncionario.value != 
					 document.forms[0].MatriculaAnterior.value ) )		{								

					
					document.getElementById('celulaMat2').colSpan='1';								
					//document.getElementById('celulaAguardeMat').style.display='';					
					
					document.forms[0].action = '../../acionamento/EnviarMensagemWeb.do';
					document.forms[0].submit();		
	
					document.getElementById('AguardeMat').style.display='';
					document.getElementById('AguardeMat').focus();
				}
			</logic:equal>
		<% } %>
	}

	
	function preencheLocalidadeOcorrencia(document,assunto,arrayAssuntos){
		while (document.forms[0].localidadeOcorrencia.options.length>0){
			document.forms[0].localidadeOcorrencia.options[0] = null;
		}
		
		document.forms[0].localidadeOcorrencia.options[0] = new Option("Selecione","0");
		for (k=0; k!= arrayAssuntos.length;k++){
			if (arrayAssuntos[k][0] == assunto){
				if (arrayAssuntos[k][1].length > 0) {
					for (z=0;z< arrayAssuntos[k][1].length;z++){
						document.forms[0].localidadeOcorrencia.options[z+1] = new Option(arrayAssuntos[k][1][z][1],arrayAssuntos[k][1][z][0]);
						if (document.forms[0].localidadeOcorrencia.options[z+1].value == '<bean:write name="CadastrarAcionamentoForm" property="localidadeOcorrencia"/>'){
							document.forms[0].localidadeOcorrencia.selectedIndex=z+1;
						}
					}
				} 
			}
		}	
		
		for (i=0; i!= document.forms[0].localidadeOcorrencia.options.length; i++){
			if (document.forms[0].localidadeOcorrencia.options[i].value == document.forms[0].localidadeOcorrencia.value){
				document.forms[0].localidadeOcorrencia.options[i].selectedIndex = i;
				break;
			} 
		}
		// Só irá mostrar a combo de localidades caso haja mais de 1 localidade para o assunto
		if ((assunto != 0)&&(document.forms[0].localidadeOcorrencia.options.length > 2)){
			document.getElementById('linhaLocOcorr').style.display='';
		} else {			
			document.forms[0].localidadeOcorrencia.selectedIndex =1;
			document.getElementById('linhaLocOcorr').style.display='none';
		}
		
	}

	function reload(document){
		gerenciaExibicao(document);

		// Limpa 
		document.getElementById('linhaLocOcorr').style.display='none';
		document.getElementById('linhaPergunta').style.display='none';		
		document.getElementById('linhaResposta').style.display='none';						
		document.forms[0].mensagem.value = "";
		textCounter(document.forms[0].mensagem, document.getElementById('contador'),1000);		        
		
	}	
	
	</script>
</head>

<body onLoad="gerenciaExibicao(document);">
			 <!-- DIV 	id = "janela"    
		 		style="position: absolute;
						left: 50%;
					     top: 50%;
					     margin-left: -100px;
					     margin-top: -100px;
					     width: 200px;
					     height: 200px;
					     border: 1px solid black;">
					 								
			<iframe id="iFrameMenu" frameborder="0" scrolling="no" src="www.diariodopara.com.br" name="iFrameMenu" style="visibility: visible; position: absolute; z-index: 1002; top:200px; left:200px; width: 500px; height: 500px; "></iframe-->
		<!-- /DIV -->
	
	<div id="content">
		<h1 id="titulo" tabindex="1">
			FALE COM A OUVIDORIA
		</h1>
		<table cellspacing="0" cellpadding="0" border="0" WIDTH="100%" ALIGN="RIGHT">
			<tr>
				<td ALIGN="RIGHT">
					<font class="obrigatorio" tabindex="2"> <%=request.getAttribute("dataAtual")%> </font>
				</td>
			</tr>
		</table>

		<!--
		<logic:messagesPresent>		
			<script type="text/javascript" charset='iso-8859-1'>
				var innerHtmlMsgErros = '';
				
				<html:messages id="message" message="false">
					innerHtmlMsgErros += retornaStringMensagemErroGeral('<%-- message --%>');
				</html:messages>

				<logic:notEqual name="dscArqAnexo" scope="request" value="">
				    innerHtmlMsgErros += retornaStringMensagemErroGeral('Indique novamente o arquivo a ser anexado. ' + '<%=request.getAttribute("dscArqAnexo")%>');
				</logic:notEqual>    
				<logic:notEqual name="dscMsgDigitalizada" scope="request" value="">
					innerHtmlMsgErros += retornaStringMensagemErroGeral('Indique novamente a mensagem digitalizada a ser anexada. ' + '<%=request.getAttribute("dscMsgDigitalizada")%>');
				</logic:notEqual>

				abreAlerta(innerHtmlMsgErros);
			</script>
		</logic:messagesPresent>	
		<logic:messagesNotPresent>
			<script type="text/javascript" charset='iso-8859-1'>
				var innerHtmlMsgErros = '';
				var exibirMensagem = 0;
				<logic:notEqual name="dscArqAnexo" scope="request" value="">
				    innerHtmlMsgErros += retornaStringMensagemErroGeral('Indique novamente o arquivo a ser anexado. ' + '<%=request.getAttribute("dscArqAnexo")%>');
				    exibirMensagem = 1;
				</logic:notEqual>    
				<logic:notEqual name="dscMsgDigitalizada" scope="request" value="">
					innerHtmlMsgErros += retornaStringMensagemErroGeral('Indique novamente a mensagem digitalizada a ser anexada. ' + '<%=request.getAttribute("dscMsgDigitalizada")%>');
					exibirMensagem = 1;
				</logic:notEqual>
				if (exibirMensagem == 1){
					abreAlerta(innerHtmlMsgErros);		
				}	
			</script>	
		</logic:messagesNotPresent>
		-->

		<logic:present name="textoApresentacaoFormularioAcionamento" scope="request">
			<br>
			<label ALIGN="JUSTIFY" style="font-size:75%;" tabindex="4">
				<%=request.getAttribute("textoApresentacaoFormularioAcionamento")%>
			</label>
			<br>
		</logic:present>

		<label tabindex="5">
			<font class="asterisco">*</font> <font class="obrigatorio">campos com preenchimento obrigatório</font>
		</label>

		<html:form action="/CadastrarAcionamento" target="_self" method="post" enctype="multipart/form-data">
			<logic:present name="tamanhoArquivoAnexo" scope="request">
				<input type="hidden" name="tamanhoArquivoAnexo" value="<%= request.getAttribute("tamanhoArquivoAnexo") %>">
			</logic:present>
			<logic:present name="tamanhoMensagemDigitalizada" scope="request">
				<input type="hidden" name="tamanhoMensagemDigitalizada" value="<%= request.getAttribute("tamanhoMensagemDigitalizada") %>">
			</logic:present>


			<table cellpadding="2" cellspacing="1" border="0" align="center" width="100%">

				<TR>
					<td colspan="4" class="contentBold" id="tit" title="Sua mensagem">
						<label tabindex="6">
							SUA MENSAGEM
							</lanexoabel>
					</td>
				</TR>

				<TR>
					<td class="tdHeader3" id="maenome" width="150" title="Tipo da Mensagem">
						<label for="tipoMensagem">
							Tipo da Mensagem: <font class="asterisco">*</font>
						</label>
					</td>

					<td class="asteristico" colspan=3>
						<html:select property="tipoMensagem" tabindex="7" style="position:relative; z-index:0" styleClass="text" styleId="tipoMensagem">
							<html:option value="0">Selecione</html:option>
							<html:options collection="listaTipoMensagem" property="id" labelProperty="descricao" />
						</html:select>


					</td>
				</TR>
				<tr>
					<td class="tdHeader3" width="150">
						<label for="assunto">
							Assunto da Mensagem: <font class="asterisco">*</font>
						</label>
					</td>
					<td class="asteristico" colspan="3">
						<html:select property="assunto"  tabindex="8" styleClass="text" styleId="assunto" onchange="preencheLocalidadeOcorrencia(document,this.value,arrayAssuntos);">
							<html:option value="0">Selecione</html:option>
							<html:options collection="listaAssunto" property="id" labelProperty="descricao" />
						</html:select>
					</td>
				</tr>
				<tr id="linhaLocOcorr" style="display:none;">
					<td class="tdHeader3" width="150">
						<label for="localidadeOcorrencia">
							Localidade da ocorrência: <font class="asterisco">*</font>
						</label>
					</td>
					<td class="tdHeader4" colspan=3 id="celulaLocalidade">
						<select id="localidadeOcorrencia" name="localidadeOcorrencia" tabindex="9" styleClass="text">
							<option value="0">
								Selecione
							</option>
						</select>
					</td>
				</tr>
				<logic:present name="usuarioLogado" scope="request">
					<tr>
						<td class="tdHeader3" width="150">
							<label for="meioRecebimento">
								Meio de Recebimento:<font class="asterisco">*</font>
							</label>
						</td>
						<td class="asteristico" colspan=3>
							<html:select property="meioRecebimento" tabindex="10" styleClass="text" styleId="meioRecebimento">
								<html:option value="0">Selecione</html:option>
								<html:options collection="listaMeioRecebimento" property="id" labelProperty="descricao" />
							</html:select>
						</td>
					</tr>
				</logic:present>
				<tr>
					<td class="tdHeader3" width="150">
						<label for="mensagem">
							Mensagem: <span id="asteriscoMensagem" style="visibility:visible"><font class="asterisco">*</font></span>
						</label>
					</td>
					<td class="asteristico" colspan=3 valign="top">
						<html:textarea styleId="mensagem" style="WIDTH: 348px; HEIGHT: 80px" property="mensagem" cols="32" tabindex="11" onkeyup="textCounter(this, document.getElementById('contador'),1000);" />
						<div id="contador">
							1000 caracteres restantes
						</div>
					</td>
				</tr>

				<logic:equal name="permiteArquivoAnexo" scope="request" value="true">
					<tr>
						<td class="tdHeader3" width="150">
							<label for="arquivoAnexo">
								Anexo
								<logic:present name="tamanhoArquivoAnexo" scope="request">
			           		(limite de <%=request.getAttribute("tamanhoArquivoAnexo")%> Kb)
			        	   	</logic:present>
								:
							</label>
						</td>
						<td class="asteristico" colspan="3" valign="top" id="celulaAnexo">
							<html:file property="arquivoAnexo" styleId="arquivoAnexo" styleClass="formcinza" size="32" title="Procurar arquivo anexo" tabindex="12" onkeypress="javascript: if((event.keyCode == 13)||(event.which==13)) arquivoAnexo.click();" />
						</td>
					</tr>
				</logic:equal>

				<logic:present name="usuarioLogado" scope="request">
					<logic:equal name="permiteMensagemDigitalizada" scope="request" value="true">
						<tr>
							<td class="tdHeader3" width="150">
								<label for="mensagemDigitalizada">
									Mensagem Digitalizada
									<logic:present name="tamanhoMensagemDigitalizada" scope="request">
			        	   	(limite de <%=request.getAttribute("tamanhoMensagemDigitalizada")%> Kb):
				           </logic:present>
									:
								</label>
							</td>
							<td class="asteristico" colspan=3 valign="top">
								<html:file property="mensagemDigitalizada" styleId="mensagemDigitalizada" styleClass="formcinza" size="32" tabindex="13" onchange="exibeMensagem(document);" />
							</td>
						</tr>
					</logic:equal>
				</logic:present>

				<tr>
					<td colspan="4" class="contentBold" id="tit">
						<label tabindex="14">
							DADOS PESSOAIS
						</label>
					</td>
				</tr>
				<tr>
					<td class="tdHeader3" width="100">
						<label for="tipo de usuario">
							Tipo de Usuário: <font class="asterisco">*</font>
						</label>
					</td>
					<td id="celulaTipoAcionador" class="asteristico">
						<html:select property="tipoAcionador" tabindex="15" styleClass="text" styleId="tipo de usuario" onchange="exibeIdentificacao(document,this.value), exibeResposta(document,document.forms[0].meioEnvioResposta.value,this.value)"
							onblur="setaFocoMatricula(document,this.value)">
							<html:option value="0">Selecione</html:option>
							<html:options collection="listaTipoAcionador" property="id" labelProperty="descricao" />
						</html:select>
					</td>
					<td id="celulaMat1" style="display:none;" class="tdHeader3" id="titnum" width="100">
						<label for="matriculaAcionadorFuncionario">
							Matrícula: <font class="asterisco">*</font>
						</label>
					</td>
					<td id="celulaMat2" style="display:none;" class="asteristico" headers="tit titnum">
						<html:text property="matriculaAcionadorFuncionario" maxlength="9" styleClass="text" styleId="matriculaAcionadorFuncionario" size="15" tabindex="16" onblur="buscaFuncionario();" />
						<div id="AguardeMat" tabindex="17" style="display:none;" onblur="this.focus();">
							Aguarde, buscando dados na sua instituição.
						</div>
					</td>
				</tr>
				<tr>
					<td class="tdHeader3" id="titnum" width="100">
						<label for="sexo">
							Sexo:
						</label>
					</td>
					<td class="tdHeader4" headers="tit titnum">
						<html:select property="sexo" tabindex="17" styleClass="text" styleId="sexo">
							<html:option value="">Selecione</html:option>
							<html:option value="M">Masculino</html:option>
							<html:option value="F">Feminino</html:option>
						</html:select>
					</td>
					<td class="tdHeader3" id="titzon" width="120">
						<label for="escolaridade">
							Escolaridade:
						</label>
					</td>
					<td class="tdHeader4" id="titzon">
						<html:select property="escolaridade" tabindex="18" styleClass="text" styleId="escolaridade">
							<html:option value="0">Selecione</html:option>
							<html:options collection="listaEscolaridade" property="id" labelProperty="descricao" />
						</html:select>
					</td>
				</tr>
				<tr valign="top">
					<td class="tdHeader3" id="titnum" width="100">
						<label for="Faixa Etaria">
							Faixa etária:
						</label>
					</td>
					<td class="tdHeader4" headers="tit titnum">
						<html:select property="faixaEtaria" tabindex="19" styleClass="text" styleId="Faixa Etaria">
							<html:option value="0">Selecione</html:option>
							<html:options collection="listaFaixaEtaria" property="id" labelProperty="intervalo" />
						</html:select>
					</td>
					<td class="tdHeader3" id="titzon" width="120">
						<label for="Local de envio">
							Local de envio:
						</label>
					</td>
					<td class="tdHeader4" id="titzon" id="Local de envio">
						<fieldset style="border:0;">
							<html:select property="pais" tabindex="20" styleClass="text" styleId="PaisOrigem" onchange="exibeUF(document,this.value);">
								<html:options collection="listaPais" property="id" labelProperty="descricao" />
							</html:select>
						</fieldset>
						<span id="UFResidencia"> <label for="EstadoOrigem">
								Estado:
							</label>
							<fieldset style="border:0;">
								<html:select property="uf" tabindex="21" styleClass="text" styleId="EstadoOrigem">
									<html:option value="0">Selecione</html:option>
									<html:options collection="listaUf" property="id" labelProperty="nome" />
								</html:select>
							</fieldset> </span>
					</td>
				</tr>
			</table>

			<table cellpadding="2" cellspacing="1" border="0" width="100%" align="center">
				<tr id="linhaIdentificacao" style="display:none">
					<td colspan="4" class="contentBold" id="tit">
						<label tabindex="22">
							IDENTIFICAÇÃO
						</label>
					</td>
				</tr>
				<tr id="linhaPF1" style="display:none">
					<td class="tdHeader3" id="titnum" width="100">
						<label for="nomePessoaFisica">
							Nome: <font class="asterisco">*</font>
						</label>
					</td>
					<td colspan="3" class="asteristico" headers="tit titnum">
						<html:text property="nomeAcionadorPessoaFisica" styleClass="text" styleId="nomePessoaFisica" maxlength="100" size="30" tabindex="23" />
					</td>
				</tr>
				<tr id="linhaPF2" style="display:none">
					<td class="tdHeader3" id="titsec" width="100">
						<label for="CpfPessoaFisica">
							CPF:
						</label>
					</td>
					<td colspan="3" class="tdHeader4" headers="tit titsec">
						<html:text property="cpfAcionadorPessoaFisica" maxlength="11" styleClass="text" styleId="CpfPessoaFisica" size="12" tabindex="24" />
					</td>
				</tr>

				<tr id="linhaPJ1" style="display:none">
					<td class="tdHeader3" id="titnum" width="100">
						<label for="razaoSocialAcionadorPessoaJuridica">
							Razão Social: <font class="asterisco">*</font>
						</label>
					</td>
					<td class="asteristico" headers="tit titnum">
						<html:text property="razaoSocialAcionadorPessoaJuridica" styleClass="text" styleId="razaoSocialAcionadorPessoaJuridica" maxlength="150" size="30" tabindex="25" />
					</td>
					<td class="tdHeader3" id="titzon">
						<label for="cnpjAcionadorPessoaJuridica">
							CNPJ: <font class="asterisco">*</font>
						</label>
					</td>
					<td class="asteristico" headers="tit titzon">
						<html:text property="cnpjAcionadorPessoaJuridica" styleClass="text" styleId="cnpjAcionadorPessoaJuridica" size="15" maxlength="14" tabindex="26" />
					</td>
				</tr>
				<tr id="linhaPJ2" style="display:none">
					<td class="tdHeader3" id="titnum" width="100">
						<label for="nomeContatoAcionadorPessoaJuridica">
							Nome de contato:
						</label>
					</td>
					<td class="tdHeader4" headers="tit titnum">
						<html:text property="nomeContatoAcionadorPessoaJuridica" styleClass="text" styleId="nomeContatoAcionadorPessoaJuridica" size="30" maxlength="100" tabindex="27" />
					</td>
					<td class="tdHeader3" id="titsec" width="100">
						<label for="cpfAcionadorPessoaJuridica">
							CPF do acionador: <font class="asterisco">*</font>
						</label>
					</td>
					<td class="asteristico" headers="tit titsec">
						<html:text property="cpfAcionadorPessoaJuridica" styleClass="text" maxlength="11" styleId="cpfAcionadorPessoaJuridica" size="12" tabindex="28" />
					</td>
				</tr>

				<tr id="linhaFUN1" style="display:none">
					<td class="tdHeader3" id="titsec" width="100">
						<label for="nomeAcionadorFuncionario">
							Nome:
						</label>
					</td>
					<td class="tdHeader4" headers="tit titsec">
						<html:text property="nomeAcionadorFuncionario" styleClass="text" styleId="nomeAcionadorFuncionario" maxlength="100" size="30" tabindex="29" />
					</td>
					<td class="tdHeader3" headers="tit titnum">
						<label for="setorAcionadorFuncionario">
							Setor:
						</label>
					</td>
					<td class="tdHeader4" headers="tit titnum">
						<html:text property="setorAcionadorFuncionario" styleClass="text" styleId="setorAcionadorFuncionario" maxlength="150" size="15" tabindex="30" />
					</td>
				</tr>
				<tr id="linhaFUN2" style="display:none">
					<td class="tdHeader3" id="titsec" width="100">
						<label for="cpfAcionadorFuncionario">
							CPF: <font class="asterisco">*</font>
						</label>
					</td>
					<td class="asteristico" headers="tit titsec" colspan="3">
						<html:text property="cpfAcionadorFuncionario" styleClass="text" styleId="cpfAcionadorFuncionario" size="12" maxlength="11" tabindex="31" />
					</td>
				</tr>

				<tr id="linhaETF1" style="display:none">
					<td class="tdHeader3" id="endem" width="100">
						<label for="telefone">
							Telefone: <span id="asteriscoTelefone" style="visibility:hidden"> &nbsp;<font class="asterisco">*</font> </span>
						</label>
						<label for="codigoPaisTelefone" style="display:none"">
							Código do País do Telefone:
						</label>
						<label for="codigoCidadeTelefone" style="display:none"">
							Código da Área do Telefone:
						</label>

					</td>
					<td class="asteristico" headers="end endem">
						<table cellpadding="0" cellspacing="0" border="0" width="100%" align="left">
							<tr>
								<td class="asteristico" width="18%">
									<label class="auxTelefone">
										+
									</label>
									<html:text property="codigoPaisTelefone" styleClass="text" styleId="codigoPaisTelefone" size="2" maxlength="2" tabindex="32" />
								</td>
								<td class="asteristico" width="18%">
									<label class="auxTelefone">
										(
									</label>
									<html:text property="codigoCidadeTelefone" styleClass="text" styleId="codigoCidadeTelefone" size="2" maxlength="2" tabindex="33" />
									<label class="auxTelefone">
										)
									</label>
								</td>
								<td class="asteristico">
									<html:text property="telefone" styleClass="text" styleId="telefone" size="15" maxlength="8" tabindex="34" />
								<td>
							</tr>
							<tr>
								<td class="asteristico" width="18%">
									<font class="detalheTelefone">&nbsp;&nbsp;&nbsp;(país)</font>
								</td>
								<td class="asteristico" width="18%">
									<font class="detalheTelefone">&nbsp;&nbsp;(área)</font>
								</td>
								<td class="asteristico">
									<font class="detalheTelefone">(n&uacute;mero)</font>
								<td>
							</tr>
						</table>
					</td>
					<td class="tdHeader3" id="endem">
						<label for="codigoPaisFax" style="display:none"">
							Código do País do Fax:
						</label>
						<label for="codigoCidadeFax" style="display:none"">
							Código da Área do Fax:
						</label>
						<label for="fax">
							Fax: <span id="asteriscoFax" style="visibility:hidden"> &nbsp;<font class="asterisco">*</font> </span>
						</label>
					</td>
					<td class="asteristico" headers="end endem">
						<table cellpadding="0" cellspacing="0" border="0" width="100%" align="left">
							<tr>
								<td class="asteristico" width="18%">
									<label class="auxTelefone">
										+
									</label>
									<html:text property="codigoPaisFax" styleClass="text" styleId="codigoPaisFax" size="3" maxlength="2" tabindex="35" />
								</td>
								<td class="asteristico" width="18%">
									<label class="auxTelefone">
										(
									</label>
									<html:text property="codigoCidadeFax" styleClass="text" styleId="codigoCidadeFax" size="2" maxlength="2" tabindex="36" />
									<label class="auxTelefone">
										)
									</label>
								</td>
								<td class="asteristico">
									<html:text property="fax" styleClass="text" styleId="fax" size="15" maxlength="8" tabindex="37" />
								</td>
							</tr>
							<tr>
								<td class="asteristico" width="18%">
									<font class="detalheTelefone">&nbsp;&nbsp;&nbsp;(país)</font>
								</td>
								<td class="asteristico" width="18%">
									<font class="detalheTelefone">&nbsp;&nbsp;(área)</font>
								</td>
								<td class="asteristico">
									<font class="detalheTelefone">(n&uacute;mero)</font>
								<td>
							</tr>
						</table>
					</td>
				</tr>

				<tr id="linhaETF2" style="display:none">
					<td class="tdHeader3" id="endem">
						<label for="email">
							E-mail: <span id="asteriscoEmail" style="visibility:hidden"> &nbsp;<font class="asterisco">*</font> </span>
						</label>
					</td>
					<td colspan="3" class="asteristico" headers="end endem">
						<html:text property="email" styleClass="text" styleId="email" size="30" maxlength="50" tabindex="38" />
					</td>
				</tr>
			</table>
			<table cellpadding="2" cellspacing="1" border="0" width="100%" align="center">
				<tr>
					<td colspan="2" class="contentBold" id="cf">
						<label tabindex="39">
							RESPOSTA
						</label>
					</td>
				</tr>
				<tr id="linhaRespostaNormal">
					<td class="tdHeader3" id="endem">
						<label for="meioEnvioResposta">
							Como você gostaria de receber sua resposta? <font class="asterisco">*</font>
						</label>
					</td>
					<td class="tdHeader4" headers="end endem">

						<html:select property="meioEnvioResposta" value="1" styleClass="text" tabindex="40" styleId="meioEnvioResposta" onchange="exibeResposta(document,this.value, document.forms[0].tipoAcionador.value);">
							<html:options collection="listaMeioEnvioResposta" property="id" labelProperty="descricao" />
						</html:select>
					</td>
				</tr>
				<tr id="linhaRespostaInternet" style="display:none">
					<td class="tdHeader4" id="endem" colspan="2" align="center">
						<label tabindex=40>
							Sua resposta estará disponível pela Internet, atrav&eacute;s do sistema.
						</label>
					</td>
				</tr>
				<tr id="linhaRespostaNormal2">
					<td class="tdHeader4" headers="cf cfts" colspan=2>
						<div id=texto align="center" style="border:2px #000000">
							<label tabindex="41">
								Independente da opção, a mensagem poderá ser acompanhada via Internet, atrav&eacute;s do sistema.
							</label>
						</div>
					</td>
				</tr>
			</table>
			<span id="carta" style="DISPLAY: none">
				<table cellpadding="2" cellspacing="1" border="0" width="100%" align="center">
					<tr>
						<td colspan="4" class="contentBold" id="end">
							<label tabindex="49">
								ENDEREÇO PARA CORRESPONDÊNCIA
							</label>
						</td>
					</tr>
					<tr>
						<td class="tdHeader3" id="titnum">
							<label for="logradouroCarta">
								Logradouro: <font class="asterisco">*</font>
							</label>
						</td>
						<td class="tdHeader4" headers="tit titnum">
							<html:text property="logradouroCarta" styleClass="text" styleId="logradouroCarta" maxlength="150" size="30" tabindex="50" />
						</td>
						<td class="tdHeader3" id="titsec">
							<label for="numeroCarta">
								N&uacute;mero:
							</label>
						</td>
						<td class="tdHeader4" headers="tit titsec">
							<html:text property="numeroCarta" styleClass="text" styleId="numeroCarta" maxlength="11" size="12" tabindex="51" />
						</td>
					</tr>
					<tr>
						<td class="tdHeader3" id="titzon">
							<label for="complementoCarta">
								Complemento:
							</label>
						</td>
						<td class="tdHeader4" headers="tit titzon">
							<html:text property="complementoCarta" styleClass="text" styleId="complementoCarta" maxlength="150" size="12" tabindex="52" />
						</td>
						<td class="tdHeader3" id="titsec">
							<label for="bairroCarta">
								Bairro: <font class="asterisco">*</font>
							</label>
						</td>
						<td class="tdHeader4" headers="tit titsec">
							<html:text property="bairroCarta" styleClass="text" styleId="bairroCarta" maxlength="50" size="30" tabindex="53" />
						</td>
					</tr>
					<tr>
						<td class="tdHeader3" id="tituf">
							<label for="cidadeCarta">
								Cidade: <font class="asterisco">*</font>
							</label>
						</td>
						<td class="tdHeader4" headers="tit tituf">
							<html:text property="cidadeCarta" styleClass="text" styleId="cidadeCarta" maxlength="50" size="30" tabindex="54" />
						</td>
						<td class="tdHeader3" id="titsec">
							<label for="cepCarta">
								CEP: <font class="asterisco">*</font>
							</label>
						</td>
						<td class="tdHeader4" headers="tit titsec">
							<html:text property="cepCarta" maxlength="8" styleClass="text" styleId="cepCarta" size="9" tabindex="55" />
						</td>
					</tr>
					<td class="tdHeader3" id="tituf">
						<label for="paisCarta">
							Pais: <font class="asterisco">*</font>
						</label>
					</td>
					<td class="tdHeader4" headers="tit tituf">
						<html:select property="paisCarta" tabindex="56" styleClass="text" styleId="paisCarta" onchange="exibeUFCarta(document,this.value);">
							<html:options collection="listaPais" property="id" labelProperty="descricao" />
						</html:select>
					</td>
					<td class="tdHeader3" id="tituf">
						<label for="estadoCarta">
							UF: <span id="asteriscoUfCarta" style="position:relative;">&nbsp;<font class="asterisco">*</font></span>
						</label>
					</td>
					<td class="tdHeader4" headers="tit tituf">
						<html:select property="ufCarta" tabindex="57" styleClass="text" styleId="estadoCarta">
							<html:option value="0">Selecione</html:option>
							<html:options collection="listaUf" property="id" labelProperty="nome" />
						</html:select>
					</td>
					</tr>
				</table> </span>
			<logic:equal name="possuiCodigoAcesso" scope="request" value="true">
				<span id="spanCodigoAcesso">

					<table cellpadding="2" cellspacing="1" border="0" width="100%" align="center">
						<TR>
							<TD class=contentBold id=cf colSpan=5>
								<label tabindex="58">
									CÓDIGO DE ACESSO
								</label>
							</TD>
						</TR>
						<TR>
							<TD class="tdHeader4" headers="cf cfts" colSpan=5>
								<div id="texto">
									<label tabindex="59">
										Para segurança de sua informação, após a confirmação dos dados deste formulário você receberá um n&uacute;mero de PROTOCOLO e um CÓDIGO DE ACESSO para consultar a resposta da sua mensagem. Em caso de perda ou esquecimento você poderá recuperar esse
										CÓDIGO DE ACESSO por e-mail ou respondendo a uma pergunta cadastrada por você.
									</label>
								</div>
							</TD>
						</TR>
						<TR>
							<TD class=tdHeader3 id=endem colSpan=5>
								<label for="checkRecuperaCodigoAcesso">
									<html:checkbox property='checkRecuperaCodigoAcesso' tabindex="60" styleId='checkRecuperaCodigoAcesso' onclick="exibeDadosRecuperacao(document);" onkeypress="exibeDadosRecuperacao(document);" />
									Quero que meu CÓDIGO DE ACESSO possa ser mostrado após eu responder à minha pergunta cadastrada
								</label>
							</TD>
						</TR>
						<tr id="linhaPergunta" style="display:none">
							<td class="tdHeader3" id="endem">
								<label for="pergunta">
									Pergunta: <font class="asterisco">*</font>
								</label>
							</td>
							<td colspan="4" class="asteristico" headers="end endem">
								<html:text property="pergunta" styleClass="text" styleId="pergunta" size="40" maxlength="100" tabindex="61" />
							</td>
						</tr>
						<tr id="linhaResposta" style="display:none">
							<span id="spanResposta" style="display:none">
							<td class="tdHeader3" id="endem">
								<label for="resposta">
									Resposta: <font class="asterisco">*</font>
								</label>
							</td>
							<td colspan="4" class="asteristico" headers="end endem">
								<html:text property="resposta" styleClass="text" styleId="resposta" size="40" maxlength="100" tabindex="62" />
							</td>
							</span>
						</tr>
					</table> </span>
			</logic:equal>
			<table cellpadding="2" cellspacing="1" border="0" width="100%" align="center">
				<TR>
					<TD class=contentBold id=cf colSpan="2">
						<label tabindex="63">
							VALIDAÇÃO
						</label>
					</TD>
				</TR>
				<tr>
					<td class="tdHeader3" id="endem" width="30%">
						<label tabindex="64">
							Digite a informação das figuras ao lado <font class="asterisco">*</font>
						</label>
						<label for="validacao" style="display:none;">
							Digite
						</label>
					</td>
					<td class="tdHeader4" headers="end endem">

						<IMG alt="<%= request.getAttribute("altImagem1") %>" src="<%= request.getAttribute("srcImagem1") %>" tabindex="65">
						<IMG alt="<%= request.getAttribute("altImagem2") %>" src="<%= request.getAttribute("srcImagem2") %>" tabindex="66">
						<IMG alt="<%= request.getAttribute("altImagem3") %>" src="<%= request.getAttribute("srcImagem3") %>" tabindex="67">
						<IMG alt="<%= request.getAttribute("altImagem4") %>" src="<%= request.getAttribute("srcImagem4") %>" tabindex="68">

						<html:text property="validacao" styleClass="text" styleId="validacao" size="10" maxlength="4" tabindex="69" />
					</td>
				</tr>
				<tr>
					<TD class="tdHeader1" colspan="2">
						<label for="enviar">
							<input type="button" tabindex="70" name="Submit" value="Confirmar" class="button" onClick="validaForm(document)" onkeypress="validaForm(document)">
						</label>
						<label for="limpar">
							<input type="reset" tabindex="71" name="reset1" value="Limpar" class="button" onClick="reload(document);" onkeypress="reload(document);">
						</label>
					</TD>
				</tr>
			</table>
			<p></p>
			<hr>
			<p class="voltar">
				&nbsp; <A tabindex="72" title="voltar para página anterior" href="javascript:history.go(-1)">voltar</A>
			</p>

			<!-- Campo para guardar a matrícula informada, evitando buscas constantes na base -->
			<input type="Hidden" name="MatriculaAnterior" value=" ">

		</html:form>
	</div>
</body>
</html:html>
