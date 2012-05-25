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
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<%@ taglib uri="/tags/struts-logic" prefix="logic" %>
<%@ taglib uri="/tags/struts-bean" prefix="bean"%>
<%@ taglib uri="/tags/struts-html" prefix="html"%>

<html:html lang="pt">

<head>
	<html:base />
	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
	<meta name="Keywords" content="acessibilidade, guia, serpro, inclusão, deficiência, recomendações, necessidade especial, ouvidoria" />
	<link rel="stylesheet"  media="all" href="../<bean:write name="_LAYOUT_" property="esquemaCores"/>/estilo_conteudo.css" type="text/css">
	
	<title>Busca de Scripts</title>

	<!-- Bibliotecas javascript  -->
	<script language="JavaScript" src="../js/util.js"></script>

	<script language="JavaScript">

	function onLoad(){
		try {
			document.getElementById("titulo").focus();
		} catch (e) {}
	}
	
	function RegistrarAtendimento(){
		var innerHtmlMsgErros = '';
		var ok = true;
			
		if (document.forms[0].acao.value != "detalhar"){
			innerHtmlMsgErros += formataErro('&eacute; necessário selecionar um script');
			ok = false;
		}

		if(!ok){
			var texto = innerHtmlMsgErros;
			abreAlerta(texto);
			window.frames[1].document.forms[0].imgDetalhe.focus();
			return false;
		}

		document.forms[0].action = "../../acionamento/CadastrarAtendimento.do";
		document.forms[0].idScript.value = window.frames[1].document.forms[0].id.value;
		document.forms[0].target = "_self";
		document.forms[0].submit();
		return true;
		
	}
	
	function CadastrarAcionamento(){
		document.forms[0].action = "../../acionamento/EnviarMensagemWeb.do";
		document.forms[0].target = "_self";
		document.forms[0].submit();
		return true;

	}
	
	function ConsultarScript(){
		window.frames[1].location = "../../../acionamento/Vazio.do";
		document.getElementById('exibeScript').style.height = "0px";
		document.forms[0].acao.value="listar";
		document.forms[0].submit();
	}
	
	function AtualizarValor(){
		if (document.forms[0].chkBuscarNovamente.checked)
			document.forms[0].chkBuscarNovamente.value = "S";
		else
			document.forms[0].chkBuscarNovamente.value = "N";
	}
	
	</script>
</head>

<body onLoad="onLoad();">

<div id="content"> 
	<h1 id="titulo" tabindex="1">CONSULTAR SCRIPT</h1>

	<p tabindex="4">
		Para consultar um script informe uma palavra-chave e/ou um assunto.
	</p>
	<html:form action="/ListarScript" method="post" target="lstScripts">

	<input type="hidden" name="acao" value="buscar">
	<input type="hidden" name="idScript">

	<table cellpadding="2" cellspacing="0" border="0" width="100%" height="30">
		<tr>

		<td>
	    	<table height="100%" cellpadding="2" cellspacing="1" border="0" width="100%">
	    	<tr>
	        	<td class="tdHeader3">
	        		<label for="ptexto" accesskey="T">Palavra-chave:</label>
	        	</td>
	   		    <td class="tdHeader4">
			      	<input type="text" tabindex="5" size="30" name="txtBusca" class="text" id="ptexto" maxlength=50>
		    	</td>				
		      </tr>
		    </table>
		</td>

    	<td height="100%">
		  	<table height="100%" cellpadding="2" cellspacing="1" border="0"  width="100%">
		    	<tr>
		      	<td class="tdHeader3"><label for="passunto" accesskey="A">Assunto:</label></td>
			    	<td class="tdHeader4">
			    		<html:select property="txtAssunto" tabindex="6" styleClass="text" styleId="passunto">
			    			<html:option value="0">Todos</html:option>
								<html:options collection="lstAssuntos" property="id" labelProperty="descricao"/>    
							</html:select>
			    	</td>
					</tr>					
		    </table>
	    	</td>
			
		  	<td id="buscaNovamente" style="display: none;">
	    	<table height="100%" cellpadding="2" cellspacing="1" border="0"  width="100%">
		    	<tr>
	        	<td class="tdHeader3">
	        		<label for="pbuscarNovamente" accesskey="R"><b>Buscar nestes resultados?</b>
	        		</label>
	        	</td>
	   		    <td class="tdHeader4">
					<input type="checkbox" tabindex="7" size="30" name='chkBuscarNovamente' id="pbuscarNovamente" value="N"
								onclick="AtualizarValor();"
								onkeypress="AtualizarValor();">
		    	</td>
		      </tr>
		    </table>
			</td>
		</tr>	
		<tr>
			        <td colspan='2' align='middle' class='tdHeader1'>
		                <label for="consultar scripts"> 
					    	<input type='button' tabindex="8" value='Buscar' name='buscar' class='button' onClick="javascript:ConsultarScript();"  title='Clique para efetuar a consulta'>
		                </label> 
					</td>		       
 			     </tr>
		<tr>
			<td colspan="4">
				<iframe tabindex="9" src="_blank.htm" name="lstScripts" id="lstScripts" longdesc="Lista de Scripts" width="100%" height="0" scrolling="0" marginwidth="0" marginheight="0" frameborder="0"></iframe>
			</td>
		</tr>
		<tr>
			<td colspan="4">
				<iframe tabindex="10" src="_blank.htm" name="exibeScript" id="exibeScript" llongdesc="Script Selecionado" width="100%" height="0" scrolling="0" marginwidth="0" marginheight="0" frameborder="0"></iframe>
			</td>
		</tr>	
			
	</table>
  <hr>
  <p class="voltar"> 
	<a tabindex="13" title="Voltar para página anterior" href="javascript:history.go(-1)">voltar</a>
  </p>
</html:form>  
  
</div>
</body>
</html:html>
