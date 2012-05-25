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
<%--
 /*
   -- Módulo:       Gerencial
   -- 
   -- Descrição:    Exibe detalhes da solucao para consulta ou inclusão
   -- 
   -- Versão:       1.0
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

		<title>Atualizar Banco de Soluções</title>
		<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">

<!-- Estilo para impressao -->
		<link rel="stylesheet" type="text/css" media="all"   href="../../<bean:write name="_LAYOUT_" property="esquemaCores"/>/estilo_conteudo.css">
		<link rel="stylesheet" type="text/css" media="print" href="../../<bean:write name="_LAYOUT_" property="esquemaCores"/>/estilo_print.css">
	</head>

<!-- Bibliotecas javascript  -->
<%@ include file="../../js/header.inc.jsp" %>
<script language="JavaScript" src="../../js/data.js"></script>

<script language="JavaScript">
	
// Confirma alteração/exclusão do script selecionado
function ValidaOperacao( pOperacao )
{
	var innerHtmlMsgErros = '';
	var pergunta   		  = '';
	
	// Se a operação for de inclusão, não há solicitação de
	// de confirmação
    if ( pOperacao == 'IncluirSolucao' )
    {
    	document.forms[0].action.value = 'IncluirSolucao';        
       	pergunta = 'Confirma a incusão da solução?';
    }
    else
    {
    	if ( pOperacao == 'AlterarSolucao' )
    	{
            pergunta = 'Confirma a alteração da solução?';
        }
        else if ( pOperacao == 'ExcluirSolucao')
        {
        	pergunta = 'Confirma a exclusão da solução?';
        }
    }

	// Guarda a operação solicitada para o retorno da confirmação
	document.forms[0].operacao.value = pOperacao;

	// Críticas
	if (( pOperacao == 'AlterarSolucao' ) ||
 	    ( pOperacao == 'IncluirSolucao' ))
	{
		limpaCampoEmBranco(document.forms[0].txtTitulo);
		limpaCampoEmBranco(document.forms[0].txtTexto);
		 
	    if ( document.forms[0].txtAssunto.value == '0' )
	    {
	        innerHtmlMsgErros += formataErro('O preenchimento do assunto &eacute; obrigatório')       
	    }
		innerHtmlMsgErros += CriticaString( document.forms[0].txtTitulo, 10, 100,  'Identificação' );
		innerHtmlMsgErros += CriticaString( document.forms[0].txtTexto,  10, 3500, 'Texto' );
	    
		// Valida a vigência
		if (( document.forms[0].txtDatVigencia.value  != '') &&
		    ( document.forms[0].txtHoraVigencia.value != ''))
		{

			// Valida a Data
			if ( !CriticarData( document.forms[0].txtDatVigencia ))
			{
	 	        innerHtmlMsgErros += formataErro( 'Data de vigência inválida, use o formato dd/mm/aaaa' );
	        }
	        else
	        {
				FormataData( document.forms[0].txtDatVigencia );

				// Valida a hora
				if ( !validaHora(document.forms[0].txtHoraVigencia.value ))
				{
					innerHtmlMsgErros += formataErro( 'Hora de vigência inválida, use o formato hh:mm' );
				}
				else if ( !validaDataMaior( document.forms[0].txtDatVigencia.value
										  , document.forms[0].txtHoraVigencia.value ))
				{
					innerHtmlMsgErros += formataErro( 'Vigência não pode ser anterior à data/hora atuais' );
				}
	        } 			
		}	  
		else if (( document.forms[0].txtDatVigencia.value  != '' ) &&
		         ( document.forms[0].txtHoraVigencia.value == '' ))
		{
			innerHtmlMsgErros += formataErro( 'Informe a hora de vigência' );
		}
		else if (( document.forms[0].txtDatVigencia.value  == '' ) &&
				 ( document.forms[0].txtHoraVigencia.value != '' ))
		{
			innerHtmlMsgErros += formataErro( 'Informe a data de vigência' );
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
			// Confirma alteração ou exclusão
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

// Efetiva a alteração ou a exclusão
function salvar() {
	// A próxima ação a ser disparada será a operação escolhida
	document.forms[0].action.value = document.forms[0].operacao.value;	
	document.forms[0].submit();	
}

// Tarefas a serem executadas no carregamento da página
function onLoad()
{
	if (document.forms[0].AssuntoID.value != 0) {
 		document.forms[0].txtAssunto.value = document.forms[0].AssuntoID.value;
	}	
	document.forms[0].txtDatVigencia.setAttribute( 'dataType', 'date' );
	document.forms[0].txtHoraVigencia.setAttribute( 'dataType', 'time' );

	// Redimensiona o iFrame de detalhe da solução da tela 
	// de consulta de soluções	
	
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
	
	// Se a área de detalhe estiver com altura diferente de zero, &eacute; porque a aquela 
	// apresenta uma msg. Neste caso o foco deve ser mantido nesta.		
	if  (  ( ( document.forms[0].idSolucao.value == "0" ) &&
	         (window.parent.document.getElementById("detalhe").style.height  == "0px") ) ||
		   (document.forms[0].idSolucao.value != "0") )  {	
		setFocusById('cpo');
	}	
}

</script>

<body onload="javascript:onLoad();" style="margin: 5px 0px;" >




	<p style="text-align: left" id="cpo" tabindex="1"><font class="asterisco">*</font><font class="obrigatorio">campo com preenchimento obrigatório</font></p>
	<html:form action="AtualizarSolucao" target="detalhe">

<!-- Área destinada às mensagens de erro -->
	<span id="areaErro" style="visibility:hidden"></span>

	<table cellpadding="2" cellspacing="0" border="0" align="center" width="100%">
		<tr>
			<td align="left">
				<img src="../../<bean:write name="_LAYOUT_" property="esquemaCores"/>/pasta_detalha.gif" name="imgDetalhe" id="imgDetalhe" tabindex="1" alt='Solução Escolhida'><table cellpadding='2' cellspacing='1' border='0' width='100%'>
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

<!-- ------------------- Data de Vigência ----------------------------- -->

						<td class="tdHeader3" id="maenome" align="left" width="10%">
							<label for="vigencia">Vigência:</label>
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

<!-- ------------------- Hora de Vigência ------------------- -->		  

						<td class="tdHeader3" align="left" width="5%">
							<label for="hora">Às:</label>
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

<!-- ------------------- Identificação (título) ------------------- -->

					<tr>
					    <td class="tdHeader3" width="12%">
					    	<label for="identificacao">Identificação&nbsp;<font class="asterisco">*</font></label>
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
					
<!-- ------------------- QtdUtilização ------------------- -->
					
					<tr>
					    <td class="tdHeader3" width="12%">
					    	<label for="qtdUtilizacao" tabindex="11">Qtd de utilização:</label>
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
	 A exclusão passa a ser feita pela alteração da vigência 
     Deixa-se por enquanto comentado para possível volta atrás
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
