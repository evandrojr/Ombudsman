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
 	<label tabindex=1 id="titulo"><b>Utiliza��o de Scripts</b></label>
 </td>
</tr>
<tr>
 <td align="center"><br>
 	<img src="../../images/ajuda/utilizacaoScripts_1.jpg" tabindex="2" name="imgTela" id="imgTela" alt="Imagem da tela visualizar scripts">
 	<img src="../../images/ajuda/utilizacaoScripts_2.jpg" tabindex="3" name="imgTela" id="imgTela" alt="Imagem da tela visualizar scripts"> 	
 	<img src="../../images/ajuda/utilizacaoScripts_3.jpg" tabindex="4" name="imgTela" id="imgTela" alt="Imagem da tela visualizar scripts"> 	 	
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
   		Possibilita a consulta e manuten��o dos scripts cadastrados no sistema.
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
					Serve para buscar os Scripts espec�ficos dentre os cadastrados, listando apenas os que correspondem ao crit&eacute;rio de busca selecionado.<br>
					Os crit&eacute;rios de busca poss�veis s�o:
					</label>
			</td>
		</tr>
		<tr>
			<td align="left" height="40" width="150" valign="top">
				<DD><label tabindex="10"><b>Tipo de Assunto</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="11">Campo para sele��o de um assunto de mensagem dentre os cadastrados pela ouvidoria.</label>
			</td>
		</tr>
		<tr>
			<td align="left" height="40" width="150" valign="top">
				<DD><label tabindex="12"><b>Estado do Script</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="13">Campo para sele��o do estado do script.</label>
			</td>
		</tr>		
		<tr>
			<td align="left" height="40" width="150" valign="top">
				<DD><label tabindex="14"><b>Palavra-chave</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="15">Ser� comparada com o conte&uacute;do do nome e da descri��o dos scripts dispon�veis.</label>
			</td>
		</tr>	
		<tr>
		<td align="left" height="40"  valign="top" colspan="3">
			<label tabindex="16">
			Ap�s o fornecimento dos crit&eacute;rios de busca deve-se utilizar o bot�o "Buscar" ou a tecla "Enter", para que o sistema traga os Scripts filtrados.<br>
			O bot�o "Novo Script" permite que sejam incluidos novos Scripts no banco.
			</label>
		</td>					
		</tr>		
	  </table>
	  <br><br>
	  <table border="0" cellpadding="5" cellspacing="0" align="center" width="100%">		
		<tr>
			<td height="30" colspan="2" valign="top">
				<a name="lista"><label tabindex="17"><b>2 - Lista de Scripts</b></label></a>
			</td>
		</tr>
		<tr>
			<td height="40" colspan="2" valign="top">				
					<label tabindex="18">Local onde s�o mostrados os scripts cadastrados no sistema. S�o presentes os dados:</label>
			</td>
		</tr>
		<tr>
			<td align="left" height="40" valign="top">
				<DD>
					<label tabindex="19"><b>T�tulo</b></label>
				</DD>
			</td>
			<td valign="top">
				<label tabindex="20">T�tulo e n&uacute;mero de registro dos scripts encontrados.</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40" valign="top">
				<DD>
					<label tabindex="21"><b>Estado</b></label>
				</DD>
			</td>
			<td valign="top">
				<label tabindex="22">Estado dos scripts encontrados.</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40" valign="top">
				<DD>
					<label tabindex="23"><b>Qtd Utiliza��o</b></label>
				</DD>
			</td>
			<td valign="top">
				<label tabindex="24">Quantidade de vezes que o script j� atendeu a uma solicita��o.</label>
			</td>
		</tr>				
	  </table>
	  <br><br>
	  <table border="0" cellpadding="5" cellspacing="0" align="center" width="100%">		
		<tr>
			<td height="30" colspan="2" valign="top">
				<label tabindex="25"><b>2.1 - Est� dispon�vel o recurso de pagina�� com as opera��es:</b></label>
			</td>
		</tr>			
		<tr>
			<td valign="top" tabindex="26"><%@ include file="../paginacao.jsp" %></td>
		</tr>			
	  </table>
	  <br><br>
	  <table border="0" cellpadding="5" cellspacing="0" align="center" width="100%">		
		<tr>
			<td height="30" colspan="2" valign="top">
				<a name="detalhe"><label tabindex="27"><b>3 - Detalhamento dos Scripts</b></label></a>
			</td>
		</tr>		
		<tr>
			<td align="left" height="40" width="150" valign="top">
				<DD><label tabindex="28"><b>Tipo de Assunto</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="29">Campo para digita��o do tipo de assunto de mensagem</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40" width="150" valign="top">
				<DD><label tabindex="30"><b>Identifica��o</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="31">Campo para digita��o do t�tulo de identifica��o do script.</label>
			</td>
		</tr>			
		<tr>
			<td align="left" height="40" width="150" valign="top">
				<DD><label tabindex="32"><b>Texto</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="33">Campo para digita��o do texto do script.</label>
			</td>
		</tr>									
		<tr>
			<td height="40" colspan="2" valign="top">
				<label tabindex="34">Est� dispon�vel o bot�o que opera sobre o usu�rio:</label>
			</td>
		</tr>
		<tr>
			<td align="left" height="40" width="150" valign="top">
				<DD><label tabindex="35"><b>Buscar</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="36">Envia os dados para consulta do script.</label>
			</td>
		</tr>											
	  </table>
	</td>
	</tr>
	<tr>
	 <td>
		<hr>
		  <p class="voltar"><A title="imprimir esta p�gina" href="javascript:window.print()" tabindex="37">imprimir</A> 
		    . <A title="topo da p�gina" href="javascript:window.location=location.href;" tabindex="38">topo</A>
	 </td>
	</tr>
</table> 	    
</body>	
</HTML>