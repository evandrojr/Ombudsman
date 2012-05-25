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
 	<label tabindex=1 id="titulo"><b>Manter Sub-�rg�os</b></label>
 </td>
</tr>
<tr>
 <td align="center"><br>
 	<img src="../../images/ajuda/subOrgaos_1.jpg" tabindex="2" name="imgTela" id="imgTela" alt="Imagem da tela manter sub-�rg�os" width="655">
 	<img src="../../images/ajuda/subOrgaos_2.jpg" tabindex="3" name="imgTela" id="imgTela" alt="Imagem da tela manter sub-�rg�os" width="655">
 	<img src="../../images/ajuda/subOrgaos_3.jpg" tabindex="4" name="imgTela" id="imgTela" alt="Imagem da tela manter sub-�rg�os" width="655">
 	<img src="../../images/ajuda/subOrgaos_4.jpg" tabindex="5" name="imgTela" id="imgTela" alt="Imagem da tela manter sub-�rg�os" width="655">
 </td>
</tr>	
<tr>
 <td>
 	<p align="center" class="obrigatorio" tabindex="6"><b>OBS.: O padr�o de cores &eacute; meramente ilustrativo.</b></p>
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
   		Possibilita a cria��o e altera��o de sub-org�os pertencentes a uma ouvidoria cadastrada no sistema.
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
				<a name="lista"><label tabindex="9"><b>1 - Lista de Sub-�rg�os</b></label></a>
			</td>
		</tr>
		<tr>
			<td height="40" colspan="2" valign="top">				
					<label tabindex="10">Local onde s�o mostrados os sub-�rg�os cadastrados no sistema. S�o presentes os dados:</label>
			</td>
		</tr>
		<tr>
			<td align="left" height="40" valign="top">
				<DD>
					<label tabindex="11"><b>Sub-�rg�o</b></label>
				</DD>
			</td>
			<td valign="top">
				<label tabindex="12">Lista dos sub-�rg�os cadastrados no �rg�o.</label>
			</td>
		</tr>				
	  </table>
	  
	  <br><br>
	  
	  <table border="0" cellpadding="5" cellspacing="0" align="center" width="100%">		
		<tr>
			<td height="30" colspan="2" valign="top">
				<label tabindex="13"><b>1.1 - Est� dispon�vel o recurso de pagina�� com as opera��es:</b></label>
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
				<a name="detalhe"><label tabindex="15"><b>2 - Detalhamento do Sub-�rg�o</b></label></a>
			</td>
		</tr>
		<tr>
			<td height="40" colspan="2" valign="top">
				<label tabindex="16">Neste espa�o realizam-se opera��es sobre os Sub-�rg�os. Os campos poss�veis para altera��o s�o:</label>
			</td>
		</tr>
		<tr>
			<td align="left" height="40" width="30%" valign="top">
				<DD><label tabindex="17"><b>Sub-�rg�o</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="18">Campo para digita��o do nome do sub-�rg�o.</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40"  valign="top">
				<DD><label tabindex="19"><b>Data in�cio vig�ncia</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="20">Campos para digita��o da data e hora do in�cio de vig�ncia do sub-�rg�o. A partir dessa data e hora o sub-�rg�o estar� dispon�vel para os usu�rios no sistema.</label>
			</td>			
		</tr>	
		<tr>
			<td align="left" height="40"  valign="top">
				<DD><label tabindex="21"><b>Data fim vig�ncia</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="22">Campos para digita��o da data e hora do fim de vig�ncia do sub-�rg�o. A partir dessa data e hora o sub-�rg�o estar� indispon�vel para os usu�rios no sistema.</label>
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
					<label tabindex="24">Local onde s�o mostrados as localidades cadastradas para cada sub-�rg�o cadastrados no sistema. S�o presentes os dados:</label>
			</td>
		</tr>		
		<tr>
			<td align="left" height="40" valign="top">
				<DD>
					<label tabindex="25"><b>Localidades</b></label>
				</DD>
			</td>
			<td valign="top">
				<label tabindex="26">Lista das localidades cadastradas para o sub-�rg�o selecionado.</label>
			</td>
		</tr>						
	  </table>
	  
	  <br><br>
	  
	  <table border="0" cellpadding="5" cellspacing="0" align="center" width="100%">		
		<tr>
			<td height="30" colspan="2" valign="top">
				<label tabindex="27"><b>3.1 - Est� dispon�vel o recurso de pagina�� com as opera��es:</b></label>
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
				<label tabindex="30">Neste espa�o realizam-se opera��es sobre as localidades. Os campos poss�veis para altera��o s�o:</label>
			</td>
		</tr>
		
		<tr>
			<td align="left" height="40"  valign="top">
				<DD><label tabindex="31"><b>Localidade</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="32">Campo para digita��o do nome da localidade.</label>
			</td>			
		</tr>
				<tr>
			<td align="left" height="40" valign="top">
				<DD><label tabindex="33"><b>Data de vig�ncia</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="34">Campos para digita��o da data e hora do fim de vig�ncia da localidade. A partir dessa data e hora a localidade estar� indispon�vel para os usu�rios no sistema.</label>
			</td>			
		</tr>
		<tr>				
			<td height="40" colspan="2" valign="top">
				<label tabindex="35">Estao dispon�veis os bot�es que operam sobre o Sub-�rg�o:</label>
			</td>
		</tr>
		<tr>
			<td align="left" height="40" width="30%" valign="top">
				<DD><label tabindex="36"><b>Incluir Novo Sub-�rg�o</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="37">Abre formul�rio para inclus�o de um novo sub-�rg�o.</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40"  valign="top">
				<DD><label tabindex="38"><b>Incluir Nova Localidade</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="39">Abre formul�rio para inclus�o de uma nova localidade.</label>
			</td>			
		</tr>	
		<tr>
			<td align="left" height="40"  valign="top">
				<DD><label tabindex="40"><b>Alterar</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="41">Altera os dados do sub-�rg�o ou da localidade.</label>
			</td>			
		</tr>	
		<tr>
			<td align="left" height="40"  valign="top">
				<DD><label tabindex="42"><b>Salvar</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="43">Registra os dados do sub-�rg�o ou da localidade.</label>
			</td>			
		</tr>	
		<tr>
			<td align="left" height="40"  valign="top">
				<DD><label tabindex="44"><b>Administrar Localidades</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="45">Abre lista de localidades cadastradas para aquele sub-�rg�o e o bot�o para incluir uma nova localidade.</label>
			</td>			
		</tr>	
	  </table>	
	</td>
	</tr>
	<tr>
	 <td>
		<hr>
		  <p class="voltar"><A title="imprimir esta p�gina" href="javascript:window.print()" tabindex="46">imprimir</A> 
		    . <A title="topo da p�gina" href="javascript:window.location=location.href;" tabindex="47">topo</A>
	 </td>
	</tr>
</table> 	    
</body>	
</HTML>