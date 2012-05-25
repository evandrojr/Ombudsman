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
<%@ taglib uri="/tags/struts-html" prefix="html"%>
<%@ taglib uri="/tags/struts-bean" prefix="bean"%>
<%@ taglib uri="/tags/struts-logic" prefix="logic"%>
<%@ taglib uri="http://jakarta.apache.org/taglibs/log-1.0" prefix="log" %>

<%-- Paginação --%>
<%@ taglib uri="/tags/displaytag"  prefix="display" %>

<html>
    <head>
        <html:base />
        <meta http-equiv='Content-Type' content='text/html; charset=iso-8859-1'>
        <link rel='stylesheet'  media='all' href='../<bean:write name="_LAYOUT_" property="esquemaCores"/>/estilo_conteudo.css' type='text/css'>
    </head>

    <script
        src="../js/paginacao.js">
    </script>

    <script type="text/javascript" charset='iso-8859-1'>
        function onLoad() {
        if (window.parent.name == "conteudo") {
        window.parent.document.body.style.cursor='default';
        }				
        window.parent.document.getElementById("casDetail").style.height = 0;
        document.getElementById('imgLista').focus();		
        }
    </script>

    <body style="margin: 0px 0px;" onLoad="onLoad();">

        <align="Left">
        <% int cont = 0; %>
        <table border="0" width="100%" cellpadding="0" cellspacing="0">
            <tr>
                <td align='left'><a href="javascript:void(0);" title="Lista de Soluções" id="imgLista"><img src="../<bean:write name="_LAYOUT_" property="esquemaCores"/>/pasta_lista.gif"/></a></td>
            </tr>
            <tr>
            <td>

                <display:table	cellpadding="2" cellspacing="1" style="width: 100%" name="CAS_RESULTS" id="item"
                    pagesize="20" requestURI="../../andamento/consultarAndamentoSolucaoSearch.do">
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

                    <display:column headerClass="tdHeader1Left" title="Situação">
                        <html:link action="consultarAndamentoSolucaoDetail" target="casDetail"             
                            paramId="id"  
                            paramName="item"  paramProperty="id">
                            <bean:write name="item" property="situacao"/>
                        </html:link>
                    </display:column>

                    <display:column headerClass="tdHeader1Left" title="Assunto">
                        <html:link action="consultarAndamentoSolucaoDetail" target="casDetail"             
                            paramId="id"
                            paramName="item"  paramProperty="id" >
                            <bean:write name="item" property="assunto"/>
                        </html:link>
                    </display:column>

                    <display:column headerClass="tdHeader1Left" title="Protocolo">
                        <html:link action="consultarAndamentoSolucaoDetail" target="casDetail"             
                            paramId="id"
                            paramName="item"  paramProperty="id" >
                            <bean:write name="item" property="protocolo"/>
                        </html:link>
                    </display:column>

                    <display:column headerClass="tdHeader1" title="Data Interna">
                        <html:link action="consultarAndamentoSolucaoDetail" target="casDetail"
                            paramId="id"
                            paramName="item"  paramProperty="id" >
                            <bean:write name="item" property="dataInterna" format="dd/MM/yyyy"/>
                        </html:link>
                    </display:column>

                    <display:column headerClass="tdHeader1Left" title="Responsável">
                        <html:link action="consultarAndamentoSolucaoDetail" target="casDetail"             
                            paramId="id"
                            paramName="item"  paramProperty="id" >
                            <bean:write name="item" property="responsavel"/>    
                        </html:link>
                    </display:column>

                    <display:footer>
                        <tr>
                            <td id="total" colspan='5' align='right'>xxx</td>
                        </tr>
                    </display:footer>
			
                </display:table>

                <script type="text/javascript" charset='iso-8859-1'>
                                        
                    if (document.getElementById("total")!=null){
                    document.getElementById("total").innerHTML = "<strong>Total: <%= cont %> registro(s)</strong>";	                      
                    var cont = getRowsCount(document.getElementById("item"));
                    setElementHeight(window.parent.document.getElementById("casResults"), cont, 19);
                    setElementHeight(window.parent.document.getElementById("casDetail"), 0);
                    setCellBackgroundColor(document.getElementById("item"));
                    setImageSrc();
                    }
                                        
                </script>
                
            </td></tr>
        </table>
    </body>
</html>
