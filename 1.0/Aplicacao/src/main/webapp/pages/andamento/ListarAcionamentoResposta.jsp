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

<!-- TagLibs Struts -->
<%@ taglib uri="/tags/struts-logic" prefix="logic" %>
<%@ taglib uri="/tags/struts-bean"  prefix="bean"%>
<%@ taglib uri="/tags/struts-html"  prefix="html"%>

<%-- Paginação --%>
<%@ taglib uri="/tags/displaytag"  prefix="display" %>

<%@ page import="br.gov.serpro.ouvidoria.model.MeioEnvioResposta" %>

<html:html lang="pt">

    <head>
        <html:base />
        <link rel='stylesheet'  media='all' href='../<bean:write name="_LAYOUT_" property="esquemaCores"/>/estilo_conteudo.css' type='text/css'>
    </head>

    <script
        src="../js/util.js" type="text/javascript">
    </script>

    <script
        src="../js/paginacao.js">
    </script>

    <script type="text/javascript" charset='iso-8859-1'>
        <!-- //
		   
        function link(action, id) {
        if ( action == '<%= br.gov.serpro.ouvidoria.model.MeioEnvioResposta.EMAIL.getId() %>' ) {
        href = '../../andamento/ExibirEmail.do?id=' + id;
        window.parent.location.href = href;
        } else {
        href = '../../andamento/ExibirAcionamentoResposta.do?id=' + id;
        var win = novaJanela(href, 'Acionamentos', 750, 500, "auto", "auto", 220, 200);
        win.print();
        }
        }
		   
        function enviar() {
        document.forms[0].submit();
        } 	
			
        function AtualizarAcionamento(){
		
        var ok = false;
        var innerHtmlMsgErros = '';
				
        try {			
		
        var str = document.forms[0].atualiza[0] + "";
        if ( str.indexOf("[object") >= 0 ) {
		
        var size = document.forms[0].atualiza.length;
        var elem = document.forms[0].atualiza;
        for ( i=0; i<size; i++ ) { 
        if( elem[i].checked ) {
								ok = true;
								break;
        }
        }
        } else {
        ok = document.forms[0].atualiza.checked;
        }
					  
        if (ok) {
        abreConfirmacao("enviar");
        return true;
        }
		
        innerHtmlMsgErros += formataErro('&eacute; necessário selecionar um acionamento');
		
        abreAlerta(innerHtmlMsgErros);
        return false;
        } catch(e) {
        // alert(e);
        }
		
        return false;
        }

        // -->
		
        function onLoad(){
        window.parent.document.getElementById("listaAcionamentoResposta").style.height = this.document.body.scrollHeight;
        document.getElementById("imgLista").focus();
        }
		
    </script>

    <body style="margin: 0px 0px;" onload="javascript:onLoad();">

        <table border="0" width="100%" cellpadding="0" cellspacing="0">

            <html:form action="/AtualizarAcionamentoResposta.do" method="POST" >
                <input type="hidden" name="numeroProtocolo" value="<%= request.getAttribute("numeroProtocolo") %>">
                <input type="hidden" name="meioEnvioResposta" value="<%= request.getAttribute("meioEnvioResposta") %>">
                <input type="hidden" name="enviado" value="<%= request.getAttribute("enviado") %>">
                <input type="hidden" name="naoEnviado" value="<%= request.getAttribute("naoEnviado") %>">
	
                <tr>
                    <td><a href="javascript:void(0);" title="Lista de Mensagens Respondidas" id="imgLista"><img accesskey="l" src="../<bean:write name="_LAYOUT_" property="esquemaCores"/>/pasta_lista.gif"></a></td>
                </tr>
                <tr>
                    <td>
                        <% 
                            int cont = 0;
                            String action = null;
                        %>
                        <display:table cellpadding="2" cellspacing="1" style="width: 100%"
                            name="listarAcionamentos" id="acionamento" pagesize="20"
                            requestURI='../../andamento/ListarAcionamentoResposta'>
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

                            <display:column headerClass="tdHeader1" style="width: 5%" title="#">
                                <div align="center">									
                                    <input	title="N&uacute;mero do protocolo: <bean:write name="acionamento" property="numeroProtocolo"/>"
                                    type="checkbox" id="atualiza" name="atualiza"
                                    value="<bean:write name="acionamento" property="id"/>">
                                </div>
                            </display:column>

                            <display:column headerClass="tdHeader1" style="width: 10%" title="Protocolo">
                                <div align="center">
                                    <a href="javascript:link( '<bean:write name="acionamento" property="acionador.meioEnvioRespostaOrgao.meioEnvioResposta.id" />', '<bean:write name="acionamento" property="id"/>')">
                                        <bean:write name="acionamento" property="numeroProtocolo"/>
                                    </a>
                                </div>
                            </display:column>

                            <display:column headerClass="tdHeader1" style="width: 20%" title="Dt do recebimento">
                                <div align="center">
                                    <a href="javascript:link( '<bean:write name="acionamento" property="acionador.meioEnvioRespostaOrgao.meioEnvioResposta.id" />', '<bean:write name="acionamento" property="id"/>')">
                                        <bean:write name="acionamento" property="dataAcionamento" format="dd/MM/yyyy"/>
                                    </a>
                                </div>
                            </display:column>
	
                            <display:column headerClass="tdHeader1" style=": 20%" title="Dt da resposta">
                                <div align="center">
                                    <logic:present name="acionamento" property="respostaAcionamento.data">
                                        <a href="javascript:link( '<bean:write name="acionamento" property="acionador.meioEnvioRespostaOrgao.meioEnvioResposta.id" />', '<bean:write name="acionamento" property="id"/>')">
                                            <bean:write name="acionamento" property="respostaAcionamento.data" format="dd/MM/yyyy"/>
                                        </a>
                                    </logic:present>
                                </div>
                            </display:column>
	
                            <display:column headerClass="tdHeader1" style=": 20%" title="Meio de Envio Resposta">
                                <div align="center">
                                    <a href="javascript:link( '<bean:write name="acionamento" property="acionador.meioEnvioRespostaOrgao.meioEnvioResposta.id" />', '<bean:write name="acionamento" property="id"/>')">
                                        <bean:write name="acionamento" property="acionador.meioEnvioRespostaOrgao.meioEnvioResposta.descricao"/>
                                    </a>
                                </div>
                            </display:column>

                            <display:footer>
                                <tr>
                                    <td id="total" colspan='5' align='right'></td>
                                </tr>
                            </display:footer>
                        </display:table>
		
                        <script type="text/javascript" charset='iso-8859-1'>
                            setImageSrc();
                            document.getElementById("total").innerHTML = "<a href='javascript:void(0);'><strong>Total: <%= cont %> registro(s)</strong></a>";	
                            var cont = getRowsCount(document.getElementById("acionamento"));
                            setElementHeight(window.parent.document.getElementById("listaAcionamentoResposta"), cont, 22);
                            setCellBackgroundColor(document.getElementById("acionamento"));
							
                        </script>
                    </td>
                </tr>
	
                <tr>
                    <td>
                        <% if ( cont > 0 ) { %>
                        <br>
                        <table cellpadding='2' cellspacing='0' border='0'  width='100%'>
                            <tr>
                                <td class='tdHeader1' align='center'>
                                    <label for="btn">
                                        <input id="btn" type="button" name="atualizar" value="Atualizar" class="button" 
                                        onClick="return AtualizarAcionamento();"
                                        onkeypress="return AtualizarAcionamento();"
                                        alt="Clique para registrar os acionamentos que foram enviados">
                                    </label>
                                </td>
                            </tr>			
                        </table>
                        <% } %>
                    </td>
                </tr>
            </html:form>
        </table>
    </body>

</html:html>
