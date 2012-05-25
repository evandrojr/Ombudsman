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
 	<label tabindex=1 id="titulo"><b>Consultar Andamento de Solu��o</b></label>
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
   		Possibilita uma vis�o ampla sobre o andamento das mensagens da ouvidoria ou sobre mensagens que estejam em situa��es espec�ficas.
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
			<td height="30" colspan="2" valign="top"><a name="busca"><label tabindex="9"><b>1 - Consultar Andamento de Solu��es</b></label></a></td>
		</tr>
		<tr>
			<td height="40" colspan="2" valign="top">				
					<label tabindex="10">
					Serve para buscar boletins espec�ficos dentre os cadastrados, listando apenas as que correspondem ao crit&eacute;rio de busca selecionado.<br>
					Os crit&eacute;rios de busca poss�veis s�o:
					</label>
			</td>
		</tr>
		<tr>
			<td align="left" height="40" width="30%" valign="top">
				<DD><label tabindex="11"><b>Per�odo</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="12">Campo para digita��o do per�odo em que se deseja realizar a busca. Devem ser digitadas a data inicial e final do per�odo.</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40" width="30%" valign="top">
				<DD><label tabindex="11"><b>Assunto</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="12">Campo para sele��o de um assunto de mensagem dentre os cadastrados pela ouvidoria.</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40" width="30%" valign="top">
				<DD><label tabindex="11"><b>Tipo de Mensagem</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="12">Campo para sele��o de um tipo de mensagem dentre os cadastrados pela ouvidoria.</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40" width="30%" valign="top">
				<DD><label tabindex="11"><b>Situa��o</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="12">Campo para sele��o da situa��o da mensagem.</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40" width="30%" valign="top">
				<DD><label tabindex="11"><b>Palavra-chave</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="12">Campo para digita��o da palavra-chave para busca de mensagens dispon�veis no �rg�o. A palavra-chave ser� buscada no texto da mensagem e da resposta.</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40" width="30%" valign="top">
				<DD><label tabindex="11"><b>Protocolo</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="12">Campo para digita��o de um protocolo de mensagem.</label>
			</td>
		</tr>
		
		<tr>
		<td align="left" height="40"  valign="top" colspan="3">
			<label tabindex="17">
			Ap�s o fornecimento dos crit&eacute;rios de busca deve-se utilizar o bot�o "Buscar" ou a tecla "Enter", para que o sistema traga os boletins filtrados.<br>			
			</label>
		</td>					
		</tr>			
	  </table>
	  
	  <br><br>
	  <table border="0" cellpadding="5" cellspacing="0" align="center" width="100%">		
		<tr>
			<td height="30" colspan="2" valign="top">
				<a name="lista"><label tabindex="18"><b>2 - Listar Andamento de Solu��es</b></label></a>
			</td>
		</tr>
		<tr>
			<td height="40" colspan="2" valign="top">				
					<label tabindex="19">Local onde s�o mostradas os andamentos das solu��es cadastradas no sistema. S�o presentes os dados:</label>
			</td>
		</tr>				
		<tr>
			<td align="left" height="40" valign="top">
				<DD>
					<label tabindex="20"><b>Situa��o</b></label>
				</DD>
			</td>
			<td valign="top">
				<label tabindex="21">Situa��o atual da mensagem.</label>
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
				<label tabindex="21">Prazo interno para resposta � mensagem.</label>
			</td>
		</tr>	
				<tr>
			<td align="left" height="40" valign="top">
				<DD>
					<label tabindex="20"><b>Respons�vel</b></label>
				</DD>
			</td>
			<td valign="top">
				<label tabindex="21">Funcion�rio respons�vel por responder a mensagem.</label>
			</td>
		</tr>
	  </table>
	  <br><br>
	  <table border="0" cellpadding="5" cellspacing="0" align="center" width="100%">		
		<tr>
			<td height="30" colspan="2" valign="top">
				<label tabindex="26"><b>2.1 - Est� dispon�vel o recurso de pagina�� com as opera��es:</b></label>
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
				<a name="detalhe"><label tabindex="28"><b>3 - Detalhamento do Andamento de Solu��o</b></label></a>
			</td>
		</tr>
		<tr>
			<td height="40" colspan="2" valign="top">
				<label tabindex="29">Os campos dispon�veis para visualiza��o s�o:</label>
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
				<DD><label tabindex="30"><b>Localidade da Ocorr�ncia</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="31">Localidade da ocorr�ncia do ocorrido na mensagem.</label>
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
				<label tabindex="31">Link para arquivo anexado � mensagem.</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40"  valign="top">
				<DD><label tabindex="30"><b>Tipo de Usu�rio</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="31">Tipo de usu�rio mensagem.</label>
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
				<DD><label tabindex="30"><b>Faixa et�ria</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="31">Faixa et�ria do acionador.</label>
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
				<DD><label tabindex="30"><b>Pa�s de Envio</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="31">Pa�s de onde a cidade foi enviada. </label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40"  valign="top">
				<DD><label tabindex="30"><b>Informa��o da resposta por carta</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="31">Endere�o do acionador para respostas por carta. </label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40"  valign="top">
				<DD><label tabindex="30"><b>Especialista</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="31">Funcion�rio respons�vel por responder a mensagem.</label>
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
				<label tabindex="31">Resposta dada � mensagem.</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40"  valign="top">
				<DD><label tabindex="30"><b>Avalia��o</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="31">Avalia��o do acionador para a resposta fornecida pela ouvidoria.</label>
			</td>
		</tr>
	  </table>	 
	</td>
	</tr>
	<tr>
	 <td>
		<hr>
		  <p class="voltar"><A title="imprimir esta p�gina" href="javascript:window.print()" tabindex="61">imprimir</A> 
		    . <A title="topo da p�gina" href="javascript:window.location=location.href;" tabindex="62">topo</A>
	 </td>
	</tr>
</table>
</body>	
</HTML>