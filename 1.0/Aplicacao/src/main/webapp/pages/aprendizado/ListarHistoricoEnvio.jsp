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

<%-- Paginação --%>
<%@ taglib uri="/tags/displaytag" prefix="display"%>

<html lang="pt">
	<head>
		<html:base />
		<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
		<link rel="stylesheet" media="all" href="../<bean:write name="_LAYOUT_" property="esquemaCores"/>/estilo_conteudo.css" type="text/css">
		<script src="../js/util.js" type="text/javascript">
        </script>
		<script src="../js/paginacao.js">
        </script>
	</head>

	<script type="text/javascript" charset='iso-8859-1'>
        function link(frame, url) {
        var baseHref = location.protocol + "//" + location.host + location.pathname;
        window.parent.frames[frame].document.location.href= baseHref  + url;		
        }
		
        function onLoad(){
        <logic:notPresent name="zero" scope="request">
            window.parent.document.getElementById("detalhe").style.height = this.document.body.scrollHeight;
            window.parent.document.getElementById("detalheEnvios").style.height = 0;
        </logic:notPresent>	
        <logic:present name="zero" scope="request">
            abreAlertaGeral('Não há histórico', '<li>O boletim selecionado ainda não foi enviado a nenhuma lista de emails.</li>')
            window.parent.document.getElementById("detalhe").style.height = 0;
            window.parent.document.getElementById("detalheEnvios").style.height = 0;
        </logic:present>	
			
        try {
        document.getElementById("imgDetalhe").focus();
        } catch(e) {}
        }
    </script>

	<body style="margin: 0px 0px;" onLoad="onLoad();">

		<table border="0" width="100%" cellpadding="0" cellspacing="0">
			<tr>
				<td align="left">
					<a href="javascript:void(0);" tabindex="1" id="imgDetalhe" title="Detalhe do Boletim"><img src="../<bean:write name="_LAYOUT_" property="esquemaCores"/>/pasta_detalha.gif" name="imgDetalhe" alt='Detalhe do Boletim'></a>
					<table cellpadding='2' cellspacing='1' border='0' width='100%'>
						<table width="100%" name="rsTable" id="rsTable" cellpadding="4" cellspacing="1" border="0">
							<TR>
								<td class="tdHeader3" width="15%">
									<label tabindex="2">
										Nome do Boletim
									</label>
								</td>
								<td class="tdHeader4" width="85%" align="left">
									<label tabindex="2">
										<bean:write name="boletim" property="nome" />
									</label>
								</td>
							</TR>
							<TR>
								<td class="tdHeader3">
									<label tabindex="2">
										Responsável
									</label>
								</td>
								<td class="tdHeader4" align="left">
									<label tabindex="2">
										<bean:write name="boletim" property="funcionario.nome" />
									</label>
								</td>
							</TR>
							<TR>
								<td class="tdHeader3">
									<label tabindex="2">
										Data de criação
									</label>
								</td>
								<td class="tdHeader4" align="left">
									<label tabindex="2">
										<bean:write name="boletim" property="dataCadastramento" format="dd/MM/yyyy HH:mm" />
									</label>
								</td>
							</TR>
						</table>
						</td>
						</tr>
					</table>
					<br>
					<table border="0" width="100%" cellpadding="0" cellspacing="0">
						<tr>
							<td>
								<a href="javascript:void(0);" id="imgLista" title="Lista de Histórico de Boletins"><img src="../<bean:write name="_LAYOUT_" property="esquemaCores"/>/pasta_lista.gif"></A>
							</td>
						</tr>
						<tr>
							<td>
								<%int cont = 0;
			%>
								<display:table cellpadding="2" cellspacing="1" style="width: 100%" name="listar" id="historicoEnvio" pagesize="20" requestURI='../../aprendizado/AtualizarHistoricoEnvio.do?action=listar&idBoletim=<bean:write name="boletim" property="id"/>'>
									<display:setProperty name="paging.banner.placement">bottom</display:setProperty>
				                    <display:setProperty name="paging.banner.no_items_found"><span>&nbsp;</span></display:setProperty>
				                    <display:setProperty name="paging.banner.one_item_found"><span>&nbsp;</span></display:setProperty>
				                    <display:setProperty name="paging.banner.all_items_found"><span>&nbsp;</span></display:setProperty>
				                    <display:setProperty name="paging.banner.some_items_found"><span>&nbsp;</span></display:setProperty>
				                    <display:setProperty name="paging.banner.onepage"><span>&nbsp;</span></display:setProperty>
				                    <display:setProperty name="paging.banner.full"><span> [<a href="{1}"> Primeira </a>/ <a href="{2}"> Anterior </a>] {0} [ <a href="{3}"> Pr&oacute;xima </a>/ <a href="{4}"> &Uacute;ltima </a>]</span></display:setProperty>
				                    <display:setProperty name="paging.banner.first"><span> [<a href="{1}"> Primeira </a>/ <a href="{2}"> Anterior </a>] {0} [ <a href="{3}"> Pr&oacute;xima </a>/ <a href="{4}"> &Uacute;ltima </a>]</span></display:setProperty>
				                    <display:setProperty name="paging.banner.last"><span> [<a href="{1}"> Primeira </a>/ <a href="{2}"> Anterior </a>] {0} [ <a href="{3}"> Pr&oacute;xima </a>/ <a href="{4}"> &Uacute;ltima </a>]</span></display:setProperty>
				                    <display:setProperty name="basic.msg.empty_list"><span> Nenhum registro encontrado </span></display:setProperty>
		                            <%cont++;
			%>
									<display:column headerClass="tdHeader1" style="width: 15%" title="Data de Envio">
										<!-- a target="detalheEnvios" href="../../aprendizado/AtualizarHistoricoEnvio.do?action=exibirDetalhe&function=alterar&id=<bean:write name="historicoEnvio" property="id"/>" -->
										<a href="javascript:void 0;"> <bean:write name="historicoEnvio" property="dataEnvio" format="dd/MM/yyyy HH:mm" /> </a>
									</display:column>

									<display:column headerClass="tdHeader1" style="width: 35%" title="Autor do Envio">
										<a href="javascript:void 0;"> <bean:write name="historicoEnvio" property="funcionario.nome" /> </a>
									</display:column>

									<display:column headerClass="tdHeader1" style="width: 50%" title="Lista de E-mails">
										<a href="javascript:void 0;"> <bean:write name="historicoEnvio" property="listaEmails" /> </a>
									</display:column>

									<display:footer>
										<tr>
											<td id="total" colspan='3' align='right'></td>
										</tr>
									</display:footer>

								</display:table>
								<script type="text/javascript" charset='iso-8859-1'>
                        document.getElementById("total").innerHTML = "<a href='javascript:void(0);'><strong>Total: <%= cont %> registro(s)</strong></a>";	
                        var cont = getRowsCount(document.getElementById("historicoEnvio"));
                        setElementHeight(window.parent.document.getElementById("detalhe"), cont, 22);
                        setElementHeight(window.parent.document.getElementById("detalheEnvios"), 0);

                        setCellBackgroundColor(document.getElementById("historicoEnvio"));
                        setImageSrc();
                    </script>
							</td>
						</tr>
					</table>
	</body>
</html>
