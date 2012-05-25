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
 	<label tabindex=1 id="titulo"><b>Banco de Scripts</b></label>
 </td>
</tr>
<tr>
 <td align="center"><br>
 	<img src="../../images/ajuda/bancoScripts_1.jpg" tabindex="2" name="imgTela" id="imgTela" alt="Imagem da tela banco de scripts">
 	<img src="../../images/ajuda/bancoScripts_2.jpg" tabindex="3" name="imgTela" id="imgTela" alt="Imagem da tela banco de scripts">
 	<img src="../../images/ajuda/bancoScripts_3.jpg" tabindex="4" name="imgTela" id="imgTela" alt="Imagem da tela banco de scripts">
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
   		Possibilita a consulta aos scripts disponibilizados pela ouvidoria e o registro da utilização desses scripts.
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
			<td height="30" colspan="2" valign="top"><a name="busca"><label tabindex="8"><b>1 - Consultar Banco de Scripts</b></label></a></td>
		</tr>
		<tr>
			<td height="40" colspan="2" valign="top">				
					<label tabindex="9">
					Serve para buscar scripts específicos dentre os cadastrados, listando apenas as que correspondem ao crit&eacute;rio de busca selecionado.<br>
					Os crit&eacute;rios de busca possíveis são:
					</label>
			</td>
		</tr>
		<tr>
			<td align="left" height="40" width="150" valign="top">
				<DD><label tabindex="10"><b>Palavra-chave</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="11">Campo para digitação da palavra-chave para busca de scripts disponíveis no órgão. A palavra-chave será buscada no texto e no título do script.</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40" width="150" valign="top">
				<DD><label tabindex="12"><b>Assunto</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="13">Campo para seleção de um assunto de mensagem dentre os cadastrados pela ouvidoria.</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40" width="150" valign="top">
				<DD><label tabindex="14"><b>Situação</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="15">Campo para a seleção da situação do assunto do script.</label>
			</td>
		</tr>					
		<tr>
		<td align="left" height="40"  valign="top" colspan="3">
			<label tabindex="16">
			Após o fornecimento dos crit&eacute;rios de busca deve-se utilizar o botão "Buscar" ou a tecla "Enter", para que o sistema traga as soluções filtrados.<br>			
			</label>
		</td>					
		</tr>			
	  </table>
	  
	  <br><br>
	  <table border="0" cellpadding="5" cellspacing="0" align="center" width="100%">		
		<tr>
			<td height="30" colspan="2" valign="top">
				<a name="lista"><label tabindex="17"><b>1 - Lista de Banco de Scripts</b></label></a>
			</td>
		</tr>
		<tr>
			<td height="40" colspan="2" valign="top">				
					<label tabindex="18">Local onde são mostradas os scripts cadastrados no sistema. São presentes os dados:</label>
			</td>
		</tr>
		<tr>
			<td align="left" height="40" valign="top">
				<DD>
					<label tabindex="19"><b>Situação</b></label>
				</DD>
			</td>
			<td valign="top">
				<label tabindex="20">Situação do assunto do script encontrado.</label>
			</td>
		</tr>
		<tr>
			<td align="left" height="40" valign="top">
				<DD>
					<label tabindex="21"><b>Descrição</b></label>
				</DD>
			</td>
			<td valign="top">
				<label tabindex="22">Título do assunto do script encontrado.</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40" valign="top">
				<DD>
					<label tabindex="23"><b>Data</b></label>
				</DD>
			</td>
			<td valign="top">
				<label tabindex="24">Data em que o script foi cadastrado no sistema.</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40" valign="top">
				<DD>
					<label tabindex="25"><b>Titulo</b></label>
				</DD>
			</td>
			<td valign="top">
				<label tabindex="26">Título do script encontrado.</label>
			</td>
		</tr>						
	  </table>
	  
	  <br><br>
	  
	  <table border="0" cellpadding="5" cellspacing="0" align="center" width="100%">		
		<tr>
			<td height="30" colspan="2" valign="top">
				<label tabindex="27"><b>1.1 - Está disponível o recurso de paginaçã com as operações:</b></label>
			</td>
		</tr>			
		<tr>
			<td valign="top" tabindex="28"><%@ include file="../paginacao.jsp" %></td>
		</tr>			
	  </table>
	  
	  <br><br>
	  
	  <table border="0" cellpadding="5" cellspacing="0" align="center" width="100%">		
		<tr>
			<td height="30" colspan="2" valign="top">
				<a name="detalhe"><label tabindex="29"><b>2 - Detalhamento do Script</b></label></a>
			</td>
		</tr>
		<tr>
			<td height="40" colspan="2" valign="top">
				<label tabindex="30">Os campos para visualização são:</label>
			</td>
		</tr>				
		<tr>
			<td align="left" height="40" width="150" valign="top">
				<DD><label tabindex="31"><b>Descrição</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="32">Título e descrição do script selecionado.</label>
			</td>
		</tr>			
		<tr>				
			<td height="40" colspan="2" valign="top">
				<label tabindex="33">Estao disponíveis os botões que operam sobre o Script:</label>
			</td>
		</tr>
		<tr>
			<td align="left" height="40" width="150" valign="top">
				<DD><label tabindex="34"><b>Buscar</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="35">Envia os dados para consulta do script.</label>
			</td>
		</tr>			
	  </table>	  
	 	 
	</td>
	</tr>
	<tr>
	 <td>
		<hr>
		  <p class="voltar"><A title="imprimir esta página" href="javascript:window.print()" tabindex="36">imprimir</A> 
		    . <A title="topo da página" href="javascript:window.location=location.href;" tabindex="37">topo</A>
	 </td>
	</tr>
</table> 	    

	
</body>	

</HTML>