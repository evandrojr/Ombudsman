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
 	<label tabindex=1 id="titulo"><b>Manter Sub-Órgãos</b></label>
 </td>
</tr>
<tr>
 <td align="center"><br>
 	<img src="../../images/ajuda/subOrgaos_1.jpg" tabindex="2" name="imgTela" id="imgTela" alt="Imagem da tela manter sub-órgãos" width="655">
 	<img src="../../images/ajuda/subOrgaos_2.jpg" tabindex="3" name="imgTela" id="imgTela" alt="Imagem da tela manter sub-órgãos" width="655">
 	<img src="../../images/ajuda/subOrgaos_3.jpg" tabindex="4" name="imgTela" id="imgTela" alt="Imagem da tela manter sub-órgãos" width="655">
 	<img src="../../images/ajuda/subOrgaos_4.jpg" tabindex="5" name="imgTela" id="imgTela" alt="Imagem da tela manter sub-órgãos" width="655">
 </td>
</tr>	
<tr>
 <td>
 	<p align="center" class="obrigatorio" tabindex="6"><b>OBS.: O padrão de cores &eacute; meramente ilustrativo.</b></p>
 </td>
</tr>
 <tr><td><br><br></td></tr> 
 <tr>
   <td>
   	<b><label tabindex="7">Funcionalidade</label></b>
   </td>
 </tr>
 <tr>
   <td>
   <DD><label tabindex="8">
   		Possibilita a criação e alteração de sub-orgãos pertencentes a uma ouvidoria cadastrada no sistema.
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
				<a name="lista"><label tabindex="9"><b>1 - Lista de Sub-Órgãos</b></label></a>
			</td>
		</tr>
		<tr>
			<td height="40" colspan="2" valign="top">				
					<label tabindex="10">Local onde são mostrados os sub-órgãos cadastrados no sistema. São presentes os dados:</label>
			</td>
		</tr>
		<tr>
			<td align="left" height="40" valign="top">
				<DD>
					<label tabindex="11"><b>Sub-órgão</b></label>
				</DD>
			</td>
			<td valign="top">
				<label tabindex="12">Lista dos sub-órgãos cadastrados no órgão.</label>
			</td>
		</tr>				
	  </table>
	  
	  <br><br>
	  
	  <table border="0" cellpadding="5" cellspacing="0" align="center" width="100%">		
		<tr>
			<td height="30" colspan="2" valign="top">
				<label tabindex="13"><b>1.1 - Está disponível o recurso de paginaçã com as operações:</b></label>
			</td>
		</tr>			
		<tr>
			<td valign="top" tabindex="14"><%@ include file="../paginacao.jsp" %></td>
		</tr>			
	  </table>
	  
	  <br><br>
	  
	  <table border="0" cellpadding="5" cellspacing="0" align="center" width="100%">		
		<tr>
			<td height="30" colspan="2" valign="top">
				<a name="detalhe"><label tabindex="15"><b>2 - Detalhamento do Sub-Órgão</b></label></a>
			</td>
		</tr>
		<tr>
			<td height="40" colspan="2" valign="top">
				<label tabindex="16">Neste espaço realizam-se operações sobre os Sub-Órgãos. Os campos possíveis para alteração são:</label>
			</td>
		</tr>
		<tr>
			<td align="left" height="40" width="30%" valign="top">
				<DD><label tabindex="17"><b>Sub-órgão</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="18">Campo para digitação do nome do sub-órgão.</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40"  valign="top">
				<DD><label tabindex="19"><b>Data início vigência</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="20">Campos para digitação da data e hora do início de vigência do sub-órgão. A partir dessa data e hora o sub-órgão estará disponível para os usuários no sistema.</label>
			</td>			
		</tr>	
		<tr>
			<td align="left" height="40"  valign="top">
				<DD><label tabindex="21"><b>Data fim vigência</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="22">Campos para digitação da data e hora do fim de vigência do sub-órgão. A partir dessa data e hora o sub-órgão estará indisponível para os usuários no sistema.</label>
			</td>			
		</tr>
	  </table>	  
	  
	  <br><br>
	  
	  <table border="0" cellpadding="5" cellspacing="0" align="center" width="100%">		
		<tr>
			<td height="30" colspan="2" valign="top">
				<a name="listaloca"><label tabindex="23"><b>3 - Lista de Localidades</b></label></a>
			</td>
		</tr>
		<tr>
			<td height="40" colspan="2" valign="top">				
					<label tabindex="24">Local onde são mostrados as localidades cadastradas para cada sub-órgão cadastrados no sistema. São presentes os dados:</label>
			</td>
		</tr>		
		<tr>
			<td align="left" height="40" valign="top">
				<DD>
					<label tabindex="25"><b>Localidades</b></label>
				</DD>
			</td>
			<td valign="top">
				<label tabindex="26">Lista das localidades cadastradas para o sub-órgão selecionado.</label>
			</td>
		</tr>						
	  </table>
	  
	  <br><br>
	  
	  <table border="0" cellpadding="5" cellspacing="0" align="center" width="100%">		
		<tr>
			<td height="30" colspan="2" valign="top">
				<label tabindex="27"><b>3.1 - Está disponível o recurso de paginaçã com as operações:</b></label>
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
				<a name="detalheloca"><label tabindex="29"><b>4 - Detalhamento da Localidade</b></label></a>
			</td>
		</tr>
		<tr>
			<td height="40" colspan="2" valign="top">
				<label tabindex="30">Neste espaço realizam-se operações sobre as localidades. Os campos possíveis para alteração são:</label>
			</td>
		</tr>
		
		<tr>
			<td align="left" height="40"  valign="top">
				<DD><label tabindex="31"><b>Localidade</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="32">Campo para digitação do nome da localidade.</label>
			</td>			
		</tr>
				<tr>
			<td align="left" height="40" valign="top">
				<DD><label tabindex="33"><b>Data de vigência</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="34">Campos para digitação da data e hora do fim de vigência da localidade. A partir dessa data e hora a localidade estará indisponível para os usuários no sistema.</label>
			</td>			
		</tr>
		<tr>				
			<td height="40" colspan="2" valign="top">
				<label tabindex="35">Estao disponíveis os botões que operam sobre o Sub-Órgão:</label>
			</td>
		</tr>
		<tr>
			<td align="left" height="40" width="30%" valign="top">
				<DD><label tabindex="36"><b>Incluir Novo Sub-Órgão</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="37">Abre formulário para inclusão de um novo sub-órgão.</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40"  valign="top">
				<DD><label tabindex="38"><b>Incluir Nova Localidade</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="39">Abre formulário para inclusão de uma nova localidade.</label>
			</td>			
		</tr>	
		<tr>
			<td align="left" height="40"  valign="top">
				<DD><label tabindex="40"><b>Alterar</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="41">Altera os dados do sub-órgão ou da localidade.</label>
			</td>			
		</tr>	
		<tr>
			<td align="left" height="40"  valign="top">
				<DD><label tabindex="42"><b>Salvar</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="43">Registra os dados do sub-órgão ou da localidade.</label>
			</td>			
		</tr>	
		<tr>
			<td align="left" height="40"  valign="top">
				<DD><label tabindex="44"><b>Administrar Localidades</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="45">Abre lista de localidades cadastradas para aquele sub-órgão e o botão para incluir uma nova localidade.</label>
			</td>			
		</tr>	
	  </table>	
	</td>
	</tr>
	<tr>
	 <td>
		<hr>
		  <p class="voltar"><A title="imprimir esta página" href="javascript:window.print()" tabindex="46">imprimir</A> 
		    . <A title="topo da página" href="javascript:window.location=location.href;" tabindex="47">topo</A>
	 </td>
	</tr>
</table> 	    
</body>	
</HTML>