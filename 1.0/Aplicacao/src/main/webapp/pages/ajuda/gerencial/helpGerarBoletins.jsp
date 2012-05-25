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
<link rel="stylesheet" media="all" href="../estilos/estilo_ajuda.css" type="text/css">
<link rel="stylesheet" media="all" href="../../estilos/Azul/estilo_conteudo.css" type="text/css">
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
 	<label tabindex=1 id="titulo"><b>Cria��o de Boletins</b></label>
 </td>
</tr>
<tr>
 <td align="center"><br>
 	<img src="../../images/ajuda/gerarBoletim_1.jpg" tabindex="2" name="imgTela" id="imgTela" alt="Imagem da tela de gerar boletins">
 	<img src="../../images/ajuda/gerarBoletim_2.jpg" tabindex="3" name="imgTela" id="imgTela" alt="Imagem da tela de gerar boletins"> 	
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
  		Permite que um boletim seja criado a partir de relat�rios extra�dos do sistema, decorrentes de qualquer indicador dispon�vel. Os boletins criados poder�o ser salvos para armazenamento e divulga��o, atrav&eacute;s do sistema, por e-mail ou por publica��o na pr�pria p�gina da ouvidoria.
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
			<td height="30" colspan="2" valign="top"><a name="busca"><label tabindex="7"><b>1 - Gerar Boletins</b></label></a></td>
		</tr>
		<tr>
			<td height="40" colspan="2" valign="top">				
					<label tabindex="8">
					Os campos poss�veis para a cria��o s�o:
					</label>
			</td>
		</tr>
		<tr>
			<td align="left" height="40" width="40%" valign="top">
				<DD><label tabindex="9"><b>Nome</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="10">Campo para digita��o do nome do boletim.</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40" width="40%" valign="top">
				<DD><label tabindex="11"><b>N&uacute;mero</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="12">Campo para digita��o do n&uacute;mero do boletim.</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40" width="40%" valign="top">
				<DD><label tabindex="13"><b>�rea geradora do boletim</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="14">Campo para digita��o da �rea geradora do boletim.</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40" width="40%" valign="top">
				<DD><label tabindex="15"><b>Respons�vel</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="16">Nome do funcion�rio que est� gerando o boletim.</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40" width="40%" valign="top">
				<DD><label tabindex="17"><b>Telefone</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="18">Campo para digita��o de um telefone de contato para informa��es sobre o boletim.</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40" width="40%" valign="top">
				<DD><label tabindex="19"><b>Conte&uacute;do</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="20">Campo para digita��o do texto do boletim.</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40" width="40%" valign="top">
				<DD><label tabindex="21"><b>Informa��es extra�das do relat�rio</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="22">Campo para sele��o dos itens do relat�rio que compor�o o boletim.</label>
			</td>
		</tr>	
		
		<tr>
		<td align="left" height="40" valign="top" colspan="3">
			<label tabindex="23">
			Ap�s o fornecimento dos campos deve-se utilizar o bot�o "Criar Boletins" ou a tecla "Enter", para que o sistema gere o boletim de acordo com os campos informados.<br>			
			</label>
		</td>					
		</tr>			
	 </table>
	 
	 <br><br>	
	 
	 <table border="0" cellpadding="5" cellspacing="0" align="center" width="100%">				
		<tr>
			<td height="40" colspan="2" valign="top">
				<label tabindex="24">Est� dispon�vel o bot�o que opera sobre a gera��o do boletim:</label>
			</td>
		</tr>
		<tr>
			<td align="left" height="40" valign="top">
				<DD><label tabindex="25"><b>Gerar Boletim</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="26">Abre formul�rio para gera��o do boletim.</label>
			</td>
		</tr>
		<tr>
			<td align="left" height="40" valign="top">
				<DD><label tabindex="27"><b>Criar Boletim</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="28">Cria o boletim e o exibe na tela.</label>
			</td>
		</tr>
		<tr>
			<td align="left" height="40" valign="top">
				<DD><label tabindex="29"><b>Imprimir</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="30">Imprime o boletim.</label>
			</td>
		</tr>
		<tr>
			<td align="left" height="40" valign="top">
				<DD><label tabindex="31"><b>Salvar Boletim</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="32">Registra o boletim no sistema.</label>
			</td>
		</tr>
	 </table>	 
	</td>
	</tr>
	<tr>
	 <td>
		<hr>
		 <p class="voltar"><A title="imprimir esta p�gina" href="javascript:window.print()" tabindex="33">imprimir</A> 
		  . <A title="topo da p�gina" href="javascript:window.location=location.href;" tabindex="34">topo</A>
	 </td>
	</tr>
</table> 	  

	
</body>	

</HTML>