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

<script language='javascript'>

function onLoad(){
	document.getElementById("MsgInicial").focus();	
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

<h1 tabindex="1" id="MsgInicial" >Índice</h1>

<form>

<% int cont = 0; %>
<script type="text/javascript" charset='iso-8859-1'>	
	var letraAnt = ''; 
</script>

<table border=0  CELLSPACING=0 CELLPADDING=0 width="100%">
	<logic:iterate name="lstAjuda" id="ajuda" indexId="index">
	  <% cont++; %> 	
  
		 <script type="text/javascript" charset='iso-8859-1'> 
			 desc = '<bean:write name="ajuda" property="descricao"  />';		 
			 var letra = desc.substr(0, 1);
	
			 if (letra != letraAnt) {
			 	document.write('<tr>');			 
			 	document.write('<td align=left>');			 
				document.write('&nbsp;&nbsp;&nbsp;&nbsp;');
				document.write('<b tabindex=2>' + letra + '</b> ');				
			 	document.write('</td>');				
			 	document.write('</tr>');
				letraAnt = letra;
			} 
		 </script>	
	
		 <tr>
			 <td align=left>
				<font class='mapaSiteNiv2'>	 			 
				 <img src='images/bullet1b.gif'>
			     &nbsp;
				 <a tabindex="2" title='' href='<bean:write name="ajuda" property="htmlAjuda"  />' target='direito'>	 	 
				 <bean:write name="ajuda" property="descricao"  />	 
				 </a>
				 </font>
			 </td>	
		 </tr>
	</logic:iterate>

</table>
  
<%  if (cont < 16) {
           cont = 16;
       }
%>
<script type="text/javascript" charset='iso-8859-1'>
	window.parent.document.getElementById("fmeSelecao").style.height = <%= 19 * ( (cont>16?16:cont) + 1 ) %>;
</script>

<br>
<hr>
  <p class="voltar"><A title="imprimir esta página" href="javascript:window.print()" tabindex="3">imprimir</A> 
    . <A title="topo da página" href="javascript:window.location=location.href;" tabindex="4">topo</A>

</form> 	

</div>

</body>

</html:html>