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
 	<label tabindex=1 id="titulo"><b>Consultar Andamento de Solução</b></label>
 </td>
</tr>
<tr>
 <td align="center"><br>
 	<img src="../../images/ajuda/andamentoSolucao_1.jpg" tabindex="2" name="imgTela" id="imgTela" alt="Imagem da tela de administrar boletins">
 	<img src="../../images/ajuda/andamentoSolucao_2.jpg" tabindex="3" name="imgTela" id="imgTela" alt="Imagem da tela de administrar Boletins">
 	<img src="../../images/ajuda/andamentoSolucao_3.jpg" tabindex="4" name="imgTela" id="imgTela" alt="Imagem da tela de administrar Boletins">
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
   		Possibilita uma visão ampla sobre o andamento das mensagens da ouvidoria ou sobre mensagens que estejam em situações específicas.
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
			<td height="30" colspan="2" valign="top"><a name="busca"><label tabindex="9"><b>1 - Consultar Andamento de Soluções</b></label></a></td>
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
				<DD><label tabindex="11"><b>Período</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="12">Campo para digitação do período em que se deseja realizar a busca. Devem ser digitadas a data inicial e final do período.</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40" width="30%" valign="top">
				<DD><label tabindex="11"><b>Assunto</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="12">Campo para seleção de um assunto de mensagem dentre os cadastrados pela ouvidoria.</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40" width="30%" valign="top">
				<DD><label tabindex="11"><b>Tipo de Mensagem</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="12">Campo para seleção de um tipo de mensagem dentre os cadastrados pela ouvidoria.</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40" width="30%" valign="top">
				<DD><label tabindex="11"><b>Situação</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="12">Campo para seleção da situação da mensagem.</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40" width="30%" valign="top">
				<DD><label tabindex="11"><b>Palavra-chave</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="12">Campo para digitação da palavra-chave para busca de mensagens disponíveis no órgão. A palavra-chave será buscada no texto da mensagem e da resposta.</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40" width="30%" valign="top">
				<DD><label tabindex="11"><b>Protocolo</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="12">Campo para digitação de um protocolo de mensagem.</label>
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
				<a name="lista"><label tabindex="18"><b>2 - Listar Andamento de Soluções</b></label></a>
			</td>
		</tr>
		<tr>
			<td height="40" colspan="2" valign="top">				
					<label tabindex="19">Local onde são mostradas os andamentos das soluções cadastradas no sistema. São presentes os dados:</label>
			</td>
		</tr>				
		<tr>
			<td align="left" height="40" valign="top">
				<DD>
					<label tabindex="20"><b>Situação</b></label>
				</DD>
			</td>
			<td valign="top">
				<label tabindex="21">Situação atual da mensagem.</label>
			</td>
		</tr>
				<tr>
			<td align="left" height="40" valign="top">
				<DD>
					<label tabindex="20"><b>Assunto</b></label>
				</DD>
			</td>
			<td valign="top">
				<label tabindex="21">Assunto da mensagem.</label>
			</td>
		</tr>	
				<tr>
			<td align="left" height="40" valign="top">
				<DD>
					<label tabindex="20"><b>Protocolo</b></label>
				</DD>
			</td>
			<td valign="top">
				<label tabindex="21">Protocolo da mensagem.</label>
			</td>
		</tr>	
				<tr>
			<td align="left" height="40" valign="top">
				<DD>
					<label tabindex="20"><b>Data interna</b></label>
				</DD>
			</td>
			<td valign="top">
				<label tabindex="21">Prazo interno para resposta à mensagem.</label>
			</td>
		</tr>	
				<tr>
			<td align="left" height="40" valign="top">
				<DD>
					<label tabindex="20"><b>Responsável</b></label>
				</DD>
			</td>
			<td valign="top">
				<label tabindex="21">Funcionário responsável por responder a mensagem.</label>
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
				<a name="detalhe"><label tabindex="28"><b>3 - Detalhamento do Andamento de Solução</b></label></a>
			</td>
		</tr>
		<tr>
			<td height="40" colspan="2" valign="top">
				<label tabindex="29">Os campos disponíveis para visualização são:</label>
			</td>
		</tr>							
		<tr>
			<td align="left" height="40" width="40%" valign="top">
				<DD><label tabindex="30"><b>Tipo da Mensagem</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="31">Tipo da mensagem.</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40"  valign="top">
				<DD><label tabindex="30"><b>Assunto da Mensagem</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="31">Assunto da mensagem.</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40"  valign="top">
				<DD><label tabindex="30"><b>Localidade da Ocorrência</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="31">Localidade da ocorrência do ocorrido na mensagem.</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40"  valign="top">
				<DD><label tabindex="30"><b>Mensagem</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="31">Mensagem enviada.</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40"  valign="top">
				<DD><label tabindex="30"><b>Anexo</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="31">Link para arquivo anexado à mensagem.</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40"  valign="top">
				<DD><label tabindex="30"><b>Tipo de Usuário</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="31">Tipo de usuário mensagem.</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40"  valign="top">
				<DD><label tabindex="30"><b>Acionador</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="31">Nome do acionador.</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40"  valign="top">
				<DD><label tabindex="30"><b>CPF</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="31">CPF do acionador.</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40"  valign="top">
				<DD><label tabindex="30"><b>Sexo</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="31">Sexo do acionador.</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40"  valign="top">
				<DD><label tabindex="30"><b>E-mail</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="31">E-mail do acionador.</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40"  valign="top">
				<DD><label tabindex="30"><b>Telefone</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="31">Telefone do acionador.</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40"  valign="top">
				<DD><label tabindex="30"><b>Fax</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="31">Fax do acionador.</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40"  valign="top">
				<DD><label tabindex="30"><b>Escolaridade</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="31">Escolaridade do acionador.</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40"  valign="top">
				<DD><label tabindex="30"><b>Faixa etária</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="31">Faixa etária do acionador.</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40"  valign="top">
				<DD><label tabindex="30"><b>Modo de envio da resposta</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="31">Modo de envio de resposta selecionado pelo acionador.</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40"  valign="top">
				<DD><label tabindex="30"><b>UF de Envio</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="31">Unidade Federativa de onde a mensagem foi enviada.</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40"  valign="top">
				<DD><label tabindex="30"><b>País de Envio</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="31">País de onde a cidade foi enviada. </label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40"  valign="top">
				<DD><label tabindex="30"><b>Informação da resposta por carta</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="31">Endereço do acionador para respostas por carta. </label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40"  valign="top">
				<DD><label tabindex="30"><b>Especialista</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="31">Funcionário responsável por responder a mensagem.</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40"  valign="top">
				<DD><label tabindex="30"><b>Data do acionamento</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="31">Data em que o acionamento foi realizado.</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40"  valign="top">
				<DD><label tabindex="30"><b>Prazo interno</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="31">Prazo interno para responder a mensagem.</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40"  valign="top">
				<DD><label tabindex="30"><b>Prazo externo</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="31">Prazo externo para responder a mensagem.</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40"  valign="top">
				<DD><label tabindex="30"><b>Resposta</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="31">Resposta dada à mensagem.</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40"  valign="top">
				<DD><label tabindex="30"><b>Avaliação</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="31">Avaliação do acionador para a resposta fornecida pela ouvidoria.</label>
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