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

<%@ page import="java.util.*"%>
<%@ taglib uri="/tags/struts-html" prefix="html"%>
<%@ taglib uri="/tags/struts-bean" prefix="bean"%>
<%@ taglib uri="/tags/struts-logic" prefix="logic"%>
<%@ taglib uri="/tags/cewolf" prefix="cewolf"%>
<%@ taglib uri="http://jakarta.apache.org/taglibs/log-1.0" prefix="log"%>

<html:html lang="pt">

<%String contextPath = request.getScheme() + "://"
					+ request.getServerName() + ":" + request.getServerPort()
					+ request.getContextPath();

			%>
<head>
	<%@ include file="inc/header.inc.jsp"%>
	<title>Indicadores</title>
	<link rel='stylesheet' media='all' href='../../<bean:write name="_LAYOUT_" property="esquemaCores"/>/estilo_conteudo.css' type='text/css'>

	<script type="text/javascript" charset='iso-8859-1'>
	<!-- //

	    var indCaption = ['Satisfa&ccedil;&atilde;o', 'Tempo de Atendimento', 'Total de Atendimentos', 'Total de Atendimentos no Prazo']['<bean:write name='indicadoresExternosForm' property='sel_indicador'/>' - 1];

		function fillHeader() {
		
			//var sel_tabela = <%= request.getParameter("sel_tabela") %>;
			getRef('indCaptionSpan').innerHTML = 	indCaption;	

			getRef('r_modo_exibicao').innerHTML = modos_exibicao['cd'.indexOf('<bean:write name='indicadoresExternosForm' property='r_modo_exibicao'/>')];
			getRef('sel_indicador').innerHTML = indCaption;
			getRef('txt_periodo_i').innerHTML = '<bean:write name='indicadoresExternosForm' property='txt_periodo_i'/>';
			getRef('txt_periodo_f').innerHTML = '<bean:write name='indicadoresExternosForm' property='txt_periodo_f'/>';
			getRef('sel_tipo_grafico').innerHTML = tipos_grafico['<bean:write name='indicadoresExternosForm' property='sel_tipo_grafico'/>'];
			getRef('sel_ouvidorias').innerHTML = <bean:write name='indicadoresExternosForm' property='sel_ouvidorias'/>;
			getRef('sel_agrupamento').innerHTML = agrupamento.fromChar('<bean:write name='indicadoresExternosForm' property='sel_agrupamento'/>');
			getRef('sol').innerHTML = '<%= br.gov.serpro.ouvidoria.util.ReportKit.getLocationCaptions(request.getParameter("h_locais")) %>';
		
		}
		
		function tabelaChanged(el) {
			var target = el.form.sel_itens_tabela.options;
			var tableIndex = el.options[el.selectedIndex].value;
			populateOptions(tableData[tableIndex], target, true);
		}
		
		function submitIt(frm) {
			frm.submit();
		}

		function onLoad() {
			try { document.getElementById("titulo").focus(); } catch(e) {}
		}
	
	// -->	
	</script>

	<!-- INÍCIO DOS SCRIPTS UTILIZADOS NO ENVIO E IMPRESSÃO-->
	<script src="../../js/util.js"></script>
	<script type="text/javascript" charset='iso-8859-1'>
	<!-- //
		function imprimir() {
			win = novaJanela("","Boletim", 750, 570, "yes","no", 10, 10 );
			win.document.write(montaHtmlImpressaoIndicadores("<%= contextPath %>", "<bean:write name="_LAYOUT_" property="esquemaCores"/>", document.getElementById("tab_conteudo").innerHTML));
			win.document.close();
			win.print();
		}
		
		function enviar() {
			document.forms["frmHtml"].elements["htmlRelatorio"].value = document.getElementById("tab_conteudo").innerHTML;
			document.forms["frmHtml"].submit();
		}
	// -->
	</script>
	<!-- FIM DOS SCRIPTS UTILIZADOS NO ENVIO E IMPRESSÃO-->

</head>

<body onload="onLoad();">




	<html:form action="/IndicadoresExternosSearch" method="post">

		<!-- INÍCIO DA ÁREA DO RELATÓRIO -->
		<div id="tab_conteudo">

			<input type='hidden' name='op' />

			<!-- INÍCIO DA ÁREA DE CABEÇALHO -->
			<DIV id="tab_cabecalho">

				<TABLE cellspacing="1" cellpadding="2" width="100%" border="0">
					<TBODY>
						<TR>
							<TD class=contentBold align=middle>
								&nbsp;
								<label tabindex="1" id="titulo">
									Indicadores Externos - <span id='indCaptionSpan'></span>
								</label>
							</TD>
						</TR>
					</TBODY>
				</TABLE>

				<TABLE cellSpacing=1 cellPadding=2 width="100%" border=0>
					<TBODY>
						<TR>
							<TD class=contentBold colSpan=2>
								&nbsp;
								<label tabindex="2">
									Par&acirc;metros Utilizados para Gerar o Indicador:
								</label>
							</TD>
						</tr>

						<%@ include file="IndicadoresExternos-results-params.inc.jsp"%>

					</TBODY>
				</TABLE>
			</DIV>
			<!-- FIM DA ÁREA DE CABEÇALHO -->

			<!-- INÍCIO DA ÁREA DO GRÁFICO -->
			<DIV id="tab_grafico">
				<TABLE cellspacing="1" cellpadding="2" width="100%" border="0">

					<TBODY>
						<TR>
							<TD align=middle>

								<%-- Cewolf image --%>
								<jsp:useBean id="pieData" class="br.gov.serpro.ouvidoria.util.PieData" scope="page" />
								<jsp:useBean id="myEnhancer" class="br.gov.serpro.ouvidoria.util.PlotEnhancer" scope="page" />
								<jsp:useBean id="params" class="br.gov.serpro.ouvidoria.util.ParamBean" scope="request" />
								<jsp:setProperty name="params" property="*" />

								<%@ include file="IndicadoresExternos-chart.inc.jsp"%>
								
								<img tabindex="4" 
										name="img_grafico"
										alt="Gr&aacute;fico com os &Iacute;ndices de Satisfa&ccedil;&atilde;o da Ouvidoria" 
										border="0" width="600" height="320" 
										src="<%= pageContext.getAttribute("imgURL") %>" />

							</TD>
						</TR>
					</TBODY>
				</TABLE>

			</DIV>
			<!-- FIM DA ÁREA DO GRÁFICO -->

			<!-- INÍCIO DA ÁREA DA TABELA DE DADOS -->
			<DIV id="tab_dados">
				<TABLE cellspacing="1" cellpadding="2" width="100%" border="0">
					<TBODY>
						<%@ include file="IndicadoresExternos-records.inc.jsp"%>
					</TBODY>
				</TABLE>
			</DIV>

			<!-- FIM DA ÁREA DA TABELA DE DADOS -->

		</div>
		<!-- FIM DA ÁREA D0 RELATÓRIO -->
	</html:form>

	<!-- INÍCIO DA ÁREA DE AÇÕES DO USUÁRIO -->
	<TABLE cellspacing="0" cellpadding="2" width="100%" border="0">
		<TBODY>
			<TR>
				<TD align="middle">
					<A title="Imprimir" href="javascript:imprimir()"><IMG title=Imprimir src="../../images/impressora.jpg" border=0></A>&nbsp;&nbsp; <A title="Imprimir" href="javascript:imprimir()">IMPRIMIR</A>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <A title="Gerar boletim" href="javascript:enviar();"><IMG title="Gerar Boletim" src="../../images/formulario.jpeg" border=0></A> <A title="Gerar boletim"
						href="javascript:enviar();">GERAR BOLETIM</A>
				</TD>
			</TR>
		</TBODY>
	</TABLE>
	<!-- FIM DA ÁREA DE AÇÕES DO USUÁRIO -->

	<!-- INÍCIO DO FORMULÃ?RIO PARA ENVIAR O HTML DA PÁGINA -->
	<form name="frmHtml" action="../../../aprendizado/GerarBoletim.do" method="post">
		<input type="hidden" name="htmlRelatorio">
		<input type="hidden" name="imgId" value="<%= pageContext.getAttribute("imgURL") %>">
	</form>
	<!-- FIM DO FORMULÃ?RIO PARA ENVIAR O HTML DA PÁGINA -->
	<script type="text/javascript" charset='iso-8859-1'>
fillHeader();
</script>
</body>
</html:html>
