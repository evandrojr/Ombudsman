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
			target="main" title="área de menu">
			
	<frame name="conteudo" id="conteudo" marginheight='0' 
			marginwidth='0' scrolling='auto' 
			src="<%=request.getAttribute("path")%>" title="área de conte&uacute;do">
			
	<noframes> 
		<body topmargin="0" leftmargin="0">
			<p>This page uses frames, but your browser doesn't support them.</p>
		</body>
	</noframes>
</frameset>

</html>
