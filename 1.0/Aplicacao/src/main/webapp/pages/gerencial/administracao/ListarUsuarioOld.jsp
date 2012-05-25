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
                    <img accesskey="l" name="imgLista" tabindex="1" src="../../<bean:write name="_LAYOUT_" property="esquemaCores"/>/pasta_lista.gif" alt="Lista de Usuários"></td><table STYLE="table-layout:fixed" width="100%" name="rsTable" id=rsTable  cellpadding='2' cellspacing='1' border='0' width="100%">
                        <tr> 
                            <th><input accesskey="i" title="Incluir Usuário" type="button" tabindex="2" style="width: 100px;" value="Incluir Usuário" class="button" onClick="link('detalhe', '../../../gerencial/AtualizarUsuario.do?action=exibir&function=incluir');"></th>
                        </tr>
                        <!--
                        <tr> 
                        <th id="thUsuario" align="left"><strong>Usuários</strong></th>
                        <th id="thPerfil" align="left"><strong>Perfil</strong></th>
                        </tr>
                        -->
                        <logic:present name="listar" scope="request">
                            <%  

                                // Variáveis para controle da exibição do grid "listrado"
                                int cont = 0;
                                String classHeader = "";

                                // Variável para controlar o tabindex nas linhas e colunas da lista
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

                        <!-- Definição da Tabela -->
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
                            
                            <display:column style="width: 60%" title="Usuários">
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
