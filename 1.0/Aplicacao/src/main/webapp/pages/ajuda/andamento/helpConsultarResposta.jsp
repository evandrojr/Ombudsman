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
<body onload="javascript:onLoad();">
<table border="0" cellpadding="0" cellspacing="0">
<tr>
 <td align="center" class="titulo" align="center">
 	<label tabindex=1 id="titulo"><b>Consultar sua Resposta</b></label>
 </td>
</tr>
<tr>
 <td align="center"><br><img src="../../images/ajuda/consultarAndamentoSolucao.jpg" tabindex="1" name="imgTela" id="imgTela" alt="Imagem da tela consultar andamento de solução"></td>
</tr>	
<tr>
 <td><p align="center" class="obrigatorio"><b>OBS.: O padrão de cores &eacute; meramente ilustrativo.</b></p></td>
</tr>
 <tr><td><br><br></td></tr> 
 <tr>
   <td><b>Funcionalidade</b></td>
 </tr>
 <tr>
   <td>Possibilita uma visão ampla sobre o andamento das mensagens da ouvidoria ou sobre mensagens que estejam em situações específicas.</td>
 </tr> 
  <tr><td><br><br></td></tr> 
<tr>
 <td>
  		<table border="0" cellpadding="5" cellspacing="0">
		<tr><td colspan="2" valign="top"><b><a name=busca>1 - Consultar solução do acionamento<a></b></td></tr>
		<tr><td height="40" colspan="2" valign="top">Para consultar a solução do acionamento, preencha os seguintes campos:</td></tr>
		<tr>
			<td align="left" height="40" valign="top">Protocolo</td>
			<td valign="top">Campo para digitação do protocolo, que lhe foi fornecido no momento do acionamento.</td>
		</tr>
		<tr>
			<td align="left" height="40" width="150" valign="top">Código de acesso</td>		
			<td valign="top">Campo para digitação do código de acesso, que lhe foi fornecido no momento do acionamento. <br>Não há diferenças entre letras mai&uacute;sculas e min&uacute;sculas.</td>
		</tr>
		<tr>
		 <td colspan="2" height="30" valign="top"><b>Botões</b></td>
		</tr>		
		<tr>
			<td align="left" height="40" valign="top">Confirmar</td>	
			<td valign="top">Envia o formulário.</td>
		</tr>
		<tr>
			<td align="left" height="40" valign="top">Limpar</td>	
			<td valign="top">Limpa todos os campos do formulário, deixando-o em branco.</td>
		</tr>
		<tr><td colspan="2" valign="top">No caso de perda ou esquecimento do seu código de acesso, clique no link "Esqueceu seu código de acesso?"</td></tr>		
		<tr>
			<td align="left" height="40" width="30%" valign="top">Esqueceu seu código de acesso?</td>		
			<td valign="top">Leva ao formulário para recuperação do código de acesso.</td>			
		</tr>
	</table>	
</td>
</tr>
<tr>
 <td>
	<hr>
	  <p class="voltar"><A title="imprimir esta página" href="javascript:window.print()" tabindex="10">imprimir</A> 
	    . <A title="topo da página" href="javascript:window.location=location.href;" tabindex="11">topo</A>
 </td>
</tr>
</table>
	
</body>	

</HTML>