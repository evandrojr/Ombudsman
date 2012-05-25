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
<table border="0" cellpadding="0" cellspacing="0" width="50%" align="center">
<tr>
 <td align="center" class="titulo" align="center">
 	<label tabindex=1 id="titulo"><b>Responder Mensagem</b></label>
 </td>
</tr>
<tr>
 <td align="center"><br>
 	<img src="../../images/ajuda/responderMensagem.jpg" tabindex="2" name="imgTela" id="imgTela" alt="Imagem da tela de responder mensagem">
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
   		Possibilita a resposta �s mensagens sob sua responsabilidade.
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
			<td height="30" colspan="2" valign="top"><a name="busca"><label tabindex="6"><b>1 - Mensagens Sob Sua Responsabilidade</b></label></a></td>
		</tr>
		<tr>
			<td height="40" colspan="2" valign="top">				
					<label tabindex="7">
					Serve para responder mensagens cadastradas no sistema. Os campos poss�veis para o preenchimento s�o:
					</label>
			</td>
		</tr>
		<tr>
			<td align="left" height="40" width="30%" valign="top">
				<DD><label tabindex="8"><b>Tipo da Mensagem</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="9">Tipo da mensagem exibida.</label>
			</td>
		</tr>
		<tr>
			<td align="left" height="40" width="30%" valign="top">
				<DD><label tabindex="10"><b>Tipo de Assunto</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="110">Assunto da mensagem exibida.</label>
			</td>
		</tr>
		<tr>
			<td align="left" height="40" width="30%" valign="top">
				<DD><label tabindex="12"><b>Tipo de Acionador</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="13">Tipo de acionador da mensagem exibida.</label>
			</td>
		</tr>
		<tr>
			<td align="left" height="40" width="30%" valign="top">
				<DD><label tabindex="14"><b>Prazo</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="15">Prazo interno para responder � mensagem exibida.</label>
			</td>
		</tr>
		<tr>
			<td align="left" height="40" width="30%" valign="top">
				<DD><label tabindex="16"><b>T�tulo</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="17">Campo para digita��o do t�tulo da mensagem. </label>
			</td>
		</tr>
		<tr>
			<td align="left" height="40" width="30%" valign="top">
				<DD><label tabindex="18"><b>Mensagem</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="19">Texto da mensagem exibida.</label>
			</td>
		</tr>
		<tr>
			<td align="left" height="40" width="30%" valign="top">
				<DD><label tabindex="20"><b>Arquivo Anexo</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="21">Link para visualiza��o do arquivo anexado � mensagem exibida.</label>
			</td>
		</tr>
		<tr>
			<td align="left" height="40" width="30%" valign="top">
				<DD><label tabindex="22"><b>Resposta</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="23">Campo para digita��o da resposta � mensagem exibida.</label>
			</td>
		</tr>
		<tr>
			<td align="left" height="40" width="30%" valign="top">
				<DD><label tabindex="24"><b>Despacho</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="25">Coment�rios de quem redirecionou a mensagem, caso esta tenha sido redirecionada.</label>
			</td>
		</tr>
		<tr>
			<td align="left" height="40" width="30%" valign="top">
				<DD><label tabindex="26"><b>Remetente</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="27">Quem realizou o redirecionamento da mensagem, caso esta tenha sido redirecionada.</label>
			</td>
		</tr>							
		<tr>
		<td align="left" height="40"  valign="top" colspan="3">
			<label tabindex="28">
			Ap�s o fornecimento dos campos, o usu�rio poder� utilizar o bot�o "Responder", onde responder� definitivamente a mensagem ou o bot�o "Salvar", onde salvar� os dados sem responder a mensagem.<br>			
			</label>
		</td>					
		</tr>			
	  </table>	  
   	  <br><br>
	  <table border="0" cellpadding="5" cellspacing="0" align="center" width="100%">		
		<tr>				
			<td height="40" colspan="2" valign="top">
				<label tabindex="29">Estao dispon�veis os bot�es que operam sobre a Mensagem:</label>
			</td>
		</tr>
		
		<tr>
			<td align="left" height="40" valign="top">
				<DD><label tabindex="30"><b>Banco de Solu��es</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="31">Abre janela para consulta ao banco de solu��es.</label>
			</td>
		</tr>		
		<tr>
			<td align="left" height="40" valign="top">
				<DD><label tabindex="32"><b>Banco de Scripts</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="33">Abre janela para consulta ao banco de scripts.</label>
			</td>
		</tr>		
		<tr>
			<td align="left" height="40" valign="top">
				<DD><label tabindex="34"><b>Redirecionar Mensagem</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="35">Abre janela para redirecionamento da mensagem.</label>
			</td>
		</tr>		
		<tr>
			<td align="left" height="40" valign="top">
				<DD><label tabindex="36"><b>Reclassificar Mensagem</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="37">Abre janela para reclassifica��o da mensagem.</label>
			</td>
		</tr>		
		<tr>
			<td align="left" height="40" valign="top">
				<DD><label tabindex="38"><b>Responder</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="39">Registra a resposta, que passa a estar dispon�vel para o acionador. </label>
			</td>
		</tr>		
		<tr>
			<td align="left" height="40" valign="top">
				<DD><label tabindex="40"><b>Salvar</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="41">Salva a mensagem para que possa continuar a responder depois.</label>
			</td>
		</tr>			
	  </table>		
	</td>
	</tr>
	<tr>
	 <td>
		<hr>
		  <p class="voltar"><A title="imprimir esta p�gina" href="javascript:window.print()" tabindex="42">imprimir</A> 
		    . <A title="topo da p�gina" href="javascript:window.location=location.href;" tabindex="43">topo</A>
	 </td>
	</tr>
</table> 	    
</body>	
</HTML>