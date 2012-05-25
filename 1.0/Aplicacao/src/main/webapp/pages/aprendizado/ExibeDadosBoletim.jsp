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

<!-- TagLibs Struts -->
<%@ taglib uri="/tags/struts-logic" prefix="logic"%>
<%@ taglib uri="/tags/struts-bean" prefix="bean"%>
<%@ taglib uri="/tags/struts-html" prefix="html"%>
<%@ taglib uri="http://jakarta.apache.org/taglibs/log-1.0" prefix="log"%>

<html:html lang="pt">
<head>
	<html:base />
	<script src="../js/util.js" type="text/javascript"></script>
	<script language="JavaScript">

// Função executada ao carregar a tela
	function onLoad(){
		window.parent.document.getElementById("detalhe").style.height = this.document.body.scrollHeight;
		window.parent.document.getElementById("detalheEnvios").style.height = 0;

		document.getElementById("imgDetalhe").focus();
	}

	function visualizarBoletim(url){
		novaJanela(url,"Boletim",800,600,1,1,130,100);
	}
	
	function alterar(){
		abreConfirmacao('publicar');
	}
	
	function distribuirBoletim(){
	
		document.forms[0].action='../../aprendizado/AtualizarHistoricoEnvio.do?action=telaDistribuir&idBoletim=<bean:write name="object" property="id"/>';
		document.forms[0].target='detalheEnvios';
		document.forms[0].submit();
	}
	
	function publicar() {
		document.forms[0].submit();
	}

</script>

	<meta http-equiv='Content-Type' content='text/html; charset=iso-8859-1'>
	<title>Boletim</title>
</head>
<link rel="stylesheet" media="all" href="../<bean:write name="_LAYOUT_" property="esquemaCores"/>/estilo_conteudo.css" type="text/css">
<link rel='stylesheet' type='text/css' media='print' href='../estilo_print.css'>
<body onload="onLoad();" style="margin: 0px 0px;">

	<form name="boletim" method="post" action="../../aprendizado/AtualizarBoletim.do?action=publicar&id=<bean:write name="object" property="id"/>">
		<!-- <table cellpadding='2' cellspacing='1' border='0' width='100%'> -->
		<table border="0" width="100%" cellpadding="0" cellspacing="0">
			<tr>
				<td align="left">
					<img src="../<bean:write name="_LAYOUT_" property="esquemaCores"/>/pasta_detalha.gif" name="imgDetalhe" id="imgDetalhe" tabindex="1" alt='Boletim Escolhido'>
					<table cellpadding='2' cellspacing='1' border='0' width='100%'>
						<table width="100%" name="rsTable" id="rsTable" cellpadding="2" cellspacing="1" border="0">
							<TR>
								<td class="tdHeader3" width="10%">
									<label for="nome">
										Nome:
									</label>
								</td>
								<td class="tdHeader4" width="90%" align="left">
									<input readOnly="true" id="nome" name="nome" size="50" maxlength="50" class="text" tabindex="2" value="<bean:write name="object" property="nome"/>">
								</td>
							</TR>
							<TR>
								<td class="tdHeader3">
									<label for="areaGeradora">
										Área Geradora:
									</label>
								</td>
								<td class="tdHeader4" align="left">
									<input readOnly="true" id="areaGeradora" name="areaGeradora" size="50" maxlength="50" class="text" tabindex="3" value="<bean:write name="object" property="areaGeradora"/>">
								</td>
							</TR>
							<TR>
								<td class="tdHeader3">
									<label for="responsavel">
										Responsável:
									</label>
								</td>
								<td class="tdHeader4" align="left">
									<input readOnly="true" id="responsavel" name="responsavel" size="50" maxlength="50" class="text" tabindex="4" value="<bean:write name="object" property="funcionario.nome"/>">
								</td>
							</TR>
							<TR>
								<td class="tdHeader3">
									<label for="telefone">
										Telefone:
									</label>
								</td>
								<td class="tdHeader4" align="left">
									<input readOnly="true" id="telefone" name="telefone" size="15" maxlength="15" class="text" tabindex="5" value="<bean:write name="object" property="telefone"/>">
								</td>
							</TR>
							<TR>
								<td class="tdHeader3">
									<label for="conteudo">
										Conte&uacute;do:
									</label>
								</td>
								<td class="tdHeader4" align="left">
									<textarea readOnly="true" name="conteudo" id="conteudo" cols="50" rows="3" tabindex="6"><bean:write name="object" property="conteudo" /></textarea>
								</td>
							</TR>
							<TR>
								<td class="tdHeader3">
									<label for="itens visualizacao">
										Itens visualização:
									</label>
								</td>
								<td class="tdHeader4" align="left">
									<label for="Cabecalho" tabindex="7">
										<INPUT disabled="true" type="checkbox" id="Cabecalho" value="true" <logic:equal name="object" property="possuiCabecalho" value="true">checked</logic:equal> name=checkbox1>
										Cabeçalho
									</label>
									<br>
									<label for="Grafico" tabindex="8">
										<INPUT disabled="true" type="checkbox" id="Grafico" value="true" <logic:equal name="object" property="possuiGrafico" value="true">checked</logic:equal> name=checkbox1>
										Gráfico
									</label>
									<br>
									<label for="tabela dados" tabindex="9">
										<INPUT disabled="true" type="checkbox" id="tabela dados" value="true" <logic:equal name="object" property="possuiTabelaDados" value="true">checked</logic:equal> name=checkbox1>
										Tabela dados
									</label>
									<br>
									<label for="publicar" tabindex="10">
										<INPUT type="checkbox" name="publicar" id="publicar" value="true" <logic:equal name="object" property="publicar" value="true">checked</logic:equal> name=checkbox1>
										Publicar boletim
									</label>
									<br>
								</td>
							</TR>
							<tr>
								<td class="tdHeader3" id="botoes" colspan="2">
									<div align="center">

										<% //String enderecoHost = request.getRequestURL().substring(0,((request.getRequestURL().length())-32));%>

										<input type="button" tabindex="11" name="atualizar" id="atualizar" value="Atualizar" class="button" onClick="alterar();">
										<input type="button" 
												tabindex="12" 
												name="visualizar" 
												id="visualizar" 
												value="Visualizar" 
												class="button" 
												onclick="visualizarBoletim('/<%=request.getAttribute("diretorio")%>/boletins/boletim_<bean:write name="object" property="id"/>.html');">
										<input type="button" tabindex="13" name="distribuir" id="distribuir" value="Distribuir" class="button" onclick="distribuirBoletim();">
									</div>
								</td>
							</tr>
						</table>
						</td>
						</tr>

					</table>

					</form>
</body>
</html:html>
