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
 	<label tabindex=1 id="titulo"><b>Acionamento</b></label></label>
 </td>
</tr>
<tr>
 <td><br></td>
</tr>
<tr>
 <td valign="top" align="center">	
	<img tabindex=2 src="../../images/ajuda/acionamento_1.jpg" name="imgTela" id="imgTela" alt="Imagem da tela de cadastro de acionamento">
	<img tabindex=3 src="../../images/ajuda/acionamento_2.jpg" name="imgTela" id="imgTela" alt="Imagem da tela de cadastro de acionamento">
	<img tabindex=4 src="../../images/ajuda/acionamento_3.jpg" name="imgTela" id="imgTela" alt="Imagem da tela de cadastro de acionamento">
	<img tabindex=5 src="../../images/ajuda/acionamento_4.jpg" name="imgTela" id="imgTela" alt="Imagem da tela de cadastro de acionamento">
    <img tabindex=6 src="../../images/ajuda/acionamento_7.jpg" name="imgTela" id="imgTela" alt="Imagem da tela de cadastro de acionamento">
	<img tabindex=7 src="../../images/ajuda/acionamento_5.jpg" name="imgTela" id="imgTela" alt="Imagem da tela de cadastro de acionamento">
	<img tabindex=8 src="../../images/ajuda/acionamento_6.jpg" name="imgTela" id="imgTela" alt="Imagem da tela de cadastro de acionamento">
 </td>
</tr>
<tr>
 <td valign="top">	
	<p align="center" class="obrigatorio">
		<label tabindex=9><b>OBS.: O padrão de cores &eacute; meramente ilustrativo.</b></label>
	</p>
 </td>
</tr>
  <tr><td valign="top"><br></td></tr> 
 <tr>
   <td valign="top">
   		<label tabindex=10><b>Funcionalidade</b></label>
   </td>
 </tr>
 <tr>
    <td valign="top">
   		<label tabindex=11>Esse &eacute; o seu canal de comunicação com a ouvidoria. As informações aqui preenchidas serão utilizadas para que possamos lhe responder com o máximo de clareza e eficiência.</label>
	</td>
 </tr> 
 <tr><td valign="top"><br></td></tr> 
 <tr>
 <td valign="top">
	<table border="0" cellpadding="5" cellspacing="0">
		<tr>
			<td valign="top" colspan="2">
				<a name=cadastro align="left"><label tabindex=12><b>Cadastro de Acionamento<a></b></label>
			</td>
		</tr>
		<tr>
			<td valign="top" colspan="2">
				<label tabindex=13>Para cadastrar um acionamento, preencha os seguintes campos:</label>
			</td>
		</tr>
		<tr>
			<td height="40" valign="middle" colspan="2">
				<label tabindex=14><b>Dados da Mensagem</b></label>
			</td>
		</tr>		
		<tr>
			<td valign="top" align="left" height="40" width="28%">
				<DD><label tabindex=15>Tipo da Mensagem</label></DD>
			</td>
			<td valign="top">
				<label tabindex=16>Campo para seleção de um tipo de mensagem dentre os cadastrados pela ouvidoria.</label>
			</td>
		</tr>
		<tr>
			<td valign="top" align="left" height="40">
				<DD><label tabindex=17>Assunto da Mensagem</label></DD>
			</td>		
			<td valign="top">
				<label tabindex=18>Campo para seleção de um assunto de mensagem dentre os cadastrados pela ouvidoria.</label>
			</td>			
		</tr>			
		<tr>		
			<td valign="top" align="left" height="40">
				<DD><label tabindex=19>Localidade da Ocorrência</label></DD>
			</td>
			<td valign="top">
				<label tabindex=20>Campo para seleção da localidade da ocorrência relatada na mensagem.</label>
			</td>			
		</tr>			
		<tr>
			<td valign="top" align="left" height="40">
				<DD><label tabindex=21>Mensagem</label></DD>
			</td>
			<td valign="top">
				<label tabindex=22>Campo para livre digitação da mensagem à ouvidoria.
			</td>			
		</tr>			
		<tr>			
			<td valign="top" align="left" height="40">
				<DD><label tabindex=23>Anexo</label></DD>
			</td>
			<td valign="top">
				<label tabindex=24>Campo para inserção de um arquivo que será anexado à mensagem e enviado à ouvidoria. Há restrição de tamanho (exibido ao lado do campo) e de tipos (exibido na mensagem de erro no momento do envio) de arquivos aceitos.<br><br>
				Item opcional, sua utilização depende da configuração da Ouvidoria.</label>
			</td>			
		</tr>
		<tr>			
			<td valign="top" align="left" height="50" valign="middle">
				<DD><label tabindex=25>Mensagem Digitalizada</label></DD>
			</td>
			<td valign="top">
				<label tabindex=26>Este campo será preenchido apenas se Campo para inserção de um arquivo de imagem contendo a digitalização do acionamento enviado à ouvidoria (carta ou fax), que será anexado à mensagem. Há restrição de tamanho (exibido ao lado do campo) e de tipos (exibido na mensagem de erro no momento do envio) de arquivos aceitos.<br><br>
 				 Item opcional, sua utilização depende da configuração da Ouvidoria.</label>
			</td>			
		</tr>
		<tr>			
			<td valign="top" align="left" height="50" colspan="2">		
				<label tabindex=27><b>Anexando um arquivo: </b>Para anexar um arquivo, clique no botão procurar.
				O sitema abrirá uma caixa para que se faça a seleção do arquivo a ser anexado.
				Após selecionar o arquivo, clique em abrir.</DD></label>
			</td>
		</tr>	
		<tr>
			<td valign="middle" height="40" colspan="2">
				<label tabindex=28><b>Dados da Pessoais</b></label>
			</td>
		</tr>
		
		<tr>			
			<td valign="top" align="left" height="40">
				<DD><label tabindex=29>Tipo de Usuário</label></DD>
			</td>
			<td valign="top">
				<label tabindex=30>Campo para seleção de um tipo de usuário dentre os aceitos pela ouvidoria.</label>
			</td>
		</tr>
		<tr>
			<td valign="top" align="left" height="50" valign="bottom">
				<DD><label tabindex=31>Sexo</label></DD>
			</td>	
			<td valign="top" valign="bottom">
				<label tabindex=32>Campo para seleção do sexo do acionador.</label>
			</td>
		</tr>
		<tr>
			<td valign="top" align="left" height="40">
				<DD><label tabindex=33>Escolaridade</label></DD>
			</td>	
			<td valign="top">
				<label tabindex=34>Campo para seleção da escolaridade do acionador.</label>
			</td>
		</tr>
		<tr>
			<td valign="top" align="left" height="40">
				<DD><label tabindex=35>Faixa etária</label></DD>
			</td>	
			<td valign="top">
				<label tabindex=36>Campo para seleção da faixa etária do acionador.</label>
			</td>
		</tr>
		<tr>
			<td valign="top" align="left" height="40" valign="middle">
				<DD><label tabindex=37>Local de envio</label></DD>
			</td>	
			<td valign="top">
				<label tabindex=38>Campo para seleção do local de onde a mensagem está sendo enviada. Caso seja selecionado o país Brasil, será exibido tamb&eacute;m o campo para seleção do estado.</label>
			</td>
		</tr>
		<tr>			
			<td valign="top" colspan="2">
				<label tabindex=39><b>Tipo de Usuário:</b> Funcionário</label></DD><br><br>
				<DD><label tabindex=40>&eacute; obrigatório o preenchimento dos campos Matrícula e CPF</label></DD>
			</td>
		</tr>
		<tr>
			<td valign="top" align="left" height="40" valign="middle">
				<DD><label tabindex=41>Matrícula</label></DD>
			</td>
			<td valign="top">
				<label tabindex=42>Campo para digitação da matrícula do funcionário.</label>
			</td>
		</tr>	
		<tr>
			<td valign="top" align="left" height="40">
				<DD><label tabindex=43>CPF</label></DD>
			</td>	
			<td valign="top">
				<label tabindex=44>Campo para digitação do CPF do acionador.</label>
			</td>
		</tr>
		<tr>
			<td valign="top" align="left" height="40">
				<DD><label tabindex=45>Setor</label></DD>
			</td>	
			<td valign="top">
				<label tabindex=46>Campo para digitação do setor onde está alocado o acionador funcionário.</label>
			</td>
		</tr>
		<tr>			
			<td valign="top" colspan="2">
				<label tabindex=47><b>Tipo de Usuário:</b> Pessoa Física</label></DD><br><br>
				<DD><label tabindex=48>&eacute; obrigatório o preenchimento do campo Nome</label></DD>
			</td>
		</tr>
		<tr>
			<td valign="top" align="left" height="40">
				<DD><label tabindex=49>Nome</label></DD>
			</td>	
			<td valign="top">
				<label tabindex=50>Campo para digitação do nome do acionador.</label>
			</td>
		</tr>
		<tr>			
			<td valign="top" colspan="2">
				<label tabindex=51><b>Tipo de Usuário:</b> Pessoa Jurídica</label></DD><br><br>
				<DD><label tabindex=52>&eacute; obrigatório o preenchimento dos campos CPF do Acionador, Razão Social e CNPJ</label></DD>
			</td>
		</tr>
		<tr>
			<td valign="top" align="left" height="40">
				<DD><label tabindex=53>CPF do acionador</label></DD>
			</td>	
			<td valign="top">
				<label tabindex=54>Campo para digitação do CPF do contato para o acionador pessoa jurídica.</label>
			</td>
		</tr>
		<tr>
			<td valign="top" align="left" height="40">
				<DD><label tabindex=55>Nome de contato</label></DD>
			</td>	
			<td valign="top" valign="middle">
				<label tabindex=56>Campo para digitação do nome de contato para o acionador pessoa jurídica.</label>
			</td>
		</tr>
		<tr>
			<td valign="top" align="left" height="40">
				<DD><label tabindex=57>Razão Social</label></DD>
			</td>	
			<td valign="top">
				<label tabindex=58>Campo para digitação da razão social do acionador pessoa jurídica.</label>
			</td>
		</tr>
		<tr>
			<td valign="top" align="left" height="40">
				<DD><label tabindex=59>CNPJ</label></DD>
			</td>	
			<td valign="top">
				<label tabindex=60>Campo para digitação do CNPJ do acionador pessoa jurídica.</label>
			</td>
		</tr>		
		<tr>
			<td valign="middle" height="40" colspan="2">
				<label tabindex=61><b>Meio de envio da resposta</b></label>
			</td>
		</tr>
		<tr>
			<td valign="top" align="left" height="40">
				<DD><label tabindex=62>Como você gostaria de receber sua resposta?</label></DD>
			</td>	
			<td valign="top">
				<label tabindex=63>Campo para seleção de como o acionador deseja receber a resposta da sua mensagem.</label>
			</td>
		</tr>		
		<tr>			
			<td valign="top" colspan="2">
				<label tabindex=64><b>Meio de Envio da Resposta:</b> Carta</label></DD><br><br>
				<DD><label tabindex=65>&eacute; obrigatório o preenchimento dos campos Logradouro, Bairro, Cidade, CEP, País e UF</label></DD>
			</td>
		</tr>	
		<tr>
			<td valign="top" align="left" height="40">
				<DD><label tabindex=66>Logradouro</label></DD>
			</td>	
			<td valign="top">
				<label tabindex=67>Campo para digitação do logradouro do acionador quando a resposta será enviada por carta.</label>
			</td>
		</tr>
		<tr>
			<td valign="top" align="left" height="40">
				<DD><label tabindex=68>N&uacute;mero</label></DD>
			</td>	
			<td valign="top">
				<label tabindex=69>Campo para digitação do n&uacute;mero do endereço do acionador quando a resposta será enviada por carta.</labrl>
			</td>
		</tr>
		<tr>
			<td valign="top" align="left" height="40">
				<DD><label tabindex=70>Complemento</label></DD>
			</td>	
			<td valign="top">
				<label tabindex=71>Campo para digitação do complemento do endereço do acionador quando a resposta será enviada por carta.</label>
			</td>
		</tr>
		<tr>
			<td valign="top" align="left" height="40">
				<DD><label tabindex=72>Bairro</label></DD>
			</td>	
			<td valign="top">
				<label tabindex=73>Campo para digitação do bairro do acionador quando a resposta será enviada por carta.</label>
			</td>
		</tr>
		<tr>
			<td valign="top" align="left" height="40">
				<DD><label tabindex=74>Cidade</label></DD>
			</td>	
			<td valign="top">
				<label tabindex=75>Campo para digitação do logradouro do acionador quando a resposta será enviada por carta.</label>
			</td>
		</tr>		
		<tr>
			<td valign="top" align="left" height="40">
				<DD><label tabindex=76>Pais</label></DD>
			</td>	
			<td valign="top">
				<label tabindex=77>Campo para seleção do país do acionador quando a resposta será enviada por carta.</label>
			</td>
		</tr>
		<tr>
			<td valign="top" align="left" height="40">
				<DD><label tabindex=78>UF</label></DD>
			</td>	
			<td valign="top">
				<label tabindex=79>Campo para digitação da Unidade Federativa do acionador quando a resposta será enviada por carta e o país for Brasil.</label>
			</td>
		</tr>
		<tr>
			<td valign="top" align="left" height="40">
				<DD><label tabindex=80>CEP</label></DD>
			</td>	
			<td valign="top">
				<label tabindex=81>Campo para digitação do CEP do acionador quando a resposta será enviada por carta.</label>
			</td>
		</tr>
		
		<tr>			
			<td valign="top" colspan="2">
				<label tabindex=82><b>Meio de Envio da Resposta:</b> E-mail</label></DD><br><br>
				<DD><label tabindex=83>&eacute; obrigatório o preenchimento do campo E-mail</label></DD>
			</td>
		</tr>	
		<tr>
			<td valign="top" align="left" height="40">
				<DD><label tabindex=84>E-mail</label></DD>
			</td>	
			<td valign="top">
				<label tabindex=85>Campo para digitação do e-mail do acionador.</label>
			</td>
		</tr>
		<tr>			
			<td valign="top" colspan="2">
				<label tabindex=86><b>Meio de Envio da Resposta:</b> Fax</label></DD><br><br>
				<DD><label tabindex=87>&eacute; obrigatório o preenchimento do campo Fax</label></DD>
			</td>
		</tr>	
		<tr>
			<td valign="top" align="left" height="40">
				<DD><label tabindex=88>Fax</label></DD>
			</td>	
			<td valign="top">
				<label tabindex=89>Campo para digitação do fax do acionador, dividido em código do país, código da área e n&uacute;mero do fax.</label>
			</td>
		</tr>			

		<tr>			
			<td valign="top" colspan="2">
				<label tabindex=90><b>Meio de Envio da Resposta:</b> Telefone</label></DD><br><br>
				<DD><label tabindex=91>&eacute; obrigatório o preenchimento do campo Telefone</label></DD>
			</td>
		</tr>	
		<tr>
			<td valign="top" align="left" height="40" valign="middle">
				<DD><label tabindex=92>Telefone</label></DD>
			</td>	
			<td valign="top">
				<label tabindex=93>Campo para digitação do telefone do acionador, dividido em código do país, código da área e n&uacute;mero do telefone.</label>
			</td>
		</tr>

		<tr>			
			<td valign="top" colspan="2">
				<label tabindex=94><b>Meio de Envio da Resposta:</b>Atrav&eacute;s do Sistema</label></DD><br><br>
				<DD><label tabindex=95>Consulte sua resposta atrav&eacute;s do Sistema Ouvidoria, informando o n&uacute;mero do protocolo e o código de acesso.</label></DD>
		    </td>
		</tr>
		<tr>
			<td valign="middle" height="40" colspan="2">
				<label tabindex=96><b>Código de acesso</b></label>
			</td>
		</tr>
		<tr>
			<td valign="top" align="left" height="40">
				<DD><label tabindex=97>Quero que meu CÓDIGO DE ACESSO possa ser mostrado após eu responder à minha pergunta cadastrada</label></DD>
			</td>	
			<td valign="top">
				<label tabindex=98>Campo para marcação caso deseje cadastrar uma pergunta e uma resposta secreta para recuperação do código de acesso a qualquer momento.</label>
			</td>
		</tr>
		<tr>
			<td valign="top" align="left" height="40">
				<DD><label tabindex=99>Pergunta</label></DD>
			</td>	
			<td valign="top">
				<label tabindex=100>Campo para digitação da pergunta secreta de recuperação do código de acesso. Quando desejar recuperar o código de acesso o sistema lhe mostrará essa pergunta automaticamente.</label>
			</td>
		</tr>
		<tr>
			<td valign="top" align="left" height="40"><DD><label tabindex=101>Resposta</label></DD></td>	
			<td valign="top"><label tabindex=102>Campo para digitação da resposta secreta de recuperação do código de acesso. Quando desejar recuperar o código de acesso essa resposta deverá ser digitada corretamente para que o sistema exiba novamente seu código de acesso.</td>
		</tr>

		<tr>
			<td valign="middle" height="40" colspan="2">
				<label tabindex=103><b>Validação</b></label>
			</td>
		</tr>
		<tr>
			<td valign="top" align="left" height="40">
				<DD><label tabindex=104>Digite a informação das figuras ao lado</label></DD>
			</td>	
			<td valign="top">
				<label tabindex=105>Campo para digitação da validação do formulário, exibida ao lado.
			</td>
		</tr>	

		<tr>
		 <td valign="middle" colspan="2" height="40">
		 	<label tabindex=106><b>Botões</b></label>
		 </td>
		</tr>		
		<tr>
			<td valign="top" align="left" height="40">
				<DD><label tabindex=107>Confirmar</label></DD>
			</td>	
			<td valign="top">
				<label tabindex=108>Envia o formulário.</label>
			</td>
		</tr>
		<tr>
			<td valign="top" align="left" height="40">
				<DD><label tabindex=109>Limpar</label></DD>
			</td>	
			<td valign="top">
				<label tabindex=110>Limpa todos os campos do formulário, deixando-o em branco.</label>
			</td>
		</tr>
			
	</table>	
 </td>
</tr>
<tr>
 <td valign="top">
 	<hr>
    <p class="voltar">
       <A tabindex=111 title="imprimir esta página" href="javascript:window.print()">imprimir</A>
     . <A tabindex=112 title="topo da página" href="javascript:window.location=location.href;">topo</A>
 </td>
</tr>
</table>
	
</body>	

</HTML>