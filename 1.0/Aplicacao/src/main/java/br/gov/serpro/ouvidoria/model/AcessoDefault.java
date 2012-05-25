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
 * AcessoDefault Esta classe representa o relacionamento entre perfis e
 * funcionalidades, indicando as permissões de acesso de um perfil.
 * 
 * @author SERPRO
 * @version $Revision: 1.1.2.3 $, $Date: 2011/10/19 20:36:55 $
 * @version 0.1, Date: 2004/11/24
 */
public class AcessoDefault extends PersistentObject {

	private static final long serialVersionUID = 1L;

	/* Requerido */
    private Long id;

    /* Requerido */
    private Boolean permiteImpressao;

    /* Requerido */
    private Timestamp dataCadastramento;

    /* Requerido */
    private Perfil perfil;

    /* Requerido */
    private Funcionalidade funcionalidade;

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
     * @return Retorna permiteImpressao.
     */
    public Boolean isPermiteImpressao() {
        return permiteImpressao;
    }

    /**
     * @param permiteImpressao
     *            permiteImpressao a ser atribuido.
     */
    public void setPermiteImpressao(Boolean permiteImpressao) {
        if (permiteImpressao == null) {
            throw new NullPointerException();
        }
        this.permiteImpressao = permiteImpressao;
    }

    /**
     * @return Retorna dataCadastramento.
     */
    public Timestamp getDataCadastramento() {
        return dataCadastramento;
    }

    /**
     * @param dataCadastramento
     *            dataCadastramento a ser atribuido.
     */
    public void setDataCadastramento(Timestamp dataCadastramento) {
        this.dataCadastramento = dataCadastramento;
    }

    /**
     * @return Retorna perfil.
     */
    public Perfil getPerfil() {
        return perfil;
    }

    /**
     * @param perfil
     *            perfil a ser atribuido.
     */
    public void setPerfil(Perfil perfil) {
        this.perfil = perfil;
    }

    /**
     * @return Retorna funcionalidade.
     */
    public Funcionalidade getFuncionalidade() {
        return funcionalidade;
    }

    /**
     * @param funcionalidade
     *            funcionalidade a ser atribuido.
     */
    public void setFuncionalidade(Funcionalidade funcionalidade) {
        this.funcionalidade = funcionalidade;
    }
}