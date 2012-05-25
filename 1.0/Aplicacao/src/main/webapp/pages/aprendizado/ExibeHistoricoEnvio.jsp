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
<%--
 /*
   -- Módulo:       Aprendizado
   -- 
   -- Descrição:    Exibe os dados de um item do histórico de envios
   -- 
   -- Versão:       1.0
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
            <td align="left"><img src="../<bean:write name="_LAYOUT_" property="esquemaCores"/>/pasta_detalha.gif" name="imgDetalhe" id="imgDetalhe" tabindex="1" alt='Distribuição Escolhida'><table cellpadding='2' cellspacing='1' border='0' width='100%'>
				<table width="100%" name="rsTable" id="rsTable" cellpadding="2" cellspacing="1" border="0">
				   	<TR>
			           <td class="tdHeader3" width="10%"><label for="dataEnvio" tabindex="2">Data de Envio:</label></td>
			           <td class="tdHeader4" width="90%" align="left">
			           		<input readOnly="true" id="dataEnvio" name="dataEnvio" size="16" maxlength="16" class="text" tabindex="3" value="<bean:write name="object" property="dataEnvio" format="dd/MM/yyyy HH:mm"/>">
			           </td>
			        </TR>
			        <TR>
			           <td class="tdHeader3"><label for="responsavel"  tabindex="4">Responsável:</label></td>
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
