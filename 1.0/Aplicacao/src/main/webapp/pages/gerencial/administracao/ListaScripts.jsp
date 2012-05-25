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
<%--
  /*
   -- M�dulo:       Gerencial
   -- 
   -- Descri��o:    lista scripts a serem alterados ou exclu�dos
   -- 
   -- Vers�o:       1.0
   -- Data:         27/12/2004
  */
--%>
 
<%@ taglib uri="/tags/struts-logic" prefix="logic" %>
<%@ taglib uri="/tags/struts-bean" prefix="bean"%>
<%@ taglib uri="/tags/struts-html" prefix="html"%>

<%-- Pagina��o --%>
<%@ taglib uri="/tags/displaytag"   prefix="display" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html:html lang="pt">


    <head>
        <html:base />

        <title>Atualizar Cadastro</title>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <link rel="stylesheet" media="all" href="../../<bean:write name="_LAYOUT_" property="esquemaCores"/>/estilo_conteudo.css" type="text/css">

        <script src="../../js/paginacao.js"></script>
        <script language="JavaScript">
            <!--
            function MM_reloadPage(init) {  //reloads the window if Nav4 resized
            if (init==true) with (navigator) {if ((appName=="Netscape")&&(parseInt(appVersion)==4)) {
            document.MM_pgW=innerWidth; document.MM_pgH=innerHeight; onresize=MM_reloadPage; }}
            else if (innerWidth!=document.MM_pgW || innerHeight!=document.MM_pgH) location.reload();
            }
            MM_reloadPage(true);
            // -->
        </script>
    </head>

    <script type="text/javascript" charset='iso-8859-1'>
        // Seta o foco ao carregar a tela
        function setaFocoOnLoad(){
        // Se a �rea de detalhe estiver com altura diferente de zero, &eacute; porque a aquela 
        // apresenta uma msg. Neste caso o foco deve ser mantido nesta.
        //if (window.parent.document.getElementById("detalhe").style.height  == "0px")  {
        document.getElementById("imgLista").focus();
        //}
        }
    </script>

    <body onload="javascript:setaFocoOnLoad();" style="margin: 0px 0px;">

        


        <form name="form" method="post" action="">

        <table cellpadding="0" cellspacing="0" border="0" align="center" width="100%">
            <TBODY>
                <tr> 
                    <td height="10"><a href="javascript:void(0);" id="imgLista" title="Lista de Scripts"><img src="../../<bean:write name="_LAYOUT_" property="esquemaCores"/>/pasta_lista.gif"></a></td>
                </tr>
                <tr>
                    <td>
                        <% int cont = 0; %>
                        <display:table cellpadding="2" cellspacing="1" style="width: 100%" name="lstScripts"
                            id="object" pagesize="20" requestURI="../../../gerencial/ListarBancoScripts.do">
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

                            <display:column headerClass="tdHeader1Left" style="width: 60%" title="T�tulo">            
                                <a href="../../../gerencial/ExibeScripts.do?id=<bean:write name="object" property="id" />&txtEditar=<bean:write name="txtEditar"/>" target="detalhe" id="id" >
                                    <bean:write name="object" property="id" /> - <bean:write name="object" property="titulo" />	      
                                </a>	
                            </display:column>

                            <display:column headerClass="tdHeader1" style="width: 30%; text-align: center" title="Estado">
                                <a href="../../../gerencial/ExibeScripts.do?id=<bean:write name="object" property="id" />&txtEditar=<bean:write name="txtEditar"/>" target="detalhe" id="id" >
                                    <bean:write name="object" property="estado.descricao" />	      
                                </a>        
                            </display:column>
		
                            <!--Adicionar o campo Atendimento.Qtd utiliza��es do Script-->
                            <display:column headerClass="tdHeader1" style="width: 50%; text-align: center" title="Qtd Utiliza��o">
                                <a href="../../../gerencial/ExibeScripts.do?id=<bean:write name="object" property="id" />&txtEditar=<bean:write name="txtEditar"/>" target="detalhe" id="id" >
                                    <bean:write name="object" property="quantidadeAtendimentos" />	
                                </a>        
                            </display:column>

                            <display:footer>
                                <tr>
                                    <td id="total" colspan='3' align='right'></td>
                                </tr>
                            </display:footer>

                        </display:table>

                        <script type="text/javascript" charset='iso-8859-1'>
                            document.getElementById("total").innerHTML = "<a href='javascript:void(0);'><strong>Total: <%= cont %> registro(s)</strong></a>";	
		
                            var cont = getRowsCount(document.getElementById("object"));

                            setElementHeight(window.parent.document.getElementById("lista"), cont);
                            //setElementHeight(window.parent.document.getElementById("detalhe"), 0);

                            setCellBackgroundColor(document.getElementById("object"));
                        </script>

                        <logic:present name="teste">
                            <%  
                                // Vari�veis para controle da exibi��o do grid "listrado"
                                int _cont = 0;
                                String classHeader = "";

                                // Vari�vel para controlar o tabindex nas linhas e colunas da lista
                                int ind = 1;
                            %> 

                            <table STYLE="table-layout:fixed" width="100%" id=rsTable  cellpadding='2' cellspacing='1' border='0' width="100%">  
                                <TBODY>
                                    <tr> 
                                        <th id="titulo"  class="tdHeader1left"  width="70%"><div >T�tulo</div></th>
                                        <th id="estado"  class="tdHeader1"       width="30%"><div  >Estado</div></th>
                                    </tr>
	
                                    <!-- Exibe os scripts consultados -->
                                    <logic:iterate name="lstScripts" id="script">
                                        <tr> 
                                            <%  
                                                // Verifica qual a cor da linha a ser exibida
                                                cont++;

                                                if (cont % 2 == 0) {
                                                    classHeader = "tdHeader3";
                                                } else {
                                                    classHeader = "tdHeader4";
                                                }
                                            %> 	  	      

                                            <td class="<%= classHeader %>" id="maenome">
                                                <bean:write name="script" property="id" />
                                                - 
                                                <html:link action="ExibeScripts" target="detalhe"                  
                                                    paramId="id"  
                                                    paramName="script"  paramProperty="id"                                   
                                                    >	        
                                                    <bean:write name="script" property="titulo" />	      
                                                </html:link> 
                                            </td>
                                            <td class="<%= classHeader %>"> 
                                                <div align="center" >
                                                    <bean:write name="script" property="estado.descricao" />	      
                                                </div>
                                            </td>
                                        </tr>
                                    </logic:iterate>
                                    <tr>
                                        <td class="" colspan="2" align="right"><a href="javascript:void(0);"><strong>Total: <%= cont %> registro(s)</strong></a></td>
                                    </tr>				  
                                </TBODY>
                            </table>

                            <!-- Calcula a altura do iFrame de exibi��o da lista de acordo com a 
                            quantidade de scripts sendo exibida -->
                            <script type="text/javascript" charset='iso-8859-1'>
                                window.parent.document.getElementById("lista").style.height = <%= 19 * ( (cont>8?8:cont) + 5 ) %>;
                            </script>
                        </logic:present>

                    </td>
                </tr>
            </TBODY>		
        </table>
  
        <html:hidden property="action"  value="ExibirEntrarDetalheScript" />  

  
        </FORM>
    </body>
</html:html> 
