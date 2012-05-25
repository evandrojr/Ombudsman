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

/**
 * 
 * @author SERPRO
 * @version $Revision: 1.1.2.4 $, $Date: 2011/10/21 18:53:46 $
 * @version 0.1, Date: 2005/01/21
 */
 public class ParamBean implements java.io.Serializable {

	private static final long serialVersionUID = 1L;

	private int width = 300;

    private int height = 300;

    private boolean antialias = true;

    private String title = "";

    private String type = "xy";

    private int minVal = -100;

    private int maxVal = 100;

    private String colorColor = "#FFFFFF";

    private String paint = "color";

    private String gradientColor1 = "#FFFFFF";

    private int gradientX1;

    private int gradientX2;

    private String gradientColor2 = "#FFFFFF";

    private int gradientY2;

    private int gradientY1;

    private String textureImage = "";

    private int textureWidth = 50;

    private int textureHeight = 50;

    private boolean cyclic;

    private boolean legend = true;

    private String legendAnchor = "south";

    private String extraTitle;

    private String mimeType = "image/png";

    public int getWidth() {
        return this.width;
    }

    public void setWidth(int width) {
        this.width = width;
    }

    public int getHeight() {
        return this.height;
    }

    public void setHeight(int height) {
        this.height = height;
    }

    public void setAntialias(boolean antialias) {
        this.antialias = antialias;
    }

    public boolean getAntialias() {
        return antialias;
    }

    public String getTitle() {
        return this.title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public int getMinVal() {
        return this.minVal;
    }

    public void setMinVal(int minVal) {
        this.minVal = minVal;
    }

    public int getMaxVal() {
        return this.maxVal;
    }

    public void setMaxVal(int maxVal) {
        this.maxVal = maxVal;
    }

    public String getColorColor() {
        return this.colorColor;
    }

    public void setColorColor(String colorColor) {
        this.colorColor = colorColor;
    }

    public String getPaint() {
        return this.paint;
    }

    public void setPaint(String selectedPaint) {
        this.paint = selectedPaint;
    }

    public boolean isSelectedPaint(String p) {
        return paint.equalsIgnoreCase(p);
    }

    public String getGradientColor1() {
        return this.gradientColor1;
    }

    public void setGradientColor1(String gradientColor1) {
        this.gradientColor1 = gradientColor1;
    }

    public int getGradientX1() {
        return this.gradientX1;
    }

    public void setGradientX1(int gradientX1) {
        this.gradientX1 = gradientX1;
    }

    public int getGradientX2() {
        return this.gradientX2;
    }

    public void setGradientX2(int gradientX2) {
        this.gradientX2 = gradientX2;
    }

    public String getGradientColor2() {
        return this.gradientColor2;
    }

    public void setGradientColor2(String gradientColor2) {
        this.gradientColor2 = gradientColor2;
    }

    public int getGradientY2() {
        return this.gradientY2;
    }

    public void setGradientY2(int gradientY2) {
        this.gradientY2 = gradientY2;
    }

    public int getGradientY1() {
        return this.gradientY1;
    }

    public void setGradientY1(int gradientY1) {
        this.gradientY1 = gradientY1;
    }

    public String getTextureImage() {
        return this.textureImage;
    }

    public void setTextureImage(String textureImage) {
        this.textureImage = textureImage;
    }

    public int getTextureWidth() {
        return this.textureWidth;
    }

    public void setTextureWidth(int textureWidth) {
        this.textureWidth = textureWidth;
    }

    public int getTextureHeight() {
        return this.textureHeight;
    }

    public void setTextureHeight(int textureHeight) {
        this.textureHeight = textureHeight;
    }

    public boolean getCyclic() {
        return this.cyclic;
    }

    public void setCyclic(boolean cyclic) {
        this.cyclic = cyclic;
    }

    public boolean isLegend() {
        return this.legend;
    }

    public void setLegend(boolean legend) {
        this.legend = legend;
    }

    public String getLegendAnchor() {
        return this.legendAnchor;
    }

    public void setLegendAnchor(String legendAnchor) {
        this.legendAnchor = legendAnchor;
    }

    public boolean isLegendAnchorSelected(String anchor) {
        return this.legendAnchor.equalsIgnoreCase(anchor);
    }

    public String getExtraTitle() {
        return (extraTitle == null ? "" : extraTitle);
    }

    public void setExtraTitle(String extraTitle) {
        this.extraTitle = extraTitle;
    }

    public String getMimeType() {
        return mimeType;
    }

    public void setMimeType(String mimeType) {
        this.mimeType = mimeType;
    }

    public final String getType() {
        return this.type;
    }

    public final void setType(String type) {
        this.type = type;
    }

}