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
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Frameset//EN">

<%@ taglib uri="/tags/struts-html" prefix="html" %>

<html lang="pt-br">
<head>
<html:base/>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<meta http-equiv="Pragma"  content="no-cache">
<meta http-equiv="Expires" content="-1">
<title>Sistema Ouvidoria</title>
</head>

<frameset rows="105,*" framespacing="0" border="0" frameborder="0"> 
	<frame 	name="menu" id="menu" marginWidth="0" 
			marginHeight="0" src="../Menu.do?origem=internet" 
			noResize scrolling="no" 
			target="main" title="�rea de menu">
			
	<frame name="conteudo" id="conteudo" marginheight='0' 
			marginwidth='0' scrolling='auto' 
			src="<%=request.getAttribute("path")%>" title="�rea de conte&uacute;do">
			
	<noframes> 
		<body topmargin="0" leftmargin="0">
			<p>This page uses frames, but your browser doesn't support them.</p>
		</body>
	</noframes>
</frameset>

</html>
