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

<%--
 /*
   -- Sistema:      Ouvidoria
   -- M�dulo:       Gerencial
   -- Aplica��o:    Gestor de Sistema
   -- 
   -- Vers�o:       1.0
   -- Data:         27/12/2004  
   -- 
  */
--%>

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
	
	function salvar()
	{
		document.forms[0].submit();
	}

	function validaForm()
	{
		var innerHtmlMsgErros = '';
		innerHtmlMsgErros += CriticaString( document.forms[0].descricao, 5, 200, 'Localidade ' );

		var dataVigencia = document.forms[0].dataVigencia.value;
		var horaVigencia = document.forms[0].horaVigencia.value;

		if (( dataVigencia != "" ) || ( horaVigencia != "" )) {
			if ( typeof(dataVig = validaRetornandoDataHora( dataVigencia, horaVigencia, 'vig�ncia')) == "string" ) {
				innerHtmlMsgErros += dataVig;
			} 	else  {
				// Compara Data de Vig�ncia com Data Atual
				if ( !validaDataMaior( dataVigencia, horaVigencia ) ) {
					innerHtmlMsgErros += formataErro( 'Data de vig�ncia n�o pode ser anterior � data atual');
				}
			}	
		}
		
		if( innerHtmlMsgErros == '' )
		{
			abreConfirmacao( "salvar" );
		}
		else
		{
			abreAlerta( innerHtmlMsgErros );
		}
		setFocusById('cpo');
	}
	
	function fechar()
	{
		var baseHref = location.protocol + "//" + location.host + location.pathname;
		window.location.href = baseHref + "../../Vazio.do";
	}

    function onLoad()
    {
		document.forms[0].dataVigencia.setAttribute( 'dataType', 'date' );
		document.forms[0].horaVigencia.setAttribute( 'dataType', 'time' );
		afterPageBody();
		window.parent.document.getElementById("localidades").style.height = this.document.body.scrollHeight;
		setFocusById('cpo');
	}

</script>

<body onload="onLoad();" style="margin: 0px 0px;">
	


	<p style="text-align: left" id="cpo" tabindex="1"><font class="asterisco">*</font><font class="obrigatorio">campo com preenchimento obrigat�rio</font></p>
	<form  name="subOrgao" method="post" action="../../../gerencial/AtualizarLocalidadeOcorrencia.do">
		<input type="hidden" name="action" value="salvar">
		<input type="hidden" name="id" value="<bean:write name="localidadeOcorrencia" property="id"/>">
		<input type="hidden" name="subOrgaoId" value="<bean:write name="subOrgaoId"/>">

		<table border="0" width="100%" cellpadding="0" cellspacing="0">
			<tr>
				<td align="left">
					<img accesskey="d" src="../../<bean:write name="_LAYOUT_" property="esquemaCores"/>/pasta_detalha.gif" name="imgDetalhe" tabindex="2" alt="Localidade Escolhida"><table cellpadding="2" cellspacing="1" border="0" align="center" width="100%">
				</td>
			</tr>

			<tr>
				<td class="tdHeader3" width="20%">
					<label for="descricao" tabindex="5">Localidade&nbsp;<font class="asterisco">*</font></label>
				</td>
				<td class="tdHeader4"> 
		    	  	<html:text styleId="descricao" tabindex="5" size="50" maxlength="200" name="localidadeOcorrencia" property="descricao"/>
				</td>
			</tr>

			<tr> 
				<td class="tdHeader3" width="20%">
					<label for="vigencia" tabindex="5">Data de vig�ncia</label>
				</td>
				<td class="tdHeader4">
					<input id="vigencia" tabindex="5" size="10" maxlength="10" type="text" name="dataVigencia" value="<bean:write name="localidadeOcorrencia" property="dataVigencia" format="dd/MM/yyyy"/>">
					&nbsp;�s&nbsp;
			      	<input id="vigencia" tabindex="5" size="5"  maxlength="5"  type="text" name="horaVigencia" value="<bean:write name="localidadeOcorrencia" property="dataVigencia" format="HH:mm"/>">
	    		</td>
			</tr>

			<tr> 
				<td class="tdHeader3" colspan="2">
					<div align="center"> 
						<input type="button" tabindex="10" name="botao" value="Salvar" class="button" onClick="validaForm();">
					</div>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
