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
  <p class="voltar"><A title="imprimir esta página" href="javascript:window.print()" tabindex="3">imprimir</A> 
    . <A title="topo da página" href="javascript:window.location=location.href;" tabindex="4">topo</A>
	
</div>

</body>

</html:html>