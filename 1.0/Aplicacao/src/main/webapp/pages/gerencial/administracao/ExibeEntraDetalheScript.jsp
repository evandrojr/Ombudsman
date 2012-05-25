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
   -- Descrição:    Exibe detalhes do scripts para consulta ou inclusão
   -- 
   -- Versão:       1.0
   -- Data:         27/12/2004
  */
--%>

<%@ taglib uri="/tags/struts-logic" prefix="logic" %>
<%@ taglib uri="/tags/struts-bean" prefix="bean"%>
<%@ taglib uri="/tags/struts-html" prefix="html"%>

<html:html lang="pt">

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<head>
	<html:base />

		<title>Atualizar Cadastro</title>
		<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
		<link rel="stylesheet"  media="all" href="../../<bean:write name="_LAYOUT_" property="esquemaCores"/>/estilo_conteudo.css" type="text/css">

<!-- Estilo para impressao -->
		<link rel="stylesheet" type="text/css" media="print" href="../../estilo_print.css">
</head>

<!-- Biblioteca javascript  -->
<%@ include file="../../js/header.inc.jsp" %>

<script type="text/javascript" charset='iso-8859-1'>

// Confirma alteração/exclusão do script selecionado

	function ValidaOperacao(pOperacao){
		var innerHtmlMsgErros = '';
		var pergunta   = '';					
	
		// Se a operação for de inclusão, não há solicitação de
		// de confirmação

	    if ( pOperacao == 'IncluirScript' )
	    {
        	document.forms[0].action.value = 'IncluirScript';
	    }
	    else
	    {
	    	if ( pOperacao == 'AlterarScript' )
	    	{        
	            pergunta = 'Confirma a alteração do script?';
    	    }
    	    else if ( pOperacao == 'ExcluirScript' )
    	    {
	        	pergunta = 'Confirma a exclusão do script?';
    	    }
	    }

		// Guarda a operação solicitada para o retorno da confirmação
		document.forms[0].operacao.value = pOperacao;
	
		// Críticas

		if (( pOperacao == 'AlterarScript' ) ||
 		    ( pOperacao == 'IncluirScript' ))
		{
			limpaCampoEmBranco( document.forms[0].txtTitulo );
			limpaCampoEmBranco( document.forms[0].txtTexto );

		    if ( document.forms[0].txtAssunto.value == '0' )
		    {
		        innerHtmlMsgErros += formataErro('O preenchimento do assunto &eacute; obrigatório');
	    	}      	    
			innerHtmlMsgErros += CriticaString( document.forms[0].txtTitulo, 10, 100,  'Identificação' );
			innerHtmlMsgErros += CriticaString( document.forms[0].txtTexto,  10, 3500, 'Texto' );

		}

		if( innerHtmlMsgErros == "" )
		{
	    	if (document.forms[0].action.value == 'IncluirScript')
	    	{
	        	salvar();   
		    }
		    else
		    {
				// Confirma alteração ou exclusão
		        abreConfirmacao('salvar', pergunta);
		    }    

		}
		else
		{
			var texto = innerHtmlMsgErros;
			abreAlerta( texto );		
		    onLoad();
		}		
	}

	// Chama tela de confirmação para alteração e exclusão
	function abreConfirmacao( callBack, pergunta )
	{
		var baseHref = location.protocol + "//" + location.host + location.pathname;
		var parametros = "?action=" + callBack + "&pergunta=" + pergunta;	
		novaJanela( baseHref + "../../../pages/Confirma.jsp" + parametros, "Confirma", 350, 120, 0, 0, 300, 200 );
	}

	// Efetiva a alteração ou a exclusão
	function salvar()
	{		
		// A próxima ação a ser disparada será a operação escolhida
		document.forms[0].action.value = document.forms[0].operacao.value;	
		document.forms[0].submit();		
	}

	// Tarefas a serem execuadas no carregamento da página
	function onLoad() {

		if (document.forms[0].AssuntoID.value != 0) {
			document.forms[0].txtAssunto.value = document.forms[0].AssuntoID.value;
		}
	
		// Redimensiona o iFrame de detalhe do script da tela 
		// de consulta de scripts	
		if ( document.forms[0].idScript.value == "0" )
		{
    		window.parent.document.getElementById("lista").style.height = this.document.body.scrollHeight;
    	}
    	else
    	{
			window.parent.document.getElementById("detalhe").style.height = this.document.body.scrollHeight;		
		}
	
	    if ( document.forms[0].txtTexto.value != "" )
	    {
    		textCounter( document.forms[0].txtTexto, document.getElementById( 'contador'), 3500 );
		}

		// Se a área de detalhe estiver com altura diferente de zero, &eacute; porque a aquela 
		// apresenta uma msg. Neste caso o foco deve ser mantido nesta.		
		if  (  ( ( document.forms[0].idScript.value == "0" ) &&
		         (window.parent.document.getElementById("detalhe").style.height  == "0px") ) ||
			   (document.forms[0].idScript.value != "0") )  {
			setFocusById('cpo');
		}
		
	}

</script>

<body onload="onLoad();" style="margin: 0px 0px;">



	<p style="text-align: left" id="cpo" tabindex="1"><font class="asterisco">*</font><font class="obrigatorio">campo com preenchimento obrigatório</font></p>
	<html:form action="AtualizarScript" target="detalhe">
	<table cellpadding="2" cellspacing="0" border="0" align="center" width="100%">
		<tr>
			<td align="left">
				<img src="../../<bean:write name="_LAYOUT_" property="esquemaCores"/>/pasta_detalha.gif" name="imgDetalhe" id="imgDetalhe" tabindex="1" alt='Script Escolhido'><table cellpadding='2' cellspacing='1' border='0' width='100%'>
					<tr> 	
						<td class="tdHeader3" id="maenome" width="12%">
							<label for="passunto"> Tipo Assunto&nbsp;<font class="asterisco">*</font></label>
						</td>
					    <td class="tdHeader4" id="maenome" colspan="4" align="left"> 
							<div align="left"> 
							    <html:select property="txtAssunto" tabindex="10" styleClass="text" styleId="passunto">
			    					<html:option value="0">Selecione</html:option>
						        	<html:options collection="lstAssuntos" property="id" labelProperty="descricao"/>    
					        	</html:select>
							</div>
						</td>    
					</tr>
					
					<tr>
					    <td class="tdHeader3" width="12%">
					    	<label for="identificacao">Identificação&nbsp;<font class="asterisco">*</font></label>
					    </td>
					    <td class="tdHeader4" colspan="4" align="left">
							<div align="left">
						        <logic:present name="Script">
							        <input id="identificacao" name="txtTitulo" size="50" tabindex="11" class="text"
									        value="<bean:write name="Script" property="titulo" />"  maxlength="3500" <bean:write name="podeEditar"/>>
						        </logic:present>
						        <logic:notPresent name="Script">
							        <input id="identificacao" name="txtTitulo" size="50" tabindex="11" class="text" maxlength="3500" <bean:write name="podeEditar"/>>
						        </logic:notPresent>
							</div>
					    </td>
					</tr>
					
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

					<tr> 
					    <td class="tdHeader3" id="maenome" colspan="5">
					    	<label for="texto">Texto&nbsp;<font class="asterisco">*</font></label>
							<logic:present name="Script">
								<br>
								<TEXTAREA id=texto name="txtTexto" rows=3 cols=70 tabindex="12" onKeyUp="textCounter(this, document.getElementById('contador'), 3500);" maxlength="3500" <bean:write name="podeEditar"/>><bean:write name="Script" property="descricao" /></TEXTAREA>
							</logic:present>
							<logic:notPresent name="Script">
								<br>
								<TEXTAREA id=texto name="txtTexto" rows=3 cols=70 tabindex="12" onKeyUp="textCounter(this, document.getElementById('contador'), 3500);" maxlength="3500" <bean:write name="podeEditar"/>></TEXTAREA>
							</logic:notPresent>

							<div id="contador">3500 caracteres restantes</div>
					 		<div align="center"> </div>
					 		
					 		<% 	// Caso seja a funcionalidade Visualizar Script, 
					 			// nao mostra botoes de alterar e excluir
					 			if ( !request.getAttribute("podeEditar").equals("readonly") ) {%>					 		
								<div align="center"> 
							        <logic:present name="Script">
							    	    <input type="button" name="botao" value="Alterar" tabindex="13" class="button" onClick="ValidaOperacao('AlterarScript')" >
								        &nbsp;&nbsp;&nbsp;&nbsp; 
								        <input type="button" name="botao2" value="Excluir" tabindex="14" class="button" onClick="ValidaOperacao('ExcluirScript')" >
								    </logic:present>
								    <logic:notPresent name="Script">
								        <input type="button" name="botao" value="Incluir" tabindex="13" class="button" onClick="ValidaOperacao('IncluirScript')" >
								    </logic:notPresent>
								</div>
						   <% } %>	
						   
						</td>
					</tr>
				</table>
			</td>
		</tr>

<!-- Verifica se o Script foi reprovado e portanto pode possuir observação -->

		<tr>
			<td>
				<logic:present name="Script">
					<logic:equal name="Script" property="estado.id" value="2">
						<table cellpadding="2" cellspacing="1" border="0" align="center" width="100%">
							<tr> 
								<td class="tdHeader3" width="12%">
									<label for="obs">Observações do Ouvidor:</label>
								</td>
								<td class="tdHeader4" colspan="4" align="left" id="obsOuvidor">
					    			<div tabindex="15" id="obs">
				    					<bean:write name="Script" property="observacao" />
								    </div>
								</td>
							</tr>
					  </table>
				  </logic:equal>
				</logic:present>
			</td>
		</tr>
	</table>    

<!-- ----------------------------------------------------------------- -->

	<logic:present name="Script">  
    	<INPUT TYPE="hidden" NAME="idScript"  VALUE="<bean:write name="Script" property="id" />">
		<INPUT TYPE="hidden" NAME="AssuntoID" VALUE="<bean:write name="Script" property="assunto.id" />">
	</logic:present>
	<logic:notPresent name="Script">  
    	<INPUT TYPE="hidden" NAME="idScript"  VALUE="0">
		<INPUT TYPE="hidden" NAME="AssuntoID" VALUE="0">
	</logic:notPresent>

	<html:hidden property="action"    value="" />
	<html:hidden property="operacao"  value="" />	

</html:form>

</body>
</html:html> 
