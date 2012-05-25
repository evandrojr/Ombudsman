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
   -- Data:         03/01/2005  
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

		function onLoad()
		{
			textCounter( document.forms[0].descricaoDetalhada, document.getElementById( 'contador' ), 2000 );
			document.forms[0].dataVigencia.setAttribute( 'dataType', 'date' );
			document.forms[0].horaVigencia.setAttribute( 'dataType', 'time' );
			afterPageBody();
			setFocusById('cpo');
		}

		function salvar()
		{
			document.forms[0].submit();
		}

		function validaForm()
		{

			var dataVigenc;
			var now               = new Date();
			var innerHtmlMsgErros = '';
			var agora             = new Date( y2k(now.getYear())
			                                , now.getMonth()
			                                , now.getDate()
		    	                            , now.getHours()
		        	                        , now.getMinutes() );

			innerHtmlMsgErros += CriticaString( document.forms[0].descricao         ,  3,   50,    'Tipo de Mensagem' );
			innerHtmlMsgErros += CriticaString( document.forms[0].descricaoDetalhada, 10, 2000,    'Descri��o' );

			
			if (document.forms[0].prazoInterno.value == '') {
				innerHtmlMsgErros += formataErro( 'Prazo Interno deve ser informado' );
			}
			
			if (document.forms[0].prazoExterno.value == '') {
				innerHtmlMsgErros += formataErro( 'Prazo Externo deve ser informado' );
			}
			
			//****************************************************************************
						
			if ( (document.forms[0].prazoInterno.value != '') &&
			     (document.forms[0].prazoExterno.value != '') ) {				 

				innerHtmlMsgErros += CriticaNumero( document.forms[0].prazoInterno  ,  1,    4, 0, 'Prazo Interno' );
				innerHtmlMsgErros += CriticaNumero( document.forms[0].prazoExterno  ,  1,    4, 0, 'Prazo Externo' );

				if (  Number( document.forms[0].prazoInterno.value ) >=
					  Number( document.forms[0].prazoExterno.value ) &&
					  innerHtmlMsgErros == "" )
				{
					innerHtmlMsgErros += formataErro( 'Prazo Interno deve ser menor que o Externo' );
				}
			}
			
			if (( document.forms[0].dataVigencia.value != '' ||
			      document.forms[0].horaVigencia.value != '' ))
			{
				if ( typeof(dataVigenc = validaRetornandoDataHora( document.forms[0].dataVigencia.value, document.forms[0].horaVigencia.value, 'vig�ncia' )) == "string" ) {
					innerHtmlMsgErros += dataVigenc;
				}
				else
				{
					if ( dataVigenc < agora )
					{
						innerHtmlMsgErros += formataErro( "Data de in�cio de cadastramento deve ser maior ou igual a data atual" );
					}
				}
			}

			if( innerHtmlMsgErros == '' )
			{
				abreConfirmacao( "salvar" );
			}
			else
			{
				var texto = innerHtmlMsgErros;
				abreAlerta( texto );
			}

			setFocusById('cpo');
		}

		function alterar()
		{
			document.forms[0].submit();
		}

		function fechar()
		{
			var baseHref = location.protocol + "//" + location.host + location.pathname;
			window.location.href = baseHref + "../../Vazio.do";
		}

	</script>

	<body onload="onLoad()" style="margin: 0px 0px;">

		<p style="text-align: left" id="cpo" tabindex="1"><font class="asterisco">*</font><font class="obrigatorio">campo com preenchimento obrigat�rio</font></p>

		<form  name="subOrgao" method="post" action="../../../gerencial/AtualizarTipoMensagem.do">
			<input type="hidden" name="action" value="salvar">
			<input type="hidden" name="id" value="<bean:write name="object" property="id"/>">

			<table border="0" width="100%" cellpadding="0" cellspacing="0">
				<tr>
					<td align="left">
						<img accesskey="d" src="../../<bean:write name="_LAYOUT_" property="esquemaCores"/>/pasta_detalha.gif"
								name="imgDetalhe" tabindex="2" alt="Tipo de Mensagem Escolhido"><table cellpadding="2" cellspacing="1" border="0" align="center" width="100%">
							<col width="20%">
							<col width="20%">
							<col width="20%">
							<col width="40%">

							<tr>
							    <td class="tdHeader3">
							    	<label for="descricao">Tipo de Mensagem&nbsp;<font class="asterisco">*</font></label>
							    </td>
							    <td class="tdHeader4" colspan="3">
									<html:text styleId="descricao" tabindex="5" size="50" maxlength="50" name="object" property="descricao"/>
							    </td>
							</tr>

							<tr>
						    	<td class="tdHeader3">
						    		<label for="descricaoDetalhada">Descri��o&nbsp;<font class="asterisco">*</font></label>
						    	</td>
							    <td class="tdHeader4" colspan="3"> 
									<html:textarea styleId="descricaoDetalhada" tabindex="5" cols="50" rows="4" name="object" property="descricaoDetalhada"
											onkeyup="textCounter( this, document.getElementById( 'contador' ), 2000 );"/>
									<div id="contador">2000 caracteres restantes</div>
								</td>
							</tr>

							<tr>
								<td class="tdHeader3">
									<label for="prazoInterno">Prazo Interno</label>
								</td>
							    <td class="tdHeader4">
									<html:text styleId="prazoInterno" tabindex="5" size="4" maxlength="4" name="object" property="prazoInterno"/>&nbsp;dias
							    </td>
							    <td class="tdHeader3">
							    	<label for="prazoExterno">Prazo Externo</label>
							    </td>
							    <td class="tdHeader4">
									<html:text styleId="prazoExterno" tabindex="5" size="4" maxlength="4" name="object" property="prazoExterno"/>&nbsp;dias
							    </td>
							</tr>

							<tr>
							    <td class="tdHeader3">
							    	<label for="vigencia">Data de vig�ncia</label>
							    </td>
							    <td class="tdHeader4" colspan="3"> 
							      	<input id="vigencia" tabindex="5" size="10" maxlength="10" type="text" name="dataVigencia" value="<bean:write name="object"
							      		   property="dataVigencia" format="dd/MM/yyyy"/>">
									&nbsp;�s&nbsp;
							      	<input id="vigencia" tabindex="5" size="5"  maxlength="5"  type="text" name="horaVigencia" value="<bean:write name="object"
							      		   property="dataVigencia" format="HH:mm"/>">
							    </td>
							</tr>

							<tr> 
							    <td class="tdHeader3" colspan="4">
									<div align="center"> 
										<logic:equal name="function" value="alterar">
									        <input type="button" tabindex="10" name="botao" value="Alterar" class="button" onClick="validaForm();">
										</logic:equal>

										<logic:equal name="function" value="incluir">
									        <input type="button" tabindex="10" name="botao" value="Salvar"  class="button" onClick="validaForm();">
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
