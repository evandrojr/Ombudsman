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
 	<label tabindex=1 id="titulo"><b>Administrar Usu�rios</b></label>
 </td>
</tr>
<tr>
 <td align="center"><br>
 	<img src="../../images/ajuda/administrarUsuario_1.jpg" tabindex="2" name="imgTela" id="imgTela" alt="Imagem da tela administrar usu�rio" width="655">
 	<img src="../../images/ajuda/administrarUsuario_2.jpg" tabindex="3" name="imgTela" id="imgTela" alt="Imagem da tela administrar usu�rio" width="655"> 	
 	<img src="../../images/ajuda/administrarUsuario_3.jpg" tabindex="4" name="imgTela" id="imgTela" alt="Imagem da tela administrar usu�rio" width="655">
 	<img src="../../images/ajuda/administrarUsuario_4.jpg" tabindex="5" name="imgTela" id="imgTela" alt="Imagem da tela administrar usu�rio" width="655">
 	<img src="../../images/ajuda/administrarUsuario_5.jpg" tabindex="6" name="imgTela" id="imgTela" alt="Imagem da tela administrar usu�rio" width="655"> 	 	 	
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
   		Possibilita a consulta e administra��o dos funcion�rios da ouvidoria. Se o funcion�rio que est� acessando a funcionalidade n�o tiver alocado em toda a ouvidoria, somente ser�o listados os funcion�rios lotados no mesmo sub-org�o e localidade da pessoa que est� acessando a funcionalidade.   		
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
			<td height="30" colspan="2" valign="top"><a name="busca"><label tabindex="9"><b>1 - Consultar usu�rios</b></label></a></td>
		</tr>
		<tr>
			<td height="40" colspan="2" valign="top">				
					<label tabindex="10">
					Serve para buscar usu�rios espec�ficos dentre os cadastrados, listando apenas os que correspondem ao crit&eacute;rio de busca selecionado.<br>
					Os crit&eacute;rios de busca poss�veis s�o:
					</label>
			</td>
		</tr>
		<tr>
			<td align="left" height="40" width="150" valign="top">
				<DD><label tabindex="11">Palavra-chave</label></DD>
			</td>
			<td valign="top">
				<label tabindex="12">Ser� comparada com o conte&uacute;do do nome e da descri��o dos usu�rios dispon�veis.</label>
			</td>
		</tr>	
		<tr>
		<td align="left" height="40"  valign="top" colspan="3">
			<label tabindex="13">
			Ap�s o fornecimento dos crit&eacute;rios de busca deve-se utilizar o bot�o "Buscar" ou a tecla "Enter", para que o sistema traga os usu�rios filtrados.<br>
			O bot�o "Incluir Usu�rio" permite que sejam incluidos novos usu�rios no banco.
			</label>
		</td>					
		</tr>		
	  </table>
	  <br><br>
	  <table border="0" cellpadding="5" cellspacing="0" align="center" width="100%">		
		<tr>
			<td height="30" colspan="2" valign="top">
				<a name="lista"><label tabindex="14"><b>2 - Lista de usu�rios</b></label></a>
			</td>
		</tr>
		<tr>
			<td height="40" colspan="2" valign="top">				
					<label tabindex="15">Local onde s�o mostrados os usu�rios filtrados pelos crit&eacute;rios fornecidos. S�o presentes os dados:</label>
			</td>
		</tr>
		<tr>
			<td align="left" height="40" width="30" valign="top">
				<DD><label tabindex="16"><b>Usu�rio</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="17">Nome do usu�rio</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40" width="30" valign="top">
				<DD><label tabindex="18"><b>CPF</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="19">CPF do Usu�rio</label>
			</td>
		</tr>
		<tr>
			<td align="left" height="40" width="30" valign="top">
				<DD><label tabindex="20"><b>Perfil</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="21">Perfil do usu�rio</label>
			</td>
		</tr>			
	  </table>
	  <br><br>
	  <table border="0" cellpadding="5" cellspacing="0" align="center" width="100%">		
		<tr>
			<td height="30" colspan="2" valign="top">
				<label tabindex="22"><b>2.1 - Est� dispon�vel o recurso de pagina�� com as opera��es:</b></label>
			</td>
		</tr>			
		<tr>
			<td valign="top" tabindex="22"><%@ include file="../paginacao.jsp" %></td>
		</tr>			
	  </table>
	  <br><br>
	  <table border="0" cellpadding="5" cellspacing="0" align="center" width="100%">		
		<tr>
			<td height="30" colspan="2" valign="top">
				<a name="detalhe"><label tabindex="23"><b>3 - Detalhamento de usu�rios</b></label></a>
			</td>
		</tr>
		<tr>
			<td height="40" colspan="2" valign="top">
				<label tabindex="24">Neste espa�o realizam-se opera��es sobre os dados do usu�rio. As opera��es poss�veis s�o:</label>
			</td>
		</tr>
		<tr>
			<td align="left" height="40" width="150" valign="top">
				<DD><label tabindex="25"><b>Inclus�o</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="26">Cria��o de novo usu�rios</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40" width="150" valign="top">
				<DD><label tabindex="27"><b>Altera��o</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="28">Altera��o dos dados do usu�rios j� existente</label>
			</td>
		</tr>
		<tr>
			<td align="left" height="40" width="150" valign="top">
				<DD><label tabindex="29"><b>Exclus�o</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="30">A exclus�o de usu�rio &eacute; feita no momento em que a situa��o do usu�rio &eacute; alterada para Inativo</label>
			</td>
		</tr>	
		<tr>
			<td height="40" colspan="2" valign="top">
				<label tabindex="31">Os dados dispon�veis para altera��o s�o:</label>
			</td>
		</tr>
		<tr>
			<td align="left" height="40" width="150" valign="top">
				<DD><label tabindex="32"><b>Nome</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="33">Campo para digita��o do nome do usu�rio</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40" width="150" valign="top">
				<DD><label tabindex="34"><b>Senha</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="35">Campo para digita��o da senha do usu�rio. Esse campo sempre estar� em branco quando os dados de algum usu�rio estiverem sendo consultados ou atualizados</label>
			</td>
		</tr>
		<tr>
			<td align="left" height="40" width="150" valign="top">
				<DD><label tabindex="36"><b>CPF</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="37">Campo para digita��o do CPF usu�rio</label>
			</td>
		</tr>			
		<tr>
			<td align="left" height="40" width="150" valign="top">
				<DD><label tabindex="38"><b>Situa��o</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="39">Campo para sele��o da situa��o do usu�rio</label>
			</td>
		</tr>		
		<tr>
			<td align="left" height="40" width="150" valign="top">
				<DD><label tabindex="40"><b>Perfil de Acesso</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="41">Campo para sele��o do perfil de acesso do usu�rio</label>
			</td>
		</tr>
		<tr>
			<td align="left" height="40" width="150" valign="top">
				<DD><label tabindex="42"><b>Funcionalidades</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="43">Campos para sele��o das funcionalidades do usu�rio. Cada perfil apresenta funcionalidades padr�o que s�o preenchidas automaticamente. Quando a funcionalidade Responder Mensagem for selecionada ser�o exibidos os seguintes campos:</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40" width="150" valign="top">
				<DD><label tabindex="44"><b>Tipo de Mensagem</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="45">Campo para sele��o dos tipos de mensagem o usu�rio ter� permiss�o para responder</label>
			</td>
		</tr>				
		<tr>
			<td align="left" height="40" width="150" valign="top">
				<DD><label tabindex="46"><b>Tipo de Assunto</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="47">Campo para sele��o dos tipos de assunto que o usu�rio ter� permiss�o para responder.</label>
			</td>
		</tr>	
		
		<tr>
			<td align="left" height="40" width="150" valign="top">
				<DD><label tabindex="48"><b>Sub-�rg�o</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="49">Campo para pr&eacute;-sele��o dos sub-�rg�os nos quais o usu�rio ir� atuar.</label>
			</td>
		</tr>		
		<tr>
			<td align="left" height="40" width="150" valign="top">
				<DD><label tabindex="50"><b>Localidade</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="51">Campo para pr&eacute;-sele��o das localidades dos sub-�rg�os nas quais o usu�rio ir� atuar.</label>
			</td>
		</tr>			
		<tr>
			<td align="left" height="40" width="180" valign="top">
				<DD><label tabindex="54"><b>Sub-�rg�o / Localidade</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="55">Campo para exibi��o e exclus�o das localidades e dos respectivos sub-�rg�os nos quais o usu�rio ir� atuar. Somente as localidades listadas nesse campo s�o consideradas selecionadas</label>
			</td>
		</tr>	
		<tr>
			<td height="40" width="180" valign="top"></td>
			<td valign="top">
				<label tabindex="56">
					Para adicionar uma localidade, siga os seguintes passos:<br>
						<DD>1.	Selecione um Sub-�rg�o;</DD><br>
						<DD>2.	Selecione as localidades deste Sub-�rg�o;</DD><br>
						<DD>3.	Clique no bot�o Enviar;</DD><br>
						<DD>4.	Verifique se as localidades selecionadas est�o na caixa Localidades dos Sub-�rg�os.</DD><br>
					 Para excluir uma localidade, siga os seguintes passos:<br>
						<DD>1.	Selecione as localidades a serem exclu�das na caixa Localidades dos Sub-�rg�os;</DD><br>
						<DD>2.	Clique no bot�o Excluir.</DD>
				</label>
			</td>
		</tr>				
		<tr>
			<td height="40" colspan="2" valign="top">
				<label tabindex="57">Est� dispon�vel o bot�o que opera sobre o usu�rio:</label>
			</td>
		</tr>
		<tr>
			<td align="left" height="40" width="150" valign="top">
				<DD><label tabindex="58"><b>Salvar</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="59">Salava os dados usu�rio ap�s o pedido de confirma��o</label>
			</td>
		</tr>									
	  </table>
	</td>
	</tr>
	<tr>
	 <td>
		<hr>
		  <p class="voltar"><A title="imprimir esta p�gina" href="javascript:window.print()" tabindex="60">imprimir</A> 
		    . <A title="topo da p�gina" href="javascript:window.location=location.href;" tabindex="61">topo</A>
	 </td>
	</tr>
</table> 	    
</body>	

</HTML>