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
 	<label tabindex=1 id="titulo"><b>Indicadores Histórico</b></label>
 </td>
</tr>
<tr>
 <td align="center"><br>
 	<img src="../../images/ajuda/indicadoresHistorico_1.jpg" tabindex="2" name="imgTela" id="imgTela" alt="Imagem da tela de consultar indicadores de histórico">
 	<img src="../../images/ajuda/indicadoresHistorico_2.jpg" tabindex="3" name="imgTela" id="imgTela" alt="Imagem da tela de consultar indicadores de histórico"> 	
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
  		Possibilita que sejam extraídos relatórios para análise do histórico do comportamento de determinados indicadores da ouvidoria, tendo como universo o total de acionamentos cadastrados ouvidoria em um determinado período.
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
			<td height="30" colspan="2" valign="top"><a name="busca"><label tabindex="7"><b>1 - Consultar Indicadores Externos</b></label></a></td>
		</tr>
		<tr>
			<td height="40" colspan="2" valign="top">				
					<label tabindex="8">
					Serve para criar Indicadores de Histórico específicos, listando apenas as que correspondem ao crit&eacute;rio de busca selecionado.<br>
					Os crit&eacute;rios possíveis para a criação são:
					</label>
			</td>
		</tr>
		<tr>
			<td align="left" height="40" width="40%" valign="top">
				<DD><label tabindex="9"><b>Modo de exibição</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="10">Campo para seleção do modo de exibição do relatório, se consolidado (com os dados totalizados) ou detalhado (com os dados separados).</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40" width="40%" valign="top">
				<DD><label tabindex="11"><b>Tipo de Indicador</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="12">Campo para seleção do tipo de indicador será utilizado na geração do relatório.</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40" width="40%" valign="top">
				<DD><label tabindex="13"><b>Meio de envio de resposta</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="14">Campo para seleção dos meios de envio de resposta que serão utilizados na geração do relatório. Esse campo só estará disponível para o tipo de indicador Tempo M&eacute;dio de Atendimento.</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40" width="40%" valign="top">
				<DD><label tabindex="15"><b>Agrupamento dos Dados</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="16">Campo para seleção do modo que os dados serão agrupados na geração do relatório.</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40" width="40%" valign="top">
				<DD><label tabindex="17"><b>Período</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="18">Campo para digitação do período no qual o relatório será baseado.</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40" width="40%" valign="top">
				<DD><label tabindex="19"><b>Tipo de Gráfico</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="20">Campo para seleção do tipo de gráfico que será gerado no relatório.</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40" width="40%" valign="top">
				<DD><label tabindex="21"><b>Meta</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="22">Campo para digitação da meta da ouvidoria, que será traçada no gráfico gerado e servirá para comparação com os resultados obtidos. Esse campo só estará disponível para o tipo de indicador Tempo M&eacute;dio de Atendimento.</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40" width="40%" valign="top">
				<DD><label tabindex="23"><b>N&uacute;mero máximo de sub-órgãos/localidades</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="24">N&uacute;mero máximo de sub-órgãos/localidades que poderão ser selecionados para geração do relatório.</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40" width="40%" valign="top">
				<DD><label tabindex="25"><b>Sub-órgão</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="26">Campo para pr&eacute;-seleção dos sub-órgãos nos quais o relatório será baseado.</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40" width="40%" valign="top">
				<DD><label tabindex="27"><b>Localidade</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="28">Campo para pr&eacute;-seleção das localidades dos sub-órgãos nas quais o relatório será baseado.</label>
			</td>
		</tr>	
		<tr>
			<td align="left" height="40" width="40%" valign="top">
				<DD><label tabindex="29"><b>Localidades dos Sub-órgãos</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="30">
					Campo para exibição e exclusão das localidades e dos respectivos sub-órgãos nos quais o relatório será baseado. Somente as localidades listadas nesse campo são consideradas selecionadas.<br><br>
					Para adicionar uma localidade, siga os seguintes passos:<br>
						<DD>1.	Selecione um Sub-Órgão;</DD><br>
						<DD>2.	Selecione as localidades deste Sub-Órgão;</DD><br>
						<DD>3.	Clique no botão Enviar;</DD><br>
						<DD>4.	Verifique se as localidades selecionadas estão na caixa Localidades dos Sub-Órgãos.</DD><br>
					Para excluir uma localidade, siga os seguintes passos:<br>
						<DD>1.	Selecione as localidades a serem excluídas na caixa Localidades dos Sub-Órgãos;</DD><br>
						<DD>2.	Clique no botão Excluir.</DD><br>
				</label>
			</td>
		</tr>	
		
		<tr>
		<td align="left" height="40" valign="top" colspan="3">
			<label tabindex="31">
			Após o fornecimento dos crit&eacute;rios de busca deve-se utilizar o botão "Gerar" ou a tecla "Enter", para que o sistema traga o gráfico de indicadores de acordo com os filtros solicitados.<br>			
			</label>
		</td>					
		</tr>			
	 </table>
	 
	 <br><br>	
	 
	 <table border="0" cellpadding="5" cellspacing="0" align="center" width="100%">				
		<tr>
			<td height="40" colspan="2" valign="top">
				<label tabindex="32">Está disponível o botão que opera sobre a mensagem respondida:</label>
			</td>
		</tr>
		<tr>
			<td align="left" height="40" valign="top">
				<DD><label tabindex="33"><b>Enviar</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="34">Envia as localidades e seus respectivos sub-órgãos para o campo Localidades dos Sub-órgãos.</label>
			</td>
		</tr>
		<tr>
			<td align="left" height="40" valign="top">
				<DD><label tabindex="35"><b>Excluir</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="36">Exclui as localidades e seus respectivos sub-órgãos do campo Localidades dos Sub-órgãos.</label>
			</td>
		</tr>
		<tr>
			<td align="left" height="40" valign="top">
				<DD><label tabindex="37"><b>Gerar</b></label></DD>
			</td>
			<td valign="top">
				<label tabindex="38">Gera o relatório baseado nos dados informados.</label>
			</td>
		</tr>
	 </table>	 
	</td>
	</tr>
	<tr>
	 <td>
		<hr>
		 <p class="voltar"><A title="imprimir esta página" href="javascript:window.print()" tabindex="39">imprimir</A> 
		  . <A title="topo da página" href="javascript:window.location=location.href;" tabindex="40">topo</A>
	 </td>
	</tr>
</table> 	  

	
</body>	

</HTML>