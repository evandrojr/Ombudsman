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
<table border="0" cellpadding="0" cellspacing="0" width="100%" align="center">
<tr>
 <td align="center" class="titulo" align="center">
 	<label tabindex=1 id="titulo"><b>Alterar Senha</b></label>
 </td>
</tr>
<tr>
 <td align="center"><br>
 	<img src="../../images/ajuda/alterarSenha.jpg" tabindex="2" name="imgTela" id="imgTela" alt="Imagem da tela de alterar senha">
 </td>
</tr>	
<tr>
 <td>
 	<p align="center" class="obrigatorio" tabindex="3"><b>OBS.: O padrão de cores &eacute; meramente ilustrativo.</b></p>
 </td>
</tr>
 <tr><td><br><br></td></tr> 
 <tr>
  <td>
  	<b><label tabindex="4">Funcionalidade</label></b>
  </td>
 </tr>
 <tr>
  <td>
  <DD><label tabindex="5">
  		No caso de alteração de senha &eacute; aqui que você vai poder realizar o processo para continuar acessando a área restrita da Ouvidoria.
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
			<td height="40" colspan="2" valign="top">				
					<label tabindex="6">
					<b>1 - Alterar Senha</b>
					</label>
			</td>
		</tr>
		<tr>
			<td height="40" colspan="2" valign="top">				
					<label tabindex="6">
					Serve para alterar senhas de funcionários já cadastrados no sistema.<br>
					Os campos de preenchimento são:
					</label>
			</td>
		</tr>
		
		<tr>
			<td align="left" height="40" width="40%" valign="top">
				<DD><label tabindex="7"><b>CPF</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="8">Campo para digitação do CPF do usuário cadastrado.</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40" width="40%" valign="top">
				<DD><label tabindex="9"><b>Senha Atual</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="10">Campo para digitação da senha atual do usuário cadastrado.</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40" width="40%" valign="top">
				<DD><label tabindex="11"><b>Nova Senha</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="12">Campo para digitação da nova senha do usuário cadastrado.</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40" width="40%" valign="top">
				<DD><label tabindex="13"><b>Confirma Nova Senha</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="14">Campo para digitação da confirmação da nova senha do usuário cadastrado.</label>
			</td>
		</tr>		
		<tr>
		<td align="left" height="40" valign="top" colspan="3">
			<label tabindex="15">
			Após o fornecimento dos dados acima deve-se utilizar o botão "Confirmar" ou a tecla "Enter", para que o sistema faça a alteração.<br>			
			</label>
		</td>					
		</tr>			
	 </table>
	 
	 <br><br>	
	 
	 <table border="0" cellpadding="5" cellspacing="0" align="center" width="100%">				
		<tr>
			<td height="40" colspan="2" valign="top">
				<label tabindex="16">Está disponível os botões que operam sobre a alteração de senha:</label>
			</td>
		</tr>
		<tr>
			<td align="left" height="40" valign="top">
				<DD><label tabindex="17"><b>Confirmar</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="18">Envia os dados para consulta da resposta.</label>
			</td>
		</tr>
		<tr>
			<td align="left" height="40" valign="top">
				<DD><label tabindex="19"><b>Limpar</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="20">Limpa todos os campos do formulário, deixando-o em branco.</label>
			</td>
		</tr>		
	 </table>	 
	</td>
	</tr>
	<tr>
	 <td>
		<hr>
		 <p class="voltar"><A title="imprimir esta página" href="javascript:window.print()" tabindex="21">imprimir</A> 
		  . <A title="topo da página" href="javascript:window.location=location.href;" tabindex="22">topo</A>
	 </td>
	</tr>
</table> 	  

	
</body>	

</HTML>