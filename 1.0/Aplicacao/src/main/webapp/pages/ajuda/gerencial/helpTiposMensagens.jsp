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
 	<label tabindex=1 id="titulo"><b>Tipos de Mensagens</b></label>
 </td>
</tr>
<tr>
 <td align="center"><br>
 	<img src="../../images/ajuda/tiposMensagens_1.jpg" tabindex="2" name="imgTela" id="imgTela" alt="Imagem da tela tipos de mensagens" width="655">
 	<img src="../../images/ajuda/tiposMensagens_2.jpg" tabindex="3" name="imgTela" id="imgTela" alt="Imagem da tela tipos de mensagens" width="655">
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
   		Possibilita a consulta e manutenção dos tipos de mensagem cadastrados para a ouvidoria.
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
				<a name="lista"><label tabindex="9"><b>1 - Lista de Tipos de Mensagens</b></label></a>
			</td>
		</tr>
		<tr>
			<td height="40" colspan="2" valign="top">				
					<label tabindex="10">Local onde são mostrados os Tipos de Mensagens cadastrados no sistema. São presentes os dados:</label>
			</td>
		</tr>
		<tr>
			<td align="left" height="40" valign="top">
				<DD>
					<label tabindex="11"><b>Tipo de Mensagem</b></label>
				</DD>
			</td>
			<td valign="top">
				<label tabindex="12">Lista os tipos de mensagem cadastrados no órgão.</label>
			</td>
		</tr>				
	  </table>
	  
	  <br><br>
	  
	  <table border="0" cellpadding="5" cellspacing="0" align="center" width="100%">		
		<tr>
			<td height="30" colspan="2" valign="top">
				<label tabindex="13"><b>1.1 - Está disponível o recurso de paginaçã com as operações:</b></label>
			</td>
		</tr>			
		<tr>
			<td valign="top" tabindex="14"><%@ include file="../paginacao.jsp" %></td>
		</tr>			
	  </table>
	  
	  <br><br>
	  
	  <table border="0" cellpadding="5" cellspacing="0" align="center" width="100%">		
		<tr>
			<td height="30" colspan="2" valign="top">
				<a name="detalhe"><label tabindex="15"><b>2 - Detalhamento do Tipo de Mensagem</b></label></a>
			</td>
		</tr>
		<tr>
			<td height="40" colspan="2" valign="top">
				<label tabindex="16">Neste espaço realizam-se operações sobre os Tipos de Mensagens. Os campos possíveis para alteração são:</label>
			</td>
		</tr>
		<tr>
			<td align="left" height="40" width="30%" valign="top">
				<DD><label tabindex="17><b>Tipo de Mensagem</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="18">Campo para digitação do tipo de mensagem.</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40"  valign="top">
				<DD><label tabindex="19"><b>Descrição</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="20">Campo para digitação da descrição do tipo de mensagem.</label>
			</td>			
		</tr>	
		<tr>
			<td align="left" height="40"  valign="top">
				<DD><label tabindex="21"><b>Prazo Interno</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="22">Campo para digitação do prazo interno do tipo de mensagem. Esse prazo será prioritário para definição do prazo da mensagem em relação aos prazos do assunto.Após esse prazo a mensagem, caso não tenha sido respondida, estará em atraso.</label>
			</td>			
		</tr>
				<tr>
			<td align="left" height="40"  valign="top">
				<DD><label tabindex="23"><b>Prazo Externo</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="24">Campo para digitação do prazo externo do tipo de mensagem. Esse prazo será prioritário para definição do prazo da mensagem em relação aos prazos do assunto.Após esse prazo a mensagem, caso não tenha sido respondida, estará em atraso crítico.</label>
			</td>			
		</tr>
		<tr>
			<td align="left" height="40"  valign="top">
				<DD><label tabindex="25"><b>Data de vigência</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="26"></label>
			</td>			
		</tr>
		<tr>
			<td align="left" height="40"  valign="top">
				<DD><label tabindex="27"><b>Campos para digitação da data e hora do fim de vigência do tipo de mensagem. A partir dessa data e hora o tipo de mensagem estará indisponível para os usuários no sistema.</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="28"></label>
			</td>			
		</tr>
		<tr>				
			<td height="40" colspan="2" valign="top">
				<label tabindex="29">Estao disponíveis os botões que operam sobre o Sub-Órgão:</label>
			</td>
		</tr>
		<tr>
			<td align="left" height="40" width="30%" valign="top">
				<DD><label tabindex="30"><b>Incluir Novo Tipo</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="31">Abre formulário para inclusão de um novo tipo de mensagem.</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40" width="30%" valign="top">
				<DD><label tabindex="32"><b>Alterar</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="33">Altera os dados do tipo de mensagem.</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40" width="30%" valign="top">
				<DD><label tabindex="34"><b>Salvar</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="35">Registra os dados do tipo de mensagem.</label>
			</td>
		</tr>	
	  </table>	
	</td>
	</tr>
	<tr>
	 <td>
		<hr>
		  <p class="voltar"><A title="imprimir esta página" href="javascript:window.print()" tabindex="36">imprimir</A> 
		    . <A title="topo da página" href="javascript:window.location=location.href;" tabindex="37">topo</A>
	 </td>
	</tr>
</table> 	    
</body>	
</HTML>