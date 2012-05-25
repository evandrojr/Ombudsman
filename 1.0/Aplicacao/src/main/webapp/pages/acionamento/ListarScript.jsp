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
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<!-- TagLibs Struts -->
<%@ taglib uri="/tags/struts-logic" prefix="logic" %>
<%@ taglib uri="/tags/struts-bean"  prefix="bean"%>
<%@ taglib uri="/tags/struts-html"  prefix="html"%>

<%-- Pagina��o --%>
<%@ taglib uri="/tags/displaytag"  prefix="display" %>

<%--
   -- Em caso de n�o haver cripts que atenda aos par�metros informados,
   -- redireciona o fluxo para tela de erro
--%>
<logic:notPresent name="listarScripts" scope="request">
    <logic:redirect forward="error"/>
</logic:notPresent>

<html:html lang="pt">

    <head>
        <html:base />
	
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <meta name="Keywords" content="acessibilidade, guia, serpro, inclus�o, defici�ncia, recomenda��es, necessidade especial, ouvidoria" />
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
