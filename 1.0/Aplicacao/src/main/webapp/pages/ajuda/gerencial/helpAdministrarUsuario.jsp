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
 	<label tabindex=1 id="titulo"><b>Administrar Usuários</b></label>
 </td>
</tr>
<tr>
 <td align="center"><br>
 	<img src="../../images/ajuda/administrarUsuario_1.jpg" tabindex="2" name="imgTela" id="imgTela" alt="Imagem da tela administrar usuário" width="655">
 	<img src="../../images/ajuda/administrarUsuario_2.jpg" tabindex="3" name="imgTela" id="imgTela" alt="Imagem da tela administrar usuário" width="655"> 	
 	<img src="../../images/ajuda/administrarUsuario_3.jpg" tabindex="4" name="imgTela" id="imgTela" alt="Imagem da tela administrar usuário" width="655">
 	<img src="../../images/ajuda/administrarUsuario_4.jpg" tabindex="5" name="imgTela" id="imgTela" alt="Imagem da tela administrar usuário" width="655">
 	<img src="../../images/ajuda/administrarUsuario_5.jpg" tabindex="6" name="imgTela" id="imgTela" alt="Imagem da tela administrar usuário" width="655"> 	 	 	
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
   		Possibilita a consulta e administração dos funcionários da ouvidoria. Se o funcionário que está acessando a funcionalidade não tiver alocado em toda a ouvidoria, somente serão listados os funcionários lotados no mesmo sub-orgão e localidade da pessoa que está acessando a funcionalidade.   		
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
			<td height="30" colspan="2" valign="top"><a name="busca"><label tabindex="9"><b>1 - Consultar usuários</b></label></a></td>
		</tr>
		<tr>
			<td height="40" colspan="2" valign="top">				
					<label tabindex="10">
					Serve para buscar usuários específicos dentre os cadastrados, listando apenas os que correspondem ao crit&eacute;rio de busca selecionado.<br>
					Os crit&eacute;rios de busca possíveis são:
					</label>
			</td>
		</tr>
		<tr>
			<td align="left" height="40" width="150" valign="top">
				<DD><label tabindex="11">Palavra-chave</label></DD>
			</td>
			<td valign="top">
				<label tabindex="12">Será comparada com o conte&uacute;do do nome e da descrição dos usuários disponíveis.</label>
			</td>
		</tr>	
		<tr>
		<td align="left" height="40"  valign="top" colspan="3">
			<label tabindex="13">
			Após o fornecimento dos crit&eacute;rios de busca deve-se utilizar o botão "Buscar" ou a tecla "Enter", para que o sistema traga os usuários filtrados.<br>
			O botão "Incluir Usuário" permite que sejam incluidos novos usuários no banco.
			</label>
		</td>					
		</tr>		
	  </table>
	  <br><br>
	  <table border="0" cellpadding="5" cellspacing="0" align="center" width="100%">		
		<tr>
			<td height="30" colspan="2" valign="top">
				<a name="lista"><label tabindex="14"><b>2 - Lista de usuários</b></label></a>
			</td>
		</tr>
		<tr>
			<td height="40" colspan="2" valign="top">				
					<label tabindex="15">Local onde são mostrados os usuários filtrados pelos crit&eacute;rios fornecidos. São presentes os dados:</label>
			</td>
		</tr>
		<tr>
			<td align="left" height="40" width="30" valign="top">
				<DD><label tabindex="16"><b>Usuário</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="17">Nome do usuário</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40" width="30" valign="top">
				<DD><label tabindex="18"><b>CPF</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="19">CPF do Usuário</label>
			</td>
		</tr>
		<tr>
			<td align="left" height="40" width="30" valign="top">
				<DD><label tabindex="20"><b>Perfil</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="21">Perfil do usuário</label>
			</td>
		</tr>			
	  </table>
	  <br><br>
	  <table border="0" cellpadding="5" cellspacing="0" align="center" width="100%">		
		<tr>
			<td height="30" colspan="2" valign="top">
				<label tabindex="22"><b>2.1 - Está disponível o recurso de paginaçã com as operações:</b></label>
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
				<a name="detalhe"><label tabindex="23"><b>3 - Detalhamento de usuários</b></label></a>
			</td>
		</tr>
		<tr>
			<td height="40" colspan="2" valign="top">
				<label tabindex="24">Neste espaço realizam-se operações sobre os dados do usuário. As operações possíveis são:</label>
			</td>
		</tr>
		<tr>
			<td align="left" height="40" width="150" valign="top">
				<DD><label tabindex="25"><b>Inclusão</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="26">Criação de novo usuários</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40" width="150" valign="top">
				<DD><label tabindex="27"><b>Alteração</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="28">Alteração dos dados do usuários já existente</label>
			</td>
		</tr>
		<tr>
			<td align="left" height="40" width="150" valign="top">
				<DD><label tabindex="29"><b>Exclusão</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="30">A exclusão de usuário &eacute; feita no momento em que a situação do usuário &eacute; alterada para Inativo</label>
			</td>
		</tr>	
		<tr>
			<td height="40" colspan="2" valign="top">
				<label tabindex="31">Os dados disponíveis para alteração são:</label>
			</td>
		</tr>
		<tr>
			<td align="left" height="40" width="150" valign="top">
				<DD><label tabindex="32"><b>Nome</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="33">Campo para digitação do nome do usuário</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40" width="150" valign="top">
				<DD><label tabindex="34"><b>Senha</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="35">Campo para digitação da senha do usuário. Esse campo sempre estará em branco quando os dados de algum usuário estiverem sendo consultados ou atualizados</label>
			</td>
		</tr>
		<tr>
			<td align="left" height="40" width="150" valign="top">
				<DD><label tabindex="36"><b>CPF</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="37">Campo para digitação do CPF usuário</label>
			</td>
		</tr>			
		<tr>
			<td align="left" height="40" width="150" valign="top">
				<DD><label tabindex="38"><b>Situação</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="39">Campo para seleção da situação do usuário</label>
			</td>
		</tr>		
		<tr>
			<td align="left" height="40" width="150" valign="top">
				<DD><label tabindex="40"><b>Perfil de Acesso</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="41">Campo para seleção do perfil de acesso do usuário</label>
			</td>
		</tr>
		<tr>
			<td align="left" height="40" width="150" valign="top">
				<DD><label tabindex="42"><b>Funcionalidades</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="43">Campos para seleção das funcionalidades do usuário. Cada perfil apresenta funcionalidades padrão que são preenchidas automaticamente. Quando a funcionalidade Responder Mensagem for selecionada serão exibidos os seguintes campos:</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40" width="150" valign="top">
				<DD><label tabindex="44"><b>Tipo de Mensagem</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="45">Campo para seleção dos tipos de mensagem o usuário terá permissão para responder</label>
			</td>
		</tr>				
		<tr>
			<td align="left" height="40" width="150" valign="top">
				<DD><label tabindex="46"><b>Tipo de Assunto</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="47">Campo para seleção dos tipos de assunto que o usuário terá permissão para responder.</label>
			</td>
		</tr>	
		
		<tr>
			<td align="left" height="40" width="150" valign="top">
				<DD><label tabindex="48"><b>Sub-órgão</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="49">Campo para pr&eacute;-seleção dos sub-órgãos nos quais o usuário irá atuar.</label>
			</td>
		</tr>		
		<tr>
			<td align="left" height="40" width="150" valign="top">
				<DD><label tabindex="50"><b>Localidade</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="51">Campo para pr&eacute;-seleção das localidades dos sub-órgãos nas quais o usuário irá atuar.</label>
			</td>
		</tr>			
		<tr>
			<td align="left" height="40" width="180" valign="top">
				<DD><label tabindex="54"><b>Sub-órgão / Localidade</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="55">Campo para exibição e exclusão das localidades e dos respectivos sub-órgãos nos quais o usuário irá atuar. Somente as localidades listadas nesse campo são consideradas selecionadas</label>
			</td>
		</tr>	
		<tr>
			<td height="40" width="180" valign="top"></td>
			<td valign="top">
				<label tabindex="56">
					Para adicionar uma localidade, siga os seguintes passos:<br>
						<DD>1.	Selecione um Sub-Órgão;</DD><br>
						<DD>2.	Selecione as localidades deste Sub-Órgão;</DD><br>
						<DD>3.	Clique no botão Enviar;</DD><br>
						<DD>4.	Verifique se as localidades selecionadas estão na caixa Localidades dos Sub-Órgãos.</DD><br>
					 Para excluir uma localidade, siga os seguintes passos:<br>
						<DD>1.	Selecione as localidades a serem excluídas na caixa Localidades dos Sub-Órgãos;</DD><br>
						<DD>2.	Clique no botão Excluir.</DD>
				</label>
			</td>
		</tr>				
		<tr>
			<td height="40" colspan="2" valign="top">
				<label tabindex="57">Está disponível o botão que opera sobre o usuário:</label>
			</td>
		</tr>
		<tr>
			<td align="left" height="40" width="150" valign="top">
				<DD><label tabindex="58"><b>Salvar</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="59">Salava os dados usuário após o pedido de confirmação</label>
			</td>
		</tr>									
	  </table>
	</td>
	</tr>
	<tr>
	 <td>
		<hr>
		  <p class="voltar"><A title="imprimir esta página" href="javascript:window.print()" tabindex="60">imprimir</A> 
		    . <A title="topo da página" href="javascript:window.location=location.href;" tabindex="61">topo</A>
	 </td>
	</tr>
</table> 	    
</body>	

</HTML>