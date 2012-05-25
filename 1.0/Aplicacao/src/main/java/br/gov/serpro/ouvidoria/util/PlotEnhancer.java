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
import java.awt.Font;
import java.io.Serializable;
import java.sql.SQLException;
import java.text.NumberFormat;
import java.util.Map;

import org.jfree.chart.JFreeChart;
import org.jfree.chart.Legend;
import org.jfree.chart.axis.CategoryAxis;
import org.jfree.chart.axis.CategoryLabelPositions;
import org.jfree.chart.axis.NumberAxis;
import org.jfree.chart.labels.CategoryLabelGenerator;
import org.jfree.chart.labels.ItemLabelAnchor;
import org.jfree.chart.labels.ItemLabelPosition;
import org.jfree.chart.labels.PieSectionLabelGenerator;
import org.jfree.chart.labels.StandardPieItemLabelGenerator;
import org.jfree.chart.plot.CategoryPlot;
import org.jfree.chart.plot.PiePlot;
import org.jfree.chart.plot.Plot;
import org.jfree.chart.plot.ValueMarker;
import org.jfree.chart.renderer.category.BarRenderer3D;
import org.jfree.chart.renderer.category.CategoryItemRenderer;
import org.jfree.chart.renderer.category.LineAndShapeRenderer;
import org.jfree.chart.title.TextTitle;
import org.jfree.data.category.CategoryDataset;
import org.jfree.data.general.PieDataset;
import org.jfree.ui.Layer;
import org.jfree.ui.RectangleAnchor;
import org.jfree.ui.TextAnchor;

import br.gov.serpro.ouvidoria.util.freechart.data.EnhancedJDBCPieDataset;
import br.gov.serpro.ouvidoria.util.freechart.data.JDBCFlatCategoryDataset;
import br.gov.serpro.ouvidoria.util.freechart.labels.PercentCategoryLabelGenerator;

import de.laures.cewolf.ChartPostProcessor;

/**
 * 
 * @author SERPRO
 * @version $Revision: 1.1.2.4 $, $Date: 2011/10/21 18:53:46 $
 * @version 0.1, Date: 2005/01/21
 */
public class PlotEnhancer implements ChartPostProcessor, Serializable {

	private static final long serialVersionUID = 1L;

	static final String NO_DATA_FOUND = "*** NENHUM DADO ENCONTRADO ***";

    public static final Color[] COLORS = Strings2Colors(ReportKit
            .getColorList());

    public PlotEnhancer() {
        // DO NOTHING
    }

    public void processChart(Object chart, Map params) {

        JFreeChart jfc = (JFreeChart) chart;
        jfc.setLegend(Legend.createInstance(jfc));
        jfc.getLegend().setAnchor(Legend.SOUTH);

        String subTitle = (String) params.get("local");
        if (subTitle != null) {
            try {
                subTitle = ReportKit.getLocationCaption(subTitle);
            } catch (SQLException e) {
                e.printStackTrace();
            }
            jfc.addSubtitle(new TextTitle(subTitle));
        }

        Plot plot = (jfc.getPlot());
        plot.setNoDataMessage(NO_DATA_FOUND);

        if (plot instanceof PiePlot) {
            enhancePlot((PiePlot) plot, params);
        } else {
            plot = enhancePlot((CategoryPlot) plot, params);
        }

    }


    private void enhancePlot(PiePlot plot, Map params) {

        plot.setForegroundAlpha(0.7f);

        PieDataset dataset = plot.getDataset();

        PieSectionLabelGenerator spilg = null;

        if (dataset instanceof EnhancedJDBCPieDataset) {
            EnhancedJDBCPieDataset ds = (EnhancedJDBCPieDataset) dataset;
            spilg = ds.getLabelGenerator();

            if (spilg == null) {
                spilg = new StandardPieItemLabelGenerator("{0}: {2} [ {1} ]");
                ((StandardPieItemLabelGenerator) spilg).getPercentFormat()
                        .setMinimumFractionDigits(2);
            }

        }

        plot.setLabelGenerator("true".equalsIgnoreCase((String) params
                .get("supressLabels")) ? null : spilg);
        setSectionPaints(COLORS, plot);

    }

    private Plot enhancePlot(CategoryPlot plot, Map params) {

        String txt_meta = (String) params.get("txt_meta");
        Double targetValue = txt_meta == null || txt_meta.length() < 1 ? null
                : new Double(txt_meta);

        CategoryAxis categoryAxis = plot.getDomainAxis();
        categoryAxis.setCategoryMargin(.15d);
        categoryAxis.setCategoryLabelPositions(CategoryLabelPositions.UP_45);

        NumberAxis rangeAxis = (NumberAxis) plot.getRangeAxis();
        rangeAxis.setStandardTickUnits(NumberAxis.createIntegerTickUnits());
        rangeAxis.setUpperMargin(.45d); //.08dpi
        rangeAxis.setLowerMargin(.02d);
        rangeAxis.setLabel(!"ext".equals(params.get("indicador")) ? "%" : "2"
                .equals(params.get("sel_indicador")) ? "Tempo" : "Total");

        if (targetValue != null) {


            double tv = targetValue.doubleValue();
            Double factor = (Double) params.get("factor");

            if (factor != null) {
                tv *= factor.doubleValue();
            }

            if (rangeAxis.getUpperBound() < tv)
                rangeAxis.setUpperBound(tv);

            ValueMarker marker = new ValueMarker(tv);
            marker.setLabel("Meta");
            marker.setLabelFont(new Font("SansSerif", Font.ITALIC, 11));
            marker.setLabelAnchor(RectangleAnchor.LEFT);
            marker.setLabelTextAnchor(TextAnchor.CENTER_LEFT);
            marker.setPaint(new Color(222, 222, 255, 128));
            plot.addRangeMarker(marker, Layer.BACKGROUND);

        }

        CategoryItemRenderer renderer = plot.getRenderer();
        renderer.setItemLabelFont(new Font("SansSerif", Font.BOLD, 8));

        CategoryLabelGenerator clg = null;

        CategoryDataset dataset = plot.getDataset();

        if (dataset instanceof JDBCFlatCategoryDataset) {
            JDBCFlatCategoryDataset ds = (JDBCFlatCategoryDataset) dataset;
            clg = ds.getLabelGenerator();

            if (clg == null) {
                clg = new PercentCategoryLabelGenerator(100d / ds
                        .getGrandTotal());
                PercentCategoryLabelGenerator pclg = (PercentCategoryLabelGenerator) clg;
                pclg.setPercentFormatter(NumberFormat.getNumberInstance());
                pclg.getValueFormatter().setMinimumFractionDigits(2);
                pclg.getValueFormatter().setMaximumFractionDigits(2);
                pclg.setFormatString("   {0}% ({1})");
            }

        }

        renderer.setLabelGenerator("true".equalsIgnoreCase((String) params
                .get("supressLabels")) ? null : clg);
        renderer.setItemLabelsVisible(!"true".equalsIgnoreCase((String) params
                .get("supressLabels")));


        ItemLabelPosition ilb_out = new ItemLabelPosition(
                ItemLabelAnchor.OUTSIDE12, TextAnchor.CENTER_LEFT,
                TextAnchor.CENTER_LEFT, -Math.PI / 2d);
        ItemLabelPosition ilb_line = new ItemLabelPosition(
                ItemLabelAnchor.OUTSIDE12, TextAnchor.CENTER_LEFT,
                TextAnchor.CENTER_LEFT, -Math.PI / 4d);

        renderer.setPositiveItemLabelPosition(ilb_out);
        renderer.setNegativeItemLabelPosition(ilb_out);

        if (renderer instanceof BarRenderer3D) {
            plot.setForegroundAlpha(0.6f);
            BarRenderer3D barRenderer3D = (BarRenderer3D) renderer;
            barRenderer3D.setPositiveItemLabelPositionFallback(ilb_out);
            barRenderer3D.setItemMargin(0.01d);
            barRenderer3D.setMaxBarWidth(.4d);

        } else if (renderer instanceof LineAndShapeRenderer) {
            plot.setForegroundAlpha(0.9f);
            LineAndShapeRenderer lineRenderer = (LineAndShapeRenderer) renderer;
            lineRenderer.setPositiveItemLabelPosition(ilb_line);

        }

        setSeriesPaints(COLORS, renderer);


        return plot;

    }

    public static void setSectionPaints(Color[] colors, PiePlot plot) {
        for (int i = 0; i < colors.length; i++) {
            plot.setSectionPaint(i, colors[i]);
        }

    }

    public static void setSeriesPaints(Color[] colors,
            CategoryItemRenderer renderer) {
        for (int i = 0; i < colors.length; i++) {
            renderer.setSeriesPaint(i, colors[i]);
        }

    }

    public static Color[] Strings2Colors(String[] colors) {
        Color[] result = new Color[colors.length];
        
        String cor ="#000000";
        for (int i = 0; i < colors.length; i++) {
            if(colors[i].equals("")){
            	colors[i]=cor;
            }
        	result[i] = Color.decode(colors[i]);
        }
        return result;

    }

}