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
<meta http-equiv="no-cache">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="expires" CONTENT="Wed, 26 Feb 1997 08:21:57 GMT">
<title>Sistema Ouvidoria</title>
</head>

<frameset rows="105,*" framespacing="0" border="0" frameborder="no"> 
		<frame name="menu" title="�rea de menu" scrolling="no" noresize src="../Menu.do?origem=intranet" marginwidth="0" marginheight="0" id="menu" frameborder="0" >
		<frame name="conteudo" title="�rea de conte&uacute;do" src="<%=request.getAttribute("path")%>"  marginwidth="0" marginheight="0" scrolling="auto" id="frame_conteudo" frameborder="0" >
	<noframes> 
		<body topmargin="0" leftmargin="0">
		<p>Esta p�gina se utiliza de frames, mas seu navegador n�o suporta frames.</p>
		</body>
	</noframes> 
</frameset>

</html>
