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
<%@ taglib uri="/tags/struts-html" prefix="html"%>
<%@ taglib uri="/tags/struts-bean" prefix="bean"%>
<%@ taglib uri="/tags/struts-logic" prefix="logic"%>
<%@ page import="br.gov.serpro.ouvidoria.model.TipoAcionador"%>
<%@ taglib uri="http://jakarta.apache.org/taglibs/log-1.0" prefix="log"%>

<html>

	<head>
		<html:base />
		<meta http-equiv='Content-Type' content='text/html; charset=iso-8859-1'>
		<link rel='stylesheet' media='all' href='../<bean:write name="_LAYOUT_" property="esquemaCores"/>/estilo_conteudo.css' type='text/css'>
		<!-- Biblioteca javascript  -->
		<script language="JavaScript" src="../js/util.js"></script>
	</head>

	<%br.gov.serpro.ouvidoria.model.Acionamento acnmto = (br.gov.serpro.ouvidoria.model.Acionamento) request
					.getAttribute("cas_detail");%>

	<script type="text/javascript" charset='iso-8859-1'>
	<!-- //
	
	function onLoad() {
		window.parent.document.getElementById("casDetail").style.height = this.document.body.scrollHeight;
		document.getElementById('imgDetalhe').focus();	
	}
	
	function abreAnexo(pAcao) {
	
		<% 
		
		String dominio = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()+ request.getAttribute("diretorioAnexo").toString();;	
		String nomeAnexo = request.getAttribute("nomeAnexo").toString();
		String nomeMsgDigitalizada = request.getAttribute("nomeMsgDigitalizada").toString();
		
		%>
	
		if (pAcao == "anexo"){
		var textoUrl = escape("<%= nomeAnexo %>");
			window.open( "<%= dominio %>" + textoUrl, "Anexo", "width=800,height=600,Menubar = YES, Resizable = YES, Status = YES, scrollbars=YES, Top= 130, Left=100" );
		}else if (pAcao == "msgDigital"){
		var textoUrl = escape("<%= nomeMsgDigitalizada %>");
			novaJanela( "<%= dominio %>" + textoUrl, "Mensagem Digitalizada", "width=800,height=600,Menubar = YES, Resizable = YES, Status = YES, scrollbars=YES, Top= 130, Left=100" );
		}
	
	}
	
	// -->
</script>
	<body onload="javascript:onLoad()" style="margin: 0px 0px;">
		
		<form>
			<div align="left">

				<img src="../<bean:write name="_LAYOUT_" property="esquemaCores"/>/pasta_detalha.gif" name="imgDetalhe" tabindex="1" alt='Solu��o Escolhida'>
				<table cellpadding="2" cellspacing="1" border="0" align="center" width="100%">
					<col width="20%">
					<col width="80%">

					<tr>
						<td tabindex="2" class="tdHeader3">
							<span class="fieldName">Tipo da Mensagem:</span>
						</td>
						<td tabindex="2" class="tdHeader4">
						<logic:present name="cas_detail" property="mensagem.tipoMensagem.descricao">
							<bean:write name="cas_detail" property="mensagem.tipoMensagem.descricao" />
						</logic:present>
						</td>
					</tr>

					<tr>
						<td tabindex="2" class="tdHeader3">
							<span class="fieldName">Assunto da Mensagem:</span>
						</td>
						<td tabindex="2" class="tdHeader4">
						<logic:present name="cas_detail" property="mensagem.assunto.descricao">
							<bean:write name="cas_detail" property="mensagem.assunto.descricao" />
						</logic:present>
						</td>
					</tr>

					<tr>
						<td tabindex="2" class="tdHeader3">
							<span class="fieldName">Localidade da Ocorr�ncia:</span>
						</td>
						<td tabindex="2" class="tdHeader4">
						<logic:present name="cas_detail" property="localidadeOcorrencia.descricao">
							<bean:write name="cas_detail" property="localidadeOcorrencia.descricao" />
						</logic:present>
						</td>
					</tr>

					<tr>
						<td tabindex="2" class="tdHeader3">
							<span class="fieldName">Mensagem:</span>
						</td>
						<td tabindex="2" class="tdHeader4">
						<logic:present name="cas_detail" property="mensagem.textoFormatado">
							<bean:write name="cas_detail" property="mensagem.textoFormatado" filter="false" />
						</logic:present>
						</td>
					</tr>

					<tr>
						<td tabindex="2" class="tdHeader3">
							<span class="fieldName">Anexo:</span>
						</td>
						<td tabindex="2" class="tdHeader4">
							<input type="hidden" value="<bean:write name="cas_detail" property="mensagem.arquivoAnexo"/>" name="arqAnexo">
							<html:link href="javascript:abreAnexo('anexo');">
								<bean:write name="cas_detail" property="mensagem.arquivoAnexo" />
							</html:link>
						</td>
					</tr>

					<logic:notEqual name="cas_detail" property="mensagem.mensagemDigitalizada" value="">
						<tr>
							<td tabindex="2" class="tdHeader3">
								<span class="fieldName">Mensagem digitalizada:</span>
							</td>
							<td tabindex="2" class="tdHeader4">
								<input type="hidden" value="<bean:write name="cas_detail" property="mensagem.mensagemDigitalizada"/>" name="msgDigitalizada">
								<html:link href="javascript:abreAnexo('msgDigital');">
									<bean:write name="cas_detail" property="mensagem.mensagemDigitalizada" />
								</html:link>
							</td>
						</tr>
					</logic:notEqual>

					<tr>
						<td tabindex="2" class="tdHeader3">
							Tipo de Usu�rio:
						</td>
						<td tabindex="2" class="tdHeader4">
							<bean:write name="cas_detail" property="acionador.tipoAcionador.descricao" />
						</td>
					</tr>

					<tr>
						<td tabindex="2" class="tdHeader3">
							<%if (acnmto.getAcionador().getTipoAcionador().equals(TipoAcionador.PESSOA_JURIDICA)) {
			%>
							Nome Contato
							<%} else {%>
							Acionador
							<%}
			%>
						</td>
						<td tabindex="2" class="tdHeader4">

							<%if (acnmto.getAcionador().getTipoAcionador().equals(TipoAcionador.PESSOA_FISICA)) {%>
								<logic:present name="acionador" property="nome">
									<bean:write name="acionador" property="nome" />
								</logic:present>
							<%} else if (acnmto.getAcionador().getTipoAcionador().equals(TipoAcionador.FUNCIONARIO)) {%>
								<logic:present name="acionador" property="nome">
									<bean:write name="acionador" property="nome" />
								</logic:present>
							<%} else if (acnmto.getAcionador().getTipoAcionador().equals(TipoAcionador.PESSOA_JURIDICA)) {%>
								<logic:present name="acionador" property="nomeContato">
									<bean:write name="acionador" property="nomeContato" />
								</logic:present>
							<%}
			%>
						</td>
					</tr>

					<%if (acnmto.getAcionador().getTipoAcionador().equals(TipoAcionador.PESSOA_FISICA)) {%>
					<tr>
						<td tabindex="2" class="tdHeader3">
							CPF
						</td>
						<td tabindex="2" class="tdHeader4">
						<logic:present name="acionador" property="cpf">
							<bean:write name="acionador" property="cpf" />
						</logic:present>
						</td>
					</tr>

					<%} else if (acnmto.getAcionador().getTipoAcionador().equals(TipoAcionador.PESSOA_JURIDICA)) {%>
					<tr>
						<td tabindex="2" class="tdHeader3">
							CPF do Acionador
						</td>
						<td tabindex="2" class="tdHeader4">
							<logic:present name="acionador" property="cpfAcionador">
								<bean:write name="acionador" property="cpfAcionador" />
							</logic:present>
						</td>
					</tr>

					<tr>
						<td tabindex="2" class="tdHeader3">
							Raz�o Social
						</td>
						<td tabindex="2" class="tdHeader4">
							<logic:present name="acionador" property="razaoSocial">
								<bean:write name="acionador" property="razaoSocial" />
							</logic:present>
						</td>
					</tr>

					<tr>
						<td tabindex="2" class="tdHeader3">
							CNPJ
						</td>
						<td tabindex="2" class="tdHeader4">
							<logic:present name="acionador" property="cnpj">
								<bean:write name="acionador" property="cnpj" />
							</logic:present>
						</td>
					</tr>
					<%}
			%>

					<%if (acnmto.getAcionador().getTipoAcionador().equals(
					TipoAcionador.FUNCIONARIO)) {
			%>
					<tr>
						<td tabindex="2" class="tdHeader3">
							Matr�cula
						</td>
						<td tabindex="2" class="tdHeader4">
							<logic:present name="acionador" property="matricula">
								<bean:write name="acionador" property="matricula" />
							</logic:present>
						</td>
					</tr>

					<tr>
						<td tabindex="2" class="tdHeader3">
							Setor
						</td>
						<td tabindex="2" class="tdHeader4">
							<logic:present name="acionador" property="setor">
								<bean:write name="acionador" property="setor" />
							</logic:present>
						</td>
					</tr>
					<%}
			%>

					<tr>
						<td tabindex="2" class="tdHeader3">
							Sexo
						</td>
						<td tabindex="2" class="tdHeader4">
							<%if (acnmto.getAcionador().getSexo().equals("F")) {
			%>
							Feminino
							<%} else if (acnmto.getAcionador().getSexo().equals("M")) {
			%>
							Masculino
							<%}
			%>
						</td>
					</tr>

					<tr>
						<td tabindex="2" class="tdHeader3">
							E-mail
						</td>
						<td tabindex="2" class="tdHeader4">
							<bean:write name="cas_detail" property="acionador.email" />
						</td>
					</tr>

					<tr>
						<td tabindex="2" class="tdHeader3">
							Telefone
						</td>
						<td tabindex="2" class="tdHeader4">
							<bean:write name="cas_detail" property="acionador.codigoPaisTelefone" />
							(
							<bean:write name="cas_detail" property="acionador.codigoCidadeTelefone" />
							)
							<bean:write name="cas_detail" property="acionador.telefone" />
						</td>
					</tr>

					<tr>
						<td tabindex="2" class="tdHeader3">
							Fax
						</td>
						<td tabindex="2" class="tdHeader4">
							<bean:write name="cas_detail" property="acionador.codigoPaisFax" />
							(
							<bean:write name="cas_detail" property="acionador.codigoCidadeFax" />
							)
							<bean:write name="cas_detail" property="acionador.fax" />
						</td>
					</tr>

					<tr>
						<td tabindex="2" class="tdHeader3">
							Escolaridade
						</td>
						<td tabindex="2" class="tdHeader4">
							<%if (acnmto.getAcionador().getEscolaridade() != null) {
			%>
							<bean:write name="cas_detail" property="acionador.escolaridade.descricao" />
							<%}
			%>
						</td>
					</tr>

					<tr>
						<td tabindex="2" class="tdHeader3">
							Faixa et&aacute;ria
						</td>
						<td tabindex="2" class="tdHeader4">
							<%if (acnmto.getAcionador().getFaixaEtaria() != null) {

			%>
							<bean:write name="cas_detail" property="acionador.faixaEtaria.intervalo" />
							<%}
			%>
						</td>
					</tr>

					<tr>
						<td tabindex="2" class="tdHeader3">
							Modo de envio da resposta
						</td>
						<td tabindex="2" class="tdHeader4">
							<bean:write name="cas_detail" property="acionador.meioEnvioRespostaOrgao.meioEnvioResposta.descricao" />
						</td>
					</tr>

					<tr>
						<td tabindex="2" class="tdHeader3">
							UF de Envio
						</td>
						<td tabindex="2" class="tdHeader4">
							<%if (acnmto.getAcionador().getUf() != null) {

			%>
							<bean:write name="cas_detail" property="acionador.uf.sigla" />
							<br />
							<%}

			%>
						</td>
					</tr>

					<tr>
						<td tabindex="2" class="tdHeader3">
							Pa&iacute;s de Envio
						</td>
						<td tabindex="2" class="tdHeader4">
							<bean:write name="cas_detail" property="acionador.pais.descricao" />
						</td>
					</tr>

					<tr>
						<td tabindex="2" class="tdHeader3">
							Informa&ccedil;&atilde;o da resposta por carta
						</td>
						<td tabindex="2" class="tdHeader4">
							<%if (acnmto.getAcionador().getInformacoesRecebimentoRespostaCarta() != null) {

			%>
							<bean:write name="cas_detail" property="acionador.informacoesRecebimentoRespostaCarta.logradouro" />
							<%}

			%>
						</td>
					</tr>

					<tr>
						<td tabindex="2" class="tdHeader3">
							Respons�vel
						</td>
						<td tabindex="2" class="tdHeader4">
							<bean:write name="cas_detail" property="funcionario.nome" />
						</td>
					</tr>

					<tr>
						<td tabindex="2" class="tdHeader3">
							Data do acionamento
						</td>
						<td tabindex="2" class="tdHeader4">
							<bean:write name="cas_detail" property="dataAcionamento" format="dd/MM/yyyy" />
						</td>
					</tr>

					<tr>
						<td tabindex="2" class="tdHeader3">
							Prazo interno
						</td>
						<td tabindex="2" class="tdHeader4">
							<bean:write name="cas_detail" property="dataPrevistaResolucaoInterna" format="dd/MM/yyyy" />
						</td>
					</tr>

					<tr>
						<td tabindex="2" class="tdHeader3">
							Prazo externo
						</td>
						<td tabindex="2" class="tdHeader4">
							<bean:write name="cas_detail" property="dataPrevistaResolucaoExterna" format="dd/MM/yyyy" />
						</td>
					</tr>


					<tr>
						<td tabindex="2" class="tdHeader3">
							<span class="fieldName">T�tulo da resposta:</span>
						</td>
						<td tabindex="2" class="tdHeader4">
							<%if (acnmto.getRespostaAcionamento() != null) {

			%>
							<bean:write name="cas_detail" property="respostaAcionamento.titulo" filter="false" />
							<%}

			%>
						</td>
					</tr>
					
					<tr>
						<td tabindex="2" class="tdHeader3">
							<span class="fieldName">Resposta:</span>
						</td>
						<td tabindex="2" class="tdHeader4">
							<%if (acnmto.getRespostaAcionamento() != null) {

			%>
							<bean:write name="cas_detail" property="respostaAcionamento.textoFormatado" filter="false" />
							<%}

			%>
						</td>
					</tr>

					<tr>
						<td tabindex="2" class="tdHeader3">
							Avalia&ccedil;&atilde;o
						</td>
						<td tabindex="2" class="tdHeader4">
							<%if (acnmto.getRespostaAcionamento() != null
					&& acnmto.getRespostaAcionamento()
							.getTipoAvaliacaoResposta() != null) {

			%>
							<bean:write name="cas_detail" property="respostaAcionamento.tipoAvaliacaoResposta.descricao" />
							<%}

			%>
						</td>
					</tr>

					</div>
					</div>

					<input type="hidden" value="<%= request.getAttribute("nomeDiretorioOrgao") %>" name="dirArqAnexo">

					</form>
	</body>
</html>
