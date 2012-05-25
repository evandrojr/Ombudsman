/*
 * Sistema de Ouvidoria: um canal através do qual os usuários
 * podem encaminhar suas reclamações, elogios e sugestões.
 * 
 * Copyright (C) 2011 SERPRO
 * 
 * Este programa é software livre; você pode redistribuí-lo e/ou
 * modificá-lo sob os termos da Licença Pública Geral GNU, conforme
 * publicada pela Free Software Foundation; tanto a versão 2 da
 * Licença como (a seu critério) qualquer versão mais nova.
 * 
 * Este programa é distribuído na expectativa de ser útil, mas SEM
 * QUALQUER GARANTIA; sem mesmo a garantia implícita de
 * COMERCIALIZAÇÃO ou de ADEQUAÇÃO A QUALQUER PROPÓSITO EM
 * PARTICULAR. Consulte a Licença Pública Geral GNU para obter mais
 * detalhes.
 * 
 * Você deve ter recebido uma cópia da Licença Pública Geral GNU,
 * sob o título "LICENCA.txt", junto com esse programa. Se não,
 * acesse o Portal do Software Público Brasileiro no endereço
 * http://www.softwarepublico.gov.br/ ou escreva para a Fundação do
 * Software Livre (FSF) Inc., 51 Franklin St, Fifth Floor, Boston,
 * MA 02111-1301, USA.
 * 
 * Contatos através do seguinte endereço internet:
 * http://www.serpro.gov.br/sistemaouvidoria/
 */
package br.gov.serpro.ouvidoria.util;

import java.awt.Color;
import java.io.Serializable;
import java.util.Map;

import org.jfree.chart.JFreeChart;
import org.jfree.chart.labels.StandardPieItemLabelGenerator;
import org.jfree.chart.plot.PiePlot;

import de.laures.cewolf.ChartPostProcessor;

/**
 * 
 * @author SERPRO
 * @version $Revision: 1.1.2.4 $, $Date: 2011/10/21 18:53:46 $
 * @version 0.1, Date: 2005/01/21
 */
public class CategoryEnhancer implements ChartPostProcessor, Serializable {

	private static final long serialVersionUID = 1L;
	public static final Color[] COLORS = Strings2Colors(new String[] {
            "#FFCCCC", "#A04080", "#336600", "#FFFFFF", "#600080", "#E08080",
            "#0060C0", "#9933FF", "#000080", "#FF00FF", "#FFFF00", "#00FFFF",
            "#800080", "#800000", "#008080", "#0000FF", "#3399FF", "#CCFFFF",
            "#C0DCC0", "#E0E080", "#66FF00", "#E0A0C0", "#A6CAF0", "#FF3300",
            "#4060C0", "#40C0C0", "#A0C000", "#E0C000", "#E0A000", "#E06000" });

    /** Creates a new instance of ExtraTitleEnhancer */
    public CategoryEnhancer() {
        // DO NOTHING
    }

    public void processChart(Object chart, Map params) {
        PiePlot plot = (PiePlot) ((JFreeChart) chart).getPlot();

        plot.setBackgroundAlpha(0.7f);
        plot.setLabelGenerator(new StandardPieItemLabelGenerator(
                "{0}: {1} [ {2} ]"));

        setSectionPaints(COLORS, plot);

    }

    public static void setSectionPaints(Color[] colors, PiePlot plot) {
        for (int i = 0; i < colors.length; i++) {
            plot.setSectionPaint(i, colors[i]);
        }

    }

    public static Color[] Strings2Colors(String[] colors) {
        Color[] result = new Color[colors.length];
        for (int i = 0; i < colors.length; i++) {
            result[i] = Color.decode(colors[i]);
        }
        return result;

    }

}