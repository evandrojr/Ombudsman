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
 * Boletim Esta classe representa os boletins que podem ser gerados pelo
 * sistema.
 *
 * @author SERPRO
 * @version $Revision: 1.1.2.3 $, $Date: 2011/10/20 17:07:44 $
 * @version 0.1, Date: 2004/11/19
 */
public class Boletim extends PersistentObject {
    
	private static final long serialVersionUID = 1L;

	/* Requerido */
    private Long id;
    
    /* Requerido */
    private String nome;
    
    /* Requerido */
    private Integer numero;
    
    /* Requerido */
    private String areaGeradora;
    
    /* Requerido */
    private String telefone;
    
    /* Requerido */
    private String conteudo;
    
    private Timestamp dataCadastramento;
    
    private String diretorioLocalizacao;
    
    private Boolean possuiCabecalho;
    
    private Boolean possuiGrafico;
    
    private Boolean possuiTabelaDados;
    
    private Boolean publicar;
    
    /* Requerido */
    private Orgao orgao;
    
    /* Requerido */
    private Funcionario funcionario;
    
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
     * @return Retorna nome.
     */
    public String getNome() {
        return nome;
    }
    
    /**
     * @param nome
     *            nome a ser atribuido.
     */
    public void setNome(String nome) {
        if (nome == null || nome.length() == 0) {
            throw new NullPointerException();
        }
        this.nome = nome;
    }
    
    /**
     * @return Retorna número.
     */
    public Integer getNumero() {
        return numero;
    }
    
    /**
     * @param numero
     *            número a ser atribuido.
     */
    public void setNumero(Integer numero) {
        if (numero == null) {
            throw new NullPointerException();
        }
        this.numero = numero;
    }
    
    /**
     * @return Retorna areaGeradora.
     */
    public String getAreaGeradora() {
        return areaGeradora;
    }
    
    /**
     * @param areaGeradora
     *            areaGeradora a ser atribuido.
     */
    public void setAreaGeradora(String areaGeradora) {
        if (areaGeradora == null || areaGeradora.length() == 0) {
            throw new NullPointerException();
        }
        this.areaGeradora = areaGeradora;
    }
    
    /**
     * @return Retorna telefone.
     */
    public String getTelefone() {
        return telefone;
    }
    
    /**
     * @param telefone
     *            telefone a ser atribuido.
     */
    public void setTelefone(String telefone) {
        if (telefone == null || telefone.length() == 0) {
            throw new NullPointerException();
        }
        this.telefone = telefone;
    }
    
    /**
     * @return Retorna conteúdo.
     */
    public String getConteudo() {
        return conteudo;
    }
    
    /**
     * @param conteudo
     *            Conteúdo a ser atribuido.
     */
    public void setConteudo(String conteudo) {
        if (conteudo == null || conteudo.length() == 0) {
            throw new NullPointerException();
        }
        this.conteudo = conteudo;
    }
    
    /**
     * @return Retorna funcionário.
     */
    public Funcionario getFuncionario() {
        return funcionario;
    }
    
    /**
     * @param funcionario
     *            funcionário a ser atribuido.
     */
    public void setFuncionario(Funcionario funcionario) {
        if (funcionario == null) {
            throw new NullPointerException();
        }
        this.funcionario = funcionario;
    }
    
    /**
     * @return Retorna diretorioLocalizacao.
     */
    public String getDiretorioLocalizacao() {
        return this.diretorioLocalizacao;
    }
    
    /**
     * @param diretorioLocalizacao
     *            diretorioLocalizacao a ser atribuido.
     */
    public void setDiretorioLocalizacao(String diretorioLocalizacao) {
        this.diretorioLocalizacao = diretorioLocalizacao;
    }
    
    /**
     * @return Retorna possuiCabecalho.
     */
    public Boolean getPossuiCabecalho() {
        return this.possuiCabecalho;
    }
    
    /**
     * @param possuiCabecalho
     *            possuiCabecalho a ser atribuido.
     */
    public void setPossuiCabecalho(Boolean possuiCabecalho) {
        this.possuiCabecalho = possuiCabecalho;
    }
    
    /**
     * @return Retorna possuiGrafico.
     */
    public Boolean getPossuiGrafico() {
        return this.possuiGrafico;
    }
    
    /**
     * @param possuiGrafico
     *            possuiGrafico a ser atribuido.
     */
    public void setPossuiGrafico(Boolean possuiGrafico) {
        this.possuiGrafico = possuiGrafico;
    }
    
    /**
     * @return Retorna possuiTabelaDados.
     */
    public Boolean getPossuiTabelaDados() {
        return this.possuiTabelaDados;
    }
    
    /**
     * @param possuiTabelaDados
     *            possuiTabelaDados a ser atribuido.
     */
    public void setPossuiTabelaDados(Boolean possuiTabelaDados) {
        this.possuiTabelaDados = possuiTabelaDados;
    }
    
    /**
     * @return Retorna publicar.
     */
    public Boolean getPublicar() {
        return this.publicar;
    }
    
    /**
     * @param publicar
     *            publicar a ser atribuido.
     */
    public void setPublicar(Boolean publicar) {
        this.publicar = publicar;
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
        this.dataCadastramento = dataCadastramento;
    }
    
    /**
     * @return Retorna orgao.
     */
    public Orgao getOrgao() {
        return this.orgao;
    }
    
    /**
     * @param orgao
     *            orgao a ser atribuido.
     */
    public void setOrgao(Orgao orgao) {
        if (orgao == null) {
            throw new NullPointerException();
        }
        this.orgao = orgao;
    }
    
    public String getPublicado() {
        if (this.getPublicar().booleanValue()) {
            return "Sim";
        }
        return "Não";
    }
    
}