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
 	<label tabindex=1 id="titulo"><b>Parâmetros Gerais</b></label></label>
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
		<label tabindex=3><b>OBS.: O padrão de cores &eacute; meramente ilustrativo.</b></label>
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
   		<label tabindex=5>Possibilita a atualização de informações para a configuração de todo o sistema.</label>
	</td>
 </tr> 
 <tr><td valign="top"><br></td></tr> 
 <tr>
 <td valign="top">
	<table border="0" cellpadding="5" cellspacing="0">
		<tr>
			<td valign="top" colspan="2">
				<a name=cadastro align="left"><label tabindex=6><b>Manter Parâmetros Gerias<a></b></label>
			</td>
		</tr>
		<tr>
			<td valign="top" colspan="2">
				<label tabindex=7>Para alterar um parâmetro geral, preencha os seguintes campos:</label>
			</td>
		</tr>		
		<tr>
			<td valign="top" align="left" height="40" width="50%">
				<DD><label tabindex=8>Endereço (host) do servidor responsável pelo serviço de e-mail</label></DD>
			</td>
			<td valign="top">
				<label tabindex=9>Campo para digitação do endereço (host) do servidor responsável pelo serviço de e-mail.</label>
			</td>
		</tr>
		<tr>
			<td valign="top" align="left" height="40">
				<DD><label tabindex=10>Tempo limite de resposta para busca de dados de um funcionário da empresa</label></DD>
			</td>		
			<td valign="top">
				<label tabindex=11>Campo para digitação do tempo limite de resposta para busca de dados de um funcionário da empresa.</label>
			</td>			
		</tr>			
		<tr>		
			<td valign="top" align="left" height="40">
				<DD><label tabindex=12>Extensão de arquivos não permitidos na hora de anexar documento a mensagem</label></DD>
			</td>
			<td valign="top">
				<label tabindex=13>Campo para digitação das extensões de arquivos proibidas na hora de anexar documento a mensagem.</label>
			</td>			
		</tr>			
		<tr>		
			<td valign="top" align="left" height="40">
				<DD><label tabindex=14>Extensão de arquivos permitidos na hora de anexar a imagem digitalizada</label></DD>
			</td>
			<td valign="top">
				<label tabindex=15>Campo para digitação das extensões de arquivos permitidas na hora de anexar a imagem digitalizada.</label>
			</td>			
		</tr>	
		<tr>		
			<td valign="top" align="left" height="40">
				<DD><label tabindex=16>Diretório raiz da aplicação</label></DD>
			</td>
			<td valign="top">
				<label tabindex=17>Campo para digitação do diretório raiz da aplicação.</label>
			</td>			
		</tr>	
		<tr>		
			<td valign="top" align="left" height="40">
				<DD><label tabindex=18>N&uacute;mero máximo de colunas para exibição nos gráficos de indicadores</label></DD>
			</td>
			<td valign="top">
				<label tabindex=19>Campo para digitação do n&uacute;mero máximo de colunas para exibição nos gráficos de indicadores.</label>
			</td>			
		</tr>	
		<tr>		
			<td valign="top" align="left" height="40">
				<DD><label tabindex=20>N&uacute;mero máximo de falhas no login</label></DD>
			</td>
			<td valign="top">
				<label tabindex=21>Campo para digitação do n&uacute;mero máximo de falhas no login dos funcionários dos órgãos.</label>
			</td>			
		</tr>	
		<tr>		
			<td valign="top" align="left" height="40">
				<DD><label tabindex=22>Tempo de bloqueio do login</label></DD>
			</td>
			<td valign="top">
				<label tabindex=23>Campo para digitação do tempo de bloqueio do login (em minutos).</label>
			</td>			
		</tr>	
		
		<tr>
		 <td valign="middle" colspan="2" height="40">
		 	<label tabindex=24><b>Botões</b></label>
		 </td>
		</tr>		
		<tr>
			<td valign="top" align="left" height="40">
				<DD><label tabindex=25>Alterar</label></DD>
			</td>	
			<td valign="top">
				<label tabindex=26>Altera os parâmetros gerais do sistema.</label>
			</td>
		</tr>
					
	</table>	
 </td>
</tr>
<tr>
 <td valign="top">
 	<hr>
    <p class="voltar">
       <A tabindex=27 title="imprimir esta página" href="javascript:window.print()">imprimir</A>
     . <A tabindex=28 title="topo da página" href="javascript:window.location=location.href;">topo</A>
 </td>
</tr>
</table>
	
</body>	

</HTML>