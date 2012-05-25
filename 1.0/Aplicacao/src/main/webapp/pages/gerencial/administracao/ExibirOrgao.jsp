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


<%@ taglib uri="/tags/struts-logic" prefix="logic" %>
<%@ taglib uri="/tags/struts-bean"  prefix="bean"%>
<%@ taglib uri="/tags/struts-html"  prefix="html"%>

<html lang="pt">
	<head>
		<title>Atualizar Cadastro</title>
		<html:base />
		<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
		<link rel="stylesheet"  media="all" href="../../<bean:write name="_LAYOUT_" property="esquemaCores"/>/estilo_conteudo.css" type="text/css">

		<!-- Bibliotecas javascript  -->
		<%@ include file="../../js/header.inc.jsp" %>

		<script language="JavaScript">

		function salvar()
		{
			document.forms[0].submit();
		}


		function validaCampos()
		{
			var innerHtmlMsgErros = "";
			var isInsert = document.forms[0].elements["id"].value==null?true:false;

            innerHtmlMsgErros += CriticaString( document.forms[0].elements["descricao"]            , 3, 50, 'Órgão ' );
            innerHtmlMsgErros += CriticaString( document.forms[0].elements["gestorResponsavel"]    , 3, 50, 'Responsável ' );
            innerHtmlMsgErros += CriticaString( document.forms[0].elements["telefoneContatoGestor"], 6, 15, 'Telefone de contato ' );

			// Telefone - (apenas n&uacute;meros)
			if (! isInteger(document.forms[0].telefoneContatoGestor.value) ) {
				innerHtmlMsgErros += formataErro( "Telefone inválido");
			}
			
			// Telefone - (preencher todos os campos - Verifica se um deles foi preenchido e os outros não)
			if ((document.forms[0].telefoneContatoGestor.value != ''
					&& (document.forms[0].codigoPaisTelefoneResponsavel.value == ''
					|| document.forms[0].codigoCidadeTelefoneResponsavel.value == ''))
					|| (document.forms[0].codigoPaisTelefoneResponsavel.value != ''
					&& (document.forms[0].telefoneContatoGestor.value == ''
					|| document.forms[0].codigoCidadeTelefoneResponsavel.value == ''))
					|| (document.forms[0].codigoCidadeTelefoneResponsavel.value != ''
					&& (document.forms[0].telefoneContatoGestor.value == ''
					|| document.forms[0].codigoPaisTelefoneResponsavel.value == ''))) {
					
				innerHtmlMsgErros += formataErro("Os campos país, área e número do telefone de contato são obrigatórios");
			}
			
			var now   = new Date();
			var agora = new Date(y2k(now.getYear()),now.getMonth(),now.getDate(), now.getHours(), now.getMinutes());
		
			var dataInicioCadastramento = document.forms[0].elements["dataInicioCadastramento"].value;
			var horaInicioCadastramento = document.forms[0].horaInicioCadastramento.value;

			var dataFimCadastramento = document.forms[0].elements["dataFimCadastramento"].value;
			var horaFimCadastramento = document.forms[0].horaFimCadastramento.value;

			if ( (dataIniCad = validaRetornandoData(dataInicioCadastramento, horaInicioCadastramento)) == null ) {
				innerHtmlMsgErros += formataErro( "Data de início de cadastramento inválida, use o formato dd/mm/aaaa");
			}
			
			if ( (dataFimCad = validaRetornandoData(dataFimCadastramento, horaFimCadastramento)) == null ) {
				innerHtmlMsgErros += formataErro( "Data de fim de cadastramento inválida, use o formato dd/mm/aaaa");
			} 
			
			if ( isInsert && dataIniCad < agora ) {
				innerHtmlMsgErros += formataErro( "Data de início de cadastramento deve ser maior ou igual a data atual");
			} 
	
			var dataInicioOperacao = document.forms[0].elements["dataInicioOperacao"].value;
			var horaInicioOperacao = document.forms[0].elements["horaInicioOperacao"].value;
			
			if ( typeof(dataIniOper = validaRetornandoDataHora(dataInicioOperacao, horaInicioOperacao, 'início de operação')) == "string" ) {
				innerHtmlMsgErros += dataIniOper;
			} 
			
			var dataFimOperacao = document.forms[0].elements["dataFimOperacao"].value;
			var horaFimOperacao = document.forms[0].elements["horaFimOperacao"].value;

			if ( typeof(dataFimOper = validaRetornandoDataHora(dataFimOperacao, horaFimOperacao, 'fim de operação')) == "string" ) {
				innerHtmlMsgErros += dataFimOper;
			} 
			
			if ( isInsert && dataIniOper < agora ) {
				innerHtmlMsgErros += formataErro( "Data de início de operação deve ser maior ou igual a data atual");
			} else if ( dataIniOper >= dataFimOper ) {
				innerHtmlMsgErros += formataErro( "Data de início de operação maior ou igual a data de fim de operação");
			}

			var dataInicioAcionamento = document.forms[0].elements["dataInicioAcionamento"].value;
			var horaInicioAcionamento = document.forms[0].elements["horaInicioAcionamento"].value;

			if ( typeof(dataIniAcnmnt = validaRetornandoDataHora(dataInicioAcionamento, horaInicioAcionamento, 'início do acionamento')) == "string" ) {
				innerHtmlMsgErros += dataIniAcnmnt;
			} 
			
			var dataFimAcionamento = document.forms[0].elements["dataFimAcionamento"].value;
			var horaFimAcionamento = document.forms[0].elements["horaFimAcionamento"].value;

			if ( typeof(dataFimAcnmnt = validaRetornandoDataHora(dataFimAcionamento, horaFimAcionamento, 'fim do acionamento')) == "string" ) {
				innerHtmlMsgErros += dataFimAcnmnt;
				ok = false;
			} 
			
			if ( isInsert && dataIniAcnmnt < agora ) {
				innerHtmlMsgErros += formataErro( "Data de início do acionamento deve ser maior ou igual a data atual");
			} else if ( dataIniAcnmnt >= dataFimAcnmnt ) {
				innerHtmlMsgErros += formataErro( "Data de início do acionamento maior ou igual a data de fim do acionamento");
			}

			var dataInicioConsultaResposta = document.forms[0].elements["dataInicioConsultaResposta"].value;
			var horaInicioConsultaResposta = document.forms[0].elements["horaInicioConsultaResposta"].value;

			if ( typeof(dataIniCResp = validaRetornandoDataHora(dataInicioConsultaResposta, horaInicioConsultaResposta, 'início da consulta resposta')) == "string" ) {
				innerHtmlMsgErros += dataIniCResp;
			} 
			
			var dataFimConsultaResposta = document.forms[0].elements["dataFimConsultaResposta"].value;
			var horaFimConsultaResposta = document.forms[0].elements["horaFimConsultaResposta"].value;

			if ( typeof(dataFimCResp = validaRetornandoDataHora(dataFimConsultaResposta, horaFimConsultaResposta, 'fim da consulta resposta')) == "string" ) {
				innerHtmlMsgErros += dataFimCResp;
			} 
			
			if ( isInsert && dataIniCResp < agora ) {
				innerHtmlMsgErros += formataErro( "Data de início da consulta resposta deve ser maior ou igual a data atual");
			} else if ( dataIniCResp >= dataFimCResp ) {
				innerHtmlMsgErros += formataErro( "Data de início da consulta resposta maior ou igual a data de fim da consulta resposta");
			}
			
			// Validação dos Períodos
			if ( dataFimCad <= dataIniOper ) {
			
				if ( dataIniAcnmnt <= dataIniOper ) {
					innerHtmlMsgErros += formataErro( "Data de início do acionamento menor ou igual a data de início da operação");
				}
				
				if ( dataFimAcnmnt >= dataFimOper ) {
					innerHtmlMsgErros += formataErro( "Data de fim do acionamento maior ou igual a data de fim da operação");
				}

				if ( dataIniCResp <= dataIniOper ) {
					innerHtmlMsgErros += formataErro( "Data de início da consulta resposta menor ou igual a data de início da operação");
				}
			
				if ( dataIniCResp < dataIniAcnmnt ) {
					innerHtmlMsgErros += formataErro( "Data de início da consulta resposta menor que a data de início do acionamento");
				}

				if ( dataFimCResp <= dataFimAcnmnt ) {
					innerHtmlMsgErros += formataErro( "Data de fim da consulta resposta menor ou igual a data de fim do acionamento");
					ok = false;
				}

				if ( dataFimCResp <= dataFimOper ) {
					innerHtmlMsgErros += formataErro( "Data de fim da consulta resposta menor ou igual a data de fim da operação");
				}

			}
			else
			{
				innerHtmlMsgErros += formataErro( "Data de início operação menor que a data de fim do cadastramento");
			}

			if(innerHtmlMsgErros=='')
			{
				abreConfirmacao("salvar");
			} else {
				var texto = innerHtmlMsgErros;
				abreAlerta(texto);
			}
			
			setFocusById('cpo');
		}

		function onLoad() {
			var frm = document.forms[0];

			frm.dataInicioCadastramento.setAttribute( 'dataType', 'date' );
			frm.dataFimCadastramento.setAttribute( 'dataType', 'date' );
			frm.dataInicioOperacao.setAttribute( 'dataType', 'date' );
			frm.dataFimOperacao.setAttribute( 'dataType', 'date' );
			frm.dataInicioAcionamento.setAttribute( 'dataType', 'date' );
			frm.dataFimAcionamento.setAttribute( 'dataType', 'date' );
			frm.dataInicioConsultaResposta.setAttribute( 'dataType', 'date' );
			frm.dataFimConsultaResposta.setAttribute( 'dataType', 'date' );

			frm.horaInicioCadastramento.setAttribute( 'dataType', 'time' );
			frm.horaFimCadastramento.setAttribute( 'dataType', 'time' );
			frm.horaInicioOperacao.setAttribute( 'dataType', 'time' );
			frm.horaFimOperacao.setAttribute( 'dataType', 'time' );
			frm.horaInicioAcionamento.setAttribute( 'dataType', 'time' );
			frm.horaFimAcionamento.setAttribute( 'dataType', 'time' );
			frm.horaInicioConsultaResposta.setAttribute( 'dataType', 'time' );
			frm.horaFimConsultaResposta.setAttribute( 'dataType', 'time' );

			afterPageBody();
			
			setFocusById('cpo');
		}

		</script>
	</head>

	<body onload="javascript:onLoad()" style="margin: 0px 0px;">
	


		<p style="text-align: left" id="cpo" tabindex="1"><font class="asterisco">*</font><font class="obrigatorio">campo com preenchimento obrigatório</font></p>
		<form name=0 method="post" action="../../../gerencial/AtualizarOrgao.do">
			<input type="hidden" name="action" value="salvar">
			<input type="hidden" name="id" value="<bean:write name="orgao" property="id"/>">

			<table border="0" width="100%" cellpadding="0" cellspacing="0">
				<tr>
					<td align="left">
						<img accesskey="d" tabindex="2" name="imgDetalhe" src="../../<bean:write name="_LAYOUT_" property="esquemaCores"/>/pasta_detalha.gif" alt="Órgão Escolhido"><table cellpadding="2" cellspacing="1" border="0" align="center" width="100%">

	  					<tr>
	    					<td class="tdHeader3" width="30%">
	    						<label for="descricao">Órgão&nbsp;<font class="asterisco">*</font></label>
	    					</td>
	    					<td class="tdHeader4"> 
					      	<html:text styleId="descricao" tabindex="3" size="50" maxlength="50" name="orgao" property="descricao"/>
	    					</td>
	  					</tr>

	  					<tr>
	    					<td class="tdHeader3" width="30%">
	    						<label for="gestorResponsavel">Responsável&nbsp;<font class="asterisco">*</font></label>
	    					</td>
	    					<td class="tdHeader4"> 
					      	<html:text styleId="gestorResponsavel" tabindex="4" size="50" maxlength="50" name="orgao" property="gestorResponsavel"/>
	    					</td>
	  					</tr>

	  					<tr>	
	    					<td class="tdHeader3" width="30%">
	    						<label for="telefoneContatoGestor">Telefone de contato&nbsp;<font class="asterisco">*</font></label>
	    					</td>
	    					<td class="tdHeader4">
							
								<table cellpadding="0" cellspacing="0" border="0" align="left">
									<tr>
									<td class="tdHeader4">
										<label class="auxTelefone">+</label>
										<html:text styleId="codigoPaisTelefoneResponsavel" tabindex="5" size="2" maxlength="3" name="orgao" property="codigoPaisTelefoneResponsavel"/>	    					
									</td>
									<td class="tdHeader4"> 
										<label class="auxTelefone">(</label>
										<html:text styleId="codigoCidadeTelefoneResponsavel" tabindex="5" size="2" maxlength="2" name="orgao" property="codigoCidadeTelefoneResponsavel"/>
										<label class="auxTelefone">)</label>
									</td>	
									<td class="tdHeader4">&nbsp
										<html:text styleId="telefoneContatoGestor" tabindex="5" size="17" maxlength="8" name="orgao" property="telefoneContatoGestor"/>
			    					</td>
									</tr>
									<tr>
										<td class="tdHeader4" align="center" width="18%"> 
											<label for="codigoPaisTelefoneResponsavel" class="detalheTelefone">(país)</label>
										</td>
										<td class="tdHeader4" align="center" width="18%"> 
											<label for="codigoCidadeTelefoneResponsavel" class="detalheTelefone">(área)</label>
										</td>
										<td class="tdHeader4"> 
											<label for="telefoneContatoGestor" class="detalheTelefone">n&uacute;mero</label>
										</td>	
									</tr>
								</table>
							
							</td>							
	  					</tr>

	  					<tr>
	    					<td class="tdHeader3" width="30%">
	    						<label tabindex="6">Situação</label>
	    					</td>
	    					<td class="tdHeader4"> 
									<label for="statusOrgao">
									<input type="checkbox" name="statusOrgao" id="statusOrgao" tabindex="7" checked value="A">Ativo
									</label>
	    					</td>
	  					</tr>

	  					<tr> 
	    					<td class="tdHeader3" width="30%">
	    						<label for="dataInicioCadastramento">Data início de cadastramento&nbsp;<font class="asterisco">*</font></label>
	    					</td>
	    					<td class="tdHeader4">
	      					<input id="dataInicioCadastramento" tabindex="8" size="10" maxlength="10" type="text" name="dataInicioCadastramento" value="<bean:write name="orgao" property="dataInicioCadastramento" format="dd/MM/yyyy"/>">
	      					<input id="horaInicioCadastramento" type="hidden" name="horaInicioCadastramento" value="00:00">
	    					</td>
	  					</tr>

	  					<tr> 
	    					<td class="tdHeader3" width="30%">
	    						<label for="dataFimCadastramento">Data fim de cadastramento&nbsp;<font class="asterisco">*</font></label>
	    					</td>
	    					<td class="tdHeader4">
	      					<input id="dataFimCadastramento" tabindex="11" size="10" maxlength="10" type="text" name="dataFimCadastramento" value="<bean:write name="orgao" property="dataFimCadastramento" format="dd/MM/yyyy"/>">
	      					<input id="horaFimCadastramento" type="hidden" name="horaFimCadastramento" value="00:00">
	    					</td>
	  					</tr>

	  					<tr> 
	    					<td class="tdHeader3" width="30%">
	    						<label for="dataInicioOperacao">Data início de operação&nbsp;<font class="asterisco">*</font></label>
	    					</td>
	    					<td class="tdHeader4">
	      					<input id="dataInicioOperacao" tabindex="14" size="10" maxlength="10" type="text" name="dataInicioOperacao" value="<bean:write name="orgao" property="dataInicioOperacao" format="dd/MM/yyyy"/>">
									&nbsp;<label tabindex="15">às</label>&nbsp;
	      					<input id="horaInicioOperacao" tabindex="16" size="5"  maxlength="5"  type="text" name="horaInicioOperacao" value="<bean:write name="orgao" property="dataInicioOperacao" format="HH:mm"/>">
	    					</td>
	  					</tr>

	  					<tr> 
	    					<td class="tdHeader3" width="30%">
	    						<label for="dataFimOperacao">Data fim de operação&nbsp;<font class="asterisco">*</font></label>
	    					</td>
	    					<td class="tdHeader4">
	      					<input id="dataFimOperacao" tabindex="17" size="10" maxlength="10" type="text" name="dataFimOperacao" value="<bean:write name="orgao" property="dataFimOperacao" format="dd/MM/yyyy"/>">
									&nbsp;<label tabindex="18">às</label>&nbsp;
	      					<input id="horaFimOperacao" tabindex="19" size="5"  maxlength="5"  type="text" name="horaFimOperacao" value="<bean:write name="orgao" property="dataFimOperacao" format="HH:mm"/>">
	    					</td>
	  					</tr>

	  					<tr> 
	    					<td class="tdHeader3" width="30%">
	    						<label for="dataInicioAcionamento">Data início de acionamento&nbsp;<font class="asterisco">*</font></label>
	    					</td>
	    					<td class="tdHeader4">
	      					<input id="dataInicioAcionamento" tabindex="20" size="10" maxlength="10" type="text" name="dataInicioAcionamento" value="<bean:write name="orgao" property="dataInicioAcionamento" format="dd/MM/yyyy"/>">
									&nbsp;<label tabindex="21">às</label>&nbsp;
	      					<input id="horaInicioAcionamento" tabindex="22" size="5"  maxlength="5"  type="text" name="horaInicioAcionamento" value="<bean:write name="orgao" property="dataInicioAcionamento" format="HH:mm"/>">
	    					</td>
	  					</tr>

	  					<tr> 
	    					<td class="tdHeader3" width="30%">
	    						<label for="dataFimAcionamento">Data fim de acionamento&nbsp;<font class="asterisco">*</font></label>
	    					</td>
	    					<td class="tdHeader4">
	      					<input id="dataFimAcionamento" tabindex="23" size="10" maxlength="10" type="text" name="dataFimAcionamento" value="<bean:write name="orgao" property="dataFimAcionamento" format="dd/MM/yyyy"/>">
									&nbsp;<label tabindex="24">às</label>&nbsp;
	      					<input id="horaFimAcionamento" tabindex="25" size="5"  maxlength="5"  type="text" name="horaFimAcionamento" value="<bean:write name="orgao" property="dataFimAcionamento" format="HH:mm"/>">
	    					</td>
	  					</tr>

	  					<tr> 
	    					<td class="tdHeader3" width="30%">
	    						<label for="dataInicioConsultaResposta">Data início de consulta de resposta&nbsp;<font class="asterisco">*</font></label>
	    					</td>
	    					<td class="tdHeader4">
	      					<input id="dataInicioConsultaResposta" tabindex="26" size="10" maxlength="10" type="text" name="dataInicioConsultaResposta" value="<bean:write name="orgao" property="dataInicioConsultaResposta" format="dd/MM/yyyy"/>">
									&nbsp;<label tabindex="27">às</label>&nbsp;
	      					<input id="horaInicioConsultaResposta" tabindex="28" size="5"  maxlength="5"  type="text" name="horaInicioConsultaResposta" value="<bean:write name="orgao" property="dataInicioConsultaResposta" format="HH:mm"/>">
	    					</td>
	  					</tr>

	  					<tr> 
	    					<td class="tdHeader3" width="30%">
	    						<label for="dataFimConsultaResposta">Data fim de consulta de resposta&nbsp;<font class="asterisco">*</font></label>
	    					</td>
	    					<td class="tdHeader4">
	      					<input id="dataFimConsultaResposta" tabindex="29" size="10" maxlength="10" type="text" name="dataFimConsultaResposta" value="<bean:write name="orgao" property="dataFimConsultaResposta" format="dd/MM/yyyy"/>">
									&nbsp;<label tabindex="30">às</label>&nbsp;
	      					<input id="horaFimConsultaResposta" tabindex="31" size="5"  maxlength="5"  type="text" name="horaFimConsultaResposta" value="<bean:write name="orgao" property="dataFimConsultaResposta" format="HH:mm"/>">
	    					</td>
	  					</tr>
	
<!-- ****************** Botões ****************** -->
	  					<tr> 
	    					<td class="tdHeader3" colspan="2">
	      					<div align="center"> 
	
										<logic:equal name="function" value="alterar">
	        						<input type="button" tabindex="32" name="botao" value="Alterar" class="button" onClick="validaCampos();">
										</logic:equal>

										<logic:equal name="function" value="incluir">
	        						<input type="button" tabindex="33" name="botao" value="Salvar" class="button" onClick="validaCampos();">
										</logic:equal>

	      					</div>
	    					</td>
	  					</tr>
						</table>
					</td>
				</tr>
			</table>
		</form>
		<script type="text/javascript" charset='iso-8859-1'>
			window.parent.document.getElementById("detalhe").style.height = this.document.body.scrollHeight;
		</script>
	</body>
</html>
