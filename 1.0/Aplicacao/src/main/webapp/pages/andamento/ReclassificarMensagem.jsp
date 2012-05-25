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

<%@ taglib uri="/tags/struts-logic" prefix="logic" %>
<%@ taglib uri="/tags/struts-bean" prefix="bean"%>
<%@ taglib uri="/tags/struts-html" prefix="html"%>

<html:html lang="pt">
	<head>
		<html:base />

		<title>RECLASSIFICAR ACIONAMENTO</title>
		<meta http-equiv="content-type" content="text/html;charset=iso-8859-1" />
		<meta name="Keywords" content="acionamento, reclassificar, acessibilidade, guia, serpro, inclus�o, defici�ncia, recomenda��es, necessidade especial, ouvidoria" />

<!-- Estilos -->
		<link rel="stylesheet" type="text/css" media="print" href="../estilo_print.css">
		<link rel='stylesheet'  media='all' href='../<bean:write name="_LAYOUT_" property="esquemaCores"/>/estilo_conteudo_pop.css' type='text/css'>
		<script src="../js/util.js" type="text/javascript"></script>

		<script language='javascript'>
			
			function retornaStringMensagemErro(campo){
				var str;
				str  = '<li tabindex="3">';
				str += campo;
				str += ' deve ser preenchido.</li>';
				return str;
			}
			
			function reclassificar(){
				var innerHtmlErroIni = '<ul>';
				var innerHtmlErroFim = '</ul>';
				var innerHtmlMsgErros = '';
				

				if( (document.forms[0].assunto!=undefined && document.forms[0].assunto.value=='0') &&
					(document.forms[0].tipoMensagem!=undefined && document.forms[0].tipoMensagem.value=='0') ){
					

					if(document.forms[0].assunto!=undefined && document.forms[0].assunto.value=='0'){
						innerHtmlMsgErros += retornaStringMensagemErro('Assunto');
					}
					if(document.forms[0].tipoMensagem!=undefined && document.forms[0].tipoMensagem.value=='0'){
						innerHtmlMsgErros += retornaStringMensagemErro('Tipo de Mensagem');
					}
				}	
					
				if( innerHtmlMsgErros == "" ){
					abreConfirmacao("enviar");
				} else {
					abreAlerta(innerHtmlErroIni + innerHtmlMsgErros + innerHtmlErroFim);
				}
			}
			
			function enviar(){
				document.forms[0].action = '../../andamento/ConfirmaReclassificarMensagem.do?idAcionamento=' + <%=request.getParameter("idAcionamento")%>;
				document.forms[0].submit();
			}
			
			function redirecionar(){
				// Trata Href
				var basehref = location.href;
				var i = basehref.lastIndexOf('/');
				basehref = basehref.substring(0, i + 1);				
				
				window.location.href= basehref + 'RedirecionarMensagem.do?idAcionamento=' + <%=request.getParameter("idAcionamento")%>;
			}
			
			function setaFocoInicial(){
				document.getElementById('titulo').focus();
			}
			
			function checaSubmit(){
				<logic:present name="fezSubmit" scope="request">
					//window.opener.location.href='ConsultaMsgPorRespons.do';
					
					window.opener.reabrir();						
					window.close();
				</logic:present>
			}
		</script>

	</head>

	<body onLoad="checaSubmit();setaFocoInicial();">

		<div id="content"> 
			<html:form action="/ConfirmaReclassificarMensagem"  method="post">
			<h1 id="titulo" tabindex="1">Reclassificar Acionamento</h1>

			<p tabindex="5" Align="LEFT">
				� necess�rio preencher um dos dois campos para realizar a reclassifica��o.
			</p>
			<table cellpadding='2' cellspacing='1' border='0' width="100%">
				
				<logic:present name="listaAssuntos">
				<tr>
					<td class="tdHeader3" >
						<label for="assunto">Assunto: </label>
					</td>
					<td class="tdHeader4" colspan=3> 
						<html:select property="assunto" tabindex="5" styleClass="text" styleId="assunto">
							<html:option value="0">Selecione</html:option>
							<html:options collection="listaAssuntos" property="id" labelProperty="descricao"/>    
						</html:select>
					 </td>
				</tr>
				</logic:present>
				<logic:present name="listaTipoMensagem">
				<tr>
					<td class="tdHeader3" >
						<label for=tipoMensagem>Tipo de Mensagem: </label>
					</td>
					<td class="tdHeader4" colspan=3> 
						<html:select property="tipoMensagem" tabindex="5" styleClass="text" styleId="tipoMensagem">
							<html:option value="0">Selecione</html:option>
							<html:options collection="listaTipoMensagem" property="id" labelProperty="descricao"/>    
						</html:select>
					 </td>
				</tr>
				</logic:present>
				<tr>
					<td class='tdHeader1' align='middle' colspan='2'>
						<input	type='button' class='button' value='Reclassificar' tabindex='6'
								onClick='reclassificar();' title='Reclassificar'>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input	type='button' class='button' value='Redirecionar' tabindex='7'
								onClick='redirecionar();' title='Redirecionar'>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type='button' class='button' value='Fechar' tabindex='8' onClick='window.close()' onkeypress='redirecionar();' title="Fechar Janela">
					</td>
				</tr>
				<logic:present name="message">
				<h2 id="mensagem" title="mensagem" tabindex="1">Mensagem</h2>
				</logic:present>    
				<ul>
					<html:messages id="message" message="true">
				        <li tabindex="2" title="<%= message %>"><%= message %></li>
				    </html:messages>
				</ul>
				
			</table>
		</html:form>
	</div>
	</body>
</html:html>

