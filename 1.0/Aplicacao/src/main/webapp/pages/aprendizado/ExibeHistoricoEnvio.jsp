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
<%--
 /*
   -- M�dulo:       Aprendizado
   -- 
   -- Descri��o:    Exibe os dados de um item do hist�rico de envios
   -- 
   -- Vers�o:       1.0
   -- Data:         03/02/2005   
  */
--%>

<!-- TagLibs Struts -->
<%@ taglib uri="/tags/struts-logic" prefix="logic" %>
<%@ taglib uri="/tags/struts-bean"  prefix="bean"%>
<%@ taglib uri="/tags/struts-html"  prefix="html"%>

<html:html lang="pt">
<head>
<html:base />
<script src="../js/util.js" type="text/javascript"></script>
<script language="JavaScript">
	function onLoad(){
		window.parent.document.getElementById("detalheEnvios").style.height = this.document.body.scrollHeight;
		window.parent.frames[2].height = 0;
		
		document.getElementById("imgDetalhe").focus();
	}
</script>	
		
<meta http-equiv='Content-Type' content='text/html; charset=iso-8859-1'>
<title>Envio de Boletim</title>
</head>
<link rel="stylesheet"  media="all" href="../<bean:write name="_LAYOUT_" property="esquemaCores"/>/estilo_conteudo.css" type="text/css">
<link rel='stylesheet' type='text/css' media='print' href='../estilo_print.css'>
<body onload="onLoad();" style="margin: 0px 0px;">

<form name="envioBoletim" method="post" action="../../aprendizado/AtualizarHistoricoEnvio.do?action=exibirDetalhe&id=<bean:write name="object" property="id"/>">
    <table border="0" width="100%" cellpadding="0" cellspacing="0">
    	<tr>
            <td align="left"><img src="../<bean:write name="_LAYOUT_" property="esquemaCores"/>/pasta_detalha.gif" name="imgDetalhe" id="imgDetalhe" tabindex="1" alt='Distribui��o Escolhida'><table cellpadding='2' cellspacing='1' border='0' width='100%'>
				<table width="100%" name="rsTable" id="rsTable" cellpadding="2" cellspacing="1" border="0">
				   	<TR>
			           <td class="tdHeader3" width="10%"><label for="dataEnvio" tabindex="2">Data de Envio:</label></td>
			           <td class="tdHeader4" width="90%" align="left">
			           		<input readOnly="true" id="dataEnvio" name="dataEnvio" size="16" maxlength="16" class="text" tabindex="3" value="<bean:write name="object" property="dataEnvio" format="dd/MM/yyyy HH:mm"/>">
			           </td>
			        </TR>
			        <TR>
			           <td class="tdHeader3"><label for="responsavel"  tabindex="4">Respons�vel:</label></td>
			           <td class="tdHeader4" align="left">
			           		<input readOnly="true" id="responsavel" name="responsavel" size="50" maxlength="50" class="text" tabindex="5" value="<bean:write name="object" property="funcionario.nome"/>">
			           </td>
			        </TR>
			        <TR>
			           <td class="tdHeader3"><label for="listaEmail"  tabindex="6">Lista de Emails:</label></td>
			           <td class="tdHeader4" align="left">
			           		<textarea readOnly="true" name="listaEmail" id="listaEmail" cols="68" tabindex="7" rows="3"><bean:write name="object" property="listaEmails"/></textarea>
			           	</td>
			        </TR>
			    </table>
            </td>
      	</tr>	
 	</table>

</form>

	<script type="text/javascript" charset='iso-8859-1'>
		window.parent.document.getElementById("detalheEnvios").style.height = 0;		
	</script>

</body>
</html:html>
