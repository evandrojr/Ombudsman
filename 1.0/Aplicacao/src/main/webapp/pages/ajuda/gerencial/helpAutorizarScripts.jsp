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
<HTML>

<head>
<link rel="stylesheet"  media="all" href="../estilos/estilo_ajuda.css" type="text/css">
<link rel="stylesheet"  media="all" href="../../estilos/Azul/estilo_conteudo.css" type="text/css">
<script language='javascript'>

function onLoad(){
	try { document.getElementById("titulo").focus() } catch(e) {};
}
</script>
</head>		

	
<body onload="javascript:onLoad();" style="margin:25px 2.8em">
<table border="0" cellpadding="0" cellspacing="0" width="50%" align="center">
<tr>
 <td align="center" class="titulo" align="center">
 	<label tabindex=1 id="titulo"><b>Autorizar Scripts</b></label>
 </td>
</tr>
<tr>
 <td align="center"><br>
 	<img src="../../images/ajuda/autorizarScripts_1.jpg" tabindex="2" name="imgTela" id="imgTela" alt="Imagem da tela autorizar scripts" width="655">
 	<img src="../../images/ajuda/autorizarScripts_2.jpg" tabindex="3" name="imgTela" id="imgTela" alt="Imagem da tela autorizar scripts" width="655">
 	<img src="../../images/ajuda/autorizarScripts_3.jpg" tabindex="4" name="imgTela" id="imgTela" alt="Imagem da tela autorizar scripts" width="655">
 </td>
</tr>	
<tr>
 <td>
 	<p align="center" class="obrigatorio" tabindex="5"><b>OBS.: O padrão de cores &eacute; meramente ilustrativo.</b></p>
 </td>
</tr>
 <tr><td><br><br></td></tr> 
 <tr>
   <td>
   	<b><label tabindex="6">Funcionalidade</label></b>
   </td>
 </tr>
 <tr>
   <td>
   <DD><label tabindex="7">
   		Possibilita a autorização ou não da publicação de um script que foi criado no sistema.
	</label></DD>   
   </td>
 </tr> 
 <tr>
  	<td></td>
 </tr>
 <tr><td><br><br></td></tr> 
<tr>
 <td>  		
	  <table border="0" cellpadding="5" cellspacing="0" align="center" width="100%">		
		<tr>
			<td height="30" colspan="2" valign="top">
				<a name="lista"><label tabindex="8"><b>1 - Lista de Scripts</b></label></a>
			</td>
		</tr>
		<tr>
			<td height="40" colspan="2" valign="top">				
					<label tabindex="9">Local onde são mostrados os scripts cadastrados no sistema. São presentes os dados:</label>
			</td>
		</tr>
		<tr>
			<td align="left" height="40" valign="top">
				<DD>
					<label tabindex="10"><b>Script</b></label>
				</DD>
			</td>
			<td valign="top">
				<label tabindex="11">Título dos scripts pendentes de aprovação</label>
			</td>
		</tr>					
	  </table>
	  <br><br>
	  <table border="0" cellpadding="5" cellspacing="0" align="center" width="100%">		
		<tr>
			<td height="30" colspan="2" valign="top">
				<label tabindex="12"><b>1.1 - Está disponível o recurso de paginação com as operações:</b></label>
			</td>
		</tr>			
		<tr>
			<td valign="top" tabindex="13"><%@ include file="../paginacao.jsp" %></td>
		</tr>			
	  </table>
	  <br><br>
	  <table border="0" cellpadding="5" cellspacing="0" align="center" width="100%">		
		<tr>
			<td height="30" colspan="2" valign="top">
				<a name="detalhe"><label tabindex="14"><b>2 - Detalhamento do Script</b></label></a>
			</td>
		</tr>
		<tr>
			<td height="40" colspan="2" valign="top">
				<label tabindex="15">Neste espaço realizam-se operações sobre os Scripts. As operações possíveis são:</label>
			</td>
		</tr>
		<tr>
			<td align="left" height="40" width="150" valign="top">
				<DD><label tabindex="16"><b>Aprovar</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="17">Aprova o script, tornando-o disponível para utilização no sistema.</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40" width="150" valign="top">
				<DD><label tabindex="18"><b>Reprovar</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="19">Reprova o script, fazendo-o retornar ao gestor de conte&uacute;do para que seja reescrito.</label>
			</td>			
		</tr>	
		<tr>				
			<td height="40" colspan="2" valign="top">
				<label tabindex="20">Estao disponíveis os botões que operam sobre o Script:</label>
			</td>
		</tr>
		<tr>
			<td align="left" height="40" width="150" valign="top">
				<DD><label tabindex="21"><b>Aprovar</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="22">Aprova o script, tornando-o disponível para utilização no sistema.</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40" width="150" valign="top">
				<DD><label tabindex="23"><b>Reprovar</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="24">Reprova o script, fazendo-o retornar ao gestor de conte&uacute;do para que seja reescrito.</label>
			</td>			
		</tr>	
	  </table>	  
	  <br><br>
	  <table border="0" cellpadding="5" cellspacing="0" align="center" width="100%">		
		<tr>
			<td height="30" colspan="2" valign="top">
				<a name="reprovar"><label tabindex="25"><b>3 - Reprovar Script</b></label></a>
			</td>
		</tr>
		<tr>
			<td height="40" colspan="2" valign="top">
				<label tabindex="26">Ao clicar no botão REPROVAR, será exibido o detalhe do Script e mais um campo onde o usuário poderá descrever o motivo da reprovação.</label>
			</td>
		</tr>			
	  </table>	
	</td>
	</tr>
	<tr>
	 <td>
		<hr>
		  <p class="voltar"><A title="imprimir esta página" href="javascript:window.print()" tabindex="27">imprimir</A> 
		    . <A title="topo da página" href="javascript:window.location=location.href;" tabindex="28">topo</A>
	 </td>
	</tr>
</table> 	    
</body>	
</HTML>