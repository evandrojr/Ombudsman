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
	        innerHtmlMsgErros += formataErro('O preenchimento da lista de emails &eacute; obrigatório.');	        
	        ok = false;
	    }   else {
			var res = validaListaEmails(document.forms[0].listaEmails.value);
			if (res == false) {
		        innerHtmlMsgErros += formataErro('Lista de emails inválida');	        
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
	
// Função executada ao carregar a tela
	function onLoad(){
		<logic:present name="fechar" scope="request">
			<logic:notPresent name="erro" scope="request">
				window.parent.document.getElementById("detalheEnvios").style.height = 0;
				abreAlertaGeral('Boletim Enviado', '<li>O boletim foi enviado com sucesso.</li>')
			</logic:notPresent>
			<logic:present name="erro" scope="request">
				abreAlertaGeral('Erro no envio do boletim', '<li>Os emails com o boletim não puderam ser enviados.</li>')
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
			           <td class="tdHeader3"><label for="listaEmails" tabindex="4">Lista de Destinatários:</label></td>
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
