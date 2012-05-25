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
<meta http-equiv="no-cache">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="expires" CONTENT="Wed, 26 Feb 1997 08:21:57 GMT">
<title>Sistema Ouvidoria</title>
</head>

<frameset rows="105,*" framespacing="0" border="0" frameborder="no"> 
		<frame name="menu" title="área de menu" scrolling="no" noresize src="../Menu.do?origem=intranet" marginwidth="0" marginheight="0" id="menu" frameborder="0" >
		<frame name="conteudo" title="área de conte&uacute;do" src="<%=request.getAttribute("path")%>"  marginwidth="0" marginheight="0" scrolling="auto" id="frame_conteudo" frameborder="0" >
	<noframes> 
		<body topmargin="0" leftmargin="0">
		<p>Esta página se utiliza de frames, mas seu navegador não suporta frames.</p>
		</body>
	</noframes> 
</frameset>

</html>
