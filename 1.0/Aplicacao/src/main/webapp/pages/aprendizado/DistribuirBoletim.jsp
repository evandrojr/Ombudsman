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
<%@ page import="java.util.List"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="br.gov.serpro.ouvidoria.model.GruposEmail"%>

<html:html lang="pt">
<head>
<html:base />
<script src="../js/util.js" type="text/javascript"></script>
<script language="JavaScript">
	var arrayGrupos = new Array();

		<%
			List grupos = (List)request.getAttribute("listaGrupo");		

			Iterator iter = grupos.iterator();
			GruposEmail grupo = null;
			while (iter.hasNext()) {
				grupo = (GruposEmail) iter.next();
		%>
			arrayGrupos[<%=grupo.getId()%>] = '<%=grupo.getListaEmail()%>';
		<%		
			}	
		%>

	function selecionaGrupo(){
		if (document.forms[0].grupo.value != 0){
			document.forms[0].listaEmails.value = arrayGrupos[document.forms[0].grupo.value];
		}
	}
	
	function distribuir(){
		document.forms[0].action='../../aprendizado/AtualizarHistoricoEnvio.do?action=distribuir&idBoletim=<%=request.getParameter("idBoletim")%>';
		document.forms[0].submit();
	}
	
	function validar(){	
		var innerHtmlMsgErros = '';
		var ok = true;
		
		if (document.forms[0].listaEmails.value=='') {
	        innerHtmlMsgErros += formataErro('O preenchimento da lista de emails &eacute; obrigat�rio.');	        
	        ok = false;
	    }   else {
			var res = validaListaEmails(document.forms[0].listaEmails.value);
			if (res == false) {
		        innerHtmlMsgErros += formataErro('Lista de emails inv�lida');	        
		        ok = false;			
			}
		}	
		
		if(ok){
			distribuir();	
		} else {
			var texto = innerHtmlMsgErros;
			abreAlerta(texto);		
		}		
	}	
	
// Fun��o executada ao carregar a tela
	function onLoad(){
		<logic:present name="fechar" scope="request">
			<logic:notPresent name="erro" scope="request">
				window.parent.document.getElementById("detalheEnvios").style.height = 0;
				abreAlertaGeral('Boletim Enviado', '<li>O boletim foi enviado com sucesso.</li>')
			</logic:notPresent>
			<logic:present name="erro" scope="request">
				abreAlertaGeral('Erro no envio do boletim', '<li>Os emails com o boletim n�o puderam ser enviados.</li>')
			</logic:present>
		</logic:present>

		<logic:notPresent name="fechar" scope="request">
			window.parent.document.getElementById("detalheEnvios").style.height = this.document.body.scrollHeight;
		</logic:notPresent>	
	}
</script>	
		
<meta http-equiv='Content-Type' content='text/html; charset=iso-8859-1'>
<title>Boletim</title>
</head>
<link rel="stylesheet"  media="all" href="../<bean:write name="_LAYOUT_" property="esquemaCores"/>/estilo_conteudo.css" type="text/css">
<link rel='stylesheet' type='text/css' media='print' href='../estilo_print.css'>
<body onload="onLoad();" style="margin: 0px 0px;">

<html:form method="post" action="/AtualizarHistoricoEnvio.do?action=distribuir">
    <table border="0" width="100%" cellpadding="0" cellspacing="0">
    	<tr>
            <td align="left"><img src="../<bean:write name="_LAYOUT_" property="esquemaCores"/>/pasta_detalha.gif" name="imgDetalhe" id="imgDetalhe" tabindex="1" alt='Distribuir Boletim'><table cellpadding='2' cellspacing='1' border='0' width='100%'>
				<table width="100%" name="rsTable" id="rsTable" cellpadding="2" cellspacing="1" border="0">
				   	<TR>
			           <td class="tdHeader3" width="10%"><label for="grupo" tabindex="2">Grupos:</label></td>
			           <td class="tdHeader4" width="90%" align="left">
			           		<html:select property="grupo" tabindex="3" styleClass="text" styleId="grupo" onchange="selecionaGrupo();">
				             	 <html:option value="0">Selecione:</html:option>
					             <html:options collection="listaGrupo" property="id" labelProperty="descricao"/>    
				             </html:select>
			           </td>
			        </TR>
			        <TR>
			           <td class="tdHeader3"><label for="listaEmails" tabindex="4">Lista de Destinat�rios:</label></td>
			           <td class="tdHeader4" align="left">
			           		<textarea name="listaEmails" id="listaEmails" cols="68" rows="3" tabindex="5"></textarea>
			           </td>
			        </TR>  
			         <tr> 
			           <td class="tdHeader3" id="botoes" colspan="2">
			           <div align="center">
			              <input type="button" tabindex="6" name="enviar" id="enviar" value="Enviar" class="button" onclick="validar()">      
			           </div>
			           </td>
			         </tr>                                     
			    </table>
            </td>
      	</tr>	

 	</table>
</html:form>

	<script type="text/javascript" charset='iso-8859-1'>
		window.parent.document.getElementById("detalheEnvios").style.height = this.document.body.scrollHeight;		
	</script>

</body>
</html:html>
