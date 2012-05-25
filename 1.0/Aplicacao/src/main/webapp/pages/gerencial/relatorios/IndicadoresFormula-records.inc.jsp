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
<TABLE cellSpacing='1' cellPadding='2' width='100%' border='0'>
  <TBODY>
  <TR>
    <TD class='contentBold' colSpan='5'><div tabindex="5">Dados utilizados:</div></TD>
  </TR>
  <TR>
    <TH class='tdHeader1'><div tabindex="5">Agrupamento</div></TD>
    <logic:equal name="indicadoresFormulaForm" property="r_modo_exibicao" value="d">
    	<TH class='tdHeader1'><div tabindex="5">Localidade</div></TD>
    </logic:equal>
    <TH class='tdHeader1'><div tabindex="5">Total de Acionamentos</div></TD> 
    <TH class='tdHeader1'><div tabindex="5">Quantidade (F&oacute;rmula)</div></TD> 
    <TH class='tdHeader1'><div tabindex="5">Percentual em rela&ccedil;&atilde;o ao total</div></TD>
	</TR>

<logic:iterate id="record" name="recordList">
  <TR>
    <TD align='middle' ><div tabindex="5"><bean:write name="record" property="TIME"/></div></TD>
    <logic:equal name="indicadoresFormulaForm" property="r_modo_exibicao" value="d"><TD align='middle'><div tabindex="5"><bean:write name="record" property="DSC_LOCAL_OCORR"/></div></TD></logic:equal>
    <TD align='middle' width='150'><div tabindex="5"><script type="text/javascript" charset='iso-8859-1'>writeRounded(<bean:write name="record" property="COUNT"/>, 0, 6);</script><bean:write name="record" property="ID"/></div></TD>
    <TD align='middle' width='150'><div tabindex="5"><script type="text/javascript" charset='iso-8859-1'>writeRounded(<bean:write name="record" property="COUNT_IN"/>, 0, 6);</script></div></TD>
    <TD align='middle' width='150'><div tabindex="5"><script type="text/javascript" charset='iso-8859-1'>writeRounded(100.0 * <bean:write name="record" property="COUNT_IN"/>/<bean:write name="record" property="COUNT"/>);</script> %</div></TD>
	</TR>
	<script type="text/javascript" charset='iso-8859-1'>
	adder.add('COUNT', <bean:write name="record" property="COUNT"/>);
	adder.add('COUNT_IN', <bean:write name="record" property="COUNT_IN"/>);
	</script>
</logic:iterate>

  <TR>
    <TD class='tdHeader3' align='middle'<logic:equal name="indicadoresFormulaForm" property="r_modo_exibicao" value="d"> colspan='2'</logic:equal>><div tabindex="5">Total</div></TD>
    <TD class='tdHeader3' align='middle' width='150'><div tabindex="5"><script type="text/javascript" charset='iso-8859-1'>writeRounded(adder.getSum('COUNT'), 0, 6);</script></div></TD>
    <TD class='tdHeader3' align='middle' width='150'><div tabindex="5"><script type="text/javascript" charset='iso-8859-1'>writeRounded(adder.getSum('COUNT_IN'), 0, 6);</script></div></TD>
    <TD class='tdHeader3' align='middle' width='150'><div tabindex="5"><script type="text/javascript" charset='iso-8859-1'>writeRounded(100.0 * adder.getSum('COUNT_IN') / adder.getSum('COUNT'));</script> %</div></TD>
	</TR>
	</TBODY>
</TABLE>