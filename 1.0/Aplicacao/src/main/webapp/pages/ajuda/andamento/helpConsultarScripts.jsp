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
 	<label tabindex=1 id="titulo"><b>Consultar Scripts</b></label>
 </td>
</tr>
<tr>
 <td align="center"><br>
 	<img src="../../images/ajuda/consultarScripts_1.jpg" tabindex="2" name="imgTela" id="imgTela" alt="Imagem da tela consultar scripts">
 	<img src="../../images/ajuda/consultarScripts_2.jpg" tabindex="3" name="imgTela" id="imgTela" alt="Imagem da tela consultar scripts"> 	
 	<img src="../../images/ajuda/consultarScripts_3.jpg" tabindex="4" name="imgTela" id="imgTela" alt="Imagem da tela consultar scripts"> 	 	
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
   		Possibilita a consulta aos scripts disponibilizados pela ouvidoria para auxiliar na resposta às mensagens.
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
			<td height="30" colspan="2" valign="top"><a name="busca"><label tabindex="8"><b>1 - Consultar Scripts</b></label></a></td>
		</tr>
		<tr>
			<td height="40" colspan="2" valign="top">				
					<label tabindex="9">
					Serve para buscar os Scripts específicos dentre os cadastrados, listando apenas os que correspondem ao crit&eacute;rio de busca selecionado.<br>
					Os crit&eacute;rios de busca possíveis são:
					</label>
			</td>
		</tr>
		<tr>
			<td align="left" height="40" width="150" valign="top">
				<DD><label tabindex="10"><b>Palavra-Chave</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="11">Campo para digitação da palavra-chave para busca de script aprovados disponíveis no órgão. A palavra-chave será buscada no texto e no título do script.</label>
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
		<td align="left" height="40"  valign="top" colspan="3">
			<label tabindex="14">
			Após o fornecimento dos crit&eacute;rios de busca deve-se utilizar o botão "Buscar" ou a tecla "Enter", para que o sistema traga os Scripts filtrados.<br>
			O botão "Novo Script" permite que sejam incluidos novos Scripts no banco.
			</label>
		</td>					
		</tr>		
	  </table>
	  
	  <br><br>
	  		
	  <table border="0" cellpadding="5" cellspacing="0" align="center" width="100%">		
		<tr>
			<td height="30" colspan="2" valign="top">
				<a name="lista"><label tabindex="15"><b>2 - Lista de Scripts</b></label></a>
			</td>
		</tr>
		<tr>
			<td height="40" colspan="2" valign="top">				
					<label tabindex="16">Local onde são mostrados os scripts cadastrados no sistema. São presentes os dados:</label>
			</td>
		</tr>
		<tr>
			<td align="left" height="40" valign="top">
				<DD>
					<label tabindex="17"><b>Script</b></label>
				</DD>
			</td>
			<td valign="top">
				<label tabindex="10">Título do script encontrado. </label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40" valign="top">
				<DD>
					<label tabindex="18"><b>Assunto</b></label>
				</DD>
			</td>
			<td valign="top">
				<label tabindex="19">Assunto do script encontrado.</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40" valign="top">
				<DD>
					<label tabindex="20"><b>Data</b></label>
				</DD>
			</td>
			<td valign="top">
				<label tabindex="21">Data em que o script foi cadastrado no sistema.</label>
			</td>
		</tr>				
	  </table>
	  
	  <br><br>
	  
	  <table border="0" cellpadding="5" cellspacing="0" align="center" width="100%">		
		<tr>
			<td height="30" colspan="2" valign="top">
				<label tabindex="22"><b>2.1 - Está disponível o recurso de paginaçã com as operações:</b></label>
			</td>
		</tr>			
		<tr>
			<td valign="top" tabindex="23"><%@ include file="../paginacao.jsp" %></td>
		</tr>			
	  </table>
	  
	  <br><br>
	  
	  <table border="0" cellpadding="5" cellspacing="0" align="center" width="100%">		
		<tr>
			<td height="30" colspan="2" valign="top">
				<a name="detalhe"><label tabindex="24"><b>3 - Detalhamento dos Scripts</b></label></a>
			</td>
		</tr>
		<tr>
			<td height="40" colspan="2" valign="top">
				<label tabindex="25">Os campos de detalhe do script são:</label>
			</td>
		</tr>
		<tr>
			<td align="left" height="40" width="150" valign="top">
				<DD><label tabindex="26"><b>Título</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="27">Título e descrição do script selecionado.</label>
			</td>
		</tr>											
		<tr>
			<td height="40" colspan="2" valign="top">
				<label tabindex="28">Está disponível o botão que opera sobre o usuário:</label>
			</td>
		</tr>
		<tr>
			<td align="left" height="40" width="150" valign="top">
				<DD><label tabindex="29"><b>Buscar</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="30">Envia os dados para consulta dos scripts ativos.</label>
			</td>
		</tr>									
		<tr>
			<td align="left" height="40" width="150" valign="top">
				<DD><label tabindex="31"><b>Atende</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="32">Informa ao sistema que aquele script foi utilizado para atender à solicitação do cidadão.</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40" width="150" valign="top">
				<DD><label tabindex="33"><b>Não Atende</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="34">Informa ao sistema que aquele script não serviu para atender à solicitação do cidadão e abre o formulário para que seja gerado um acionamento.</label>
			</td>
		</tr>			
	  </table>
	  
	  
	</td>
	</tr>
	<tr>
	 <td>
		<hr>
		  <p class="voltar"><A title="imprimir esta página" href="javascript:window.print()" tabindex="35">imprimir</A> 
		    . <A title="topo da página" href="javascript:window.location=location.href;" tabindex="36">topo</A>
	 </td>
	</tr>
</table> 	    

	
</body>	

</HTML>