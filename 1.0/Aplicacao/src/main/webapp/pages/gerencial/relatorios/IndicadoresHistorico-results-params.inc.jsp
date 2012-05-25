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
    <TD class=tdHeader3 width=100><label tabindex="2">Modo de exibi&ccedil;&atilde;o</label></TD>
    <TD class=tdHeader4>
			<span tabindex="2" id='r_modo_exibicao'></span>
		</TD>
	</TR>

  <TR>
    <TD class=tdHeader3 width=100><label tabindex="2">Tipo de Indicador</label></TD>
    <TD class=tdHeader4>
			<span tabindex="2" id='sel_indicador'></span>
		</TD>
	</TR>

  <TR id="row_meio_envio">
    <TD class=tdHeader3 width=100><label tabindex="2">Meio de envio de resposta</label></TD>
    <TD class=tdHeader4>
			<span tabindex="2" id='sel_meio_envio'></span>
		</TD>
	</TR>

  <TR>
    <TD class=tdHeader3 width=100><label tabindex="2">Agrupamento dos Dados</label></TD>
    <TD class=tdHeader4>
			<span tabindex="2" id='sel_agrupamento'></span>
		</TD>
	</TR>

  <TR>
    <TD class=tdHeader3 width=100><label tabindex="2">Per&iacute;odo</label></TD>
    <TD class=tdHeader4><label tabindex="2">De <span id='txt_periodo_i' style='margin-right: 3px'></span> At&eacute; <span id='txt_periodo_f'></span></label></TD>
	</TR>

  <TR>
    <TD class=tdHeader3 width=100><label tabindex="2">Tipo de Gr&aacute;fico</label></TD>
    <TD class=tdHeader4>
			<span tabindex="2" id='sel_tipo_grafico'></span>
		</TD>
	</TR>

  <TR id="row_meta">
    <TD class=tdHeader3 width=100><label tabindex="2">Meta</label></TD>
    <TD class=tdHeader4>
			<span tabindex="2" id='txt_meta'></span> dias
		</TD>
	</TR>

  <TR>
    <TD class=tdHeader3 width=100><label tabindex="2">Sub-&Oacute;rg&atilde;os / Localidades</label></TD>
    <TD class=tdHeader4><span tabindex="2" id='sol'></span></TD>
	</TR>