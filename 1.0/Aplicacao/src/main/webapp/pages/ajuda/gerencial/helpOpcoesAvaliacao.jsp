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
 	<label tabindex=1 id="titulo"><b>Opções de Avaliação</b></label>
 </td>
</tr>
<tr>
 <td align="center"><br>
 	<img src="../../images/ajuda/opcoesAvaliacao_1.jpg" tabindex="2" name="imgTela" id="imgTela" alt="Imagem da tela opções de avaliação">
 	<img src="../../images/ajuda/opcoesAvaliacao_2.jpg" tabindex="3" name="imgTela" id="imgTela" alt="Imagem da tela opções de avaliação"> 	
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
   		Possibilita a consulta e manutenção das opções de avaliação que são disponibilizadas ao acionador durante a consulta à resposta de um acionamento.
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
				<a name="lista"><label tabindex="7"><b>1 - Lista de Opções de Avaliação</b></label></a>
			</td>
		</tr>
		<tr>
			<td height="40" colspan="2" valign="top">				
					<label tabindex="8">Local onde são mostrados as Opções de Avaliação cadastrados no sistema. São presentes os dados:</label>
			</td>
		</tr>
		<tr>
			<td align="left" height="40" valign="top">
				<DD>
					<label tabindex="9"><b>Opção de avaliação</b></label>
				</DD>
			</td>
			<td valign="top">
				<label tabindex="10">Lista as opções de avaliação cadastradas no órgão.</label>
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
				<a name="detalhe"><label tabindex="13"><b>2 - Detalhamento da Opção de Avaliação</b></label></a>
			</td>
		</tr>
		<tr>
			<td height="40" colspan="2" valign="top">
				<label tabindex="14">Neste espaço realizam-se operações sobre a Opção de Avaliação. As operações possíveis são:</label>
			</td>
		</tr>
		<tr>
			<td align="left" height="40" width="150" valign="top">
				<DD><label tabindex="15"><b>Inclusão</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="16">Criação de novas Opções de Avaliação
			</td>
		</tr>	
		<tr>
			<td align="left" height="40" width="150" valign="top">
				<DD><label tabindex="17"><b>Alteração</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="18">Alteração dos dados das Opções de Avaliação já existente</label>
			</td>
		</tr>			
		<tr>
			<td height="40" colspan="2" valign="top">
				<label tabindex="19">Os dados disponíveis para alteração são:</label>
			</td>
		</tr>
		<tr>
			<td align="left" height="40" width="150" valign="top">
				<DD><label tabindex="20"><b>Opção de Avaliação</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="21">Campo para digitação do nome do sub-órgão.</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40" width="150" valign="top">
				<DD><label tabindex="22"><b>Data de vigência</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="23">Campos para digitação da data e hora do fim de vigência da opção de avaliação. A partir dessa data e hora a opção de avaliação estará indisponível para os usuários no sistema.</label>
			</td>
		</tr>
		<tr>
			<td align="left" height="40" width="150" valign="top">
				<DD><label tabindex="24"><b>Tipo de avaliação</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="25">Campo para seleção da classificação da opção de avaliação, se positiva ou negativa.</label>
			</td>
		</tr>					
		<tr>
			<td height="40" colspan="2" valign="top">
				<label tabindex="32">Está disponível o botão que opera sobre o usuário:</label>
			</td>
		</tr>
		<tr>
			<td align="left" height="40" width="150" valign="top">
				<DD><label tabindex="33"><b>Incluir Opção</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="34">Abre formulário para inclusão de uma nova opção de avaliação.</label>
			</td>
		</tr>									
		<tr>
			<td align="left" height="40" width="150" valign="top">
				<DD><label tabindex="35"><b>Alterar</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="36">Altera os dados da opção de avaliação.</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40" width="150" valign="top">
				<DD><label tabindex="37"><b>Salvar</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="38">Registra os dados da opção de avaliação.</label>
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