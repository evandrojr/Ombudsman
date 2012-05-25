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
    <TD class=tdHeader3 width=100><LABEL tabindex="4">Modo de exibi&ccedil;&atilde;o:</LABEL></TD>
    <TD class=tdHeader4>
			<LABEL tabindex="4">
			<html:radio tabindex="4" styleId='consolidado' property='r_modo_exibicao' value='c' onclick='modeChanged(this)'/><LABEL for='consolidado'>Consolidado</LABEL>
			<html:radio tabindex="4" styleId='detalhado' property='r_modo_exibicao' value='d' onclick='modeChanged(this)'/><LABEL for='detalhado'>Detalhado</LABEL>
			</LABEL>
		</TD>
	</TR>

  <TR>
    <TD class=tdHeader3 width=100><LABEL tabindex="4" for='sel_indicador'>Tipo de Indicador:</LABEL></TD>
	    <TD class=tdHeader4>
			<select tabindex="4" name="sel_indicador" id="sel_indicador" onChange="mudaLabel();">
			    <option value="1">Satisfa&ccedil;&atilde;o</option>
			    <option value="2">Tempo de Atendimento</option>
			    <option value="3">Total de Atendimentos</option>
			    <option value="4">Total de Atendimentos no Prazo</option>
			</select>
		</TD>
	</TR>

  <TR>
    <TD class=tdHeader3 width=100><LABEL tabindex="4" title='Per&iacute;odo' for='periodo'>Per&iacute;odo:</LABEL></TD>
    <TD class=tdHeader4>
			<LABEL tabindex="4" title='de' for='txt_periodo_i'>De</LABEL> <html:text tabindex="4" styleClass="text" styleId="txt_periodo_i" property="txt_periodo_i" size='10' onchange="periodoChanged(this)"/>
			<LABEL tabindex="4" title='At&eacute;' for='txt_periodo_f'>At&eacute;</LABEL> <html:text tabindex="4" styleClass="text" styleId="txt_periodo_f" property="txt_periodo_f" size='10' onchange="periodoChanged(this)"/>
		</TD>
	</TR>

  <TR>
    <TD class=tdHeader3 width=100><LABEL tabindex="4" title="Tipo de Gr&aacute;fico" 
      for="sel_tipo_grafico">Tipo de Gr&aacute;fico</LABEL></TD>
    <TD class=tdHeader4>
			<html:select tabindex="4" property="sel_tipo_grafico" styleId="sel_tipo_grafico">
	    		<%-- <html:option value="pie3d">Pizza</html:option> --%>
				<html:option value="verticalbar3d">Barra</html:option>
	    		<html:option value="line">Linha</html:option>
			</html:select>
		</TD>
	</TR>

	<TR>
    	<TD class=tdHeader3 width=100><LABEL tabindex="4" title="N&ordm; de Ouvidorias para Compara&ccedil;&atilde;o de dados" for="sel_ouvidorias">N&ordm; de Ouvidorias para Compara&ccedil;&atilde;o de dados:</LABEL></TD>
	    <TD class=tdHeader4>
			<html:select tabindex="4" property="sel_ouvidorias" styleId="sel_ouvidorias" onchange="updateDynTable(this)">
	    		<html:option value="1">1</html:option>
	    		<html:option value="2">2</html:option>
	    		<html:option value="3">3</html:option>
	    		<html:option value="4">4</html:option>
	    		<html:option value="5">5</html:option>
			</html:select>
		</TD>
	</TR>

	<TR>
    	<TD class=tdHeader3 width=100><LABEL tabindex="4" title="Agrupamento dos Dados" for="sel_agrupamento">Agrupamento dos Dados</LABEL></TD>
	    <TD class=tdHeader4>
			<html:select tabindex="4" property="sel_agrupamento" styleId="sel_agrupamento" onchange="updateDynTable(this)">
	    		<html:option value="d">Di&aacute;rio</html:option>
	    		<html:option value="w">Semanal</html:option>
	    		<html:option value="m">Mensal</html:option>
	    		<html:option value="s">Semestral</html:option>
	    		<html:option value="y">Anual</html:option>
			</html:select>
		</TD>
	</TR>