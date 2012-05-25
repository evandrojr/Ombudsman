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
 	<label tabindex=1 id="titulo"><b>Consultar Mensagens por Responsabilidade</b></label>
 </td>
</tr>
<tr>
 <td align="center"><br>
 	<img src="../../images/ajuda/mensagensResponsabilidade_1.jpg" tabindex="2" name="imgTela" id="imgTela" alt="Imagem da tela de consultar mensagens por responsabilidade">
 	<img src="../../images/ajuda/mensagensResponsabilidade_2.jpg" tabindex="3" name="imgTela" id="imgTela" alt="Imagem da tela de consultar mensagens por responsabilidade">
 </td>
</tr>	
<tr>
 <td>
 	<p align="center" class="obrigatorio" tabindex="4"><b>OBS.: O padr�o de cores &eacute; meramente ilustrativo.</b></p>
 </td>
</tr>
 <tr><td><br><br></td></tr> 
 <tr>
   <td>
   	<b><label tabindex="5">Funcionalidade</label></b>
   </td>
 </tr>
 <tr>
   <td>
   <DD><label tabindex="6">
   		Possibilita a consulta �s mensagens sob sua responsabilidade
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
			<td height="30" colspan="2" valign="top"><a name="busca"><label tabindex="7"><b>1 - Mensagens Sob Sua Responsabilidade</b></label></a></td>
		</tr>
		<tr>
			<td height="40" colspan="2" valign="top">				
					<label tabindex="8">
					Serve para buscar mensagens dentre as cadastradas, listando apenas as que correspondem ao crit&eacute;rio de busca selecionado.<br>
					Os crit&eacute;rios de busca poss�veis s�o:
					</label>
			</td>
		</tr>
		
		<tr>
			<td align="left" height="40" width="30%" valign="top">
				<DD><label tabindex="9"><b>Estados</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="10">Campos para sele��o dos estados de mensagens que ser�o consultados.</label>
			</td>
		</tr>
		<tr>
			<td align="left" height="40" width="30%" valign="top">
				<DD><label tabindex="11"><b>Per�odo</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="12">Campo para digita��o do per�odo em que se deseja realizar a busca. Devem ser digitadas a data inicial e final do per�odo.</label>
			</td>
		</tr>
		<tr>
			<td align="left" height="40" width="30%" valign="top">
				<DD><label tabindex="13"><b>Tipo de Mensagem</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="14">Campo para sele��o de um tipo de mensagem dentre os cadastrados pela ouvidoria.</label>
			</td>
		</tr>
		<tr>
			<td align="left" height="40" width="30%" valign="top">
				<DD><label tabindex="15"><b>Assunto</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="16">Campo para sele��o de um assunto de mensagem dentre os cadastrados pela ouvidoria.</label>
			</td>
		</tr>
		<tr>
			<td align="left" height="40" width="30%" valign="top">
				<DD><label tabindex="17"><b>T�tulo</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="18">Campo para digita��o de palavras-chave a serem pesquisadas nos t�tulos das mensagens. </label>
			</td>
		</tr>
					
		<tr>
		<td align="left" height="40"  valign="top" colspan="3">
			<label tabindex="19">
			Ap�s o fornecimento dos crit&eacute;rios de busca deve-se utilizar o bot�o "Buscar" ou a tecla "Enter", para que o sistema traga as mensagens encontradas.<br>			
			</label>
		</td>					
		</tr>			
	  </table>
	  
	  <br><br>
	  <table border="0" cellpadding="5" cellspacing="0" align="center" width="100%">		
		<tr>
			<td height="30" colspan="2" valign="top">
				<a name="lista"><label tabindex="20"><b>2 - Listar Mensagens Sob Sua Responsabilidade</b></label></a>
			</td>
		</tr>
		<tr>
			<td height="40" colspan="2" valign="top">				
					<label tabindex="21">Local onde s�o mostradas as mensagens sob sua responsabilidade cadastradas no sistema. S�o presentes os dados:</label>
			</td>
		</tr>
		<tr>
			<td align="left" height="40" valign="top">
				<DD>
					<label tabindex="22"><b>Protocolo</b></label>
				</DD>
			</td>
			<td valign="top">
				<label tabindex="23">Protocolo da mensagem encontrada.</label>
			</td>
		</tr>
		<tr>
			<td align="left" height="40" valign="top">
				<DD>
					<label tabindex="24"><b>T�tulo</b></label>
				</DD>
			</td>
			<td valign="top">
				<label tabindex="25">T�tulo da mensagem encontrada.</label>
			</td>
		</tr>
		<tr>
			<td align="left" height="40" valign="top">
				<DD>
					<label tabindex="26"><b>Tipo da Mensagem</b></label>
				</DD>
			</td>
			<td valign="top">
				<label tabindex="27">Tipo da mensagem encontrada.</label>
			</td>
		</tr>
		<tr>
			<td align="left" height="40" valign="top">
				<DD>
					<label tabindex="28"><b>Assunto</b></label>
				</DD>
			</td>
			<td valign="top">
				<label tabindex="29">Assunto da mensagem encontrada.</label>
			</td>
		</tr>
		<tr>
			<td align="left" height="40" valign="top">
				<DD>
					<label tabindex="30"><b>Prazo</b></label>
				</DD>
			</td>
			<td valign="top">
				<label tabindex="31">Prazo interno para responder � mensagem encontrada.</label>
			</td>
		</tr>
		<tr>
			<td align="left" height="40" valign="top">
				<DD>
					<label tabindex="32"><b>Situa��o</b></label>
				</DD>
			</td>
			<td valign="top">
				<label tabindex="33">Situa��o atual da mensagem encontrada.</label>
			</td>
		</tr>
	  </table>
	  <br><br>
	  <table border="0" cellpadding="5" cellspacing="0" align="center" width="100%">		
		<tr>
			<td height="30" colspan="2" valign="top">
				<label tabindex="34"><b>2.1 - Est� dispon�vel o recurso de pagina�� com as opera��es:</b></label>
			</td>
		</tr>			
		<tr>
			<td valign="top" tabindex="35"><%@ include file="../paginacao.jsp" %></td>
		</tr>			
	  </table>	
   	  <br><br>
	  <table border="0" cellpadding="5" cellspacing="0" align="center" width="100%">		
		<tr>				
			<td height="40" colspan="2" valign="top">
				<label tabindex="36">Estao dispon�veis os bot�es que operam sobre a Mensagem:</label>
			</td>
		</tr>
		<tr>
			<td align="left" height="40" width="150" valign="top">
				<DD><label tabindex="37"><b>Buscar</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="38">Envia os dados para consulta da resposta.</label>
			</td>
		</tr>		
	  </table>	
	<br><br>
	  <table border="0" cellpadding="5" cellspacing="0" align="center" width="100%">		
		<tr>				
			<td height="40" colspan="2" valign="top">
				<label tabindex="36"><b>3 - T�picos Relacionados:</b></label>
			</td>
		</tr>
		<tr>
			<td align="left" height="40" valign="top" colspan="2">
				<DD><A title="Responder Mensagem" href="helpResponderMensagem.jsp" tabindex="39">Responder Mensagem</A></DD>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40" valign="top" colspan="2">
				<DD><A title="Redirecionar Mensagem" href="helpRedirecionarMensagem.jsp" tabindex="39">Redirecionar Mensagem</A></DD>
			</td>
		</tr>		
		<tr>
			<td align="left" height="40" valign="top" colspan="2">
				<DD><A title="Reclassificar Mensagem" href="helpReclassificarMensagem.jsp" tabindex="39">Reclassificar Mensagem</A></DD>
			</td>
		</tr>
	  </table>	
	
	</td>
	</tr>
	<tr>
	 <td>
		<hr>
		  <p class="voltar"><A title="imprimir esta p�gina" href="javascript:window.print()" tabindex="39">imprimir</A> 
		    . <A title="topo da p�gina" href="javascript:window.location=location.href;" tabindex="40">topo</A>
	 </td>
	</tr>
</table> 	    
	
</body>	

</HTML>