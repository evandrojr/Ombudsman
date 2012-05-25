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
<%@ taglib uri="/tags/struts-html" prefix="html"%>

<%@ taglib uri="/tags/struts-bean" prefix="bean"%>
<%@ taglib uri="http://jakarta.apache.org/taglibs/log-1.0" prefix="log" %>


<html>
<head>
	<html:base />
	<meta http-equiv='Content-Type' content='text/html; charset=iso-8859-1'>
	<link rel='stylesheet'  media='all' href='../<bean:write name="_LAYOUT_" property="esquemaCores"/>/estilo_conteudo.css' type='text/css'>
</head>

<script type="text/javascript" charset='iso-8859-1'>

    function onLoad()
    {
		document.forms[0].txt_periodo_i.setAttribute( 'dataType', 'date' );
		document.forms[0].txt_periodo_f.setAttribute( 'dataType', 'date' );
		afterPageBody();
		javascript:setaFocoOnLoad();
	}

    function validaForm() {
	var innerHtmlMsgErros = '';
	var el, errorEl;
		
	if ( document.forms[0].txt_protocolo.value != null && document.forms[0].txt_protocolo.value != '' ) {
		 innerHtmlMsgErros += CriticaNumero( document.forms[0].elements["txt_protocolo"], 6, 9, 0, 'Protocolo' );
	}  	

    // O preenchimento do per�odo � obrigat�rio
	if ( ( (document.forms[0].txt_periodo_i.value != '') && 
    	   (document.forms[0].txt_periodo_f.value == '') )  || 
         ( (document.forms[0].txt_periodo_i.value == '') && 
           (document.forms[0].txt_periodo_f.value != '') ) ) {
         innerHtmlMsgErros += formataErro('Informe o per�odo a ser consultado');
    }    
	
    // Valida a data inicial
    if (document.forms[0].txt_periodo_i.value != '') {
        if (! CriticarData(document.forms[0].txt_periodo_i) ) {
 	        innerHtmlMsgErros += formataErro('Data in�cio do per�odo inv�lida, use o formato dd/mm/aaaa');
        }  else if ( validaDataMaior( document.forms[0].txt_periodo_i.value, "00:00") )	{
 	        innerHtmlMsgErros += formataErro('Data in�cio do per�odo n�o pode ser futura');
        }       
    }
	
    // Valida a data final
    if (document.forms[0].txt_periodo_f.value != '') {
        if (! CriticarData(document.forms[0].txt_periodo_f) ) {
 	        innerHtmlMsgErros += formataErro('Data fim do per�odo inv�lida, use o formato dd/mm/aaaa');
        } else if ( validaDataMaior( document.forms[0].txt_periodo_f.value, "00:00") )	{
 	        innerHtmlMsgErros += formataErro('Data fim do per�odo n�o pode ser futura');
        }       
	}
		
	// Se as datas estiverem preenchidas, 
	// verifica se a data inicial &eacute; maior que a final
	var dataI = document.forms[0].txt_periodo_i.value;
	var dataF = document.forms[0].txt_periodo_f.value;
	
	if ( (dataI != '') && (dataF != '') ) {
		if ( dataMaior( dataI, "", dataF, "" ) ) {
	 		innerHtmlMsgErros += formataErro('Data in�cio do per�odo maior que a data final');
  		}
  	}  		     
	
   // O per�odo ser� obrigat�rio quando o campo palavra-chave for informado 	
   // O per�odo m�ximo entre a datas ser� de 31 dias quando o campo palavra-chave for informado    
        if (document.forms[0].txt_palavra_chave.value.trim()!=''){
           if ( (document.forms[0].txt_periodo_i.value != '') && 
                (document.forms[0].txt_periodo_f.value != '')){            
           
               Var_Dia1  = dataI.substring(0,2);  
               Var_Mes1  = dataI.substring(3,5);  
               Var_Ano1  = dataI.substring(6,10); 
               var data1 = new Date(Var_Ano1,Var_Mes1-1,Var_Dia1);

               Var_Dia2  = dataF.substring(0,2);  
               Var_Mes2  = dataF.substring(3,5);  
               Var_Ano2  = dataF.substring(6,10); 
               var data2 = new Date(Var_Ano2,Var_Mes2-1,Var_Dia2);

               var diferenca = data2.getTime() - data1.getTime();
               var diferenca = Math.floor(diferenca / (1000 * 60 * 60 * 24)); 
   
               if (diferenca > 31){ 
                  innerHtmlMsgErros += formataErro('Definir intervalo m�ximo de 30 dias para o per�odo quando a palavra-chave � informada');
               }
             
           }else
              innerHtmlMsgErros += formataErro('O preenchimento do per�odo torna-se obrigat�rio quando a palavra-chave � informada');          
       }
   
	
    el = document.forms[0].txt_protocolo;	
	if (el.value != '') {
		if (! isInteger(el.value)) {
			innerHtmlMsgErros += formataErro('N&uacute;mero do protocolo inv�lido');
	   }
	}  		
	
	if(innerHtmlMsgErros!=''){
		var texto = innerHtmlMsgErros;
		abreAlerta(texto);
		setaFocoOnLoad();
	} else {
		document.body.style.cursor='wait';
		document.forms[0].submit();
	}
	
        
}

function setAreaErro(msg) {
/*
  var areaErro = document.getElementById('areaErro');
  areaErro.innerHTML = msg ? '<h2 id="erro" tabindex="2">Erro</h2><ul>' + msg + '</ul>' : '';
  areaErro.style.visibility = msg ? 'visible' : 'hidden';
*/  	
  if ( msg ) abreAlerta(msg);
}

// Seta o foco ao carregar a tela
function setaFocoOnLoad(){
	document.getElementById("MsgInicial").focus();
}

</script> 

<body onload="onLoad();">

	<%@ include file="../js/header2.inc.jsp" %>
	<script src="../js/dateKit.js"></script>
	<script src="../js/data.js"></script>

	<div id="content">

  <h1 tabindex="1" id="MsgInicial" >Consulta Acionamento</h1>

  <span id="areaErro" style="visibility:hidden"></span>
  <html:form action="/consultarAndamentoSolucaoSearch" method="get" target="casResults" >
  
	<p Align="LEFT" tabindex="2">
	       Informe os par&acirc;metros para consulta.
	</p>	
	
    <p style="text-align: left" id="cpo" tabindex="1">
			<font class="asterisco">*</font>
			<font class="obrigatorio">
	            Quando o campo "Palavra-Chave/T�tulo" for preenchido, torna-se obrigat�rio informar o "Per&iacute;odo" em um intervalo m�ximo de 30 dias
	       </font>
    </p>	
		
<!-- begin -->

<table cellpadding='2' cellspacing='0' border='0' width='100%'>
    <tr>
        <td>
	        <table cellpadding='2' cellspacing='1' border='0' width='100%'>
		        <tr>
		            <td class='tdHeader3' width='85'>&nbsp;Per&iacute;odo*</td>
	   			    <td class='tdHeader4' height="41">
				        &nbsp;
			    	  <label>De:
			        	<input type="text" tabindex="2" class="text" size="10" title="Data inicial" 
							       name="txt_periodo_i" value="<%= request.getAttribute("txt_periodo_i") %>"   maxlength="10"/>
				      </label>
				      <br>
				      <label> At&eacute;:
				        <input type="text" tabindex="3" class="text" size="10" title="Data final" name="txt_periodo_f"  							        value="<%= request.getAttribute("txt_periodo_f") %>"  maxlength="10"/>
				      </label>
			    	</td>				
		        </tr>
		    </table>
        </td>

		<td>	    
		<table cellpadding='2' cellspacing='1' border='0' width='100%'>
	        <tr>
	            <td class='tdHeader3' width="85">&nbsp;
	            	<label for=sel_assunto acceskey=a>Assunto:</label>
	            </td>
			    <td class='tdHeader4' height="41">
		          <html:select property="sel_assunto" tabindex="4" styleId="sel_assunto" style="width:125px" >
		            <html:option value="0">Todos</html:option>
		            <html:options collection="cas_assuntos" property="id" labelProperty="descricao"/>    
		          </html:select>
				</td>				
	        </tr>
	    </table>        
		</td>

		<td>        
			<table cellpadding='2' cellspacing='1' border='0'  width='100%'>
	        <tr>
                <td class='tdHeader3' width="85">&nbsp;<label for=sel_tipo_msg acceskey=a>Tipo Mensagem:</label></td>
	   		    <td class='tdHeader4' height="41">			        
		          <html:select property="sel_tipo_mensagem" tabindex="5" styleId="sel_tipo_mensagem" style="width:125px">
		            <html:option value="0">Todos</html:option>
		            <html:options collection="cas_tipos_mensagem" property="id" labelProperty="descricao"/>    
		          </html:select>
			    </td>				
		        </tr>
		    </table>
        </td>		
    </tr>	

    <tr>	
    
	    <td>
			<table cellpadding='2' cellspacing='1' border='0'  width='100%'>
	        <tr>
	            <td class='tdHeader3' width="85">&nbsp;<label for="sel_situacao_mensagem" acceskey=a>Situa��o:</label></td>
	   		    <td class='tdHeader4' height="41">
					<html:select property="sel_situacao_mensagem" tabindex="5" styleId="sel_situacao_mensagem" style="width:125px">
		            <html:option value="0">Todas</html:option>
		            <html:options collection="cas_situacao_mensagem" property="id" labelProperty="descricao"/>    
		          </html:select>					
			    </td>				
	        </tr>
			</table>
        </td>
        
        <td>
			<table cellpadding='2' cellspacing='1' border='0'  width='100%'>
	        <tr>
	            <td class='tdHeader3' width="85">&nbsp;<label for=sel_palavra_chave acceskey=a>Palavra-Chave/ &nbsp;T�tulo da Resposta:</label></td>
	   		    <td class='tdHeader4' height="41">
					<input type="text" name="txt_palavra_chave" value="<%= request.getAttribute("txt_palavra_chave") %>" tabindex="6" class="text" id="txt_palavra_chave" title="Palavra-Chave" size="18" maxlegnth="50"/>
		    	    &nbsp;&nbsp;
			    </td>				
	        </tr>
			</table>
        </td>
        
        <td>            
			<table cellpadding='2' cellspacing='1' border='0'  width='100%'>
	        <tr>
                    <td class='tdHeader3' width="85">&nbsp;<label for=txt_protocolo acceskey=a>Protocolo:</label></td>
		   		    <td class='tdHeader4' height="41">
			          <input type="text" name="txt_protocolo" value="<%= request.getAttribute("txt_protocolo") %>" tabindex="7" class="text" id="txt_protocolo" name="txt_protocolo" title="Protocolo" maxlength="9" />&nbsp;&nbsp;
				    </td>				
	        </tr>
	    </table>
       </td>
    </tr>

	<tr>
		<td colspan='3' align='middle' class='tdHeader1'>
            <label for="consultar andamento de solu��o"> 
		    <input type='button' tabindex="8" value='Buscar' name='buscar' class='button' onClick="javascript:validaForm();"  title='Clique para efetuar a consulta'>
            </label> 
		</td>
	</tr>
</table>
<!-- end -->

<table cellpadding='2' cellspacing='0' border='0'  width='100%'>
<tr>
	<td>
	<iframe src="_blank.htm" title="Resultados da pesquisa" id='casResults' name='casResults' frameborder='0' width='100%' height='0'></iframe>
	</td>
</tr>
<tr>
	<td>
	<iframe src="_blank.htm" title="Detalhes do item selecionado" id="casDetail" name='casDetail' frameborder='0' width='100%' height='0' scrolling="no"></iframe>
	</td>
</tr>
</table>

<!--Rodape-->
<hr>
<p class="voltar"> 
	<a title="voltar para p�gina anterior" href="javascript:history.go(-1)" >voltar</a>
</p>

</html:form>

</div>
</body>
</html>