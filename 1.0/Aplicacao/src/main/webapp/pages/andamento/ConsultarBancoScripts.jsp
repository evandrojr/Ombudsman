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
   -- Módulo:       Andamento
   -- 
   -- Descrição:    O especialista consulta scripts informando palavras-chave e situação do assunto e seleciona um 
   --								script para ver detalhes.
   -- 
   -- Versão:       1.0
   -- Data:         17/12/2004   
  */
--%>

<%@ taglib uri="/tags/struts-logic" prefix="logic" %>
<%@ taglib uri="/tags/struts-bean" prefix="bean"%>
<%@ taglib uri="/tags/struts-html" prefix="html"%>

<html:html lang="pt">

	<head>
		<html:base />
		<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
		<meta name="Keywords" content="acessibilidade, guia, serpro, inclusão, deficiência, recomendações, necessidade especial, ouvidoria" />
		<link rel="stylesheet"  media="all" href="../<bean:write name="_LAYOUT_" property="esquemaCores"/>/estilo_conteudo.css" type="text/css">
		<link rel="stylesheet" type="text/css" media="print" href="../estilo_print.css">
		
		<title id="titulo">
			Busca de Scripts
		</title>
	
		<!-- Bibliotecas javascript  -->
		<script language="JavaScript" src="../js/util.js"></script>
	
		<script language="JavaScript">
	
			function onLoad(){
				try {
					document.getElementById("MsgInicial").focus();
				} catch (e) {}
			}
			
			function validaForm() {

				var basehref = location.href;
				var i = basehref.lastIndexOf('/');
				basehref = basehref.substring(0, i + 1);	
				var innerHtmlMsgErros = '';
				var ok = true;
				
		        // limpa os iFrames
				window.frames[0].location= basehref + "Vazio.do";
				window.frames[1].location= basehref + "Vazio.do";

				if ((document.forms[0].chkAtivoBanco.checked   == false) &&
				    (document.forms[0].chkInativoBanco.checked == false)){
					innerHtmlMsgErros += formataErro('Informe a situação a ser consultada');
				    ok = false;
			    }
		
				if(ok){
					window.frames[1].location = location.href + "../../../andamento/Vazio.do";
			    	document.forms[0].submit();
				}
				else {
					var texto = innerHtmlMsgErros;
					abreAlerta(texto);
					// window.frames[1].document.forms[0].imgDetalhe.focus();
				}
		   }

		</script>
	</head>

	<body onLoad="onLoad();">

		<div id="content"> 
			<h1 id="MsgInicial" tabindex="1">
				Consultar Banco de Scripts
			</h1>
	
			<p tabindex="2">
				Para consultar um script, informe o Tipo de Assunto e/ou uma palavra-chave
			</p>
	
			<table cellpadding='2' cellspacing='0' border='0' width='100%'>
				<html:form action="/ListarBancoScripts" method="post" target="lstScripts">
				    <tr>
		   	     		<td height="40%">
	
							<table cellpadding="2" cellspacing="1" border="0"  width='100%' height="100%" valign="center">
								<tr>
									<td class="tdHeader3">
										<label for="ptexto" accesskey="T">
											Palavra-Chave:
										</label>
									</td>
									<td class="tdHeader4">
										<input type="text" tabindex="3" size="30" name="txtBusca" class="text" id="ptexto" maxlength="50">
									</td>				

						        </tr>
						    </table>
				        </td>
				        <td height="30%">
			    			<table cellpadding='2' cellspacing='1' border='0' width='100%'  width='100%' height="100%" valign="center">
						        <tr>
				
									<td class="tdHeader3">
										<label for="passunto" accesskey="A">
											Assunto:
										</label>
									</td>
									<td class="tdHeader4">
										<html:select property="txtAssunto" tabindex="4" styleClass="text" styleId="passunto">
											<html:option value="0">Todos</html:option>
											<html:options collection="lstAssuntos" property="id" labelProperty="descricao"/>
										</html:select>
									</td>
	
						        </tr>
						    </table>
				        </td>
				        <td height="30%">
			    			<table cellpadding='2' cellspacing='1' border='0' width='100%'  width='100%' height="100%" valign="center">
						        <tr>
	
									<td class="tdHeader3">
										<label for="psituacao" accesskey="S">
											Situação:
										</label>
									</td>
	
									<td class="tdHeader4">
										<label for="pAtivo"> 
											<input type='checkbox' tabindex="5" size='30' name='chkAtivoBanco' id="pAtivo" value="S" CHECKED>
											Ativo
										</label> 
										<label for="pInativo">
											<input type='checkbox' tabindex="6" size='30' name='chkInativoBanco' id="pInativo" value="S" CHECKED>
											Inativo
										</label>
									</td>

						        </tr>
						    </table>
				        </td>				        
				    </tr>	
				    
					<tr>
						<td colspan='3' align='middle' class='tdHeader1'>
			                <label for="consultar banco de scripts"> 
						    <input type='button' tabindex="7" value='Buscar' name='buscar' class='button' onClick="javascript:validaForm();"  title='Clique para efetuar a consulta'>
			                </label> 
						</td>
					</tr>											
				    
					</html:form>
				</table>

				<!-- IFrames -->
							<table cellpadding="0" cellspacing="0" border="0"  width="100%">
								<tr>
									<td colspan="4">
										<iframe src="_blank.htm" name="lstScripts" id="lstScripts" longdesc="Lista de Scripts" frameborder="0" width="100%" height="0" scrolling="0" marginwidth="0" marginheight="0" frameborder="0">
										</iframe>
									</td>
								</tr>
								<tr>
									<td colspan="4">
										<iframe src="_blank.htm" name="exibeScript" id="exibeScript" longdesc="Script Selecionado" frameborder="0" width="100%" height="0" scrolling="0" marginwidth="0" marginheight="0" frameborder="0">
										</iframe>
									</td>
								</tr>
							</table>
				<!-- Fim dos IFrames -->
							<hr>
							<p class="voltar"> 
								<a title="voltar para página anterior" href="javascript:history.go(-1)" >
									voltar
								</a>
							</p>
			<p></p>
		</div>
	</body>
</html:html>
