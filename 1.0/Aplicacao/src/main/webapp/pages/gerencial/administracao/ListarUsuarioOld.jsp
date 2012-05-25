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

<%@ taglib uri="/tags/struts-logic" prefix="logic" %>
<%@ taglib uri="/tags/struts-bean"  prefix="bean" %>
<%@ taglib uri="/tags/struts-html"  prefix="html" %>
<%@ taglib uri="/tags/displaytag"   prefix="display" %>

<html lang="pt">
    <head>
        <html:base />
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <link rel="stylesheet"  media="all" href="../../<bean:write name="_LAYOUT_" property="esquemaCores"/>/estilo_conteudo.css" type="text/css">
    </head>

    <script type="text/javascript" charset='iso-8859-1'>
        function link(frame, url) {
        var baseHref = location.protocol + "//" + location.host + location.pathname;
        window.parent.frames[frame].document.location.href= baseHref  + url;		
        }
    </script>

    <body style="margin: 0px 0px;">

        


        <table border="0" width="100%" cellpadding="0" cellspacing="0">
            <TBODY>
                <tr>
                    <td>
                    <img accesskey="l" name="imgLista" tabindex="1" src="../../<bean:write name="_LAYOUT_" property="esquemaCores"/>/pasta_lista.gif" alt="Lista de Usu�rios"></td><table STYLE="table-layout:fixed" width="100%" name="rsTable" id=rsTable  cellpadding='2' cellspacing='1' border='0' width="100%">
                        <tr> 
                            <th><input accesskey="i" title="Incluir Usu�rio" type="button" tabindex="2" style="width: 100px;" value="Incluir Usu�rio" class="button" onClick="link('detalhe', '../../../gerencial/AtualizarUsuario.do?action=exibir&function=incluir');"></th>
                        </tr>
                        <!--
                        <tr> 
                        <th id="thUsuario" align="left"><strong>Usu�rios</strong></th>
                        <th id="thPerfil" align="left"><strong>Perfil</strong></th>
                        </tr>
                        -->
                        <logic:present name="listar" scope="request">
                            <%  

                                // Vari�veis para controle da exibi��o do grid "listrado"
                                int cont = 0;
                                String classHeader = "";

                                // Vari�vel para controlar o tabindex nas linhas e colunas da lista
                                int ind = 2;
                                String index = null;
                                String action = null;
                            %> 
	
                            <!-- loop que percorre a Collection -->
                            <!--
                            <logic:iterate name="listar" id="object" type="br.gov.serpro.ouvidoria.model.Funcionario">
                            <%  
                                cont++;
                                index = String.valueOf(ind++);

                                if (cont % 2 == 0) {
                                    classHeader = "tdHeader3";
                                } else {
                                    classHeader = "tdHeader4";
                                }
                            %> 
	
                            <tr> 
                            <td headers="thUsuario" class="<%= classHeader %>">
                            <a tabindex="3" target="detalhe" href="../../../gerencial/AtualizarUsuario.do?action=exibir&function=alterar&id=<bean:write name="object" property="id"/>">
                            <bean:write name="object" property="nome"/>
                            </a>
                            </td>
	
                            <td headers="thPerfil" class="<%= classHeader %>">
                            <a tabindex="3" target="detalhe" href="../../../gerencial/AtualizarUsuario.do?action=exibir&function=alterar&id=<bean:write name="object" property="id"/>">
                            <bean:write name="object" property="perfil.descricao"/>
                            </a>
                            </td>
                            </tr>
                            </logic:iterate >
                            <script type="text/javascript" charset='iso-8859-1'>
                            window.parent.document.getElementById("lista").style.height = <%= 19 * ( (cont>8?8:cont) + 3 ) %>;
                            window.parent.document.getElementById("detalhe").style.height = 0;
                            </script>
                            -->
                        </logic:present>
                    </table>
                    </td>
                </tr>
                <tr>
                    <td>
                        <style type="text/css">		

                            .lista th {
                            font-size: 70%;
                            font-weight: bold;
                            text-align: left;
                            background-color: #FFFFFF;
                            }

                            .even {
                            background-color: #FFDFAD;
                            }

                            .odd {
                            background-color: #FFF3DE;
                            }	
	
                            .pagebanner {
                            font-size: 70%;
                            font-weight: normal;
                            text-align: left;
                            background-color: #FFFFFF
                            }
	
                            .pagelinks {
                            font-size: 70%;
                            font-weight: normal;
                            text-align: left;
                            background-color: #FFFFFF
                            }
                        </style>

                        <!-- Defini��o da Tabela -->
                        <display:table class="lista" cellpadding="2" cellspacing="1" style="width: 100"
                            name="listar" id="object" pagesize="7"
                            requestURI="../../../gerencial/AtualizarUsuario.do?action=listar">
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
                            
                            <display:column style="width: 60%" title="Usu�rios">
                                <a tabindex="3" target="detalhe" href="../../../gerencial/AtualizarUsuario.do?action=exibir&function=alterar&id=<bean:write name="object" property="id"/>">
                                    <bean:write name="object" property="nome"/>
                                </a>
                            </display:column>

                            <display:column style="width: 40%" title="Perfil">
                                <a tabindex="3" target="detalhe" href="../../../gerencial/AtualizarUsuario.do?action=exibir&function=alterar&id=<bean:write name="object" property="id"/>">
                                    <bean:write name="object" property="perfil.descricao"/>
                                </a>
                            </display:column>

                            <display:setProperty name="paging.banner.page.selected" value="{0}" /> 
                            <display:setProperty name="paging.banner.placement" value="bottom" /> 
                            <display:setProperty name="paging.banner.group_size" value="9" /> 

                        </display:table>

                    </td>
                </tr>
            </TBODY>
        </table>
    </body>
</html>
