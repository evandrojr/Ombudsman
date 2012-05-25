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
<%--
 /*
   -- M�dulo:       Gerencial
   -- 
   -- Descri��o:    Exibe detalhes da solucao para consulta ou inclus�o
   -- 
   -- Vers�o:       1.0
   -- Data:         04/01/2005
  */
--%>

<%@ taglib uri="/tags/struts-logic" prefix="logic" %>
<%@ taglib uri="/tags/struts-bean" prefix="bean"%>
<%@ taglib uri="/tags/struts-html" prefix="html"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html   lang="pt-br">
	<head>
		<html:base />

		<title>Atualizar Banco de Solu��es</title>
		<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">

<!-- Estilo para impressao -->
		<link rel="stylesheet" type="text/css" media="all"   href="../../<bean:write name="_LAYOUT_" property="esquemaCores"/>/estilo_conteudo.css">
		<link rel="stylesheet" type="text/css" media="print" href="../../<bean:write name="_LAYOUT_" property="esquemaCores"/>/estilo_print.css">
	</head>

<!-- Bibliotecas javascript  -->
<%@ include file="../../js/header.inc.jsp" %>
<script language="JavaScript" src="../../js/data.js"></script>

<script language="JavaScript">
	
// Confirma altera��o/exclus�o do script selecionado
function ValidaOperacao( pOperacao )
{
	var innerHtmlMsgErros = '';
	var pergunta   		  = '';
	
	// Se a opera��o for de inclus�o, n�o h� solicita��o de
	// de confirma��o
    if ( pOperacao == 'IncluirSolucao' )
    {
    	document.forms[0].action.value = 'IncluirSolucao';        
       	pergunta = 'Confirma a incus�o da solu��o?';
    }
    else
    {
    	if ( pOperacao == 'AlterarSolucao' )
    	{
            pergunta = 'Confirma a altera��o da solu��o?';
        }
        else if ( pOperacao == 'ExcluirSolucao')
        {
        	pergunta = 'Confirma a exclus�o da solu��o?';
        }
    }

	// Guarda a opera��o solicitada para o retorno da confirma��o
	document.forms[0].operacao.value = pOperacao;

	// Cr�ticas
	if (( pOperacao == 'AlterarSolucao' ) ||
 	    ( pOperacao == 'IncluirSolucao' ))
	{
		limpaCampoEmBranco(document.forms[0].txtTitulo);
		limpaCampoEmBranco(document.forms[0].txtTexto);
		 
	    if ( document.forms[0].txtAssunto.value == '0' )
	    {
	        innerHtmlMsgErros += formataErro('O preenchimento do assunto &eacute; obrigat�rio')       
	    }
		innerHtmlMsgErros += CriticaString( document.forms[0].txtTitulo, 10, 100,  'Identifica��o' );
		innerHtmlMsgErros += CriticaString( document.forms[0].txtTexto,  10, 3500, 'Texto' );
	    
		// Valida a vig�ncia
		if (( document.forms[0].txtDatVigencia.value  != '') &&
		    ( document.forms[0].txtHoraVigencia.value != ''))
		{

			// Valida a Data
			if ( !CriticarData( document.forms[0].txtDatVigencia ))
			{
	 	        innerHtmlMsgErros += formataErro( 'Data de vig�ncia inv�lida, use o formato dd/mm/aaaa' );
	        }
	        else
	        {
				FormataData( document.forms[0].txtDatVigencia );

				// Valida a hora
				if ( !validaHora(document.forms[0].txtHoraVigencia.value ))
				{
					innerHtmlMsgErros += formataErro( 'Hora de vig�ncia inv�lida, use o formato hh:mm' );
				}
				else if ( !validaDataMaior( document.forms[0].txtDatVigencia.value
										  , document.forms[0].txtHoraVigencia.value ))
				{
					innerHtmlMsgErros += formataErro( 'Vig�ncia n�o pode ser anterior � data/hora atuais' );
				}
	        } 			
		}	  
		else if (( document.forms[0].txtDatVigencia.value  != '' ) &&
		         ( document.forms[0].txtHoraVigencia.value == '' ))
		{
			innerHtmlMsgErros += formataErro( 'Informe a hora de vig�ncia' );
		}
		else if (( document.forms[0].txtDatVigencia.value  == '' ) &&
				 ( document.forms[0].txtHoraVigencia.value != '' ))
		{
			innerHtmlMsgErros += formataErro( 'Informe a data de vig�ncia' );
		}			  
	}

	if( innerHtmlMsgErros == "" )
	{
		if ( document.forms[0].action.value == 'IncluirSolucao' )
		{
	        abreConfirmacao( 'salvar', pergunta );
	    }
	    else
	    {
			// Confirma altera��o ou exclus�o
	        abreConfirmacao( 'salvar', pergunta );
	    }
	}
	else
	{
		var texto = innerHtmlMsgErros;
		abreAlerta(texto);
		onLoad();
	}
}

// Efetiva a altera��o ou a exclus�o
function salvar() {
	// A pr�xima a��o a ser disparada ser� a opera��o escolhida
	document.forms[0].action.value = document.forms[0].operacao.value;	
	document.forms[0].submit();	
}

// Tarefas a serem executadas no carregamento da p�gina
function onLoad()
{
	if (document.forms[0].AssuntoID.value != 0) {
 		document.forms[0].txtAssunto.value = document.forms[0].AssuntoID.value;
	}	
	document.forms[0].txtDatVigencia.setAttribute( 'dataType', 'date' );
	document.forms[0].txtHoraVigencia.setAttribute( 'dataType', 'time' );

	// Redimensiona o iFrame de detalhe da solu��o da tela 
	// de consulta de solu��es	
	
	if ( document.forms[0].idSolucao.value == "0" )
	{
    	window.parent.document.getElementById("lista").style.height = this.document.body.scrollHeight;		
	}
	else
	{
		window.parent.document.getElementById("detalhe").style.height = this.document.body.scrollHeight;				
	}

    if ( document.forms[0].txtTexto.value != "" )
    {
    	textCounter(document.forms[0].txtTexto, document.getElementById('contador'), 3500);
	}
	
	afterPageBody();	
	
	// Se a �rea de detalhe estiver com altura diferente de zero, &eacute; porque a aquela 
	// apresenta uma msg. Neste caso o foco deve ser mantido nesta.		
	if  (  ( ( document.forms[0].idSolucao.value == "0" ) &&
	         (window.parent.document.getElementById("detalhe").style.height  == "0px") ) ||
		   (document.forms[0].idSolucao.value != "0") )  {	
		setFocusById('cpo');
	}	
}

</script>

<body onload="javascript:onLoad();" style="margin: 5px 0px;" >




	<p style="text-align: left" id="cpo" tabindex="1"><font class="asterisco">*</font><font class="obrigatorio">campo com preenchimento obrigat�rio</font></p>
	<html:form action="AtualizarSolucao" target="detalhe">

<!-- �rea destinada �s mensagens de erro -->
	<span id="areaErro" style="visibility:hidden"></span>

	<table cellpadding="2" cellspacing="0" border="0" align="center" width="100%">
		<tr>
			<td align="left">
				<img src="../../<bean:write name="_LAYOUT_" property="esquemaCores"/>/pasta_detalha.gif" name="imgDetalhe" id="imgDetalhe" tabindex="1" alt='Solu��o Escolhida'><table cellpadding='2' cellspacing='1' border='0' width='100%'>
					<tr>
<!-- ------------------- Assunto ------------------- -->

						<td class="tdHeader3" id="maenome" width="12%">
							<label for="passunto">Tipo Assunto&nbsp;<font class="asterisco">*</font></label>
						</td>
					    <td class="tdHeader4" id="maenome" colspan="4" align="left"> 
							<div align="left"> 
							    <html:select property="txtAssunto" tabindex="10" styleClass="text" styleId="passunto" >
								    <html:option value="0">Selecione</html:option>
							        <html:options collection="lstAssuntos" property="id" labelProperty="descricao"/>
						        </html:select>  	        
							</div>
					    </td>

<!-- ------------------- Data de Vig�ncia ----------------------------- -->

						<td class="tdHeader3" id="maenome" align="left" width="10%">
							<label for="vigencia">Vig�ncia:</label>
						</td>
						<td class="tdHeader4" id="maenome" align="left" >
					        <logic:present name="Solucao">
						        <input id="vigencia" name="txtDatVigencia" size="10" tabindex="11" MAXLENGTH="10"
								        value="<bean:write name="Solucao" property="dataVigencia" format="dd/MM/yyyy"/>">
					        </logic:present>
					        <logic:notPresent name="Solucao">
								<input id="vigencia" name="txtDatVigencia" size="10" tabindex="11" MAXLENGTH="10">
					        </logic:notPresent>
						</td>	    

<!-- ------------------- Hora de Vig�ncia ------------------- -->		  

						<td class="tdHeader3" align="left" width="5%">
							<label for="hora">�s:</label>
						</td>
						<td class="tdHeader4" align="left" width="35%">
					        <logic:present name="Solucao">
			        			<input id="hora" name="txtHoraVigencia" size="5" tabindex="12" MAXLENGTH="5"
								        value="<bean:write name="Solucao" property="dataVigencia" format="HH:mm"/>">
					        </logic:present>
					        <logic:notPresent name="Solucao">
		        				<input id="hora" name="txtHoraVigencia" size="5" tabindex="12" MAXLENGTH="5">
					        </logic:notPresent>
						</td>
					</tr>

<!-- ------------------- Identifica��o (t�tulo) ------------------- -->

					<tr>
					    <td class="tdHeader3" width="12%">
					    	<label for="identificacao">Identifica��o&nbsp;<font class="asterisco">*</font></label>
					    </td>
					    <td class="tdHeader4" colspan="8" align="left" > 
							<div align="left"> 
						        <logic:present name="Solucao">
						        <input	id="identificacao" name="txtTitulo" size="50" tabindex="13" class="text" 
										value="<bean:write name="Solucao" property="titulo" />" maxlength="100">
						        </logic:present>
						        <logic:notPresent name="Solucao">
							        <input id="identificacao" name="txtTitulo" size="50" tabindex="13" class="text" maxlength="100">
						        </logic:notPresent>   
							</div>
						</td>
					</tr>
					
<!-- ------------------- QtdUtiliza��o ------------------- -->
					
					<tr>
					    <td class="tdHeader3" width="12%">
					    	<label for="qtdUtilizacao" tabindex="11">Qtd de utiliza��o:</label>
					    </td>
					    <td class="tdHeader4" colspan="4" align="left" tabindex="11">
							<div align="left">&nbsp;	 				         
	 				         <bean:write name="qdtUtilizacao"/>
							</div>
					    </td>
					</tr>
					
<!-- ------------------- Texto ------------------- -->

					<tr> 
					    <td class="tdHeader3" id="maenome" colspan="9">
					    	<label for="texto">Texto&nbsp;<font class="asterisco">*</font></label>
							<logic:present name="Solucao">
								<br>
								<TEXTAREA	id=texto name="txtTexto" rows=3 cols=70 tabindex="14"
											onKeyUp="textCounter(this, document.getElementById('contador'), 3500);"
											maxlength="3500">
									<bean:write name="Solucao" property="texto"/></TEXTAREA>
							</logic:present> 

							<logic:notPresent name="Solucao">
								<br>
								<TEXTAREA	id=texto name="txtTexto" rows=3 cols=70 tabindex="14"
											onKeyUp="textCounter(this, document.getElementById('contador'), 3500);"
											maxlength="3500"></TEXTAREA>
							</logic:notPresent>        

							<div id="contador">3500 caracteres restantes</div>
							<div align="center"> </div>
							<div align="center"> 

								<logic:present name="Solucao">
							        <input type="button" name="botao" value="Alterar" tabindex="14"
							        		class="button" onClick="ValidaOperacao('AlterarSolucao')">
<!--
	 A exclus�o passa a ser feita pela altera��o da vig�ncia 
     Deixa-se por enquanto comentado para poss�vel volta atr�s
-->
<!-- 
							        &nbsp;&nbsp;&nbsp;&nbsp;
							        <input	type="button" name="botao2" value="Excluir" tabindex="15"
		        							class="button" onClick="ValidaOperacao('ExcluirSolucao')" >
-->
							    </logic:present>			

							    <logic:notPresent name="Solucao">
							        <input type="button" name="botao" value="Incluir" tabindex="15" 
						    	    		class="button" onClick="ValidaOperacao('IncluirSolucao')" >
							    </logic:notPresent>
							</div>
						</td>
					</tr>
				</table>  
			</td>
		</tr>
	</table>    
	
<!-- ----------------------------------------------------------------- -->

	<logic:present name="Solucao">
    	<INPUT TYPE="hidden" NAME="idSolucao"  VALUE="<bean:write name="Solucao" property="id" />">
		<INPUT TYPE="hidden" NAME="AssuntoID"  VALUE="<bean:write name="Solucao" property="assunto.id" />">	
	</logic:present>

	<logic:notPresent name="Solucao">  
	    <INPUT TYPE="hidden" NAME="idSolucao"  VALUE="0">
		<INPUT TYPE="hidden" NAME="AssuntoID"  VALUE="0">
	</logic:notPresent>

	<html:hidden property="action"    value="ConfirmarOperacao" />
	<html:hidden property="operacao"  value="" />

</html:form>
</body>

</html> 
