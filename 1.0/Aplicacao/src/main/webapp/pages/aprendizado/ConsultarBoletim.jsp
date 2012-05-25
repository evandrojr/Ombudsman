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

<html lang="pt">
<head>
<html:base />
<script src="../js/util.js" type="text/javascript"></script>
<script src="../js/dateKit.js" type="text/javascript"></script>

<script src="../js/data.js" type="text/javascript"></script>

<title>Consultar Boletins</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link rel="stylesheet"  media="all" href="../<bean:write name="_LAYOUT_" property="esquemaCores"/>/estilo_conteudo.css" type="text/css">

<script language="JavaScript">

	function validaForm() {

		var ok;
		var msg = '';
		
		// Trata Href
		var basehref = location.href;
		var i = basehref.lastIndexOf('/');
		basehref = basehref.substring(0, i + 1);	
		
		ok = true;            

        // limpa os iFrames
		window.frames[0].location= basehref + "Vazio.do";
		window.frames[1].location= basehref + "Vazio.do";
		window.frames[2].location= basehref + "Vazio.do";
  
	    // Valida a data inicial
	    if (document.forms[0].txtPeriodoIni.value != '') {
	        if (! CriticarData(document.forms[0].txtPeriodoIni) ) {
				msg += '<li>O conte&uacute;do do campo data inicial não &eacute; válido.</li>';	
		        ok = false;                    
	        } else {
	           FormataData(document.forms[0].txtPeriodoIni);
	        }       
	    }    
	
	    // Valida a data final
	    if (document.forms[0].txtPeriodoFim.value != '') {
	        if (! CriticarData(document.forms[0].txtPeriodoFim) ) {
	 	        msg += '<li>O conte&uacute;do do campo data final não &eacute; válido.</li>';		
		        ok = false;                    
	        } else {
	           FormataData(document.forms[0].txtPeriodoFim);
	        }       
		}
			
		// Se as datas estiverem preenchidas, 
		// verifica se a data inicial &eacute; maior que a final
		var dataI = document.forms[0].txtPeriodoIni.value;
		var dataF = document.forms[0].txtPeriodoFim.value;
		
		if ( (dataI != '') && (dataF != '') ) {
			if ( dataMaior( dataI, "", dataF, "" ) ) {
			    msg += '<li>A data inicial &eacute; maior que a data final</li>';
			    ok = false;                    
	  		}
	  	}  		 	  
	
		  if(ok){
			  document.forms[0].submit();            
		  } else {
			  var texto = msg;
			  abreAlerta(texto);					
			  setaFocoOnLoad();
		  }	
	}

   // Seta o foco ao carregar a tela
   function setaFocoOnLoad(){
	   document.getElementById("titulo").focus();
   }

</script>

</head>
<script type="text/javascript" charset='iso-8859-1'>
<!-- //
	function onLoad() {
		var focusControl = document.getElementById("titulo");
   		focusControl.focus();
   	}
// -->
</script>

<body onLoad='onLoad();'>

<div id="content">
<h1 id="titulo" title="Administrar Lista de Boletins" tabindex="1">Administrar Lista de Boletins</h1>
<!-- <hr> -->

<html:form action="/AtualizarBoletim.do" method="get" target="lista">
<input type="hidden" value="listar" name="action">

<p tabindex="2" Align="LEFT">Para consultar um boletim, informe uma palavra chave ou um intervalo de datas de criação. </p>

<table cellpadding='2' cellspacing='0' border='0' width='100%' height='30px'>
    <tr>
        <td>
            <table height="100%" cellpadding='2' cellspacing='1' border='0'  width='100%'>
	        <tr>
            	<td class='tdHeader3'>&nbsp;<label for="ptexto" tabindex="3">Palavra Chave:</label></td>
   		    	<td class='tdHeader4'>
		        &nbsp;<input type='text' tabindex="4" size='20' name='txtBusca' class='text' id="ptexto">
		        &nbsp;&nbsp;
		    	</td>
	        </tr>
	    </table>
        </td>
        <td>
			<table height="100%" cellpadding='2' cellspacing='1' border='0'  width='100%' height='30px'>
		        <tr>
		            <td class='tdHeader3' width='85'><label tabindex="5">&nbsp;Per&iacute;odo:</label></td>
	   			    <td class='tdHeader4'>
				        &nbsp;
			    	  <label  for="txtPeriodoIni">de</label>
			        	<input type="text" tabindex="7" class="text" size="10" title="Data inicial" id="txtPeriodoIni" 
							name="txtPeriodoIni"  maxlength="10"/>
				      <label  for="txtPeriodoFim">at&eacute;:</label>
				        <input type="text" tabindex="9" class="text" size="9" title="Data final" id="txtPeriodoFim" 
							name="txtPeriodoFim" maxlength="10" />
			    	</td>				
		        </tr>
		    </table>	     
        </td>
    </tr>	
	<tr>
	<td colspan='2' align='middle' class='tdHeader1'>
        <label for="consultar boletim"> 
	    <input type='button' tabindex="10" value='Buscar' name='buscar' class='button' onClick="javascript:validaForm();"  title='Clique para efetuar a consulta'>
        </label> 
	</td>
</tr>											

</table>

<br>

<table cellpadding="0" cellspacing="0" border="0"  width="100%">
<tr>
	<td>
	<iframe src="../../aprendizado/Vazio.do" id="lista" name="lista" longdesc="listagem" width="100%" height="0" scrolling="0" marginwidth="0" marginheight="0" frameborder="0"></iframe>
	</td>
</tr>
<tr><td height="4"></td></tr>
<tr>
	<td>
	<iframe src='../../aprendizado/Vazio.do' id="detalhe" name="detalhe" longdesc="detalhe" width="100%" height="0" scrolling="0" marginwidth="0" marginheight="0" frameborder="0"></iframe>
	</td>
</tr>
<tr><td height="4"></td></tr>
<tr><td><iframe src='../../aprendizado/Vazio.do' id="detalheEnvios" name="detalheEnvios" longdesc="detalheEnvios" width="100%" height="0" scrolling="0" marginwidth="0" marginheight="0" frameborder="0"></iframe></td>
</tr>
</table>
<br>
<hr>
<p class="voltar"> 
	<a title="voltar para página anterior" href="javascript:history.go(-1)" >voltar</a>
</p>


</html:form>
</div>
</body>
</html>
