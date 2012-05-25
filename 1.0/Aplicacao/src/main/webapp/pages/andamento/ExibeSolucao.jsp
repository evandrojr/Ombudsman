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

<!-- TagLibs Struts -->
<%@ taglib uri="/tags/struts-logic" prefix="logic" %>
<%@ taglib uri="/tags/struts-bean"  prefix="bean"%>
<%@ taglib uri="/tags/struts-html"  prefix="html"%>


<html:html lang="pt">
<head>
<html:base />
<meta http-equiv='Content-Type' content='text/html; charset=iso-8859-1'>
<title>Banco de Solu��es</title>

<script language="JavaScript">

// Fun��o executada ao carregar a tela
function onLoad(){

	// Flag para verifica��o se a solu��o ser� enviada a outra
	// atividade
	var acaoChamadora = '';
	
	try {
		acaoChamadora = parent.document.forms[0].acaoChamadora.value;		
	}catch(err){
	}
	
	// Se a a��o chamadora for diferente de Responder Mensagem,
	// n�o exibe bot�o de enviar solu��o
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
            <td align="left"><img src="../<bean:write name="_LAYOUT_" property="esquemaCores"/>/pasta_detalha.gif" name="imgDetalhe" id="imgDetalhe" tabindex="1" alt='Solu��o Escolhida'><table cellpadding='2' cellspacing='1' border='0' width='100%'>
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
							<a href="javascript: void 0;" tabindex="3" id="linkEnviar" onClick="return Enviar();" onkeypress="return Enviar();" alt="Clique para enviar esta solu��o para a resposta da mensagem">
						   		<img src="../images/enviar.jpg" id="figuraEnviar" border="0" title="Enviar solu��o para a resposta da mensagem">
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
