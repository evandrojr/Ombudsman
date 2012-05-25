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
 * Esta classe representa os assuntos dos acionamentos.
 * 
 * @author SERPRO
 * @version $Revision: 1.1.2.3 $, $Date: 2011/10/20 17:07:44 $
 * @version 0.1, Date: 2004/11/19
 */
public class Assunto extends PersistentObject {

	private static final long serialVersionUID = 1L;

	public static final String AMBOS = "Ambos";

    public static final String ATIVO = "Ativo";

    public static final String INATIVO = "Inativo";

    /* Requerido */
    private Long id;

    /* Requerido */
    private String descricao;

    private Integer prazoInterno;

    private Integer prazoExterno;

    /* Requerido */
    private Timestamp dataCadastramento;

    /* Requerido */
    private String descricaoDetalhada;

    /* Requerido */
    private Instituicao instituicao;

    private Timestamp dataVigencia;

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
     *            O id a ser atribuido.
     */
    public void setId(Long id) {
        this.id = id;
    }

    /**
     * @return Retorna a descricao.
     */
    public String getDescricao() {
        return descricao;
    }

    /**
     * @param descricao
     *            A descricao a ser atribuida.
     */
    public void setDescricao(String descricao) {
        if (descricao == null || descricao.length() == 0) {
            throw new NullPointerException();
        }
        this.descricao = descricao;
    }

    /**
     * @return Retorna o prazo interno.
     */
    public Integer getPrazoInterno() {
        return prazoInterno;
    }

    /**
     * @param prazoInterno
     *            O prazo interno a ser atribuido.
     */
    public void setPrazoInterno(Integer prazoInterno) {
        this.prazoInterno = prazoInterno;
    }

    /**
     * @return Retorna o prazo externo.
     */
    public Integer getPrazoExterno() {
        return prazoExterno;
    }

    /**
     * @param prazoExterno
     *            O prazo externo a ser atribuido.
     */
    public void setPrazoExterno(Integer prazoExterno) {
        this.prazoExterno = prazoExterno;
    }

    /**
     * @return Retorna a data de cadastramento.
     */
    public Timestamp getDataCadastramento() {
        return dataCadastramento;
    }

    /**
     * @param dataCadastramento
     *            A data de cadastramento a ser atribuido.
     */
    public void setDataCadastramento(Timestamp dataCadastramento) {
        if (dataCadastramento == null) {
            throw new NullPointerException();
        }
        this.dataCadastramento = dataCadastramento;
    }

    /**
     * @return Retorna a descricao detalhada.
     */
    public String getDescricaoDetalhada() {
        return descricaoDetalhada;
    }

    /**
     * @param descricaoDetalhada
     *            A descricao detalhada a ser atribuida.
     */
    public void setDescricaoDetalhada(String descricaoDetalhada) {
        if (descricaoDetalhada == null || descricaoDetalhada.length() == 0) {
            throw new NullPointerException();
        }
        this.descricaoDetalhada = descricaoDetalhada;
    }

    /**
     * @return Retorna a data de vigência.
     */
    public Timestamp getDataVigencia() {
        return dataVigencia;
    }

    /**
     * @param dataVigencia
     *            A data de vigência a ser atribuída.
     */
    public void setDataVigencia(Timestamp dataVigencia) {
        this.dataVigencia = dataVigencia;
    }

    /**
     * @return Retorna listaFuncionario.
     */
    public Collection getListaFuncionario() {
        return listaFuncionario;
    }

    public List getListaFuncionariosAtivos() {
        Iterator i;
        Funcionario funcionario;
        ArrayList retorno = new ArrayList();

        if (!listaFuncionario.isEmpty()) {
            i = listaFuncionario.iterator();

            while (i.hasNext()) {
                funcionario = (Funcionario) i.next();
                if (funcionario.getSituacao().compareTo(Funcionario.ATIVO) == 0) {
                    retorno.add(funcionario);
                }
            }
        }
        return retorno;
    }

    /**
     * @param listaFuncionario
     *            listaFuncionario a ser atribuido.
     */
    public void setListaFuncionario(Collection listaFuncionario) {
        this.listaFuncionario = listaFuncionario;
    }

    /**
     * @return Retorna a situação (Ativo/Inativo) do Assunto de acordo com a
     *         data de vigência
     */
    public String getSituacao() {
        // Recupera data e hora atuais
        Timestamp hoje = new Timestamp(System.currentTimeMillis());
        String situac = "";

        try {

            if ((this.dataVigencia == null)
                    || (this.dataVigencia.after(hoje) == true)) {
                situac = Assunto.ATIVO;
            } else if (this.dataVigencia.before(hoje) == true) {
                situac = Assunto.INATIVO;
            }

        } catch (Exception e) {
            situac = "ERRO";
        }

        return situac;
    }

    /**
     * @return Retorna instituição.
     */
    public Instituicao getInstituicao() {
        return this.instituicao;
    }

    /**
     * @param instituicao
     *            instituicao a ser atribuido.
     */
    public void setInstituicao(Instituicao instituicao) {
        if (instituicao == null) {
            throw new NullPointerException();
        }

        this.instituicao = instituicao;
    }

}
