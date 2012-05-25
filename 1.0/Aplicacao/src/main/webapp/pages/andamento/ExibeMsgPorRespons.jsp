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
   -- M�dulo:       Andamento
   -- 
   -- Descri��o:    Exibe mensagem da responsabilidade do funcion�rio, permitindo 
   --               ao mesmo respond�-la, redirecion�-la ou reclassific�-la 
   -- 
   -- Vers�o:       1.0
   -- Data:         16/12/2004
  */
--%>

<%@ taglib uri="/tags/struts-logic" prefix="logic"%>
<%@ taglib uri="/tags/struts-bean" prefix="bean"%>
<%@ taglib uri="/tags/struts-html" prefix="html"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html  lang="pt-br">
	<head>
		<html:base />
		<meta http-equiv='Content-Type' content='text/html; charset=iso-8859-1'>
		<title>'Mensagem'</title>
		<link rel='stylesheet' media='all' href='../<bean:write name="_LAYOUT_" property="esquemaCores"/>/estilo_conteudo.css' type='text/css'>
		<link rel='stylesheet' type='text/css' media='print' href='../estilo_print.css'>
	</head>

	<!-- Biblioteca javascript  -->
	<script language="JavaScript" src="../js/util.js"></script>

	<script language='javascript'>
	
function NewWindow(mypage,myname,w,h,scroll,size, LeftPosition, TopPosition)
{
	var url = location.protocol + "//" + location.host + location.pathname + "../../../andamento/";
		
	settings = 'height='+h+',width='+w+',top='+TopPosition+',left='+LeftPosition+',scrollbars='+scroll+',resizable='+size+''
	win = window.open(url + mypage,myname,settings)
	if(win.window.focus){win.window.focus();}
	
	win.resizeTo(w,h);
}
	
// Verifica se a resposta foi preeenchida e chama a tela de confirma��o
function ResponderSalvar(form, pAcao){
	var innerHtmlMsgErros = '';

	limpaCampoEmBranco(document.forms[0].txtResposta);		
	
	var resp = document.forms[0].txtResposta.value;	
	var titulo = document.forms[0].txtTitulo.value;		

	if (pAcao == "SalvarRascunho") {	
	    if ( ( ( titulo == '')  ||
	  	       ( titulo == null) )  && 
		     ( ( resp == '')  ||
	  	       ( resp == null) )  )  {
	        innerHtmlMsgErros += formataErro('O preenchimento do t�tulo ou da resposta &eacute; obrigat�rio');
	    }        
	}
	
	if (pAcao == "ResponderMsg") {
		if ( ( resp == '')  ||
	  	     ( resp == null) )  {
	        innerHtmlMsgErros += formataErro('O preenchimento da resposta &eacute; obrigat�rio');
	    }        
	}
	
	
	
	if( resp != null) {		
		for( i=0; i < resp.length; i++){
			resp = resp.replace("\"", "'");
		}		
	}

	if ( ( resp != '')  &&
  	     ( resp != null) )  {
		if (resp.length < 10) { 
	        innerHtmlMsgErros += formataErro('Resposta deve ter no m�nimo 10 caracteres');
		}
    }        
	
	if(innerHtmlMsgErros == ""){
        // Par�metros a serem enviados
        var parametros = "?txtTitulo=" + document.forms[0].txtTitulo.value +		                         
		                         "&idAcionamento=" + document.forms[0].idAcionamento.value +
		                         "&idRemetenteRedirec=" + document.forms[0].idRemetenteRedirec.value +
		                         "&txtAcao=" + pAcao +
		                         "&idSolucao="+document.getElementById("idSolucao").value;
		                         
		NewWindow("ConfirmaResposta.do" + parametros,"winScripts",440, 185,"auto","no", 280, 260);            

	} else {    
		var texto = innerHtmlMsgErros;
		abreAlerta(texto);		
	    setaFocoOnLoad();	  	    	    
	}
		
}

// Seta o foco ao carregar a tela
function setaFocoOnLoad(){
	try {
		window.parent.document.getElementById("listaMsgPorRespons").style.height = this.document.body.scrollHeight;
		document.getElementById('MsgInicial').focus(); 	                        
	} catch(e) {}	
}

// Reabre a exibi��o da mensagem. Fun��o a ser chamada ap�s a reclassifica��o
function reabrir() {
	window.location = location.href;
}

// Retorna diret�rio do contexto
function abreAnexo(pAcao) {
	
	// Trata Href para obter url do arquivo anexo
	<% 
	String domain = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()+ request.getAttribute("diretorioAnexo").toString();;	
	String nomeAnexo = request.getAttribute("nomeAnexo").toString();
	String nomeMsgDigitalizada = request.getAttribute("nomeMsgDigitalizada").toString();
	
	%>

	if (pAcao == "anexo"){
	
		var textoUrl = escape("<%= nomeAnexo %>");
		window.open( "<%= domain %>" + textoUrl, "Anexo", "width=800,height=600,Menubar = YES, Resizable = YES, Status = YES, scrollbars=YES, Top= 130, Left=100" );
	}else if (pAcao == "msgDigital"){
		var textoUrl = escape("<%= nomeMsgDigitalizada %>");
		novaJanela( "<%= domain %>" + textoUrl, "Mensagem Digitalizada", "width=800,height=600,Menubar = YES, Resizable = YES, Status = YES, scrollbars=YES, Top= 130, Left=100" );
	}
	
}

function larguraTabela() {
	if ( (window.screenX == 800) &&
	     (window.screenX == 600) ) {
		return "60%";	 
	} else {
		return "90%";	
	}
}

// Ao carregar a tela
function onLoad() {    

	
	if (document.forms[0].txtResposta.value != "") {
    	textCounter(document.forms[0].txtResposta, document.getElementById('contador'), 5000);
	}
	
	
	setaFocoOnLoad();
}



</script>

	<body onload="onLoad();">

		<h1 id="MsgInicial" tabindex="1" align="Left">
			RESPONDER MENSAGEM
		</h1>

		<p tabindex="2" Align="LEFT">
			Utilize o formul�rio abaixo para responder ao acionamento, redirecionar, reclassificar ou salvar um rascunho da resposta que ser� fornecida
		</p>

		<form name='frm_msg' id='frm_msg' target="_parent">
	
			<input type="hidden" name="idSolucao" id="idSolucao" value=""/>
	
			<table cellpadding='2' cellspacing='0' border='0' width="90%" align="center">

				<tr>
					<td>
						<table cellpadding='2' cellspacing='1' border='0' width="100%">
							<tr align="middle">
								<td width="25%">
									<A href='javascript:NewWindow("ConsultaSolucoes.do?acaoChamadora=ResponderMsg","winScripts",680,  410,"yes","no", 80, 80)'> <IMG title="Consultar Banco de Solu��es" src="../images/lupa.gif" alt="Consultar Banco de Solu��es" border=0 tabindex="3"
											id="ObjInicial">&nbsp; </a>&nbsp;&nbsp; <A href='javascript:NewWindow( "ConsultaSolucoes.do?acaoChamadora=ResponderMsg","winScripts",680, 410,"yes","no", 80, 80)'> <b>Banco de Solu��es</b> </a>
								</td>

								<td width="25%">
									<A href='javascript:NewWindow("ConsultarBancoScriptsMsg.do","winScripts",680, 410,"yes","no", 200, 100)'> <IMG title="Consultar Scripts" src="../images/lupa.gif" alt="Consultar Scripts" border=0 tabindex="4"> </a>&nbsp;&nbsp; <A
										href='javascript:NewWindow("ConsultarBancoScriptsMsg.do","winScripts",680, 400,"yes","no", 200, 100)'> <b>Banco de Scripts</b> </a>
								</td>

								<td width="25%">&nbsp;
								<!--  Se for especialista consultor ele n�o pode redirecionar-->
									<logic:notPresent name="consultor" scope="request">											
										<A href='javascript:NewWindow("RedirecionarMensagem.do?idAcionamento=<%= request.getAttribute("idAcionamento") %>","winScripts",500, 600,"yes","no", 220, 120)'> <IMG title="Redirecionar Mensagem" src="../images/seta3.jpg"
												alt="Redirecionar Mensagem" border=0 tabindex="5"> </a>&nbsp;&nbsp; <A href='javascript:NewWindow("RedirecionarMensagem.do?idAcionamento=<%= request.getAttribute("idAcionamento") %>","winScripts",500, 600,"yes","no", 220, 100)'> <b>Redirecionar
												Mensagem</b> </a>
										<!--  -->												
									</logic:notPresent>
								</td>

								<!--  Se for especialista consultor ele n�o pode redirecionar-->

								<td width="25%" valign="middle">&nbsp;
									<logic:notPresent name="consultor" scope="request">
									<A href='javascript:NewWindow("ReclassificarMensagem.do?idAcionamento=<%= request.getAttribute("idAcionamento") %>","winScripts",480, 330,"yes","no", 220, 200)'> <IMG title="Reclassificar Mensagem" src="../images/seta3.jpg"
											alt="Reclassificar Mensagem" border=0 tabindex="6"> </a>&nbsp;&nbsp; <A href='javascript:NewWindow("ReclassificarMensagem.do?idAcionamento=<%= request.getAttribute("idAcionamento") %>","winScripts",480, 330,"auto","no", 220, 200)'> <b>Reclassificar
											</b> </a>
									</logic:notPresent>
								</td>
							</tr>

						</table>


						<%int colunas = 1;
			int colunasDespacho = 1;
			int colunasTipoAcionador = 1;

			if (request.getAttribute("meioRespostaTel") == "S") {
				colunas = 5;
				colunasDespacho = 3;
			}

			%>
						<script type="text/javascript" charset='iso-8859-1'>
					       <logic:notEmpty name="acionamento" property="despacho">
								<%  if  (colunas == 1) {
								           colunas = 3;
										   colunasTipoAcionador = 3;
								       } %>
						   </logic:notEmpty> 
					</script>

						<table cellpadding='2' cellspacing='1' border='0' width="100%">
							<tr>
								<td width=140 class='tdHeader3'>
									<div tabindex="7">
										Tipo de Mensagem:
									</div>
								</td>
								<td class='tdHeader4' colspan="<%= colunas %>">
									<div tabindex="8">
										&nbsp;
										<bean:write name="acionamento" property="mensagem.tipoMensagem.descricao" />
									</div>
								</td>
							</tr>
							<tr>
								<td class='tdHeader3'>
									<div tabindex="9">
										Tipo de Assunto:
									</div>
								</td>
								<td class='tdHeader4' colspan="<%= colunas %>">
									<div tabindex="10">
										&nbsp;
										<bean:write name="acionamento" property="mensagem.assunto.descricao" />
									</div>
								</td>
							</tr>
							<tr>
								<td width=140 class='tdHeader3'>
									<div tabindex="11">
										Tipo de Acionador:
									</div>
								</td>
								<td class='tdHeader4' colspan="<%= colunasTipoAcionador %>">
									<div tabindex="12">
										&nbsp;
										<bean:write name="acionamento" property="acionador.tipoAcionador.descricao" />
									</div>
								</td>
							</tr>

							<tr>
								<td class='tdHeader3'>
									<div tabindex="16">
										Prazo:
									</div>
								</td>
								<td class='tdHeader4' colspan="<%= colunas %>">
									<div tabindex="17">
										&nbsp;
										<bean:write name="acionamento" property="dataPrevistaResolucaoInterna" format="dd/MM/yyyy" />
									</div>
								</td>
							</tr>
							<tr>
								<td class='tdHeader3'>
									<div tabindex="18">
										T�tulo:
									</div>
								</td>
								<td class='tdHeader4' colspan="<%= colunas %>">
									<logic:notEmpty name="acionamento" property="respostaAcionamento">
										<input name='txtTitulo' tabindex="19" class='text' size='100' value='<%= request.getAttribute("titulo") %>' maxlength="150">
									</logic:notEmpty>
									<logic:empty name="acionamento" property="respostaAcionamento">
	            		    		&nbsp;				
									<input name='txtTitulo' tabindex="19" class='text' size='100' maxlength="150">
									</logic:empty>
								</td>
							</tr>
							<tr>
								<td class='tdHeader3' valign='top'>
									<div tabindex="20">
										Mensagem:
									</div>
								</td>
								<td class='tdHeader4' colspan="<%= colunas %>">
									<div tabindex="21">
										&nbsp; <b> <bean:write name="acionamento" property="mensagem.textoFormatado" filter="false" /> </b>
									</div>
								</td>
							</tr>

							<tr>
								<td class='tdHeader3' valign='top'>
									<div tabindex="22">
										Arquivo Anexo:
									</div>
								</td>
								<td class='tdHeader4' colspan="<%= colunas %>">
									<div tabindex="23">
										&nbsp;
										<html:link href="javascript:abreAnexo('anexo');">
											<bean:write name="acionamento" property="mensagem.arquivoAnexo" filter="true" />
										</html:link>
									</div>
								</td>
							</tr>

							<tr>
								<td class='tdHeader3' valign='top'>
									<div tabindex="24">
										Mensagem Digitalizada:
									</div>
								</td>
								<td class='tdHeader4' colspan="<%= colunas %>">
									<div tabindex="24">
										&nbsp;
										<html:link href="javascript:abreAnexo('msgDigital');">
											<bean:write name="acionamento" property="mensagem.mensagemDigitalizada" filter="true" />
										</html:link>
									</div>
								</td>
							</tr>

							<tr>
								<td class='tdHeader3' valign='top'>
									<div tabindex="24">
										Resposta:
									</div>
								</td>
								<td class='tdHeader4' align="LEFT" colspan="<%= colunas %>">
									<TEXTAREA tabindex="25" name='txtResposta' id='txtResposta' rows="8" cols="71" onKeyUp="textCounter(this, document.getElementById('contador'), 5000);" maxlenght="5000"><logic:notEmpty name="acionamento" property="respostaAcionamento"><bean:write name="acionamento" property="respostaAcionamento.texto" /></logic:notEmpty></TEXTAREA>
									<div id="contador">
										5000 caracteres restantes
									</div>
								</td>
							</tr>

							<!--  Se o acionamento foi redirecionado  -->
							<logic:notEmpty name="acionamento" property="despacho">
								<tr>
									<td class='tdHeader3'>
										<div tabindex="26">
											Despacho:
										</div>
									</td>
									<td class='tdHeader4'>							
										<textarea tabindex="26" name='txtDespacho' rows="8" cols="40" readonly><bean:write name="acionamento" property="despacho" /></textarea>										
									</td>
									<td class='tdHeader3' width="10%">
										<div tabindex="26">
											Remetente:
										</div>
									</td>
									<td class='tdHeader4' colspan="<%= colunasDespacho %>" width="20%">
										<%=request.getAttribute("remetenteRedirec")%>
									</td>
								</tr>
							</logic:notEmpty>

							<tr>
								<td colspan="<%= colunas + 1 %>" align='middle' class='tdHeader1'>
									<table cellpadding='2' cellspacing='1' border='0' width="100%" class='tdHeader1'>
										<tr>
											<td width="30%" class='tdHeader1'>
												&nbsp;
											</td>
											<td width="1%" height="100%" align="center" valign="center" class='tdHeader1'>
												<input type='button' value='Responder' tabindex="27" name='buscar' class='button' onClick="ResponderSalvar(this.form, 'ResponderMsg')" title="Responder definitivamente a mensagem">
											</td>
											<td width="20%" class='tdHeader1'>
												&nbsp;
											</td>
											<td width="1%" height="100%" align="center" valign="center" class='tdHeader1'>
												<input type='button' value='Salvar' tabindex="28" name='buscar' class='button' onClick="ResponderSalvar(this.form, 'SalvarRascunho')" title="Salvar os dados armazenados sem responder a mensagem">
											</td>
											<td width="30%" class='tdHeader1'>
												&nbsp;
											</td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
					</td>
				</tr>

			</table>
			<br>
			<hr>
			<p class="voltar">
				<a tabindex="99" title="voltar para p�gina anterior" href="javascript:history.go(-1)"> voltar </a>
			</p>
			<INPUT TYPE=hidden NAME="txtAcao" VALUE="">
			<INPUT TYPE=hidden NAME="idAcionamento" VALUE="<%= request.getAttribute("idAcionamento") %>">

			

			<logic:notPresent name="consultor" scope="request">
				<INPUT TYPE=hidden NAME="idRemetenteRedirec" VALUE="">
			</logic:notPresent>
			
			<logic:present name="consultor" scope="request">
				<logic:notEmpty name="idRemetenteRedirec">
					<INPUT TYPE=hidden NAME="idRemetenteRedirec" VALUE="<%= request.getAttribute("idRemetenteRedirec") %>">
				</logic:notEmpty>
				<logic:empty name="idRemetenteRedirec">
					<INPUT TYPE=hidden NAME="idRemetenteRedirec" VALUE="">
				</logic:empty>
			</logic:present>
			
			<INPUT TYPE=hidden NAME="dirArqAnexo" VALUE="<%= request.getAttribute("diretorioAnexo") %>">
			<INPUT TYPE=hidden NAME="arqAnexo" VALUE="<bean:write name="acionamento" property="mensagem.arquivoAnexo" filter="true" />">

		</form>

	</body>


</html>


