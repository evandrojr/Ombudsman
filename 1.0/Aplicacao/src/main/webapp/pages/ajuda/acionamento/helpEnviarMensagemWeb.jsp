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
		<label tabindex=9><b>OBS.: O padr�o de cores &eacute; meramente ilustrativo.</b></label>
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
   		<label tabindex=11>Esse &eacute; o seu canal de comunica��o com a ouvidoria. As informa��es aqui preenchidas ser�o utilizadas para que possamos lhe responder com o m�ximo de clareza e efici�ncia.</label>
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
				<label tabindex=16>Campo para sele��o de um tipo de mensagem dentre os cadastrados pela ouvidoria.</label>
			</td>
		</tr>
		<tr>
			<td valign="top" align="left" height="40">
				<DD><label tabindex=17>Assunto da Mensagem</label></DD>
			</td>		
			<td valign="top">
				<label tabindex=18>Campo para sele��o de um assunto de mensagem dentre os cadastrados pela ouvidoria.</label>
			</td>			
		</tr>			
		<tr>		
			<td valign="top" align="left" height="40">
				<DD><label tabindex=19>Localidade da Ocorr�ncia</label></DD>
			</td>
			<td valign="top">
				<label tabindex=20>Campo para sele��o da localidade da ocorr�ncia relatada na mensagem.</label>
			</td>			
		</tr>			
		<tr>
			<td valign="top" align="left" height="40">
				<DD><label tabindex=21>Mensagem</label></DD>
			</td>
			<td valign="top">
				<label tabindex=22>Campo para livre digita��o da mensagem � ouvidoria.
			</td>			
		</tr>			
		<tr>			
			<td valign="top" align="left" height="40">
				<DD><label tabindex=23>Anexo</label></DD>
			</td>
			<td valign="top">
				<label tabindex=24>Campo para inser��o de um arquivo que ser� anexado � mensagem e enviado � ouvidoria. H� restri��o de tamanho (exibido ao lado do campo) e de tipos (exibido na mensagem de erro no momento do envio) de arquivos aceitos.<br><br>
				Item opcional, sua utiliza��o depende da configura��o da Ouvidoria.</label>
			</td>			
		</tr>
		<tr>			
			<td valign="top" align="left" height="50" valign="middle">
				<DD><label tabindex=25>Mensagem Digitalizada</label></DD>
			</td>
			<td valign="top">
				<label tabindex=26>Este campo ser� preenchido apenas se Campo para inser��o de um arquivo de imagem contendo a digitaliza��o do acionamento enviado � ouvidoria (carta ou fax), que ser� anexado � mensagem. H� restri��o de tamanho (exibido ao lado do campo) e de tipos (exibido na mensagem de erro no momento do envio) de arquivos aceitos.<br><br>
 				 Item opcional, sua utiliza��o depende da configura��o da Ouvidoria.</label>
			</td>			
		</tr>
		<tr>			
			<td valign="top" align="left" height="50" colspan="2">		
				<label tabindex=27><b>Anexando um arquivo: </b>Para anexar um arquivo, clique no bot�o procurar.
				O sitema abrir� uma caixa para que se fa�a a sele��o do arquivo a ser anexado.
				Ap�s selecionar o arquivo, clique em abrir.</DD></label>
			</td>
		</tr>	
		<tr>
			<td valign="middle" height="40" colspan="2">
				<label tabindex=28><b>Dados da Pessoais</b></label>
			</td>
		</tr>
		
		<tr>			
			<td valign="top" align="left" height="40">
				<DD><label tabindex=29>Tipo de Usu�rio</label></DD>
			</td>
			<td valign="top">
				<label tabindex=30>Campo para sele��o de um tipo de usu�rio dentre os aceitos pela ouvidoria.</label>
			</td>
		</tr>
		<tr>
			<td valign="top" align="left" height="50" valign="bottom">
				<DD><label tabindex=31>Sexo</label></DD>
			</td>	
			<td valign="top" valign="bottom">
				<label tabindex=32>Campo para sele��o do sexo do acionador.</label>
			</td>
		</tr>
		<tr>
			<td valign="top" align="left" height="40">
				<DD><label tabindex=33>Escolaridade</label></DD>
			</td>	
			<td valign="top">
				<label tabindex=34>Campo para sele��o da escolaridade do acionador.</label>
			</td>
		</tr>
		<tr>
			<td valign="top" align="left" height="40">
				<DD><label tabindex=35>Faixa et�ria</label></DD>
			</td>	
			<td valign="top">
				<label tabindex=36>Campo para sele��o da faixa et�ria do acionador.</label>
			</td>
		</tr>
		<tr>
			<td valign="top" align="left" height="40" valign="middle">
				<DD><label tabindex=37>Local de envio</label></DD>
			</td>	
			<td valign="top">
				<label tabindex=38>Campo para sele��o do local de onde a mensagem est� sendo enviada. Caso seja selecionado o pa�s Brasil, ser� exibido tamb&eacute;m o campo para sele��o do estado.</label>
			</td>
		</tr>
		<tr>			
			<td valign="top" colspan="2">
				<label tabindex=39><b>Tipo de Usu�rio:</b> Funcion�rio</label></DD><br><br>
				<DD><label tabindex=40>&eacute; obrigat�rio o preenchimento dos campos Matr�cula e CPF</label></DD>
			</td>
		</tr>
		<tr>
			<td valign="top" align="left" height="40" valign="middle">
				<DD><label tabindex=41>Matr�cula</label></DD>
			</td>
			<td valign="top">
				<label tabindex=42>Campo para digita��o da matr�cula do funcion�rio.</label>
			</td>
		</tr>	
		<tr>
			<td valign="top" align="left" height="40">
				<DD><label tabindex=43>CPF</label></DD>
			</td>	
			<td valign="top">
				<label tabindex=44>Campo para digita��o do CPF do acionador.</label>
			</td>
		</tr>
		<tr>
			<td valign="top" align="left" height="40">
				<DD><label tabindex=45>Setor</label></DD>
			</td>	
			<td valign="top">
				<label tabindex=46>Campo para digita��o do setor onde est� alocado o acionador funcion�rio.</label>
			</td>
		</tr>
		<tr>			
			<td valign="top" colspan="2">
				<label tabindex=47><b>Tipo de Usu�rio:</b> Pessoa F�sica</label></DD><br><br>
				<DD><label tabindex=48>&eacute; obrigat�rio o preenchimento do campo Nome</label></DD>
			</td>
		</tr>
		<tr>
			<td valign="top" align="left" height="40">
				<DD><label tabindex=49>Nome</label></DD>
			</td>	
			<td valign="top">
				<label tabindex=50>Campo para digita��o do nome do acionador.</label>
			</td>
		</tr>
		<tr>			
			<td valign="top" colspan="2">
				<label tabindex=51><b>Tipo de Usu�rio:</b> Pessoa Jur�dica</label></DD><br><br>
				<DD><label tabindex=52>&eacute; obrigat�rio o preenchimento dos campos CPF do Acionador, Raz�o Social e CNPJ</label></DD>
			</td>
		</tr>
		<tr>
			<td valign="top" align="left" height="40">
				<DD><label tabindex=53>CPF do acionador</label></DD>
			</td>	
			<td valign="top">
				<label tabindex=54>Campo para digita��o do CPF do contato para o acionador pessoa jur�dica.</label>
			</td>
		</tr>
		<tr>
			<td valign="top" align="left" height="40">
				<DD><label tabindex=55>Nome de contato</label></DD>
			</td>	
			<td valign="top" valign="middle">
				<label tabindex=56>Campo para digita��o do nome de contato para o acionador pessoa jur�dica.</label>
			</td>
		</tr>
		<tr>
			<td valign="top" align="left" height="40">
				<DD><label tabindex=57>Raz�o Social</label></DD>
			</td>	
			<td valign="top">
				<label tabindex=58>Campo para digita��o da raz�o social do acionador pessoa jur�dica.</label>
			</td>
		</tr>
		<tr>
			<td valign="top" align="left" height="40">
				<DD><label tabindex=59>CNPJ</label></DD>
			</td>	
			<td valign="top">
				<label tabindex=60>Campo para digita��o do CNPJ do acionador pessoa jur�dica.</label>
			</td>
		</tr>		
		<tr>
			<td valign="middle" height="40" colspan="2">
				<label tabindex=61><b>Meio de envio da resposta</b></label>
			</td>
		</tr>
		<tr>
			<td valign="top" align="left" height="40">
				<DD><label tabindex=62>Como voc� gostaria de receber sua resposta?</label></DD>
			</td>	
			<td valign="top">
				<label tabindex=63>Campo para sele��o de como o acionador deseja receber a resposta da sua mensagem.</label>
			</td>
		</tr>		
		<tr>			
			<td valign="top" colspan="2">
				<label tabindex=64><b>Meio de Envio da Resposta:</b> Carta</label></DD><br><br>
				<DD><label tabindex=65>&eacute; obrigat�rio o preenchimento dos campos Logradouro, Bairro, Cidade, CEP, Pa�s e UF</label></DD>
			</td>
		</tr>	
		<tr>
			<td valign="top" align="left" height="40">
				<DD><label tabindex=66>Logradouro</label></DD>
			</td>	
			<td valign="top">
				<label tabindex=67>Campo para digita��o do logradouro do acionador quando a resposta ser� enviada por carta.</label>
			</td>
		</tr>
		<tr>
			<td valign="top" align="left" height="40">
				<DD><label tabindex=68>N&uacute;mero</label></DD>
			</td>	
			<td valign="top">
				<label tabindex=69>Campo para digita��o do n&uacute;mero do endere�o do acionador quando a resposta ser� enviada por carta.</labrl>
			</td>
		</tr>
		<tr>
			<td valign="top" align="left" height="40">
				<DD><label tabindex=70>Complemento</label></DD>
			</td>	
			<td valign="top">
				<label tabindex=71>Campo para digita��o do complemento do endere�o do acionador quando a resposta ser� enviada por carta.</label>
			</td>
		</tr>
		<tr>
			<td valign="top" align="left" height="40">
				<DD><label tabindex=72>Bairro</label></DD>
			</td>	
			<td valign="top">
				<label tabindex=73>Campo para digita��o do bairro do acionador quando a resposta ser� enviada por carta.</label>
			</td>
		</tr>
		<tr>
			<td valign="top" align="left" height="40">
				<DD><label tabindex=74>Cidade</label></DD>
			</td>	
			<td valign="top">
				<label tabindex=75>Campo para digita��o do logradouro do acionador quando a resposta ser� enviada por carta.</label>
			</td>
		</tr>		
		<tr>
			<td valign="top" align="left" height="40">
				<DD><label tabindex=76>Pais</label></DD>
			</td>	
			<td valign="top">
				<label tabindex=77>Campo para sele��o do pa�s do acionador quando a resposta ser� enviada por carta.</label>
			</td>
		</tr>
		<tr>
			<td valign="top" align="left" height="40">
				<DD><label tabindex=78>UF</label></DD>
			</td>	
			<td valign="top">
				<label tabindex=79>Campo para digita��o da Unidade Federativa do acionador quando a resposta ser� enviada por carta e o pa�s for Brasil.</label>
			</td>
		</tr>
		<tr>
			<td valign="top" align="left" height="40">
				<DD><label tabindex=80>CEP</label></DD>
			</td>	
			<td valign="top">
				<label tabindex=81>Campo para digita��o do CEP do acionador quando a resposta ser� enviada por carta.</label>
			</td>
		</tr>
		
		<tr>			
			<td valign="top" colspan="2">
				<label tabindex=82><b>Meio de Envio da Resposta:</b> E-mail</label></DD><br><br>
				<DD><label tabindex=83>&eacute; obrigat�rio o preenchimento do campo E-mail</label></DD>
			</td>
		</tr>	
		<tr>
			<td valign="top" align="left" height="40">
				<DD><label tabindex=84>E-mail</label></DD>
			</td>	
			<td valign="top">
				<label tabindex=85>Campo para digita��o do e-mail do acionador.</label>
			</td>
		</tr>
		<tr>			
			<td valign="top" colspan="2">
				<label tabindex=86><b>Meio de Envio da Resposta:</b> Fax</label></DD><br><br>
				<DD><label tabindex=87>&eacute; obrigat�rio o preenchimento do campo Fax</label></DD>
			</td>
		</tr>	
		<tr>
			<td valign="top" align="left" height="40">
				<DD><label tabindex=88>Fax</label></DD>
			</td>	
			<td valign="top">
				<label tabindex=89>Campo para digita��o do fax do acionador, dividido em c�digo do pa�s, c�digo da �rea e n&uacute;mero do fax.</label>
			</td>
		</tr>			

		<tr>			
			<td valign="top" colspan="2">
				<label tabindex=90><b>Meio de Envio da Resposta:</b> Telefone</label></DD><br><br>
				<DD><label tabindex=91>&eacute; obrigat�rio o preenchimento do campo Telefone</label></DD>
			</td>
		</tr>	
		<tr>
			<td valign="top" align="left" height="40" valign="middle">
				<DD><label tabindex=92>Telefone</label></DD>
			</td>	
			<td valign="top">
				<label tabindex=93>Campo para digita��o do telefone do acionador, dividido em c�digo do pa�s, c�digo da �rea e n&uacute;mero do telefone.</label>
			</td>
		</tr>

		<tr>			
			<td valign="top" colspan="2">
				<label tabindex=94><b>Meio de Envio da Resposta:</b>Atrav&eacute;s do Sistema</label></DD><br><br>
				<DD><label tabindex=95>Consulte sua resposta atrav&eacute;s do Sistema Ouvidoria, informando o n&uacute;mero do protocolo e o c�digo de acesso.</label></DD>
		    </td>
		</tr>
		<tr>
			<td valign="middle" height="40" colspan="2">
				<label tabindex=96><b>C�digo de acesso</b></label>
			</td>
		</tr>
		<tr>
			<td valign="top" align="left" height="40">
				<DD><label tabindex=97>Quero que meu C�DIGO DE ACESSO possa ser mostrado ap�s eu responder � minha pergunta cadastrada</label></DD>
			</td>	
			<td valign="top">
				<label tabindex=98>Campo para marca��o caso deseje cadastrar uma pergunta e uma resposta secreta para recupera��o do c�digo de acesso a qualquer momento.</label>
			</td>
		</tr>
		<tr>
			<td valign="top" align="left" height="40">
				<DD><label tabindex=99>Pergunta</label></DD>
			</td>	
			<td valign="top">
				<label tabindex=100>Campo para digita��o da pergunta secreta de recupera��o do c�digo de acesso. Quando desejar recuperar o c�digo de acesso o sistema lhe mostrar� essa pergunta automaticamente.</label>
			</td>
		</tr>
		<tr>
			<td valign="top" align="left" height="40"><DD><label tabindex=101>Resposta</label></DD></td>	
			<td valign="top"><label tabindex=102>Campo para digita��o da resposta secreta de recupera��o do c�digo de acesso. Quando desejar recuperar o c�digo de acesso essa resposta dever� ser digitada corretamente para que o sistema exiba novamente seu c�digo de acesso.</td>
		</tr>

		<tr>
			<td valign="middle" height="40" colspan="2">
				<label tabindex=103><b>Valida��o</b></label>
			</td>
		</tr>
		<tr>
			<td valign="top" align="left" height="40">
				<DD><label tabindex=104>Digite a informa��o das figuras ao lado</label></DD>
			</td>	
			<td valign="top">
				<label tabindex=105>Campo para digita��o da valida��o do formul�rio, exibida ao lado.
			</td>
		</tr>	

		<tr>
		 <td valign="middle" colspan="2" height="40">
		 	<label tabindex=106><b>Bot�es</b></label>
		 </td>
		</tr>		
		<tr>
			<td valign="top" align="left" height="40">
				<DD><label tabindex=107>Confirmar</label></DD>
			</td>	
			<td valign="top">
				<label tabindex=108>Envia o formul�rio.</label>
			</td>
		</tr>
		<tr>
			<td valign="top" align="left" height="40">
				<DD><label tabindex=109>Limpar</label></DD>
			</td>	
			<td valign="top">
				<label tabindex=110>Limpa todos os campos do formul�rio, deixando-o em branco.</label>
			</td>
		</tr>
			
	</table>	
 </td>
</tr>
<tr>
 <td valign="top">
 	<hr>
    <p class="voltar">
       <A tabindex=111 title="imprimir esta p�gina" href="javascript:window.print()">imprimir</A>
     . <A tabindex=112 title="topo da p�gina" href="javascript:window.location=location.href;">topo</A>
 </td>
</tr>
</table>
	
</body>	

</HTML>