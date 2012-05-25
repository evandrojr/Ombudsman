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

<%@ taglib uri="/tags/struts-logic" prefix="logic" %>
<%@ taglib uri="/tags/struts-bean" prefix="bean"%>
<%@ taglib uri="/tags/struts-html" prefix="html"%>

<%@page import="br.gov.serpro.ouvidoria.model.TipoAcionador"  %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html   lang="pt-br">

<!--
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN"
 "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
-->

<head>
<html:base />
	
<title>Consulta Mensagens Respondidas</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link rel="stylesheet"  media="all" href="../../<bean:write name="_LAYOUT_" property="esquemaCores"/>/estilo_conteudo.css" type="text/css">
<!-- Estilo para impressao -->
<link rel="stylesheet" type="text/css" media="print" href="../../estilo_print.css">
<script language="JavaScript">
<!--

<!--
function MM_reloadPage(init) {  //reloads the window if Nav4 resized
  if (init==true) with (navigator) {if ((appName=="Netscape")&&(parseInt(appVersion)==4)) {
    document.MM_pgW=innerWidth; document.MM_pgH=innerHeight; onresize=MM_reloadPage; }}
  else if (innerWidth!=document.MM_pgW || innerHeight!=document.MM_pgH) location.reload();
}
MM_reloadPage(true);
// -->
//-->

</script>
</head>

<!-- Bibliotecas javascript  -->
<script language="JavaScript" src="../../js/util.js"></script>
<script language="JavaScript" src="../../js/data.js"></script>

<script type="text/javascript" charset='iso-8859-1'>
// Tarefas a serem execuadas no carregamento da página
function onLoad() {	 
	if ( (screen.width == 800) && 
	     (screen.height == 600) ) {
	    window.parent.document.getElementById("iFrame2").style.height = this.document.body.scrollHeight - 180;		
	} else {
	    window.parent.document.getElementById("iFrame2").style.height = this.document.body.scrollHeight - 80;		
    }
	
	document.getElementById("imgDetalhe").focus();        
}
</script>

<%  
		// Obtem o perfil do usuario logado 
		br.gov.serpro.ouvidoria.model.Perfil perfil = new br.gov.serpro.ouvidoria.model.Perfil();
 		br.gov.serpro.ouvidoria.model.Funcionario func = (br.gov.serpro.ouvidoria.model.Funcionario) request.getAttribute("funcionario");		
		
		boolean isGestorConteudo = false;
		if ( func.getPerfil().getDescricao().equals(br.gov.serpro.ouvidoria.model.Perfil.GESTOR_CONTEUDO.getDescricao()) ){
			isGestorConteudo = true;
		}
		
		boolean isEspecialista = false;
		if ( func.getPerfil().getDescricao().equals(br.gov.serpro.ouvidoria.model.Perfil.ESPECIALISTA.getDescricao()) ){
			isEspecialista = true;
		}		
		
%>

<body onload="javascript:onLoad();"
	       style="margin: 4px 0px">



	
<form>
	
<div id="content">
	
<table cellpadding="0" cellspacing="0" border="0" align="center" width="100%">
  <tr>
  <td align="left"><img src="../../<bean:write name="_LAYOUT_" property="esquemaCores"/>/pasta_detalha.gif" name="imgDetalhe" id="imgDetalhe" tabindex="1" 
         alt='Mensagem Respondida Escolhida'><table cellpadding='2' cellspacing='1' border='0' width='100%'>
	
    <tr>     
	<% // Caso perfil logado seja Gestor de Conteudo, nao mostrar N° do protocolo  
	  if (!isGestorConteudo) { 
	%>
      <td class="tdHeader3" width="22%" valign="top"><label for="pProtocolo">Protocolo:</label></td>
      <td class="tdHeader4" width="22%" align="left" id="pProtocolo"> 
	      <div  tabindex="2">
	      <bean:write name="acionamento" property="numeroProtocolo" />
		  </div>
      </td>
    <% } %>  
    
      <td class="tdHeader3" width="12%" valign="top"><label for="pFunc">Funcionário:</label></td>
      <td class="tdHeader4" align="left" id="pFunc" width="40%"> 
	      <div  tabindex="3">
	      <bean:write name="acionamento" property="funcionario.nome" />
		  </div>
      </td>
    </tr>
    
	<tr> 
      <td class="tdHeader3" width="22%" valign="top"><label for="DatExt">Data Prevista Resolução Externa:</label></td>
      <td class="tdHeader4" width="22%" align="left" id="DatExt"> 		
	      <div  tabindex="4">
	      <bean:write name="acionamento" property="dataPrevistaResolucaoExterna" format="dd/MM/yyyy" />
		  </div>
	  </td>
      <td class="tdHeader3" width="22%" valign="top"><label for="DatInt">Data Prevista Resolução interna:</label></td>
      <td class="tdHeader4" width="40%" align="left" id="DatInt" > 		
	      <div  tabindex="5">
	      <bean:write name="acionamento" property="dataPrevistaResolucaoInterna" format="dd/MM/yyyy" />
		  </div>
      </td>
    </tr>
    
	<tr> 
      <td class="tdHeader3" width="22%" valign="top"><label for="pMsg">Mensagem:</label></td>
      <td class="tdHeader4" align="left" id="pMsg" colspan=3> 
	      <div  tabindex="6">
	      <bean:write name="acionamento" property="mensagem.textoFormatado" filter="false"/>
		  </div>
      </td>
    </tr>
    
	<tr> 
      <td class="tdHeader3" width="22%" valign="top"><label for="pTipoMsg">Tipo da Mensagem:</label></td>
      <td class="tdHeader4" width="22%" align="left" id="pTipoMsg"> 
	      <div  tabindex="7">
	      <bean:write name="acionamento" property="mensagem.tipoMensagem.descricao"  />
		  </div>
      </td>
      <td class="tdHeader3" width="22%" valign="top"><label for="pAssunto">Assunto da Mensagem:</label></td>
      <td class="tdHeader4" width="40%" align="left" id="pAssunto"> 
	      <div  tabindex="8">
	      <bean:write name="acionamento" property="mensagem.assunto.descricao"  />
		  </div>
      </td>
    </tr>
    
	<tr> 
      <td class="tdHeader3" width="22%" valign="top"><label for="pResp">Resposta:</label></td>
      <td class="tdHeader4" width="22%" align="left" id="pResp"> 
	      <div  tabindex="9">
	      <bean:write name="acionamento" property="respostaAcionamento.titulo"  />
		  </div>
      </td>
      <td class="tdHeader3" width="22%" valign="top"><label for="pDatResp">Data:</label></td>
      <td class="tdHeader4" width="40%" align="left" id="pDatResp">
	      <div  tabindex="10">
	      <bean:write name="acionamento" property="respostaAcionamento.data"  format="dd/MM/yyyy"  />
		  </div>
	  </td>
    </tr>
    
	<tr> 
      <td class="tdHeader3" width="22%" valign="top"><label for="pTexto">Texto da Resposta:</label></td>
      <td class="tdHeader4" align="left" id="pTexto" colspan=3>
	      <div  tabindex="11">
	      <bean:write name="acionamento" property="respostaAcionamento.textoFormatado" filter="false"/>
		  </div>
      </td>
    </tr>
    
	<!--  Exibe o tipo de avaliação da resposta, caso exista -->
	<tr> 
      <td class="tdHeader3" width="22%" valign="top"><label for="pAval">Avaliação:</label></td>
      <td class="tdHeader4" align="left" id="pAval" colspan=3>
	      <logic:present  name="acionamento" property="respostaAcionamento.tipoAvaliacaoResposta" >
			  <div  tabindex="12">
		      <bean:write name="acionamento" property="respostaAcionamento.tipoAvaliacaoResposta.descricao"   />
			  </div>	  
		  </logic:present> 
      </td>
    </tr>
    
	<tr> 
      <td class="tdHeader3" width="22%" valign="top"><label for="pTipoAcionador">Tipo do Acionador:</label></td>
      <td class="tdHeader4" align="left" id="pTipoAcionador" colspan=3>
		  <div  tabindex="13">
		  <bean:write name="acionamento" property="acionador.tipoAcionador.descricao" />
		  </div>
      </td>
    </tr>
	
	<!--  Tipos de Acionador -->
	<%
			String idTipoAcionadorPF     = TipoAcionador.PESSOA_FISICA.getId().toString();
			String idTipoAcionadorPJ     = TipoAcionador.PESSOA_JURIDICA.getId().toString();
			String idTipoAcionadorFunc  = TipoAcionador.FUNCIONARIO.getId().toString();
			String idTipoAcionadorAnon = TipoAcionador.ANONIMO.getId().toString();			
	%>	
	<% // Caso perfil logado seja Gestor de Conteudo, nao mostrar dados pessoais do acionador 
	  if (!isGestorConteudo) { %>	
	<!--  Acionador Passoa Física-->
	<logic:equal  name="acionamento" property="acionador.tipoAcionador.id" 
		                  value="<%=idTipoAcionadorPF %>" >		
		<tr> 
	      <td class="tdHeader3" width="22%" valign="top"><label for="pNomeAcionador">Nome:</label></td>
	      <td class="tdHeader4" align="left" id="pNomeAcionador" colspan=3> 
			  <div  tabindex="14">
			  <logic:present name="acionamento" property="acionador.nome">
	  			  <bean:write name="acionamento" property="acionador.nome" />
			  </logic:present>
			  </div>
		  </td>
	    </tr>
		<tr>
		  <td class="tdHeader3" width="22%" valign="top"><label for="pCpfAcionador">Cpf:</label></td>
	      <td class="tdHeader4" align="left" id="pCpfAcionador" colspan=3> 
			  <div  tabindex="15">
			  <logic:present name="acionamento" property="acionador.cpf">
	  			  <bean:write name="acionamento" property="acionador.cpf" />
			  </logic:present>
			  </div>
	      </td>
	    </tr> 
	</logic:equal>
	<% } %>
	<% // Caso perfil logado seja Gestor de Conteudo, nao mostrar dados pessoais do acionador 
	  if (!isGestorConteudo) { %>
	<!--  Acionador Funcionário -->
	<logic:equal  name="acionamento" property="acionador.tipoAcionador.id" 
		                  value="<%=idTipoAcionadorFunc %>">
		<tr> 
	      <td class="tdHeader3" width="22%" valign="top"><label for="pNomeAcionador">Nome:</label></td>
	      <td class="tdHeader4" align="left" id="pNomeAcionador" colspan=3> 
			  <div  tabindex="14">
			  <logic:present name="acionamento" property="acionador.nome">
	  			  <bean:write name="acionamento" property="acionador.nome" />
			  </logic:present>
			  </div>
		  </td>
	    </tr>
		<tr>
		  <td class="tdHeader3" width="22%" valign="top"><label for="pCpfAcionador">Cpf:</label></td>
	      <td class="tdHeader4" align="left" id="pCpfAcionador" colspan=3> 
			  <div  tabindex="15">
			  <logic:present name="acionamento" property="acionador.cpf">
	  			  <bean:write name="acionamento" property="acionador.cpf" />
			  </logic:present>
			  </div>
	      </td>
	    </tr> 
		<tr> 
	      <td class="tdHeader3" width="22%" valign="top"><label for="pMatAcionador">Matrícula:</label></td>
	      <td class="tdHeader4" width="22%" align="left" id="pMatAcionador"> 
			  <div  tabindex="16">
			  <logic:present name="acionamento" property="acionador.matricula">
	  			  <bean:write name="acionamento" property="acionador.matricula" />
			  </logic:present>
			  </div>		  
	      </td>
	      <td class="tdHeader3" width="22%" valign="top"><label for="pSetorAcionador">Setor:</label></td>
	      <td class="tdHeader4" width="40%" align="left" id="pSetorAcionador"> 
			  <div  tabindex="17">
			  <logic:present name="acionamento" property="acionador.setor">
	  			  <bean:write name="acionamento" property="acionador.setor" />
			  </logic:present>
			  </div>		  
	      </td>
	    </tr>
	</logic:equal>
	<% } %>		 
	<% // Caso perfil logado seja Gestor de Conteudo, nao mostrar dados pessoais do acionador 
	  if (!isGestorConteudo) { %>
		<!--  Acionador Pessoa Jurídica -->
		<logic:equal  name="acionamento" property="acionador.tipoAcionador.id" 
			                  value="<%=idTipoAcionadorPJ %>">
			<tr> 
		      <td class="tdHeader3" width="22%" valign="top"><label for="pRazaoAcionador">Razão Social:</label></td>
		      <td class="tdHeader4" align="left" id="pRazaoAcionador" colspan=3> 
			       <div  tabindex="18">
				  <logic:present name="acionamento" property="acionador.razaoSocial">
				    <bean:write name="acionamento" property="acionador.razaoSocial" />
				  </logic:present>
					</div>
		      </td>
		    </tr>
			<tr>
			  <td class="tdHeader3" width="22%" valign="top"><label for="pCnpjAcionador">Cnpj:</label></td>
		      <td class="tdHeader4" align="left" id="pCnpjAcionador" colspan=3> 
			       <div  tabindex="19">
				  <logic:present name="acionamento" property="acionador.cnpj">
		  			  <bean:write name="acionamento" property="acionador.cnpj" />
				  </logic:present>
			       
					</div>
		      </td>
		    </tr> 	
			<tr> 
		      <td class="tdHeader3" width="22%" valign="top"><label for="pContatoAcionador">Nome para contato:</label></td>
		      <td class="tdHeader4" align="left" id="pContatoAcionador" colspan=3> 
			       <div  tabindex="20">
					  <logic:present name="acionamento" property="acionador.nomeContato">
			  			  <bean:write name="acionamento" property="acionador.nomeContato" />
					  </logic:present>
					</div>
		      </td>
		    </tr>
			<tr>
			  <td class="tdHeader3" width="22%" valign="top"><label for="pCpfContato">Cpf:</label></td>
		      <td class="tdHeader4" align="left" id="pCpfContato" colspan=3> 
			       <div  tabindex="20">
					  <logic:present name="acionamento" property="acionador.cpfAcionador">
			  			  <bean:write name="acionamento" property="acionador.cpfAcionador" />
					  </logic:present>
					</div>
		      </td>
		    </tr> 
		</logic:equal>
	<% } %>	
	
	<tr> 
      <td class="tdHeader3" valign="top" width="22%"><label for="pEscola">Escolaridade:</label> </td>
      <td class="tdHeader4" align="left" id="pEscola" width="22%" >
	       <div  tabindex="21">
			<logic:present name="acionamento" property="acionador.escolaridade">			
				<bean:write name="acionamento" property="acionador.escolaridade.descricao" />
			</logic:present>			
			</div>	  
	  </td>
      <td class="tdHeader3" width="22%" valign="top"><label for="pFaixa">Faixa Etária:</label></td>
      <td class="tdHeader4" width="40%" align="left" id="pFaixa"> 
	       <div  tabindex="22">
			<logic:present name="acionamento" property="acionador.faixaEtaria">			
				<bean:write name="acionamento" property="acionador.faixaEtaria.intervalo" /><!-- &nbsp;anos -->
			</logic:present>			
			</div>	  	  
	  </td>
    </tr>
	
	

<%  // Caso perfil logado seja Gestor de Conteudo, nao mostrar dados pessoais do acionador  
  if (!isGestorConteudo && !isEspecialista) {    
%>
	<!--  Acionador não Anônimos -->	
	<logic:notEqual  name="acionamento" property="acionador.tipoAcionador.id" 
		                  value="<%=idTipoAcionadorAnon %>">
		<tr> 
	      <td class="tdHeader3" valign="top" width="22%"><label for="pTel">Telefone:</label> </td>
	      <td class="tdHeader4" align="left" id="pTel" width="22%" >
		       <div  tabindex="23">
				 <logic:present name="acionamento" property="acionador.codigoPaisTelefone">
						<bean:write name="acionamento" property="acionador.codigoPaisTelefone" />&nbsp;
				 </logic:present> 
				 <logic:present name="acionamento" property="acionador.codigoCidadeTelefone">
						<bean:write name="acionamento" property="acionador.codigoCidadeTelefone" />&nbsp;
				 </logic:present> 
				<bean:write name="acionamento" property="acionador.telefone" />				
				</div>	  	  
		  </td>
	      <td class="tdHeader3" width="22%" valign="top"><label for="pFax">Fax:</label></td>
	      <td class="tdHeader4" width="40%" align="left" id="pFax"> 
		       <div  tabindex="24">
				 <logic:present name="acionamento" property="acionador.codigoPaisFax">
						<bean:write name="acionamento" property="acionador.codigoPaisFax" />&nbsp;
				 </logic:present> 
				 <logic:present name="acionamento" property="acionador.codigoCidadeFax">
						<bean:write name="acionamento" property="acionador.codigoCidadeFax" />&nbsp;
				 </logic:present> 
				<bean:write name="acionamento" property="acionador.fax" />				
				</div>	  	  		  
		  </td>
	    </tr>
	</logic:notEqual>
<% } %>	

	<tr> 
      <td class="tdHeader3" valign="top" width="22%"><label for="pPais">Local de Envio:</label> </td>
      <td class="tdHeader4" align="left" id="pPais" width="22%" >
	       <div  tabindex="25">
			<logic:present name="acionamento" property="acionador.pais">			
				<bean:write name="acionamento" property="acionador.pais.descricao" />
			</logic:present>			
			</div>	  	  
	  </td>
      <td class="tdHeader3" width="22%" valign="top"><label for="pUf">Estado:</label></td>
      <td class="tdHeader4" width="40%" align="left" id="pUf"> 
	       <div  tabindex="26">
			<logic:present name="acionamento" property="acionador.uf">			
				<bean:write name="acionamento" property="acionador.uf.nome" />
			</logic:present>							
			</div>	  	  	  
	  </td>
    </tr>
	
	<tr> 
		<!--  Acionador não Anônimos -->
		<logic:notEqual  name="acionamento" property="acionador.tipoAcionador.id" 
			                  value="<%=idTipoAcionadorAnon %>">      
			  <td class="tdHeader3" valign="top" width="22%"><label for="pEmail">Email:</label> </td>
		      <td class="tdHeader4" align="left" id="pEmail" width="22%" >
			       <div  tabindex="27">
				    <bean:write name="acionamento" property="acionador.email" />
					</div>	  	  	  			  
			  </td>	  
			  <td class="tdHeader3" width="22%" valign="top"><label for="pSexo">Sexo:</label></td>
		      <td class="tdHeader4" width="40%" align="left" id="pSexo"> 	  
			       <div  tabindex="28">
				    <bean:write name="acionamento" property="acionador.sexo" />
					</div>	  	  	  			  			  
			  </td>
		</logic:notEqual>

		<!--  Acionador Anônimos -->		
		<logic:equal  name="acionamento" property="acionador.tipoAcionador.id" 
			                  value="<%=idTipoAcionadorAnon %>">      
			  <td class="tdHeader3" width="22%" valign="top"><label for="pSexo">Sexo:</label></td>
		      <td class="tdHeader4" width="40%" align="left" id="pSexo" colspan="3"> 	  
			       <div  tabindex="28">
				    <bean:write name="acionamento" property="acionador.sexo" />
					</div>	  	  	  			  			  			  
			  </td>
		</logic:equal>
    </tr>

	<!--  Acionador não Anônimos -->
	<logic:notEqual  name="acionamento" property="acionador.tipoAcionador.id" 
		                  value="<%=idTipoAcionadorAnon %>">      
		<tr> 
	      <td class="tdHeader3" valign="top" width="22%"><label for="pMeioResp">Meio de Resposta:</label> </td>
		  <td class="tdHeader4" align="left" id="pMeioResp" colspan=3 >
		       <div  tabindex="29">
				<logic:present name="acionamento" property="acionador.meioEnvioRespostaOrgao">			
					<bean:write name="acionamento" property="acionador.meioEnvioRespostaOrgao.meioEnvioResposta.descricao" />
				</logic:present>			
				</div>	  	  	  			  			  		  
		  </td>
	    </tr>
	</logic:notEqual>
	
  </table>  
  </td>
  </tr>
	
</table>

</div>

</form>

</body>
</html>
