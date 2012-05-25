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

<%@ page import="java.util.*" %>
<%@ taglib uri="/tags/struts-html" prefix="html"%>
<%@ taglib uri="/tags/struts-bean" prefix="bean"%>
<%@ taglib uri="/tags/struts-logic" prefix="logic"%>
<%@ taglib uri="/tags/cewolf" prefix="cewolf" %>

<html:html lang="pt">
<%	String contextPath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath(); %>
<head>


	<%@ include file="inc/header.inc.jsp" %>
	<title>Indicadores</title>
	<link rel='stylesheet'  media='all' href='../../<bean:write name="_LAYOUT_" property="esquemaCores"/>/estilo_conteudo.css' type='text/css'>

	<script type="text/javascript" charset='iso-8859-1'>
	<!-- //
		var tableData = [
		<%= request.getAttribute("ii_tabela_array")%>
		];
		
		var a_sel_itens_tabela = '<%= br.gov.serpro.ouvidoria.util.freechart.data.StringKit.join(request.getParameterValues("sel_itens_tabela")) %>'.split(',');
		
		var bases_x = ['Tabela', 'Sub-&oacute;rg&atilde;o(s) / localidade(s)'];
		var sel_tabela_caption = '<%= br.gov.serpro.ouvidoria.util.ReportHelperInt.getTableList()[Integer.parseInt(request.getParameter("sel_tabela"))] %>';
		
		function fillHeader() {
			var sel_tabela = <%= request.getParameter("sel_tabela") %>;
			getRef('r_modo_exibicao').innerHTML = modos_exibicao['cd'.indexOf('<bean:write name='indicadoresInternosForm' property='r_modo_exibicao'/>')];
			getRef('sel_tabela').innerHTML = sel_tabela_caption;
			getRef('sel_itens_tabela').innerHTML = tableData[sel_tabela].filter(function (el, index) {return a_sel_itens_tabela.indexOf(el[0]) < 0;}).iterate(function(el, index) {return el ? el[1] : '???';}).join(', ');
			getRef('txt_periodo_i').innerHTML = '<bean:write name='indicadoresInternosForm' property='txt_periodo_i'/>';
			getRef('txt_periodo_f').innerHTML = '<bean:write name='indicadoresInternosForm' property='txt_periodo_f'/>';
			getRef('sel_tipo_grafico').innerHTML = tipos_grafico['<bean:write name='indicadoresInternosForm' property='sel_tipo_grafico'/>'];
			getRef('r_base_x').innerHTML = bases_x[<bean:write name='indicadoresInternosForm' property='r_base_x'/>] ;
			getRef('sol').innerHTML = '<%= br.gov.serpro.ouvidoria.util.ReportKit.getLocationCaptions(request.getParameter("h_locais")) %>';

			getRef('img_grafico').title = "Gráfico com os Índices de " + sel_tabela_caption + " da Ouvidoria";

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

<jsp:useBean id="params" class="br.gov.serpro.ouvidoria.util.ParamBean" scope="request"/>

<body onload='onLoad()'>




<html:form action="/IndicadoresInternosSearch" method="post">

<!-- INÍCIO DA ÁREA DO RELATÓRIO -->
<div id="tab_conteudo">

<input type='hidden' name='op' />

	<!-- INÍCIO DA ÁREA DE CABEÇALHO -->
	<DIV id="tab_cabecalho">

	<TABLE cellspacing="1" cellpadding="2" width="100%" border="0">
	<TBODY>
		<TR>
			<TD class=contentBold align=middle>&nbsp;<label tabindex="1" id="titulo">Indicadores Internos da Ouvidoria - <%= params.getTitle() %></LABEL></TD>
		</TR>
	</TBODY>
	</TABLE>

	<TABLE cellSpacing=1 cellPadding=2 width="100%" border=0>
	<TBODY>
	<TR>
	    <TD class=contentBold colspan=2>&nbsp;<LABEL tabindex="2">Par&acirc;metros Utilizados para Gerar o Indicador:</LABEL></TD>
	</TR>
	<%@ include file="IndicadoresInternos-results-params.inc.jsp" %>
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
			<jsp:useBean id="pieData" class="br.gov.serpro.ouvidoria.util.PieData" scope="page"  />

			<jsp:useBean id="myEnhancer" class="br.gov.serpro.ouvidoria.util.PlotEnhancer" scope="page" />

			<jsp:setProperty name="params" property="*"/>
			
			<%@ include file="IndicadoresInternos-chart.inc.jsp" %>

			<img tabindex="4" name="img_grafico" alt="Gr&aacute;fico com os &Iacute;ndices de Satisfa&ccedil;&atilde;o da Ouvidoria" border="0" width="600" height="320" src="<%= pageContext.getAttribute("imgURL") %>"/>

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
	<%@ include file="IndicadoresInternos-records.inc.jsp" %>
	</TBODY>
	</TABLE>
	<% if ( request.getParameter("sel_tabela").equals("10")) {%>
			<p class=contentBold>
				* Esse relatório considera como total os acionamentos cadastrados nos sistema 
				e os atendimentos realizados via Script pelos atendentes do Orgão.
			</p>
	<% } %>
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
   		<A tabindex="6" title="Imprimir" href="javascript:imprimir()"><IMG title=Imprimir src="../../images/impressora.jpg" border=0></A>&nbsp;&nbsp;
		<A tabindex="6" title="Imprimir" href="javascript:imprimir()">IMPRIMIR</A>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
		<A tabindex="6" title="Gerar boletim" href="javascript:enviar();"><IMG title="Gerar Boletim" src="../../images/formulario.jpeg" border=0></A> 
		<A tabindex="6" title="Gerar boletim" href="javascript:enviar();">GERAR BOLETIM</A> 
	</TD>
	</TR>
	</TBODY>
</TABLE>
<!-- FIM DA ÁREA DE AÇÕES DO USUÁRIO -->
<!-- INÍCIO DO FORMULÁRIO PARA ENVIAR O HTML DA PÁGINA -->
<form name="frmHtml" action="../../../aprendizado/GerarBoletim.do" method="post">
	<input type="hidden" name="htmlRelatorio">
	<input type="hidden" name="imgId" value="<%= pageContext.getAttribute("imgURL") %>">
</form>
<!-- FIM DO FORMULÁRIO PARA ENVIAR O HTML DA PÁGINA -->
<script type="text/javascript" charset='iso-8859-1'>
fillHeader();
</script>
</body>
</html:html>	