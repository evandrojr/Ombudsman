<%--
 Sistema de Ouvidoria: um canal através do qual os usuários
 podem encaminhar suas reclamações, elogios e sugestões.
 
 Copyright (C) 2011 SERPRO
 
 Este programa é software livre; você pode redistribuí-lo e/ou
 modificá-lo sob os termos da Licença Pública Geral GNU, conforme
 publicada pela Free Software Foundation; tanto a versão 2 da
 Licença como (a seu critério) qualquer versão mais nova.
 
 Este programa é distribuído na expectativa de ser útil, mas SEM
 QUALQUER GARANTIA; sem mesmo a garantia implícita de
 COMERCIALIZAÇÃO ou de ADEQUAÇÃO A QUALQUER PROPÓSITO EM
 PARTICULAR. Consulte a Licença Pública Geral GNU para obter mais
 detalhes.
 
 Você deve ter recebido uma cópia da Licença Pública Geral GNU,
 sob o título "LICENCA.txt", junto com esse programa. Se não,
 acesse o Portal do Software Público Brasileiro no endereço
 http://www.softwarepublico.gov.br/ ou escreva para a Fundação do
 Software Livre (FSF) Inc., 51 Franklin St, Fifth Floor, Boston,
 MA 02111-1301, USA.
 
 Contatos através do seguinte endereço internet:
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
 	<p align="center" class="obrigatorio" tabindex="6"><b>OBS.: O padrão de cores &eacute; meramente ilustrativo.</b></p>
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
   		Possibilita a consulta e divulgação de boletins salvos no sistema.
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
					Serve para buscar boletins específicos dentre os cadastrados, listando apenas as que correspondem ao crit&eacute;rio de busca selecionado.<br>
					Os crit&eacute;rios de busca possíveis são:
					</label>
			</td>
		</tr>
		<tr>
			<td align="left" height="40" width="30%" valign="top">
				<DD><label tabindex="11"><b>Palavra-chave</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="12">Campo para digitação da palavra-chave para busca de boletins registrados no órgão. A palavra-chave será buscada nos nomes e nos textos dos boletins.</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40" width="150" valign="top">
				<DD><label tabindex="13"><b>Meio de envio</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="14">Campo para seleção do meio de envio.</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40" width="150" valign="top">
				<DD><label tabindex="15"><b>Período</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="16">Campo para digitação do período em que se deseja realizar a busca. Devem ser digitadas as datas inicial e final do período.</label>
			</td>
		</tr>					
		<tr>
		<td align="left" height="40"  valign="top" colspan="3">
			<label tabindex="17">
			Após o fornecimento dos crit&eacute;rios de busca deve-se utilizar o botão "Buscar" ou a tecla "Enter", para que o sistema traga os boletins filtrados.<br>			
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
					<label tabindex="19">Local onde são mostradas os boletins cadastrados no sistema. São presentes os dados:</label>
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
					<label tabindex="22"><b>Data de Criação</b></label>
				</DD>
			</td>
			<td valign="top">
				<label tabindex="23">Data de criação do boletim encontrado.</label>
			</td>
		</tr>
		<tr>
			<td align="left" height="40" valign="top">
				<DD>
					<label tabindex="24"><b>Publicado?</b></label>
				</DD>
			</td>
			<td valign="top">
				<label tabindex="25">Informação se o boletim já foi publicado ou não.</label>
			</td>
		</tr>			
	  </table>
	  <br><br>
	  <table border="0" cellpadding="5" cellspacing="0" align="center" width="100%">		
		<tr>
			<td height="30" colspan="2" valign="top">
				<label tabindex="26"><b>2.1 - Está disponível o recurso de paginaçã com as operações:</b></label>
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
				<label tabindex="29">Os campos disponíveis para visualização são:</label>
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
				<DD><label tabindex="32"><b>Área Geradora</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="33">Área geradora do boletim selecionado.</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40" width="150" valign="top">
				<DD><label tabindex="34"><b>Responsável</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="35">Responsável pelo boletim selecionado.</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40" width="150" valign="top">
				<DD><label tabindex="36"><b>Telefone</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="37">Telefone do responsável pelo boletim selecionado.</label>
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
				<DD><label tabindex="40"><b>Itens visualização</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="41">Itens que são visualizados no boletim selecionado e permissão para publicação do boletim no site da ouvidoria.</label>
			</td>
		</tr>									
	  </table>	  
	  <br><br>
	  <table border="0" cellpadding="5" cellspacing="0" align="center" width="100%">		
		<tr>
			<td height="30" colspan="2" valign="top">
				<a name="detalhehist"><label tabindex="42"><b>4 - Detalhamento do Histórico de Boletim</b></label></a>
			</td>
		</tr>
		<tr>
			<td height="40" colspan="2" valign="top">
				<label tabindex="43">Os campos disponíveis para visualização são:</label>
			</td>
		</tr>							
		<tr>
			<td align="left" height="40" width="150" valign="top">
				<DD><label tabindex="44"><b>Data de Envio</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="45">Data e horário do envio selecionado.</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40" width="150" valign="top">
				<DD><label tabindex="46"><b>Responsável</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="47">Funcionário responsável pelo boletim selecionado.</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40" width="150" valign="top">
				<DD><label tabindex="48"><b>Lista de E-mails</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="49">Lista dos e-mails destinatários daquele envio.</label>
			</td>
		</tr>						
		<tr>				
			<td height="40" colspan="2" valign="top">
				<label tabindex="50">Estao disponíveis os botões que operam sobre o Boletim:</label>
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
				<DD><label tabindex="53"><b>Histórico de Envio</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="54">Abre o formulário com o histórico de envio do boletim.</label>
			</td>
		</tr>		
		<tr>
			<td align="left" height="40" width="150" valign="top">
				<DD><label tabindex="55"><b>Atualizar</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="56">Atualiza a publicação do boletim.</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40" width="150" valign="top">
				<DD><label tabindex="57"><b>Visualizar</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="58">Abre janela para visualização do boletim.</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40" width="150" valign="top">
				<DD><label tabindex="59"><b>Distribuir</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="60">Abre formulário para distribuição do boletim.</label>
			</td>
		</tr>			
	  </table>	  
	</td>
	</tr>
	<tr>
	 <td>
		<hr>
		  <p class="voltar"><A title="imprimir esta página" href="javascript:window.print()" tabindex="61">imprimir</A> 
		    . <A title="topo da página" href="javascript:window.location=location.href;" tabindex="62">topo</A>
	 </td>
	</tr>
</table> 	    
</body>	
</HTML>