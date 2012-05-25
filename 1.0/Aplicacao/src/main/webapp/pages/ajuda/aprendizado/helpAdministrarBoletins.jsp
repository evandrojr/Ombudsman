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
 	<label tabindex=1 id="titulo"><b>Administrar Lista de Boletins</b></label>
 </td>
</tr>
<tr>
 <td align="center"><br>
 	<img src="../../images/ajuda/administrarBoletins_1.jpg" tabindex="2" name="imgTela" id="imgTela" alt="Imagem da tela de administrar boletins">
 	<img src="../../images/ajuda/administrarBoletins_2.jpg" tabindex="3" name="imgTela" id="imgTela" alt="Imagem da tela de administrar Boletins">
 	<img src="../../images/ajuda/administrarBoletins_3.jpg" tabindex="4" name="imgTela" id="imgTela" alt="Imagem da tela de administrar Boletins">
	<img src="../../images/ajuda/administrarBoletins_4.jpg" tabindex="5" name="imgTela" id="imgTela" alt="Imagem da tela de administrar Boletins">
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
   		Possibilita a consulta e divulga��o de boletins salvos no sistema.
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
					Serve para buscar boletins espec�ficos dentre os cadastrados, listando apenas as que correspondem ao crit&eacute;rio de busca selecionado.<br>
					Os crit&eacute;rios de busca poss�veis s�o:
					</label>
			</td>
		</tr>
		<tr>
			<td align="left" height="40" width="30%" valign="top">
				<DD><label tabindex="11"><b>Palavra-chave</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="12">Campo para digita��o da palavra-chave para busca de boletins registrados no �rg�o. A palavra-chave ser� buscada nos nomes e nos textos dos boletins.</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40" width="150" valign="top">
				<DD><label tabindex="13"><b>Meio de envio</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="14">Campo para sele��o do meio de envio.</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40" width="150" valign="top">
				<DD><label tabindex="15"><b>Per�odo</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="16">Campo para digita��o do per�odo em que se deseja realizar a busca. Devem ser digitadas as datas inicial e final do per�odo.</label>
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
				<a name="lista"><label tabindex="18"><b>2 - Listar Boletins</b></label></a>
			</td>
		</tr>
		<tr>
			<td height="40" colspan="2" valign="top">				
					<label tabindex="19">Local onde s�o mostradas os boletins cadastrados no sistema. S�o presentes os dados:</label>
			</td>
		</tr>				
		<tr>
			<td align="left" height="40" valign="top">
				<DD>
					<label tabindex="20"><b>Nome do Boletim</b></label>
				</DD>
			</td>
			<td valign="top">
				<label tabindex="21">Nome boletim encontrado.</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40" valign="top">
				<DD>
					<label tabindex="22"><b>Data de Cria��o</b></label>
				</DD>
			</td>
			<td valign="top">
				<label tabindex="23">Data de cria��o do boletim encontrado.</label>
			</td>
		</tr>
		<tr>
			<td align="left" height="40" valign="top">
				<DD>
					<label tabindex="24"><b>Publicado?</b></label>
				</DD>
			</td>
			<td valign="top">
				<label tabindex="25">Informa��o se o boletim j� foi publicado ou n�o.</label>
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
				<a name="detalhe"><label tabindex="28"><b>3 - Detalhamento do Boletim</b></label></a>
			</td>
		</tr>
		<tr>
			<td height="40" colspan="2" valign="top">
				<label tabindex="29">Os campos dispon�veis para visualiza��o s�o:</label>
			</td>
		</tr>							
		<tr>
			<td align="left" height="40" width="150" valign="top">
				<DD><label tabindex="30"><b>Nome</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="31">Nome boletim selecionado.</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40" width="150" valign="top">
				<DD><label tabindex="32"><b>�rea Geradora</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="33">�rea geradora do boletim selecionado.</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40" width="150" valign="top">
				<DD><label tabindex="34"><b>Respons�vel</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="35">Respons�vel pelo boletim selecionado.</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40" width="150" valign="top">
				<DD><label tabindex="36"><b>Telefone</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="37">Telefone do respons�vel pelo boletim selecionado.</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40" width="150" valign="top">
				<DD><label tabindex="38"><b>Conte&uacute;do</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="39">Conte&uacute;do do boletim selecionado.</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40" width="150" valign="top">
				<DD><label tabindex="40"><b>Itens visualiza��o</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="41">Itens que s�o visualizados no boletim selecionado e permiss�o para publica��o do boletim no site da ouvidoria.</label>
			</td>
		</tr>									
	  </table>	  
	  <br><br>
	  <table border="0" cellpadding="5" cellspacing="0" align="center" width="100%">		
		<tr>
			<td height="30" colspan="2" valign="top">
				<a name="detalhehist"><label tabindex="42"><b>4 - Detalhamento do Hist�rico de Boletim</b></label></a>
			</td>
		</tr>
		<tr>
			<td height="40" colspan="2" valign="top">
				<label tabindex="43">Os campos dispon�veis para visualiza��o s�o:</label>
			</td>
		</tr>							
		<tr>
			<td align="left" height="40" width="150" valign="top">
				<DD><label tabindex="44"><b>Data de Envio</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="45">Data e hor�rio do envio selecionado.</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40" width="150" valign="top">
				<DD><label tabindex="46"><b>Respons�vel</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="47">Funcion�rio respons�vel pelo boletim selecionado.</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40" width="150" valign="top">
				<DD><label tabindex="48"><b>Lista de E-mails</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="49">Lista dos e-mails destinat�rios daquele envio.</label>
			</td>
		</tr>						
		<tr>				
			<td height="40" colspan="2" valign="top">
				<label tabindex="50">Estao dispon�veis os bot�es que operam sobre o Boletim:</label>
			</td>
		</tr>
		<tr>
			<td align="left" height="40" width="150" valign="top">
				<DD><label tabindex="51"><b>Buscar</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="52">Envia os dados para consulta dos boletins cadastrados.</label>
			</td>
		</tr>
		<tr>
			<td align="left" height="40" width="150" valign="top">
				<DD><label tabindex="53"><b>Hist�rico de Envio</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="54">Abre o formul�rio com o hist�rico de envio do boletim.</label>
			</td>
		</tr>		
		<tr>
			<td align="left" height="40" width="150" valign="top">
				<DD><label tabindex="55"><b>Atualizar</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="56">Atualiza a publica��o do boletim.</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40" width="150" valign="top">
				<DD><label tabindex="57"><b>Visualizar</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="58">Abre janela para visualiza��o do boletim.</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40" width="150" valign="top">
				<DD><label tabindex="59"><b>Distribuir</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="60">Abre formul�rio para distribui��o do boletim.</label>
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