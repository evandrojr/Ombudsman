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
 	<label tabindex=1 id="titulo"><b>Acesso Restrito</b></label>
 </td>
</tr>
<tr>
 <td align="center"><br>
 	<img src="../../images/ajuda/login.jpg" tabindex="2" name="imgTela" id="imgTela" alt="Imagem da tela de login">
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
  		Para ter acesso a área restrita da Ouvidoria, &eacute; necessário efetuar o login no sistema.
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
					<b>1 - Login</b>
					</label>
			</td>
		</tr>
		<tr>
			<td height="40" colspan="2" valign="top">				
					<label tabindex="7">
					Serve para autenticar o funcionário no sistema para que este tenha acesso a área restrita da Ouvidoria.<br>
					Os campos de preenchimento são:
					</label>
			</td>
		</tr>
		
		<tr>
			<td align="left" height="40" width="40%" valign="top">
				<DD><label tabindex="8"><b>CPF</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="9">Campo para digitação do CPF do usuário cadastrado.</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40" width="40%" valign="top">
				<DD><label tabindex="10"><b>Senha</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="11">Campo para digitação da senha do usuário cadastrado.</label>
			</td>
		</tr>					
	 </table>
	 
	 <br><br>	
	 
	 <table border="0" cellpadding="5" cellspacing="0" align="center" width="100%">				
		<tr>
			<td height="40" colspan="2" valign="top">
				<label tabindex="12">Está disponível os botões que operam sobre a alteração de senha:</label>
			</td>
		</tr>
		<tr>
			<td align="left" height="40" valign="top">
				<DD><label tabindex="13"><b>Confirmar</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="14">Envia os dados para consulta da resposta.</label>
			</td>
		</tr>
		<tr>
			<td align="left" height="40" valign="top">
				<DD><label tabindex="15"><b>Limpar</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="16">Limpa todos os campos do formulário, deixando-o em branco.</label>
			</td>
		</tr>		
		<tr>
			<td align="left" height="40" valign="top">
				<DD><label tabindex="17"><b>Alterar senha</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="18">Acesso a página onde o usuário irá realizar a troca da senha.</label>
			</td>
		</tr>
	 </table>	 
	</td>
	</tr>
	<tr>
	 <td>
		<hr>
		 <p class="voltar"><A title="imprimir esta página" href="javascript:window.print()" tabindex="19">imprimir</A> 
		  . <A title="topo da página" href="javascript:window.location=location.href;" tabindex="20">topo</A>
	 </td>
	</tr>
</table> 	  

	
</body>	

</HTML>