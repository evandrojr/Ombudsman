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
   -- Sistema:      Ouvidoria
   -- Módulo:       Gerencial
   -- Aplicação:    Gestor de Sistema
   -- 
   -- Versão:       1.0
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

        innerHtmlMsgErros += CriticaString( document.forms[0].elements["descricao"], 3, 150, 'Descrição' );

		// Critica Data de Vigência
		if (( dataFim != null && dataFim != "" ) ||
 		    ( horaFim != null && horaFim != "" ))
		{
			if ( typeof(dataVigenc = validaRetornandoDataHora( dataFim, horaFim, 'vigência' )) == "string" ) {
				innerHtmlMsgErros += dataVigenc;
			}
			else {
				// Compara Data de Vigência com Data Atual
				if ( !validaDataMaior( dataFim, horaFim ) )
				{
					innerHtmlMsgErros += formataErro( 'Data de vigência não pode ser anterior à data atual');
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




	<p style="text-align: left" id="cpo" tabindex="1"><font class="asterisco">*</font><font class="obrigatorio">campo com preenchimento obrigatório</font></p>
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
	    			<label for="descricao">Descrição&nbsp;<font class="asterisco">*</font></label>
	    		</td>
			    <td class="tdHeader4" colspan="3"> 
					<html:text styleId="descricao" tabindex="5" size="50" maxlength="150" name="object" property="descricao"/>
	    		</td>
			</tr>

			<tr>
	    		<td class="tdHeader3">
	    			<label for="datavigencia">Data de vigência</label>
		    	</td>
			    <td class="tdHeader4" colspan="3"> 
			      	<input id="datavigencia" tabindex="5" size="10" maxlength="10" type="text" name="dataVigencia" value="<bean:write name="object" property="dataVigencia" format="dd/MM/yyyy"/>">
					&nbsp;às&nbsp;
	      			<input id="datavigencia" tabindex="5" size="5"  maxlength="5"  type="text" name="horaVigencia" value="<bean:write name="object" property="dataVigencia" format="HH:mm"/>">
				</td>
			</tr>
	  
			<tr>
	    		<td class="tdHeader3">
	    			<label for="tipoavaliacao" tabindex="5">Tipo de avaliação</label>
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
