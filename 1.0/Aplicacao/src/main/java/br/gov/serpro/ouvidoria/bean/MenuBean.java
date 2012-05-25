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
package br.gov.serpro.ouvidoria.bean;

import java.util.Collection;

/**
 * 
 * @author SERPRO
 * @version 0.1, Date: 2004/12/10
 */
public final class MenuBean implements Comparable {

    private String titulo;

    private String path;

    private String pathImageHi;

    private String pathImageLo;

    private String imageWidth;

    private Integer ordem;

    private Collection subMenu;

    /**
     * Default Constructor
     */
    public MenuBean() {
        // DO NOTHING
    }

    /**
     * Construtor que recebe parâmetros para inicializar as configurações
     * @param titulo
     * @param path
     * @param pathImageHi
     * @param pathImageLo
     * @param imageWidth
     * @param ordem
     */
    public MenuBean(final String titulo, final String path,
            final String pathImageHi, final String pathImageLo,
            final String imageWidth, final Integer ordem) {
        this.titulo = titulo;
        this.path = path;
        this.imageWidth = imageWidth;
        this.pathImageHi = pathImageHi;
        this.pathImageLo = pathImageLo;
        this.ordem = ordem;
    }

    /**
     * @return Retorna path.
     */
    public final String getPath() {
        return this.path;
    }

    /**
     * @param path
     *            path a ser atribuido.
     */
    public final void setPath(String path) {
        this.path = path;
    }

    /**
     * @return Retorna subMenu.
     */
    public final Collection getSubMenu() {
        return this.subMenu;
    }

    /**
     * @param subMenu
     *            subMenu a ser atribuido.
     */
    public final void setSubMenu(Collection subMenu) {
        this.subMenu = subMenu;
    }

    /**
     * @return Retorna titulo.
     */
    public final String getTitulo() {
        return this.titulo;
    }

    /**
     * @param titulo
     *            titulo a ser atribuido.
     */
    public final void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    /**
     * @return Retorna ordem.
     */
    public Integer getOrdem() {
        return this.ordem;
    }

    /**
     * @param ordem
     *            ordem a ser atribuido.
     */
    public void setOrdem(Integer ordem) {
        this.ordem = ordem;
    }

    /*
     * (non-Javadoc)
     * 
     * @see java.util.Comparator#compare(java.lang.Object, java.lang.Object)
     */
    public int compareTo(Object objeto) {

        MenuBean menu = (MenuBean) objeto;

        int comp = 1;
        if (this.getOrdem() != null && menu.getOrdem() != null) {
            comp = this.getOrdem().compareTo(menu.getOrdem());
        }

        return comp;
    }

    /*
     * (non-Javadoc)
     * 
     * @see java.lang.Object#equals(java.lang.Object)
     */
    public boolean equals(Object objeto) {

        MenuBean menu = (MenuBean) objeto;

        if (this.ordem != null && menu.getOrdem() != null) {
            return this.ordem.equals(menu.getOrdem());
        }

        return super.equals(objeto);
    }

    /*
     * (non-Javadoc)
     * 
     * @see java.lang.Object#hashCode()
     */
    public int hashCode() {
        if (this.ordem != null) {
            return this.ordem.hashCode();
        }
        return super.hashCode();
    }

    /**
     * @return Retorna pathImageHi.
     */
    public String getPathImageHi() {
        return pathImageHi;
    }

    /**
     * @param pathImageHi
     *            pathImageHi a ser atribuido.
     */
    public void setPathImageHi(String pathImageHi) {
        this.pathImageHi = pathImageHi;
    }

    /**
     * @return Retorna pathImageLo.
     */
    public String getPathImageLo() {
        return pathImageLo;
    }

    /**
     * @param pathImageLo
     *            pathImageLo a ser atribuido.
     */
    public void setPathImageLo(String pathImageLo) {
        this.pathImageLo = pathImageLo;
    }

    /**
     * @return Retorna imageWidth.
     */
    public String getImageWidth() {
        return imageWidth;
    }

    /**
     * @param imageWidth
     *            imageWidth a ser atribuido.
     */
    public void setImageWidth(String imageWidth) {
        this.imageWidth = imageWidth;
    }
}