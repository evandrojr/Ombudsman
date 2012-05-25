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
package br.gov.serpro.ouvidoria.model;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.Iterator;
import java.util.List;
import java.util.TreeSet;

/**
 * Funcionalidade Esta classe representa as funcionalidades do sistema.
 * 
 * @author SERPRO
 * @version $Revision: 1.1.2.3 $, $Date: 2011/10/20 17:07:44 $
 * @version 0.1, Date: 2004/11/19
 */
public class Funcionalidade extends PersistentObject {

	private static final long serialVersionUID = 1L;

	/* Requerido */
    private Long id;

    /* Requerido */
    private String descricao;

    /* Requerido */
    private Timestamp dataCadastramento;

    private Boolean geraHistorico;

    private Boolean itemMenu;

    private Boolean necessarioLogin;

    private Integer ordemItemMenu;

    private String path;

    private String imageWidth;

    private String pathImageHi;

    private String pathImageLo;

    private Funcionalidade itemPai;

    private Collection listaSubItem = new TreeSet();

    /*
     * (non-Javadoc)
     * 
     * @see br.gov.serpro.ouvidoria.model.Identifiable#getId()
     */
    public Long getId() {
        return id;
    }

    /**
     * @param id
     *            O id a ser atribuído.
     */
    public void setId(Long id) {
        this.id = id;
    }

    /**
     * @return Retorna descricao.
     */
    public String getDescricao() {
        return descricao;
    }

    /**
     * @param descricao
     *            descricao a ser atribuido.
     */
    public void setDescricao(String descricao) {
        if (descricao == null || descricao.length() == 0) {
            throw new NullPointerException();
        }
        this.descricao = descricao;
    }

    /**
     * @return Retorna geraHistorico.
     */
    public Boolean getGeraHistorico() {
        return this.geraHistorico;
    }

    /**
     * @param geraHistorico
     *            geraHistorico a ser atribuido.
     */
    public void setGeraHistorico(Boolean geraHistorico) {
        this.geraHistorico = geraHistorico;
    }

    /**
     * @return Retorna itemMenu.
     */
    public Boolean getItemMenu() {
        return this.itemMenu;
    }

    /**
     * @param itemMenu
     *            itemMenu a ser atribuido.
     */
    public void setItemMenu(Boolean itemMenu) {
        this.itemMenu = itemMenu;
    }

    /**
     * @return Retorna dataCadastramento.
     */
    public Timestamp getDataCadastramento() {
        return this.dataCadastramento;
    }

    /**
     * @param dataCadastramento
     *            dataCadastramento a ser atribuido.
     */
    public void setDataCadastramento(Timestamp dataCadastramento) {
        if (dataCadastramento == null) {
            throw new NullPointerException();
        }
        this.dataCadastramento = dataCadastramento;
    }

    /**
     * @return Retorna listaSubItem.
     */
    public Collection getListaSubItem() {
        return this.listaSubItem;
    }

    /**
     * @param listaSubItem
     *            listaSubItem a ser atribuido.
     */
    public void setListaSubItem(Collection listaSubItem) {
        this.listaSubItem = listaSubItem;
    }

    /**
     * @return Retorna path.
     */
    public String getPath() {
        return this.path;
    }

    /**
     * @param path
     *            path a ser atribuido.
     */
    public void setPath(String path) {
        this.path = path;
    }

    /**
     * 
     * @return
     */
    public Funcionalidade getItemPai() {
        return this.itemPai;
    }

    /**
     * 
     * @param itemPai
     */
    public void setItemPai(Funcionalidade itemPai) {
        this.itemPai = itemPai;
    }

    /**
     * @return Retorna ordemItemMenu.
     */
    public Integer getOrdemItemMenu() {
        return this.ordemItemMenu;
    }

    /**
     * @param ordemItemMenu
     *            ordemItemMenu a ser atribuido.
     */
    public void setOrdemItemMenu(Integer ordemItemMenu) {
        this.ordemItemMenu = ordemItemMenu;
    }

    /**
     * @return Retorna necessarioLogin.
     */
    public Boolean getNecessarioLogin() {
        return this.necessarioLogin;
    }

    /**
     * @param necessarioLogin
     *            necessarioLogin a ser atribuido.
     */
    public void setNecessarioLogin(Boolean necessarioLogin) {
        this.necessarioLogin = necessarioLogin;
    }

    public List getListaSubItemMenu(Funcionario funcionario) {
        List listaRetorno = new ArrayList();
        Iterator iter;
        Funcionalidade funcionalidade;

        iter = this.getListaSubItem().iterator();
        while (iter.hasNext()) {
            funcionalidade = (Funcionalidade) iter.next();
            if (funcionalidade.getItemMenu().booleanValue()
                    && funcionario.getListaFuncionalidade().contains(
                            funcionalidade)) {
                listaRetorno.add(funcionalidade);
            }
        }

        class FuncionalidadeComparator implements Comparator {
            public final int compare(Object a, Object b) {
                return (((Funcionalidade) a).getOrdemItemMenu())
                        .compareTo((((Funcionalidade) b).getOrdemItemMenu()));
            } // end compare
        } // end class StringComparator

        Collections.sort(listaRetorno, new FuncionalidadeComparator());

        return listaRetorno;
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
    public void setPathImageHi(String pathImage) {
        this.pathImageHi = pathImage;
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