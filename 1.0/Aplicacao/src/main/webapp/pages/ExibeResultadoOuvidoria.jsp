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

<%@ taglib uri="/tags/struts-logic" prefix="logic"%>
<%@ taglib uri="/tags/struts-bean"  prefix="bean"%>
<%@ taglib uri="/tags/struts-html"  prefix="html"%>

<html:html lang="pt">

<head>
<html:base />
<title><%= request.getAttribute("titulo")%></title>
<meta http-equiv="content-type" content="text/html;charset=iso-8859-1" />
<meta name="Keywords" content="acessibilidade, guia, serpro, inclus�o, defici�ncia, recomenda��es, necessidade especial, ouvidoria" />
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
	  <A tabindex="100" title="imprimir esta p�gina" href="javascript:print()" >imprimir</A>. 
		<a tabindex="101" title="voltar para p�gina anterior" href="javascript:history.go(-1)" >voltar</a>
  </p>
</div>

</body>
</html:html>

