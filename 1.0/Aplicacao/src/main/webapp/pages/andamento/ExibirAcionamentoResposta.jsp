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

<%@ page import="br.gov.serpro.ouvidoria.model.Acionamento" %>
<%@ page import="br.gov.serpro.ouvidoria.model.InformacoesRecebimentoRespostaCarta" %>
<%@ page import="br.gov.serpro.ouvidoria.model.MeioEnvioResposta" %>

<html:html lang="pt">

<head>
	<html:base />
	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
	<meta name="Keywords" content="acessibilidade, guia, serpro, inclusão, deficiência, recomendações, necessidade especial, ouvidoria" />
	<link rel="stylesheet"  media="all" href="../<bean:write name="_LAYOUT_" property="esquemaCores"/>/estilo_conteudo.css" type="text/css">
	<link rel="stylesheet" type="text/css" media="print" href="../estilo_print.css">
	<title>Consulte sua Resposta</title>
	
	<script language="JavaScript">
	
	function onLoad(){
		try {
			document.forms[0].tipoAvaliacaoResposta[0].checked = true;
		}catch(err){
		}
		document.getElementById("titulo").focus();
	}

	function validaForm(){
		var ok;
		var innerHtmlErroIni = '<h2 id="erro" tabindex="2">Erro</h2><ul>';
		var innerHtmlErroFim = '</ul>';
		var innerHtmlMsgErros = '';

		ok = false;
		for(i=0; i<document.forms[0].tipoAvaliacaoResposta.length; i++){
			if(document.forms[0].tipoAvaliacaoResposta[i].checked){
			 ok = true;
			 break;
			}
		}
		
		if(ok){
			areaErro.style.visibility = 'hidden';
		}	
		else{
			innerHtmlMsgErros += '<li tabindex="3">' + 'Escolha de uma avaliacao.</li>';
			areaErro.innerHTML = innerHtmlErroIni + innerHtmlMsgErros + innerHtmlErroFim;
			areaErro.style.visibility = 'visible';
			document.getElementById("erro").focus();
			return false;
		}

		return true;	

	}
	
	</script>
</head>

<body onLoad="onLoad();">

<div id="content"> 

  <h1 id="titulo" tabindex="1" title="Resposta do Acionamento">Resposta do Acionamento</h1>

  <span id="areaErro" style="visibility:hidden"></span>

  <!--	
  <label tabindex="4">
		<p>
			<logic:present name="sexo" scope="request">
				<logic:equal name="sexo" scope="request" value="M">
					Prezado
				</logic:equal>
				  
				<logic:equal name="sexo" scope="request" value="F">
					Prezada
				</logic:equal>
					
				<logic:equal name="sexo" scope="request" value="">
					Prezado
				</logic:equal>
			</logic:present>

			<logic:notPresent name="sexo" scope="request">	
				Prezado
			</logic:notPresent>
			
			<logic:notPresent name="nomeAcionador" scope="request">
				,
			</logic:notPresent>

			<logic:present name="nomeAcionador" scope="request">
				&nbsp;<%= request.getAttribute("nomeAcionador") %>,
			</logic:present>
			
			<logic:notPresent name="resposta" scope="request">
				
				<logic:notPresent name="dataPrevistaResolucaoExterna" scope="request">
					<%= request.getAttribute("textoConsultaRespostaSemPrazo") %>
				</logic:notPresent>
			
				<logic:equal name="respostaAtrasada" scope="request" value="false">
					<%= request.getAttribute("textoConsultaRespostaNoPrazo") %>
				</logic:equal>
			
				<logic:equal name="respostaAtrasada" scope="request" value="true">
					<%= request.getAttribute("textoConsultaRespostaEmAtraso") %>
				</logic:equal>
				
				<h2></h2>
				
				
			</p>
	</label>
	</logic:notPresent>
	<logic:present name="resposta" scope="request">
	<%= request.getAttribute("textoApresentacaoResposta") %>
	-->			

	<h2></h2>
  
	<%
	Acionamento acionamento = (Acionamento) request.getAttribute("acionamento");
	MeioEnvioResposta meioEnvioResposta = acionamento.getAcionador().getMeioEnvioRespostaOrgao().getMeioEnvioResposta();
	%>
	
	<table style="table-layout:fixed" cellpadding="2" cellspacing="1" border="0" width="100%" align="center" width="100%">

		<tr> 
	  	<th colspan="2" class="contentBold" id="end"><div tabindex="5"><b>Dados do Acionador</b></div></th>
		</tr>
		<tr> 
			<td align=left colspan="2">
			<table cellpadding="1" cellspacing="0" style="WIDTH: 100%;">
				<tr>
					<td class="tdHeader4" width="15%"><div tabindex="6">Nome:</div></td>
					<td class="tdHeader4">
						<div tabindex="6">
								<%= request.getAttribute("nomeCompletoAcionador") %>
						</div>
					</td>
				</tr>
				<% 
				if ( meioEnvioResposta.equals(MeioEnvioResposta.CARTA) ) {
					
					InformacoesRecebimentoRespostaCarta info = acionamento.getAcionador().getInformacoesRecebimentoRespostaCarta();
					if ( info != null ) {
				%>
				<tr>
					<td class="tdHeader4" width="10%"><div tabindex="6">Endereço:</div></td>
					<td class="tdHeader4"><div tabindex="6"><%= info.getLogradouro() + ", " + info.getNumero() %></div></td>
				</tr>
				<tr>
					<td class="tdHeader4"><div tabindex="6">Complemento:</div></td> <!-- dscComplLogrd-->
					<td class="tdHeader4"><div tabindex="6"><%= info.getComplemento() %></div></td>
				</tr>
				<tr>
					<td class="tdHeader4"><div tabindex="6">Bairro:</div></td>
					<td class="tdHeader4"><div tabindex="6"><%= info.getBairro() %></div></td>
				</tr>
				<tr>
					<td class="tdHeader4"><div tabindex="6">Cidade:</div></td>
					<td class="tdHeader4"><div tabindex="6"><%= info.getCidade() + " - " + info.getUf().getSigla() %></div></td>
				</tr>
				<tr>
					<td class="tdHeader4"><div tabindex="6">CEP:</div></td>
					<td class="tdHeader4"><div tabindex="6"><%= info.getCep() %></div></td>
				</tr>
				<%
					}
				} else if ( meioEnvioResposta.equals(MeioEnvioResposta.TELEFONE) ) {
				%>				
				<tr>
					<td class="tdHeader4"><div tabindex="6">Telefone:</div></td>
					<td class="tdHeader4"><%= request.getAttribute("telefone") %></td>
				</tr>
				<%
				} else if ( meioEnvioResposta.equals(MeioEnvioResposta.FAX) ) {
				%>				
				<tr>
					<td class="tdHeader4"><div tabindex="6">Fax:</div></td>
					<td class="tdHeader4"><%= request.getAttribute("fax") %></td>
				</tr>
				<%
				}
				%>
			</table>
			</td>
		</tr>

		<tr> 
	  	<th colspan="2" class="contentBold" id="end"><div tabindex="7"><b>Dados do Acionamento</b></div></th>
		</tr>

		<tr> 
			<td align=left colspan="2">
			<table cellpadding="1" cellspacing="0" style="WIDTH: 100%;">
				<tr>
					<td class="tdHeader4" width="15%"><div tabindex="7">N&uacute;mero do Protocolo:</div></td>
					<td class="tdHeader4"><div tabindex="7"><bean:write name="acionamento" property="numeroProtocolo"/></div></td>
				</tr>
				<tr>
					<td class="tdHeader4"><div tabindex="7">Código de Acesso:</div></td>
					<td class="tdHeader4"><div tabindex="7"><%= acionamento.getAcionador().getInformacoesConsultaAcionamento().getCodigoAcesso() %></div></td>
				</tr>
				<tr>
					<td class="tdHeader4"><div tabindex="7">Data de Recebimento:</div></td>
					<td class="tdHeader4"><div tabindex="7"><bean:write name="acionamento" property="dataAcionamento" format="dd/MM/yyyy"/></div></td>
				</tr>
				<tr>
					<td class="tdHeader4"><div tabindex="7">Data de Impressão:</div></td>
					<td class="tdHeader4"><div tabindex="7"><bean:write name="dataImpressao"  format="dd/MM/yyyy"/></div></td>
				</tr>
			</table>
			</td>
		</tr>

		<tr> 
	  	<th colspan="2" class="contentBold" id="end"><div tabindex="8"><b>Sua Mensagem</b></div></th>
		</tr>

		<tr> 
			<td class="tdHeader4" align=left colspan="2"><div tabindex="8">
				<br><%= request.getAttribute("mensagem") %></br></div>
			</td>
		</tr>

		<tr> 
			<th colspan="2" class="contentBold" id="end"><div tabindex="9"><b>Resposta da Ouvidoria</b></div></th>
		</tr>

		<tr> 
			<td class="tdHeader4" align=left colspan="2"><div tabindex="9">
				<br><%= request.getAttribute("resposta") %></br></div>
			</td>
		</tr>
		
		<% 
		if ( meioEnvioResposta.equals(MeioEnvioResposta.TELEFONE) ) {
		%>
		<html:form action="/AvaliarResposta" method="post">
		<html:hidden property="numeroProtocolo" value="<%= String.valueOf( request.getAttribute( "numeroProtocolo" ) ) %>" />

		<tr> 
			<th colspan="2" class="contentBold" id="end"><div tabindex="10"><b>Sua Avaliação</b></div></th>
		</tr>
	    <tr> 
    	<bean:size id="total" name="listaTipoAvaliacaoResposta"/>
    	  <td class="tdHeader3" id="endem" rowspan="<%= total.intValue() + 1 %>">
      		<div tabindex="10">A resposta foi satisfatória?</div>
	      </td>
    	</tr>

		<logic:iterate name="listaTipoAvaliacaoResposta" id="tipoAvaliacaoResposta">
			<tr>
				<td class="tdHeader4" headers="end endem">
    				<html:radio property="tipoAvaliacaoResposta" idName="tipoAvaliacaoResposta" value="id" tabindex="11">
	  				<bean:write name="tipoAvaliacaoResposta" property="descricao"/>
	    			</html:radio>
				</td>
			</tr>
		</logic:iterate>

		<tr> 
			<td class="tdHeader1" colspan="2"> 
				<input type="button" tabindex="12" name="submit" value="Avaliar" class="button"	onClick="return validaForm();" onkeypress="return validaForm();" alt="Clique para avaliar a resposta">
				<input type="reset" tabindex="13" name="reset" value="Limpar" class="button" alt="Clique para limpar os campos"> 
			</td>
		</tr>

	</html:form>
	<%
	}		
	%>
	</table>
	</logic:present>
<br>
</body>
</html:html>
