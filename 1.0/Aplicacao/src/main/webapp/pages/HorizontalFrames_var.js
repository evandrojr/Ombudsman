/*******************************************************
 *	(c) Ger Versluis 2000 version 9.10 14 October 2002 *
 *	You may use this script on non commercial sites.   *
 *	For info write to menus@burmees.nl		           *
 *	You may remove all comments for faster loading	   *		
 *******************************************************/

	var NoOffFirstLineMenus=5;			// Number of main menu  items
	var LowBgColor="#666666";
	var HighBgColor="#999999";
	var FontLowColor="#FFFFFF";
	var FontHighColor="#000000";
	var BorderColor="#000000";
	var BorderWidthMain=0;
	var BorderWidthSub=0;
 	var BorderBtwnMain=0.2;
	var BorderBtwnSub=0.2;
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
	var LeftPaddng=0;
	var TopPaddng=.5;
	var FirstLineHorizontal=1;
	var MenuFramesVertical=0;
	var DissapearDelay=1000;
	var UnfoldDelay=100;	
	var TakeOverBgColor=0;
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
	var RememberStatus=0;			// RememberStatus: When set to 1, menu unfolds to the presetted menu item. 
						// When set to 2 only the relevant main item stays highligthed
						// The preset is done by setting a variable in the head section of the target document.
						// <head>
						//	<script type="text/javascript">var SetMenu="2_2_1";</script>
						// </head>
						// 2_2_1 represents the menu item Menu2_2_1=new Array(.......

	var PartOfWindow=0;
	var BuildOnDemand=0;			// 1/0 When set to 1 the sub menus are build when the parent is moused over

	var MenuSlide="";
	var MenuShadow="";
	var MenuOpacity="";

	function BeforeStart(){return}

    function AfterBuild(){return}
	function BeforeFirstOpen(){return}
	function AfterCloseAll(){return}

	var baseHref = location.protocol + "//" + location.host + location.pathname;

Menu1=new Array("<a title='Sistema Ouvidoria' href='" + baseHref + "/../Main.do' tabindex='5' target='conteudo'><img src='images/menu/SistFr02NomeSistema.gif' border='0'/></a>","javascript:parent.conteudo.location.href='" + baseHref + "/../Main.do'","",0,27,160,"#CC0000","#CC0000","#FFFFFF","#FFFFFF","","",-1,-1,-1,"","Sistema Ouvidoria");

Menu2=new Array("<a title='Fale com a Ouvidoria' href='" + baseHref + "/../ExibirMensagemGenerica.do?titulo=Fale com a Ouvidoria&tela=FaleOuvidoria' tabindex='6' target='conteudo'><img src=\"images/menu/SistFr02BotFaleOuvidoria01.gif\" onmouseout=\"this.src='images/menu/SistFr02BotFaleOuvidoria01.gif'\" onmouseover=\"this.src='images/menu/SistFr02BotFaleOuvidoria02.gif'\"/></a>","javascript:parent.conteudo.location.href='" + baseHref + "/../ExibirMensagemGenerica.do?titulo=Fale com a Ouvidoria&tela=FaleOuvidoria'","",2,27,131,"","","","","","",-1,-1,-1,"","Fale com a Ouvidoria");
	Menu2_1=new Array("<a title='Acionamento' href='" + baseHref + "/../acionamento/EnviarMensagemWeb.do' tabindex='6' target='conteudo'>&nbsp;</a>Acionamento","javascript:parent.conteudo.location.href='" + baseHref + "/../acionamento/EnviarMensagemWeb.do'","",0,4,34,"","","","","","",-1,-1,-1,"","Acionamento");
	Menu2_2=new Array("<a title='Outros Canais de Comunicação' href='" + baseHref + "/../ExibirMensagemGenerica.do?titulo=Outros Canais de Comunicação&tela=CanaisComunicacao' tabindex='6' target='conteudo'>&nbsp;</a>Outros Canais de Comunicação","javascript:parent.conteudo.location.href='" + baseHref + "/../ExibirMensagemGenerica.do?titulo=Outros Canais de Comunicação&tela=CanaisComunicacao'","",0,4,34,"","","","","","",-1,-1,-1,"","Outros Canais de Comunicação");

Menu3=new Array("<a title='Consulte sua Resposta' href='" + baseHref + "/../andamento/ConsultarResposta.do' tabindex='7' target='conteudo'><img src=\"images/menu/SistFr02BotConsultResp01.gif\" onmouseout=\"this.src='images/menu/SistFr02BotConsultResp01.gif'\" onmouseover=\"this.src='images/menu/SistFr02BotConsultResp02.gif'\"/></a>","javascript:parent.conteudo.location.href='" + baseHref + "/../andamento/ConsultarResposta.do'","",0,27,139,"","","","","","",-1,-1,-1,"","Consulte sua Resposta");

Menu4=new Array("<a title='Informações da Ouvidoria' href='" + baseHref + "/../ExibirMensagemGenerica.do?titulo=Informações da Ouvidoria&tela=InformacoesOuvidoria' tabindex='8' target='conteudo'><img src=\"images/menu/SistFr02BotInfOuvidoria01.gif\" onmouseout=\"this.src='images/menu/SistFr02BotInfOuvidoria01.gif'\" onmouseover=\"this.src='images/menu/SistFr02BotInfOuvidoria02.gif'\"/></a>","javascript:parent.conteudo.location.href='" + baseHref + "/../ExibirMensagemGenerica.do?titulo=Informações da Ouvidoria&tela=InformacoesOuvidoria'","",4,27,155,"","","","","","",-1,-1,-1,"","Informações da Ouvidoria");
	Menu4_1=new Array("<a title='Legislação' href='" + baseHref + "/../ExibirMensagemGenerica.do?titulo=Legislação&tela=Legislacao' target='conteudo'>&nbsp;</a>Legislação","javascript:parent.conteudo.location.href='" + baseHref + "/../ExibirMensagemGenerica.do?titulo=Legislação&tela=Legislacao'","",0,4,30,"","","","","","",-1,1,-1,"","Legislação");
	Menu4_2=new Array("<a title='Tipos de Mensagem' href='" + baseHref + "/../ExibirMensagemGenerica.do?titulo=Tipos de Mensagem&tela=TiposMensagem' target='conteudo'>&nbsp;</a>Tipos de Mensagem","javascript:parent.conteudo.location.href='" + baseHref + "/../ExibirMensagemGenerica.do?titulo=Tipos de Mensagem&tela=TiposMensagem'","",0,4,30,"","","","","","",-1,1,-1,"","Tipos de Mensagens");
	Menu4_3=new Array("<a title='Tipos de Assunto' href='" + baseHref + "/../ExibirMensagemGenerica.do?titulo=Tipos de Assunto&tela=TiposAssunto' target='conteudo'>&nbsp;</a>Tipos de Assunto","javascript:parent.conteudo.location.href='" + baseHref + "/../ExibirMensagemGenerica.do?titulo=Tipos de Assunto&tela=TiposAssunto'","",0,4,30,"","","","","","",-1,1,-1,"","Tipos de Assuntos");
	Menu4_4=new Array("<a title='Resultados da Ouvidoria' href='" + baseHref + "/../ExibirResultadoOuvidoria.do?titulo=Resultados da Ouvidoria' target='conteudo'>&nbsp;</a>Resultados da Ouvidoria","javascript:parent.conteudo.location.href='" + baseHref + "/../ExibirResultadoOuvidoria.do?titulo=Resultados da Ouvidoria'","",0,4,30,"","","","","","",-1,1,-1,"","Resultados da Ouvidoria");

Menu5=new Array("<a title='Ajuda' href='" + baseHref + "/../ExibirMensagemGenerica.do?titulo=Ajuda&tela=AjudaInternet' tabindex='8' target='conteudo'><img src=\"images/menu/SistFr02BotAjuda01.gif\" onmouseout=\"this.src='images/menu/SistFr02BotAjuda01.gif'\" onmouseover=\"this.src='images/menu/SistFr02BotAjuda02.gif'\"/></a>","javascript:parent.conteudo.location.href='" + baseHref + "/../ExibirMensagemGenerica.do?titulo=Ajuda&tela=AjudaInternet'","",2,27,46,"","","","","","",-1,-1,-1,"","Ajuda");
	Menu5_1=new Array("<a title='Tópicos da Ajuda' href='" + baseHref + "/../Ajuda.do' tabindex='11' target='conteudo'>&nbsp;</a>Tópicos da Ajuda","javascript:parent.conteudo.location.href='" + baseHref + "/../Ajuda.do'","",0,4,20,"","","","","","",-1,-1,-1,"","Tópicos da Ajuda");
	Menu5_2=new Array("<a title='Mapa do Site' tabindex='10' href='" + baseHref + "/../ExibirMensagemGenerica.do?titulo=Mapa do Site&tela=MapaSiteInternet' target='conteudo'>&nbsp;</a>Mapa do Site","javascript:parent.conteudo.location.href='" + baseHref + "/../ExibirMensagemGenerica.do?titulo=Mapa do Site&tela=MapaSiteInternet'","",0,4,20,"","","","","","",-1,-1,-1,"","Mapa do Site");
	