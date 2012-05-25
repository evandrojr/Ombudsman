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
 	<label tabindex=1 id="titulo"><b>Consultar Mensagens Respondidas</b></label>
 </td>
</tr>
<tr>
 <td align="center"><br>
 	<img src="../../images/ajuda/mensagensRespondidas_1.jpg" tabindex="2" name="imgTela" id="imgTela" alt="Imagem da tela de consultar mensagens respondidas">
 	<img src="../../images/ajuda/mensagensRespondidas_2.jpg" tabindex="3" name="imgTela" id="imgTela" alt="Imagem da tela de consultar mensagens respondidas">
 	<img src="../../images/ajuda/mensagensRespondidas_3.jpg" tabindex="4" name="imgTela" id="imgTela" alt="Imagem da tela de consultar mensagens respondidas">
 </td>
</tr>	
<tr>
 <td>
 	<p align="center" class="obrigatorio" tabindex="5"><b>OBS.: O padrão de cores &eacute; meramente ilustrativo.</b></p>
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
   		xxxxxxxxxxxxxxxxxxxxxxxxx
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
			<td height="30" colspan="2" valign="top"><a name="busca"><label tabindex="8"><b>1 - Consultar Mensagens Respondidas</b></label></a></td>
		</tr>
		<tr>
			<td height="40" colspan="2" valign="top">				
					<label tabindex="9">
					Serve para buscar mensagens respondidas específicas dentre as cadastradas, listando apenas as que correspondem ao crit&eacute;rio de busca selecionado.<br>
					Os crit&eacute;rios de busca possíveis são:
					</label>
			</td>
		</tr>
		<tr>
			<td align="left" height="40" width="30%" valign="top">
				<DD><label tabindex="10"><b>Período</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="11">Campo para digitação do período em que se deseja realizar a busca. Devem ser digitadas as datas inicial e final do período.</label>
			</td>
		</tr>
		<tr>
			<td align="left" height="40" width="30%" valign="top">
				<DD><label tabindex="12"><b>Palavra-chave</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="13">Campo para digitação da palavra-chave para busca de mensagens respondidas disponíveis no órgão. A palavra-chave será buscada no texto da mensagem e da resposta.</label>
			</td>
		</tr>
		<tr>
			<td align="left" height="40" width="30%" valign="top">
				<DD><label tabindex="14"><b>Tipo Mensagem</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="15">Campo para seleção de um tipo de mensagem dentre os cadastrados pela ouvidoria.</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40" width="30%" valign="top">
				<DD><label tabindex="16"><b>Assunto</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="17">Campo para seleção de um assunto de mensagem dentre os cadastrados pela ouvidoria.</label>
			</td>
		</tr>	
		
		<tr>
		<td align="left" height="40"  valign="top" colspan="3">
			<label tabindex="18">
			Após o fornecimento dos crit&eacute;rios de busca deve-se utilizar o botão "Buscar" ou a tecla "Enter", para que o sistema traga as mensagens respondidas filtradas.<br>			
			</label>
		</td>					
		</tr>			
	  </table>
	  
	  <br><br>
	  <table border="0" cellpadding="5" cellspacing="0" align="center" width="100%">		
		<tr>
			<td height="30" colspan="2" valign="top">
				<a name="lista"><label tabindex="19"><b>2 - Listar Mensagens Respondidas</b></label></a>
			</td>
		</tr>
		<tr>
			<td height="40" colspan="2" valign="top">				
					<label tabindex="20">Local onde são mostradas as mensagens respondidas cadastradas no sistema. São presentes os dados:</label>
			</td>
		</tr>				
		<tr>
			<td align="left" height="40" valign="top">
				<DD>
					<label tabindex="21"><b>Protocolo</b></label>
				</DD>
			</td>
			<td valign="top">
				<label tabindex="22">Protocolo da mensagem encontrada.</label>
			</td>
		</tr>
				<tr>
			<td align="left" height="40" valign="top">
				<DD>
					<label tabindex="23"><b>Data</b></label>
				</DD>
			</td>
			<td valign="top">
				<label tabindex="24">Data em que foi respondida a mensagem encontrada.</label>
			</td>
		</tr>	
				<tr>
			<td align="left" height="40" valign="top">
				<DD>
					<label tabindex="25"><b>Título</b></label>
				</DD>
			</td>
			<td valign="top">
				<label tabindex="26">Título da mensagem encontrada.</label>
			</td>
		</tr>	
				<tr>
			<td align="left" height="40" valign="top">
				<DD>
					<label tabindex="27"><b>Texto</b></label>
				</DD>
			</td>
			<td valign="top">
				<label tabindex="28">Texto da mensagem encontrada.</label>
			</td>
		</tr>	
				<tr>
			<td align="left" height="40" valign="top">
				<DD>
					<label tabindex="29"><b>Funcionário</b></label>
				</DD>
			</td>
			<td valign="top">
				<label tabindex="30">Funcionário que respondeu a mensagem encontrada.</label>
			</td>
		</tr>
	  </table>
	  <br><br>
	  <table border="0" cellpadding="5" cellspacing="0" align="center" width="100%">		
		<tr>
			<td height="30" colspan="2" valign="top">
				<label tabindex="31"><b>2.1 - Está disponível o recurso de paginaçã com as operações:</b></label>
			</td>
		</tr>			
		<tr>
			<td valign="top" tabindex="32"><%@ include file="../paginacao.jsp" %></td>
		</tr>			
	  </table>
	  <br><br>
	  <table border="0" cellpadding="5" cellspacing="0" align="center" width="100%">		
		<tr>
			<td height="30" colspan="2" valign="top">
				<a name="detalhe"><label tabindex="33"><b>3 - Detalhamento da Mensagem Respondida</b></label></a>
			</td>
		</tr>
		<tr>
			<td height="40" colspan="2" valign="top">
				<label tabindex="34">Os campos disponíveis para visualização são:</label>
			</td>
		</tr>							
		<tr>
			<td align="left" height="40" width="40%" valign="top">
				<DD><label tabindex="35"><b>Protocolo</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="36">Protocolo da mensagem selecionada.</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40" width="40%" valign="top">
				<DD><label tabindex="37"><b>Funcionário</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="38">Funcionário que respondeu a mensagem selecionada.</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40" width="40%" valign="top">
				<DD><label tabindex="39"><b>Data prevista Solução Externa</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="40">Prazo externo para resposta da mensagem selecionada.</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40" width="40%" valign="top">
				<DD><label tabindex="41"><b>Data prevista Solução Interna</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="42">Prazo interno para resposta da mensagem selecionada.</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40" width="40%" valign="top">
				<DD><label tabindex="43"><b>Mensagem</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="44">Texto da mensagem selecionada.</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40" width="40%" valign="top">
				<DD><label tabindex="45"><b>Tipo da Mensagem</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="46">Tipo da mensagem selecionada.</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40" width="40%" valign="top">
				<DD><label tabindex="47"><b>Assunto da Mensagem</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="48">Assunto da mensagem selecionada.</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40" width="40%" valign="top">
				<DD><label tabindex="49"><b>Resposta</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="50">Título da mensagem selecionada.</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40" width="40%" valign="top">
				<DD><label tabindex="51"><b>Data</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="31">Data em q foi respondida a mensagem selecionada.</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40" width="40%" valign="top">
				<DD><label tabindex="52"><b>Texto da Resposta</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="53">Resposta da mensagem selecionada.</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40" width="40%" valign="top">
				<DD><label tabindex="54"><b>Avaliação</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="55">Avaliação do acionador para a resposta fornecida pela ouvidoria à mensagem.</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40" width="40%" valign="top">
				<DD><label tabindex="56"><b>Tipo do Acionador</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="57">Tipo de usuário da mensagem.</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40" width="40%" valign="top">
				<DD><label tabindex="58"><b>Escolaridade</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="59">Escolaridade do acionador da mensagem.</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40" width="40%" valign="top">
				<DD><label tabindex="60"><b>Faixa Etária</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="61">Faixa Etária do acionador da mensagem.</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40" width="40%" valign="top">
				<DD><label tabindex="62"><b>Local de Envio</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="63">País de onde a mensagem foi enviada.</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40" width="40%" valign="top">
				<DD><label tabindex="63"><b>Estado</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="64">Estado de onde a mensagem foi enviada.</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40" width="40%" valign="top">
				<DD><label tabindex="65"><b>Sexo</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="66">Sexo do acionador da mensagem.</label>
			</td>
		</tr>	
		<tr>
			<td height="40" colspan="2" valign="top">
				<label tabindex="67">Está disponível o botão que opera sobre a mensagem respondida:</label>
			</td>
		</tr>
		<tr>
			<td align="left" height="40" width="150" valign="top">
				<DD><label tabindex="68"><b>Buscar</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="69">Envia os dados para consulta da mensagem respndida.</label>
			</td>
		</tr>
	  </table>	 
	</td>
	</tr>
	<tr>
	 <td>
		<hr>
		  <p class="voltar"><A title="imprimir esta página" href="javascript:window.print()" tabindex="70">imprimir</A> 
		    . <A title="topo da página" href="javascript:window.location=location.href;" tabindex="71">topo</A>
	 </td>
	</tr>
</table> 	    
</body>	
</HTML>