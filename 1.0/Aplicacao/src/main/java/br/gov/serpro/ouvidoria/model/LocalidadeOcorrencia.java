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

/**
 * LocalidadeOcorrencia Esta classe representa as localidades de ocorrência
 * 
 * @author SERPRO
 * @version $Revision: 1.1.2.4 $, $Date: 2011/10/21 11:19:59 $
 * @version 0.1, Date: 2004/11/19
 */
public class LocalidadeOcorrencia extends PersistentObject {

	private static final long serialVersionUID = 1L;

	/* Requerido */
    private Long id;

    /* Requerido */
    private String descricao;

    /* Requerido */
    private Timestamp dataCadastramento;

    private Timestamp dataVigencia = null;

    /* Requerido */
    private SubOrgao subOrgao;

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
     * @return Retorna descrição.
     */
    public String getDescricao() {
        return descricao;
    }

    /**
     * @param descricao
     *            descrição a ser atribuída.
     */
    public void setDescricao(String descricao) {
        if (descricao == null || descricao.length() == 0) {
            throw new NullPointerException();
        }
        this.descricao = descricao;
    }

    /**
     * @return Retorna dataCadastramento.
     */
    public Timestamp getDataCadastramento() {
        return dataCadastramento;
    }

    /**
     * @param dataCadastramento
     *            data de cadastramento a ser atribuída.
     */
    public void setDataCadastramento(Timestamp dataCadastramento) {
        if (dataCadastramento == null) {
            throw new NullPointerException();
        }
        this.dataCadastramento = dataCadastramento;
    }

    /**
     * @return Retorna a data da vigência.
     */
    public Timestamp getDataVigencia() {
        return dataVigencia;
    }

    /**
     * @param dataVigencia
     *            data de vigência a ser atribuída.
     */
    public void setDataVigencia(Timestamp dataVigencia) {
        this.dataVigencia = dataVigencia;
    }

    /**
     * @return Retorna subOrgao.
     */
    public SubOrgao getSubOrgao() {
        return this.subOrgao;
    }

    /**
     * @param subOrgao
     *            subOrgao a ser atribuido.
     */
    public void setSubOrgao(SubOrgao subOrgao) {
        this.subOrgao = subOrgao;
    }

}