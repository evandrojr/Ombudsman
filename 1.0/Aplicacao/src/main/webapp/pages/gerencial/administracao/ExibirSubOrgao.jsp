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

<% /*
   -- Sistema:      Ouvidoria
   -- Módulo:       Gerencial
   -- Aplicação:    Gestor de Sistema
   -- 
   -- Versão:       1.0
   -- Data:         27/12/2004  
   -- 
  */
%>

<%@ taglib uri="/tags/struts-logic" prefix="logic" %>
<%@ taglib uri="/tags/struts-bean" prefix="bean"%>
<%@ taglib uri="/tags/struts-html" prefix="html"%>

<html lang="pt">
<head>
<title>Atualizar Cadastro</title>
<html:base />
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link rel="stylesheet"  media="all" href="../../<bean:write name="_LAYOUT_" property="esquemaCores"/>/estilo_conteudo.css" type="text/css">
</head>

<%@ include file="../../js/header.inc.jsp" %>
<script type="text/javascript" charset='iso-8859-1'>

	function salvar() {
		document.forms[0].submit();
	}

	function validaCampos()
	{
		var innerHtmlMsgErros = '';
		var dataInicio        = document.forms[0].dataInicioVigencia.value;
        var horaInicio        = document.forms[0].horaInicioVigencia.value;

		var dataFim           = document.forms[0].dataFimVigencia.value;
        var horaFim           = document.forms[0].horaFimVigencia.value;

        innerHtmlMsgErros += CriticaString( document.forms[0].elements["descricao"], 3, 50, 'Sub-Órgão' );

		// Critica Data Inicial
		if ( typeof(dataIniPer = validaRetornandoDataHora(dataInicio, horaInicio, 'início da vigência')) == "string" ) {
			innerHtmlMsgErros += dataIniPer;
		}

		// Critica Data Final
		if (( dataFim != null && dataFim != "" ) || ( horaFim != null && horaFim != "" )) {
			if ( typeof(dataFimPer = validaRetornandoDataHora(dataFim, horaFim, 'fim da vigência')) == "string" ) {
				innerHtmlMsgErros += dataFimPer;
			}
			else
			{

				// Comparar as Datas
		        if ( dataIniPer > dataFimPer )
        		{
					innerHtmlMsgErros += formataErro( 'Data de fim vigência deve ser maior ou igual a data início vigência' );
        		}
        	}
		}

		// Gravar ou mostrar Erros
		if( innerHtmlMsgErros == '' )
		{
			abreConfirmacao("salvar");
		}
		else
		{
			var texto = innerHtmlMsgErros;
			abreAlerta(texto);
		}
		
		setFocusById('cpo');
	}

	function fechar() {
		var baseHref = location.protocol + "//" + location.host + location.pathname;
		window.location.href = baseHref + "../../Vazio.do";
	}
	
	function onLoad() {
		window.parent.document.getElementById("localidades").style.height = 0;
		window.parent.frames["localidades"].location.href = "../gerencial/Vazio.do";

		document.forms[0].dataInicioVigencia.setAttribute( 'dataType', 'date' );
		document.forms[0].dataFimVigencia.setAttribute   ( 'dataType', 'date' );

		document.forms[0].horaInicioVigencia.setAttribute( 'dataType', 'time' );
		document.forms[0].horaFimVigencia.setAttribute   ( 'dataType', 'time' );

		afterPageBody();

		setFocusById('cpo');
	}

</script>

<body onload="javascript:onLoad()" style="margin: 0px 0px;">




<p style="text-align: left" id="cpo" tabindex="1"><font class="asterisco">*</font><font class="obrigatorio">campo com preenchimento obrigatório</font></p>

<form  name="subOrgao" method="post" action="../../../gerencial/AtualizarSubOrgao.do">
<input type="hidden" name="action" value="salvar">
<input type="hidden" name="id" value="<bean:write name="subOrgao" property="id"/>">

<table border="0" width="100%" cellpadding="0" cellspacing="0">
<tr>

	<td align="left"><img accesskey="d" tabindex="2" name="imgDetalhe" src="../../<bean:write name="_LAYOUT_" property="esquemaCores"/>/pasta_detalha.gif" alt="Sub-Órgão Escolhido"><table cellpadding="2" cellspacing="1" border="0" align="center" width="100%">

	  <tr>
	    <td class="tdHeader3" width="20%"><label for="descricao" tabindex="5">Sub-Órgão&nbsp;<font class="asterisco">*</font></label></td>
	    <td class="tdHeader4"> 
	      	<html:text styleId="descricao" tabindex="5" size="50" maxlength="50" name="subOrgao" property="descricao"/>
	    </td>
	  </tr>

	  <tr> 
	    <td class="tdHeader3" width="20%"><label for="iniciovigencia" tabindex="6">Data de início da vigência&nbsp;<font class="asterisco">*</font></label></td>
	    <td class="tdHeader4">
	      	<input	id="iniciovigencia" tabindex="6" size="10" maxlength="10" type="text" name="dataInicioVigencia" value="<bean:write name="subOrgao" property="dataInicioVigencia" format="dd/MM/yyyy"/>">
			&nbsp;às&nbsp;
	      	<input	id="iniciovigencia" tabindex="6" size="5"  maxlength="5" type="text" name="horaInicioVigencia" value="<bean:write name="subOrgao" property="dataInicioVigencia" format="HH:mm"/>">
	    </td>
	  </tr>

	  <tr> 
	    <td class="tdHeader3" width="20%"><label for="fimvigencia" tabindex="7">Data de fim da vigência</label></td>
	    <td class="tdHeader4">
	      	<input	id="fimvigencia" tabindex="7" size="10" maxlength="10" type="text"     name="dataFimVigencia" value="<bean:write name="subOrgao" property="dataFimVigencia" format="dd/MM/yyyy"/>">
			&nbsp;às&nbsp;
	      	<input	id="fimvigencia" tabindex="7" size="5"  maxlength="5"  type="text" name="horaFimVigencia" value="<bean:write name="subOrgao" property="dataFimVigencia" format="HH:mm"/>">
	    </td>
	  </tr>

	  <tr> 
	    <td class="tdHeader3" colspan="2">
	      <div align="center"> 
			
			<logic:equal name="function" value="alterar">
	        <input type="button" tabindex="10" name="botao" value="Alterar" class="button" onClick="validaCampos();">
			</logic:equal>

			<logic:equal name="function" value="incluir">
	        <input type="button" tabindex="10" name="botao" value="Salvar"  class="button" onClick="validaCampos();">
			</logic:equal>

	      </div>
	    </td>
	  </tr>
	
	</table>
	
	</td>
</tr>
</table>
</form>
<script type="text/javascript" charset='iso-8859-1'>
	window.parent.document.getElementById("detalhe").style.height = this.document.body.scrollHeight;
</script>
</body>
</html>
