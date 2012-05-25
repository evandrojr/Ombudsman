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
<% /*
   -- Módulo:       Gerencial
   -- 
   -- Descrição:    Exibe detalhes do scripts para consulta ou inclusão
   -- 
   -- Versão:       1.0
   -- Data:         27/12/2004   
  */
%>

<%@ taglib uri="/tags/struts-logic" prefix="logic" %>
<%@ taglib uri="/tags/struts-bean" prefix="bean"%>
<%@ taglib uri="/tags/struts-html" prefix="html"%>

<html:html lang="pt">

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<head>
<html:base />

<title>Atualizar Cadastro</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link rel="stylesheet"  media="all" href="../<bean:write name="_LAYOUT_" property="esquemaCores"/>/estilo_conteudo.css" type="text/css">
<!-- Estilo para impressao -->
<link rel="stylesheet" type="text/css" media="print" href="../estilo_print.css">

<script language="JavaScript">
<!--
function MM_reloadPage(init) {  //reloads the window if Nav4 resized
  if (init==true) with (navigator) {if ((appName=="Netscape")&&(parseInt(appVersion)==4)) {
    document.MM_pgW=innerWidth; document.MM_pgH=innerHeight; onresize=MM_reloadPage; }}
  else if (innerWidth!=document.MM_pgW || innerHeight!=document.MM_pgH) location.reload();
}
MM_reloadPage(true);
// -->
</script>
</head>

<!-- Biblioteca javascript  -->
<script language="JavaScript" src="../js/util.js"></script>

<script type="text/javascript" charset='iso-8859-1'>

// Confirma alteração/exclusão do script selecionado
function ValidaOperacao(pOperacao){
	var ok;
	var innerHtmlMsgErros = '';
	var pergunta   = '';
					
	ok = true;            
	
	// Limpa campo em branco ou só com CR+LF
	limpaCampoEmBranco(document.forms[0].txtDscGrupo);
	limpaCampoEmBranco(document.forms[0].txtDscListaEmail);
	
	// Se a operação for de inclusão, não há solicitação de
	// de confirmação
    if (pOperacao == 'IncluirGrupo') {
        document.forms[0].action.value = 'IncluirGrupo';
    } else {
    	if (pOperacao == 'AlterarGrupo') {        
            pergunta = 'Confirma a alteração do grupo de email?';
        } else if (pOperacao == 'ExcluirGrupo') {            
        	pergunta = 'Confirma a exclusão do grupo de email?';
        }        
    }    

	// Guarda a operação solicitada para o retorno da confirmação
	document.forms[0].operacao.value = pOperacao;
	
	// Críticas
	if ( (pOperacao == 'AlterarGrupo') ||
 	     (pOperacao == 'IncluirGrupo') ) {	    
	    if (document.forms[0].txtDscGrupo.value=='') {
	        innerHtmlMsgErros += formataErro('O preenchimento da identificação &eacute; obrigatório');
	        ok = false;
	    }      	    
	    if (document.forms[0].txtDscListaEmail.value=='') {
	        innerHtmlMsgErros += formataErro('O preenchimento da lista de email &eacute; obrigatório');	        
	        ok = false;
	    }   else {
			var res = validaListaEmails(document.forms[0].txtDscListaEmail.value);
			if (res == false) {
		        innerHtmlMsgErros += formataErro('Lista de emails inválida');	        
		        ok = false;			
			}
		}
	}

	if(ok){
	    if (document.forms[0].action.value == 'IncluirGrupo') {
	        salvar();   
	    } else {
	    	// Confirma alteração ou exclusão
	        abreConfirmacao('salvar', pergunta);
	    }    

	} else {
		var texto = innerHtmlMsgErros;
		abreAlerta(texto);		
	    onLoad();	    
	}		
}

// Chama tela de confirmação para alteração e exclusão
function abreConfirmacao(callBack, pergunta) {
	var baseHref = location.protocol + "//" + location.host + location.pathname;
	var parametros = "?action=" + callBack + "&pergunta=" + pergunta;	
	novaJanela( baseHref + "../../../pages/Confirma.jsp" + parametros, "Confirma", 350, 120, 0, 0, 300, 200 );
}

// Efetiva a alteração ou a exclusão
function salvar() {	
		
	// A próxima ação a ser disparada será a operação escolhida
	document.forms[0].action.value = document.forms[0].operacao.value;	
	document.forms[0].submit();		
	
}

// Tarefas a serem execuadas no carregamento da página
function onLoad() {

	// Redimensiona o iFrame de detalhe do grupo de email da tela 
	// de consulta de grupos de email
	if (document.forms[0].idGrupoEmail.value == "0") {	
    	window.parent.document.getElementById("lista").style.height = this.document.body.scrollHeight;
    } else {
		window.parent.document.getElementById("detalhe").style.height = this.document.body.scrollHeight;		
	}
	
    if (document.forms[0].txtDscListaEmail.value != "") {
    	textCounter(document.forms[0].txtDscListaEmail, document.getElementById('contador'), 1000);
	}
	
	// Se a área de detalhe estiver com altura diferente de zero, &eacute; porque a aquela 
	// apresenta uma msg. Neste caso o foco deve ser mantido nesta.		
	if  (  ( ( document.forms[0].idGrupoEmail.value == "0" ) &&
	         (window.parent.document.getElementById("detalhe").style.height  == "0px") ) ||
		   (document.forms[0].idGrupoEmail.value != "0") )  {	
		document.getElementById("imgDetalhe").focus();
	}	
	
}

</script>

<body onload="javascript:onLoad();" 
      style="margin: 0px 0px;">

<html:form action="AtualizarGruposEmail" target="detalhe">

<br>
<table cellpadding="2" cellspacing="0" border="0" align="center" width="100%">
  <tr>
  <td align="left"><img src="../<bean:write name="_LAYOUT_" property="esquemaCores"/>/pasta_detalha.gif" name="imgDetalhe" id="imgDetalhe" tabindex="1" alt='Grupo de email escolhido'><table cellpadding='2' cellspacing='1' border='0' width='100%'>
	  <tr> 
	    <td class="tdHeader3" width="12%"><label for="identificacao">Identificação:</label></td>
	    <td class="tdHeader4" colspan="4" align="left"> 
	      <div align="left"> 
	        <logic:present name="GrupoEmail">
		        <input id="identificacao" name="txtDscGrupo" size="50" tabindex="2" class="text"
		        value="<bean:write name="GrupoEmail" property="descricao" />">	        
	        </logic:present>
	        <logic:notPresent name="GrupoEmail">
		        <input id="identificacao" name="txtDscGrupo" size="50" tabindex="2" class="text">
	        </logic:notPresent>   
	      </div>
	    </td>
	  </tr>
	  <tr> 
	    <td class="tdHeader3" id="maenome" colspan="5"><label for="lista"> Lista de emails (use vígula como separador): </label>
		   <logic:present name="GrupoEmail">
	       <br><TEXTAREA id=texto name="txtDscListaEmail" rows=3 cols=70 tabindex="3" onKeyUp="textCounter(this, document.getElementById('contador'), 1000);" maxlength="1000"><bean:write name="GrupoEmail" property="listaEmail" /></TEXTAREA>
	       </logic:present> 
	       <logic:notPresent name="GrupoEmail">
	       <br><TEXTAREA id=texto name="txtDscListaEmail" rows=3 cols=70 tabindex="3" onKeyUp="textCounter(this, document.getElementById('contador'), 1000);" maxlength="1000"></TEXTAREA>
	       </logic:notPresent> 
		   <div id="contador">1000 caracteres restantes</div>
	       <div align="center"> </div>
	       <div align="center"> 
	        <logic:present name="GrupoEmail">
		        <input type="button" name="botao" value="Alterar" tabindex="13" class="button" onClick="ValidaOperacao('AlterarGrupo')" >
		        &nbsp;&nbsp;&nbsp;&nbsp; 
		        <input type="button" name="botao2" value="Excluir" tabindex="14" class="button" onClick="ValidaOperacao('ExcluirGrupo')" >
		    </logic:present>
		    <logic:notPresent name="GrupoEmail">
		        <input type="button" name="botao" value="Incluir" tabindex="13" class="button" onClick="ValidaOperacao('IncluirGrupo')" >
		    </logic:notPresent>
	       </div>
	    </td>
	  </tr>
  </table>  
  </td>
  </tr>
</table>    

<logic:present name="GrupoEmail">  
    <INPUT TYPE="hidden" NAME="idGrupoEmail"  VALUE="<bean:write name="GrupoEmail" property="id" />">
</logic:present>
<logic:notPresent name="GrupoEmail">  
    <INPUT TYPE="hidden" NAME="idGrupoEmail"  VALUE="0">
</logic:notPresent>

<html:hidden property="action"    value="" />
<html:hidden property="operacao"  value="" />

</html:form>

</body>
</html:html> 
