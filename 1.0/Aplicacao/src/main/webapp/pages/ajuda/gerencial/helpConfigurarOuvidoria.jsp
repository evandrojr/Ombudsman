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

	
<body onload="javascript:onLoad();" style="margin:25px 2.8em">
<table border="0" cellpadding="0" cellspacing="0" width="50%" align="center">
<tr>
 <td align="center" class="titulo" align="center">
 	<label tabindex=1 id="titulo"><b>Configurar Ouvidoria</b></label>
 </td>
</tr>
<tr>
 <td align="center"><br>
 	<img src="../../images/ajuda/configurarOuvidoria_1.jpg" tabindex="2" name="imgTela" id="imgTela" alt="Imagem da tela administrar usuário">
 	<img src="../../images/ajuda/configurarOuvidoria_2.jpg" tabindex="3" name="imgTela" id="imgTela" alt="Imagem da tela administrar usuário"> 	
 	<img src="../../images/ajuda/configurarOuvidoria_3.jpg" tabindex="3" name="imgTela" id="imgTela" alt="Imagem da tela administrar usuário"> 	
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
   		Permite que os dados de configuração da ouvidoria sejam atualizados.
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
			<td height="30" colspan="2" valign="top">
				<a name="detalhe"><label tabindex="7"><b>1 - Detalhamento do Script</b></label></a>
			</td>
		</tr>
		<tr>
			<td height="40" colspan="2" valign="top">
				<label tabindex="8">Neste espaço realizam-se operações sobre a Ouvidoria corrente. As operações possíveis são:</label>
			</td>
		</tr>
		<tr>
			<td align="left" height="40" width="150" valign="top">
				<DD><label tabindex="9"><b>Alterar</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="10">Alterar os dados da Ouvidoria.</label>
			</td>
		</tr>
		<tr>
			<td height="40" colspan="2" valign="top">
				<label tabindex="11">Os dados disponíveis para alteração são:</label>
			</td>
		</tr>
		
		<tr>
			<td height="40" colspan="2" valign="top">
				<label tabindex="12">1.1 - Configurações de layout</label>
			</td>
		</tr>
		<tr>
			<td align="left" height="40" width="350" valign="top">
				<DD><label tabindex="13"><b>Diretório de esquema de cores</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="14">Campo para seleção do padrão de cores do sistema.</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40" width="350" valign="top">
				<DD><label tabindex="15"><b>Nome do órgão para exibição</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="16">Campo para digitação do nome do órgão que será apresentado no sistema.</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40" width="350" valign="top">
				<DD><label tabindex="17"><b>Imagem do logo do órgão</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="18">Campo para inserção de uma imagem que será exibida no canto superior esquerdo do frame superior do sistema. Essa imagem deve ter, preferencialmente, 20 pixels de altura.</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40" width="350" valign="top">
				<DD><label tabindex="19"><b>Descrição para a imagem do logo do órgão</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="20">Campo para digitação da descrição da imagem exibida no canto superior esquerdo do frame superior do sistema. Essa descrição que será lida pro programas que auxiliam deficientes visuais a acessarem o sistema.</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40" width="350" valign="top">
				<DD><label tabindex="21"><b>Link para a imagem do logo do órgão</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="22">Campo para digitação do link da imagem exibida no canto superior esquerdo do frame superior do sistema.</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40" width="350" valign="top">
				<DD><label tabindex="23"><b>Cor referente à página do logo</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="24">Campo para digitação no padrão RGB da cor de fundo da barra superior do frame superior do sistema. A cor digitada será mostrada ao lado do campo de digitação.</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40" width="350" valign="top">
				<DD><label tabindex="25"><b>Imagem do banner do órgão</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="26">Campo para inserção de uma imagem que será exibida no frame superior do sistema. Essa imagem deve ter, preferencialmente, 60 pixels de altura.</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40" width="350" valign="top">
				<DD><label tabindex="27"><b>Descrição para a imagem do banner do órgão</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="28">Campo para digitação da descrição da imagem exibida no frame superior do sistema. Essa descrição que será lida pro programas que auxiliam deficientes visuais a acessarem o sistema.</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40" width="350" valign="top">
				<DD><label tabindex="29"><b>Link para a imagem do banner do órgão</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="30">Campo para digitação do link da imagem exibida frame superior do sistema.</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40" width="350" valign="top">
				<DD><label tabindex="31"><b>Cor referente a página do banner</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="32">Campo para digitação no padrão RGB da cor de fundo do frame superior do sistema. A cor digitada será mostrada ao lado do campo de digitação.</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40" width="350" valign="top">
				<DD><label tabindex="33"><b>Imagem do canto superior a direita</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="34">Campo para inserção de uma imagem que será exibida no canto superior direito do frame superior do sistema. Essa imagem deve ter, preferencialmente, 20 pixels de altura.</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40" width="350" valign="top">
				<DD><label tabindex="35"><b>Descrição para a imagem do canto superior a direita</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="36">Campo para digitação da descrição da imagem exibida no canto superior direito do frame superior do sistema. Essa descrição que será lida pro programas que auxiliam deficientes visuais a acessarem o sistema.</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40" width="350" valign="top">
				<DD><label tabindex="37"><b>Link para a imagem do canto superior a direita</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="38">Campo para digitação do link da imagem exibida no canto superior direito do frame superior do sistema.</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40" width="350" valign="top">
				<DD><label tabindex="39"><b>Outra imagem para layout</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="40">Campo para inserção de uma imagem auxiliar ao sistema</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40" width="350" valign="top">
				<DD><label tabindex="41"><b>Descrição para a outra imagem para layout</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="42">Campo para digitação da descrição da imagem auxiliar do sistema.</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40" width="350" valign="top">
				<DD><label tabindex="43"><b>Link para a outra imagem para layout</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="44">Campo para digitação do link da imagem auxiliar do sistema.</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40" width="350" valign="top">
				<DD><label tabindex="45"><b>Descrição para a outra imagem para layout</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="46">Campo para digitação da descrição da imagem auxiliar do sistema.</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40" width="350" valign="top">
				<DD><label tabindex="47"><b>Link para a outra imagem para layout</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="48">Campo para digitação do link da imagem auxiliar do sistema.</label>
			</td>
		</tr>
		<tr>
			<td height="40" colspan="2" valign="top">
				<label tabindex="49">1.2 - Textos configuráveis</label>
			</td>
		</tr>
		<tr>
			<td align="left" height="40" width="350" valign="top">
				<DD><label tabindex="50"><b>Texto de apresentação da ouvidoria</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="51">Campo para digitação do texto de apresentação da ouvidoria, exibido na página de entrada do sistema.</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40" width="350" valign="top">
				<DD><label tabindex="52"><b>Texto de apresentação do acionamento</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="53">Campo para digitação do texto de apresentação do formulário de acionamento da ouvidoria, exibido acima do formulário.</label>
			</td>
		</tr>
		<tr>
			<td align="left" height="40" width="350" valign="top">
				<DD><label tabindex="54"><b>Texto de resposta no momento do acionamento</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="55">Campo para digitação do texto de confirmação do envio do acionamento. Juntamente ao texto serão exibidos o protocolo e o código de acesso (quando houver).</label>
			</td>
		</tr>
		<tr>
			<td align="left" height="40" width="350" valign="top">
				<DD><label tabindex="56"><b>Texto consulta de resposta no prazo</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="">Campo para digitação do texto de consulta da resposta que se encontra dentro do prazo pr&eacute;-estipulado pela ouvidoria e que ainda não foi respondida.</label>
			</td>
		</tr>
		<tr>
			<td align="left" height="40" width="350" valign="top">
				<DD><label tabindex="57"><b>Texto consulta de resposta sem prazo</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="58">Campo para digitação do texto de consulta da resposta que não possui prazo pr&eacute;-estipulado pela ouvidoria e que ainda não foi respondida.</label>
			</td>
		</tr>
		<tr>
			<td align="left" height="40" width="350" valign="top">
				<DD><label tabindex="59"><b>Texto consulta de resposta em atraso</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="60">Campo para digitação do texto de consulta da resposta que já ultrapassou o prazo pr&eacute;-estipulado pela ouvidoria, mas que ainda não foi respondida.</label>
			</td>
		</tr>
		<tr>
			<td align="left" height="40" width="350" valign="top">
				<DD><label tabindex="61"><b>Texto apresentação da resposta</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="62">Campo para digitação do texto de apresentação da resposta da ouvidoria. Será exibido acima da resposta.</label>
			</td>
		</tr>
		<tr>
			<td align="left" height="40" width="350" valign="top">
				<DD><label tabindex="63"><b>Texto de avaliação da resposta</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="64">Campo para digitação do texto de confirmação do envio da avaliação da resposta dada ao acionamento.</label>
			</td>
		</tr>
		<tr>
			<td align="left" height="40" width="350" valign="top">
				<DD><label tabindex="65"><b>Texto com informações sobre a ouvidoria</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="66">Campo para digitação do texto com informações gerais sobre a ouvidoria (por exemplo: histórico, objetivos etc) que serão divulgadas para o p&uacute;blico.</label>
			</td>
		</tr>
		<tr>
			<td align="left" height="40" width="350" valign="top">
				<DD><label tabindex="67"><b>Texto referente a outros canais de comunicação</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="68">Campo para digitação do texto apresentação dos outros canais de comunicação da ouvidoria (por exemplo: e-mail, telefone, fax, endereço etc).</label>
			</td>
		</tr>
		<tr>
			<td align="left" height="40" width="350" valign="top">
				<DD><label tabindex="69"><b>Texto referente a legislação do órgão</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="70">Campo para digitação do texto com legislação relativa à ouvidoria que será divulgada para o p&uacute;blico geral.</label>
			</td>
		</tr>	
		<tr>
			<td height="40" colspan="2" valign="top">
				<label tabindex="71">1.3 - Parâmetros de Configuração</label>
			</td>
		</tr>
		<tr>
			<td align="left" height="40" width="350" valign="top">
				<DD><label tabindex="72"><b>Órgão permite anexar arquivo ao acionamento</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="73">Campo para permitir que sejam anexados arquivos aos acionamentos realizados na ouvidoria. </label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40" width="350" valign="top">
				<DD><label tabindex="74"><b>Tamanho máximo para arquivos anexos (em KB)</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="75">Campo para digitação do tamanho máximo dos arquivos anexados aos acionamentos realizados na ouvidoria.</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40" width="350" valign="top">
				<DD><label tabindex="76"><b>Órgão permite mensagem digitalizada no acionamento</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="77">Campo para permitir que sejam anexadas mensagens digitalizadas aos acionamentos realizados na ouvidoria. </label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40" width="350" valign="top">
				<DD><label tabindex="78"><b>Tamanho máximo para carta digitalizada (em KB)</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="79">Campo para digitação do tamanho máximo das mensagens digitalizadas anexadas aos acionamentos realizados na ouvidoria.</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40" width="350" valign="top">
				<DD><label tabindex="80"><b>Órgão possui código de acesso</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="81">Campo para permitir que a ouvidoria forneça códigos de acesso a todos os acionamentos realizados na mesma. Para consultar a resposta aos acionamentos será necessário que o usuário informe esse código de acesso, al&eacute;m do protocolo.</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40" width="350" valign="top">
				<DD><label tabindex="82"><b>Existe bloqueio por falhas na digitação do código de acesso</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="83">Campo para permitir que haja bloqueio ao protocolo caso o código de acesso seja digitado errado. </label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40" width="350" valign="top">
				<DD><label tabindex="84"><b>N&uacute;mero máximo de falhas no código de acesso</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="85">Campo para digitação do n&uacute;mero de vezes que um código de acesso deve ser digitado errado para que o protocolo seja bloqueado.</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40" width="350" valign="top">
				<DD><label tabindex="86"><b>Tempo de bloqueio pelo código de acesso (em minutos)</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="87">Campo para digitação do tempo que o protocolo ficará bloqueado protocolo caso o código de acesso seja digitado errado.</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40" width="350" valign="top">
				<DD><label tabindex="88"><b>Existe bloqueio por falhas na digitação da pergunta para recuperação do código de acesso</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="89">Campo para permitir que haja bloqueio ao protocolo caso a resposta para recuperação do código de acesso seja digitada errada.</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40" width="350" valign="top">
				<DD><label tabindex="90"><b>N&uacute;mero máximo de falhas na pergunta</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="91">Campo para digitação do n&uacute;mero de vezes que a resposta para recuperação do código de acesso deve ser digitada errada para que o protocolo seja bloqueado.</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40" width="350" valign="top">
				<DD><label tabindex="92"><b>Tempo de bloqueio pela pergunta (em minutos)</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="93">Campo para digitação do tempo que o protocolo ficará bloqueado protocolo caso a resposta para recuperação do código de acesso seja digitada errada.</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40" width="350" valign="top">
				<DD><label tabindex="94"><b>Atendente pode consultar mensagens durante o atendimento</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="95">Campo para permitir que os atendentes da ouvidoria consultem mensagens quando estiverem realizando atendimentos.</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40" width="350" valign="top">
				<DD><label tabindex="96"><b>&eacute; exigido certificado digital para acesso ao órgão e a todos os sub-órgãos</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="97">Campo para exigir que a identificação no sistema seja feita atrav&eacute;s de certificado digital, tanto para o órgão quanto para os sub-órgãos.</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40" width="350" valign="top">
				<DD><label tabindex="98"><b>&eacute; exigido certificado digital para acesso ao órgão e opcional para todos os sub-órgãos</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="99">Campo para exigir que a identificação no sistema seja feita atrav&eacute;s de certificado digital para o órgão e opcionalmente para os sub-órgãos.</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40" width="350" valign="top">
				<DD><label tabindex="100"><b>Nome do diretório do órgão</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="101">Nome do diretório do órgão, que compõe a URL da ouvidoria. </label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40" width="350" valign="top">
				<DD><label tabindex="102"><b>URL para consulta de funcionários</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="103">Campo para digitação da URL para consulta dos dados cadastrais dos funcionários do órgão.</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40" width="350" valign="top">
				<DD><label tabindex="104"><b>URL de suporte ao usuário</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="105">Campo para digitação da URL de suporte ao usuário.</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40" width="350" valign="top">
				<DD><label tabindex="106"><b>Remetente dos e-mails que serão enviados pela aplicação</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="107">Campo para digitação do remetente dos e-mails que serão enviados pela ouvidoria. </label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40" width="350" valign="top">
				<DD><label tabindex="108"><b>Tipos de acionador permitidos para o órgão</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="109">Campos para seleção dos tipos de usuário que serão aceitos pelo órgão.</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40" width="350" valign="top">
				<DD><label tabindex="110"><b>Meios de envio de resposta permitidos para o órgão:</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="111">Campos para seleção dos meios de envio de reposta que estarão disponíveis para seleção pelo acionador.</label>
			</td>
		</tr>	
		<tr>				
			<td height="40" colspan="2" valign="top">
				<label tabindex="112">Estao disponíveis os botões que operam sobre a Ouvidoria:</label>
			</td>
		</tr>
		<tr>
			<td align="left" height="40" width="150" valign="top">
				<DD><label tabindex="113"><b>Alterar</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="114">Alterar os dados da Ouvidoria</label>
			</td>			
		</tr>	
	  </table>	  
	  	  
	</td>
	</tr>
	<tr>
	 <td>
		<hr>
		  <p class="voltar"><A title="imprimir esta página" href="javascript:window.print()" tabindex="115">imprimir</A> 
		    . <A title="topo da página" href="javascript:window.location=location.href;" tabindex="116">topo</A>
	 </td>
	</tr>
</table> 	    

	
</body>	

</HTML>