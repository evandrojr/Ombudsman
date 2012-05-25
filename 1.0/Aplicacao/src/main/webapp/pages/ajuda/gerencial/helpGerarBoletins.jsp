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
<link rel="stylesheet" media="all" href="../estilos/estilo_ajuda.css" type="text/css">
<link rel="stylesheet" media="all" href="../../estilos/Azul/estilo_conteudo.css" type="text/css">
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
 	<label tabindex=1 id="titulo"><b>Criação de Boletins</b></label>
 </td>
</tr>
<tr>
 <td align="center"><br>
 	<img src="../../images/ajuda/gerarBoletim_1.jpg" tabindex="2" name="imgTela" id="imgTela" alt="Imagem da tela de gerar boletins">
 	<img src="../../images/ajuda/gerarBoletim_2.jpg" tabindex="3" name="imgTela" id="imgTela" alt="Imagem da tela de gerar boletins"> 	
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
  		Permite que um boletim seja criado a partir de relatórios extraídos do sistema, decorrentes de qualquer indicador disponível. Os boletins criados poderão ser salvos para armazenamento e divulgação, atrav&eacute;s do sistema, por e-mail ou por publicação na própria página da ouvidoria.
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
			<td height="30" colspan="2" valign="top"><a name="busca"><label tabindex="7"><b>1 - Gerar Boletins</b></label></a></td>
		</tr>
		<tr>
			<td height="40" colspan="2" valign="top">				
					<label tabindex="8">
					Os campos possíveis para a criação são:
					</label>
			</td>
		</tr>
		<tr>
			<td align="left" height="40" width="40%" valign="top">
				<DD><label tabindex="9"><b>Nome</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="10">Campo para digitação do nome do boletim.</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40" width="40%" valign="top">
				<DD><label tabindex="11"><b>N&uacute;mero</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="12">Campo para digitação do n&uacute;mero do boletim.</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40" width="40%" valign="top">
				<DD><label tabindex="13"><b>Área geradora do boletim</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="14">Campo para digitação da área geradora do boletim.</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40" width="40%" valign="top">
				<DD><label tabindex="15"><b>Responsável</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="16">Nome do funcionário que está gerando o boletim.</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40" width="40%" valign="top">
				<DD><label tabindex="17"><b>Telefone</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="18">Campo para digitação de um telefone de contato para informações sobre o boletim.</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40" width="40%" valign="top">
				<DD><label tabindex="19"><b>Conte&uacute;do</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="20">Campo para digitação do texto do boletim.</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40" width="40%" valign="top">
				<DD><label tabindex="21"><b>Informações extraídas do relatório</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="22">Campo para seleção dos itens do relatório que comporão o boletim.</label>
			</td>
		</tr>	
		
		<tr>
		<td align="left" height="40" valign="top" colspan="3">
			<label tabindex="23">
			Após o fornecimento dos campos deve-se utilizar o botão "Criar Boletins" ou a tecla "Enter", para que o sistema gere o boletim de acordo com os campos informados.<br>			
			</label>
		</td>					
		</tr>			
	 </table>
	 
	 <br><br>	
	 
	 <table border="0" cellpadding="5" cellspacing="0" align="center" width="100%">				
		<tr>
			<td height="40" colspan="2" valign="top">
				<label tabindex="24">Está disponível o botão que opera sobre a geração do boletim:</label>
			</td>
		</tr>
		<tr>
			<td align="left" height="40" valign="top">
				<DD><label tabindex="25"><b>Gerar Boletim</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="26">Abre formulário para geração do boletim.</label>
			</td>
		</tr>
		<tr>
			<td align="left" height="40" valign="top">
				<DD><label tabindex="27"><b>Criar Boletim</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="28">Cria o boletim e o exibe na tela.</label>
			</td>
		</tr>
		<tr>
			<td align="left" height="40" valign="top">
				<DD><label tabindex="29"><b>Imprimir</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="30">Imprime o boletim.</label>
			</td>
		</tr>
		<tr>
			<td align="left" height="40" valign="top">
				<DD><label tabindex="31"><b>Salvar Boletim</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="32">Registra o boletim no sistema.</label>
			</td>
		</tr>
	 </table>	 
	</td>
	</tr>
	<tr>
	 <td>
		<hr>
		 <p class="voltar"><A title="imprimir esta página" href="javascript:window.print()" tabindex="33">imprimir</A> 
		  . <A title="topo da página" href="javascript:window.location=location.href;" tabindex="34">topo</A>
	 </td>
	</tr>
</table> 	  

	
</body>	

</HTML>