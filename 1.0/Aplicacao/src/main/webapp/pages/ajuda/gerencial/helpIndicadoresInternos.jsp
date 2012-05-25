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
 	<label tabindex=1 id="titulo"><b>Indicadores Internos</b></label>
 </td>
</tr>
<tr>
 <td align="center"><br>
 	<img src="../../images/ajuda/indicadoresInternos_1.jpg" tabindex="2" name="imgTela" id="imgTela" alt="Imagem da tela de consultar indicadores internos">
 	<img src="../../images/ajuda/indicadoresInternos_2.jpg" tabindex="3" name="imgTela" id="imgTela" alt="Imagem da tela de consultar indicadores internos">
 	<img src="../../images/ajuda/indicadoresInternos_3.jpg" tabindex="4" name="imgTela" id="imgTela" alt="Imagem da tela de consultar indicadores internos">
 </td>
</tr>	
<tr>
 <td>
 	<p align="center" class="obrigatorio" tabindex="5"><b>OBS.: O padr�o de cores &eacute; meramente ilustrativo.</b></p>
 </td>
</tr>
 <tr><td><br><br></td></tr> 
 <tr>
  <td>
  	<b><label tabindex="6">Funcionalidade</label></b>
  </td>
 </tr>
 <tr>
  <td>
  <DD><label tabindex="7">
  		Possibilita que sejam criados relat�rios baseados nas tabelas internas do sistema. Neste relat�rio &eacute; contabilizado e exibido a distribui��o dos itens de cada tabela do sistema, tendo como universo os acionamentos cadastrados * em um determinado per�odo.<br>
		* No caso dos relat�rios relativos a Meio de Envio de Resposta o universo inclui tamb&eacute;m os atendimentos realizados por scripts.
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
			<td height="30" colspan="2" valign="top"><a name="busca"><label tabindex="8"><b>1 - Consultar Indicadores Internos</b></label></a></td>
		</tr>
		<tr>
			<td height="40" colspan="2" valign="top">				
					<label tabindex="9">
					Serve para criar Indicadores Internos espec�ficas, listando apenas as que correspondem ao crit&eacute;rio de busca selecionado.<br>
					Os crit&eacute;rios poss�veis para a cria��o s�o:
					</label>
			</td>
		</tr>
		<tr>
			<td align="left" height="40" width="40%" valign="top">
				<DD><label tabindex="10"><b>Modo de exibi��o</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="11">Campo para sele��o do modo de exibi��o do relat�rio, se consolidado (com os dados totalizados) ou detalhado (com os dados separados).</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40" width="30%" valign="top">
				<DD><label tabindex="12"><b>Tabela</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="13">Campo para sele��o da tabela na qual o relat�rio ser� baseado.</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40" width="30%" valign="top">
				<DD><label tabindex="14"><b>Itens da tabela</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="15">Campo para sele��o dos itens da tabela nos quais o relat�rio ser� baseado. Esses itens s�o apresentados de acordo com a tabela escolhida no item anterior.</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40" width="30%" valign="top">
				<DD><label tabindex="16"><b>Per�odo</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="17">Campo para digita��o do per�odo no qual o relat�rio ser� baseado.</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40" width="30%" valign="top">
				<DD><label tabindex="18"><b>Tipo de Gr�fico</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="19">Campo para sele��o do tipo de gr�fico que ser� gerado no relat�rio.</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40" width="30%" valign="top">
				<DD><label tabindex="20"><b>Seq��ncias baseadas em</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="21">Campo para sele��o da forma de divis�o dos dados, se pela tabela selecionada ou se pelos Sub-�rg�o(s) / localidade(s).</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40" width="30%" valign="top">
				<DD><label tabindex="22"><b>N&uacute;mero m�ximo de sub-�rg�os/localidades</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="23">N&uacute;mero m�ximo de sub-�rg�os/localidades que poder�o ser selecionados para gera��o do relat�rio.</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40" width="30%" valign="top">
				<DD><label tabindex="24"><b>Sub-�rg�o</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="25">Campo para pr&eacute;-sele��o dos sub-�rg�os nos quais o relat�rio ser� baseado.</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40" width="30%" valign="top">
				<DD><label tabindex="26"><b>Localidade</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="27">Campo para pr&eacute;-sele��o das localidades dos sub-�rg�os nas quais o relat�rio ser� baseado.</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40" width="30%" valign="top">
				<DD><label tabindex="28"><b>Localidades dos Sub-�rg�os</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="29">
					Campo para exibi��o e exclus�o das localidades e dos respectivos sub-�rg�os nos quais o relat�rio ser� baseado. Somente as localidades listadas nesse campo s�o consideradas selecionadas.<br><br>
					Para adicionar uma localidade, siga os seguintes passos:<br>
						<DD>1.	Selecione um Sub-�rg�o;</DD><br>
						<DD>2.	Selecione as localidades deste Sub-�rg�o;</DD><br>
						<DD>3.	Clique no bot�o Enviar;</DD><br>
						<DD>4.	Verifique se as localidades selecionadas est�o na caixa Localidades dos Sub-�rg�os.</DD><br>
					Para excluir uma localidade, siga os seguintes passos:<br>
						<DD>1.	Selecione as localidades a serem exclu�das na caixa Localidades dos Sub-�rg�os;</DD><br>
						<DD>2.	Clique no bot�o Excluir.</DD><br>
				</label>
			</td>
		</tr>		
		<tr>
		<td align="left" height="40" valign="top" colspan="3">
			<label tabindex="30">
			Ap�s o fornecimento dos crit&eacute;rios de busca deve-se utilizar o bot�o "Gerar" ou a tecla "Enter", para que o sistema traga o gr�fico de indicadores de acordo com os filtros solicitados.<br>			
			</label>
		</td>					
		</tr>			
	 </table>
	 
	 <br><br>	
	 
	 <table border="0" cellpadding="5" cellspacing="0" align="center" width="100%">				
		<tr>
			<td height="40" colspan="2" valign="top">
				<label tabindex="31">Est� dispon�vel o bot�o que opera sobre a mensagem respondida:</label>
			</td>
		</tr>
		<tr>
			<td align="left" height="40" valign="top">
				<DD><label tabindex="32"><b>Enviar</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="33">Envia as localidades e seus respectivos sub-�rg�os para o campo Localidades dos Sub-�rg�os.</label>
			</td>
		</tr>
		<tr>
			<td align="left" height="40" valign="top">
				<DD><label tabindex="34"><b>Excluir</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="35">Exclui as localidades e seus respectivos sub-�rg�os do campo Localidades dos Sub-�rg�os.</label>
			</td>
		</tr>
		<tr>
			<td align="left" height="40" valign="top">
				<DD><label tabindex="36"><b>Gerar</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="37">Gera o relat�rio baseado nos dados informados.</label>
			</td>
		</tr>
	 </table>	 
	</td>
	</tr>
	<tr>
	 <td>
		<hr>
		 <p class="voltar"><A title="imprimir esta p�gina" href="javascript:window.print()" tabindex="38">imprimir</A> 
		  . <A title="topo da p�gina" href="javascript:window.location=location.href;" tabindex="39">topo</A>
	 </td>
	</tr>
</table> 	  

	
</body>	

</HTML>