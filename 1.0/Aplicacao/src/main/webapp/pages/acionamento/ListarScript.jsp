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

<!-- TagLibs Struts -->
<%@ taglib uri="/tags/struts-logic" prefix="logic" %>
<%@ taglib uri="/tags/struts-bean"  prefix="bean"%>
<%@ taglib uri="/tags/struts-html"  prefix="html"%>

<%-- Paginação --%>
<%@ taglib uri="/tags/displaytag"  prefix="display" %>

<%--
   -- Em caso de não haver cripts que atenda aos parâmetros informados,
   -- redireciona o fluxo para tela de erro
--%>
<logic:notPresent name="listarScripts" scope="request">
    <logic:redirect forward="error"/>
</logic:notPresent>

<html:html lang="pt">

    <head>
        <html:base />
	
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <meta name="Keywords" content="acessibilidade, guia, serpro, inclusão, deficiência, recomendações, necessidade especial, ouvidoria" />
        <link rel="stylesheet"  media="all" href="../<bean:write name="_LAYOUT_" property="esquemaCores"/>/estilo_conteudo.css" type="text/css">
		
        <title>Busca de Scripts</title>

        <script language="JavaScript">
	
            function AtualizarAcao(){
            parent.document.forms[0].acao.value="detalhar";
            }
	
        </script>
		
        <script
            src="../js/paginacao.js">
        </script>

    </head>

    <body style="margin: 0px 0px;" tabindex="1" onload="javascript:document.getElementById('imgLista').focus();">
        <table border="0" width="100%" cellpadding="0" cellspacing="0">
            <form name="ofListaScripts" method="post">
                <tr>
                    <td><a href="javascript:void(0);" id="imgLista" title="Lista de Mensagens Respondidas"><img src="../<bean:write name="_LAYOUT_" property="esquemaCores"/>/pasta_lista.gif"></a></td>
                </tr>
                <tr>
                    <td>
	
                        <%
                            int cont = 0;
                            String action = null;
                        %>
                        <display:table cellpadding="2" cellspacing="1" style="width: 100%"
                            name="listarScripts" id="script" pagesize="20"
                            requestURI='../../acionamento/ListarScript.do'>
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

                            <display:column headerClass="tdHeader1Left" style="width: 50%" title="Script">
                                <html:link 
                                    action="ExibirScript" 
                                    target="exibeScript"                  
                                    paramId="id"
                                    paramName="script"
                                    paramProperty="id"
                                    onclick="AtualizarAcao();"
                                    onkeypress="AtualizarAcao();">
                                    <bean:write name="script" property="titulo"/>
                                </html:link>
                            </display:column>

                            <display:column headerClass="tdHeader1Left" style="width: 37%" title="Assunto">
                                <html:link 
                                    action="ExibirScript" 
                                    target="exibeScript"                  
                                    paramId="id"
                                    paramName="script"
                                    paramProperty="id"
                                    onclick="AtualizarAcao();"
                                    onkeypress="AtualizarAcao();">
                                    <bean:write name="script" property="assunto.descricao"/>
                                </html:link>
                            </display:column>

                            <display:column headerClass="tdHeader1" style="width: 13%" title="Data">
                                <html:link 
                                    action="ExibirScript" 
                                    target="exibeScript"                  
                                    paramId="id"
                                    paramName="script"
                                    paramProperty="id"
                                    onclick="AtualizarAcao();"
                                    onkeypress="AtualizarAcao();">
                                    <bean:write name="script" property="dataCadastramento" format="dd/MM/yyyy"/>
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
                            var cont = getRowsCount(document.getElementById("script"));
                            setElementHeight(window.parent.document.getElementById("lstScripts"), cont, 19);
                            setCellBackgroundColor(document.getElementById("script"));
                        </script>
                    </td>
                </tr>
            </form>
        </table>
    </body>

</html:html>
