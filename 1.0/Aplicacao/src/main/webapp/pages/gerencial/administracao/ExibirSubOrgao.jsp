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

<% /*
   -- Sistema:      Ouvidoria
   -- M�dulo:       Gerencial
   -- Aplica��o:    Gestor de Sistema
   -- 
   -- Vers�o:       1.0
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

        innerHtmlMsgErros += CriticaString( document.forms[0].elements["descricao"], 3, 50, 'Sub-�rg�o' );

		// Critica Data Inicial
		if ( typeof(dataIniPer = validaRetornandoDataHora(dataInicio, horaInicio, 'in�cio da vig�ncia')) == "string" ) {
			innerHtmlMsgErros += dataIniPer;
		}

		// Critica Data Final
		if (( dataFim != null && dataFim != "" ) || ( horaFim != null && horaFim != "" )) {
			if ( typeof(dataFimPer = validaRetornandoDataHora(dataFim, horaFim, 'fim da vig�ncia')) == "string" ) {
				innerHtmlMsgErros += dataFimPer;
			}
			else
			{

				// Comparar as Datas
		        if ( dataIniPer > dataFimPer )
        		{
					innerHtmlMsgErros += formataErro( 'Data de fim vig�ncia deve ser maior ou igual a data in�cio vig�ncia' );
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




<p style="text-align: left" id="cpo" tabindex="1"><font class="asterisco">*</font><font class="obrigatorio">campo com preenchimento obrigat�rio</font></p>

<form  name="subOrgao" method="post" action="../../../gerencial/AtualizarSubOrgao.do">
<input type="hidden" name="action" value="salvar">
<input type="hidden" name="id" value="<bean:write name="subOrgao" property="id"/>">

<table border="0" width="100%" cellpadding="0" cellspacing="0">
<tr>

	<td align="left"><img accesskey="d" tabindex="2" name="imgDetalhe" src="../../<bean:write name="_LAYOUT_" property="esquemaCores"/>/pasta_detalha.gif" alt="Sub-�rg�o Escolhido"><table cellpadding="2" cellspacing="1" border="0" align="center" width="100%">

	  <tr>
	    <td class="tdHeader3" width="20%"><label for="descricao" tabindex="5">Sub-�rg�o&nbsp;<font class="asterisco">*</font></label></td>
	    <td class="tdHeader4"> 
	      	<html:text styleId="descricao" tabindex="5" size="50" maxlength="50" name="subOrgao" property="descricao"/>
	    </td>
	  </tr>

	  <tr> 
	    <td class="tdHeader3" width="20%"><label for="iniciovigencia" tabindex="6">Data de in�cio da vig�ncia&nbsp;<font class="asterisco">*</font></label></td>
	    <td class="tdHeader4">
	      	<input	id="iniciovigencia" tabindex="6" size="10" maxlength="10" type="text" name="dataInicioVigencia" value="<bean:write name="subOrgao" property="dataInicioVigencia" format="dd/MM/yyyy"/>">
			&nbsp;�s&nbsp;
	      	<input	id="iniciovigencia" tabindex="6" size="5"  maxlength="5" type="text" name="horaInicioVigencia" value="<bean:write name="subOrgao" property="dataInicioVigencia" format="HH:mm"/>">
	    </td>
	  </tr>

	  <tr> 
	    <td class="tdHeader3" width="20%"><label for="fimvigencia" tabindex="7">Data de fim da vig�ncia</label></td>
	    <td class="tdHeader4">
	      	<input	id="fimvigencia" tabindex="7" size="10" maxlength="10" type="text"     name="dataFimVigencia" value="<bean:write name="subOrgao" property="dataFimVigencia" format="dd/MM/yyyy"/>">
			&nbsp;�s&nbsp;
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
