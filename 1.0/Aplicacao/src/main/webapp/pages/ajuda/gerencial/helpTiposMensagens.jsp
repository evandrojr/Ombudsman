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
 	<label tabindex=1 id="titulo"><b>Tipos de Mensagens</b></label>
 </td>
</tr>
<tr>
 <td align="center"><br>
 	<img src="../../images/ajuda/tiposMensagens_1.jpg" tabindex="2" name="imgTela" id="imgTela" alt="Imagem da tela tipos de mensagens" width="655">
 	<img src="../../images/ajuda/tiposMensagens_2.jpg" tabindex="3" name="imgTela" id="imgTela" alt="Imagem da tela tipos de mensagens" width="655">
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
   		Possibilita a consulta e manuten��o dos tipos de mensagem cadastrados para a ouvidoria.
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
				<a name="lista"><label tabindex="9"><b>1 - Lista de Tipos de Mensagens</b></label></a>
			</td>
		</tr>
		<tr>
			<td height="40" colspan="2" valign="top">				
					<label tabindex="10">Local onde s�o mostrados os Tipos de Mensagens cadastrados no sistema. S�o presentes os dados:</label>
			</td>
		</tr>
		<tr>
			<td align="left" height="40" valign="top">
				<DD>
					<label tabindex="11"><b>Tipo de Mensagem</b></label>
				</DD>
			</td>
			<td valign="top">
				<label tabindex="12">Lista os tipos de mensagem cadastrados no �rg�o.</label>
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
				<a name="detalhe"><label tabindex="15"><b>2 - Detalhamento do Tipo de Mensagem</b></label></a>
			</td>
		</tr>
		<tr>
			<td height="40" colspan="2" valign="top">
				<label tabindex="16">Neste espa�o realizam-se opera��es sobre os Tipos de Mensagens. Os campos poss�veis para altera��o s�o:</label>
			</td>
		</tr>
		<tr>
			<td align="left" height="40" width="30%" valign="top">
				<DD><label tabindex="17><b>Tipo de Mensagem</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="18">Campo para digita��o do tipo de mensagem.</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40"  valign="top">
				<DD><label tabindex="19"><b>Descri��o</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="20">Campo para digita��o da descri��o do tipo de mensagem.</label>
			</td>			
		</tr>	
		<tr>
			<td align="left" height="40"  valign="top">
				<DD><label tabindex="21"><b>Prazo Interno</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="22">Campo para digita��o do prazo interno do tipo de mensagem. Esse prazo ser� priorit�rio para defini��o do prazo da mensagem em rela��o aos prazos do assunto.Ap�s esse prazo a mensagem, caso n�o tenha sido respondida, estar� em atraso.</label>
			</td>			
		</tr>
				<tr>
			<td align="left" height="40"  valign="top">
				<DD><label tabindex="23"><b>Prazo Externo</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="24">Campo para digita��o do prazo externo do tipo de mensagem. Esse prazo ser� priorit�rio para defini��o do prazo da mensagem em rela��o aos prazos do assunto.Ap�s esse prazo a mensagem, caso n�o tenha sido respondida, estar� em atraso cr�tico.</label>
			</td>			
		</tr>
		<tr>
			<td align="left" height="40"  valign="top">
				<DD><label tabindex="25"><b>Data de vig�ncia</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="26"></label>
			</td>			
		</tr>
		<tr>
			<td align="left" height="40"  valign="top">
				<DD><label tabindex="27"><b>Campos para digita��o da data e hora do fim de vig�ncia do tipo de mensagem. A partir dessa data e hora o tipo de mensagem estar� indispon�vel para os usu�rios no sistema.</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="28"></label>
			</td>			
		</tr>
		<tr>				
			<td height="40" colspan="2" valign="top">
				<label tabindex="29">Estao dispon�veis os bot�es que operam sobre o Sub-�rg�o:</label>
			</td>
		</tr>
		<tr>
			<td align="left" height="40" width="30%" valign="top">
				<DD><label tabindex="30"><b>Incluir Novo Tipo</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="31">Abre formul�rio para inclus�o de um novo tipo de mensagem.</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40" width="30%" valign="top">
				<DD><label tabindex="32"><b>Alterar</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="33">Altera os dados do tipo de mensagem.</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40" width="30%" valign="top">
				<DD><label tabindex="34"><b>Salvar</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="35">Registra os dados do tipo de mensagem.</label>
			</td>
		</tr>	
	  </table>	
	</td>
	</tr>
	<tr>
	 <td>
		<hr>
		  <p class="voltar"><A title="imprimir esta p�gina" href="javascript:window.print()" tabindex="36">imprimir</A> 
		    . <A title="topo da p�gina" href="javascript:window.location=location.href;" tabindex="37">topo</A>
	 </td>
	</tr>
</table> 	    
</body>	
</HTML>