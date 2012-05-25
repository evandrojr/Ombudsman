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
 	<p align="center" class="obrigatorio" tabindex="4"><b>OBS.: O padrão de cores &eacute; meramente ilustrativo.</b></p>
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
   		Possibilita a consulta e manutenção dos assuntos da ouvidoria. Cada assunto está relacionado a um sub-orgão cadastrado.
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
					<label tabindex="8">Local onde são mostrados os assuntos de mensagens cadastrados no sistema. São presentes os dados:</label>
			</td>
		</tr>
		<tr>
			<td align="left" height="40" valign="top">
				<DD>
					<label tabindex="9"><b>Assunto de Mensagem</b></label>
				</DD>
			</td>
			<td valign="top">
				<label tabindex="10">Lista os assuntos de mensagem cadastrados no órgão.</label>
			</td>
		</tr>					
	  </table>
	  <br><br>
	  <table border="0" cellpadding="5" cellspacing="0" align="center" width="100%">		
		<tr>
			<td height="30" colspan="2" valign="top">
				<label tabindex="11"><b>1.1 - Está disponível o recurso de paginaçã com as operações:</b></label>
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
				<label tabindex="14">Neste espaço realizam-se operações sobre os tipos de assunto. As operações possíveis são:</label>
			</td>
		</tr>
		<tr>
			<td align="left" height="40" width="150" valign="top">
				<DD><label tabindex="15"><b>Inclusão</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="16">Criação de novos tipos de mensagens</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40" width="150" valign="top">
				<DD><label tabindex="17"><b>Alteração</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="18">Alteração dos dados dos tipos de mensagens já existente</label>
			</td>
		</tr>			
		<tr>
			<td height="40" colspan="2" valign="top">
				<label tabindex="19">Os dados disponíveis para alteração são:</label>
			</td>
		</tr>
		<tr>
			<td align="left" height="40" width="150" valign="top">
				<DD><label tabindex="20"><b>Tipo de Assunto</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="21">Campo para digitação do tipo de assunto de mensagem</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40" width="150" valign="top">
				<DD><label tabindex="22"><b>Descrição</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="23">Campo para digitação da descrição do assunto de mensagem.</label>
			</td>
		</tr>
		<tr>
			<td align="left" height="40" width="150" valign="top">
				<DD><label tabindex="24"><b>Sub-Órgão</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="25">Campo para seleção do sub-órgão ao qual o assunto está associado.</label>
			</td>
		</tr>			
		<tr>
			<td align="left" height="40" width="150" valign="top">
				<DD><label tabindex="26"><b>Prazo Interno</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="27">Campo para digitação do prazo interno do assunto de mensagem. Após esse prazo a mensagem, caso não tenha sido respondida, estará em atraso.</label>
			</td>
		</tr>		
		<tr>
			<td align="left" height="40" width="150" valign="top">
				<DD><label tabindex="28"><b>Prazo Externo</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="29">Campo para digitação do prazo externo do assunto de mensagem. Após esse prazo a mensagem, caso não tenha sido respondida, estará em atraso crítico.</label>
			</td>
		</tr>
		<tr>
			<td align="left" height="40" width="150" valign="top">
				<DD><label tabindex="30"><b>Data de vigência</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="31">Campos para digitação da data e hora do fim de vigência do assunto de mensagem. A partir dessa data e hora o assunto de mensagem estará indisponível para os usuários no sistema</label>
			</td>
		</tr>						
		<tr>
			<td height="40" colspan="2" valign="top">
				<label tabindex="32">Está disponível o botão que opera sobre o usuário:</label>
			</td>
		</tr>
		<tr>
			<td align="left" height="40" width="150" valign="top">
				<DD><label tabindex="33"><b>Incluir Assunto</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="34">Abre formulário para inclusão de um novo assunto de mensagem.</label>
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
		  <p class="voltar"><A title="imprimir esta página" href="javascript:window.print()" tabindex="39">imprimir</A> 
		    . <A title="topo da página" href="javascript:window.location=location.href;" tabindex="40">topo</A>
	 </td>
	</tr>
</table> 	    
</body>	
</HTML>