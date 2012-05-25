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
<cewolf:chart 	id="serproChart" 
				type='<%= request.getParameter("sel_tipo_grafico") %>' 
				title='<%= params.getTitle() %>' 
				antialias='<%= params.getAntialias() %>' 
				showlegend="false"
				legendanchor='<%= params.getLegendAnchor() %>'>

	<cewolf:colorpaint color='<%= params.getColorColor() %>' />
	<cewolf:data>
		<cewolf:producer id="pieData">
			<cewolf:param name="indicador" value="<%= request.getParameter("indicador") %>" />
			<cewolf:param name="r_modo_exibicao" value="<%= request.getParameter("r_modo_exibicao") %>" />
			<cewolf:param name="sel_indicador" value="<%= request.getParameter("sel_indicador") %>" />
			<cewolf:param name="txt_periodo_i" value="<%= request.getParameter("txt_periodo_i") %>" />
			<cewolf:param name="txt_periodo_f" value="<%= request.getParameter("txt_periodo_f") %>" />
			<cewolf:param name="sel_tipo_grafico" value="<%= request.getParameter("sel_tipo_grafico") %>" />
			<cewolf:param name="sel_ouvidorias" value="<%= request.getParameter("sel_ouvidorias") %>" />
			<cewolf:param name="sel_agrupamento" value="<%= request.getParameter("sel_agrupamento") %>" />
			<cewolf:param name="h_locais" value="<%= request.getParameter("h_locais") %>" />
			<cewolf:param name="col_names" value="<%= request.getParameter("col_names") %>" />
			<cewolf:param name="extra_rows" value="<%= request.getParameter("extra_rows") %>" />
			<cewolf:param name="orgao" value="<%= (br.gov.serpro.ouvidoria.model.Orgao) request.getAttribute("orgao") %>" />
		</cewolf:producer>
	</cewolf:data>

	<cewolf:chartpostprocessor id="myEnhancer">
		<cewolf:param name="title" value="<%= params.getExtraTitle() %>" />
		<cewolf:param name="local" value="<%= (String) pageContext.getAttribute("local") %>" />
		<cewolf:param name="r_base_x" value="<%= request.getParameter("r_base_x") %>" />
		<cewolf:param name="supressLabels" value="<%= "false" %>" />
		<cewolf:param name="indicador" value="<%= request.getParameter("indicador") %>" />
		<cewolf:param name="sel_indicador" value="<%= request.getParameter("sel_indicador") %>" />
	</cewolf:chartpostprocessor>

</cewolf:chart>

<cewolf:imgurl chartid="serproChart" renderer="/cewolf" width="600" height="320" mime="<%= params.getMimeType() %>" var="imgURL" />

