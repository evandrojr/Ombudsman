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
 	<label tabindex=1 id="titulo"><b>Listas de E-mails</b></label>
 </td>
</tr>
<tr>
 <td align="center"><br>
 	<img src="../../images/ajuda/listaEmails_1.jpg" tabindex="2" name="imgTela" id="imgTela" alt="Imagem da tela de listas de e-mails" width=660>
 	<img src="../../images/ajuda/listaEmails_2.jpg" tabindex="3" name="imgTela" id="imgTela" alt="Imagem da tela de listas de e-mails" width=660>
 	<img src="../../images/ajuda/listaEmails_3.jpg" tabindex="4" name="imgTela" id="imgTela" alt="Imagem da tela de listas de e-mails" width=660>
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
   		Possibilita a manuten��o de listas de e-mail para a distribui��o dos boletins cadastrados no sistema.
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
			<td height="30" colspan="2" valign="top"><a name="busca"><label tabindex="9"><b>1 - Consultar Lista de Boletins</b></label></a></td>
		</tr>
		<tr>
			<td height="40" colspan="2" valign="top">				
					<label tabindex="10">
					Serve para buscar os grupos de emails espec�ficos dentre os cadastrados, listando apenas as que correspondem ao crit&eacute;rio de busca selecionado.<br>
					Os crit&eacute;rios de busca poss�veis s�o:
					</label>
			</td>
		</tr>
		<tr>
			<td align="left" height="40" width="30%" valign="top">
				<DD><label tabindex="11"><b>Per�odo</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="12">Campo para digita��o do per�odo em que se deseja realizar a busca. Devem ser digitadas as datas inicial e final do per�odo.</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40" width="150" valign="top">
				<DD><label tabindex="13"><b>Palavra-chave</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="14">Campo para digita��o da palavra-chave para busca de grupos de e-mails dispon�veis no �rg�o. A palavra-chave ser� buscada nos nomes dos grupos e nos e-mails.</label>
			</td>
		</tr>							
		<tr>
		<td align="left" height="40"  valign="top" colspan="3">
			<label tabindex="17">
			Ap�s o fornecimento dos crit&eacute;rios de busca deve-se utilizar o bot�o "Buscar" ou a tecla "Enter", para que o sistema traga os boletins filtrados.<br>			
			</label>
		</td>					
		</tr>			
	  </table>
	  
	  <br><br>
	  <table border="0" cellpadding="5" cellspacing="0" align="center" width="100%">		
		<tr>
			<td height="30" colspan="2" valign="top">
				<a name="lista"><label tabindex="18"><b>2 - Listar Grupos de E-mails</b></label></a>
			</td>
		</tr>
		<tr>
			<td height="40" colspan="2" valign="top">				
					<label tabindex="19">Local onde s�o mostradas os grupos de e-mails cadastrados no sistema. S�o presentes os dados:</label>
			</td>
		</tr>				
		<tr>
			<td align="left" height="40" valign="top">
				<DD>
					<label tabindex="20"><b>Nome do Grupo</b></label>
				</DD>
			</td>
			<td valign="top">
				<label tabindex="21">Nome do grupo de e-mails encontrado.</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40" valign="top">
				<DD>
					<label tabindex="22"><b>Data de Cria��o</b></label>
				</DD>
			</td>
			<td valign="top">
				<label tabindex="23">Data de cria��o do grupo de e-mails encontrado.</label>
			</td>
		</tr>				
	  </table>
	  
	  <br><br>
	  
	  <table border="0" cellpadding="5" cellspacing="0" align="center" width="100%">		
		<tr>
			<td height="30" colspan="2" valign="top">
				<label tabindex="26"><b>2.1 - Est� dispon�vel o recurso de pagina�� com as opera��es:</b></label>
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
				<a name="detalhe"><label tabindex="28"><b>3 - Detalhamento do grupo de e-mail</b></label></a>
			</td>
		</tr>
		<tr>
			<td height="40" colspan="2" valign="top">
				<label tabindex="29">Os campos dispon�veis para visualiza��o s�o:</label>
			</td>
		</tr>							
		<tr>
			<td align="left" height="40" width="150" valign="top">
				<DD><label tabindex="30"><b>Identifica��o</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="31">Campo para digita��o do nome do grupo de e-mails selecionado.</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40" width="150" valign="top">
				<DD><label tabindex="32"><b>Listas de e-mails</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="33">Campo para digita��o dos e-mails do grupo de e-mails selecionado.</label>
			</td>
		</tr>	
		<tr>				
			<td height="40" colspan="2" valign="top">
				<label tabindex="33">Estao dispon�veis os bot�es que operam sobre os grupos de e-mails:</label>
			</td>
		</tr>
		<tr>
			<td align="left" height="40" width="150" valign="top">
				<DD><label tabindex="34"><b>Novo Grupo</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="35">Abre formul�rio para inclus�o de um novo grupo de e-mails.</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40" width="150" valign="top">
				<DD><label tabindex="34"><b>Buscar</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="35">Envia os dados para consulta dos grupos de e-mails cadastrados.</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40" width="150" valign="top">
				<DD><label tabindex="34"><b>Alterar</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="35">Altera o grupo de e-mails selecionado.</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40" width="150" valign="top">
				<DD><label tabindex="34"><b>Excluir</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="35">Exclui o grupo de e-mails selecionado.</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40" width="150" valign="top">
				<DD><label tabindex="34"><b>Incluir</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="35">Inclui o novo grupo de e-mails.</label>
			</td>
		</tr>	
	  </table>	  	 
	</td>
	</tr>
	<tr>
	 <td>
		<hr>
		  <p class="voltar"><A title="imprimir esta p�gina" href="javascript:window.print()" tabindex="61">imprimir</A> 
		    . <A title="topo da p�gina" href="javascript:window.location=location.href;" tabindex="62">topo</A>
	 </td>
	</tr>
</table> 	    
</body>	
</HTML>