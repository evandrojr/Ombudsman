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
	
	<TR>
    	<TD class=tdHeader3 width=100><LABEL tabindex="3">Modo de exibi&ccedil;&atilde;o:</LABEL></TD>
    	<TD class=tdHeader4>
			<LABEL tabindex="3">
			<html:radio tabindex="3" styleId='consolidado' property='r_modo_exibicao' value='c' onclick='modeChanged(this)'/><LABEL for='consolidado'>Consolidado</LABEL>
			<html:radio tabindex="3" styleId='detalhado' property='r_modo_exibicao' value='d' onclick='modeChanged(this)'/><LABEL for='detalhado'>Detalhado</LABEL>
			</LABEL>
		</TD>
	</TR>

	<TR>
    	<TD class=tdHeader3 width=100><LABEL tabindex="3" for='sel_indicador'>Tipo de Indicador:</LABEL></TD>
	    <TD class=tdHeader4>
			<html:select tabindex="3" property="sel_indicador" styleId="sel_indicador" onchange="indicadorChanged(this)">
    			<html:option value="1">Total de Respostas Satisfat&oacute;rias</html:option>
		   		<html:option value="2">Tempo M&eacute;dio de Atendimento</html:option>
    			<html:option value="3">Total de Atendimentos</html:option>
			    <html:option value="4">Total de Atendimentos no Prazo</html:option>
			</html:select>
		</TD>
	</TR>

	<TR>
    	<TD class=tdHeader3 width=100>
    		<LABEL tabindex="3" for='sel_meio_envio'>Meio de envio de resposta:</LABEL>
    	</TD>
    	
	    <TD class=tdHeader4>
			<select tabindex="3" multiple size="3" name="sel_meio_envio" id="sel_meio_envio">
			</select>
		</TD>
	</TR>

	<TR>
		<TD class=tdHeader3 width=100><LABEL tabindex="3" title="Agrupamento dos Dados" for="sel_agrupamento">Agrupamento dos Dados</LABEL></TD>
	    <TD class=tdHeader4>
			<html:select tabindex="3" property="sel_agrupamento" styleId="sel_agrupamento">
	    		<html:option value="d">Di&aacute;rio</html:option>
	    		<html:option value="w">Semanal</html:option>
	    		<html:option value="m">Mensal</html:option>
	    		<html:option value="s">Semestral</html:option>
	    		<html:option value="y">Anual</html:option>
			</html:select>
		</TD>
	</TR>

	<TR>
	    <TD class=tdHeader3 width=100><LABEL tabindex="3" title='Per&iacute;odo' for='periodo'>Per&iacute;odo:</LABEL></TD>
	    <TD class=tdHeader4>
			<LABEL tabindex="3" title='de' for='txt_periodo_i'>De</LABEL> <html:text tabindex="3" styleClass="text" styleId="txt_periodo_i" property="txt_periodo_i" size='10' />
			<LABEL tabindex="3" title='At&eacute;' for='txt_periodo_f'>At&eacute;</LABEL> <html:text tabindex="3" styleClass="text" styleId="txt_periodo_f" property="txt_periodo_f" size='10' />
		</TD>
	</TR>

	<TR>
	    <TD class=tdHeader3 width=100><LABEL tabindex="3" title="Tipo de Gr&aacute;fico" for="sel_tipo_grafico">Tipo de Gr&aacute;fico</LABEL></TD>
    	<TD class=tdHeader4>
			<html:select tabindex="3" property="sel_tipo_grafico" styleId="sel_tipo_grafico">
    			<html:option value="pie3d">Pizza</html:option>
				<html:option value="verticalbar3d">Barra</html:option>
    			<html:option value="line">Linha</html:option>
			</html:select>
		</TD>
	</TR>

	<TR>
    	<TD class=tdHeader3 width=100><LABEL tabindex="3" title="Meta" for="txt_meta">Meta:</LABEL></TD>
	    <TD class=tdHeader4>
			<div id='meta_div'><input type='text' class='text' id='txt_meta' name="txt_meta" size='3' maxlength='4' dataType='integer' /> dias</div>
		</TD>
	</TR>
