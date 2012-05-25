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
   		Possibilita a resposta às mensagens sob sua responsabilidade.
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
					Serve para responder mensagens cadastradas no sistema. Os campos possíveis para o preenchimento são:
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
				<label tabindex="15">Prazo interno para responder à mensagem exibida.</label>
			</td>
		</tr>
		<tr>
			<td align="left" height="40" width="30%" valign="top">
				<DD><label tabindex="16"><b>Título</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="17">Campo para digitação do título da mensagem. </label>
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
				<label tabindex="21">Link para visualização do arquivo anexado à mensagem exibida.</label>
			</td>
		</tr>
		<tr>
			<td align="left" height="40" width="30%" valign="top">
				<DD><label tabindex="22"><b>Resposta</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="23">Campo para digitação da resposta à mensagem exibida.</label>
			</td>
		</tr>
		<tr>
			<td align="left" height="40" width="30%" valign="top">
				<DD><label tabindex="24"><b>Despacho</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="25">Comentários de quem redirecionou a mensagem, caso esta tenha sido redirecionada.</label>
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
			Após o fornecimento dos campos, o usuário poderá utilizar o botão "Responder", onde responderá definitivamente a mensagem ou o botão "Salvar", onde salvará os dados sem responder a mensagem.<br>			
			</label>
		</td>					
		</tr>			
	  </table>	  
   	  <br><br>
	  <table border="0" cellpadding="5" cellspacing="0" align="center" width="100%">		
		<tr>				
			<td height="40" colspan="2" valign="top">
				<label tabindex="29">Estao disponíveis os botões que operam sobre a Mensagem:</label>
			</td>
		</tr>
		
		<tr>
			<td align="left" height="40" valign="top">
				<DD><label tabindex="30"><b>Banco de Soluções</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="31">Abre janela para consulta ao banco de soluções.</label>
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
				<label tabindex="37">Abre janela para reclassificação da mensagem.</label>
			</td>
		</tr>		
		<tr>
			<td align="left" height="40" valign="top">
				<DD><label tabindex="38"><b>Responder</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="39">Registra a resposta, que passa a estar disponível para o acionador. </label>
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
		  <p class="voltar"><A title="imprimir esta página" href="javascript:window.print()" tabindex="42">imprimir</A> 
		    . <A title="topo da página" href="javascript:window.location=location.href;" tabindex="43">topo</A>
	 </td>
	</tr>
</table> 	    
</body>	
</HTML>