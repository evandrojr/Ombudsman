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
 	<label tabindex=1 id="titulo"><b>Manter Banco de Soluções</b></label>
 </td>
</tr>
<tr>
 <td align="center"><br>
 	<img src="../../images/ajuda/manterBancoSolucoes_1.jpg" tabindex="2" name="imgTela" id="imgTela" alt="Imagem da tela manter banco soluções" width="656">
 	<img src="../../images/ajuda/manterBancoSolucoes_2.jpg" tabindex="3" name="imgTela" id="imgTela" alt="Imagem da tela manter banco soluções">
 	<img src="../../images/ajuda/manterBancoSolucoes_3.jpg" tabindex="4" name="imgTela" id="imgTela" alt="Imagem da tela manter banco soluções">
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
   		Possibilita a consulta e manutenção das soluções cadastradas no sistema.
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
			<td height="30" colspan="2" valign="top"><a name="busca"><label tabindex="9"><b>1 - Consultar Solução</b></label></a></td>
		</tr>
		<tr>
			<td height="40" colspan="2" valign="top">				
					<label tabindex="10">
					Serve para buscar soluções específicas dentre as cadastradas, listando apenas as que correspondem ao crit&eacute;rio de busca selecionado.<br>
					Os crit&eacute;rios de busca possíveis são:
					</label>
			</td>
		</tr>
		<tr>
			<td align="left" height="40" width="150" valign="top">
				<DD><label tabindex="11">Tipo de Assunto</label></DD>
			</td>
			<td valign="top">
				<label tabindex="12">Campo para seleção de um assunto de mensagem dentre os cadastrados pela ouvidoria.</label>
			</td>
		</tr>			
		<tr>
			<td align="left" height="40" width="150" valign="top">
				<DD><label tabindex="11">Palavra-chave</label></DD>
			</td>
			<td valign="top">
				<label tabindex="12">Será comparada com o conte&uacute;do do nome e da descrição das soluções disponíveis.</label>
			</td>
		</tr>	
		<tr>
		<td align="left" height="40"  valign="top" colspan="3">
			<label tabindex="13">
			Após o fornecimento dos crit&eacute;rios de busca deve-se utilizar o botão "Buscar" ou a tecla "Enter", para que o sistema traga as soluções filtrados.<br>
			O botão "Nova Solução" permite que sejam incluidas novas soluções no banco.
			</label>
		</td>					
		</tr>			
	  </table>
	  
	  <br><br>
	  <table border="0" cellpadding="5" cellspacing="0" align="center" width="100%">		
		<tr>
			<td height="30" colspan="2" valign="top">
				<a name="lista"><label tabindex="8"><b>1 - Lista de Soluções</b></label></a>
			</td>
		</tr>
		<tr>
			<td height="40" colspan="2" valign="top">				
					<label tabindex="9">Local onde são mostradas as soluções cadastradas no sistema. São presentes os dados:</label>
			</td>
		</tr>
		<tr>
			<td align="left" height="40" valign="top">
				<DD>
					<label tabindex="10"><b>Solução</b></label>
				</DD>
			</td>
			<td valign="top">
				<label tabindex="11">Título e n&uacute;mero de registro das soluções encontradas.</label>
			</td>
		</tr>					
	  </table>
	  
	  <br><br>
	  
	  <table border="0" cellpadding="5" cellspacing="0" align="center" width="100%">		
		<tr>
			<td height="30" colspan="2" valign="top">
				<label tabindex="12"><b>1.1 - Está disponível o recurso de paginaçã com as operações:</b></label>
			</td>
		</tr>			
		<tr>
			<td valign="top" tabindex="13"><%@ include file="../paginacao.jsp" %></td>
		</tr>			
	  </table>
	  
	  <br><br>
	  
	  <table border="0" cellpadding="5" cellspacing="0" align="center" width="100%">		
		<tr>
			<td height="30" colspan="2" valign="top">
				<a name="detalhe"><label tabindex="14"><b>2 - Detalhamento da Solução</b></label></a>
			</td>
		</tr>
		<tr>
			<td height="40" colspan="2" valign="top">
				<label tabindex="15">Neste espaço realizam-se operações sobre as Soluções. As operações possíveis são:</label>
			</td>
		</tr>
		<tr>
			<td align="left" height="40" width="150" valign="top">
				<DD><label tabindex="16"><b>Inclusão</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="17">Criação de nova Solução.</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40" width="150" valign="top">
				<DD><label tabindex="18"><b>Alteração</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="19">Alteração dos dados da solução já existente</label>
			</td>			
		</tr>	
		<tr>
			<td align="left" height="40" width="150" valign="top">
				<DD><label tabindex="18"><b>Exclusão</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="19">A exclusão da solução &eacute; feita no momento em que o campo Data de Vigência &eacute; preenchido.</label>
			</td>			
		</tr>	
		<tr>				
			<td height="40" colspan="2" valign="top">
				<label tabindex="20">Os dados disponíveis para a alteração são:</label>
			</td>
		</tr>
		<tr>
			<td align="left" height="40" width="150" valign="top">
				<DD><label tabindex="21"><b>Tipo Assunto</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="22">Campo para seleção de um assunto de mensagem dentre os cadastrados pela ouvidoria.</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40" width="150" valign="top">
				<DD><label tabindex="21"><b>Vigência</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="22">Campo para digitação da data e hora do fim da vigência da solução.</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40" width="150" valign="top">
				<DD><label tabindex="21"><b>Identificação</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="22">Campo para digitação do título de identificação da solução.</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40" width="150" valign="top">
				<DD><label tabindex="21"><b>Texto</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="22">Campo para digitação do texto da solução.</label>
			</td>
		</tr>	
		<tr>				
			<td height="40" colspan="2" valign="top">
				<label tabindex="20">Estao disponíveis os botões que operam sobre o Script:</label>
			</td>
		</tr>
		<tr>
			<td align="left" height="40" width="150" valign="top">
				<DD><label tabindex="21"><b>Buscar</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="22">Envia os dados para consulta da solução.</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40" width="150" valign="top">
				<DD><label tabindex="23"><b>Nova Solução</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="24">Abre formulário para inclusão de uma nova solução.</label>
			</td>			
		</tr>	
		<tr>
			<td align="left" height="40" width="150" valign="top">
				<DD><label tabindex="23"><b>Alterar</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="24">Grava as alterações realizadas na solução.</label>
			</td>			
		</tr>
		<tr>
			<td align="left" height="40" width="150" valign="top">
				<DD><label tabindex="23"><b>Incluir</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="24">Inclui a solução.</label>
			</td>			
		</tr>
	  </table>	  
	 	 
	</td>
	</tr>
	<tr>
	 <td>
		<hr>
		  <p class="voltar"><A title="imprimir esta página" href="javascript:window.print()" tabindex="27">imprimir</A> 
		    . <A title="topo da página" href="javascript:window.location=location.href;" tabindex="28">topo</A>
	 </td>
	</tr>
</table> 	    

	
</body>	

</HTML>