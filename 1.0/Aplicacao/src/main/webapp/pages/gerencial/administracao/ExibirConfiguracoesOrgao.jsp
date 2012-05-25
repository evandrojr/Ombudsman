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
   -- Data:         04/01/2005
   -- 
  */
--%>

<%@ taglib uri="/tags/struts-logic" prefix="logic" %>
<%@ taglib uri="/tags/struts-bean" prefix="bean"%>
<%@ taglib uri="/tags/struts-html" prefix="html"%>

<!-- Classes a serem usadas na recuperação dos meios de envio do órgão -->
<%@page import="br.gov.serpro.ouvidoria.model.MeioEnvioRespostaOrgao"	%>
<%@page import="java.util.Collection"	%>
<%@page import="java.util.Iterator"	%>

<jsp:useBean id="orgao" class="br.gov.serpro.ouvidoria.model.Orgao" scope="request"/>

<html lang="pt">
    <head>
        <title>Atualizar Cadastro</title>
        <html:base />
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <link rel="stylesheet"  media="all" href="../../<bean:write name="_LAYOUT_" property="esquemaCores"/>/estilo_conteudo.css" type="text/css">

        <!-- Bibliotecas javascript  -->
        <script language="JavaScript" src="../../js/util.js"></script>

        <script language="JavaScript">
	
            function salvar() {
            	document.forms[0].submit();
            }

            function validaCampos()
            {
            var innerHtmlMsgErros = "";

            var esquemaCoresLayout = document.forms[0].elements["esquemaCoresLayout"].value;
            if ( esquemaCoresLayout == null || esquemaCoresLayout == "" || esquemaCoresLayout == "0" )
            {
            innerHtmlMsgErros += formataErro("Diretório de esquema de cores deve ser preenchido");
            }
	
            innerHtmlMsgErros += CriticaString( document.forms[0].elements["nomeExibicaoOrgao"]            ,  3,  100, 'Nome do órgão para exibição' );
            innerHtmlMsgErros += CriticaString( document.forms[0].elements["corCabecalhoLogo"]             ,  6,    6, 'Cor referente a página do logo' );
            innerHtmlMsgErros += CriticaString( document.forms[0].elements["corCabecalhoBanner"]           ,  6,    6, 'Cor referente a página do banner' );
            innerHtmlMsgErros += CriticaString( document.forms[0].elements["textoApresentacaoOuvidoria"]   , 10,  700, 'Texto de apresentação da ouvidoria' );
            innerHtmlMsgErros += CriticaString( document.forms[0].elements["textoApresentacaoFormulario"]  , 10, 2000, 'Texto de apresentação do acionamento' );
            innerHtmlMsgErros += CriticaString( document.forms[0].elements["textoRespostaAcionamento"]     , 10, 2000, 'Texto de resposta no momento do acionamento' );
            innerHtmlMsgErros += CriticaString( document.forms[0].elements["textoConsultaRespostaNoPrazo"] , 10, 2000, 'Texto consulta de resposta no prazo' );
            innerHtmlMsgErros += CriticaString( document.forms[0].elements["textoConsultaRespostaSemPrazo"], 10, 2000, 'Texto consulta de resposta sem prazo' );
            innerHtmlMsgErros += CriticaString( document.forms[0].elements["textoConsultaRespostaEmAtraso"], 10, 2000, 'Texto consulta de resposta em atraso' );
            innerHtmlMsgErros += CriticaString( document.forms[0].elements["textoApresentacaoResposta"]    , 10, 2000, 'Texto apresentação da resposta' );
            innerHtmlMsgErros += CriticaString( document.forms[0].elements["textoAvaliacaoResposta"]       , 10, 2000, 'Texto de avaliação da resposta' );
            innerHtmlMsgErros += CriticaString( document.forms[0].elements["textoInformacaoOuvidoria"]     , 10, 2000, 'Texto com informações sobre a ouvidoria' );
            innerHtmlMsgErros += CriticaString( document.forms[0].elements["textoCanaisComunicacao"]       , 10, 2000, 'Texto referente a outros canais de comunicação' );
            innerHtmlMsgErros += CriticaString( document.forms[0].elements["textoLegislacaoOuvidoria"]     , 10, 2000, 'Texto referente a legislação' );
            
            if(document.getElementById("notificacaoEmail").checked){
	            innerHtmlMsgErros += CriticaString( document.forms[0].elements["textoNotificacaoPendencia"]    , 10, 2000, 'Texto referente a Notificação de Mensagens com resposta pendente' );
	            innerHtmlMsgErros += CriticaString( document.forms[0].elements["textoNotificacaoAtraso"]       , 10, 2000, 'Texto referente a Notificação de Mensagens com Resposta em atraso' );
	            innerHtmlMsgErros += CriticaString( document.forms[0].elements["textoNotificacaoAtrasoCritico"], 10, 2000, 'Texto referente a Notificação de Mensagens com Resposta em atraso crítico' );
				innerHtmlMsgErros += CriticaString( document.forms[0].elements["horaEnvioNotificacao"], 5, 5, 'Hora do Agendamento de Notificação' );			
			}
            if (document.getElementById("permiteArquivoAnexoAcionamento").checked )
            {
            innerHtmlMsgErros += CriticaNumero( document.forms[0].elements["tamanhoMaxArquivoAnexo"]            , 1, 7, 2, 'Tamanho máximo para arquivo anexo' );
            }

            if (document.getElementById("permiteMsgDigitalizadaAcionamento").checked )
            {
          		innerHtmlMsgErros += CriticaNumero( document.forms[0].elements["tamanhoMaxArquivoCartaDigitalizada"], 1, 7, 0, 'Tamanho máximo para carta digitalizada' );
            }

			
            if (	(document.getElementById("possuiCodigoAcesso").checked) 
            &&	(document.getElementById("existeBloqueioProtocoloPeloCodigo").checked))
            {
            innerHtmlMsgErros += CriticaNumero( document.forms[0].elements["qtdeTentativasPossiveisCodigoAcesso"], 1, 7, 0, 'N&uacute;mero máximo de falhas no código de acesso' );
            innerHtmlMsgErros += CriticaNumero( document.forms[0].elements["tempoBloqueioProtocoloPeloCodigo"]   , 1, 7, 0, 'Tempo de bloqueio pelo código de acesso');
            }


            if (	(document.getElementById("possuiCodigoAcesso").checked) 
            &&	(document.getElementById("existeBloqueioProtocoloPelaPergunta").checked))
            {
            innerHtmlMsgErros += CriticaNumero( document.forms[0].elements["qtdeTentativasPossiveisPergunta"]   , 1, 7, 0, 'N&uacute;mero máximo de falhas na pergunta' );
            innerHtmlMsgErros += CriticaNumero( document.forms[0].elements["tempoBloqueioProtocoloPelaPergunta"], 1, 7, 0, 'Tempo de bloqueio pela pergunta');
            }

			
            if ( document.getElementById("nomeDiretorioOrgao").disabled == false )
            {
            innerHtmlMsgErros += validaNomeDiretorio( document.forms[0].elements["nomeDiretorioOrgao"], 50, 'Nome do diretório do órgão' );
            }
			
            var str = CriticaString( document.forms[0].elements["urlSuporteUsuario"], 1, 255, 'URL de suporte ao usuário' );
            if (str == null || str == "") 
            {
            if (validaURL(document.forms[0].elements["urlSuporteUsuario"]) ) {
            innerHtmlMsgErros += formataErro("URL de suporte ao usuário deve ser iniciado com \"http://\"");
            }
            } 
            else 
            {
            innerHtmlMsgErros += str;
            }

            var el = document.forms[0].elements["urlBaseFuncionarios"];
            if ( el.value != null && el.value != '') 
            {
            var str = CriticaString( document.forms[0].elements["urlBaseFuncionarios"], 1, 255, 'URL para consulta de funcionários ' );
            if (str == null || str == "") 
            {
            if( validaURL(document.forms[0].elements["urlBaseFuncionarios"]) ) {
            innerHtmlMsgErros += formataErro("URL para consulta de funcionários deve ser iniciado com \"http://\"");
            }
            } 
            else 
            {
            innerHtmlMsgErros += str;
            }
            }
			
            // Validação de URL para link das imagens do topo
            if ( document.forms[0].linkImagemBanner.value != "" ) 
            {
            if ( validaURL(document.forms[0].elements["linkImagemBanner"]) ) {
            innerHtmlMsgErros += formataErro("Link para a imagem do banner do órgão deve ser iniciado com \"http://\"");
            }
            }
            if ( document.forms[0].linkImagemLogo.value != "" ) 
            {
            if ( validaURL(document.forms[0].elements["linkImagemLogo"]) ) {
            innerHtmlMsgErros += formataErro("Link para a imagem do logo do órgão deve ser iniciado com \"http://\"");
            }				
            } 
            if ( document.forms[0].linkImagem3.value != "" ) 
            {
            if ( validaURL(document.forms[0].elements["linkImagem3"]) ) {
            innerHtmlMsgErros += formataErro("Link para a imagem do canto superior a direita deve ser iniciado com \"http://\"");
            }				
            } 
            if ( document.forms[0].linkImagem4.value != "" ) 
            {
            if ( validaURL(document.forms[0].elements["linkImagem4"]) ) {
            innerHtmlMsgErros += formataErro("Link para a outra imagem para layout deve ser iniciado com \"http://\"");
            }				
            } 
            if ( document.forms[0].linkImagem5.value != "" ) 
            {
            if ( validaURL(document.forms[0].elements["linkImagem5"]) ) {
            innerHtmlMsgErros += formataErro("Link para a outra imagem para layout deve ser iniciado com \"http://\"");
            }				
            } 
			
            if ( document.forms[0].linkImagemBanner.value == "" ) 
            {
            innerHtmlMsgErros += formataErro("Link para a imagem do banner do órgão &eacute; um campo obrigatório.");
            } 

			
					

            innerHtmlMsgErros += CriticaString( document.forms[0].elements["remetenteEmail"]   , 1, 100, 'Remetente dos emails que serão enviados pela aplicação' );
			
            
            // Verifica meios de recebimento de resposta do órgão assinalados
            var meioEnvioResp = "";
            var meioEnvioRespSel = false;
            var meiosEnvioRespSelecionados = "";
            var cont = 0;

            <logic:iterate name="listaMeioEnvioRespostaTodos" id="meioEnvioResposta" type="br.gov.serpro.ouvidoria.model.MeioEnvioResposta">			
                meioEnvioResp    = document.forms[0].elements["meioEnvioResposta_" + cont].value;
                meioEnvioRespSel = document.forms[0].elements["meioEnvioResposta_" + cont].checked;
				
                if (meioEnvioRespSel == true) {
                meiosEnvioRespSelecionados = meiosEnvioRespSelecionados + meioEnvioResp + ",";
                }
		   
                cont++;	
            </logic:iterate>
		   
            document.forms[0].meiosEnvioResp.value = meiosEnvioRespSelecionados;			
            		   	   
			
            if(innerHtmlMsgErros=='')
            {
            abreConfirmacao("salvar");
            // document.forms[0].submit();
            }
            else
            {
            var texto = innerHtmlMsgErros;
            abreAlerta(texto);
            }

            document.forms[0].imgDetalhe.focus();
            }
	
            function onLoad() {
            gerenciaExibicao();			

            if (document.forms[0].id.value)
            document.getElementById("nomeDiretorioOrgao").disabled=true;			
			
            // Testando origem da chamada do JSP para
            // dimensionar margem
            if (window.parent.name == "conteudo") {
            document.body.style.marginTop   = "0px";
            document.body.style.marginLeft   = "0px";
            document.body.style.marginRight = "0px";
            document.body.style.marginBottom = "0px";
            } 

            textCounter( document.forms[0].textoApresentacaoOuvidoria,    document.getElementById( 'contador1' ), 700 );
            textCounter( document.forms[0].textoApresentacaoFormulario,   document.getElementById( 'contador2' ), 2000 );
            textCounter( document.forms[0].textoRespostaAcionamento,      document.getElementById( 'contador3' ), 2000 );
            textCounter( document.forms[0].textoConsultaRespostaNoPrazo,  document.getElementById( 'contador4' ), 2000 );
            textCounter( document.forms[0].textoConsultaRespostaSemPrazo, document.getElementById( 'contador5' ), 2000 );
            textCounter( document.forms[0].textoConsultaRespostaEmAtraso, document.getElementById( 'contador6' ), 2000 );
            textCounter( document.forms[0].textoApresentacaoResposta,     document.getElementById( 'contador7' ), 2000 );
            textCounter( document.forms[0].textoAvaliacaoResposta,        document.getElementById( 'contador8' ), 2000 );
            textCounter( document.forms[0].textoInformacaoOuvidoria,      document.getElementById( 'contador9' ), 2000 );
            textCounter( document.forms[0].textoCanaisComunicacao,        document.getElementById( 'contador10' ), 2000 );
            textCounter( document.forms[0].textoLegislacaoOuvidoria,      document.getElementById( 'contador11' ), 2000 );

            if (window.parent.name == "conteudo") {	
            setFocusById('cpo');		
            } else {			
            setFocusById('MsgInicial');		
            }
            }

            function exibeCampo(campoCheck, campoExibicao) {
            if (document.getElementById(campoCheck).checked)
            document.getElementById(campoExibicao).style.display="";
            else
            document.getElementById(campoExibicao).style.display="none";
            }

            function exibeBloqueioPeloCodigo() {
            exibeCampo("existeBloqueioProtocoloPeloCodigo", "bloqueioCodigoAcesso");
            }

            function exibeBloqueioPelaPergunta() {
            exibeCampo("existeBloqueioProtocoloPelaPergunta", "bloqueioPergunta");
            }

            function exibePossuiCodigoAcesso() {
            exibeCampo("possuiCodigoAcesso", "idExisteBloqueioProtocoloPeloCodigo");
            exibeCampo("possuiCodigoAcesso", "idExisteBloqueioProtocoloPelaPergunta");
			
            if (document.getElementById("possuiCodigoAcesso").checked){
            exibeCampo("existeBloqueioProtocoloPeloCodigo", "bloqueioCodigoAcesso");
            exibeCampo("existeBloqueioProtocoloPelaPergunta", "bloqueioPergunta");
            }
            else{
            exibeCampo("possuiCodigoAcesso", "bloqueioCodigoAcesso");
            exibeCampo("possuiCodigoAcesso", "bloqueioPergunta");
            }
            }

            function exibePermiteArquivoAnexo() {
            exibeCampo("permiteArquivoAnexoAcionamento", "labelTamanhoMaxArquivoAnexo");
            exibeCampo("permiteArquivoAnexoAcionamento", "idTamanhoMaxArquivoAnexo");
			
            if (document.getElementById("permiteArquivoAnexoAcionamento").checked)
            document.getElementById("idPermiteArquivoAnexoAcionamento").colSpan="2";
            else
            document.getElementById("idPermiteArquivoAnexoAcionamento").colSpan="4";
            }
            
            function exibeHoraEnvioNotificacao() {
	            exibeCampo("notificacaoEmail", "labelHoraEnvioNotificacao");
	            exibeCampo("notificacaoEmail", "idHoraEnvioNotificacao");
				
	            if (document.getElementById("notificacaoEmail").checked){
	            	document.getElementById("idNotificacaoEmail").colSpan="2";
		        }else{
		            document.getElementById("idNotificacaoEmail").colSpan="4";
    				document.getElementById("horaEnvioNotificacao").value="";	
    			}	
            }

            function exibePermiteMsgDigitalizada() {
		
            exibeCampo("permiteMsgDigitalizadaAcionamento", "labelTamanhoMaxArquivoCartaDigitalizada");
            exibeCampo("permiteMsgDigitalizadaAcionamento", "idTamanhoMaxArquivoCartaDigitalizada");
			
            if (document.getElementById("permiteMsgDigitalizadaAcionamento").checked)
            document.getElementById("idPermiteMsgDigitalizadaAcionamento").colSpan="2";
            else
            document.getElementById("idPermiteMsgDigitalizadaAcionamento").colSpan="4";
            }

            function gerenciaExibicao(){
            exibeBloqueioPeloCodigo();
            exibeBloqueioPelaPergunta();
            exibePossuiCodigoAcesso();
            exibePermiteArquivoAnexo();
            exibePermiteMsgDigitalizada();
            exibeHoraEnvioNotificacao();
            }
	
            function atualizaTextoImagemLogo(){
            var imagem = document.forms[0].imagemLogo.value;
            index = imagem.lastIndexOf("\\");
		
            var textoImagem = imagem.substring(index + 1,imagem.length);
		
            var texto = document.forms[0].diretorioContextoAplicacao.value;
            texto = texto + document.forms[0].nomeDiretorioOrgao.value;
            texto = texto + "/images/" + textoImagem;
			
            document.getElementById("textoImagemLogo").innerText = texto;
            }

            function atualizaTextoImagemBanner(){
            var imagem = document.forms[0].imagemBanner.value;
            index = imagem.lastIndexOf("\\");
		
            var textoImagem = imagem.substring(index + 1,imagem.length);
		
            var texto = document.forms[0].diretorioContextoAplicacao.value;
            texto = texto + document.forms[0].nomeDiretorioOrgao.value;
            texto = texto + "/images/" + textoImagem;
			
            document.getElementById("textoImagemBanner").innerText = texto;
            }

            function atualizaTextoImagem3(){
            var imagem = document.forms[0].imagem3.value;
            index = imagem.lastIndexOf("\\");
		
            var textoImagem = imagem.substring(index + 1,imagem.length);
		
            var texto = document.forms[0].diretorioContextoAplicacao.value;
            texto = texto + document.forms[0].nomeDiretorioOrgao.value;
            texto = texto + "/images/" + textoImagem;
			
            document.getElementById("textoImagem3").innerText = texto;
            }

            function atualizaTextoImagem4(){
            var imagem = document.forms[0].imagem4.value;
            index = imagem.lastIndexOf("\\");
		
            var textoImagem = imagem.substring(index + 1,imagem.length);
		
            var texto = document.forms[0].diretorioContextoAplicacao.value;
            texto = texto + document.forms[0].nomeDiretorioOrgao.value;
            texto = texto + "/images/" + textoImagem;
			
            document.getElementById("textoImagem4").innerText = texto;
            }

            function atualizaTextoImagem5(){
            var imagem = document.forms[0].imagem5.value;
            index = imagem.lastIndexOf("\\");
		
            var textoImagem = imagem.substring(index + 1,imagem.length);
		
            var texto = document.forms[0].diretorioContextoAplicacao.value;
            texto = texto + document.forms[0].nomeDiretorioOrgao.value;
            texto = texto + "/images/" + textoImagem;
			
            document.getElementById("textoImagem5").innerText = texto;
            }
		
            function validaURL( campo, mensagem ){				
            if (campo.value != null || campo.value != "") {			
            if ( campo.value.toLowerCase().substr(0, 4) != "http" ) 
            {	
            return true;
            } 
            }
            return false;			
            }
			
			function isHoraMinuto(pVal)
			{
				var reTipo = /^\d{2}:\d{2}$/; // Onde ... é a expressão regular apropriada
				
				if(!reTipo.test(pVal.value)){
					abreAlertaGeral("Alerta","Informe Hora de Envio de Notificação com o formato HH:MM");
					document.getElementById("textoImagem5").value="";
				}
			}
			
        </script>
    </head>
	
    <body onload="javascript:onLoad();"  >


        <div id="content">
		
		
            <html:form action="/AtualizarConfiguracoesOrgao" method="post" enctype="multipart/form-data">	  
                <input type="hidden" name="action" value="salvar">
                <input type="hidden" name="idOrgao" value="<bean:write name="orgao" property="id"/>">
                <input type="hidden" name="id" value="<bean:write name="configuracoes" property="id"/>">
                <input type="hidden" name="diretorioContextoAplicacao" value='<%= request.getAttribute("diretorioContextoAplicacao")%>'>

                <script type="text/javascript" charset='iso-8859-1'>
                    if (window.parent.name != 'conteudo') {
                    document.write('<h1 tabindex="1" id="MsgInicial" >Configurar Ouvidoria</h1>');
                    }
                </script>			
			
                <p style="text-align: left" id="cpo" tabindex="1"><font class="asterisco">*</font><font class="obrigatorio">campo com preenchimento obrigatório</font></p>
			
                <table border="0" width="100%" cellpadding="0" cellspacing="0">
                    <tr>
                        <td align="left">
                            <img accesskey="d" tabindex="2" name="imgDetalhe" id="imgDetalhe" src="../../<bean:write name="_LAYOUT_"  property="esquemaCores"/>/pasta_detalha.gif" alt="Configurações do Órgão Escolhido"><table cellpadding="2" cellspacing="1" border="0" align="center" width="100%">
                                <tr>
                                    <td colspan="1" class="tdHeader3" width="35%">
                                        <label tabindex="3">Órgão</label>
                                    </td>
                                    <td colspan="3" class="tdHeader4" width="65%"> 
                                        <label tabindex="4"><bean:write name="orgao" property="descricao"/></label>
                                    </td>
                                </tr>

                                <!-- ****************** Configurações de layout ****************** -->
                                <tr> 
                                    <th colspan="4" class="contentBold"><label tabindex="5"><b>Configurações de layout:</b></label></th>
                                </tr>

                                <tr>
                                    <td colspan="1" class="tdHeader3">
                                        <label for="esquemaCoresLayout">Diretório de esquema de cores&nbsp;<font class="asterisco">*</font></label>
                                    </td>
                                    <td colspan="3" class="tdHeader4">
                                        <html:select name="configuracoes" property="esquemaCoresLayout" tabindex="6" styleClass="text" styleId="esquemaCoresLayout">
                                            <html:option value="0">Selecione</html:option>
                                            <logic:present name="listaDiretoriosCores" scope="request">
                                                <html:options name="listaDiretoriosCores"/>
                                            </logic:present>
                                        </html:select>
                                    </td>
                                </tr>

                                <tr>
                                    <td colspan="1" class="tdHeader3">
                                        <label for="nomeExibicaoOrgao">Nome do órgão para exibição&nbsp;<font class="asterisco">*</font></label>
                                    </td>
                                    <td colspan="3" class="tdHeader4"> 
                                        <html:text styleId="nomeExibicaoOrgao" tabindex="7" size="50" maxlength="100" name="configuracoes" property="nomeExibicaoOrgao"/>
                                    </td>
                                </tr>

                                <tr>
                                    <td colspan="1" class="tdHeader3">
                                        <label for="imagemLogo">Imagem do logo do órgão</label>
                                    </td>
                                    <td colspan="3" class="tdHeader4"> 
                                        <html:file name="AtualizarConfiguracoesOrgaoForm" property="imagemLogo" styleId="imagemLogo" size="35" tabindex="8"
                                        onchange="atualizaTextoImagemLogo();" onkeypress="javascript: if(event.keyCode == 13) imagemLogo.click();"/>
                                        <br>
                                        <span id="textoImagemLogo">
                                            <logic:notEqual name="configuracoes" property="imagemLogo" value="">
                                                <label tabindex="9">
                                                    <%= request.getAttribute("diretorioContextoAplicacao")%><bean:write name="configuracoes" property="nomeDiretorioOrgao"/>/images/<bean:write name="configuracoes" property="imagemLogo"/>
                                                </label>
                                            </logic:notEqual>
                                        </span>
                                    </td>
                                </tr>
	  					
                                <tr>
                                    <td colspan="1" class="tdHeader3">
                                        <label for="descricaoImagemLogo">Descrição para a imagem do logo do órgão</label>
                                    </td>
                                    <td colspan="3" class="tdHeader4">
                                        <html:text styleId="descricaoImagemLogo" tabindex="10" size="50" maxlength="100" name="configuracoes" property="descricaoImagemLogo"/>
                                    </td>
                                </tr>
	  					
                                <tr>
                                    <td colspan="1" class="tdHeader3">
                                        <label for="linkImagemLogo">Link para a imagem do logo do órgão</label>
                                    </td>
                                    <td colspan="3" class="tdHeader4">
                                        <html:text styleId="linkImagemLogo" tabindex="11" size="50" maxlength="100" name="configuracoes" property="linkImagemLogo"/>
                                    </td>
                                </tr>
	  					
                                <tr>
                                    <td colspan="1" class="tdHeader3">
                                        <label for="corCabecalhoLogo">Cor referente à página do logo&nbsp;<font class="asterisco">*</font></label>
                                    </td>
                                    <td colspan="3" class="tdHeader4" valign="middle"> 
                                        <html:text styleId="corCabecalhoLogo" tabindex="12" size="25" maxlength="6" name="configuracoes" property="corCabecalhoLogo" 
                                        onblur="javascript:trocaCor(this, coresLogo);" />
                                        <input type="text" style="border:0 solid #FFFFFF; background-color:#<bean:write name="configuracoes" property="corCabecalhoLogo"/>" size="5" name="coresLogo" id="coresLogo"  value="" readonly>
                                    </td>
                                </tr>

                                <tr>
                                    <td colspan="1" class="tdHeader3">
                                        <label for="imagemBanner">Imagem do banner do órgão</label>
                                    </td>
                                    <td colspan="3" class="tdHeader4"> 
                                        <html:file name="AtualizarConfiguracoesOrgaoForm" property="imagemBanner" styleId="imagemBanner" size="35" tabindex="13"
                                        onchange="atualizaTextoImagemBanner();" onkeypress="javascript: if(event.keyCode == 13) imagemBanner.click();"/>
                                        <br>
                                        <span id="textoImagemBanner">
                                            <logic:notEqual name="configuracoes" property="imagemBanner" value="">
                                                <label tabindex="14">
                                                    <%= request.getAttribute("diretorioContextoAplicacao")%><bean:write name="configuracoes" property="nomeDiretorioOrgao"/>/images/<bean:write name="configuracoes" property="imagemBanner"/>
                                                </label>
                                            </logic:notEqual>
                                        </span>
                                    </td>
                                </tr>
	  					
                                <tr>
                                    <td colspan="1" class="tdHeader3">
                                        <label for="descricaoImagemBanner">Descrição para a imagem do banner do órgão</label>
                                    </td>
                                    <td colspan="3" class="tdHeader4">
                                        <html:text styleId="descricaoImagemBanner" tabindex="15" size="50" maxlength="100" name="configuracoes" property="descricaoImagemBanner"/>
                                    </td>
                                </tr>
	  					
                                <tr>
                                    <td colspan="1" class="tdHeader3">
                                        <label for="linkImagemBanner">
                                            Link para a imagem do banner do órgão<br>
                                            Este campo será usado como link para o botão Sair 
                                        </label>
                                    </td>
                                    <td colspan="3" class="tdHeader4">
                                        <html:text styleId="linkImagemBanner" tabindex="16" size="50" maxlength="100" name="configuracoes" property="linkImagemBanner"/>
                                    </td>
                                </tr>

                                <tr>
                                    <td colspan="1" class="tdHeader3">
                                        <label for="corCabecalhoBanner">Cor referente a página do banner&nbsp;<font class="asterisco">*</font></label>
                                    </td>
                                    <td colspan="3" class="tdHeader4"> 
                                        <html:text styleId="corCabecalhoBanner" tabindex="17" size="25" maxlength="6" name="configuracoes" property="corCabecalhoBanner"
                                        onblur="javascript:trocaCor(this, coresBanner);"/>
                                        <input type="text" style="border:0 solid #FFFFFF; background-color:#<bean:write name="configuracoes" property="corCabecalhoBanner"/>" size="5" name="coresBanner" id="coresBanner"  value="" readonly>
                                    </td>
                                </tr>

                                <tr>
                                    <td colspan="1" class="tdHeader3">
                                        <label for="imagem3">Imagem do canto superior a direita</label>
                                    </td>
                                    <td colspan="3" class="tdHeader4"> 
                                        <html:file name="AtualizarConfiguracoesOrgaoForm" property="imagem3" styleId="imagem3" size="35" tabindex="18"
                                        onchange="atualizaTextoImagem3();" onkeypress="javascript: if(event.keyCode == 13) imagem3.click();"/>
                                        <br>
                                        <span id="textoImagem3">
                                            <logic:notEqual name="configuracoes" property="imagem3" value="">
                                                <label tabindex="19">
                                                    <%= request.getAttribute("diretorioContextoAplicacao")%><bean:write name="configuracoes" property="nomeDiretorioOrgao"/>/images/<bean:write name="configuracoes" property="imagem3"/>
                                                </label>
                                            </logic:notEqual>
                                        </span>
                                    </td>
                                </tr>
	  					
                                <tr>
                                    <td colspan="1" class="tdHeader3">
                                        <label for="descricaoImagem3">Descrição para a imagem do canto superior a direita</label>
                                    </td>
                                    <td colspan="3" class="tdHeader4">
                                        <html:text styleId="descricaoImagem3" tabindex="20" size="50" maxlength="100" name="configuracoes" property="descricaoImagem3"/>
                                    </td>
                                </tr>	
	  					
                                <tr>
                                    <td colspan="1" class="tdHeader3">
                                        <label for="linkImagem3">Link para a imagem do canto superior a direita</label>
                                    </td>
                                    <td colspan="3" class="tdHeader4">
                                        <html:text styleId="linkImagem3" tabindex="21" size="50" maxlength="100" name="configuracoes" property="linkImagem3"/>
                                    </td>
                                </tr>	  					

                                <tr>
                                    <td colspan="1" class="tdHeader3">
                                        <label for="imagem4">Outra imagem para layout</label>
                                    </td>
                                    <td colspan="3" class="tdHeader4"> 
                                        <html:file name="AtualizarConfiguracoesOrgaoForm" property="imagem4" styleId="imagem4" size="35" tabindex="22"
                                        onchange="atualizaTextoImagem4();" onkeypress="javascript: if(event.keyCode == 13) imagem4.click();"/>
                                        <br>
                                        <span id="textoImagem4">
                                            <logic:notEqual name="configuracoes" property="imagem4" value="">
                                                <label tabindex="23">
                                                    <%= request.getAttribute("diretorioContextoAplicacao")%><bean:write name="configuracoes" property="nomeDiretorioOrgao"/>/images/<bean:write name="configuracoes" property="imagem4"/>
                                                </label>
                                            </logic:notEqual>
                                        </span>
                                    </td>
                                </tr>
	  					
                                <tr>
                                    <td colspan="1" class="tdHeader3">
                                        <label for="descricaoImagem4">Descrição para a outra imagem para layout</label>
                                    </td>
                                    <td colspan="3" class="tdHeader4">
                                        <html:text styleId="descricaoImagem4" tabindex="24" size="50" maxlength="100" name="configuracoes" property="descricaoImagem4"/>
                                    </td>
                                </tr>
	  					
                                <tr>
                                    <td colspan="1" class="tdHeader3">
                                        <label for="linkImagem4">Link para a outra imagem para layout</label>
                                    </td>
                                    <td colspan="3" class="tdHeader4">
                                        <html:text styleId="linkImagem4" tabindex="25" size="50" maxlength="100" name="configuracoes" property="linkImagem4"/>
                                    </td>
                                </tr>

                                <tr>
                                    <td colspan="1" class="tdHeader3">
                                        <label for="imagem5">Outra imagem para layout</label>
                                    </td>
                                    <td colspan="3" class="tdHeader4"> 
                                        <html:file name="AtualizarConfiguracoesOrgaoForm" property="imagem5" styleId="imagem5" size="35" tabindex="26"
                                        onchange="atualizaTextoImagem5();" onkeypress="javascript: if(event.keyCode == 13) imagem5.click();"/>
                                        <br>
                                        <span id="textoImagem5">
                                            <logic:notEqual name="configuracoes" property="imagem5" value="">
                                                <label tabindex="27">
                                                    <%= request.getAttribute("diretorioContextoAplicacao")%><bean:write name="configuracoes" property="nomeDiretorioOrgao"/>/images/<bean:write name="configuracoes" property="imagem5"/>
                                                </label>
                                            </logic:notEqual>
                                        </span>
                                    </td>
                                </tr>
	  					
                                <tr>
                                    <td colspan="1" class="tdHeader3">
                                        <label for="descricaoImagem5">Descrição para a outra imagem para layout</label>
                                    </td>
                                    <td colspan="3" class="tdHeader4">
                                        <html:text styleId="descricaoImagem5" tabindex="28" size="50" maxlength="100" name="configuracoes" property="descricaoImagem5"/>
                                    </td>
                                </tr>
	  					
                                <tr>
                                    <td colspan="1" class="tdHeader3">
                                        <label for="linkImagem5">Link para a outra imagem para layout</label>
                                    </td>
                                    <td colspan="3" class="tdHeader4">
                                        <html:text styleId="linkImagem5" tabindex="29" size="50" maxlength="100" name="configuracoes" property="linkImagem5"/>
                                    </td>
                                </tr>

                                <!-- ****************** Textos configuráveis ****************** -->
                                <tr> 
                                    <th colspan="4" class="contentBold"><label tabindex="30"><b>Textos configuráveis:</b></label></th>
                                </tr>

                                <tr>
                                    <td colspan="1" class="tdHeader3">
                                        <label for="textoApresentacaoOuvidoria">Texto de apresentação da ouvidoria&nbsp;<font class="asterisco">*</font></label>
                                    </td>
                                    <td colspan="3" class="tdHeader4"> 
                                        <html:textarea styleId="textoApresentacaoOuvidoria" tabindex="31" name="configuracoes" property="textoApresentacaoOuvidoria" cols="55" rows="5" onkeyup="textCounter( this, document.getElementById( 'contador1' ), 700 );"/>
                                        <div id="contador1">700 caracteres restantes</div>
                                    </td>
                                </tr>

                                <tr>
                                    <td colspan="1" class="tdHeader3">
                                        <label for="textoApresentacaoFormulario">Texto de apresentação do acionamento&nbsp;<font class="asterisco">*</font></label>
                                    </td>
                                    <td colspan="3" class="tdHeader4"> 
                                        <html:textarea styleId="textoApresentacaoFormulario" tabindex="32" name="configuracoes" property="textoApresentacaoFormulario" cols="55" rows="5" onkeyup="textCounter( this, document.getElementById( 'contador2' ), 2000 );"/>
                                        <div id="contador2">2000 caracteres restantes</div>
                                    </td>
                                </tr>

                                <tr>
                                    <td colspan="1" class="tdHeader3">
                                        <label for="textoRespostaAcionamento">Texto de resposta no momento do acionamento&nbsp;<font class="asterisco">*</font></label>
                                    </td>
                                    <td colspan="3" class="tdHeader4"> 
                                        <html:textarea styleId="textoRespostaAcionamento" tabindex="33" name="configuracoes" property="textoRespostaAcionamento" cols="55" rows="5" onkeyup="textCounter( this, document.getElementById( 'contador3' ), 2000 );"/>
                                        <div id="contador3">2000 caracteres restantes</div>
                                    </td>
                                </tr>

                                <tr>
                                    <td colspan="1" class="tdHeader3">
                                        <label for="textoConsultaRespostaNoPrazo">Texto consulta de resposta no prazo&nbsp;<font class="asterisco">*</font></label>
                                    </td>
                                    <td colspan="3" class="tdHeader4"> 
                                        <html:textarea styleId="textoConsultaRespostaNoPrazo" tabindex="34" name="configuracoes" property="textoConsultaRespostaNoPrazo" cols="55" rows="5"
                                        onkeyup="textCounter( this, document.getElementById( 'contador4' ), 2000 );"/>
                                        <div id="contador4">2000 caracteres restantes</div>
                                    </td>
                                </tr>

                                <tr>
                                    <td colspan="1" class="tdHeader3">
                                        <label for="textoConsultaRespostaSemPrazo">Texto consulta de resposta sem prazo&nbsp;<font class="asterisco">*</font></label>
                                    </td>
                                    <td colspan="3" class="tdHeader4"> 
                                        <html:textarea styleId="textoConsultaRespostaSemPrazo" tabindex="35" name="configuracoes" property="textoConsultaRespostaSemPrazo" cols="55" rows="5"
                                        onkeyup="textCounter( this, document.getElementById( 'contador5' ), 2000 );"/>
                                        <div id="contador5">2000 caracteres restantes</div>
                                    </td>
                                </tr>

                                <tr>
                                    <td colspan="1" class="tdHeader3">
                                        <label for="textoConsultaRespostaEmAtraso">Texto consulta de resposta em atraso&nbsp;<font class="asterisco">*</font></label>
                                    </td>
                                    <td colspan="3" class="tdHeader4"> 
                                        <html:textarea styleId="textoConsultaRespostaEmAtraso" tabindex="36" name="configuracoes" property="textoConsultaRespostaEmAtraso" cols="55" rows="5"
                                        onkeyup="textCounter( this, document.getElementById( 'contador6' ), 2000 );"/>
                                        <div id="contador6">2000 caracteres restantes</div>
                                    </td>
                                </tr>

                                <tr>
                                    <td colspan="1" class="tdHeader3">
                                        <label for="textoApresentacaoResposta">Texto apresentação da resposta&nbsp;<font class="asterisco">*</font></label>
                                    </td>
                                    <td colspan="3" class="tdHeader4"> 
                                        <html:textarea styleId="textoApresentacaoResposta" tabindex="37" name="configuracoes" property="textoApresentacaoResposta" cols="55" rows="5"
                                        onkeyup="textCounter( this, document.getElementById( 'contador7' ), 2000 );"/>
                                        <div id="contador7">2000 caracteres restantes</div>
                                    </td>
                                </tr>

                                <tr>
                                    <td colspan="1" class="tdHeader3">
                                        <label for="textoAvaliacaoResposta">Texto de avaliação da resposta&nbsp;<font class="asterisco">*</font></label>
                                    </td>
                                    <td colspan="3" class="tdHeader4"> 
                                        <html:textarea styleId="textoAvaliacaoResposta" tabindex="38" name="configuracoes" property="textoAvaliacaoResposta" cols="55" rows="5"
                                        onkeyup="textCounter( this, document.getElementById( 'contador8' ), 2000 );"/>
                                        <div id="contador8">2000 caracteres restantes</div>
                                    </td>
                                </tr>

                                <tr>
                                    <td colspan="1" class="tdHeader3">
                                        <label for="textoInformacaoOuvidoria">Texto com informações sobre a ouvidoria&nbsp;<font class="asterisco">*</font></label>
                                    </td>
                                    <td colspan="3" class="tdHeader4"> 
                                        <html:textarea styleId="textoInformacaoOuvidoria" tabindex="39" name="configuracoes" property="textoInformacaoOuvidoria" cols="55" rows="5"
                                        onkeyup="textCounter( this, document.getElementById( 'contador9' ), 2000 );"/>
                                        <div id="contador9">2000 caracteres restantes</div>
                                    </td>
                                </tr>

                                <tr>
                                    <td colspan="1" class="tdHeader3">
                                        <label for="textoCanaisComunicacao">Texto referente a outros canais de comunicação&nbsp;<font class="asterisco">*</font></label>
                                    </td>
                                    <td colspan="3" class="tdHeader4"> 
                                        <html:textarea styleId="textoCanaisComunicacao" tabindex="40" name="configuracoes" property="textoCanaisComunicacao" cols="55" rows="5"
                                        onkeyup="textCounter( this, document.getElementById( 'contador10' ), 2000 );"/>
                                        <div id="contador10">2000 caracteres restantes</div>
                                    </td>
                                </tr>

                                <tr>
                                    <td colspan="1" class="tdHeader3">
                                        <label for="textoLegislacaoOuvidoria">Texto referente a legislação do órgão&nbsp;<font class="asterisco">*</font></label>
                                    </td>
                                    <td colspan="3" class="tdHeader4"> 
                                        <html:textarea styleId="textoLegislacaoOuvidoria" tabindex="41" name="configuracoes" property="textoLegislacaoOuvidoria" cols="55" rows="5"
                                        onkeyup="textCounter( this, document.getElementById( 'contador11' ), 2000 );"/>
                                        <div id="contador11">2000 caracteres restantes</div>
                                    </td>
                                </tr>
                                
                                <tr>
                                    <td colspan="1" class="tdHeader3">
                                        <label for="textoNotificacaoPendencia">Texto referente a Notificação de Mensagens com Resposta pendente&nbsp;<font class="asterisco">*</font></label>
                                    </td>
                                    <td colspan="3" class="tdHeader4"> 
                                        <html:textarea styleId="textoNotificacaoPendencia" tabindex="41" name="configuracoes" property="textoNotificacaoPendencia" cols="55" rows="5"
                                        onkeyup="textCounter( this, document.getElementById( 'contador11' ), 2000 );"/>
                                        <div id="contador11">2000 caracteres restantes</div>
                                    </td>
                                </tr>
								
								<tr>
                                    <td colspan="1" class="tdHeader3">
                                        <label for="textoNotificacaoAtraso">Texto referente a Notificação de Mensagens com Resposta em atraso&nbsp;<font class="asterisco">*</font></label>
                                    </td>
                                    <td colspan="3" class="tdHeader4"> 
                                        <html:textarea styleId="textoNotificacaoAtraso" tabindex="41" name="configuracoes" property="textoNotificacaoAtraso" cols="55" rows="5"
                                        onkeyup="textCounter( this, document.getElementById( 'contador11' ), 2000 );"/>
                                        <div id="contador11">2000 caracteres restantes</div>
                                    </td>
                                </tr>
                                
                                <tr>
                                    <td colspan="1" class="tdHeader3">
                                        <label for="textoNotificacaoAtrasoCritico">Texto referente a Notificação de Mensagens com Resposta em atraso crítico&nbsp;<font class="asterisco">*</font></label>
                                    </td>
                                    <td colspan="3" class="tdHeader4"> 
                                        <html:textarea styleId="textoNotificacaoAtrasoCritico" tabindex="41" name="configuracoes" property="textoNotificacaoAtrasoCritico" cols="55" rows="5"
                                        onkeyup="textCounter( this, document.getElementById( 'contador11' ), 2000 );"/>
                                        <div id="contador11">2000 caracteres restantes</div>
                                    </td>
                                </tr>
									
                                <!-- ****************** Parâmetros de Configuração ****************** -->
                                <tr> 
                                    <th colspan="4" class="contentBold"><label tabindex="42"><b>Parâmetros de Configuração:</b></label></th>
                                </tr>
								<tr>
                                    <td id="idNotificacaoEmail" colspan="2" class="tdHeader3">
                                        <label for="notificacaoEmail">
                                            <html:checkbox name="configuracoes" property="notificacaoEmail" tabindex="43" styleId="notificacaoEmail" value="S"
                                            onclick="exibeHoraEnvioNotificacao();"
                                            onkeypress="exibeHoraEnvioNotificacao();"/>
                                            Notificar aos responsáveis por acionamento sem resposta
                                        </label>
                                    </td>
                                    <td id="labelHoraEnvioNotificacao" class="tdHeader3" width="35%">
                                        <label for="horaEnvioNotificacao">Hora/Minuto do Envio de Notificação (HH:MM)&nbsp;</label>
                                    </td>
                                    <td id="idHoraEnvioNotificacao" class="tdHeader4" width="15%"> 
                                        <html:text styleId="horaEnvioNotificacao"  tabindex="44" size="12" maxlength="7" name="configuracoes" property="horaEnvioNotificacao" onblur="isHoraMinuto(this);"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td id="idPermiteArquivoAnexoAcionamento" colspan="2" class="tdHeader3">
                                        <label for="permiteArquivoAnexoAcionamento">
                                            <html:checkbox name="configuracoes" property="permiteArquivoAnexoAcionamento" tabindex="45" styleId="permiteArquivoAnexoAcionamento"
                                            onclick="exibePermiteArquivoAnexo();"
                                            onkeypress="exibePermiteArquivoAnexo();"/>
                                            Órgão permite anexar arquivo ao acionamento
                                        </label>
                                    </td>
                                    <td id="labelTamanhoMaxArquivoAnexo" class="tdHeader3" width="35%">
                                        <label for="tamanhoMaxArquivoAnexo">Tamanho máximo para arquivos anexos (em KB)&nbsp;<font class="asterisco">*</font></label>
                                    </td>
                                    <td id="idTamanhoMaxArquivoAnexo" class="tdHeader4" width="15%"> 
                                        <html:text styleId="tamanhoMaxArquivoAnexo" value="2000" readonly="true" tabindex="46" size="12" maxlength="7" name="configuracoes" property="tamanhoMaxArquivoAnexo"/>
                                    </td>
                                </tr>

                                <tr>
                                    <td id="idPermiteMsgDigitalizadaAcionamento" colspan="2" class="tdHeader3">
                                        <label for="permiteMsgDigitalizadaAcionamento">
                                            <html:checkbox name="configuracoes" property="permiteMsgDigitalizadaAcionamento" tabindex="47" styleId="permiteMsgDigitalizadaAcionamento"
                                            onclick="exibePermiteMsgDigitalizada();"
                                            onkeypress="exibePermiteMsgDigitalizada();"/>
                                            Órgão permite mensagem digitalizada no acionamento
                                        </label>
                                    </td>
                                    <td id="labelTamanhoMaxArquivoCartaDigitalizada" class="tdHeader3" width="35%">
                                        <label for="tamanhoMaxArquivoCartaDigitalizada">Tamanho máximo para carta digitalizada (em KB)&nbsp;<font class="asterisco">*</font></label>
                                    </td>
                                    <td id="idTamanhoMaxArquivoCartaDigitalizada" class="tdHeader4" width="15%"> 
                                        <html:text styleId="tamanhoMaxArquivoCartaDigitalizada" tabindex="48" size="12" value="2000" readonly="true" maxlength="7" name="configuracoes" property="tamanhoMaxArquivoCartaDigitalizada"/>
                                    </td>
                                </tr>

                                <tr>
                                    <td colspan="4" class="tdHeader3">
                                        <label for="possuiCodigoAcesso">
                                            <html:checkbox name="configuracoes" property="possuiCodigoAcesso" tabindex="49" styleId="possuiCodigoAcesso"
                                            onclick="exibePossuiCodigoAcesso();"
                                            onkeypress="exibePossuiCodigoAcesso();"/>
                                            Órgão possui código de acesso
                                        </label>
                                    </td>
                                </tr>

                                <tr id="idExisteBloqueioProtocoloPeloCodigo">
                                    <td colspan="4" class="tdHeader3">
                                        <label for="existeBloqueioProtocoloPeloCodigo">
                                            <html:checkbox name="configuracoes" property="existeBloqueioProtocoloPeloCodigo" tabindex="50" styleId="existeBloqueioProtocoloPeloCodigo"
                                            onclick="exibeBloqueioPeloCodigo();"
                                            onkeypress="exibeBloqueioPeloCodigo();"/>
                                            Existe bloqueio por falhas na digitação do código de acesso
                                        </label>
                                    </td>
                                </tr>
					     
                                <tr id="bloqueioCodigoAcesso">
                                    <td class="tdHeader3" width="35%">
                                        <label for="qtdeTentativasPossiveisCodigoAcesso">N&uacute;mero máximo de falhas no código de acesso&nbsp;<font class="asterisco">*</font></label>
                                    </td>
                                    <td class="tdHeader4" width="15%"> 
                                        <html:text styleId="qtdeTentativasPossiveisCodigoAcesso" tabindex="51" size="12" maxlength="7" name="configuracoes" property="qtdeTentativasPossiveisCodigoAcesso"/>
                                    </td>
                                    <td class="tdHeader3" width="35%">
                                        <label for="tempoBloqueioProtocoloPeloCodigo">Tempo de bloqueio pelo código de acesso (em minutos)&nbsp;<font class="asterisco">*</font></label>
                                    </td>
                                    <td class="tdHeader4" width="15%"> 
                                        <html:text styleId="tempoBloqueioProtocoloPeloCodigo" tabindex="52" size="12" maxlength="7" name="configuracoes" property="tempoBloqueioProtocoloPeloCodigo"/>
                                    </td>
                                </tr>

                                <tr id="idExisteBloqueioProtocoloPelaPergunta">
                                    <td colspan="4" class="tdHeader3">
                                        <label for="existeBloqueioProtocoloPelaPergunta">
                                            <html:checkbox name="configuracoes" property="existeBloqueioProtocoloPelaPergunta" tabindex="53" styleId="existeBloqueioProtocoloPelaPergunta"
                                            onclick="exibeBloqueioPelaPergunta();"
                                            onkeypress="exibeBloqueioPelaPergunta();"/>
                                            Existe bloqueio por falhas na digitação da pergunta para recuperação do código de acesso
                                        </label>
                                    </td>
                                </tr>
	    				
                                <tr id="bloqueioPergunta">
                                    <td class="tdHeader3" width="35%">
                                        <label for="qtdeTentativasPossiveisPergunta">N&uacute;mero máximo de falhas na pergunta&nbsp;<font class="asterisco">*</font></label>
                                    </td>
                                    <td class="tdHeader4" width="15%"> 
                                        <html:text styleId="qtdeTentativasPossiveisPergunta" tabindex="54" size="12" maxlength="15" name="configuracoes" property="qtdeTentativasPossiveisPergunta"/>
                                    </td>
                                    <td class="tdHeader3" width="35%">
                                        <label for="tempoBloqueioProtocoloPelaPergunta">Tempo de bloqueio pela pergunta (em minutos)&nbsp;<font class="asterisco">*</font></label>
                                    </td>
                                    <td class="tdHeader4" width="15%"> 
                                        <html:text styleId="tempoBloqueioProtocoloPelaPergunta" tabindex="55" size="12" maxlength="15" name="configuracoes" property="tempoBloqueioProtocoloPelaPergunta"/>
                                    </td>
                                </tr>

                                <tr>
                                    <td colspan="4" class="tdHeader3">
                                        <label for="atendenteConsultaMsgNoAtendimento">
                                            <html:checkbox name="configuracoes" property="atendenteConsultaMsgNoAtendimento" tabindex="56" styleId="atendenteConsultaMsgNoAtendimento"/>
                                            Atendente pode consultar mensagens durante o atendimento
                                        </label>
                                    </td>
                                </tr>
	    				
                                <tr>
                                    <td colspan="4" class="tdHeader3">
                                        <label for="exigeCertificadoDigitalGeral">
                                            <html:checkbox name="configuracoes" property="exigeCertificadoDigitalGeral" tabindex="57" styleId="exigeCertificadoDigitalGeral"/>
                                            &eacute; exigido certificado digital para acesso ao órgão e a todos os sub-órgãos
                                        </label>
                                    </td>
                                </tr>
	    				
                                <tr>
                                    <td colspan="4" class="tdHeader3">
                                        <label for="exigeCertificadoDigitalOrgao">
                                            <html:checkbox name="configuracoes" property="exigeCertificadoDigitalOrgao" tabindex="58" styleId="exigeCertificadoDigitalOrgao"/>
                                            &eacute; exigido certificado digital para acesso ao órgão e opcional para todos os sub-órgãos
                                        </label>
                                    </td>
                                </tr>
	    				
                                <tr>
                                    <td colspan="1" class="tdHeader3">
                                        <label for="nomeDiretorioOrgao">Nome do diretório do órgão</label>
                                    </td>
                                    <td colspan="3" class="tdHeader4"> 
                                        <html:text styleId="nomeDiretorioOrgao" tabindex="59" size="50" maxlength="50" name="configuracoes" property="nomeDiretorioOrgao"/>
                                    </td>
                                </tr>

                                <tr>
                                    <td colspan="1" class="tdHeader3">
                                        <label for="urlBaseFuncionarios">URL para consulta de funcionários</label>
                                    </td>
                                    <td colspan="3" class="tdHeader4"> 
                                        <html:text styleId="urlBaseFuncionarios" tabindex="60" size="50" maxlength="256" name="configuracoes" property="urlBaseFuncionarios"/>
                                    </td>
                                </tr>

                                <tr>
                                    <td colspan="1" class="tdHeader3">
                                        <label for="urlSuporteUsuario">URL de suporte ao usuário&nbsp;<font class="asterisco">*</font></label>
                                    </td>
                                    <td colspan="3" class="tdHeader4"> 
                                        <html:text styleId="urlSuporteUsuario" tabindex="61" size="50" maxlength="256" name="configuracoes" property="urlSuporteUsuario"/>
                                    </td>
                                </tr>

                                <tr>
                                    <td colspan="1" class="tdHeader3">
                                        <label for="remetenteEmail">Remetente dos emails que serão enviados pela aplicação&nbsp;<font class="asterisco">*</font></label>
                                    </td>
                                    <td colspan="3" class="tdHeader4"> 
                                        <html:text styleId="remetenteEmail" tabindex="62" size="50" maxlength="50" name="configuracoes" property="remetenteEmail"/>
                                    </td>
                                </tr>

                                <tr> 
                                    <th colspan="4" class="contentBold"><label tabindex="63"><b>Tipos de acionador permitidos para o órgão:</b></label></th>
                                </tr>
						
                                <tr>
                                    <td colspan="4" class="tdHeader3">								
                                        <input tabindex="64" type="checkbox" id="ta_1" name="tipoAcionador" value="1">&nbsp;Anônimo</input>
                                        <input tabindex="65" type="checkbox" id="ta_2" name="tipoAcionador" value="2">&nbsp;Pessoa Física</input>
                                        <input tabindex="66" type="checkbox" id="ta_3" name="tipoAcionador" value="3">&nbsp;Pessoa Jurídica</input>
                                        <input tabindex="67" type="checkbox" id="ta_4" name="tipoAcionador" value="4">&nbsp;Funcionário</input>
                                    </td>
                                </tr>
                                <script type="text/javascript">
                                    <% 
                                        Collection ltao = orgao.getListaTipoAcionadorOrgao();
                                        if (ltao != null) {
                                            for (Iterator iter = ltao.iterator(); iter.hasNext(); ) {
                                                br.gov.serpro.ouvidoria.model.TipoAcionadorOrgao tao = (br.gov.serpro.ouvidoria.model.TipoAcionadorOrgao) iter.next();
                                                if (tao.getDataVigencia() == null) {
                                    %>
                                    document.getElementById('<%= "ta_".concat(tao.getTipoAcionador().getId().toString()) %>').checked = "true";
                                    <%
                                        }
                                        }
                                        }
                                    %> 
                                </script>

                                <tr> 
                                    <th colspan="4" class="contentBold"><label tabindex="68"><b>Meios de envio de resposta permitidos para o órgão:</b></label></th>
                                </tr>

                                <%  
                                    // Variáveis para controle do tabindex
                                    int cont = 68;
                                    int nome = 0;
                                    String index = "68";
                                    String checked = "";
                                %> 
                                <tr>
                                    <td colspan="4" class="tdHeader3">								
                                        <logic:iterate name="listaMeioEnvioRespostaTodos" id="meioEnvioResposta" type="br.gov.serpro.ouvidoria.model.MeioEnvioResposta">									
                                            <% checked = ""; 												  
                                                
                                                Collection lstMeioEnvioRepOrgao = orgao.getListaMeioEnvioRespostaOrgao();


                                                // Varre os meios de envio de resposta do órgão
                                                for (Iterator it = lstMeioEnvioRepOrgao.iterator(); it.hasNext(); ) {
                                                    MeioEnvioRespostaOrgao meioEnvioRespOrg = (MeioEnvioRespostaOrgao) it.next();

                                                    if ( ( meioEnvioRespOrg.getMeioEnvioResposta().getId().longValue() == meioEnvioResposta.getId().longValue() )  &&
                                                            (meioEnvioRespOrg.getDataVigencia() == null) ) {
                                                        checked = "checked";
                                                        break;
                                                    }
                                                }
                                            %>										
	
                                            <label for="meioEnvioResposta_<%=nome%>">
                                                <input type="checkbox" tabindex="<%=index%>" name="meioEnvioResposta_<%=nome%>" id="meioEnvioResposta_<%=nome%>" <%= checked %> value="<%=meioEnvioResposta.getId()%>">
                                                <bean:write name="meioEnvioResposta" property="descricao"/>
                                            </label>
	
                                            <%  
                                                cont++;
                                                nome++;
                                                index = cont + "";
                                            %> 

                                        </logic:iterate>

                                    </td>
	    					
                                </tr>

                                <!-- ****************** Botões ****************** -->
                                <tr> 
                                    <td class="tdHeader3" colspan="4">
                                        <div align="center"> 
                                            <logic:equal name="configuracoes" property="id" value="">
                                                <input type="button" tabindex="<%=index%>" name="botao" value="Salvar" class="button" onClick="validaCampos();"/>
                                            </logic:equal>
                                            <logic:notEqual name="configuracoes" property="id" value="">
                                                <input type="button" tabindex="<%=index%>" name="botao" value="Alterar" class="button" onClick="validaCampos();"/>
                                            </logic:notEqual>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr> 
                    <input type="hidden" name="meiosEnvioResp" >
                </table>
            </html:form>
            <script type="text/javascript" charset='iso-8859-1'>
                if (window.parent.name != null && window.parent.name != "" ) 
                window.parent.document.getElementById("detalhe").style.height = this.document.body.scrollHeight;
            </script>
        </div>
    </body>
</html>
