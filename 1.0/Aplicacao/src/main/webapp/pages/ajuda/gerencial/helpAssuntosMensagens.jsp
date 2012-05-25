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
 	<label tabindex=1 id="titulo"><b>Tipos de Assunto</b></label>
 </td>
</tr>
<tr>
 <td align="center"><br>
 	<img src="../../images/ajuda/assuntosMensagem_1.jpg" tabindex="2" name="imgTela" id="imgTela" alt="Imagem da tela assuntos de mensagens" width="655">
 	<img src="../../images/ajuda/assuntosMensagem_2.jpg" tabindex="3" name="imgTela" id="imgTela" alt="Imagem da tela assuntos de mensagens" width="655"> 	
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
   		Possibilita a consulta e manuten��o dos assuntos da ouvidoria. Cada assunto est� relacionado a um sub-org�o cadastrado.
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
				<a name="lista"><label tabindex="7"><b>1 - Lista de Assuntos</b></label></a>
			</td>
		</tr>
		<tr>
			<td height="40" colspan="2" valign="top">				
					<label tabindex="8">Local onde s�o mostrados os assuntos de mensagens cadastrados no sistema. S�o presentes os dados:</label>
			</td>
		</tr>
		<tr>
			<td align="left" height="40" valign="top">
				<DD>
					<label tabindex="9"><b>Assunto de Mensagem</b></label>
				</DD>
			</td>
			<td valign="top">
				<label tabindex="10">Lista os assuntos de mensagem cadastrados no �rg�o.</label>
			</td>
		</tr>					
	  </table>
	  <br><br>
	  <table border="0" cellpadding="5" cellspacing="0" align="center" width="100%">		
		<tr>
			<td height="30" colspan="2" valign="top">
				<label tabindex="11"><b>1.1 - Est� dispon�vel o recurso de pagina�� com as opera��es:</b></label>
			</td>
		</tr>			
		<tr>
			<td valign="top" tabindex="12"><%@ include file="../paginacao.jsp" %></td>			
		</tr>			
	  </table>
	  <br><br>
	  <table border="0" cellpadding="5" cellspacing="0" align="center" width="100%">		
		<tr>
			<td height="30" colspan="2" valign="top">
				<a name="detalhe"><label tabindex="13"><b>2 - Detalhamento dos Tipos de Assunto</b></label></a>
			</td>
		</tr>
		<tr>
			<td height="40" colspan="2" valign="top">
				<label tabindex="14">Neste espa�o realizam-se opera��es sobre os tipos de assunto. As opera��es poss�veis s�o:</label>
			</td>
		</tr>
		<tr>
			<td align="left" height="40" width="150" valign="top">
				<DD><label tabindex="15"><b>Inclus�o</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="16">Cria��o de novos tipos de mensagens</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40" width="150" valign="top">
				<DD><label tabindex="17"><b>Altera��o</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="18">Altera��o dos dados dos tipos de mensagens j� existente</label>
			</td>
		</tr>			
		<tr>
			<td height="40" colspan="2" valign="top">
				<label tabindex="19">Os dados dispon�veis para altera��o s�o:</label>
			</td>
		</tr>
		<tr>
			<td align="left" height="40" width="150" valign="top">
				<DD><label tabindex="20"><b>Tipo de Assunto</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="21">Campo para digita��o do tipo de assunto de mensagem</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40" width="150" valign="top">
				<DD><label tabindex="22"><b>Descri��o</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="23">Campo para digita��o da descri��o do assunto de mensagem.</label>
			</td>
		</tr>
		<tr>
			<td align="left" height="40" width="150" valign="top">
				<DD><label tabindex="24"><b>Sub-�rg�o</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="25">Campo para sele��o do sub-�rg�o ao qual o assunto est� associado.</label>
			</td>
		</tr>			
		<tr>
			<td align="left" height="40" width="150" valign="top">
				<DD><label tabindex="26"><b>Prazo Interno</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="27">Campo para digita��o do prazo interno do assunto de mensagem. Ap�s esse prazo a mensagem, caso n�o tenha sido respondida, estar� em atraso.</label>
			</td>
		</tr>		
		<tr>
			<td align="left" height="40" width="150" valign="top">
				<DD><label tabindex="28"><b>Prazo Externo</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="29">Campo para digita��o do prazo externo do assunto de mensagem. Ap�s esse prazo a mensagem, caso n�o tenha sido respondida, estar� em atraso cr�tico.</label>
			</td>
		</tr>
		<tr>
			<td align="left" height="40" width="150" valign="top">
				<DD><label tabindex="30"><b>Data de vig�ncia</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="31">Campos para digita��o da data e hora do fim de vig�ncia do assunto de mensagem. A partir dessa data e hora o assunto de mensagem estar� indispon�vel para os usu�rios no sistema</label>
			</td>
		</tr>						
		<tr>
			<td height="40" colspan="2" valign="top">
				<label tabindex="32">Est� dispon�vel o bot�o que opera sobre o usu�rio:</label>
			</td>
		</tr>
		<tr>
			<td align="left" height="40" width="150" valign="top">
				<DD><label tabindex="33"><b>Incluir Assunto</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="34">Abre formul�rio para inclus�o de um novo assunto de mensagem.</label>
			</td>
		</tr>									
		<tr>
			<td align="left" height="40" width="150" valign="top">
				<DD><label tabindex="35"><b>Alterar</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="36">Altera os dados do assunto de mensagem</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40" width="150" valign="top">
				<DD><label tabindex="37"><b>Salvar</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="38">Registra os dados do assunto de mensagem</label>
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