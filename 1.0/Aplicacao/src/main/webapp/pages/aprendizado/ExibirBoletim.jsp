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

<%--
 /* 
   -- Módulo:       Aprendizado
   -- 
   -- Descrição:    Exibir de Boletins
   -- 
   -- Versão:       1.0
   -- Data:         02/02/2005   
  */
--%>

<%@ taglib uri="/tags/struts-logic" prefix="logic" %>
<%@ taglib uri="/tags/struts-bean" prefix="bean"%>
<%@ taglib uri="/tags/struts-html" prefix="html"%>

<html:html lang="pt">

	<%	String contextPath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath(); %>

	<head id="header">
		<html:base />
		<meta http-equiv='Content-Type' content='text/html; charset=iso-8859-1'>
		<title>Boletim</title>
		<link rel="stylesheet" media="all" href="../<bean:write name="_LAYOUT_" property="esquemaCores"/>/estilo_conteudo.css" type="text/css">
	</head>
	
	<script type="text/javascript" src="../js/cb.js"></script>
	<script type="text/javascript" src="../js/str.js"></script>
	<script type="text/javascript" src="../js/util.js"></script>	
	<script language="JavaScript">function writeRounded(a,b) {};</script>
	<script language="JavaScript">var adder = { sum: [], add: function (key, v) {}, writeSum: function (key) {}, getSum: function (key) {} };</script>
	
	<script type="text/javascript" charset='iso-8859-1'>
	
		function onLoad() {
			var showCabecalho = <bean:write name="_BOLETIM_" property="possuiCabecalho"/>;
			var showGrafico   = <bean:write name="_BOLETIM_" property="possuiGrafico"/>;
			var showDados     = <bean:write name="_BOLETIM_" property="possuiTabelaDados"/>;
		
			document.getElementById("tab_cabecalho").style.display = showCabecalho?"":"none";
			document.getElementById("tab_grafico").style.display   = showGrafico?"":"none";
			document.getElementById("tab_dados").style.display     = showDados?"":"none";
		}
	
		function montaHtmlImpressaoBoletim(htmlContent) {
			var html = "";
			var estilo1 = '<link rel="stylesheet" type="text/css" media="all" href="../../pages/<bean:write name="_LAYOUT_" property="esquemaCores"/>/estilo_conteudo.css">';
			var estilo2 = '<link rel="stylesheet" type="text/css" media="print" href="../../pages/<bean:write name="_LAYOUT_" property="esquemaCores"/>/estilo_print.css">';
	
			html  = '<html lang="pt">\n';
			html += '<head>';
			html += '<base href="<%= contextPath %>/" />';
			html += '<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">';
			html += '<title>Boletim</title>';
			html += '<link rel="stylesheet" type="text/css" media="all" href="<%= contextPath %>/pages/<bean:write name="_LAYOUT_" property="esquemaCores"/>/estilo_conteudo.css">';
			html += '<link rel="stylesheet" type="text/css" media="print" href="<%= contextPath %>/pages/<bean:write name="_LAYOUT_" property="esquemaCores"/>/estilo_print.css">';
			html += '<script language="JavaScript" src="<%= contextPath %>/pages/js/util.js"></' + 'script>';
			html += '<script language="JavaScript">function writeRounded(a,b) {};</' + 'script>';
			html += '<script language="JavaScript">var adder = { sum: [], add: function (key, v) {}, writeSum: function (key) {}, getSum: function (key) {} };</' + 'script>';
			html += '</head>\n';
			html += '<body>\n';
			html += htmlContent;
			html += '</body>';
			html += '</html>\n';
			
			return html;		
		}

		function imprimir() {
			win = novaJanela("","Boletim", 750, 570, "yes","no", 10, 10 );
			win.document.write(montaHtmlImpressaoBoletim(document.getElementById("boletim").innerHTML));
			win.document.close();
			win.print();
		}

		function enviar() {
			document.forms["frmHtml"].elements["htmlBoletim"].value = montaHtmlImpressaoBoletim(document.getElementById("boletim").innerHTML);
			document.forms["frmHtml"].submit();
		}
	</script>

<body onLoad="onLoad();">

	<div id="content">
	<h1 tabindex="1" id="titulo" >CRIAÇÃO DE BOLETINS</h1>
	<hr>

	<div id="boletim">
		<table cellpadding="2" cellspacing="1" border="0" width="100%">
		<tr>
			<td class='contentBold' align='middle'>&nbsp;<b><bean:write name="_BOLETIM_" property="nome"/>&nbsp;-&nbsp;Nº&nbsp;<bean:write name="_BOLETIM_" property="numero"/></b></td>
		</tr>
		</table>
		
		<table cellpadding='2' cellspacing='1' border='0' width="100%">
		<tr>
			<td colspan='2' class='contentBold'>&nbsp;Informações Gerais:</td>
			<tr>
				<td width="30%" class='tdHeader3'><label for="area">Área geradora do boletim:</label></td>
				<td class='tdHeader4'><bean:write name="_BOLETIM_" property="areaGeradora"/></td>					
			</tr>
			<tr>
				<td width="30%" class='tdHeader3'><label for="responsavel">Responsável:</label></td>
				<td class='tdHeader4'>
				<logic:present name="_FUNCIONARIO_" property="nome" scope="session">
					<bean:write name="_FUNCIONARIO_" property="nome" scope="session"/>
				</logic:present>
				</td>					
			</tr>
			<tr>
				<td width="30%" class='tdHeader3'><label for="telefone">Telefone:</label></td>
				<td class='tdHeader4'><bean:write name="_BOLETIM_" property="telefone"/></td>					
			</tr>
			<tr>
				<td colspan='2'>&nbsp;</td>	
			</tr>
			<tr>
				<td colspan='2'><bean:write name="_BOLETIM_" property="conteudo"/></td>					
			</tr>
		</table>
		
		<%= request.getSession().getAttribute("_HTML_RELATORIO_") %>

		<script type="text/javascript" charset='iso-8859-1'>
			var showCabecalho = <bean:write name="_BOLETIM_" property="possuiCabecalho"/>;
			var showGrafico   = <bean:write name="_BOLETIM_" property="possuiGrafico"/>;
			var showDados     = <bean:write name="_BOLETIM_" property="possuiTabelaDados"/>;
		
			document.getElementById("tab_cabecalho").style.display = showCabecalho?"":"none";
			document.getElementById("tab_grafico").style.display   = showGrafico?"":"none";
			document.getElementById("tab_dados").style.display     = showDados?"":"none";
		</script>

	</div>	

	<table cellpadding='2' cellspacing='0' border='0' width="100%">
		<tr>
			<td align='middle'>
				<A title=Imprimir href='javascript:imprimir();'>
					<IMG title=Imprimir src="../images/impressora.jpg" border=0>
				</a>
				&nbsp;&nbsp;
				<A title=Imprimir href ='javascript:imprimir();'>IMPRIMIR</a>		
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				
				<A title="Gerar Boletim" href='javascript:enviar();'>
					<IMG title="Gerar Boletim" src="../images/save.jpg" border=0 >
				</a>		
				<A title="Gerar Boletim" href='javascript:enviar();'>SALVAR BOLETIM</a>		
			</td>
		</tr>
	</table>
	
	<hr>
	<p class="voltar"> 
		<a tabindex="12" title="voltar para página anterior" href="javascript:window.location.href='../aprendizado/GerarBoletim.do?new=false'" >voltar</a>
	</p>
</div>

<form name="frmHtml" action="../../aprendizado/AtualizarBoletim.do" method="post">
	<input type="hidden" name="action" value="salvar">
	<input type="hidden" name="htmlBoletim">
</form>
	
</body>
</html:html>
