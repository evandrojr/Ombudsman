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

// Fun��o executada ao carregar a tela
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
										�rea Geradora:
									</label>
								</td>
								<td class="tdHeader4" align="left">
									<input readOnly="true" id="areaGeradora" name="areaGeradora" size="50" maxlength="50" class="text" tabindex="3" value="<bean:write name="object" property="areaGeradora"/>">
								</td>
							</TR>
							<TR>
								<td class="tdHeader3">
									<label for="responsavel">
										Respons�vel:
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
										Itens visualiza��o:
									</label>
								</td>
								<td class="tdHeader4" align="left">
									<label for="Cabecalho" tabindex="7">
										<INPUT disabled="true" type="checkbox" id="Cabecalho" value="true" <logic:equal name="object" property="possuiCabecalho" value="true">checked</logic:equal> name=checkbox1>
										Cabe�alho
									</label>
									<br>
									<label for="Grafico" tabindex="8">
										<INPUT disabled="true" type="checkbox" id="Grafico" value="true" <logic:equal name="object" property="possuiGrafico" value="true">checked</logic:equal> name=checkbox1>
										Gr�fico
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
