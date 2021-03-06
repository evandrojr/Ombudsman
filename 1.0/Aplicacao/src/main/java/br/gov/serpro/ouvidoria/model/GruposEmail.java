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
 * GruposEmail Esta classe representa os grupos de usuários para os quais os
 * boletins podem ser enviados.
 * 
 * @author SERPRO
 * @version $Revision: 1.1.2.3 $, $Date: 2011/10/20 17:07:44 $
 * @version 0.1, Date: 2004/11/19
 */
public class GruposEmail extends PersistentObject {

    private static final long serialVersionUID = 1L;

	/* Requerido */
    private Long id;

    /* Requerido */
    private String descricao;

    /* Requerido */
    private String listaEmail;

    /* Requerido */
    private Orgao orgao;

    /* Requerido */
    private Timestamp dataCriacao;

    private Timestamp dataUltimaAlteracao;

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
        this.descricao = descricao;
    }

    /**
     * @return Retorna listaEmail.
     */
    public String getListaEmail() {
        return listaEmail;
    }

    /**
     * @param listaEmail
     *            listaEmail a ser atribuido.
     */
    public void setListaEmail(String listaEmail) {
        this.listaEmail = listaEmail;
    }

    /**
     * @return Retorna dataUltimaAlteracao.
     */
    public Timestamp getdataUltimaAlteracao() {
        return dataUltimaAlteracao;
    }

    /**
     * @param dataUltimaAlteracao
     *            dataUltimaAlteracao a ser atribuido.
     */
    public void setdataUltimaAlteracao(Timestamp dataUltimaAlteracao) {
        this.dataUltimaAlteracao = dataUltimaAlteracao;
    }

    /**
     * @return Retorna dataCriacao.
     */
    public Timestamp getDataCriacao() {
        return dataCriacao;
    }

    /**
     * @param dataCriacao
     *            dataCriacao a ser atribuido.
     */
    public void setDataCriacao(Timestamp dataCriacao) {
        this.dataCriacao = dataCriacao;
    }

    /**
     * @return Retorna orgao.
     */
    public Orgao getOrgao() {
        return orgao;
    }

    /**
     * @param orgao
     *            orgao a ser atribuido.
     */
    public void setOrgao(Orgao orgao) {
        this.orgao = orgao;
    }
}