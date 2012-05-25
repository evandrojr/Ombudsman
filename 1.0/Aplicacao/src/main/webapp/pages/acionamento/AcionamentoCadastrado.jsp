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
						Prezado Cidadão,
					  </logic:equal>
					  
					  <logic:equal name="sexo" scope="request" value="F">
						Prezada Cidadã,
					  </logic:equal>
						
					  <logic:equal name="sexo" scope="request" value="">
						Prezado Cidadão,
					  </logic:equal>
				  </logic:present>
				  <logic:notPresent name="sexo" scope="request">	
						Prezado Cidadão,
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
							Prezado Cidadão,
						  </logic:equal>
						  
						  <logic:equal name="sexo" scope="request" value="F">
							Prezada Cidadã,
						  </logic:equal>
							
						  <logic:equal name="sexo" scope="request" value="">
							Prezado(a) Cidadão(a),
						  </logic:equal>
					  </logic:present>
					  <logic:notPresent name="sexo" scope="request">	
							Prezado Cidadão,
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
						<b>Código de Acesso:&nbsp;<%= request.getAttribute("codigoAcesso") %></b>
				  </logic:present>
				</p>  
		</p>
	</label>
	<p></p>
	
	<logic:present name="dataPrevistaResolucaoExterna" scope="request">
		<label tabindex="3">
			<P align=left>O prazo máximo para a disponibilização da resposta será at&eacute; o dia 
			<b><%=request.getAttribute("dataPrevistaResolucaoExterna")%></b>. 
			</P>	
		</label>	
	</logic:present>
	
	<hr>
  <p class="voltar"> 
	<a title="voltar para página anterior" href="javascript:voltaAcionamento();" >voltar</a>		
  </p>
</div>
</body>
</html:html>
