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

<html:html lang='pt'>

<head>
	<%@ include file="inc/header.inc.jsp" %>
	<title>Indicadores - F&oacute;rmula</title>
	<link rel='stylesheet'  media='all' href='../../<bean:write name="_LAYOUT_" property="esquemaCores"/>/estilo_conteudo.css' type='text/css'>

	<script type="text/javascript" charset='iso-8859-1'>

	// Guarda os ids e descrições dos registros das tabelas
	var tableData = [
	<%= request.getAttribute("if_tabela_array")%>
	];

	var v_sel_itens_tabela = '<%--= br.gov.serpro.ouvidoria.util.freechart.data.StringKit.join(request.getParameterValues("sel_itens_tabela")) --%>';
	
		var formulaCount = 0;
		var formulaAssoc = [];
		
		function allocSelIndex() {
			var len = formulaAssoc.length;
			for (var i=0; i<len; i++) {
				if (formulaAssoc[i] < 0) break;
			}
			return i < 3 ? i : -1;		
		}
	
		function freeSelIndex(tableIndex) {
			var selIndex = findSelIndex(tableIndex);
			formulaAssoc[selIndex] = -1;
			return selIndex;
		}
		
		function findSelIndex(tableIndex) {
			var len = formulaAssoc.length;
			for (var i = len - 1; i >= 0; i--) {
				if (formulaAssoc[i] == tableIndex) break;
			}
			return i;
		}
	
		function addList(frm, tables, tableIndex) {
			var selIndex = allocSelIndex();
			if (selIndex < 0) return false;
			formulaAssoc[selIndex] = tableIndex;
			populateOptions(tables[tableIndex], frm.elements['sel_formula_' + (selIndex + 1)], true);
			return true;
		}
		
		function addEmptyOption(el, index) {
			el.options[index] = new Option('','');
		}
		
		function removeList(frm, tableIndex) {
			var selIndex = freeSelIndex(tableIndex);
			if (selIndex < 0) {
				return false;
			}
			frm.elements['sel_formula_' + (selIndex + 1)].options.length = 0;
			addEmptyOption(frm.elements['sel_formula_' + (selIndex + 1)], 0);
			return true;
		}
	
		function formulaClick(e) {
			var el = getEventSource(e);
			if (el.checked)	{
				if (!addList(el.form, tableData, el.value)) {
					el.checked = false;
					maxCountReached();
				}
			} else {
				removeList(el.form, el.value);
			}
		}

		function setupEvents(cb) {
			var el;
			for (var i = cb.length - 1; i >= 0; i--) {
				el = cb[i];
				el.checked = false;
				addEvent(cb[i], 'click', formulaClick);
		    }
		}

		function getSelFormula(frm, selIndex) {
			return frm.elements['sel_formula_' + (selIndex + 1)];
		}
	
		function getFormula(frm) {
	
			var result = [];
			var tableIndex;
	
			for (var i = formulaAssoc.length - 1; i >= 0; i--) {
				if ( (tableIndex = formulaAssoc[i]) == -1) continue;
				result.push( tableIndex + '=' + getSelectedValue(getSelFormula(frm, i)) );
	
			}
			
			return result.join(',');		
	
		}

		function modeChanged(el) {
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
		  
		  if (formulaAssoc.length < 1) {
 			 msg += formataErro('Selecione ao menos um item para a Fórmula');
		  }
		
		  el = frm['instituicaoFunc'];
		  if (el.length == 0) {
		    msg += formataErro('Selecione ao menos um item da tabela de Localidades dos Sub-&oacute;rg&atilde;os');
		    errorEl = el;
		  } else if (el.length > MAX_SELECTED_ITEMS) {
		    msg += formataErro('Selecione no máximo ' + MAX_SELECTED_ITEMS + ' itens da tabela de Localidades dos Sub-&oacute;rg&atilde;os');
		    errorEl = el;
		  }
		
		  if (!msg) {
		    return true;
		  }
		
		  if (errorEl) {
		    errorEl.focus();
		    if (errorEl.type == 'text') errorEl.select();
		  }
		  
			abreAlerta(msg);
			return false;
		
		}
	
		function  submitIt(frm) {
			if (!validate(frm)) return;
			frm.h_locais.value = serializeOptions(frm.instituicaoFunc).join();
			frm.h_formula.value = getFormula(frm);
			frm.submit();
		}
	
	    function onLoad() {
	        try { document.getElementById('titulo').focus(); } catch(e) {}
	    }
	
		function maxCountReached() {
			abreAlerta("Selecione no máximo 3 itens");
		}

	// -->
	</script>

	<%@ include file="inc/Localidades.inc.jsp" %>

</head>

<body onload="onLoad();">




<div id="content">

	<h1 id=titulo title="Indicadores F&oacute;rmula" tabIndex="1">Indicadores F&oacute;rmula</h1>
	<table cellSpacing=1 cellPadding=2 width="100%" border=0>
		<html:form action="/IndicadoresFormulaSearch" method="post">
		<html:hidden property='h_locais'/>
		<input type='hidden' name='h_formula'/>
		<input type='hidden' name='indicador' value='formula'/>

		<TBODY>
		<!-- 
		<TR>
	    	<TD class=contentBold align=middle colSpan=2><LABEL tabindex="2">&nbsp;Indicadores&nbsp;F&oacute;rmula da Ouvidoria</LABEL></TD>
	    </TR>
		 -->
		<TR>
	    	<TD class=contentBold colSpan=2>&nbsp;<LABEL tabindex="3">Dados para a cria&ccedil;&atilde;o do indicador:</LABEL></TD>
		</TR>
			<%@ include file="IndicadoresFormula-params.inc.jsp" %>

  <TR>
    <TD width="100" class=tdHeader3><LABEL title="N&uacute;mero m&aacute;ximo de sub-&oacute;rg&atilde;os/localidades" 
      for="txt_max_count">N&uacute;mero m&aacute;ximo de 
      sub-&oacute;rg&atilde;os/localidades</LABEL></TD>
    <TD class=tdHeader4>&nbsp;
<html:text styleId="txt_max_count" property="txt_max_count" size='5' disabled='true'/>
</TD></TR>
		<TR>
	    	<TD class=tdHeader3 width=100></TD>
		    <TD class=tdHeader4 align=left>
				<table border="0" style=" cellpadding=" cellspacing="0" width="98%" align="center">
					<tr>
						<th id="so" class="tdHeader3" width="25%"><strong>Sub-&oacute;rg&atilde;o</strong></th>
						<th id="lc" class="tdHeader3" width="25%"><strong>Localidade</strong></th>
						<th id="br" class="tdHeader4">&nbsp;</th>
						<th id="solc" class="tdHeader3" width="50%"><strong>Localidades dos Sub-&oacute;rg&atilde;os</strong></th>
					</tr>
					<tr>
						<td headers="so" class="tdHeader4" height="80">
							<select tabindex="3" style="width: 100%" id="suborgao" name="suborgao" size="8" onChange="populaLocalidadeOcorrecia();">
							<logic:present name="listarInstituicao">
							<logic:iterate name="listarInstituicao" id="subOrgao" type="br.gov.serpro.ouvidoria.model.SubOrgao">
							<option value="<bean:write name="subOrgao" property="id"/>"><bean:write name="subOrgao" property="descricao"/></option>
							</logic:iterate>
							</logic:present>
							</select>
						</td>
						<td headers="lc" class="tdHeader4" height="80">
							<select tabindex="4" style="width: 100%" id="localidade" name="localidade" multiple size="8">
							</select>
						</td>
						<td  headers="br" class="tdHeader4" height="80" valign="center">
							<input tabindex="5" type="button" value="Enviar >"  style="width: 60px;" class="button"  onclick="adicionaSubOrgao();"><br><br>
							<input tabindex="6" type="button" value="< Excluir" style="width: 60px;" class="button" onclick="removeSubOrgao();">
						</td>
						<td  headers="solc" colspan="3" class="tdHeader4" align="center">
							<select tabindex="7" style="width: 100%;" id="instituicaoFunc" name="instituicaoFunc" multiple size="8">
							</select>
						</td>
					</tr>
				</table>
			</TD>
		</TR>
		<TR>
		    <TD class=tdHeader1 align=middle colSpan=2>
				<LABEL for=gerar>
				<INPUT type='button' tabindex="8" class='button' title="Gerar o Indicador" value='Gerar'	onclick='submitIt(this.form);'>
	 			</LABEL>
	 		</TD>
		</TR>
		</TBODY>

		</html:form>
	</table>
	<HR>
	<p class=voltar>
		<A tabindex="9" title="voltar para p&aacute;gina anterior" href="javascript:history.go(-1)">voltar</A> 
	</p>
</div>
<script type="text/javascript">

	var frm = document.forms[0];
	frm.txt_periodo_i.setAttribute('dataType', 'date');
	frm.txt_periodo_f.setAttribute('dataType', 'date');
	frm.txt_meta.setAttribute('dataType', 'integer');
	// Evita que ele passe o componente como parametro quando ele não está preenchido
	if (!getSelectedValue(frm.r_modo_exibicao) && frm.r_modo_exibicao.value != null) {
		selectValue(frm.r_modo_exibicao, 'c');
	}
	frm.txt_max_count.value = MAX_SELECTED_ITEMS;
	
	frm.txt_periodo_i.value = '';
	frm.txt_periodo_f.value = '';

	setupEvents(frm.elements['cb_fonte']);

	frm.suborgao.selectedIndex = -1;

	afterPageBody();

</script>
<span id='msgBox'></span>
</body>
</html:html>