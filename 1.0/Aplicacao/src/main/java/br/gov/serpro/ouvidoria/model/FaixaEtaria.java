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

/**
 * Esta classe representa as faixas etárias que um acionador pode ter.
 * 
 * @author SERPRO
 * @version $Revision: 1.1.2.3 $, $Date: 2011/10/20 17:07:44 $
 * @version 0.1, Date: 2004/11/19
 */
public class FaixaEtaria extends PersistentObject {

	private static final long serialVersionUID = 1L;

	/* Requerido */
    private Long id;

    /* Requerido */
    private String intervalo;

    /* Requerido */
    private Integer idadeInicial;

    private Integer idadeFinal;

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
     * @return Retorna o intervalo.
     */
    public String getIntervalo() {
        return intervalo;
    }

    /**
     * @param intervalo
     *            O intervalo a ser atribuído.
     */
    public void setIntervalo(String intervalo) {
        if (intervalo == null || intervalo.length() == 0) {
            throw new NullPointerException();
        }
        this.intervalo = intervalo;
    }

    /**
     * @return Retorna a idade inicial.
     */
    public Integer getIdadeInicial() {
        return idadeInicial;
    }

    /**
     * @param idadeInicial
     *            a idadeInicial a ser atribuída.
     */
    public void setIdadeInicial(Integer idadeInicial) {
        if (idadeInicial == null) {
            throw new NullPointerException();
        }
        this.idadeInicial = idadeInicial;
    }

    /**
     * @return Retorna a idade final.
     */
    public Integer getIdadeFinal() {
        return idadeFinal;
    }

    /**
     * @param idadeFinal
     *            a idadeFinal a ser atribuída.
     */
    public void setIdadeFinal(Integer idadeFinal) {
        this.idadeFinal = idadeFinal;
    }

}