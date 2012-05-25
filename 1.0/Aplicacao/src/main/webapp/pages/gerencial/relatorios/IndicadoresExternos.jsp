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
<%@ taglib uri="http://jakarta.apache.org/taglibs/log-1.0" prefix="log"%>

<html:html lang='pt'>
<% //log:info category="DEBUG">##########################################################</log:info> %>

<head>
	<%@ include file="inc/header.inc.jsp" %>
	<title>Indicadores - Externos</title>
	<link rel='stylesheet'  media='all' href='../../<bean:write name="_LAYOUT_" property="esquemaCores"/>/estilo_conteudo.css' type='text/css'>

	<%@ include file="inc/Localidades.inc.jsp" %>

	<script language=javascript>
		<!-- //
	
		var MAX_SELECTED_ITEMS = <bean:write name="maximoIndColuna"/>;
		
		function exibeItens(valor){
			itens.style.display='';
		}
		
		var tableOK = false;
		var tCols;

		function modeChanged(el) {
			populateOptions(tipos_grafico_options.slice(el.value == 'd' || true ? 1 : 0), el.form.sel_tipo_grafico, true);
		}

		function periodoChanged(el) {
			updateDynTable(el);
		}

		function updateDynTable(el) {
			var agr = getSelectedValue(el.form.sel_agrupamento);
			var tableStr = genTableStr(el.form, getSelectedValue(el.form.sel_ouvidorias));
			// getRef('msg').value = tableStr;
			getRef('dynTable').innerHTML = tableStr;
			installMaskOnDynTableItems(el.form, getSelectedValue(el.form.sel_ouvidorias), tCols);

		}

		function installMaskOnDynTableItems(frm, rowLen, colLen) {

			for (var i = 0; i < rowLen; i++) {

				installMask(getElementByName('o' + i));

				for (var j = 0; j < colLen; j++) {
					installMask(getElementByName('v' + i.toString() + j.toString() ));
				}

			}

		}

		function genTableStr(frm, rowLen) {

			tableOK = false;
			tCols = 0;

			var dates = getDateSpan(frm);
			if (!dates || dates.length < 1) return 'Escolha um intervalo v&aacute;lido.';

			var colLen = dates.length;

			var agr = getSelectedValue(frm.sel_agrupamento);
			var max;
			switch (agr) {
			case 'd':
				max = 7; // MAX_SELECTED_ITEMS &eacute; IGNORADO neste caso.
				if (colLen > max) return 'O seu intervalo compreende ' + colLen + ' dias.<br>' + 
					'Escolha um intervalo com no m&aacute;ximo ' + max + ' dias.' + 
					'<br/>Por exemplo, mude a data final para <b>' + Date.fromPtBr(frm.txt_periodo_i.value).addDays(max - 1).toString('dd/MM/yyyy') + '</b>.';
				break;

			case 'w':
				max = Math.min(6, MAX_SELECTED_ITEMS);
				if (colLen > max) return 'O seu intervalo compreende ' + colLen + ' semanas.<br>' + 
					'Escolha um intervalo com no m&aacute;ximo ' + max + ' semanas.' +
					'<br/>Por exemplo, mude a data final para <b>' + Date.fromPtBr(frm.txt_periodo_i.value).addDays(7 * (max - 1)).toString('dd/MM/yyyy') + '</b>.';
				
				var parts_i = Date.normalizedPtBr(frm.txt_periodo_i.value);					
				var parts_f = Date.normalizedPtBr(frm.txt_periodo_f.value);					

				if (parts_i[1] != parts_f[1]) return 'O m&ecirc;s da data inicial precisa ser o mesmo m&ecirc;s da data final.';

				if (parts_i[2] != parts_f[2]) return 'O ano da data inicial precisa ser o mesmo ano da data final.';

				break;

			case 'm':
				max = Math.min(12, MAX_SELECTED_ITEMS);
				if (colLen > max) return 'O seu intervalo compreende ' + colLen + ' meses.<br>' + 
					'Escolha um intervalo com no m&aacute;ximo ' + max + ' meses.' +
					'<br/>Por exemplo, mude a data final para <b>' + Date.fromPtBr(frm.txt_periodo_i.value).addMonths(max - 1).toString('dd/MM/yyyy') + '</b>.';

				break;

			case 's':
				max = Math.min(2, MAX_SELECTED_ITEMS);
				if (colLen > max) return 'O seu intervalo compreende ' + colLen + ' semestres.<br>' + 
					'Escolha um intervalo com no m&aacute;ximo ' + max + ' semestres.' +
					'<br/>Por exemplo, mude a data final para <b>' + Date.fromPtBr(frm.txt_periodo_i.value).addMonths(6 * (max - 1)).toString('dd/MM/yyyy') + '</b>.';

				break;

			case 'y':
				max = MAX_SELECTED_ITEMS;
				if (colLen > max) return 'O seu intervalo compreende ' + colLen + ' anos.<br>' + 
					'Escolha um intervalo com no m&aacute;ximo ' + max + ' anos.' + 
					'<br/>Por exemplo, mude a data final para <b>' + Date.fromPtBr(frm.txt_periodo_i.value).addYears(max - 1).toString('dd/MM/yyyy') + '</b>.';
				break;

			}

			// alert(dates);
			
			
			var result = '<TABLE height=83 cellSpacing=1 cellPadding=2 border=0>\n';
			result += '<thead>'
			result += '<tr>\n';
			result += '<TH class=tdHeader3 align=middle width="8%" colSpan=' + (colLen + 1) + ' height=19><label tabindex="10">';
			if ( document.forms[0].sel_indicador.value == "2"){
				result += '<div id="texto">TEMPO DE ATENDIMENTO</div>';
			} else {
				result += '<div id="texto">Nº ATENDIMENTO</div>';
			}
			result += '</label></TH>\n';
			result += '</tr><tr>\n';

			result += '<TH class=tdHeader4 width="34%" height=19><label tabindex="10">Ouvidoria</label></TH>\n\n';

			for (var i = 0; i < colLen; i++) {
				result += '<TH class=tdHeader4 width="6%" height=19><label tabindex="10">' + dates[i] + '</label></TH>\n';
			}

			result += '</TR></thead>\n';

			result += '<TBODY>\n';

			for (var i = 0; i < rowLen; i++) {

				result += '<TR align=middle>\n<TD class=tdHeader4 height=20><INPUT tabindex="10" size=35 maxLength=35 value="Ouvidoria A" name=o' + i + '></TD>\n';

				for (var j = 0; j < colLen; j++) {
					result += '<TD class=tdHeader4 height=20><INPUT tabindex="10" size=3 maxLength=3 datatype="integer" id="percent" name=v' + i.toString() + j.toString() + '></TD>\n';
				}

				result += '</TR>\n';

			}

			result += '</TBODY>\n';
			result += '</TABLE>';
			
			tableOK = true;
			tCols = colLen;
			frm.col_names.value = dates.join(',');

			return result;

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
		
		  if (!datesAreValid(frm)) {
		    msg += formataErro('A data inicial &eacute; maior que a data final');
		    errorEl = frm.txt_periodo_i;
		  }
		
		  el = frm['instituicaoFunc'];
		  if (el.length == 0) {
		    msg += formataErro("Selecione ao menos um item da tabela de Localidades dos Sub-&Oacute;rg&atilde;os");
		    errorEl = el;
		  } else if (el.length > MAX_SELECTED_ITEMS) {
		    msg += formataErro("Selecione no máximo " + MAX_SELECTED_ITEMS + " itens da tabela de Localidades dos Sub-&Oacute;rg&atilde;os");
		    errorEl = el;
		  }
		  
   		  if ( frm.sel_indicador.value == '1' || frm.sel_indicador.value == '4' ) {
			  for ( i = 0; i < frm.elements.length; i++ ){
				var el = frm.elements[i];
				if( el.id == 'percent' ) {
					if( (el.value == null || el.value == "" || Number(el.value) < 0 || Number(el.value) > 100) ) {
						msg += formataErro("Os valores para comparação de Ouvidorias deve ser percentuais");
						break;
					}
				}
			  }	
		  }	
		  el = null;
		  if (!tableOK) {
		    msg += "<li>Corrija o erro descrito na &aacute;rea inferior da tela</li>";
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
			frm.extra_rows.value = serializeExtraRows(frm);
			frm.submit();
		}

		function serializeExtraRows(frm) {
	
			var result = '', val;
			var tRows = getSelectedValue(frm.sel_ouvidorias);
	
			for (var row=0; row < tRows; row++) {
				result += getElementByName('o' + row).value + '|';
	
				for (var col = 0; col < tCols; col++) {
					val = getElementByName('v' + row + col.toString()).value;
					
					result += (!val ? '0' : val) + '|';
				}
				
				result = result.substring(0, result.length - 1) + ';';			
	
			}
			
			return result.substring(0, result.length - 1);
	
		}
		
		function mudaLabel(){
			try {
				if (document.forms[0].sel_indicador.value == "2") {
					document.getElementById('texto').innerHTML = "TEMPO DE ATENDIMENTO";
				} else {
					document.getElementById('texto').innerHTML = "Nº ATENDIMENTO";		
				}
			}	
			catch(e){};
		}

	    function onLoad() {
	        try { document.getElementById('titulo').focus(); } catch(e) {}
	    }		
		
	// -->	
	</script>

</head>

<body onload="onLoad();">




<div id="content">

	<h1 id=titulo title="Indicadores Externos" tabIndex=1>Indicadores Externos</h1>
	<table cellSpacing=1 cellPadding=2 width="100%" border=0>
		<html:form action="/IndicadoresExternosSearch" method="post">
		<html:hidden property='h_locais'/>
		<input type='hidden' name='indicador' value='ext'/>
		<input type='hidden' name='extra_rows'/>
		<input type='hidden' name='col_names'/>
		
		<TBODY>
		<!-- 
		<TR>
	    	<TD class=contentBold align=middle colSpan=2><LABEL tabindex="2">&nbsp;Indicadores&nbsp;Externos da Ouvidoria</LABEL></TD>
	    </TR>
		 -->
		<TR>
	    	<TD class=contentBold colSpan=2><LABEL tabindex="3">&nbsp;Dados para a cria&ccedil;&atilde;o do indicador:</LABEL></TD>
		</TR>
			<%@ include file="IndicadoresExternos-params.inc.jsp" %>
		<TR>
			<TD width="100" class=tdHeader3><LABEL title="N&uacute;mero m&aacute;ximo de sub-&oacute;rg&atilde;os/localidades" for="txt_max_count">N&uacute;mero m&aacute;ximo de sub-&oacute;rg&atilde;os/localidades</LABEL></TD>
		    <TD class=tdHeader4>
		    	&nbsp;<html:text styleId="txt_max_count" property="txt_max_count" size='5' disabled='true'/>
			</TD>
		</TR>
		<TR>
	    	<TD class=tdHeader3 width=100></TD>
		    <TD class=tdHeader4 align=left>
				<table border="0" style=" cellpadding=" cellspacing="0" width="98%" align="center">
					<tr>
						<th id="so" class="tdHeader3" width="25%"><strong>Sub-&Oacute;rg&atilde;o</strong></th>
						<th id="lc" class="tdHeader3" width="25%"><strong>Localidade</strong></th>
						<th id="br" class="tdHeader4">&nbsp;</th>
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
    <TD class=tdHeader3 colSpan=2 height=110><DIV id='dynTable'></DIV></TD>
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
	<p class=voltar>
		<A tabindex="11" title="voltar para p&aacute;gina anterior" href="javascript:history.go(-1)">voltar</A> 
	</p>
</div>

<script type="text/javascript">

	var frm = document.forms[0];

	frm.txt_periodo_i.setAttribute('dataType', 'date');
	frm.txt_periodo_f.setAttribute('dataType', 'date');
	
	frm.txt_periodo_i.value = '';
	frm.txt_periodo_f.value = '';

	updateDynTable(frm.sel_agrupamento);
	
	if (!getSelectedValue(frm.r_modo_exibicao)) selectValue(frm.r_modo_exibicao, 'c');
	
	frm.txt_max_count.value = MAX_SELECTED_ITEMS;
	
	frm.suborgao.selectedIndex = -1;
	
	afterPageBody();
</script>
<br><xtextarea id='msg' rows=60 cols=120></xtextarea>
</body>
</html:html>