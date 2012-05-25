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
<%@ taglib uri="/tags/struts-bean" prefix="bean"%>
<%@ taglib uri="/tags/struts-html" prefix="html"%>

<%-- Paginação --%>
<%@ taglib uri="/tags/displaytag"  prefix="display" %>

<html lang="pt">
    <head>
        <html:base />
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <link rel="stylesheet"  media="all" href="../../<bean:write name="_LAYOUT_" property="esquemaCores"/>/estilo_conteudo.css" type="text/css">

        <script
            src="../../js/paginacao.js">
        </script>

        <script language="JavaScript">

            function IncluirOrgao(){
	            var baseHref = location.protocol + "//" + location.host + location.pathname;
	            parent.window.frames[1].document.location.href = baseHref + "../../../gerencial/AtualizarOrgao.do?action=exibir&function=incluir";
            }
	
            function AtualizarConfiguracoesOrgao(idOrgao){
	            var baseHref = location.protocol + "//" + location.host + location.pathname;
	            parent.window.frames[1].document.location.href = baseHref + "../../../gerencial/AtualizarConfiguracoesOrgao.do?action=exibir&id=" + idOrgao;
            }
	
            function onLoad() {
            	document.getElementById('imgLista').focus();
            }

        </script>
		
    </head>

    <body onLoad="onLoad();" style="margin: 0px 0px;" >
      
        <table border="0" width="100%" cellpadding="0" cellspacing="0">
            <tr>
                <td><a href="javascript:void(0);" id="imgLista" title="Lista de Órgãos"><img src="../../<bean:write name="_LAYOUT_" property="esquemaCores"/>/pasta_lista.gif"></a></td>
            </tr>
            <table STYLE="table-layout:fixed" width="100%" id=rsTable cellpadding='2' cellspacing='1' border='0' width="100%">
                <tr>
                    <td width="60%">
                    </td>
                    <td width="40%" align=center>
                        <input type="button" name="incluir" value="Incluir Novo Órgão" class="button" style="WIDTH: 170px"
                        onclick="IncluirOrgao();"
                        onkeypress="IncluirOrgao();"
                        alt="Clique para cadastrar um novo órgao">
                    </td>
                </tr>
            </table>   			

            <tr>
                <td>
                    <% int cont = 0; %>
                    <display:table cellpadding="2" cellspacing="1" style="width: 100%"
                        name="listarOrgaos" id="orgao" pagesize="20"
                        requestURI="../../../gerencial/AtualizarOrgao.do?action=listar">
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
						
                        <display:column headerClass="tdHeader1" style="width: 60%" title="Órgão">
                            <a target="detalhe" href="../../../gerencial/AtualizarOrgao.do?action=exibir&function=alterar&id=<bean:write name="orgao" property="id"/>">
                                <bean:write name="orgao" property="descricao"/>
                            </a>
                        </display:column>
		
                        <display:column headerClass="tdHeader1" style="width: 40%" title="Operação">
                            <div align="center"> 
                                <input  type="button" name="atualizarConfiguracoes" value="Atualizar Configurações" class="button" style="WIDTH: 170px"
                                onclick="AtualizarConfiguracoesOrgao('<bean:write name="orgao" property="id"/>');"
                                onkeypress="AtualizarConfiguracoesOrgao('<bean:write name="orgao" property="id"/>');"
                                alt="Clique para atualizar as configurações do órgao">
                            </div>
                        </display:column>
						
                        <display:footer>
                            <tr>
                                <td colspan='2' id='total' align='right'></td>
                            </tr>
                        </display:footer>
				
                    </display:table>
	
                    <script type="text/javascript" charset='iso-8859-1'>
                        document.getElementById("total").innerHTML = "<a href='javascript:void(0);'><strong>Total: <%= cont %> registro(s)</strong></a>";	
                        var cont = getRowsCount(document.getElementById("orgao"));
                        setElementHeight(window.parent.document.getElementById("lista"), cont, 22);
                        //setElementHeight(window.parent.document.getElementById("detalhe"), 0);
			
                        setCellBackgroundColor(document.getElementById("orgao"));
                    </script>
                </td>
            </tr>
        </table>
    </body>
</html>
