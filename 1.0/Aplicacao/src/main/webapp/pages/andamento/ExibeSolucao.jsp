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

<!-- TagLibs Struts -->
<%@ taglib uri="/tags/struts-logic" prefix="logic" %>
<%@ taglib uri="/tags/struts-bean"  prefix="bean"%>
<%@ taglib uri="/tags/struts-html"  prefix="html"%>


<html:html lang="pt">
<head>
<html:base />
<meta http-equiv='Content-Type' content='text/html; charset=iso-8859-1'>
<title>Banco de Soluções</title>

<script language="JavaScript">

// Função executada ao carregar a tela
function onLoad(){

	// Flag para verificação se a solução será enviada a outra
	// atividade
	var acaoChamadora = '';
	
	try {
		acaoChamadora = parent.document.forms[0].acaoChamadora.value;		
	}catch(err){
	}
	
	// Se a ação chamadora for diferente de Responder Mensagem,
	// não exibe botão de enviar solução
	if (acaoChamadora != "ResponderMsg"){
		document.getElementById("linkEnviar").style.visibility="hidden";
		document.getElementById("figuraEnviar").style.visibility="hidden";	
	}	

	window.parent.document.getElementById("exibeSolucao").style.height = this.document.body.scrollHeight;
	
	document.getElementById("imgDetalhe").focus();			               
}

function Enviar(){
	
	try {
		parent.window.opener.document.frm_msg.txtResposta.value = document.forms[0].DescSolucao.value;
		parent.window.opener.document.getElementById("idSolucao").value=document.getElementById("idSolucao").value;
		parent.window.opener.onLoad();
	}catch(err){
	}
	
	return false;
}

</script>	

</head>
<link rel="stylesheet"  media="all" href="../<bean:write name="_LAYOUT_" property="esquemaCores"/>/estilo_conteudo_pop.css" type="text/css">
<link rel='stylesheet' type='text/css' media='print' href='../estilo_print.css'>
<body onload="onLoad();" style="margin: 0px 0px;">
<form>
    
    <input type="hidden" name="idSolucao" id="idSolucao" value="<bean:write name="SolucaoForm" property="id"/>"/>
    
    <table border="0" width="100%" cellpadding="0" cellspacing="0">
    	<tr>
            <td align="left"><img src="../<bean:write name="_LAYOUT_" property="esquemaCores"/>/pasta_detalha.gif" name="imgDetalhe" id="imgDetalhe" tabindex="1" alt='Solução Escolhida'><table cellpadding='2' cellspacing='1' border='0' width='100%'>
            <tr>
	            <td>
	                <table cellpadding='0' cellspacing='0' border='0'  width='100%'>
        		    <tr>
	         	       <td class='contentBold'>
	                       <div tabindex="2">
	                       &nbsp;<bean:message key="prompt.solucao"/> : <bean:write name="SolucaoForm" property="titulo"/>
				       	   </div> 
                       </td>         
                    </tr>
                    <tr>                     
		               	<td class='tdHeader4'>
							<a href="javascript: void 0;" tabindex="3" id="linkEnviar" onClick="return Enviar();" onkeypress="return Enviar();" alt="Clique para enviar esta solução para a resposta da mensagem">
						   		<img src="../images/enviar.jpg" id="figuraEnviar" border="0" title="Enviar solução para a resposta da mensagem">
						   	</a>
			               <html:hidden name="SolucaoForm" property="id"/> 
			               
	                       <div tabindex="4" id="textoSolucao">
	                       <bean:write name="SolucaoForm" property="textoFormatado" filter="false"/>
				           </div>	
  			           </td>
		            </tr>		
                    </table>
	            </td>
            </tr>	
            </td>
      	</tr>	

 	</table>

<INPUT TYPE="hidden" NAME="DescSolucao"  VALUE="<bean:write name="SolucaoForm" property="texto"/>">		

</form>
</body>
</html:html>
