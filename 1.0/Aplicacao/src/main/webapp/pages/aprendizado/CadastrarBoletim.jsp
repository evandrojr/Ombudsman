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
   -- Módulo:       Aprendizado
   -- 
   -- Descrição:    Geração de Boletins
   -- 
   -- Versão:       1.0
   -- Data:         02/02/2005   
  */
%>

<%@ taglib uri="/tags/struts-logic" prefix="logic" %>
<%@ taglib uri="/tags/struts-bean" prefix="bean"%>
<%@ taglib uri="/tags/struts-html" prefix="html"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html:html lang="pt">

<html lang='pt'>
	<head>
		<html:base />
		<meta http-equiv='Content-Type' content='text/html; charset=iso-8859-1'>
		<title>Redirecionamento</title>
		<link rel="stylesheet"  media="all" href="../<bean:write name="_LAYOUT_" property="esquemaCores"/>/estilo_conteudo.css" type="text/css">
	</head>
	<script language="JavaScript" src="../js/util.js"></script>
	<script type="text/javascript" charset='iso-8859-1'>
		function validaFormulario() {
			var ok = true;
			var innerHtmlMsgErros = '';

			var nome = document.forms[0].nome.value;
			var numero = document.forms[0].numero.value;
			var area = document.forms[0].area.value;
			var telefone = document.forms[0].telefone.value;
			var conteudo = document.forms[0].conteudo.value;
			
	        if (nome == null || nome == "") {
				innerHtmlMsgErros += formataErro('Nome deve ser preenchido');
				ok = false;
	        }
	
            if (numero == null || numero == "" || !isInteger(numero)) {
				innerHtmlMsgErros += formataErro('N&uacute;mero inválido');
				ok = false;
            }
	
	        if (area == null || area == "") {
				innerHtmlMsgErros += formataErro('Área geradora do boletim deve ser preenchida');
				ok = false;
	        }
	
	        if (telefone == null || telefone == "") {
				innerHtmlMsgErros += formataErro('Telefone deve ser preenchido');
				ok = false;
	        }
	
	        if (conteudo == null || conteudo == "") {
				innerHtmlMsgErros += formataErro('Conte&uacute;do deve ser preenchido');
				ok = false;
	        }

			if(ok) {
				return true;
			}

			abreAlerta(innerHtmlMsgErros);
			return false;
		}

		function onLoad() {
			var showCabecalho = '<bean:write name="_BOLETIM_" property="possuiCabecalho"/>';
			var showGrafico   = '<bean:write name="_BOLETIM_" property="possuiGrafico"/>';
			var showDados     = '<bean:write name="_BOLETIM_" property="possuiTabelaDados"/>';
			
			document.forms[0].cabecalho.checked = showCabecalho=='true'?"checked":"";
			document.forms[0].grafico.checked   = showGrafico=='true'?"checked":"";
			document.forms[0].tabela.checked    = showDados=='true'?"checked":"";
		}
		
		<logic:messagesPresent>		
			var innerHtmlMsgErros = '';
			<html:messages id="message" message="false">
				innerHtmlMsgErros += formataErro('<%= message %>');
			</html:messages>
			abreAlerta(innerHtmlMsgErros);
		</logic:messagesPresent>	
		
	</script>
	
	<body onLoad="onLoad();">

	<div id="content">
	<h1 tabindex="1" id="titulo" >CRIAÇÃO DE BOLETINS</h1>
	<hr>
	<table cellpadding='2' cellspacing='1' border='0' width='100%'>
		<form action="../../aprendizado/AtualizarBoletim.do" method="post" onSubmit="return validaFormulario();">
		<input type="hidden" name="action" value="gerar">
		<tr>
			<td class='tdHeader3'><label for="nome">Nome:</label></td>
			<td class='tdHeader4'><input tabindex="2" id="nome" type="text" size="50" maxlength='50' value="<bean:write name="_BOLETIM_" property="nome" scope="session"/>" name="nome" class="text"/></td>				
		</tr>
		<tr>
			<td class='tdHeader3'><label for="numero">N&uacute;mero:</label></td>
			<td class='tdHeader4'><input tabindex="3" id="numero" type='text' size='10' maxlength='6' value="<bean:write name="_BOLETIM_" property="numero" scope="session"/>" name='numero' class='text'></td>					
		</tr>
		<tr>
			<td class='tdHeader3'><label for="area">Área geradora do boletim:</label></td>
			<td class='tdHeader4'><input tabindex="4" id="area" type='text' size='50' maxlength='50' name='area' value="<bean:write name="_BOLETIM_" property="areaGeradora" scope="session"/>" class='text'></td>					
		</tr>
		<tr>
			<td class='tdHeader3'><label for="responsavel">Responsável:</label></td>
			<td class='tdHeader4'>
			<input 	tabindex="5" 
					id="responsavel" 
					type='text' 
					size='50' 
					maxlength='50' 
					name='responsavel' 
					class='text' 
					value="<bean:write name="_FUNCIONARIO_" property="nome" scope="session"/>" 
					readonly='true'>
			</td>					
		</tr>
		<tr>
			<td class='tdHeader3'><label for="telefone">Telefone:</label></td>
			<td class='tdHeader4'><input tabindex="6" id="telefone" type='text' size='15' maxlength='15' value="<bean:write name="_BOLETIM_" property="telefone" scope="session"/>" name='telefone' class='text'></td>					
		</tr>
		<tr>
			<td valign='top' class='tdHeader3'><label for="conteudo">Conte&uacute;do:</label></td>
			<td class='tdHeader4'><textarea  tabindex="7" id="conteudo" name='conteudo' rows='5' cols='60'><bean:write name="_BOLETIM_" property="conteudo" scope="session"/></textarea></td>					
		</tr>
		<tr>
			<td valign='top' class='tdHeader3'>Informações extraidas do relatório:</td>
			<td class='tdHeader4'>
			&nbsp;<input type='checkbox' tabindex="8"  name='cabecalho' checked>Cabeçalho<br>
			&nbsp;<input type='checkbox' tabindex="9"  name='grafico' checked>Gráfico<br>
			&nbsp;<input type='checkbox' tabindex="10" name='tabela' checked>Tabela de Dados
			</td>
		</tr>
		<tr>
			<td class='tdHeader1' align='center' colspan='2'>
				<input type='submit' tabindex="11" class='button' value='Criar Boletim' title='Criar Boletim'>
			</td>
		</tr>
		</form>
	</table>
	<hr>
	<p class="voltar"> 
	<a tabindex="12" title="voltar para página anterior" href="javascript:history.go(-1)" >voltar</a>
	</p>
	</div>
</body>
</html:html>