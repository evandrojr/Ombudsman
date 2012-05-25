<%--
 Sistema de Ouvidoria: um canal atrav�s do qual os usu�rios
 podem encaminhar suas reclama��es, elogios e sugest�es.
 
 Copyright (C) 2011 SERPRO
 
 Este programa � software livre; voc� pode redistribu�-lo e/ou
 modific�-lo sob os termos da Licen�a P�blica Geral GNU, conforme
 publicada pela Free Software Foundation; tanto a vers�o 2 da
 Licen�a como (a seu crit�rio) qualquer vers�o mais nova.
 
 Este programa � distribu�do na expectativa de ser �til, mas SEM
 QUALQUER GARANTIA; sem mesmo a garantia impl�cita de
 COMERCIALIZA��O ou de ADEQUA��O A QUALQUER PROP�SITO EM
 PARTICULAR. Consulte a Licen�a P�blica Geral GNU para obter mais
 detalhes.
 
 Voc� deve ter recebido uma c�pia da Licen�a P�blica Geral GNU,
 sob o t�tulo "LICENCA.txt", junto com esse programa. Se n�o,
 acesse o Portal do Software P�blico Brasileiro no endere�o
 http://www.softwarepublico.gov.br/ ou escreva para a Funda��o do
 Software Livre (FSF) Inc., 51 Franklin St, Fifth Floor, Boston,
 MA 02111-1301, USA.
 
 Contatos atrav�s do seguinte endere�o internet:
 http://www.serpro.gov.br/sistemaouvidoria/
--%>
  <TR>
    <TD class=tdHeader3 width=100><LABEL tabindex="3">Modo de exibi&ccedil;&atilde;o:</LABEL></TD>
    <TD class=tdHeader4>
			<LABEL tabindex="3">
			<html:radio tabindex="3" property='r_modo_exibicao' value='c' onclick='modeChanged(this)'/>Consolidado
			<html:radio tabindex="3" property='r_modo_exibicao' value='d' onclick='modeChanged(this)'/>Detalhado
			</LABEL>
		</TD>
	</TR>
	<TR>
	    <TD class=tdHeader3 width=100><LABEL tabindex="3" for='sel_tabela'>Tabela:</LABEL></TD>
	    <TD class=tdHeader4>
			<html:select tabindex="3" property="sel_tabela" styleId="sel_tabela" onchange="tabelaChanged(this)">
			    <html:option value="-1">Selecione</html:option>
			    <html:option value="5">Assunto da Mensagem</html:option>
			    <html:option value="0">Avalia&ccedil;&atilde;o de resposta</html:option>
			    <html:option value="3">Escolaridade</html:option>
			    <html:option value="2">Faixa Et&aacute;ria</html:option>
			    <html:option value="6">Local de resid&ecirc;ncia</html:option>
			    <html:option value="10">Meio de envio da resposta</html:option>
			    <html:option value="11">Meio de recebimento do acionamento</html:option>
			    <html:option value="9">Pa&iacute;ses</html:option>
			    <html:option value="1">Sexo</html:option>
			    <html:option value="8">Status da Mensagem</html:option>
			    <html:option value="4">Tipo da Mensagem</html:option>
			    <html:option value="7">Tipo de Usu&aacute;rio</html:option>
			</html:select>
		</TD>
	</TR>
	<TR>
	    <TD class=tdHeader3 width=100><LABEL tabindex="3" title='Itens' for='sel_itens_tabela'>Itens da tabela:</LABEL></TD>
	    <TD class=tdHeader4>
			<select tabindex="3" name='sel_itens_tabela' id='sel_itens_tabela' multiple=yes size='5' width='500' style="visibility: hidden;">
			</select>
		</TD>
	</TR>

	<TR>
		<TD class=tdHeader3 width=100>
		
			<LABEL tabindex="3" title='Per&iacute;odo' for='periodo'>Per&iacute;odo:</LABEL></TD>
	    <TD class=tdHeader4>
				<LABEL tabindex="3" title='de'>De 
					<html:text tabindex="3" styleClass="text" property="txt_periodo_i" size='10' />
				</LABEL> 
				
				<LABEL tabindex="3" title='At&eacute;'>At&eacute; 
				<html:text tabindex="3" styleClass="text" property="txt_periodo_f" size='10' /></LABEL>
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
	    <TD class=tdHeader3 width=100><LABEL tabindex="3">Seq&uuml;&ecirc;ncias baseadas em:</LABEL></TD>
	    <TD class=tdHeader4>
				<LABEL tabindex="3" title='Tabela'><html:radio tabindex="3" property='r_base_x' value='0'/>Tabela</LABEL>
				<LABEL tabindex="3" title="Sub-&oacute;rg&atilde;o(s)/localidade(s)"><html:radio tabindex="3" property='r_base_x' value='1'/>Sub-&oacute;rg&atilde;o(s) / localidade(s)</LABEL>
		</TD>
	</TR>