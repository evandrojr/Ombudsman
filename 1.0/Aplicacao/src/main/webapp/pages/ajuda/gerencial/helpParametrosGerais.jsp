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
<link rel="stylesheet"  media="all" href="../../estilos/Azul/estilo_conteudo.css" type="text/css">
<script language='javascript'>

function onLoad(){
	try { document.getElementById("titulo").focus() } catch(e) {};
}
</script>
</head>		

<body onload="javascript:onLoad();" style="margin:25px 2.8em">

<table border="0" cellpadding="5" cellspacing="0" width="50%" align="center">
<tr>
 <td align="center" class="titulo" align="center">
 	<label tabindex=1 id="titulo"><b>Par�metros Gerais</b></label></label>
 </td>
</tr>
<tr>
 <td><br></td>
</tr>
<tr>
 <td valign="top" align="center">	
	<img tabindex=2 src="../../images/ajuda/parametrosGerais.jpg" name="imgTela" id="imgTela" alt="Imagem da tela de parametros gerais">	
 </td>
</tr>
<tr>
 <td valign="top">	
	<p align="center" class="obrigatorio">
		<label tabindex=3><b>OBS.: O padr�o de cores &eacute; meramente ilustrativo.</b></label>
	</p>
 </td>
</tr>
  <tr><td valign="top"><br></td></tr> 
 <tr>
   <td valign="top">
   		<label tabindex=4><b>Funcionalidade</b></label>
   </td>
 </tr>
 <tr>
    <td valign="top">
   		<label tabindex=5>Possibilita a atualiza��o de informa��es para a configura��o de todo o sistema.</label>
	</td>
 </tr> 
 <tr><td valign="top"><br></td></tr> 
 <tr>
 <td valign="top">
	<table border="0" cellpadding="5" cellspacing="0">
		<tr>
			<td valign="top" colspan="2">
				<a name=cadastro align="left"><label tabindex=6><b>Manter Par�metros Gerias<a></b></label>
			</td>
		</tr>
		<tr>
			<td valign="top" colspan="2">
				<label tabindex=7>Para alterar um par�metro geral, preencha os seguintes campos:</label>
			</td>
		</tr>		
		<tr>
			<td valign="top" align="left" height="40" width="50%">
				<DD><label tabindex=8>Endere�o (host) do servidor respons�vel pelo servi�o de e-mail</label></DD>
			</td>
			<td valign="top">
				<label tabindex=9>Campo para digita��o do endere�o (host) do servidor respons�vel pelo servi�o de e-mail.</label>
			</td>
		</tr>
		<tr>
			<td valign="top" align="left" height="40">
				<DD><label tabindex=10>Tempo limite de resposta para busca de dados de um funcion�rio da empresa</label></DD>
			</td>		
			<td valign="top">
				<label tabindex=11>Campo para digita��o do tempo limite de resposta para busca de dados de um funcion�rio da empresa.</label>
			</td>			
		</tr>			
		<tr>		
			<td valign="top" align="left" height="40">
				<DD><label tabindex=12>Extens�o de arquivos n�o permitidos na hora de anexar documento a mensagem</label></DD>
			</td>
			<td valign="top">
				<label tabindex=13>Campo para digita��o das extens�es de arquivos proibidas na hora de anexar documento a mensagem.</label>
			</td>			
		</tr>			
		<tr>		
			<td valign="top" align="left" height="40">
				<DD><label tabindex=14>Extens�o de arquivos permitidos na hora de anexar a imagem digitalizada</label></DD>
			</td>
			<td valign="top">
				<label tabindex=15>Campo para digita��o das extens�es de arquivos permitidas na hora de anexar a imagem digitalizada.</label>
			</td>			
		</tr>	
		<tr>		
			<td valign="top" align="left" height="40">
				<DD><label tabindex=16>Diret�rio raiz da aplica��o</label></DD>
			</td>
			<td valign="top">
				<label tabindex=17>Campo para digita��o do diret�rio raiz da aplica��o.</label>
			</td>			
		</tr>	
		<tr>		
			<td valign="top" align="left" height="40">
				<DD><label tabindex=18>N&uacute;mero m�ximo de colunas para exibi��o nos gr�ficos de indicadores</label></DD>
			</td>
			<td valign="top">
				<label tabindex=19>Campo para digita��o do n&uacute;mero m�ximo de colunas para exibi��o nos gr�ficos de indicadores.</label>
			</td>			
		</tr>	
		<tr>		
			<td valign="top" align="left" height="40">
				<DD><label tabindex=20>N&uacute;mero m�ximo de falhas no login</label></DD>
			</td>
			<td valign="top">
				<label tabindex=21>Campo para digita��o do n&uacute;mero m�ximo de falhas no login dos funcion�rios dos �rg�os.</label>
			</td>			
		</tr>	
		<tr>		
			<td valign="top" align="left" height="40">
				<DD><label tabindex=22>Tempo de bloqueio do login</label></DD>
			</td>
			<td valign="top">
				<label tabindex=23>Campo para digita��o do tempo de bloqueio do login (em minutos).</label>
			</td>			
		</tr>	
		
		<tr>
		 <td valign="middle" colspan="2" height="40">
		 	<label tabindex=24><b>Bot�es</b></label>
		 </td>
		</tr>		
		<tr>
			<td valign="top" align="left" height="40">
				<DD><label tabindex=25>Alterar</label></DD>
			</td>	
			<td valign="top">
				<label tabindex=26>Altera os par�metros gerais do sistema.</label>
			</td>
		</tr>
					
	</table>	
 </td>
</tr>
<tr>
 <td valign="top">
 	<hr>
    <p class="voltar">
       <A tabindex=27 title="imprimir esta p�gina" href="javascript:window.print()">imprimir</A>
     . <A tabindex=28 title="topo da p�gina" href="javascript:window.location=location.href;">topo</A>
 </td>
</tr>
</table>
	
</body>	

</HTML>