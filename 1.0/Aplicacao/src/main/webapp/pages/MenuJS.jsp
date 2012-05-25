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
<%--
 /*
   -- Sistema:      Ouvidoria
   -- Módulo:       Geral
   -- Aplicação:    Menu
   -- 
   -- Descrição:    Menu Java Script da Aplicação
   -- Versão:       1.0
   -- Data:         10/12/2004
  */
--%>

<%@ page import="br.gov.serpro.ouvidoria.bean.MenuBean" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.Collection" %>

<%
	response.setHeader("Expires","0");
	response.setHeader("pragma","no-cache");
	response.setHeader("Cache-Control","no-cache");

	Collection menu = (Collection) request.getAttribute("menu");
%>

	var NoOffFirstLineMenus=<%= menu.size() + 1%>;			// Number of main menu  items
	var LowBgColor="#666666";
	var HighBgColor="#999999";
	var FontLowColor="#FFFFFF";
	var FontHighColor="#000000";
	var BorderColor="#000000";
	var BorderWidthMain=0;
	var BorderWidthSub=0;
 	var BorderBtwnMain=0;
	var BorderBtwnSub=0;
	var FontFamily="arial";
	var FontSize=1.5;
	var FontBold=1;
	var FontItalic=0;
	var MenuTextCentered="left";
	var MenuTextVerticalCentered="center";
	var MenuCentered="left";
	var MenuVerticalCentered="center";
	var ChildOverlap=.2;
	var ChildVerticalOverlap=.3;
	var StartTop=0;
	var StartLeft=0;				// Menu offset y coordinate.
	var VerCorrect=0;
	var HorCorrect=0;
	var LeftPaddng=.2;
	var TopPaddng=0;
	var FirstLineHorizontal=1;
	var MenuFramesVertical=0;
	var DissapearDelay=1000;
	var UnfoldDelay=100;	
	var TakeOverBgColor=1;
	var FirstLineFrame="menu";
	var SecLineFrame="conteudo";
	var DocTargetFrame="conteudo";
	var TargetLoc="";
	var MenuWrap=0;
	var RightToLeft=0;
	var BottomUp=0;
	var UnfoldsOnClick=0;
	var BaseHref="";

	var Arrws=["",0,0,"",0,0,"",0,0,"",0,0];

	var MenuUsesFrames=1;
	var RememberStatus=0;			
	
	// RememberStatus: When set to 1, menu unfolds to the presetted menu item. 
	// When set to 2 only the relevant main item stays highligthed
	// The preset is done by setting a variable in the head section of the target document.
	// <head>
	//	<script type="text/javascript">var SetMenu="2_2_1";</script>
	// </head>
	// 2_2_1 represents the menu item Menu2_2_1=new Array(.......

	var PartOfWindow=.0;
	var BuildOnDemand=0;			
	
	// 1/0 When set to 1 the sub menus are build when the parent is moused over

	//	var MenuSlide="progid:DXImageTransform.Microsoft.GradientWipe(duration=.5, wipeStyle=1)";
	//	var MenuShadow="progid:DXImageTransform.Microsoft.Shadow(color=#888888, direction=135, strength=1)";
	//	var MenuOpacity="progid:DXImageTransform.Microsoft.Alpha(opacity=100)";

	var MenuSlide="";
	var MenuShadow="";
	var MenuOpacity="";

	function BeforeStart(){return}
	function AfterBuild(){return}
	function BeforeFirstOpen(){return}
	function AfterCloseAll(){return}

<%
	String domain =  request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();   

	// Monta o Menu Principal
	int size   = 0;
	int length = 0;

	int index  = 1;

%>

<%= "Menu" + index%> = new Array("<a title='Sistema Ouvidoria' href='<%= domain %>/Main.do' tabindex='5' target='conteudo'><img src='images/menu/SistFr02NomeSistema.gif' border='0'/></a>","javascript:parent.conteudo.location.href='<%=domain%>/Main.do'","",0,27,160,"#CC0000","#CC0000","#FFFFFF","#FFFFFF","","",-1,-1,-1,"","Sistema Ouvidoria");

<%
	index++;
	for ( Iterator iter = menu.iterator(); iter.hasNext(); ) {

		MenuBean item = (MenuBean) iter.next();

		length   = ((item.getTitulo().length() * 2)/3);
		if ( length < 5 ) {
			length = 5;
		} else if ( length > 30 ) {
			length = 30;
		}
		
		size = (item.getSubMenu() != null)?item.getSubMenu().size():0;
%>
		<%= "Menu" + index%> = new Array("<a title='<%= item.getTitulo() %>' href='<%= domain + item.getPath() %>' tabindex='<%= ( index + 5 ) %>' target='conteudo'><img border='0' height='27' width='<%= item.getImageWidth() %>' src=\"../<%= item.getPathImageHi() %>\" onmouseout=\"this.src='../<%= item.getPathImageHi() %>'\" onmouseover=\"this.src='../<%= item.getPathImageLo() %>'\"/></a>","javascript:parent.conteudo.location.href='<%= domain + item.getPath() %>'","",<%= size %>, 27, <%= item.getImageWidth() %>,"","","","","","",-1,-1,-1,"","<%= item.getTitulo() %>");
<%
		// Monta o Primeiro SubMenu, se houver
		if ( size > 0 ) {
			int index_1 = 1;
			int size_1  = 0;
			int length_1 = 0;
			
			for ( Iterator iter_1 = item.getSubMenu().iterator(); iter_1.hasNext(); ) {
				MenuBean subItem = (MenuBean) iter_1.next();
				size_1           = (subItem.getSubMenu() != null)?subItem.getSubMenu().size():0;
				length_1         = 34;
%>
			<%= "Menu" + index + "_" + index_1%> = new Array("<%= "   " + subItem.getTitulo() %>","javascript:parent.conteudo.location.href='<%= domain + subItem.getPath() %>'","",<%= size_1 %>, 4, <%= length_1 %>,"","","","","","",-1,-1,-1,"","<%= subItem.getTitulo() %>");

<%
					// Monta o Segundo SubMenu, se houver
					if ( size_1 > 0 ) {
						int index_2 = 1;
						for ( Iterator iter_2 = subItem.getSubMenu().iterator(); iter_2.hasNext(); ) {
							MenuBean subSubItem = (MenuBean) iter_2.next();
%>
						<%= "Menu" + index + "_" + index_1 + "_" + index_2%> = new Array("<%= subSubItem.getTitulo() %>","javascript:parent.conteudo.location.href='<%= domain + subSubItem.getPath() %>'","",0, 4, 30,"","","","","","",-1,-1,-1,"","<%= subSubItem.getTitulo() %>");
<%
							index_2++;
						}
					}
				index_1++;
			}
		}
		index++;
	}
%>
