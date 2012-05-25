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
	<%@ taglib uri="/tags/struts-logic" prefix="logic"%>

	<% br.gov.serpro.ouvidoria.model.Funcionario funcionarioLogado = (br.gov.serpro.ouvidoria.model.Funcionario) request.getAttribute("object"); %>

	<script language=javascript>

		<!-- //
	
		var MAX_SELECTED_ITEMS = <bean:write name="maximoIndColuna"/>;
		
		function exibeItens(valor){
			itens.style.display='';
		}
		
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
	
		function emptyOptions(optSelect) {
			while (optSelect.length > 0) {
		    	optSelect.options[0] = null;
			}
		}
	 
		function removeOptions(optSelect) {
			optSelect.selectedIndex = -1; 
			emptyOptions(optSelect);
		}
		
		function populaLocalidadeOcorrecia() {
	
			var loc = document.forms[0].elements["localidade"];
			
			try {
				removeOptions( loc );
			} catch(e) {}
			
			var i = document.forms[0].elements["suborgao"].selectedIndex;
			for(j=0; j< subOrgao[i].length; j++ ) {
				loc.options[j] = new Option(subOrgao[i][j].descricao, subOrgao[i][j].id);
			}
		}
	
		var subOrgaoFunc   = new Array();
		var localidadeFunc = new Array();
	
		function populaLocalidadesFunc() {
		
			var instituicaoFunc = this.document.forms[0].instituicaoFunc;
			try {
				removeOptions(instituicaoFunc);
			} catch(e) {}
			
			var k = 0;
			for( i=0; i<localidadeFunc.length; i++ ) {
				for (j=0; j<localidadeFunc[i][1].length; j++) {
					instituicaoFunc.options[k++] = new Option(localidadeFunc[i][1][j].text, localidadeFunc[i][1][j].value);
				}
			}
	
		}
	
		function selecionaLocalidadesFunc() {
			var instituicaoFunc = this.document.forms[0].instituicaoFunc;
			for( i=0; i<instituicaoFunc.length; i++ ) {
				instituicaoFunc.options[i].selected = true;
			}
		}
	
		function adicionaSubOrgao() {
			
			if (localidadeFunc == null || localidadeFunc[0] == null)  {
				localidadeFunc       = new Array();
				localidadeFunc[0]    = new Array(2);
				localidadeFunc[0][0] = new Option("", "");
				localidadeFunc[0][1] = new Array();
			}

			var objLocalidade = this.document.forms[0].localidade;

			var temLocalidade = false;
			for( i=0; i<objLocalidade.length; i++ ) {
				temLocalidade = false;
				if ( objLocalidade[i].selected ) {
					for (j=0; j<localidadeFunc[0][1].length; j++) {
						if ( objLocalidade[i].value == localidadeFunc[0][1][j].value ) {
							temLocalidade = true;
							break;
						}
					}
					if ( !temLocalidade ) {
						localidadeFunc[0][1][(localidadeFunc[0][1].length)] = objLocalidade[i];
					}
				}
			}
			populaLocalidadesFunc();
		}
		
		function moveArray(array, ini) {
			array[ini] = null;
			return array;
		}
		
		function removeSubOrgao() {
	
			var objLocalidade = this.document.forms[0].instituicaoFunc;
	
			for( i = objLocalidade.length - 1; i >= 0; i-- ) {
				if ( objLocalidade[i].selected ) {
					objLocalidade = moveArray(objLocalidade, i );
				}
			}
			
			localidadeFunc       = new Array();
			localidadeFunc[0]    = new Array(2);
			localidadeFunc[0][0] = new Option("", "");
			localidadeFunc[0][1] = new Array();
			
			for( i = 0; i<objLocalidade.length; i++ ) {
				localidadeFunc[0][1][i] = new Option(objLocalidade[i].text, objLocalidade[i].value);
			}
	
			populaLocalidadesFunc();
		}

		// -->
		
	</script>
