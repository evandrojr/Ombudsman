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
   -- M�dulo:       Andamento
   -- 
   -- Descri��o:    O acionador consulta a resposta de um acionamento informando o n&uacute;mero do protocolo e o 
   -- 		  c�digo de acesso caso o org�o esteja configurado para us�-lo.
   -- 
   -- Vers�o:       1.0
   -- Data:         30/11/2004   
  */
--%>

<%@ taglib uri="/tags/struts-logic" prefix="logic"%>
<%@ taglib uri="/tags/struts-bean" prefix="bean"%>
<%@ taglib uri="/tags/struts-html" prefix="html"%>

<html:html lang="pt">

<head>
	<html:base />
	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
	<meta name="Keywords" content="acessibilidade, guia, serpro, inclus�o, defici�ncia, recomenda��es, necessidade especial, ouvidoria" />
	<link rel="stylesheet" media="all" href="../<bean:write name="_LAYOUT_" property="esquemaCores"/>/estilo_conteudo.css" type="text/css">
	<link rel="stylesheet" type="text/css" media="print" href="../estilo_print.css">
	<title>Consulte sua Resposta</title>

	<!-- Bibliotecas javascript  -->
	<script language="JavaScript" src="../js/util.js"></script>

	<script language="JavaScript">
	
	function onLoad(){
		// Se a resposta foi avaliada, exibe a avalia��o e n�o permite
		// uma nova avalia��o
		if (<%= request.getAttribute("avaliacaoResposta") %> != "0") {
			for(i=0; i<document.forms[0].tipoAvaliacaoResposta.length; i++){
				if(document.forms[0].tipoAvaliacaoResposta[i].value == <%= request.getAttribute("avaliacaoResposta") %>){
				 document.forms[0].tipoAvaliacaoResposta[i].checked = true;
				} else {
			       document.forms[0].tipoAvaliacaoResposta[i].disabled = true;				
				}   
			}

			document.forms[0].submit.disabled = true;				
			document.forms[0].reset.disabled = true;							
		}
		
		document.getElementById("titulo").focus();
	}

	function validaForm(){
		var ok;
		var innerHtmlMsgErros = '';

		ok = false;
		for(i=0; i<document.forms[0].tipoAvaliacaoResposta.length; i++){
			if(document.forms[0].tipoAvaliacaoResposta[i].checked){
			 ok = true;
			 break;
			}
		}
		
		if(!ok){
			innerHtmlMsgErros += formataErro('A escolha de uma avalia��o &eacute; obrigat�ria');
			var texto = innerHtmlMsgErros;
			abreAlerta(texto);
			return false;
		}

		return true;	

	}
	
	</script>
</head>

<body onLoad="onLoad();">

	<div id="content">
		<h1 id="titulo" tabindex="1">
			Consulte sua Resposta
		</h1>

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
					Prezado(a)
					</logic:equal>
				</logic:present>

				<logic:notPresent name="sexo" scope="request">	
					Prezado(a)
				</logic:notPresent>
		
				<logic:notPresent name="nomeAcionador" scope="request">
					,
				</logic:notPresent>

				<logic:present name="nomeAcionador" scope="request">
					&nbsp;<%=request.getAttribute("nomeAcionador")%>,
				</logic:present>

				<logic:notPresent name="resposta" scope="request">

					<logic:notPresent name="dataPrevistaResolucaoExterna" scope="request">
						<%=request.getAttribute("textoConsultaRespostaSemPrazo")%>
					</logic:notPresent>

					<logic:equal name="respostaAtrasada" scope="request" value="false">
						<%=request.getAttribute("textoConsultaRespostaNoPrazo")%>
					</logic:equal>

					<logic:equal name="respostaAtrasada" scope="request" value="true">
						<%=request.getAttribute("textoConsultaRespostaEmAtraso")%>
					</logic:equal>
				
				</logic:notPresent>
			<h2></h2>
			</p>
		</label>

		<logic:present name="resposta" scope="request">
			<%=request.getAttribute("textoApresentacaoResposta")%>


			<html:form action="/AvaliarResposta" method="post">
				<h2>
				</h2>
				<html:hidden property="numeroProtocolo" value="<%= String.valueOf( request.getAttribute( "numeroProtocolo" ) ) %>" />

				<table cellpadding="2" cellspacing="1" border="0" width="100%" align="center" style="WIDTH: 100%; HEIGHT: 116px">

					<tr>
						<th colspan="2" class="contentBold" id="end">
							<label tabindex="5">
								<b>Sua Mensagem:</b>
							</label>
						</th>
					</tr>

					<tr>
						<td class="tdHeader4" align=left colspan="2">
							<label tabindex="6">
								<%=request.getAttribute("mensagem")%>
							</label>
						</td>
					</tr>

					<tr>
						<th colspan="2" class="contentBold" id="end">
							<label tabindex="7">
								<b>Resposta da Ouvidoria:</b>
							</label>
						</th>
					</tr>

					<tr>
						<td class="tdHeader4" align=left colspan="2">
							<label tabindex="8">
								<%=request.getAttribute("resposta")%>
							</label>
						</td>
					</tr>

					<tr>
						<th colspan="2" class="contentBold" id="end">
							<label tabindex="9">
								<b>Sua Avalia��o:</b>
							</label>
						</th>
					</tr>

					<tr>
						<bean:size id="total" name="listaTipoAvaliacaoResposta" />
						<td class="tdHeader3" id="endem" rowspan="<%= total.intValue() + 1 %>">
							<label tabindex="10">
								A resposta foi satisfat�ria?
							</label>
						</td>
					</tr>

					<logic:iterate name="listaTipoAvaliacaoResposta" id="tipoAvaliacaoResposta">
						<tr>
							<td class="tdHeader4" headers="end endem">
								<label>
									<html:radio property="tipoAvaliacaoResposta" idName="tipoAvaliacaoResposta" value="id" tabindex="11">
										<bean:write name="tipoAvaliacaoResposta" property="descricao" />
									</html:radio>
								</label>
							</td>
						</tr>
					</logic:iterate>

					<tr>
						<td class="tdHeader1" colspan="2">
							<input type="submit" tabindex="12" name="submit" value="Avaliar" class="button" onClick="return validaForm();" onkeypress="return validaForm();" alt="Clique para avaliar a resposta">
							<input type="reset" tabindex="13" name="reset" value="Limpar" class="button" alt="Clique para limpar os campos">
						</td>
					</tr>

				</table>
			</html:form>
			<p></p>
			<hr>

		</logic:present>

		<p class="voltar">
			<a tabindex="14" title="imprimir sua resposta" href="javascript:print()">imprimir</a>.&nbsp; <a tabindex="15" title="voltar para p�gina anterior" href="javascript:history.go(-1)">voltar</a>
		</p>
	</div>
</body>
</html:html>
