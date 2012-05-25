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
   -- Data:         07/01/2005  
   -- 
  */
--%>

<%@ taglib uri="/tags/struts-logic" prefix="logic" %>
<%@ taglib uri="/tags/struts-bean"  prefix="bean"%>
<%@ taglib uri="/tags/struts-html"  prefix="html"%>

<html lang="pt">
<head>
	<title>Atualizar Cadastro</title>
	<html:base />
	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
	<link rel="stylesheet"  media="all" href="../../<bean:write name="_LAYOUT_" property="esquemaCores"/>/estilo_conteudo.css" type="text/css">
	<%@ include file="../../js/header.inc.jsp" %>
</head>

<script language="JavaScript">

	function salvar()
	{
		document.forms[0].submit();
	}

	function validaCampos()
	{
		var innerHtmlMsgErros = '';
		var dataFim        = document.forms[0].dataVigencia.value;
        var horaFim        = document.forms[0].horaVigencia.value;

        innerHtmlMsgErros += CriticaString( document.forms[0].elements["descricao"], 3, 150, 'Descri��o' );

		// Critica Data de Vig�ncia
		if (( dataFim != null && dataFim != "" ) ||
 		    ( horaFim != null && horaFim != "" ))
		{
			if ( typeof(dataVigenc = validaRetornandoDataHora( dataFim, horaFim, 'vig�ncia' )) == "string" ) {
				innerHtmlMsgErros += dataVigenc;
			}
			else {
				// Compara Data de Vig�ncia com Data Atual
				if ( !validaDataMaior( dataFim, horaFim ) )
				{
					innerHtmlMsgErros += formataErro( 'Data de vig�ncia n�o pode ser anterior � data atual');
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
			abreAlerta( innerHtmlMsgErros );
		}
		
		setFocusById('cpo');
	}
	
	function fechar() {
		var baseHref = location.protocol + "//" + location.host + location.pathname;
		window.location.href = baseHref + "../../Vazio.do";
	}

	function onLoad() {
		document.forms[0].dataVigencia.setAttribute( 'dataType', 'date' );
		document.forms[0].horaVigencia.setAttribute( 'dataType', 'time' );
		afterPageBody();
		window.parent.document.getElementById("detalhe").style.height = this.document.body.scrollHeight;
		setFocusById('cpo');
	}
</script>

<%
	br.gov.serpro.ouvidoria.model.TipoAvaliacaoResposta tipoAvaliacaoResposta = (br.gov.serpro.ouvidoria.model.TipoAvaliacaoResposta) request.getAttribute("object");
%>

<body onload="onLoad();" style="margin: 0px 0px;">




	<p style="text-align: left" id="cpo" tabindex="1"><font class="asterisco">*</font><font class="obrigatorio">campo com preenchimento obrigat�rio</font></p>
	<form  name="subOrgao" method="post" action="../../../gerencial/AtualizarTipoAvaliacaoResposta.do">
		<input type="hidden" name="action" value="salvar">
		<input type="hidden" name="id" value="<bean:write name="object" property="id"/>">

		<table border="0" width="100%" cellpadding="0" cellspacing="0">
			<tr>
				<td align="left">
					<img accesskey="d" src="../../<bean:write name="_LAYOUT_" property="esquemaCores"/>/pasta_detalha.gif" name="imgDetalhe" tabindex="2" alt="Detalhameto"><table cellpadding="2" cellspacing="1" border="0" width="100%">
			</tr>
	  	
			<tr>
		    	<td class="tdHeader3">
	    			<label for="descricao">Descri��o&nbsp;<font class="asterisco">*</font></label>
	    		</td>
			    <td class="tdHeader4" colspan="3"> 
					<html:text styleId="descricao" tabindex="5" size="50" maxlength="150" name="object" property="descricao"/>
	    		</td>
			</tr>

			<tr>
	    		<td class="tdHeader3">
	    			<label for="datavigencia">Data de vig�ncia</label>
		    	</td>
			    <td class="tdHeader4" colspan="3"> 
			      	<input id="datavigencia" tabindex="5" size="10" maxlength="10" type="text" name="dataVigencia" value="<bean:write name="object" property="dataVigencia" format="dd/MM/yyyy"/>">
					&nbsp;�s&nbsp;
	      			<input id="datavigencia" tabindex="5" size="5"  maxlength="5"  type="text" name="horaVigencia" value="<bean:write name="object" property="dataVigencia" format="HH:mm"/>">
				</td>
			</tr>
	  
			<tr>
	    		<td class="tdHeader3">
	    			<label for="tipoavaliacao" tabindex="5">Tipo de avalia��o</label>
		    	</td>
			    <td class="tdHeader4" colspan="3"> 		
					<% if ( tipoAvaliacaoResposta.getTipoAvaliacao() == null || tipoAvaliacaoResposta.getTipoAvaliacao().equals("P") ) { %>
				      	<label for="Positiva">
				      	    <input id="positiva" type="Radio" tabindex="5" name="tipoAvaliacao" value="P" checked >Positiva&nbsp;&nbsp;
   			      	    </label>
   			      	    <label for="Negativa">
		 					<input id="negativa" type="Radio" tabindex="5" name="tipoAvaliacao" value="N" >Negativa	
   			      	    </label>	 					
					<%} else if (  tipoAvaliacaoResposta.getTipoAvaliacao().equals("N") ) { %>
					<label for="Positiva">
						<input id="positiva" type="Radio" tabindex="5" name="tipoAvaliacao" value="P" >Positiva &nbsp;&nbsp;
					</label>	
		      	    <label for="Negativa">					
	 					<input id="negativa" type="Radio" tabindex="5" name="tipoAvaliacao" value="N" checked>Negativa	
	 				</label>	
					<% } %>
			    </td>
			</tr>
  
			<tr> 
				<td class="tdHeader3" colspan="4" align="center">
					<logic:equal name="function" value="alterar">
			        	<input type="button" tabindex="10" name="botao" value="Alterar" class="button" onClick="validaCampos();">
					</logic:equal>
					<logic:equal name="function" value="incluir">
				        <input type="button" tabindex="10" name="botao" value="Salvar"  class="button" onClick="validaCampos();">
					</logic:equal>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
