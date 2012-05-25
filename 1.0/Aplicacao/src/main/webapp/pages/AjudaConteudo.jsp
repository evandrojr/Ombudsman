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

<%@ taglib uri="/tags/struts-logic" prefix="logic" %>
<%@ taglib uri="/tags/struts-bean" prefix="bean"%>
<%@ taglib uri="/tags/struts-html" prefix="html"%>

<%@ page import="br.gov.serpro.ouvidoria.model.Ajuda" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.Collection" %>

<script language='javascript'>

function onLoad(){
	try { document.getElementById("MsgInicial").focus() } catch(e) {};
}

</script>

<html:html lang="pt">
<head>
<html:base />
<meta http-equiv='Content-Type' content='text/html; charset=iso-8859-1'>
</head>

<link rel='stylesheet' type='text/css' media='all'   href='<bean:write name="_LAYOUT_" property="esquemaCores"/>/estilo_conteudo.css'>
<link rel='stylesheet' type='text/css' media='print' href='<bean:write name="_LAYOUT_" property="esquemaCores"/>/estilo_print.css'>
<body  onload="javascript:onLoad();" style="margin: 5px 5px 5px 0px;">

<div align="left">

<h1 tabindex="1" id="MsgInicial">Conte&uacute;do</h1>
	
<% 
	Collection listaAjuda = (Collection) request.getAttribute("lstAjuda");

	for (Iterator iter = listaAjuda.iterator(); iter.hasNext();) {
		Ajuda ajuda = (Ajuda) iter.next();
		%>
		&nbsp;<img src='images/bullet1b.gif'>&nbsp;
		<a tabindex="2" title='<%= ajuda.getDescricao() %>' href='<%= ajuda.getHtmlAjuda() %>' target='direito'>&nbsp;<%= ajuda.getDescricao() %></a><br>
		<%	
		if(!ajuda.getListaFilhos().isEmpty()) {
			
			Collection listaAjudaFilho = ajuda.getListaFilhos();
			for (Iterator iterFilho = listaAjudaFilho.iterator(); iterFilho.hasNext();) {
				Ajuda ajudaFilho = (Ajuda) iterFilho.next();
			%>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a tabindex="2" title='<%= ajudaFilho.getDescricao() %>' href='<%= ajudaFilho.getHtmlAjuda() %>' target='direito'>&nbsp;<%= ajudaFilho.getDescricao() %></a><br>
			<%
			}
		}		
	}
%>
<script type="text/javascript" charset='iso-8859-1'>
	window.parent.document.getElementById("fmeSelecao").style.height = 323;
</script>

<hr>
  <p class="voltar"><A title="imprimir esta p�gina" href="javascript:window.print()" tabindex="3">imprimir</A> 
    . <A title="topo da p�gina" href="javascript:window.location=location.href;" tabindex="4">topo</A>
	
</div>

</body>

</html:html>