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

<%@ taglib uri="/tags/struts-html" prefix="html"%>
<%@ taglib uri="/tags/struts-logic" prefix="logic"%>
<%@ taglib uri="/tags/struts-bean" prefix="bean"%>

<html:html lang="pt">


<head>
	<%@ include file="inc/header.inc.jsp" %>
	<title>Indicadores - Internos</title>
	<link rel='stylesheet'  media='all' href='../../<bean:write name="_LAYOUT_" property="esquemaCores"/>/estilo_conteudo.css' type='text/css'>

	<%@ include file="inc/Localidades.inc.jsp" %>

	<script type="text/javascript" charset='iso-8859-1'>
	<!-- //

		var MAX_SELECTED_ITEMS = <bean:write name="maximoIndColuna"/>;
		
		// Guarda os ids e descrições dos registros das tabelas
		var tableData = [
		<%= request.getAttribute("ii_tabela_array")%>
		];
		
		var v_sel_itens_tabela = '<%--= br.gov.serpro.ouvidoria.util.freechart.data.StringKit.join(request.getParameterValues("sel_itens_tabela")) --%>';
		
		// var tipos_grafico_options = [ ['pie3d', 'Pizza'], ['verticalbar3d', 'Barra'], ['line', 'Linha'], ['stackedverticalbar3d', 'Barra empilhada vertical'], ['stackedverticalbar', 'Barra empilhada horizontal'] ];
		
		function modeChanged(el) {
			populateOptions(tipos_grafico_options.slice(el.value == 'd' ? 1 : 0), el.form.sel_tipo_grafico, true);
		}
		
		function validate(frm) {
		
			var msg = '';
			var errors = new Array();
		
		  	var el, errorEl;
		
			el = frm['txt_periodo_i'];
			if (el.value == null || !isValidDate(el.value)) {
				msg += formataErro('Data inicial inválida, use o formato dd/mm/aaaa');
				errorEl = el;
			}
		
			el = frm['txt_periodo_f'];
			if (el.value == null || !isValidDate(el.value)) {
				msg += formataErro('Data final inválida, use o formato dd/mm/aaaa');
				errorEl = el;
			}
		
			if (frm.txt_periodo_i.value && frm.txt_periodo_f.value && isValidDate(frm.txt_periodo_i.value) && isValidDate(frm.txt_periodo_f.value) && ( convertPtBr2ISO8601DateShort(frm.txt_periodo_i.value) > convertPtBr2ISO8601DateShort(frm.txt_periodo_f.value) ) ) {
				msg += formataErro('A data inicial &eacute; maior que a data final');
				errorEl = frm.txt_periodo_i;
			}
		
			el = frm['sel_tabela'];
			if (getSelectedValue(el) < 0) {
		    	msg += formataErro('Selecione qual tabela usar');
			    errorEl = el;
		  
			} else {
		
				el = frm['sel_itens_tabela'];
				if (el.selectedIndex < 0) {
					msg += formataErro('Selecione ao menos um item da tabela "' + getSelectedName(frm.sel_tabela) + '"');
					errorEl = el;
				} else if (countSelected(el) > MAX_SELECTED_ITEMS) {
					msg += formataErro('Selecione no máximo ' + MAX_SELECTED_ITEMS + ' itens da tabela "' + getSelectedName(frm.sel_tabela) + '"');
			   	 	errorEl = el;
			  	}
		
			}
		
			el = frm['instituicaoFunc'];
			if (el.length == 0) {
				msg += formataErro('Selecione ao menos um item da tabela de Localidades dos Sub-&Oacute;rg&atilde;os');
				errorEl = el;
			} else if (el.length > MAX_SELECTED_ITEMS) {
				msg += formataErro('Selecione no máximo ' + MAX_SELECTED_ITEMS + ' itens da tabela de Localidades dos Sub-&Oacute;rg&atilde;os');
				errorEl = el;
			}
		
			if (!msg) {
				return true;
			}
		  
			abreAlerta(msg);
			return false;
		
		}
		
		function tabelaChanged(el) {
			var target = el.form.sel_itens_tabela;
			var tableIndex = getSelectedValue(el);
			populateOptions(tableData[tableIndex], target, true);
			if (tableIndex >= 0 && target.style.visibility != 'visible') target.style.visibility = 'visible';
		}
	
		function  submitIt(frm) {
			if (!validate(frm)) return;
			frm.h_locais.value = serializeOptions(frm.instituicaoFunc).join();
			frm.submit();
		}
		
		function onLoad() {
			try { document.getElementById('titulo').focus(); } catch(e) {}		
		}

	// -->
	</script>

</head>

<body onload="onLoad();">

<div id="content">

	<h1 id=titulo title="Indicadores Internos" tabIndex="1">Indicadores Internos</h1>
	<table cellSpacing=1 cellPadding=2 width="100%" border=0>
		<html:form action="/IndicadoresInternosSearch" method="post">
		<html:hidden property='h_locais'/>
		<TBODY>
		<!-- 
		<TR>
	    	<TD class=contentBold align=middle colspan=2><label tabindex="1">&nbsp;Indicadores&nbsp;Internos da Ouvidoria</label></TD>
	    </TR>
		 -->
		<TR>
	    	<TD class=contentBold colSpan=2>&nbsp;<label tabindex="3">Dados para a cria&ccedil;&atilde;o do indicador:</label></TD>
		</TR>
			<%@ include file="IndicadoresInternos-params.inc.jsp" %>
		<TR>
			<TD width="100" class=tdHeader3><LABEL title="N&uacute;mero m&aacute;ximo de sub-&oacute;rg&atilde;os/localidades" for="txt_max_count">N&uacute;mero m&aacute;ximo de sub-&oacute;rg&atilde;os/localidades</LABEL></TD>
		    <TD class=tdHeader4>&nbsp;<html:text styleId="txt_max_count" property="txt_max_count" size='5' disabled='true'/></TD>
		</TR>
		<TR>
	    	<TD class=tdHeader3 width=100></TD>
		    <TD class=tdHeader4 align=left>
				<table border="0" style=" cellpadding=" cellspacing="0" width="98%" align="center">
					<tr>
						<th id="so"   class="tdHeader3" width="25%"><strong>Sub-&Oacute;rg&atilde;o</strong></th>
						<th id="lc"   class="tdHeader3" width="25%"><strong>Localidade</strong></th>
						<th id="br"   class="tdHeader4">&nbsp;</th>
						<th id="solc" class="tdHeader3" width="50%"><strong>Localidades dos Sub-&Oacute;rg&atilde;os</strong></th>
					</tr>
					<tr>
						<td headers="so" class="tdHeader4" height="80">
						
							<select tabindex="5" style="width: 100%" id="suborgao" name="suborgao" size="8" onChange="populaLocalidadeOcorrecia();">
							<logic:present name="listarInstituicao">
							<logic:iterate name="listarInstituicao" id="subOrgao" type="br.gov.serpro.ouvidoria.model.SubOrgao">
							<option value="<bean:write name="subOrgao" property="id"/>"><bean:write name="subOrgao" property="descricao"/></option>
							</logic:iterate>
							</logic:present>
							</select>
						</td>
						<td headers="lc" class="tdHeader4" height="80">
							<select tabindex="6" style="width: 100%" id="localidade" name="localidade" multiple size="8">
							</select>
						</td>
						<td  headers="br" class="tdHeader4" height="80" valign="center">
							<input tabindex="7" type="button" value="Enviar >"  style="width: 60px;" class="button"  onclick="adicionaSubOrgao();"><br><br>
							<input tabindex="8" type="button" value="< Excluir" style="width: 60px;" class="button" onclick="removeSubOrgao();">
						</td>
						<td  headers="solc" colspan="3" class="tdHeader4" align="center">
							<select tabindex="9" style="width: 100%;" id="instituicaoFunc" name="instituicaoFunc" multiple size="8">
							</select>
						</td>
					</tr>
				</table>
			</TD>
		</TR>
		<TR>
		    <TD class=tdHeader1 align=middle colSpan=2>
				<LABEL for=gerar>
				<INPUT type='button' tabindex="10" class='button' title="Gerar o Indicador" value='Gerar'	onclick='submitIt(this.form);'>
	 			
	 			</LABEL>
	 		</TD>
		</TR>
		</TBODY>
		</html:form>
	</table>
	<HR>
	<p class=voltar><A tabindex="11" title="voltar para p&aacute;gina anterior" href="javascript:history.go(-1)">voltar</A></p>
</div>
<script type="text/javascript">

	var frm = document.forms[0];

	tabelaChanged(frm.sel_tabela);

	frm.txt_periodo_i.setAttribute('dataType', 'date');
	frm.txt_periodo_f.setAttribute('dataType', 'date');

	if (!getSelectedValue(frm.r_modo_exibicao)) selectValue(frm.r_modo_exibicao, 'c');
	if (!getSelectedValue(frm.r_base_x)) selectValue(frm.r_base_x, '0');

	frm.txt_max_count.value = MAX_SELECTED_ITEMS;
	
	frm.txt_periodo_i.value = '';
	frm.txt_periodo_f.value = '';

	frm.suborgao.selectedIndex = -1;
	
	afterPageBody();

</script>
</body>
</html:html>
