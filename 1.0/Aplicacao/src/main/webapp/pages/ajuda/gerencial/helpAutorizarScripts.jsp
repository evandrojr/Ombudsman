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
 	<label tabindex=1 id="titulo"><b>Autorizar Scripts</b></label>
 </td>
</tr>
<tr>
 <td align="center"><br>
 	<img src="../../images/ajuda/autorizarScripts_1.jpg" tabindex="2" name="imgTela" id="imgTela" alt="Imagem da tela autorizar scripts" width="655">
 	<img src="../../images/ajuda/autorizarScripts_2.jpg" tabindex="3" name="imgTela" id="imgTela" alt="Imagem da tela autorizar scripts" width="655">
 	<img src="../../images/ajuda/autorizarScripts_3.jpg" tabindex="4" name="imgTela" id="imgTela" alt="Imagem da tela autorizar scripts" width="655">
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
   		Possibilita a autoriza��o ou n�o da publica��o de um script que foi criado no sistema.
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
				<a name="lista"><label tabindex="8"><b>1 - Lista de Scripts</b></label></a>
			</td>
		</tr>
		<tr>
			<td height="40" colspan="2" valign="top">				
					<label tabindex="9">Local onde s�o mostrados os scripts cadastrados no sistema. S�o presentes os dados:</label>
			</td>
		</tr>
		<tr>
			<td align="left" height="40" valign="top">
				<DD>
					<label tabindex="10"><b>Script</b></label>
				</DD>
			</td>
			<td valign="top">
				<label tabindex="11">T�tulo dos scripts pendentes de aprova��o</label>
			</td>
		</tr>					
	  </table>
	  <br><br>
	  <table border="0" cellpadding="5" cellspacing="0" align="center" width="100%">		
		<tr>
			<td height="30" colspan="2" valign="top">
				<label tabindex="12"><b>1.1 - Est� dispon�vel o recurso de pagina��o com as opera��es:</b></label>
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
				<a name="detalhe"><label tabindex="14"><b>2 - Detalhamento do Script</b></label></a>
			</td>
		</tr>
		<tr>
			<td height="40" colspan="2" valign="top">
				<label tabindex="15">Neste espa�o realizam-se opera��es sobre os Scripts. As opera��es poss�veis s�o:</label>
			</td>
		</tr>
		<tr>
			<td align="left" height="40" width="150" valign="top">
				<DD><label tabindex="16"><b>Aprovar</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="17">Aprova o script, tornando-o dispon�vel para utiliza��o no sistema.</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40" width="150" valign="top">
				<DD><label tabindex="18"><b>Reprovar</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="19">Reprova o script, fazendo-o retornar ao gestor de conte&uacute;do para que seja reescrito.</label>
			</td>			
		</tr>	
		<tr>				
			<td height="40" colspan="2" valign="top">
				<label tabindex="20">Estao dispon�veis os bot�es que operam sobre o Script:</label>
			</td>
		</tr>
		<tr>
			<td align="left" height="40" width="150" valign="top">
				<DD><label tabindex="21"><b>Aprovar</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="22">Aprova o script, tornando-o dispon�vel para utiliza��o no sistema.</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40" width="150" valign="top">
				<DD><label tabindex="23"><b>Reprovar</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="24">Reprova o script, fazendo-o retornar ao gestor de conte&uacute;do para que seja reescrito.</label>
			</td>			
		</tr>	
	  </table>	  
	  <br><br>
	  <table border="0" cellpadding="5" cellspacing="0" align="center" width="100%">		
		<tr>
			<td height="30" colspan="2" valign="top">
				<a name="reprovar"><label tabindex="25"><b>3 - Reprovar Script</b></label></a>
			</td>
		</tr>
		<tr>
			<td height="40" colspan="2" valign="top">
				<label tabindex="26">Ao clicar no bot�o REPROVAR, ser� exibido o detalhe do Script e mais um campo onde o usu�rio poder� descrever o motivo da reprova��o.</label>
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