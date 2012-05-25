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

<%@ taglib uri="/tags/struts-logic" prefix="logic"%>
<%@ taglib uri="/tags/struts-bean"  prefix="bean"%>
<%@ taglib uri="/tags/struts-html"  prefix="html"%>

<html:html lang="pt">

<head>
<html:base />
<title><%= request.getAttribute("titulo")%></title>
<meta http-equiv="content-type" content="text/html;charset=iso-8859-1" />
<meta name="Keywords" content="acessibilidade, guia, serpro, inclusão, deficiência, recomendações, necessidade especial, ouvidoria" />
<link rel="stylesheet"  media="all" href="<bean:write name="_LAYOUT_" property="esquemaCores"/>/estilo_conteudo.css" type="text/css">
<link rel="stylesheet" type="text/css" media="print" href="estilo_print.css">
  
<script src="js/util.js" type="text/javascript"></script>

<script language="JavaScript">

function onLoad(){
	document.getElementById("titulo").focus();
}

function visualizarBoletim(url){
	var basehref = location.protocol + "//" + location.host + location.pathname ;	
	novaJanela(basehref + '../../../' + url,"Boletim",750,570,1,0,10,10);
}
</script>
  
</head>

<body onLoad="onLoad();">

<div id="content">
  <h1 id="titulo" tabindex="1"><%=request.getAttribute("titulo")%></h1>
	<p></p>
	<p tabindex="2">
			<%=request.getAttribute("texto")%>	
	</p>	
	<P align="left"  tabindex="3"><FONT size=2><STRONG>Boletins:</STRONG></FONT></P>
	<p>
	<!-- Lista boletins publicados -->	
	<logic:iterate name="lstBoletins" id="boletim" type="br.gov.serpro.ouvidoria.model.Boletim">  		
		<a tabindex="4" href="javascript:visualizarBoletim('<%=request.getAttribute("diretorio")%>/boletins/boletim_<bean:write name="boletim" property="id"/>.html');" >		
		<bean:write name="boletim" property="nome"/>
		</a>		
		(<bean:write name="boletim" property="dataCadastramento" format="dd/MM/yyyy"/>)<br>
	</logic:iterate> 		
  <hr>
  <p class="voltar">
	  <A tabindex="100" title="imprimir esta página" href="javascript:print()" >imprimir</A>. 
		<a tabindex="101" title="voltar para página anterior" href="javascript:history.go(-1)" >voltar</a>
  </p>
</div>

</body>
</html:html>

