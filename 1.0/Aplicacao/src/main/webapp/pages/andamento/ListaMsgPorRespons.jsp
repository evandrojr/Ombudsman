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
   -- Módulo:       Andamento
   -- 
   -- Descrição:    Lista as mensagens sob responsabilidade do Especialista/Ouvidor
   -- 
   -- Tabelas:      Acionamento, Mensagem, TipoMensagem
   -- 
   -- Versão:       1.0
   -- Data:         15/12/2004   
  */
--%>

<%@ taglib uri="/tags/struts-logic" prefix="logic" %>
<%@ taglib uri="/tags/struts-bean" prefix="bean"%>
<%@ taglib uri="/tags/struts-html" prefix="html"%>

<%-- Paginação --%>
<%@ taglib uri="/tags/displaytag"  prefix="display" %>

<html:html lang="pt">


    <script language="JavaScript">
	
        // Seta o foco ao carregar a tela
        function setaFocoOnLoad(){
    	    window.parent.document.getElementById("listaMsgPorRespons").style.height = this.document.body.scrollHeight;
        	document.getElementById("imgLista").focus();
        }
	
        // Recarrega a tela, reordenando a consulta
        function reOrdena(pOrdem) {
		
        var parametros = "?chkpend=" + document.forms[0].chkpend.value +
							 "&chkand=" + document.forms[0].chkand.value +
							 "&chkatraso=" + document.forms[0].chkatraso.value +
							 "&chkcritico=" + document.forms[0].chkcritico.value +
							 "&txtDatIni=" + document.forms[0].txtDatIni.value +
							 "&txtDatFim=" + document.forms[0].txtDatFim.value +
							 "&txtTipoMsg=" + document.forms[0].txtTipoMsg.value +
							 "&txtAssunto=" + document.forms[0].txtAssunto.value +
							 "&txtTitulo=" + document.forms[0].txtTitulo.value +
							 "&ordenacao=" + pOrdem;
		
        window.location="ListaMsgPorRespons.do" + parametros;
        }
	
        // Reabre a consulta. Função a ser chamada após voltar da tela de exibição da mensagem
        function reabrir() {
        	window.location = location.href;
        }
	
		function disparaAcao() {
			var baseHref = location.protocol + "//" + location.host + location.pathname;
			document.forms[0].method="post"
			document.forms[0].action=baseHref + "../../../andamento/ExibeMsgPorRespons.do"
			document.forms[0].submit();
		}
    </script>
	
    <head>
        <html:base />
        <title>
            Resultado da Busca por Mensagens
        </title>

        <script	src="../js/paginacao.js"></script>

    </head>
	
    <link rel='stylesheet'  media='all' href='../<bean:write name="_LAYOUT_" property="esquemaCores"/>/estilo_conteudo.css' type='text/css'>
    <link rel='stylesheet' type='text/css' media='print' href='../estilo_print.css'>

    <body onload="javascript:setaFocoOnLoad();" style="margin: 0px 0px;">
        <p tabindex="20" Align="LEFT">
            Clique nos nomes das colunas para ordenação da listagem.
        </p>
		<form target="_parent" name="frm">
        <table border="0" width="100%" cellpadding="0" cellspacing="0">
            <tr>
                <td><a href="javascript:void(0);" id="imgLista" alt="Lista de Mensagens"><img accesskey="l"
                src="../<bean:write name="_LAYOUT_" property="esquemaCores"/>/pasta_lista.gif"></a></td>
            </tr>

            <logic:present name="lstMsgs">
                <tr>
                    <td>

                        <% int cont = 0; %>
                        
                        <display:table	cellpadding="2" cellspacing="1" style="width: 100%"
                            name="lstMsgs" id="acionamento" pagesize="20"
                            requestURI="../../andamento/ListaMsgPorRespons.do">
                            <display:setProperty name="paging.banner.placement">bottom</display:setProperty>
	                        <display:setProperty name="paging.banner.no_items_found"><span>&nbsp;</span></display:setProperty>
	                        <display:setProperty name="paging.banner.one_item_found"><span>&nbsp;</span></display:setProperty>
	                        <display:setProperty name="paging.banner.all_items_found"><span>&nbsp;</span></display:setProperty>
	                        <display:setProperty name="paging.banner.some_items_found"><span>&nbsp;</span></display:setProperty>
	                        <display:setProperty name="paging.banner.onepage"><span>&nbsp;</span></display:setProperty>
	                        <display:setProperty name="paging.banner.full"><span> [<a href="{1}"> Primeira </a>/ <a href="{2}"> Anterior </a>] {0} [ <a href="{3}"> Pr&oacute;xima </a>/ <a href="{4}"> &Uacute;ltima </a>]</span></display:setProperty>
	                        <display:setProperty name="paging.banner.first"><span> [<a href="{1}"> Primeira </a>/ <a href="{2}"> Anterior </a>] {0} [ <a href="{3}"> Pr&oacute;xima </a>/ <a href="{4}"> &Uacute;ltima </a>]</span></display:setProperty>
	                        <display:setProperty name="paging.banner.last"><span> [<a href="{1}"> Primeira </a>/ <a href="{2}"> Anterior </a>] {0} [ <a href="{3}"> Pr&oacute;xima </a>/ <a href="{4}"> &Uacute;ltima </a>]</span></display:setProperty>
	                        <display:setProperty name="basic.msg.empty_list"><span> Nenhum registro encontrado </span></display:setProperty>
                            <% cont++; %>
													
                            <display:column
                            headerClass="tdHeader1Left"
                            style="width: 10%"
                            title="Protocolo"
                            sortable="true"
                            property="numeroProtocolo"
                            href="../../andamento/ExibeMsgPorRespons.do"
                            paramId="primeiroAcionamentoId"
                            paramProperty="id" />
					
                            <display:column
                            headerClass="tdHeader1Left"
                            style="width: 30%"
                            title="Título"
                            sortable="true"
                            property="respostaAcionamento.titulo"
                            href="../../andamento/ExibeMsgPorRespons.do"
                            paramId="primeiroAcionamentoId"
                            paramProperty="id" />

                            <display:column
                            headerClass="tdHeader1Left"
                            style="width: 20%"
                            title="Tipo da Mensagem"
                            sortable="true"
                            property="mensagem.tipoMensagem.descricao"
                            href="../../andamento/ExibeMsgPorRespons.do" 
                            paramId="primeiroAcionamentoId" 
                            paramProperty="id" />

                            <display:column
                            headerClass="tdHeader1Left"
                            style="width: 20%"
                            title="Assunto"
                            sortable="true"
                            property="mensagem.assunto.descricao"
                            href="../../andamento/ExibeMsgPorRespons.do" 
                            paramId="primeiroAcionamentoId" 
                            paramProperty="id" />
						
                            <display:column
                            headerClass="tdHeader1"
                            style="width: 10%"
                            title="Prazo"
                            sortable="true"
                            property="dataPrevistaResolucaoInterna"
                            maxLength="10"
                            href="../../andamento/ExibeMsgPorRespons.do" 
                            paramId="primeiroAcionamentoId" 
                            paramProperty="id" 
                            decorator="br.gov.serpro.ouvidoria.util.ShortDateWrapper"/>

                            <display:column
                            headerClass="tdHeader1Left"
                            style="width: 10%"
                            title="Situação"
                            sortable="true"
                            property="estadoAcionamento.descricao"
                            href="../../andamento/ExibeMsgPorRespons.do" 
                            paramId="primeiroAcionamentoId" 
                            paramProperty="id" />
						
                            <display:footer>
                                <tr>
                                    <td colspan='7' align='right'><a href="#" id="total" style="color: #000000;"></a></td>
                                </tr>
                            </display:footer>
				
                        </display:table>
	
                        <script type="text/javascript" charset='iso-8859-1'>
                            document.getElementById("total").innerHTML = "<a href='javascript:void(0);'><strong>Total: <%= cont %> registro(s)</strong></a>";	
			
                            setCellBackgroundColor(document.getElementById("acionamento"));
                            setImageSrc();
                        </script>
                    </td>
                </tr>
            </logic:present>
			
        </table>
        </form>
        <br>
		
    </body>

</html:html>
