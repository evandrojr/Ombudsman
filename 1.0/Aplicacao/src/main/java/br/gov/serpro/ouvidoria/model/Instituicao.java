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
import java.util.Iterator;
import java.util.List;
import java.util.TreeSet;

/**
 * Instituicao Esta classe representa as instituições.
 * 
 * @author SERPRO
 * @version $Revision: 1.1.2.3 $, $Date: 2011/10/20 17:07:43 $
 * @version 0.1, Date: 2004/11/19
 */
public class Instituicao extends PersistentObject {

	private static final long serialVersionUID = 1L;

	/* Requerido */
    private Long id;

    /* Requerido */
    private String descricao;

    /* Requerido */
    private Timestamp dataCadastramento;

    /* Requerido */
    private Timestamp dataInicioOperacao;

    /* Requerido */
    private Timestamp dataFimOperacao;

    /* Requerido */
    private Timestamp dataInicioCadastramento;

    /* Requerido */
    private Timestamp dataFimCadastramento;

    private Collection listaAssunto = new TreeSet();

    private Collection listaFuncionario = new TreeSet();

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
     *            descricao a ser atribuída.
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
     *            dataCadastramento a ser atribuída.
     */
    public void setDataCadastramento(Timestamp dataCadastramento) {
        if (dataCadastramento == null) {
            throw new NullPointerException();
        }
        this.dataCadastramento = dataCadastramento;
    }

    /**
     * @return Retorna dataInicioOperacao.
     */
    public Timestamp getDataInicioOperacao() {
        return dataInicioOperacao;
    }

    /**
     * @param dataInicioOperacao
     *            dataInicioOperacao a ser atribuída.
     */
    public void setDataInicioOperacao(Timestamp dataInicioOperacao) {
        if (dataInicioOperacao == null) {
            throw new NullPointerException();
        }
        this.dataInicioOperacao = dataInicioOperacao;
    }

    /**
     * @return Retorna dataFimOperacao.
     */
    public Timestamp getDataFimOperacao() {
        return dataFimOperacao;
    }

    /**
     * @param dataFimOperacao
     *            dataFimOperacao a ser atribuída.
     */
    public void setDataFimOperacao(Timestamp dataFimOperacao) {
        if (dataFimOperacao == null) {
            throw new NullPointerException();
        }
        this.dataFimOperacao = dataFimOperacao;
    }

    /**
     * @return Retorna dataFimCadastramento.
     */
    public Timestamp getDataFimCadastramento() {
        return this.dataFimCadastramento;
    }

    /**
     * @param dataFimCadastramento
     *            dataFimCadastramento a ser atribuido.
     */
    public void setDataFimCadastramento(Timestamp dataFimCadastramento) {
        if (dataFimCadastramento == null) {
            throw new NullPointerException();
        }
        this.dataFimCadastramento = dataFimCadastramento;
    }

    /**
     * @return Retorna dataInicioCadastramento.
     */
    public Timestamp getDataInicioCadastramento() {
        return this.dataInicioCadastramento;
    }

    /**
     * @param dataInicioCadastramento
     *            dataInicioCadastramento a ser atribuido.
     */
    public void setDataInicioCadastramento(Timestamp dataInicioCadastramento) {
        if (dataInicioCadastramento == null) {
            throw new NullPointerException();
        }
        this.dataInicioCadastramento = dataInicioCadastramento;
    }

    /**
     * @return Retorna listaAssunto.
     */
    public Collection getListaAssunto() {
        return listaAssunto;
    }

    /**
     * @param listaAssunto
     *            listaAssunto a ser atribuido.
     */
    public void setListaAssunto(Collection listaAssunto) {
        this.listaAssunto = listaAssunto;
    }

    /**
     * @return Retorna listaFuncionario.
     */
    public Collection getListaFuncionario() {
        return listaFuncionario;
    }

    /**
     * @param listaFuncionario
     *            listaFuncionario a ser atribuido.
     */
    public void setListaFuncionario(Collection listaFuncionario) {
        this.listaFuncionario = listaFuncionario;
    }

    /**
     * Recupera todos os assuntos de algum órgão ou sub-órgão 
     * 
     * @param situacao
     *            "Ativo" - retorna os assuntos ativos "Inativo" - retorna os
     *            assuntos inativos Assunto.AMBOS - retorna os assuntos ativos e
     *            inativos
     * 
     * @return Retorna listaAssunto.
     */
    public List getListaTodosAssuntos(String situacao) {
        Assunto assunto;
        Collection listaAssuntoInstituicao;
        List listaAssuntos = new ArrayList();
        Iterator iter;

        // Inicialmente recupera a lista de assuntos
        listaAssuntoInstituicao = this.getListaAssunto();
        if (listaAssuntoInstituicao != null) {
            iter = listaAssuntoInstituicao.iterator();
            while (iter.hasNext()) {
                assunto = (Assunto) iter.next();

                if (situacao.equalsIgnoreCase(Assunto.ATIVO))
                    if (assunto.getSituacao() == Assunto.ATIVO)
                        listaAssuntos.add(assunto);

                if (situacao.equalsIgnoreCase(Assunto.INATIVO))
                    if (assunto.getSituacao() == Assunto.INATIVO)
                        listaAssuntos.add(assunto);

                if (situacao.equalsIgnoreCase(Assunto.AMBOS))
                    listaAssuntos.add(assunto);
            }
        }

        // se sub-órgão, busca assuntos do órgão (gerais) e adiciona na lista
        if (this instanceof SubOrgao) {
            Orgao o = ((SubOrgao) this).getOrgao();
            Collection listaAssuntosOrgao = o.getListaAssunto();

            if (listaAssuntosOrgao != null) {
                iter = listaAssuntosOrgao.iterator();
                while (iter.hasNext()) {
                    assunto = (Assunto) iter.next();

                    if (situacao.equalsIgnoreCase(Assunto.ATIVO))
                        if (assunto.getSituacao() == Assunto.ATIVO)
                            listaAssuntos.add(assunto);

                    if (situacao.equalsIgnoreCase(Assunto.INATIVO))
                        if (assunto.getSituacao() == Assunto.INATIVO)
                            listaAssuntos.add(assunto);

                    if (situacao.equalsIgnoreCase(Assunto.AMBOS))
                        listaAssuntos.add(assunto);
                }
            }
        }

        if (!listaAssuntos.isEmpty())
            return listaAssuntos;

        return null;
    }

    /**
     * Recupera todos os assuntos de algum órgão ou sub-órgão
     * 
     * @param situacao
     *            Assunto.ATIVO - retorna os assuntos ativos Assunto.INATIVO - retorna os
     *            assuntos inativos Assunto.AMBOS - retorna os assuntos ativos e
     *            inativos
     * 
     * @return Retorna listaAssunto.
     */
    public List getListaAssunto(String situacao) {
        List listaAssuntos = new ArrayList();

        // Inicialmente recupera a lista de assuntos
        Collection listaAssuntoInstituicao = this.getListaAssunto();
        if (listaAssuntoInstituicao != null) {
            Iterator iter = listaAssuntoInstituicao.iterator();
            while (iter.hasNext()) {
                Assunto assunto = (Assunto) iter.next();

                if (situacao.equalsIgnoreCase(Assunto.ATIVO))
                    if (assunto.getSituacao() == Assunto.ATIVO)
                        listaAssuntos.add(assunto);

                if (situacao.equalsIgnoreCase(Assunto.INATIVO))
                    if (assunto.getSituacao() == Assunto.INATIVO)
                        listaAssuntos.add(assunto);

                if (situacao.equalsIgnoreCase(Assunto.AMBOS))
                    listaAssuntos.add(assunto);
            }
        }

        if (!listaAssuntos.isEmpty())
            return listaAssuntos;

        return null;
    }
    
}