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
 	<p align="center" class="obrigatorio" tabindex="3"><b>OBS.: O padrão de cores &eacute; meramente ilustrativo.</b></p>
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
					Serve para redirecionar mensagens cadastradas no sistema. Os campos possíveis para o preenchimento são:
					</label>
			</td>
		</tr>
		
		<tr>
			<td align="left" height="40" width="30%" valign="top">
				<DD><label tabindex="8"><b>Redirecionar para</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="9">Campo para seleção de quem deve ser o novo responsável por responder àquela mensagem, se o ouvidor ou outro membro da ouvidoria.</label>
			</td>
		</tr>
		<tr>
			<td align="left" height="40" width="30%" valign="top">
				<DD><label tabindex="10"><b>Sub-Órgão</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="11">Campo para seleção do sub-órgão que será responsável por responder àquela mensagem.</label>
			</td>
		</tr>
		<tr>
			<td align="left" height="40" width="30%" valign="top">
				<DD><label tabindex="12"><b>Assunto</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="13">Campo para seleção do assunto da mensagem, dentre os disponíveis no sub-órgão selecionado.</label>
			</td>
		</tr>
		<tr>
			<td align="left" height="40" width="30%" valign="top">
				<DD><label tabindex="14"><b>Localidade da Ocorrência</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="15">Campo para seleção da localidade da mensagem, dentre as disponíveis para o assunto selecionado.</label>
			</td>
		</tr>
		<tr>
			<td align="left" height="40" width="30%" valign="top">
				<DD><label tabindex="16"><b>Título</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="17">Campo para digitação do título da mensagem. 
		<tr>
			<td align="left" height="40" width="30%" valign="top">
				<DD><label tabindex="18"><b>Despacho</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="19">Campo pata digitação de comentários sobre a mensagem e/ou seu redirecionamento.</label>
			</td>
		</tr>		
	  </table>	  

   	  <br><br>
	  
	  <table border="0" cellpadding="5" cellspacing="0" align="center" width="100%">		
		<tr>				
			<td height="40" colspan="2" valign="top">
				<label tabindex="20">Estao disponíveis os botões que operam sobre a Mensagem:</label>
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
		  <p class="voltar"><A title="imprimir esta página" href="javascript:window.print()" tabindex="25">imprimir</A> 
		    . <A title="topo da página" href="javascript:window.location=location.href;" tabindex="26">topo</A>
	 </td>
	</tr>
</table> 	    
</body>	
</HTML>