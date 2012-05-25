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

				<img src="../<bean:write name="_LAYOUT_" property="esquemaCores"/>/pasta_detalha.gif" name="imgDetalhe" tabindex="1" alt='Solução Escolhida'>
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
							<span class="fieldName">Localidade da Ocorrência:</span>
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
							Tipo de Usuário:
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
							Razão Social
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
							Matrícula
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
							Responsável
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
							<span class="fieldName">Título da resposta:</span>
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
