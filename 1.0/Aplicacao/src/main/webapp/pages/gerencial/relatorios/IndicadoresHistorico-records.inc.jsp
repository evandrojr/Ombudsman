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
<%
java.util.List rl = br.gov.serpro.ouvidoria.util.ReportHelperHist.getRecordList(request);
pageContext.setAttribute("recordList", rl);
int lastI = rl.size() - 1;
double factor = ( (Double)rl.get(lastI) ).doubleValue();
rl.remove(lastI);
%>

<TABLE cellSpacing='1' cellPadding='2' width='100%' border='0'>
  <TBODY>
  <TR>
    <TD class='contentBold' colSpan='4'><div tabindex="6">Dados utilizados:</div></TD>
	</TR>
  <TR>
    <TH class='tdHeader1'><div tabindex="6">Agrupamento</TD> 
    <logic:equal name="indicadoresHistoricoForm" property="r_modo_exibicao" value="d"><TH class='tdHeader1'><div tabindex="6">Localidade</div></TD></logic:equal>
    <TH class='tdHeader1'><div tabindex="6">Quantidade</div></TD> 
    <TH class='tdHeader1'><div tabindex="6">Percentual</div></TD>
	</TR>

<logic:iterate id="record" name="recordList">
  <TR>
    <TD width='100'><div tabindex="6"><bean:write name="record" property="TIME"/></div></TD>
    <logic:equal name="indicadoresHistoricoForm" property="r_modo_exibicao" value="d"><TD width='100%'><div tabindex="6"><bean:write name="record" property="DSC_LOCAL_OCORR"/></div></TD></logic:equal>
    <TD align='middle' width='50'><div tabindex="6"><bean:write name="record" property="COUNT"/></div></TD>
    <TD align='middle' width='50'><div tabindex="6"><script type="text/javascript" charset='iso-8859-1'>writeRounded(<%= ((Number)(((java.util.Map)pageContext.getAttribute("record")).get("COUNT"))).doubleValue() * factor %>);</script> %</div></TD>
  </TR>
	<script type="text/javascript" charset='iso-8859-1'>
	adder.add('COUNT', <bean:write name="record" property="COUNT"/>);
	</script>
</logic:iterate>

  <TR>
    <TD class='tdHeader3' width='100%' <logic:equal name="indicadoresHistoricoForm" property="r_modo_exibicao" value="d"> colspan='2'</logic:equal>><div tabindex="6">Total</div></TD>
    <TD class='tdHeader3' align='middle' width='50'><div tabindex="6"><script type="text/javascript" charset='iso-8859-1'>writeRounded(adder.getSum('COUNT'), 0, 6);</script></div></TD>
    <TD class='tdHeader3' align='middle' width='50'><div tabindex="6"><script type="text/javascript" charset='iso-8859-1'>writeRounded(100);</script> %</div></TD>
  </TR>
	</TBODY>
</TABLE>