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
 	<label tabindex=1 id="titulo"><b>Banco de Solu��es</b></label>
 </td>
</tr>
<tr>
 <td align="center"><br>
 	<img src="../../images/ajuda/bancoSolucoes_1.jpg" tabindex="2" name="imgTela" id="imgTela" alt="Imagem da tela banco de solu��es">
 	<img src="../../images/ajuda/bancoSolucoes_2.jpg" tabindex="3" name="imgTela" id="imgTela" alt="Imagem da tela banco de solu��es">
 	<img src="../../images/ajuda/bancoSolucoes_3.jpg" tabindex="4" name="imgTela" id="imgTela" alt="Imagem da tela banco de solu��es">
 </td>
</tr>	
<tr>
 <td>
 	<p align="center" class="obrigatorio" tabindex="5"><b>OBS.: O padr�o de cores &eacute; meramente ilustrativo.</b></p>
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
   		Possibilita a consulta �s solu��es disponibilizadas pela ouvidoria para auxiliar na resposta �s mensagens.
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
			<td height="30" colspan="2" valign="top"><a name="busca"><label tabindex="8"><b>1 - Consultar Banco de Solu��es</b></label></a></td>
		</tr>
		<tr>
			<td height="40" colspan="2" valign="top">				
					<label tabindex="9">
					Serve para buscar solu��es espec�ficas dentre as cadastradas, listando apenas as que correspondem ao crit&eacute;rio de busca selecionado.<br>
					Os crit&eacute;rios de busca poss�veis s�o:
					</label>
			</td>
		</tr>
		<tr>
			<td align="left" height="40" width="150" valign="top">
				<DD><label tabindex="10"><b>Palavra-chave</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="11">Campo para digita��o da palavra-chave para busca de solu��es dispon�veis no �rg�o. A palavra-chave ser� buscada no texto e no t�tulo da solu��o.</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40" width="150" valign="top">
				<DD><label tabindex="12"><b>Assunto</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="13">Campo para sele��o de um assunto de mensagem dentre os cadastrados pela ouvidoria.</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40" width="150" valign="top">
				<DD><label tabindex="14"><b>Situa��o</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="15">Campo para a sele��o da situa��o do assunto da solu��o.</label>
			</td>
		</tr>					
		<tr>
		<td align="left" height="40"  valign="top" colspan="3">
			<label tabindex="16">
			Ap�s o fornecimento dos crit&eacute;rios de busca deve-se utilizar o bot�o "Buscar" ou a tecla "Enter", para que o sistema traga as solu��es filtrados.<br>			
			</label>
		</td>					
		</tr>			
	  </table>
	  
	  <br><br>
	  <table border="0" cellpadding="5" cellspacing="0" align="center" width="100%">		
		<tr>
			<td height="30" colspan="2" valign="top">
				<a name="lista"><label tabindex="17"><b>1 - Lista de Banco de Solu��es</b></label></a>
			</td>
		</tr>
		<tr>
			<td height="40" colspan="2" valign="top">				
					<label tabindex="18">Local onde s�o mostradas as solu��es cadastradas no sistema. S�o presentes os dados:</label>
			</td>
		</tr>
		<tr>
			<td align="left" height="40" valign="top">
				<DD>
					<label tabindex="19"><b>Situa��o</b></label>
				</DD>
			</td>
			<td valign="top">
				<label tabindex="20">Situa��o do assunto da solu��o encontrado.</label>
			</td>
		</tr>
		<tr>
			<td align="left" height="40" valign="top">
				<DD>
					<label tabindex="21"><b>Descri��o</b></label>
				</DD>
			</td>
			<td valign="top">
				<label tabindex="22">T�tulo do assunto da solu��o encontrada.</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40" valign="top">
				<DD>
					<label tabindex="22"><b>Data</b></label>
				</DD>
			</td>
			<td valign="top">
				<label tabindex="23">Data em que a solu��o foi cadastrado no sistema.</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40" valign="top">
				<DD>
					<label tabindex="24"><b>Titulo</b></label>
				</DD>
			</td>
			<td valign="top">
				<label tabindex="25">T�tulo da solu��o encontrado.</label>
			</td>
		</tr>						
	  </table>
	  
	  <br><br>
	  
	  <table border="0" cellpadding="5" cellspacing="0" align="center" width="100%">		
		<tr>
			<td height="30" colspan="2" valign="top">
				<label tabindex="26"><b>1.1 - Est� dispon�vel o recurso de pagina�� com as opera��es:</b></label>
			</td>
		</tr>			
		<tr>
			<td valign="top" tabindex="27"><%@ include file="../paginacao.jsp" %></td>
		</tr>			
	  </table>
	  
	  <br><br>
	  
	  <table border="0" cellpadding="5" cellspacing="0" align="center" width="100%">		
		<tr>
			<td height="30" colspan="2" valign="top">
				<a name="detalhe"><label tabindex="28"><b>2 - Detalhamento da Solu��o</b></label></a>
			</td>
		</tr>
		<tr>
			<td height="40" colspan="2" valign="top">
				<label tabindex="29">Os campos para visualiza��o s�o:</label>
			</td>
		</tr>				
		<tr>
			<td align="left" height="40" width="150" valign="top">
				<DD><label tabindex="30"><b>Descri��o</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="31">T�tulo e descri��o da solu��o selecionada.</label>
			</td>
		</tr>			
		<tr>				
			<td height="40" colspan="2" valign="top">
				<label tabindex="32">Estao dispon�veis os bot�es que operam sobre a Solu��o:</label>
			</td>
		</tr>
		<tr>
			<td align="left" height="40" width="150" valign="top">
				<DD><label tabindex="33"><b>Buscar</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="34">Envia os dados para consulta da solu��o.</label>
			</td>
		</tr>			
	  </table>	  
	 	 
	</td>
	</tr>
	<tr>
	 <td>
		<hr>
		  <p class="voltar"><A title="imprimir esta p�gina" href="javascript:window.print()" tabindex="35">imprimir</A> 
		    . <A title="topo da p�gina" href="javascript:window.location=location.href;" tabindex="36">topo</A>
	 </td>
	</tr>
</table> 	    
</body>	
</HTML>