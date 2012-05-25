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

<%@ taglib uri="/tags/struts-logic" prefix="logic" %>
<%@ taglib uri="/tags/struts-bean"  prefix="bean"%>
<%@ taglib uri="/tags/struts-html"  prefix="html"%>

<html lang="pt">
	<head>
		<title>Atualizar Cadastro</title>
		<html:base />
		<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
		<link rel="stylesheet" media="all" href="../../<bean:write name="_LAYOUT_" property="esquemaCores"/>/estilo_conteudo.css" type="text/css">
	</head>

	<%@ include file="../../js/header.inc.jsp" %>
	
<!-- Bibliotecas javascript  -->
<script language="JavaScript" src="../../js/util.js"></script>
	
<script language="JavaScript">


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

		innerHtmlMsgErros += CriticaString( document.forms[0].descricao         ,  3,   50,    'Tipo de Assunto' );
		innerHtmlMsgErros += CriticaString( document.forms[0].descricaoDetalhada, 10, 2000,    'Descrição' );

		var subOrgao = document.forms[0].instituicao.value;
		if ( subOrgao == null ||
		     subOrgao == ""   ||
		     subOrgao == "0" )
		{
			innerHtmlMsgErros += formataErro( "Sub-Órgão deve ser selecionado" );
		}

		innerHtmlMsgErros += CriticaNumero( document.forms[0].prazoInterno,  0, 4, 0, 'Prazo Interno' );
		innerHtmlMsgErros += CriticaNumero( document.forms[0].prazoExterno,  0, 4, 0, 'Prazo Externo' );

		if (  document.forms[0].prazoInterno.value != ""     &&
			  document.forms[0].prazoExterno.value != ""     &&
			  Number( document.forms[0].prazoInterno.value ) >=
			  Number( document.forms[0].prazoExterno.value ) )
		{
			innerHtmlMsgErros += formataErro( 'Prazo Interno deve ser menor que o Externo' );
		}

		if (( document.forms[0].dataVigencia.value != '' ||
		      document.forms[0].horaVigencia.value != '' ))
		{
			if ( typeof(dataVigenc = validaRetornandoDataHora( document.forms[0].dataVigencia.value, document.forms[0].horaVigencia.value, 'vigência' )) == "string" )
			{
				innerHtmlMsgErros += dataVigenc;
			}
			else
			{
				if ( dataVigenc <= agora )
				{
					innerHtmlMsgErros += formataErro( "Data de vigência deve ser maior que a data atual" );
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
			abreAlerta(texto);
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

	function onLoad()
	{
		document.forms[0].dataVigencia.setAttribute( 'dataType', 'date' );
		document.forms[0].horaVigencia.setAttribute( 'dataType', 'time' );
		afterPageBody();

		textCounter( document.forms[0].descricaoDetalhada, document.getElementById( 'contador' ), 2000 );

		window.parent.document.getElementById("detalhe").style.height = this.document.body.scrollHeight;
		setFocusById('cpo');
	}
	
</script>

<body onload="onLoad();" style="margin: 0px 0px;">




	<p style="text-align: left" id="cpo" tabindex="1"><font class="asterisco">*</font><font class="obrigatorio">campo com preenchimento obrigatório</font></p>

	<form  name="subOrgao" method="post" action="../../../gerencial/AtualizarTipoAssunto.do">
		<input type="hidden" name="action" value="salvar">
		<input type="hidden" name="id" value="<bean:write name="object" property="id"/>">

		<table border="0" width="100%" cellpadding="0" cellspacing="0">
			<tr>
				<td align="left">
					<img accesskey="d" src="../../<bean:write name="_LAYOUT_" property="esquemaCores"/>/pasta_detalha.gif" name="imgDetalhe" id="imgDetalhe" tabindex="2" alt="Detalhamento"><table cellpadding="2" cellspacing="1" border="0" align="center" width="100%">
						<col width="20%">
						<col width="20%">
						<col width="20%">
						<col width="40%">
						<tr>
							<td class="tdHeader3">
								<label for="descricao">Tipo de Assunto&nbsp;<font class="asterisco">*</font></label>
							</td>
							<td class="tdHeader4" colspan="3"> 
								<html:text styleId="descricao" tabindex="3" size="50" maxlength="50" name="object" property="descricao"/>
							</td>
						</tr>

						<tr>
							<td class="tdHeader3">
								<label for="descricaoDetalhada">Descrição&nbsp;<font class="asterisco">*</font></label>
							</td>
						    <td class="tdHeader4" colspan="3"> 
								<html:textarea styleId="descricaoDetalhada" tabindex="4" cols="50" rows="4" name="object" property="descricaoDetalhada"
										onkeyup="textCounter( this, document.getElementById( 'contador' ), 2000 );"/>
								<div id="contador">2000 caracteres restantes</div>
						    </td>
						</tr>

						<logic:equal name="function" value="alterar">
							<tr>
								<td class="tdHeader3">
									<label for="instituicao" tabindex="4">Sub-Órgão&nbsp;<font class="asterisco">*</font></label>
								</td>
							    <td class="tdHeader4" colspan="3"> 
									<html:select styleId="instituicao" tabindex="4" name="object" property="instituicao.id">
									    <html:option value="0">Selecione</html:option>
								        <html:options collection="listarInstituicao" property="id" labelProperty="descricao"/>    
									</html:select>
							    </td>
							</tr>
						</logic:equal>

						<logic:equal name="function" value="incluir">
							<tr>
								<td class="tdHeader3">
									<label for="instituicao" tabindex="4">Sub-Órgão&nbsp;<font class="asterisco">*</font></label>
								</td>
							    <td class="tdHeader4" colspan="3"> 
									<html:select styleId="instituicao" tabindex="4" name="object" property="instituicao">
									    <html:option value="0">Selecione</html:option>
							    	    <html:options collection="listarInstituicao" property="id" labelProperty="descricao"/>    
									</html:select>
							    </td>
							</tr>
						</logic:equal>

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
						    	<label for="vigencia">Data de vigência</label>
						    </td>
						    <td class="tdHeader4" colspan="3"> 
						      	<input id="vigencia" tabindex="5" size="10" maxlength="10" type="text" name="dataVigencia" value="<bean:write name="object" property="dataVigencia" format="dd/MM/yyyy"/>">
								&nbsp;às&nbsp;
						      	<input id="vigencia" tabindex="5" size="5"  maxlength="5"  type="text" name="horaVigencia" value="<bean:write name="object" property="dataVigencia" format="HH:mm"/>">
						    </td>
						</tr>

						<tr>
						    <td class="tdHeader3" colspan="4">
								<div align="center"> 
									<logic:equal name="function" value="alterar">
								        <input type="button" tabindex="10" name="botao" value="Alterar"  class="button" onClick="validaForm();">
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
</body>
</html>
