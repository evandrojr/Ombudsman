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

<%@ taglib uri="/tags/struts-logic" prefix="logic"%>
<%@ taglib uri="/tags/struts-bean" prefix="bean"%>
<%@ taglib uri="/tags/struts-html" prefix="html"%>

<%br.gov.serpro.ouvidoria.model.Funcionario funcionarioLogado = (br.gov.serpro.ouvidoria.model.Funcionario) request
					.getAttribute("funcionario");%>

<html lang="pt">
	<head>
		<title>Atualizar Cadastro</title>
		<html:base />
		<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
		<link rel="stylesheet" media="all" href="../../<bean:write name="_LAYOUT_" property="esquemaCores"/>/estilo_conteudo.css" type="text/css">

		<script language="JavaScript" src="../../js/util.js"></script>
		<script language="JavaScript">
		<!-- //
		
		function LocalidadeOcorrencia(id, descricao) {
			this.id = id;
			this.descricao = descricao;
		}

		var subOrgao = new Array();
		<logic:present name="listarInstituicao">
		<logic:iterate name="listarInstituicao" id="subOrgao" type="br.gov.serpro.ouvidoria.model.SubOrgao" indexId="i">
		subOrgao[<%=i%>] = new Array();
		<% int j = 0; %>
		<logic:iterate name="subOrgao" property="listaLocalidadeOcorrencia" id="localidade" type="br.gov.serpro.ouvidoria.model.LocalidadeOcorrencia">
		<% 	if ( (funcionarioLogado.getNivelAtuacao() == br.gov.serpro.ouvidoria.model.Funcionario.NA_ORGAO) || ( funcionarioLogado.getListaLocalidadeOcorrencia() != null && funcionarioLogado.getListaLocalidadeOcorrencia().contains(localidade) ) ) { %>
				subOrgao[<%=i%>][<%=j++%>] = new LocalidadeOcorrencia('<bean:write name="localidade" property="id"/>', '<bean:write name="localidade" property="descricao"/>' );
		<%  } %>   
		</logic:iterate></logic:iterate>
		</logic:present>

		function removeOptions(optSelect) {
			optSelect.selectedIndex = -1; 
			emptyOptions(optSelect);
		}
		
		function emptyOptions( optSelect ) {
			while (optSelect.length > 0) {
		    	optSelect.options[0] = null;
			}
		}
		
		function populaLocalidadeOcorrecia() {
			removeOptions( document.forms[0].elements["localidade"] );
			
			var i = document.forms[0].elements["suborgao"].selectedIndex;
			for(j=0; j< subOrgao[i].length; j++ ) {
				document.forms[0].elements["localidade"].options[j] = new Option(subOrgao[i][j].descricao, subOrgao[i][j].id);
			}
		}

		function Funcionalidade(text, value) {
			this.text = text;
			this.value = value;
		}
		
		var acessoDefault = new Array();
		
		<logic:iterate name="listarPerfil" id="perfil" type="br.gov.serpro.ouvidoria.model.Perfil" indexId="i">
		acessoDefault[<%=i%>] 	 = new Array(2);
		acessoDefault[<%=i%>][0] = <bean:write name="perfil" property="id"/>;
		acessoDefault[<%=i%>][1] = new Array();
		<logic:iterate name="perfil" property="listaFuncionalidade" id="funcionalidade" type="br.gov.serpro.ouvidoria.model.Funcionalidade" indexId="j">
		acessoDefault[<%=i%>][1][<%=j%>] = new Funcionalidade('<bean:write name="funcionalidade" property="descricao"/>', '<bean:write name="funcionalidade" property="id"/>' );
		</logic:iterate>
		</logic:iterate>

		var acessoFuncionario = new Array();
		<logic:iterate name="object" property="listaFuncionalidade" id="funcionalidade" type="br.gov.serpro.ouvidoria.model.Funcionalidade" indexId="i">
		acessoFuncionario[<%=i%>] = new Funcionalidade('<bean:write name="funcionalidade" property="descricao"/>', '<bean:write name="funcionalidade" property="id"/>' );
		</logic:iterate>
		
		function atualizaAcessosFuncionario() {

			var funcionalidades = this.document.forms[0].funcionalidades;
			for(i=0; i<funcionalidades.length; i++) {
				
				funcionalidades[i].checked = false;
				
				for( j=0; j<acessoFuncionario.length; j++ ) {
					if ( funcionalidades[i].value == acessoFuncionario[j].value ) {
						funcionalidades[i].checked = true;
						break;
					}
				}
			}
		}

		function atualizaAcessos() {
			
			atualizaAcessosFuncionario();

			var perfil    = null;
			var objPerfil = this.document.forms[0].perfil.options[this.document.forms[0].perfil.selectedIndex].value;
			
			for( j=0; j<acessoDefault.length; j++ ) {
				
				if( objPerfil == acessoDefault[j][0] ) {
					perfil = j;
					break;
				}
			}
			
			var funcionalidades = this.document.forms[0].funcionalidades;
			
			for(i=0; i<funcionalidades.length; i++) {
				funcionalidades[i].checked = false;				
			}
			

			for(i=0; i<funcionalidades.length; i++) {

				if ( funcionalidades[i].checked ) continue;
				
				for( j=0; j<acessoDefault[perfil][1].length; j++ ) {
					if ( funcionalidades[i].value == acessoDefault[perfil][1][j].value ) {
						funcionalidades[i].checked = true;
						break;
					}
				}
			}
			
			validaCheckConsultor();
			
			exibeTipos();
		}
		
		function validaCheckConsultor() {
			var objPerfil = this.document.forms[0].perfil.options[this.document.forms[0].perfil.selectedIndex].value;
			if (objPerfil == 1 || objPerfil == 2) {
				this.document.forms[0].consultor.checked = false;
				this.document.forms[0].consultor.disabled = 'disabled';
			} else {
				// ... mas habilita para os demais
				this.document.forms[0].consultor.disabled = false;
			}
		}
		
		var subOrgaoFunc = new Array();
		var localidadeFunc = new Array();

		function populaLocalidadesFunc() {
		
			var instituicaoFunc = this.document.forms[0].instituicaoFunc;
			while(instituicaoFunc.length > 0) {
				instituicaoFunc.options[0] = null;
			}
			
			var k = 0;
			for( i=0; i<localidadeFunc.length; i++ ) {
				instituicaoFunc.options[k++] = new Option(localidadeFunc[i][0].text, "O" + i + "_" + localidadeFunc[i][0].value );
				for (j=0; j<localidadeFunc[i][1].length; j++) {
					instituicaoFunc.options[k++] = new Option("---" + localidadeFunc[i][1][j].text, "L" + i + "|" + j + "_" + localidadeFunc[i][1][j].value );
				}
			}
		}
		
		function selecionaLocalidadesFunc() {
			var instituicaoFunc = this.document.forms[0].instituicaoFunc;
			for( i=0; i<instituicaoFunc.length; i++ ) {
				instituicaoFunc.options[i].selected = true;
			}
		}

		
		<logic:present name="object" property="listaSubOrgaosAtivos">
		<% int i = 0; %>
		<logic:iterate name="object" id="subOrgao" property="listaSubOrgaosAtivos" type="br.gov.serpro.ouvidoria.model.SubOrgao">
		<% 	if ((funcionarioLogado.getNivelAtuacao() == br.gov.serpro.ouvidoria.model.Funcionario.NA_ORGAO) || funcionarioLogado.getPerfil().equals(br.gov.serpro.ouvidoria.model.Perfil.ADMINISTRADOR) || ( funcionarioLogado.getListaInstituicao() != null && funcionarioLogado.getListaInstituicao().contains(subOrgao) ) ) { %>
				localidadeFunc[<%=i%>]    = new Array(2);
				localidadeFunc[<%=i%>][0] = new Option( '<bean:write name="subOrgao" property="descricao"/>','<bean:write name="subOrgao" property="id"/>');
				localidadeFunc[<%=i%>][1] = new Array();
				<% int j = 0; %>
				<logic:iterate name="object" property="listaLocalidadeOcorrencia" id="localidades" type="br.gov.serpro.ouvidoria.model.LocalidadeOcorrencia">
				<% if (localidades.getSubOrgao().equals(subOrgao) && (funcionarioLogado.getNivelAtuacao() == br.gov.serpro.ouvidoria.model.Funcionario.NA_ORGAO) || funcionarioLogado.getPerfil().equals(br.gov.serpro.ouvidoria.model.Perfil.ADMINISTRADOR) || (funcionarioLogado.getListaLocalidadeOcorrencia() != null && funcionarioLogado.getListaLocalidadeOcorrencia().contains(localidades) ) ) { %>
					localidadeFunc[<%=i%>][1][<%=j++%>] = new Option('<bean:write name="localidades" property="descricao"/>', '<bean:write name="localidades" property="id"/>' );
				<% } %>
				</logic:iterate>
		<% 
				i++;
			}
		%>
		</logic:iterate>
		</logic:present>

		function adicionaSubOrgao() {

			var objSubOrgao = this.document.forms[0].suborgao.options[this.document.forms[0].suborgao.selectedIndex];
			var objLocalidade = this.document.forms[0].localidade;
			
			var temSubOrgao = false;
			for( i=0; i<subOrgaoFunc.length; i++ ) {
				if ( subOrgaoFunc[i].value == objSubOrgao.value ) {
					temSubOrgao = true;
					break;
				}
			}
			
			if ( !temSubOrgao ) {
				subOrgaoFunc[subOrgaoFunc.length] = objSubOrgao;
			}

			
			temSubOrgao = false;
			var subOrgaoIndex = 0;
			for( subOrgaoIndex=0; subOrgaoIndex <localidadeFunc.length; subOrgaoIndex++ ) {
				if ( localidadeFunc[subOrgaoIndex][0].value == objSubOrgao.value ) {
					temSubOrgao = true;		
					break;
				}
			}

			if ( !temSubOrgao ) {
				localidadeFunc[subOrgaoIndex] = new Array(2);
				localidadeFunc[subOrgaoIndex][0] = objSubOrgao;
				localidadeFunc[subOrgaoIndex][1] = new Array();
			}
			
			var temLocalidade = false;
			for( i=0; i<objLocalidade.length; i++ ) {
				
				temLocalidade = false;
				if ( objLocalidade[i].selected ) {

					for (j=0; j<localidadeFunc[subOrgaoIndex][1].length; j++) {
						if ( objLocalidade[i].value == localidadeFunc[subOrgaoIndex][1][j].value ) {
							temLocalidade = true;
							break;
						}
					}
					
					if ( !temLocalidade ) {
						localidadeFunc[subOrgaoIndex][1][(localidadeFunc[subOrgaoIndex][1].length)] = objLocalidade[i];
					}
					
				}
			}

			populaLocalidadesFunc();

		}
		
		function moveArray(array, ini) {
			if( array[ini].value.indexOf("O") == 0 ) {
				do {
					array[ini] = null;
				} while ( array[ini] != null && array[ini].value.indexOf("O") );
			} else {
				array[ini] = null;
			}
			return array;
		}
		
		function removeSubOrgao() {

			var objLocalidade = this.document.forms[0].instituicaoFunc;

			for( i = objLocalidade.length - 1; i >= 0; i-- ) {
				if ( objLocalidade[i].selected ) {
					objLocalidade = moveArray(objLocalidade, i );
				}
			}
			
			localidadeFunc = new Array();
			var k = -1;
			var j = 0;
			for( i = 0; i<objLocalidade.length; i++ ) {
				if ( objLocalidade[i].value.indexOf("O") == 0 ) {
					k++;
					localidadeFunc[k] = new Array(2);
					localidadeFunc[k][0] = new Option(objLocalidade[i].text, objLocalidade[i].value.substring(objLocalidade[i].value.indexOf("_") + 1));
					localidadeFunc[k][1] = new Array();
					j = 0;
				} else {
					localidadeFunc[k][1][j++] = new Option(objLocalidade[i].text.substr(3), objLocalidade[i].value.substring(objLocalidade[i].value.indexOf("_") + 1));
				}
			}

			populaLocalidadesFunc();
		
		}


		function exibeOrgao() {
			var display = true;
			
			if(document.forms[0].nivel[0]) {
				display = document.forms[0].nivel[1].checked;
			}

		    if(display) {
		        document.getElementById("niveis").style.display='';
		    } else {
		        document.getElementById("niveis").style.display='none';
 		    }
 		    
			window.parent.document.getElementById("detalhe").style.height = this.document.body.scrollHeight;
			document.forms[0].elements['suborgao'].selectedIndex = -1;
		}

		function exibeTipos() {
			var funcionalidades = document.forms[0].funcionalidades;
        	if (funcionalidades[funcionalidades.length - 1].checked) {
		        document.getElementById("tipos").style.display='';
		    } else {
		        document.getElementById("tipos").style.display='none';
		        document.forms[0].tipoMensagem.selectedIndex = -1;
		        document.forms[0].tipoAssunto.selectedIndex = -1;
		    }
			window.parent.document.getElementById("detalhe").style.height = this.document.body.scrollHeight;
		}

		function validaFormulario() {
		
			var innerHtmlMsgErros = '';

			var id = document.forms[0].id.value;
			var nome = document.forms[0].nome.value;
			var login = document.forms[0].login.value;
			var senha = document.forms[0].senha.value;
			var instituicaoFunc = document.forms[0].instituicaoFunc;
			var perfil = document.forms[0].perfil.value;
			var funcionalidades = document.forms[0].funcionalidades;
			var nivel = document.forms[0].nivel;
			var motivo = document.forms[0].motivo.value;
			var tipoAssunto = document.forms[0].tipoAssunto;
			var tipoMensagem = document.forms[0].tipoMensagem;
			var consultor = document.forms[0].consultor; 
						
            innerHtmlMsgErros += CriticaString( document.forms[0].nome, 10, 60, 'Nome do Usuário ' );

	        if (login == null || login == "" || !validaCPF(login) ) {
				innerHtmlMsgErros += formataErro('CPF inválido, utilize somente n&uacute;meros');
	        } 
	
			if ( id == null || id == "" ) {
	            innerHtmlMsgErros += CriticaString( document.forms[0].elements["senha"], 6, 8, 'Senha' );
			}
				
			
	        if ( nivel[1] == undefined || nivel[1].checked) {
	            if (instituicaoFunc == null || instituicaoFunc.length == 0) {
					innerHtmlMsgErros += formataErro('Selecione ao menos um Sub-Órgão');
	            }
			} 
			else {
	            if ( ( perfil != null && perfil == "5" ) && (motivo == null || motivo == "")) {
					innerHtmlMsgErros += formataErro('Preencha o motivo pelo qual um Especialista tem acesso ao Orgão'); 
				}
	        }
	        
	        if ( perfil != "7" ){
				for( i = 0; i < funcionalidades.length; i++) {									
					if ( (funcionalidades[i].checked) && (funcionalidades[i].value == "40" || funcionalidades[i].value == "41") ) {
						innerHtmlMsgErros += formataErro('As funcionalidades Manter Órgão e Parametros Gerais só podem ser atribuidas ao Perfil Administrador');
						break;
					}			
				}
			}


	        if (funcionalidades == null || funcionalidades.length == 0) {
				innerHtmlMsgErros += formataErro('Selecione as funcionalidades para o Funcionario'); 
	        } 
	        else {
	        	if (
	        		funcionalidades[funcionalidades.length - 1].checked
	        		&& perfil != "2"
	        		&& perfil != "1"
	        		) {
					var tipoAssunto  = tipoAssunto.selectedIndex;
					var tipoMensagem = tipoMensagem.selectedIndex;
					
					if ( -1 > ( tipoAssunto + tipoMensagem ) ) {
						innerHtmlMsgErros += formataErro('Para o Perfil escolhido, deve ser selecionado ao menos um Assunto ou Tipo de Mensagem');
					}
	        	}
	        	else {
					var tipoAssunto  = tipoAssunto.selectedIndex;
					var tipoMensagem = tipoMensagem.selectedIndex;
	        	}
	        }
	
			if( innerHtmlMsgErros == "" ) {
				abreConfirmacao("salvar");
			} else {
				var texto = innerHtmlMsgErros;
				abreAlerta(texto);
			}
		
			setFocusById('cpo');
			
			if (consultor != null && ((perfil == 1 || perfil == 2) && consultor.checked == true)) {
				consultor.checked = false;
				consultor.disabled = 'disabled';
			}
		}
		
	    function salvar() {
			selecionaLocalidadesFunc();
			document.forms[0].submit();
			return true;
		}
		
		
		
		
		function verificaAcionamento(){
			//lanca a caixa avisando que o usuario tem
			//acionamentos atrelados a ele
			<logic:present name="temAcionamento">
				abreAlertaGeral("Mudança de Situação","O usuário possui acionamentos. Esses acionamentos serão redirecionados.");
			</logic:present>
		}

		var error = false;
		<logic:messagesPresent>		
			error = true;
			
			var innerHtmlMsgErros = '';
			<html:messages id="message" message="false">
				innerHtmlMsgErros += formataErro('<%= message %>');
			</html:messages>
			abreAlerta(innerHtmlMsgErros);
		</logic:messagesPresent>	


	    function onLoad() {
	    
	    	validaCheckConsultor();
	    
	    	try {
	    		var userId = document.forms[0].elements['id'].value;
	    		
				populaLocalidadesFunc();
				exibeOrgao();
				exibeTipos();
				if (userId != "" || error == true) {
					atualizaAcessosFuncionario();
				} 
				else {
					atualizaAcessos();
				}
				
				document.forms[0].elements['suborgao'].selectedIndex = -1;
			} catch(e) {}
			try { textCounter(this.document.forms[0].elements['motivo'], this.document.getElementById('contador'), 500); } catch(e) {}

			setFocusById('cpo')
	    }

	    // -->
		</script>

	</head>
	<body onload="onLoad();" style="margin: 0px 0px;">
		<p style="text-align: left" id="cpo" tabindex="1">
			<font class="asterisco">*</font><font class="obrigatorio">campo com preenchimento obrigatório</font>
		</p>
		<html:form method="post" action="AtualizarUsuario.do">
			<input type="hidden" name="action" value="salvar">
			<input type="hidden" name="id" value="<bean:write name="object" property="id"/>">

			<table cellpadding="0" cellspacing="0" border="0" align="center" width="100%">
				<tr>
					<td colspan="4">
						<img accesskey="d" tabindex="1" id="imgDetalhe" src="../../<bean:write name="_LAYOUT_" property="esquemaCores"/>/pasta_detalha.gif" alt="Detalhamento de Usuário">
					</td>
				</tr>
				<tr>
					<td class="tdHeader3" width="100">
						<label for="usuario">
							Nome&nbsp;<font class="asterisco">*</font>
						</label>
					</td>
					<td class="tdHeader4" align="left">
						<html:text styleId="usuario" name="object" tabindex="2" property="nome" size="30" maxlength="60" />
					</td>
					<td class="tdHeader3" width="100">
						<label for="cpf">
							CPF&nbsp;<font class="asterisco">*</font>
						</label>
					</td>
					<td class="tdHeader4" align="left">
						<html:text styleId="cpf" name="object" tabindex="3" property="login" size="11" maxlength="11" />
					</td>
				</tr>
				<tr>
					<td class="tdHeader3" width="100">
						<label for="senha">
							Senha&nbsp;<font class="asterisco">*</font>
						</label>
					</td>
					<td class="tdHeader4" align="left">
						<html:password styleId="senha" name="object" tabindex="4" property="senha" size="8" maxlength="8" redisplay="false" />
					</td>
					<td class="tdHeader3" width="100">
						<label tabindex="5">
							Situação:
						</label>
					</td>
					<td class="tdHeader4" align="left">
						&nbsp;
						<bean:define name="object" property="situacao" id="situacao" />
						<label for="ativo">
							<input 	id="situacao" tabindex="5" <%= situacao.equals("A")?"checked":"" %> 
									type="radio" name="situacao" value="A" id="ativo" onchange="verificaAcionamento();">
							Ativo
						</label>
						<label for="inativo">
							<input 	id="situacao" tabindex="5" <%= situacao.equals("I")?"checked":"" %> 
									type="radio" name="situacao" value="I" id="inativo" onchange="verificaAcionamento();">
							Inativo
						</label>
						<label for="Suspenso">
							<input 	id="situacao" tabindex="5" <%= situacao.equals("S")?"checked":"" %> 
									type="radio" name="situacao" value="S" onchange="verificaAcionamento();">
							Suspenso
						</label>
					</td>
				</tr>
				<tr>
					<td class="tdHeader3" width="100">
						<label for="email" tabindex="6">
							E-mail:
						</label>
					</td>
					<td class="tdHeader4" align="left">
						<html:text styleId="email" name="object" tabindex="6" property="email" size="30" maxlength="60" />
					</td>
					<td class="tdHeader3" width="100">
						
					</td>
					<td class="tdHeader4" align="left">
						
					</td>
				</tr>
				<tr>
					<td colspan="4" height="5"></td>
				</tr>
				<tr>
					<td colspan="4">
						<img accesskey="p" tabindex="7" src="../../<bean:write name="_LAYOUT_" property="esquemaCores"/>/pasta_perfil.gif" alt="Perfil do Usuário">
					</td>

				</tr>
				<tr>
					<td class="tdHeader3" width="100">
						<label for="perfil">
							Perfil de Acesso&nbsp;<font class="asterisco">*</font>
						</label>
					</td>
					<td class="tdHeader4" colspan="3" align="left">
						<select tabindex="7" id="perfil" name="perfil" onChange="atualizaAcessos();">
							<bean:define name="object" property="perfil" id="perfilFuncionario" type="br.gov.serpro.ouvidoria.model.Perfil" />
							<%String selected = "";

			%>
							<logic:iterate name="listarPerfil" id="perfil" type="br.gov.serpro.ouvidoria.model.Perfil">
								<%
								selected = "";
								if (perfilFuncionario != null && perfilFuncionario.equals(perfil)) {
										selected = "selected";
									}
								%>
								<option <%= selected %> value="<bean:write name="perfil" property="id"/>">
									<bean:write name="perfil" property="descricao" />
								</option>
							</logic:iterate>
						</select>
					</td>
				</tr>
				<tr>
					<td class="tdHeader3" width="100" valign="top">
						&nbsp;
					</td>
					<td class="tdHeader4" colspan="3" align="left">
						&nbsp;
					</td>
				
				</tr>

				<tr>
					<td class="tdHeader3" width="100" valign="top">
						<label tabindex="8">
							Consultor?
						</label>
					</td>
					<td class="tdHeader4" colspan="3" align="left">
						<label for="consultor">
							<html:checkbox property='consultor' name='object'/>
							O Perfil acima assumirá o papel de Consultor
						</label>
					</td>
				
				</tr>
				<tr>
					<td class="tdHeader3" width="100" valign="top">
						&nbsp;
					</td>
					<td class="tdHeader4" colspan="3" align="left">
						&nbsp;
					</td>
				
				</tr>
				<tr>
					<td class="tdHeader3" width="100" valign="top">
						<label tabindex="8">
							Funcionalidades&nbsp;<font class="asterisco">*</font>
						</label>
					</td>
					<td class="tdHeader4" colspan="3" align="left">
						<bean:define name="object" property="listaFuncionalidade" id="acesso" type="java.util.Collection" />
						<%String checked;
			String responderMsg = null;

			%>
						<logic:iterate name="listarFuncionalidade" id="func" type="br.gov.serpro.ouvidoria.model.Funcionalidade">
							<%checked = "";
			if (acesso != null && acesso.contains(func)) {
				checked = "checked";
			}

			if (func.getId().equals(new Long(36))) {
				responderMsg = "<input onClick='exibeTipos();' id='funcionalidade' tabindex='7' "
						+ checked
						+ " type='checkbox' name='funcionalidades' value='"
						+ func.getId() + "'>" + func.getDescricao() + "<br>";

				// Caso Perfil logado != Administrador, não estará disponivel as funcionalidades
				// Manter Orgao e Paramentros Gerais
			} else if (!((func.getId().equals(new Long(40)) || func.getId()
					.equals(new Long(41))) && !funcionarioLogado.getPerfil()
					.equals(br.gov.serpro.ouvidoria.model.Perfil.ADMINISTRADOR))) {

				%>
							<input id="funcionalidade" tabindex="8" <%=checked%> type="checkbox" name="funcionalidades" value="<bean:write name="func" property="id"/>">
							<bean:write name="func" property="descricao" />
							<br>
							<%}

			%>
						</logic:iterate>
						<%=responderMsg%>
					</td>
				</tr>
				<tr>
					<td class="tdHeader3" width="100" valign="top"></td>
					<td class="tdHeader4" colspan="3" align="left">

						<table id="tipos" border="0" cellspacing="0" cellpadding="0" align="left" width="100%">
							<tr>
								<td class="tdHeader4" colspan="4">
									&nbsp;
								</td>
							</tr>
							<tr>
								<td class="tdHeader4" valign="top" width="10">
									&nbsp;
								</td>
								<td class="tdHeader4" colspan="3" style="color: #CC0000">
									* Para desmarcar os itens, utilize: <i>Ctrl + Click do Mouse</i> ou <i>Ctrl + Barra de espaço</i>
								</td>
							</tr>
							<tr>
								<td class="tdHeader4" valign="top" width="10">
									&nbsp;
								</td>
								<td class="tdHeader4" valign="top" width="49%">
									<label for="tipoMensagem">
										Tipo de Mensagem
									</label>
								</td>
								<td class="tdHeader4" valign="top" width="10"></td>
								<td class="tdHeader4" valign="top" width="49%">
									<label for="tipoAssunto">
										Tipo de Assunto
									</label>
								</td>
							</tr>
							<tr>
								<td class="tdHeader4">
									&nbsp;
								</td>
								<td class="tdHeader4">
									<select tabindex="9" id="tipoMensagem" name="tipoMensagem" multiple size="5" style="width: 90%;">
										<bean:define name="object" property="listaTipoMensagem" id="funcTpMsg" type="java.util.Collection" />
										<logic:iterate name="listarTipoMesagem" id="tpMsg" type="br.gov.serpro.ouvidoria.model.TipoMensagem">
											<%selected = "";
			if (funcTpMsg != null && funcTpMsg.contains(tpMsg))

			{
				selected = "selected";
			}%>

											<option <%= selected %> value="<bean:write name="tpMsg" property="id"/>">
												<bean:write name="tpMsg" property="descricao" />
												
											</option>
										</logic:iterate>
									</select>
								</td>
								<td class="tdHeader4"></td>
								<td class="tdHeader4">
									<select tabindex="10" id="tipoAssunto" name="tipoAssunto" multiple size="5" style="width: 90%;">
										<bean:define name="object" property="listaAssunto" id="funcAssunto" type="java.util.Collection" />
										<logic:iterate name="listarTipoAssunto" id="tpAssunto" type="br.gov.serpro.ouvidoria.model.Assunto">
											<%selected = "";
			if (funcAssunto != null && funcAssunto.contains(tpAssunto)) {
				selected = "selected";
			}

			%>
											<option <%= selected %> value="<bean:write name="tpAssunto" property="id"/>">
												<bean:write name="tpAssunto" property="descricao" />
											</option>
										</logic:iterate>
									</select>
								</td>
							</tr>
							<tr>
								<td class="tdHeader4" colspan="4">
									&nbsp;
								</td>
							</tr>
						</table>

					</td>
				</tr>
				<tr>
					<td colspan="4" height="5"></td>
				</tr>
				<tr>
					<td colspan="4">
						<img accesskey="n" tabindex="11" src="../../<bean:write name="_LAYOUT_" property="esquemaCores"/>/pasta_niveis.gif" alt="Níveis de Acesso">
					</td>
				</tr>

				<%if (funcionarioLogado.getNivelAtuacao() == br.gov.serpro.ouvidoria.model.Funcionario.NA_ORGAO) {

				%>
				<tr>
					<td class="tdHeader3" width="100"></td>
					<td class="tdHeader4" colspan="3" align="left">
						<%boolean isOrgao = true;

				%>
						<logic:iterate name="object" property="listaInstituicao" id="inst" indexId="index">
							<%if (inst instanceof br.gov.serpro.ouvidoria.model.SubOrgao) {
					isOrgao = !isOrgao;
				}
				if (index.intValue() == 0) {
					break;
				}

				%>
						</logic:iterate>

						<input tabindex="11" <%= (String) ( isOrgao?"checked":"" ) %> type="radio" name="nivel" value="O" onclick="exibeOrgao()" />
						Órgão &nbsp; &nbsp;
						<input tabindex="11" <%= (String) ( isOrgao?"":"checked" ) %> type="radio" name="nivel" value="S" onclick="exibeOrgao()" />
						Sub-órgão

					</td>
				</tr>
				<%} else {

			%>
				<input type="hidden" name="nivel" value="S" />
				<%}

			%>

				<tr>
					<td class="tdHeader3" height="5"></td>
					<td class="tdHeader4" colspan="3" height="5"></td>
				</tr>
				<tr>
					<td class="tdHeader3" width="100"></td>
					<td class="tdHeader4" colspan="3" align="left">
						<span id="niveis" style="DISPLAY: none">
							<table border="0" style=" cellpadding=" cellspacing="0" width="98%" align="center">
								<tr>
									<th id="so" class="tdHeader3" width="25%">
										<strong>Sub-órgão</strong>
									</th>
									<th id="lc" class="tdHeader3" width="25%">
										<strong>Localidade</strong>
									</th>
									<th id="br" class="tdHeader4">
										&nbsp;
									</th>
									<th id="solc" class="tdHeader3" width="50%">
										<strong>Sub-órgão / Localidade&nbsp;<font class="asterisco">*</font></strong>
									</th>
								</tr>
								<tr>
									<td headers="so" class="tdHeader4" height="80">
										<select tabindex="12" style="width: 100%" id="suborgao" name="suborgao" size="8" onChange="populaLocalidadeOcorrecia();">
											<logic:iterate name="listarInstituicao" id="subOrgao" type="br.gov.serpro.ouvidoria.model.SubOrgao">
												<option value="<bean:write name="subOrgao" property="id"/>">
													<bean:write name="subOrgao" property="descricao" />
												</option>
											</logic:iterate>
										</select>
									</td>
									<td headers="lc" class="tdHeader4" height="80">
										<select tabindex="13" style="width: 100%" id="localidade" name="localidade" multiple size="8">
										</select>
									</td>
									<td headers="br" class="tdHeader4" height="80" valign="center">
										<input tabindex="14" type="button" value="Enviar >" style="width: 60px;" class="button" onclick="adicionaSubOrgao();">
										<br>
										<br>
										<input tabindex="15" type="button" value="< Excluir" style="width: 60px;" class="button" onclick="removeSubOrgao();">
									</td>
									<td headers="solc" colspan="3" class="tdHeader4" align="center">
										<select tabindex="16" style="width: 100%;" id="instituicaoFunc" name="instituicaoFunc" multiple size="8">
										</select>
									</td>
								</tr>
							</table> </span>
					</td>
				</tr>
				<tr>
					<td class="tdHeader3" height="5"></td>
					<td class="tdHeader4" colspan="3" height="5"></td>
				</tr>

				<%if (funcionarioLogado.getNivelAtuacao() == br.gov.serpro.ouvidoria.model.Funcionario.NA_ORGAO) {

			%>
				<tr>
					<td class="tdHeader3" width="100">
						<label for="motivo">
							Motivo:
						</label>
					</td>
					<td class="tdHeader4" colspan="3" align="left">

						<textarea 	id="motivo" cols="50" 
									tabindex="17" rows="5" 
									name="motivo" maxlength="100" 
									onKeyUp="textCounter(this, document.getElementById('contador'), 500);"><logic:present name="object" property="motivoNivelAtuacao"><bean:write name="object" property="motivoNivelAtuacao" /></logic:present></textarea>
						<div id="contador">
							500 caracteres restantes
						</div>

					</td>
				</tr>
				<%} else {

			%>
				<input type="hidden" name="motivo" value="" />
				<%}

		%>

				<tr>
					<td class="tdHeader3" height="5"></td>
					<td class="tdHeader4" colspan="3" height="5"></td>
				</tr>
				<tr>
					<td class="tdHeader3" id="maenome" colspan="4">
						<div align="center">
							<input tabindex="18" type="button" name="salvar" value="Salvar" class="button" onclick="validaFormulario();">
						</div>
					</td>
				</tr>
			</table>
		</html:form>
	</body>
</html>
