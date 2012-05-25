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
<%@ taglib uri="/tags/struts-html" prefix="html"%>
<%@ taglib uri="/tags/struts-bean" prefix="bean"%>
<%@ taglib uri="/tags/struts-logic" prefix="logic"%>
<%@ taglib uri="http://jakarta.apache.org/taglibs/log-1.0" prefix="log" %>

<%-- Pagina��o --%>
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
                <td align='left'><a href="javascript:void(0);" title="Lista de Solu��es" id="imgLista"><img src="../<bean:write name="_LAYOUT_" property="esquemaCores"/>/pasta_lista.gif"/></a></td>
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

                    <display:column headerClass="tdHeader1Left" title="Situa��o">
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

                    <display:column headerClass="tdHeader1Left" title="Respons�vel">
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
