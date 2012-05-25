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

<%@ taglib uri="/tags/struts-logic" prefix="logic" %>
<%@ taglib uri="/tags/struts-bean" prefix="bean"%>
<%@ taglib uri="/tags/struts-html" prefix="html"%>

<%-- Paginação --%>
<%@ taglib uri="/tags/displaytag"  prefix="display" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html   lang="pt-br">


    <head>
        <html:base />
        <title>Consulta Mensagens Respondidas</title>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <link rel="stylesheet"  media="all" href="../../<bean:write name="_LAYOUT_" property="esquemaCores"/>/estilo_conteudo.css" type="text/css">
        <!-- Estilo para impressao -->
        <link rel="stylesheet" type="text/css" media="print" href="../../estilo_print.css">
        <script language="JavaScript">
            <!--
			
            <!--
            function MM_reloadPage(init) {  //reloads the window if Nav4 resized
            if (init==true) with (navigator) {if ((appName=="Netscape")&&(parseInt(appVersion)==4)) {
            document.MM_pgW=innerWidth; document.MM_pgH=innerHeight; onresize=MM_reloadPage; }}
            else if (innerWidth!=document.MM_pgW || innerHeight!=document.MM_pgH) location.reload();
            }
            MM_reloadPage(true);
            // -->
            //-->
			
        </script>
        <script
            src="../../js/paginacao.js">
        </script>
    </head>

    <!-- Bibliotecas javascript  -->
    <script language="JavaScript" src="../../js/util.js"></script>
    <script language="JavaScript" src="../../js/data.js"></script>

    <script type="text/javascript" charset='iso-8859-1'>

        // Seta o foco ao carregar a tela
        function setaFocoOnLoad(){
        if (window.parent.name == "conteudo") {
        window.parent.document.body.style.cursor='default';
        }	
        document.getElementById("imgLista").focus();
        }
    </script>
	
	
    <%  
        // Obtem o perfil do usuario logado
        br.gov.serpro.ouvidoria.model.Perfil perfil = new br.gov.serpro.ouvidoria.model.Perfil();
        br.gov.serpro.ouvidoria.model.Funcionario func = (br.gov.serpro.ouvidoria.model.Funcionario) request.getAttribute("funcionario");

        boolean isGestorConteudo = false;
        if ( func.getPerfil().getDescricao().equals(br.gov.serpro.ouvidoria.model.Perfil.GESTOR_CONTEUDO.getDescricao()) ){
            isGestorConteudo = true;
        }

    %>
	

    <body onload="javascript:setaFocoOnLoad();" 
        style="margin: 0px 0px;" >
	


	
        <table border="0" width="100%" cellpadding="0" cellspacing="0">
            <tr>
                <td align="left"><a href="javascript:void(0);" id="imgLista" title="Lista de Tipos de Mensagens">
                    <img src="../../<bean:write name="_LAYOUT_" property="esquemaCores"/>/pasta_lista.gif"></a>					
                </td>
            </tr>
            <tr>
                <td>
                    <% int cont = 0; %>
                    <display:table cellpadding="2" cellspacing="1" style="width: 100%"
                        name="lstAcionamentos" id="acionamento" pagesize="20"
                        requestURI="../../../gerencial/ListaMsgRespondida.do">
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

                        /* Caso perfil logado seja Gestor de Conteudo, nao mostrar N° do protocolo */
                        <% if (!isGestorConteudo) { %>
                        <display:column headerClass="tdHeader1Left" style="width: 6%" title="Protocolo">
                            <html:link	action="ExibeMsgRespondida"
                                target="iFrame2"
                                paramId="id"
                                paramName="acionamento"
                                paramProperty="id">
                                <bean:write name="acionamento" property="numeroProtocolo" />	      
                            </html:link> 
                        </display:column>
                        <% } %>
                        /************************************************/

                        <display:column headerClass="tdHeader1" style="width: 10%" title="Data">
                            <html:link	action="ExibeMsgRespondida"
                                target="iFrame2"
                                paramId="id"
                                paramName="acionamento"
                                paramProperty="id">
                                < bean:write name="acionamento" property="respostaAcionamento.data" format="dd/MM/yyyy"/>
                            </html:link>
                        </display:column>

                        <display:column headerClass="tdHeader1Left" style="width: 20%" title="Título">
                            <html:link	action="ExibeMsgRespondida"
                                target="iFrame2"
                                paramId="id"
                                paramName="acionamento"
                                paramProperty="id">
                                <bean:write name="acionamento" property="respostaAcionamento.titulo"/>
                            </html:link> 
                        </display:column>

                        <display:column headerClass="tdHeader1Left" style="width: 44%" title="Texto">
                            <html:link	action="ExibeMsgRespondida"
                                target="iFrame2"
                                paramId="id"
                                paramName="acionamento"
                                paramProperty="id">
                                <bean:write name="acionamento" property="mensagem.textoFormatado" filter="false"/>	      
                            </html:link> 
                        </display:column>
						
                        <display:column headerClass="tdHeader1Left" style="width: 20%" title="Funcionário">
                            <div>
                                <bean:write name="acionamento" property="funcionario.login" />	      
                                -
                                <bean:write name="acionamento" property="funcionario.nome" />	      
                            </div>
                        </display:column>
						
                        <display:footer>
                            <tr>
                                <td id="total" colspan='5' align='right'></td>
                            </tr>
                        </display:footer>
				
                    </display:table>
	
                    <script type="text/javascript" charset='iso-8859-1'>
                        document.getElementById("total").innerHTML = "<a href='javascript:void(0);'><strong>Total: <%= cont %> registro(s)</strong></a>";	
                        var cont = getRowsCount(document.getElementById("acionamento"));
                        setElementHeight(window.parent.document.getElementById("iFrame1"), cont, 20 );
                        //setElementHeight(window.parent.document.getElementById("iFrame2"), 0);
			
                        setCellBackgroundColor(document.getElementById("acionamento"));
                    </script>
                </td>
            </tr>
        </table>
    </body>
</html>
