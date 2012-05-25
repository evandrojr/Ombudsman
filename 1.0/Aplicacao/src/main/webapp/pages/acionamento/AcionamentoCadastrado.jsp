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
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<%@ taglib uri="/tags/struts-logic" prefix="logic" %>
<%@ taglib uri="/tags/struts-bean" prefix="bean"%>
<%@ taglib uri="/tags/struts-html" prefix="html"%>

<html:html lang="pt">

<head>
	<html:base />
	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
	<meta name="Keywords" content="acessibilidade, guia, serpro, inclus�o, defici�ncia, recomenda��es, necessidade especial, ouvidoria" />
	<link rel="stylesheet"  media="all" href="../<bean:write name="_LAYOUT_" property="esquemaCores"/>/estilo_conteudo.css" type="text/css">
	<title>Mensagem Gravada com Sucesso</title>

	<script language="JavaScript">

	function onLoad(){
		var focusControl = document.all["titulo"];
		focusControl.focus();
	}


	function voltaAcionamento() {
	
		var  acionamentoLink;
	
		// Trata Href
		var basehref = location.href;
		var i = basehref.lastIndexOf('/');
		basehref = basehref.substring(0, i + 1);
	
		window.location = basehref + "EnviarMensagemWeb.do"; 	
	
	}
	
	</script>
</head>

<body onLoad="onLoad();">

<div id="content">
  <h1 id="titulo" tabindex="1">Mensagem Gravada com Sucesso</h1>
	<p></p>
	
	<label tabindex="2">
		<p>

			
			  <logic:notPresent name="nomeAcionador" scope="request">
				  <logic:present name="sexo" scope="request">
					  <logic:equal name="sexo" scope="request" value="M">
						Prezado Cidad�o,
					  </logic:equal>
					  
					  <logic:equal name="sexo" scope="request" value="F">
						Prezada Cidad�,
					  </logic:equal>
						
					  <logic:equal name="sexo" scope="request" value="">
						Prezado Cidad�o,
					  </logic:equal>
				  </logic:present>
				  <logic:notPresent name="sexo" scope="request">	
						Prezado Cidad�o,
				  </logic:notPresent>			  
			  </logic:notPresent>
			  
			  <logic:present name="nomeAcionador" scope="request">
				  <logic:notEqual name="nomeAcionador" scope="request" value="">
				  	<logic:present name="sexo" scope="request">
					  <logic:equal name="sexo" scope="request" value="M">
						Prezado
					  </logic:equal>
					  
					  <logic:equal name="sexo" scope="request" value="F">
						Prezada
					  </logic:equal>
						
					  <logic:equal name="sexo" scope="request" value="">
						Prezado(a)
					  </logic:equal>
					</logic:present>
					  
				    <logic:notPresent name="sexo" scope="request">	
						Prezado(a)
				    </logic:notPresent>			
						&nbsp;<%= request.getAttribute("nomeAcionador") %>,
				  </logic:notEqual>
				  <logic:equal name="nomeAcionador" scope="request" value="">
					  <logic:present name="sexo" scope="request">
						  <logic:equal name="sexo" scope="request" value="M">
							Prezado Cidad�o,
						  </logic:equal>
						  
						  <logic:equal name="sexo" scope="request" value="F">
							Prezada Cidad�,
						  </logic:equal>
							
						  <logic:equal name="sexo" scope="request" value="">
							Prezado(a) Cidad�o(a),
						  </logic:equal>
					  </logic:present>
					  <logic:notPresent name="sexo" scope="request">	
							Prezado Cidad�o,
					  </logic:notPresent>
				  </logic:equal>
			  </logic:present>
			
				<logic:present name="textoRespostaAcionamento" scope="request">
					<p align="left">
					<%= request.getAttribute("textoRespostaAcionamento") %>
					</p>
			  </logic:present>
			  <p align="center">
				  <logic:present name="protocolo" scope="request">
						<b>Protocolo:&nbsp;<%= request.getAttribute("protocolo") %></b>
				  </logic:present>
			  
				  <logic:present name="codigoAcesso" scope="request">
						<br>
						<b>C�digo de Acesso:&nbsp;<%= request.getAttribute("codigoAcesso") %></b>
				  </logic:present>
				</p>  
		</p>
	</label>
	<p></p>
	
	<logic:present name="dataPrevistaResolucaoExterna" scope="request">
		<label tabindex="3">
			<P align=left>O prazo m�ximo para a disponibiliza��o da resposta ser� at&eacute; o dia 
			<b><%=request.getAttribute("dataPrevistaResolucaoExterna")%></b>. 
			</P>	
		</label>	
	</logic:present>
	
	<hr>
  <p class="voltar"> 
	<a title="voltar para p�gina anterior" href="javascript:voltaAcionamento();" >voltar</a>		
  </p>
</div>
</body>
</html:html>
