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
    <TD class=tdHeader3 width=100><LABEL tabindex="3" for='txt_nome'>Nome:</LABEL></TD>
    <TD class=tdHeader4>
			<html:text tabindex="3" styleClass="text" styleId="txt_nome" property="txt_nome" size="50" maxlength="80" />
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
    <TD class=tdHeader3 width=100><LABEL title="Tipo de Gr&aacute;fico" tabindex="3" for="sel_tipo_grafico">Tipo de Gr&aacute;fico</LABEL></TD>
    <TD class=tdHeader4>
			<html:select tabindex="3" property="sel_tipo_grafico" styleId="sel_tipo_grafico">
				<html:option value="verticalbar3d">Barra</html:option>
    		<html:option value="line">Linha</html:option>
			</html:select>
		</TD>
	</TR>

  <TR>
    <TD class=tdHeader3 width=100><LABEL tabindex="3" title="Fontes de Dados">Fontes de Dados:</LABEL></TD>
    <TD class=tdHeader4>
			<TABLE cellSpacing='0' cellPadding='0' width='100%' border='0'>
				<TBODY>
        			<TR>
        	  			<TD class='tdHeader4' vAlign='top' colSpan='3'>
			            	<DIV id='texto'>
    	        		  		<LABEL tabindex="3">Escolha no m&aacute;ximo 3 das op&ccedil;&otilde;es dispon&iacute;veis abaixo:</LABEL>
							</DIV>
						</TD>
					</TR>
					<TR>

          	<TD class='tdHeader4' vAlign='top'>
							<LABEL><INPUT tabindex="3" type='checkbox' name='cb_fonte' value='0' />Avalia&ccedil;&atilde;o de resposta</LABEL>
						</TD>

          	<TD class='tdHeader4' vAlign='top'>
							<LABEL><INPUT tabindex="3" type='checkbox' name='cb_fonte' value='1' />Sexo</LABEL>
						</TD>

          	<TD class='tdHeader4' vAlign='top'>
							<LABEL><INPUT tabindex="3" type='checkbox' name='cb_fonte' value='2' />Faixa Et&aacute;ria</LABEL>
						</TD>

					</TR>

					<TR>

          	<TD class='tdHeader4' vAlign='top'>
							<LABEL><INPUT tabindex="3" type='checkbox' name='cb_fonte' value='3' />Escolaridade</LABEL>
						</TD>

          	<TD class='tdHeader4' vAlign='top'>
							<LABEL><INPUT tabindex="3" type='checkbox' name='cb_fonte' value='4' />Tipo de Mensagem</LABEL>
						</TD>

          	<TD class='tdHeader4' vAlign='top'>
							<LABEL><INPUT tabindex="3" type='checkbox' name='cb_fonte' value='5' />Assunto</LABEL>
						</TD>

					</TR>

					<TR>

          	<TD class='tdHeader4' vAlign='top'>
							<LABEL><INPUT tabindex="3" type='checkbox' name='cb_fonte' value='6' />Local de resid&ecirc;ncia</LABEL>
						</TD>

          	<TD class='tdHeader4' vAlign='top'>
							<LABEL><INPUT tabindex="3" type='checkbox' name='cb_fonte' value='7' />Tipo de Usu&aacute;rio</LABEL>
						</TD>

          	<TD class='tdHeader4' vAlign='top'>
							<LABEL><INPUT tabindex="3" type='checkbox' name='cb_fonte' value='8' />Status da Mensagem</LABEL>
						</TD>

					</TR>

					<TR>

          	<TD class='tdHeader4' vAlign='top'>
							<LABEL><INPUT tabindex="3" type='checkbox' name='cb_fonte' value='9' />Pa&iacute;s</LABEL>
						</TD>

          	<TD class='tdHeader4' vAlign='top'>
							<LABEL><INPUT tabindex="3" type='checkbox' name='cb_fonte' value='10' />Meio de Envio da Resposta</LABEL>
						</TD>

          	<TD class='tdHeader4' vAlign='top'>
							<LABEL><INPUT tabindex="3" type='checkbox' name='cb_fonte' value='11' />Meio de Recebimento do Acionamento</LABEL>
						</TD>

					</TR>

				</TBODY>
			</TABLE>		
		</TD>
	</TR>

  <TR>
    <TD class=tdHeader3 width=100><LABEL tabindex="3" title="F&oacute;rmula" for="sel_formula_1">F&oacute;rmula:</LABEL></TD>
    <TD class=tdHeader4> (Total de 
			<select tabindex="3" id="sel_formula_1" name="sel_formula_1"></select> e
			<select tabindex="3" id="sel_formula_2" name="sel_formula_2"></select>	e	
			<select tabindex="3" id="sel_formula_3" name="sel_formula_3"></select> / [Pelo Total de Mensagens] ) * 100
		</TD>
	</TR>

  <TR>
    <TD class=tdHeader3 width=100><LABEL tabindex="3" title="Meta" for="txt_meta">Meta:</LABEL></TD>
    <TD class=tdHeader4>
			<input tabindex="3" type='text' class='text' id='txt_meta' name="txt_meta" size='3' maxlength='3' dataType='integer' /> %
		</TD>
	</TR>