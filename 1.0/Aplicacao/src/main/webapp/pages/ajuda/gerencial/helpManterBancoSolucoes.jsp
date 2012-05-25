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
 	<label tabindex=1 id="titulo"><b>Manter Banco de Solu��es</b></label>
 </td>
</tr>
<tr>
 <td align="center"><br>
 	<img src="../../images/ajuda/manterBancoSolucoes_1.jpg" tabindex="2" name="imgTela" id="imgTela" alt="Imagem da tela manter banco solu��es" width="656">
 	<img src="../../images/ajuda/manterBancoSolucoes_2.jpg" tabindex="3" name="imgTela" id="imgTela" alt="Imagem da tela manter banco solu��es">
 	<img src="../../images/ajuda/manterBancoSolucoes_3.jpg" tabindex="4" name="imgTela" id="imgTela" alt="Imagem da tela manter banco solu��es">
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
   		Possibilita a consulta e manuten��o das solu��es cadastradas no sistema.
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
			<td height="30" colspan="2" valign="top"><a name="busca"><label tabindex="9"><b>1 - Consultar Solu��o</b></label></a></td>
		</tr>
		<tr>
			<td height="40" colspan="2" valign="top">				
					<label tabindex="10">
					Serve para buscar solu��es espec�ficas dentre as cadastradas, listando apenas as que correspondem ao crit&eacute;rio de busca selecionado.<br>
					Os crit&eacute;rios de busca poss�veis s�o:
					</label>
			</td>
		</tr>
		<tr>
			<td align="left" height="40" width="150" valign="top">
				<DD><label tabindex="11">Tipo de Assunto</label></DD>
			</td>
			<td valign="top">
				<label tabindex="12">Campo para sele��o de um assunto de mensagem dentre os cadastrados pela ouvidoria.</label>
			</td>
		</tr>			
		<tr>
			<td align="left" height="40" width="150" valign="top">
				<DD><label tabindex="11">Palavra-chave</label></DD>
			</td>
			<td valign="top">
				<label tabindex="12">Ser� comparada com o conte&uacute;do do nome e da descri��o das solu��es dispon�veis.</label>
			</td>
		</tr>	
		<tr>
		<td align="left" height="40"  valign="top" colspan="3">
			<label tabindex="13">
			Ap�s o fornecimento dos crit&eacute;rios de busca deve-se utilizar o bot�o "Buscar" ou a tecla "Enter", para que o sistema traga as solu��es filtrados.<br>
			O bot�o "Nova Solu��o" permite que sejam incluidas novas solu��es no banco.
			</label>
		</td>					
		</tr>			
	  </table>
	  
	  <br><br>
	  <table border="0" cellpadding="5" cellspacing="0" align="center" width="100%">		
		<tr>
			<td height="30" colspan="2" valign="top">
				<a name="lista"><label tabindex="8"><b>1 - Lista de Solu��es</b></label></a>
			</td>
		</tr>
		<tr>
			<td height="40" colspan="2" valign="top">				
					<label tabindex="9">Local onde s�o mostradas as solu��es cadastradas no sistema. S�o presentes os dados:</label>
			</td>
		</tr>
		<tr>
			<td align="left" height="40" valign="top">
				<DD>
					<label tabindex="10"><b>Solu��o</b></label>
				</DD>
			</td>
			<td valign="top">
				<label tabindex="11">T�tulo e n&uacute;mero de registro das solu��es encontradas.</label>
			</td>
		</tr>					
	  </table>
	  
	  <br><br>
	  
	  <table border="0" cellpadding="5" cellspacing="0" align="center" width="100%">		
		<tr>
			<td height="30" colspan="2" valign="top">
				<label tabindex="12"><b>1.1 - Est� dispon�vel o recurso de pagina�� com as opera��es:</b></label>
			</td>
		</tr>			
		<tr>
			<td valign="top" tabindex="13"><%@ include file="../paginacao.jsp" %></td>
		</tr>			
	  </table>
	  
	  <br><br>
	  
	  <table border="0" cellpadding="5" cellspacing="0" align="center" width="100%">		
		<tr>
			<td height="30" colspan="2" valign="top">
				<a name="detalhe"><label tabindex="14"><b>2 - Detalhamento da Solu��o</b></label></a>
			</td>
		</tr>
		<tr>
			<td height="40" colspan="2" valign="top">
				<label tabindex="15">Neste espa�o realizam-se opera��es sobre as Solu��es. As opera��es poss�veis s�o:</label>
			</td>
		</tr>
		<tr>
			<td align="left" height="40" width="150" valign="top">
				<DD><label tabindex="16"><b>Inclus�o</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="17">Cria��o de nova Solu��o.</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40" width="150" valign="top">
				<DD><label tabindex="18"><b>Altera��o</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="19">Altera��o dos dados da solu��o j� existente</label>
			</td>			
		</tr>	
		<tr>
			<td align="left" height="40" width="150" valign="top">
				<DD><label tabindex="18"><b>Exclus�o</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="19">A exclus�o da solu��o &eacute; feita no momento em que o campo Data de Vig�ncia &eacute; preenchido.</label>
			</td>			
		</tr>	
		<tr>				
			<td height="40" colspan="2" valign="top">
				<label tabindex="20">Os dados dispon�veis para a altera��o s�o:</label>
			</td>
		</tr>
		<tr>
			<td align="left" height="40" width="150" valign="top">
				<DD><label tabindex="21"><b>Tipo Assunto</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="22">Campo para sele��o de um assunto de mensagem dentre os cadastrados pela ouvidoria.</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40" width="150" valign="top">
				<DD><label tabindex="21"><b>Vig�ncia</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="22">Campo para digita��o da data e hora do fim da vig�ncia da solu��o.</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40" width="150" valign="top">
				<DD><label tabindex="21"><b>Identifica��o</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="22">Campo para digita��o do t�tulo de identifica��o da solu��o.</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40" width="150" valign="top">
				<DD><label tabindex="21"><b>Texto</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="22">Campo para digita��o do texto da solu��o.</label>
			</td>
		</tr>	
		<tr>				
			<td height="40" colspan="2" valign="top">
				<label tabindex="20">Estao dispon�veis os bot�es que operam sobre o Script:</label>
			</td>
		</tr>
		<tr>
			<td align="left" height="40" width="150" valign="top">
				<DD><label tabindex="21"><b>Buscar</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="22">Envia os dados para consulta da solu��o.</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40" width="150" valign="top">
				<DD><label tabindex="23"><b>Nova Solu��o</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="24">Abre formul�rio para inclus�o de uma nova solu��o.</label>
			</td>			
		</tr>	
		<tr>
			<td align="left" height="40" width="150" valign="top">
				<DD><label tabindex="23"><b>Alterar</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="24">Grava as altera��es realizadas na solu��o.</label>
			</td>			
		</tr>
		<tr>
			<td align="left" height="40" width="150" valign="top">
				<DD><label tabindex="23"><b>Incluir</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="24">Inclui a solu��o.</label>
			</td>			
		</tr>
	  </table>	  
	 	 
	</td>
	</tr>
	<tr>
	 <td>
		<hr>
		  <p class="voltar"><A title="imprimir esta p�gina" href="javascript:window.print()" tabindex="27">imprimir</A> 
		    . <A title="topo da p�gina" href="javascript:window.location=location.href;" tabindex="28">topo</A>
	 </td>
	</tr>
</table> 	    

	
</body>	

</HTML>