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
   -- Descrição:    Lista as soluções de acordo com o assunto (ativo/inativo) ou o texto informado
   -- 
   -- Versão:       1.0
   -- Data:         23/11/2004   
  */
--%>


<!-- TagLibs Struts -->
<%@ taglib uri="/tags/struts-logic" prefix="logic" %>
<%@ taglib uri="/tags/struts-bean"  prefix="bean"%>
<%@ taglib uri="/tags/struts-html"  prefix="html"%>

<%-- Paginação --%>
<%@ taglib uri="/tags/displaytag"  prefix="display" %>

<%--
   -- Em caso de não haver soluções que atenda aos parâmetros informados,
   -- redireciona o fluxo para tela de erro
--%>
<logic:notPresent name="listarSolucoes" scope="request">
    <logic:redirect forward="error"/>
</logic:notPresent>

<html:html lang="pt">
    <head>
        <html:base />
        <meta name="generator" content="microsoft visual studio 6.0">
        <title></title>
    </head>

    <script
        src="../js/paginacao.js">
    </script>

    <script language="JavaScript">

        // Exibe os detalhes da solução
        function exibeSolucao() {
		
	        var parametros = "?id=" + document.forms[0].acaoChamadora.value +
	        "&acaoChamadora=" + document.forms[0].acaoChamadora.value;	                 
			  
	        window.location = "ExibeSolucao" + parametros;
        }

    </script>
    <script type="text/javascript" charset='iso-8859-1'>
        function onLoad() {
        	try {document.getElementById('imgLista').focus(); } catch(e) {}
        }
    </script>

    <link rel="stylesheet" media="all" 		href="../<bean:write name="_LAYOUT_" property="esquemaCores"/>/estilo_conteudo.css" type="text/css">
    <link rel='stylesheet' type='text/css'	media='print' href='../estilo_print.css'>

    <body onload="onLoad();" style="margin: 0px; 0px;">

        <br>
        <table border="0" width="100%" cellpadding="0" cellspacing="0">

            <html:form action="/AtualizarAcionamentoResposta.do" method="POST" >
                <input type="hidden" name="numeroProtocolo" value="<%= request.getAttribute("numeroProtocolo") %>">
                <input type="hidden" name="meioEnvioResposta" value="<%= request.getAttribute("meioEnvioResposta") %>">
                <input type="hidden" name="enviado" value="<%= request.getAttribute("enviado") %>">
                <input type="hidden" name="naoEnviado" value="<%= request.getAttribute("naoEnviado") %>">
	
                <tr>
                    <td><a href="javascript:void(0);" id="imgLista" title="Lista de Mensagens Respondidas"><img src="../<bean:write name="_LAYOUT_" property="esquemaCores"/>/pasta_lista.gif"></a></td>
                </tr>
                <tr>
                    <td>
                        <% 
                            int cont = 0;
                            String action = null;
                        %>
                        <display:table	cellpadding="2" cellspacing="1" style="width: 100%"
                            name="listarSolucoes" id="solucao" pagesize="20"
                            requestURI='../../andamento/ListaSolucoes.do'>
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

                            <display:column headerClass="tdHeader1" style="width: 20%" title="Situação">
                                <html:link action="ExibeSolucao" target="exibeSolucao"
                                    paramId="id" paramName="solucao" paramProperty="id">
                                    <bean:write name="solucao" property="assunto.situacao"/>
                                </html:link>
                            </display:column>

                            <display:column headerClass="tdHeader1Left" style="width: 30%" title="Descrição">
                                <html:link action="ExibeSolucao" target="exibeSolucao"
                                    paramId="id" paramName="solucao" paramProperty="id">
                                    <bean:write name="solucao" property="assunto.descricao"  />
                                </html:link>
                            </display:column>

                            <display:column headerClass="tdHeader1" style="width: 10%" title="Data">
                                <html:link action="ExibeSolucao" target="exibeSolucao"
                                    paramId="id" paramName="solucao" paramProperty="id">
                                    <bean:write name="solucao" property="dataCadastramento" format="dd/MM/yyyy"/>
                                </html:link>
                            </display:column>
	
                            <display:column headerClass="tdHeader1Left" style="width: 40%" title="Título">
                                <html:link action="ExibeSolucao" target="exibeSolucao"
                                    paramId="id" paramName="solucao" paramProperty="id">
                                    <bean:write name="solucao" property="titulo"/>
                                </html:link>
                            </display:column>
	
                            <display:footer>
                                <tr>
                                    <td id="total" colspan='4' align='right'></td>
                                </tr>
                            </display:footer>
                        </display:table>

                        <script type="text/javascript" charset='iso-8859-1'>
                            setImageSrc();
                            document.getElementById("total").innerHTML = "<a href='javascript:void(0);'><strong>Total: <%= cont %> registro(s)</strong></a>";	
                            var cont = getRowsCount(document.getElementById("solucao"));
                            setElementHeight(window.parent.document.getElementById("lstSolucoes"), cont, 20);
                            setCellBackgroundColor(document.getElementById("solucao"));
							
                            el = document.getElementById("solucao");
                            var row = el.insertRow(0);
                            var cel1 = el.rows[0].insertCell(0);
                            var cel2 = el.rows[0].insertCell(1);

                            cel1.colSpan = 2;
                            cel2.colSpan = 2;
							
                            cel1.className = "tdHeader1";
                            cel2.className = "tdHeader1";
							
                            cel1.innerHTML = "Assunto";
                            cel2.innerHTML = "Solução";
                        </script>
                    </td>
                </tr>
                <INPUT TYPE="hidden" NAME="acaoChamadora"  VALUE="<%= request.getAttribute("acaoChamadora") %>">
            </html:form>
        </table>
    </body>

</html:html>
