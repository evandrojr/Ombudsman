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

/**
 * LayoutBean
 * 
 * Objetivo: Classe de Personalização do Órgão
 * 
 * @author SERPRO
 * @version $Revision: 1.1.2.4 $, $Date: 2011/10/18 17:40:31 $
 * @version 0.1, Date: 2004/12/13
 */
public class LayoutBean { 

    private String nomeExibicaoOrgao; 

    private String diretorioOrgao;

    private String esquemaCores;

    private String corCabecalhoBanner;

    private String corCabecalhoLogo;

    private String imagemBanner;
    
    private String descricaoImagemBanner;
    
    private String linkImagemBanner;

    private String imagemLogo; 
        
    private String descricaoImagemLogo;
    
    private String linkImagemLogo;

    private String imagem3;
    
    private String descricaoImagem3;
    
    private String linkImagem3;

    private String imagem4;
    
    private String descricaoImagem4;
    
    private String linkImagem4;

    private String imagem5;
    
    private String descricaoImagem5;
    
    private String linkImagem5;

    /**
     * @return Retorna esquemaCores.
     */
    public String getEsquemaCores() {
        return this.esquemaCores;
    }

    /**
     * @param esquemaCores
     *            esquemaCores a ser atribuido.
     */
    public void setEsquemaCores(String esquemaCores) {
        this.esquemaCores = esquemaCores;
    }

    /**
     * @return Retorna imagem3.
     */
    public String getImagem3() {
        return this.imagem3;
    }

    /**
     * @param imagem3
     *            imagem3 a ser atribuido.
     */
    public void setImagem3(String imagem3) {
        this.imagem3 = imagem3;
    }

    /**
     * @return Retorna imagem4.
     */
    public String getImagem4() {
        return this.imagem4;
    }

    /**
     * @param imagem4
     *            imagem4 a ser atribuido.
     */
    public void setImagem4(String imagem4) {
        this.imagem4 = imagem4;
    }

    /**
     * @return Retorna imagem5.
     */
    public String getImagem5() {
        return this.imagem5;
    }

    /**
     * @param imagem5
     *            imagem5 a ser atribuido.
     */
    public void setImagem5(String imagem5) {
        this.imagem5 = imagem5;
    }

    /**
     * @return Retorna imagemBanner.
     */
    public String getImagemBanner() {
        return this.imagemBanner;
    }

    /**
     * @param imagemBanner
     *            imagemBanner a ser atribuido.
     */
    public void setImagemBanner(String imagemBanner) {
        this.imagemBanner = imagemBanner;
    }

    /**
     * @return Retorna imagemLogo.
     */
    public String getImagemLogo() {
        return this.imagemLogo;
    }

    /**
     * @param imagemLogo
     *            imagemLogo a ser atribuido.
     */
    public void setImagemLogo(String imagemLogo) {
        this.imagemLogo = imagemLogo;
    }

    /**
     * @return Retorna nomeExibicaoOrgao.
     */
    public String getNomeExibicaoOrgao() {
        return this.nomeExibicaoOrgao;
    }

    /**
     * @param nomeExibicaoOrgao
     *            nomeExibicaoOrgao a ser atribuido.
     */
    public void setNomeExibicaoOrgao(String nomeExibicaoOrgao) {
        this.nomeExibicaoOrgao = nomeExibicaoOrgao;
    }

    /**
     * @return Retorna corCabecalhoBanner.
     */
    public String getCorCabecalhoBanner() {
        return this.corCabecalhoBanner;
    }

    /**
     * @param corCabecalhoBanner
     *            corCabecalhoBanner a ser atribuido.
     */
    public void setCorCabecalhoBanner(String corCabecalhoBanner) {
        this.corCabecalhoBanner = corCabecalhoBanner;
    }

    /**
     * @return Retorna corCabecalhoLogo.
     */
    public String getCorCabecalhoLogo() {
        return this.corCabecalhoLogo;
    }

    /**
     * @param corCabecalhoLogo
     *            corCabecalhoLogo a ser atribuido.
     */
    public void setCorCabecalhoLogo(String corCabecalhoLogo) {
        this.corCabecalhoLogo = corCabecalhoLogo;
    }

    /**
     * @return Retorna diretorioOrgao.
     */
    public String getDiretorioOrgao() {
        return this.diretorioOrgao;
    }

    /**
     * @param diretorioOrgao
     *            diretorioOrgao a ser atribuido.
     */
    public void setDiretorioOrgao(String diretorioOrgao) {
        this.diretorioOrgao = diretorioOrgao;
    }
    
    /**
     * @return Retorna descricaoImagemBanner.
     */
    public String getDescricaoImagemBanner() {
        return this.descricaoImagemBanner;
    }

    /**
     * @param descricaoImagemBanner
     *            descricaoImagemBanner a ser atribuido.
     */
    public void setDescricaoImagemBanner(String descricaoImagemBanner) {
        this.descricaoImagemBanner = descricaoImagemBanner;
    }
    
    /**
     * @return Retorna descricaoImagemLogo.
     */
    public String getDescricaoImagemLogo() {
        return this.descricaoImagemLogo;
    }

    /**
     * @param descricaoImagemLogo
     *            descricaoImagemLogo a ser atribuido.
     */
    public void setDescricaoImagemLogo(String descricaoImagemLogo) {
        this.descricaoImagemLogo = descricaoImagemLogo;
    }
    
    /**
     * @return Retorna descricaoImagem3.
     */
    public String getDescricaoImagem3() {
        return this.descricaoImagem3;
    }

    /**
     * @param descricaoImagem3
     *            descricaoImagem3 a ser atribuido.
     */
    public void setDescricaoImagem3(String descricaoImagem3) {
        this.descricaoImagem3 = descricaoImagem3;
    }
    
    /**
     * @return Retorna descricaoImagem4.
     */
    public String getDescricaoImagem4() {
        return this.descricaoImagem4;
    }

    /**
     * @param descricaoImagem4
     *            descricaoImagem4 a ser atribuido.
     */
    public void setDescricaoImagem4(String descricaoImagem4) {
        this.descricaoImagem4 = descricaoImagem4;
    }
    
    /**
     * @return Retorna descricaoImagem5.
     */
    public String getDescricaoImagem5() {
        return this.descricaoImagem5;
    }

    /**
     * @param descricaoImagem5
     *            descricaoImagem5 a ser atribuido.
     */
    public void setDescricaoImagem5(String descricaoImagem5) {
        this.descricaoImagem5 = descricaoImagem5;
    } 
   
    /**
     * @return Retorna linkImagemBanner.
     */
    public String getLinkImagemBanner() {
        return this.linkImagemBanner;
    }

    /**
     * @param linkImagemBanner
     *            linkImagemBanner a ser atribuido.
     */
    public void setLinkImagemBanner(String linkImagemBanner) {
        this.linkImagemBanner = linkImagemBanner;
    }
    
    /**
     * @return Retorna linkImagemLogo.
     */
    public String getLinkImagemLogo() {
        return this.linkImagemLogo;
    }

    /**
     * @param linkImagemLogo
     *            linkImagemLogo a ser atribuido.
     */
    public void setLinkImagemLogo(String linkImagemLogo) {
        this.linkImagemLogo = linkImagemLogo;
    }
    
    /**
     * @return Retorna linkImagem3.
     */
    public String getLinkImagem3() {
        return this.linkImagem3;
    }

    /**
     * @param linkImagem3
     *            linkImagem3 a ser atribuido.
     */
    public void setLinkImagem3(String linkImagem3) {
        this.linkImagem3 = linkImagem3;
    }
    
    /**
     * @return Retorna linkImagem4.
     */
    public String getLinkImagem4() {
        return this.linkImagem4;
    }

    /**
     * @param linkImagem4
     *            linkImagem4 a ser atribuido.
     */
    public void setLinkImagem4(String linkImagem4) {
        this.linkImagem4 = linkImagem4;
    }
    
    /**
     * @return Retorna linkImagem5.
     */
    public String getLinkImagem5() {
        return this.linkImagem5;
    }

    /**
     * @param linkImagem5
     *            linkImagem5 a ser atribuido.
     */
    public void setLinkImagem5(String linkImagem5) {
        this.linkImagem5 = linkImagem5;
    }     
    
}