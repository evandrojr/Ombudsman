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
<% /*
   -- Sistema:      Ouvidoria
   -- Módulo:       Gerencial
   -- Aplicação:    Gestor de Conte&uacute;do
   -- 
   -- Descrição:   O gestor consulta as mensagens respondidas
   -- 
   -- Versão:        1.0
   -- Data:           13/01/2005
  */
%>

<%@ taglib uri="/tags/struts-logic" prefix="logic" %>
<%@ taglib uri="/tags/struts-bean" prefix="bean"%>
<%@ taglib uri="/tags/struts-html" prefix="html"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html   lang="pt-br">

	<head>
		<html:base />
		<title>Consulta Mensagens Respondidas</title>
		<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
		<link rel="stylesheet"  media="all" href="../../<bean:write name="_LAYOUT_" property="esquemaCores"/>/estilo_conteudo.css" type="text/css">

<!-- Estilo para impressao -->
		<link rel="stylesheet" type="text/css" media="print" href="../../estilo_print.css">
	</head>

<!-- Bibliotecas javascript  -->

	<%@ include file="../../js/header.inc.jsp" %>
	<script language="JavaScript" src="../../js/data.js"></script>
	<script language="JavaScript" src="../../js/util.js"></script>

	<script type="text/javascript" charset='iso-8859-1'>
		function mostraResultado()
		{
			var innerHtmlMsgErros = '';	

			// limpa os iFrames
		    window.frames[0].location = location.href + '../../../gerencial/Vazio.do';
		    window.frames[1].location = location.href + '../../../gerencial/Vazio.do';
	
			// Críticas

			// Valida o período
			if (( document.forms[0].txtDataIni.value != '') &&
			    ( document.forms[0].txtDataFim.value != ''))
			{

				// Valida as Datas   	
				if ( ! CriticarData(document.forms[0].txtDataIni ))
				{
		 	        innerHtmlMsgErros += formataErro('Data inicial do período inválida, use o formato dd/mm/aaaa');
		        }
		        else
		        {
					FormataData( document.forms[0].txtDataIni );
		        }

				if ( ! CriticarData(document.forms[0].txtDataFim ))
				{
		 	        innerHtmlMsgErros += formataErro('Data final do período inválida, use o formato dd/mm/aaaa');
		        }
		        else
		        {
					FormataData( document.forms[0].txtDataFim );
		        }

				// verifica se a data inicial &eacute; maior que a final
				if ( dataMaior (document.forms[0].txtDataIni.value, "00:00", 
				                     document.forms[0].txtDataFim.value, 	"00:00" )  )
				{
			 		innerHtmlMsgErros += formataErro('Data início do período maior que a data final');
		  		}		

			}
			else if (( document.forms[0].txtDataIni.value != '' ) &&
		             ( document.forms[0].txtDataFim.value == '' ))
			{
				innerHtmlMsgErros += formataErro('Informe a data final do período');
			}
			else if (( document.forms[0].txtDataIni.value == '' ) &&
		             ( document.forms[0].txtDataFim.value != '' ))
			{
		 	    innerHtmlMsgErros += formataErro('Informe a data inicial do período');
			}
			if ( document.forms[0].txtTexto.value != "" )
			{
				innerHtmlMsgErros += CriticaString( document.forms[0].txtTexto, 0, 100, 'Palavra Chave' );
			}
			
			if( innerHtmlMsgErros == '' )
			{
				var parametros = "?txtDataIni=" + document.forms[0].txtDataIni.value +
				                 "&txtDataFim=" + document.forms[0].txtDataFim.value +
				                 "&txtAssunto=" + document.forms[0].txtAssunto.value +
				                 "&txtTipoMsg=" + document.forms[0].txtTipoMsg.value +
				                 "&txtTexto="   + document.forms[0].txtTexto.value;


				document.body.style.cursor='wait';
				
				// Exibe o resultado da consulta no iFrame 1
			    window.frames[0].location = location.href + '../../../gerencial/ListaMsgRespondida.do' + parametros;				
			}
			else
			{
				var texto = innerHtmlMsgErros;
				abreAlerta(texto);
				onLoad();
			}
		}

		// Seta o foco ao carregar a tela
		function setaFocoOnLoad(){
			document.getElementById("MsgInicial").focus();
		}

	    function onLoad()
	    {
			document.forms[0].txtDataIni.setAttribute( 'dataType', 'date' );
			document.forms[0].txtDataFim.setAttribute( 'dataType', 'date' );			
			afterPageBody();
			javascript:setaFocoOnLoad();
		}

	</script>

<body onload="onLoad()" >




	<div id="content">
		<h1 tabindex="10" id="MsgInicial" >Consultar Mensagens Respondidas</h1>
		<html:form action="ListaMsgRespondida" method="POST" target="iFrame1">
		<table border="0" width="100%" cellpadding="2" cellspacing="0" >
			<tr>
				<td> 
					<table cellpadding="2" cellspacing="1" border="0" align="left" width="100%">
						<tr>
							<td class="tdHeader3" width="30%">
								<label for="pDatIni">Período:</label>
							</td>
							<td class="tdHeader4">De&nbsp;
						        <input class="text" name="txtDataIni" size="9"  MAXLENGTH=10 id="pDatIni" tabindex="20"><br>
								<label for="pDatFim">at&eacute;</label>
						        <input class="text" name="txtDataFim" size="9"  MAXLENGTH=10 id="pDatFim" tabindex="30">
							</td>
						</tr>
					</table>
				</td>
				<td height="100%">
					<table cellpadding="2" cellspacing="1" border="0" align="left" width="100%" height="100%">
						<tr>
							<td class="tdHeader3" width="30%">
					  			<label for="pTexto" >Palavra Chave:</label>
							</td>
							<td class="tdHeader4" valign ="middle"> 
			            		<input class="text" name="txtTexto" id="pTexto" tabindex="40" maxlength="50">
							</td>
						</tr>
					</table>
				</td>				
			</tr>
			<tr> 		
				<td>
					<table cellpadding="2" cellspacing="1" border="0" align="left" width="100%">
						<tr>
							<td class="tdHeader3" width="30%">
								<label for="pTipoMsg">Tipo Mensagem:</label>
							</td>
							<td class="tdHeader4" valign ="top"> 
							    <html:select property="txtTipoMsg" tabindex="50" styleClass="text" styleId="pTipoMsg" style="width:150px" >
								    <html:option value="0">Selecione</html:option>
							        <html:options collection="lstTiposMsg" property="id" labelProperty="descricao"/>
						        </html:select>
							</td>
						</tr>
					</table>
				</td>
				<td>
					<table cellpadding="2" cellspacing="1" border="0" align="left" width="100%">
						<tr>
							<td class="tdHeader3" width="30%">
								<label for="passunto">Assunto:</label>
							</td>
							<td class="tdHeader4">
								<html:select property="txtAssunto" tabindex="60" styleClass="text" styleId="passunto" >
							    	<html:option value="0">Selecione</html:option>
					    		    <html:options collection="lstAssuntos" property="id" labelProperty="descricao"/>    
			        			</html:select>	
							</td>
						</tr>
					</table>
				</td>
			</tr>			
			<tr>
				<td colspan='2' align='middle' class='tdHeader1'>
	                <label for="consultar mensagens respondidas"> 
				    <input type='button' tabindex="70" value='Buscar' name='buscar' class='button' onClick="javascript:mostraResultado();"  title='Clique para efetuar a consulta'>
	                </label> 
				</td>
			</tr>
		</table>
		<br>

<!-- ----------------------------------------------------------------- -->

		<table cellpadding="0" cellspacing="0" border="0"  width="100%">
			<tr>
				<td>
				<iframe src='_blank.htm' name='iFrame1' id='iFrame1' longdesc='Lista de Mensagens Respondidas' 
			    		      border='0' width='100%' height='0' scrolling='0' marginwidth='0' marginheight='0' frameborder='0'></iframe>
				</td>
			</tr>
		</table>

<!-- ----------------------------------------------------------------- -->

		<table cellpadding="0" cellspacing="0" border="0"  width="100%">
			<tr>
				<td>
				<iframe src='_blank.htm' name='iFrame2' id='iFrame2' longdesc='Detalhe da Mensagem Respondida' 
					          border='0' width='100%' height="0" scrolling="0" marginwidth="0" marginheight="0" frameborder="0" ></iframe>
				</td>
			</tr>
		</table>

<!-- ----------------------------------------------------------------- -->
  
		<hr>
		<p class="voltar"> 
			<a title="voltar para página anterior" href="javascript:history.go(-1)" >voltar</a>
		</p>

		</html:form> 

		</div>

	</body>
</html>
