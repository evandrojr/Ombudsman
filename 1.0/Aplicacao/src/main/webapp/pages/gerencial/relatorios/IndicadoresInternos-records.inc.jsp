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
<%
java.util.List rl = br.gov.serpro.ouvidoria.util.ReportHelperInt.getRecordList(request);
pageContext.setAttribute("recordList", rl);
int lastI = rl.size() - 1;
double factor = ( (Double)rl.get(lastI) ).doubleValue();
rl.remove(lastI);
%>
<TABLE cellSpacing='1' cellPadding='2' width='100%' border='0'>
  <TBODY>
  <TR>
    <TD class='contentBold' colSpan='3'>Dados utilizados:</TD>
  </TR>
  <TR>
    <TH id="tit" class='tdHeader1Left'><div tabindex="6"><%= params.getTitle() %></div></TD> 
    <TH id="qtd" class='tdHeader1'><div tabindex="6">Quantidade</div></TD> 
    <TH id="per" class='tdHeader1'><div tabindex="6">Percentual</div></TD>
  </TR>

<logic:iterate id="record" name="recordList">
  <TR>
    <TD headers="tit" width='70%'><div tabindex="6"><bean:write name="record" property="ID"/> <bean:write name="record" property="DSC_LOCAL_OCORR"/></div></TD>
    <TD headers="qtd" align='middle' width='15%'><div tabindex="6"><bean:write name="record" property="COUNT"/></div></TD>
    <TD headers="per" align='middle' width='15%'><div tabindex="6"><script type="text/javascript" charset='iso-8859-1'>writeRounded(<%= ((Number)(((java.util.Map)pageContext.getAttribute("record")).get("COUNT"))).doubleValue() * factor %>);</script> %</div></TD>
  </TR>
  <script type="text/javascript" charset='iso-8859-1'>adder.add('COUNT',<bean:write name="record" property="COUNT"/>);</script>
</logic:iterate>

  <TR>
    <TD width='70%' class='tdHeader3'><div tabindex="6">TOTAL</div></TD>
    <TD class='tdHeader3' headers="qtd" align='middle' width='15%'><div tabindex="6"><script type="text/javascript" charset='iso-8859-1'>adder.writeSum('COUNT');</script></div></TD>
    <TD class='tdHeader3' headers="per" align='middle' width='15%'><div tabindex="6">100 %</div></TD>
  </TR>
  </TBODY>
</TABLE>