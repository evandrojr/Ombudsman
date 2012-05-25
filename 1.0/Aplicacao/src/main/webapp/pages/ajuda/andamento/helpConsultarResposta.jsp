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
<body onload="javascript:onLoad();">
<table border="0" cellpadding="0" cellspacing="0">
<tr>
 <td align="center" class="titulo" align="center">
 	<label tabindex=1 id="titulo"><b>Consultar sua Resposta</b></label>
 </td>
</tr>
<tr>
 <td align="center"><br><img src="../../images/ajuda/consultarAndamentoSolucao.jpg" tabindex="1" name="imgTela" id="imgTela" alt="Imagem da tela consultar andamento de solu��o"></td>
</tr>	
<tr>
 <td><p align="center" class="obrigatorio"><b>OBS.: O padr�o de cores &eacute; meramente ilustrativo.</b></p></td>
</tr>
 <tr><td><br><br></td></tr> 
 <tr>
   <td><b>Funcionalidade</b></td>
 </tr>
 <tr>
   <td>Possibilita uma vis�o ampla sobre o andamento das mensagens da ouvidoria ou sobre mensagens que estejam em situa��es espec�ficas.</td>
 </tr> 
  <tr><td><br><br></td></tr> 
<tr>
 <td>
  		<table border="0" cellpadding="5" cellspacing="0">
		<tr><td colspan="2" valign="top"><b><a name=busca>1 - Consultar solu��o do acionamento<a></b></td></tr>
		<tr><td height="40" colspan="2" valign="top">Para consultar a solu��o do acionamento, preencha os seguintes campos:</td></tr>
		<tr>
			<td align="left" height="40" valign="top">Protocolo</td>
			<td valign="top">Campo para digita��o do protocolo, que lhe foi fornecido no momento do acionamento.</td>
		</tr>
		<tr>
			<td align="left" height="40" width="150" valign="top">C�digo de acesso</td>		
			<td valign="top">Campo para digita��o do c�digo de acesso, que lhe foi fornecido no momento do acionamento. <br>N�o h� diferen�as entre letras mai&uacute;sculas e min&uacute;sculas.</td>
		</tr>
		<tr>
		 <td colspan="2" height="30" valign="top"><b>Bot�es</b></td>
		</tr>		
		<tr>
			<td align="left" height="40" valign="top">Confirmar</td>	
			<td valign="top">Envia o formul�rio.</td>
		</tr>
		<tr>
			<td align="left" height="40" valign="top">Limpar</td>	
			<td valign="top">Limpa todos os campos do formul�rio, deixando-o em branco.</td>
		</tr>
		<tr><td colspan="2" valign="top">No caso de perda ou esquecimento do seu c�digo de acesso, clique no link "Esqueceu seu c�digo de acesso?"</td></tr>		
		<tr>
			<td align="left" height="40" width="30%" valign="top">Esqueceu seu c�digo de acesso?</td>		
			<td valign="top">Leva ao formul�rio para recupera��o do c�digo de acesso.</td>			
		</tr>
	</table>	
</td>
</tr>
<tr>
 <td>
	<hr>
	  <p class="voltar"><A title="imprimir esta p�gina" href="javascript:window.print()" tabindex="10">imprimir</A> 
	    . <A title="topo da p�gina" href="javascript:window.location=location.href;" tabindex="11">topo</A>
 </td>
</tr>
</table>
	
</body>	

</HTML>