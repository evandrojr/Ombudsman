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
<table border="0" cellpadding="0" cellspacing="0" width="70%" align="center">
<tr>
 <td align="center" class="titulo" align="center">
 	<label tabindex=1 id="titulo"><b>Redirecionar Mensagem</b></label>
 </td>
</tr>
<tr>
 <td align="center"><br>
 	<img src="../../images/ajuda/redirecionarMensagem.jpg" tabindex="2" name="imgTela" id="imgTela" alt="Imagem da tela de responder mensagem">
 </td>
</tr>	
<tr>
 <td>
 	<p align="center" class="obrigatorio" tabindex="3"><b>OBS.: O padr�o de cores &eacute; meramente ilustrativo.</b></p>
 </td>
</tr>
 <tr><td><br><br></td></tr> 
 <tr>
   <td>
   	<b><label tabindex="4">Funcionalidade</label></b>
   </td>
 </tr>
 <tr>
   <td>
   <DD><label tabindex="5">
   		Possibilita que a mensagem seja redirecionada a outro membro da ouvidoria.
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
			<td height="30" colspan="2" valign="top"><a name="busca"><label tabindex="6"><b>1 - Redirecionar Mensagens</b></label></a></td>
		</tr>
		<tr>
			<td height="40" colspan="2" valign="top">				
					<label tabindex="7">
					Serve para redirecionar mensagens cadastradas no sistema. Os campos poss�veis para o preenchimento s�o:
					</label>
			</td>
		</tr>
		
		<tr>
			<td align="left" height="40" width="30%" valign="top">
				<DD><label tabindex="8"><b>Redirecionar para</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="9">Campo para sele��o de quem deve ser o novo respons�vel por responder �quela mensagem, se o ouvidor ou outro membro da ouvidoria.</label>
			</td>
		</tr>
		<tr>
			<td align="left" height="40" width="30%" valign="top">
				<DD><label tabindex="10"><b>Sub-�rg�o</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="11">Campo para sele��o do sub-�rg�o que ser� respons�vel por responder �quela mensagem.</label>
			</td>
		</tr>
		<tr>
			<td align="left" height="40" width="30%" valign="top">
				<DD><label tabindex="12"><b>Assunto</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="13">Campo para sele��o do assunto da mensagem, dentre os dispon�veis no sub-�rg�o selecionado.</label>
			</td>
		</tr>
		<tr>
			<td align="left" height="40" width="30%" valign="top">
				<DD><label tabindex="14"><b>Localidade da Ocorr�ncia</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="15">Campo para sele��o da localidade da mensagem, dentre as dispon�veis para o assunto selecionado.</label>
			</td>
		</tr>
		<tr>
			<td align="left" height="40" width="30%" valign="top">
				<DD><label tabindex="16"><b>T�tulo</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="17">Campo para digita��o do t�tulo da mensagem. 
		<tr>
			<td align="left" height="40" width="30%" valign="top">
				<DD><label tabindex="18"><b>Despacho</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="19">Campo pata digita��o de coment�rios sobre a mensagem e/ou seu redirecionamento.</label>
			</td>
		</tr>		
	  </table>	  

   	  <br><br>
	  
	  <table border="0" cellpadding="5" cellspacing="0" align="center" width="100%">		
		<tr>				
			<td height="40" colspan="2" valign="top">
				<label tabindex="20">Estao dispon�veis os bot�es que operam sobre a Mensagem:</label>
			</td>
		</tr>
		
		<tr>
			<td align="left" height="40" valign="top">
				<DD><label tabindex="21"><b>Redirecionar</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="22">Redireciona a mensagem de acordo com os dados informados.</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40" valign="top">
				<DD><label tabindex="23"><b>Fechar</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="24">Fecha a janela aberta para redirecionamento.</label>
			</td>
		</tr>	
	  </table>		
	</td>
	</tr>
	<tr>
	 <td>
		<hr>
		  <p class="voltar"><A title="imprimir esta p�gina" href="javascript:window.print()" tabindex="25">imprimir</A> 
		    . <A title="topo da p�gina" href="javascript:window.location=location.href;" tabindex="26">topo</A>
	 </td>
	</tr>
</table> 	    
</body>	
</HTML>