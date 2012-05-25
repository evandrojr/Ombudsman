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
<%@ taglib uri="http://jakarta.apache.org/taglibs/log-1.0" prefix="log" %>


<html:html lang='pt'>
<% //log:info category="DEBUG">Estamos na página dos indicadores historicos</log:info> %>
<head>
	<%@ include file="inc/header.inc.jsp" %>
	<title>Indicadores</title>
	<link rel='stylesheet'  media='all' href='../../<bean:write name="_LAYOUT_" property="esquemaCores"/>/estilo_conteudo.css' type='text/css'>

	<%@ include file="inc/Localidades.inc.jsp" %>

	<script type="text/javascript" charset='iso-8859-1'>
	<!-- //

		var MAX_SELECTED_ITEMS = <bean:write name="maximoIndColuna"/>;
	
		var tableData = [
		<%= request.getAttribute("ii_tabela_array")%>
		];
	
		function modeChanged(el) {
			populateOptions(tipos_grafico_options.slice(el.value == 'd' ? 1 : 0), el.form.sel_tipo_grafico, true);
		  indicadorChanged(el.form.sel_indicador);
		}
		
		function indicadorChanged(sel) {
			sel.focus();
			var makeMetaVisible = getSelectedValue(sel) == 2;
			if (!makeMetaVisible) sel.form.txt_meta.value = '';
		  cssKit.setVisible(getRef('meta_div'), makeMetaVisible);
		  cssKit.setVisible(getRef('sel_meio_envio'), makeMetaVisible);
		
		}
		
		function validate(frm) {
		
		  var msg = '';
		  var errors = new Array();
		  // errors[''] = ;
		
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

	<h1 id=titulo title="Indicadores Hist&oacute;rico" tabIndex=1>Indicador de Hist&oacute;rico da Ouvidoria</h1>
	<table cellSpacing=1 cellPadding=2 width="100%" border=0>
		<html:form action="/IndicadoresHistoricoSearch" method="post">
		<html:hidden property='h_locais'/>
		<input type='hidden' name='indicador' value='hist'/>

		<TBODY>
		<!-- 
		<TR>
	    	<TD class=contentBold align=middle colSpan=2><LABEL tabindex="2">&nbsp;Indicadores&nbsp;Hist&oacute;rico da Ouvidoria</LABEL></TD>
	    </TR>
		-->
		<TR>
	    	<TD class=contentBold colSpan=2>&nbsp;<LABEL tabindex="3">Dados para a cria&ccedil;&atilde;o do indicador:</LABEL></TD>
		</TR>
			<%@ include file="IndicadoresHistorico-params.inc.jsp" %>

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
						<th id="so" class="tdHeader3" width="25%"><strong>Sub-&Oacute;rg&atilde;o</strong></th>
						<th id="lc" class="tdHeader3" width="25%"><strong>Localidade</strong></th>
						<th id="br" class="tdHeader4">&nbsp;</th>
						<th id="solc" class="tdHeader3" width="50%"><strong>Localidades dos Sub-&Oacute;rg&atilde;os</strong></th>
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
	populateOptions(tableData[10], frm.sel_meio_envio, true);

	//selectValue(frm.sel_itens_tabela, v_sel_itens_tabela.split(","));
	frm.txt_periodo_i.setAttribute('dataType', 'date');
	frm.txt_periodo_f.setAttribute('dataType', 'date');
	frm.txt_meta.setAttribute('dataType', 'integer');
	if (!getSelectedValue(frm.r_modo_exibicao)) selectValue(frm.r_modo_exibicao, 'c');
	modeChanged(frm.r_modo_exibicao[0]);
	frm.txt_max_count.value = MAX_SELECTED_ITEMS;
	frm.txt_periodo_i.value = '';
	frm.txt_periodo_f.value = '';

	afterPageBody();
	
	var errorMsg = '<%= request.getAttribute("errorMsg") %>';
	if (errorMsg && errorMsg != 'null') {
		alert(errorMsg);
	}

</script>

</body>
</html:html>