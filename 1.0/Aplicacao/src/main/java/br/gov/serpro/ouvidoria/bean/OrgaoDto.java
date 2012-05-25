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

import br.gov.serpro.ouvidoria.model.Orgao;
import java.sql.Timestamp;

/**
 * Bean utilizado para guardar informações do órgão na sessão HTTP do servidor
 * de aplicação (Tomcat).
 *
 * @author SERPRO
 * @version 0.1, Date: 2006/04/07
 */
public class OrgaoDto {
    
    /** Creates a new instance of OrgaoDto */
    public OrgaoDto( Orgao orgao ) {
        this.descricao = orgao.getDescricao();
        this.dataInicioAcionamento = orgao.getDataInicioAcionamento();
        this.dataFimAcionamento = orgao.getDataFimAcionamento();
        this.dataInicioConsultaResposta = orgao.getDataInicioConsultaResposta();
        this.dataFimConsultaResposta = orgao.getDataFimConsultaResposta();
        this.dataInicioOperacao = orgao.getDataInicioOperacao();
        this.dataFimOperacao = orgao.getDataFimOperacao();
    }

    /**
     * Holds value of property descricao.
     */
    private String descricao;

    /**
     * Getter for property descricao.
     * @return Value of property descricao.
     */
    public String getDescricao() {
        return this.descricao;
    }

    /**
     * Setter for property descricao.
     * @param descricao New value of property descricao.
     */
    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    /**
     * Holds value of property dataInicioAcionamento.
     */
    private Timestamp dataInicioAcionamento;

    /**
     * Getter for property dataInicioAcionamento.
     * @return Value of property dataInicioAcionamento.
     */
    public Timestamp getDataInicioAcionamento() {
        return this.dataInicioAcionamento;
    }

    /**
     * Setter for property dataInicioAcionamento.
     * @param dataInicioAcionamento New value of property dataInicioAcionamento.
     */
    public void setDataInicioAcionamento(Timestamp dataInicioAcionamento) {
        this.dataInicioAcionamento = dataInicioAcionamento;
    }

    /**
     * Holds value of property dataFimAcionamento.
     */
    private Timestamp dataFimAcionamento;

    /**
     * Getter for property dataFimAcionamento.
     * @return Value of property dataFimAcionamento.
     */
    public Timestamp getDataFimAcionamento() {
        return this.dataFimAcionamento;
    }

    /**
     * Setter for property dataFimAcionamento.
     * @param dataFimAcionamento New value of property dataFimAcionamento.
     */
    public void setDataFimAcionamento(Timestamp dataFimAcionamento) {
        this.dataFimAcionamento = dataFimAcionamento;
    }

    /**
     * Holds value of property dataInicioConsultaResposta.
     */
    private Timestamp dataInicioConsultaResposta;

    /**
     * Getter for property dataInicioConsultaResposta.
     * @return Value of property dataInicioConsultaResposta.
     */
    public Timestamp getDataInicioConsultaResposta() {
        return this.dataInicioConsultaResposta;
    }

    /**
     * Setter for property dataInicioConsultaResposta.
     * @param dataInicioConsultaResposta New value of property dataInicioConsultaResposta.
     */
    public void setDataInicioConsultaResposta(Timestamp dataInicioConsultaResposta) {
        this.dataInicioConsultaResposta = dataInicioConsultaResposta;
    }

    /**
     * Holds value of property dataFimConsultaResposta.
     */
    private Timestamp dataFimConsultaResposta;

    /**
     * Getter for property dataFimConsultaResposta.
     * @return Value of property dataFimConsultaResposta.
     */
    public Timestamp getDataFimConsultaResposta() {
        return this.dataFimConsultaResposta;
    }

    /**
     * Setter for property dataFimConsultaResposta.
     * @param dataFimConsultaResposta New value of property dataFimConsultaResposta.
     */
    public void setDataFimConsultaResposta(Timestamp dataFimConsultaResposta) {
        this.dataFimConsultaResposta = dataFimConsultaResposta;
    }

    /**
     * Holds value of property dataInicioOperacao.
     */
    private Timestamp dataInicioOperacao;

    /**
     * Getter for property dataInicioOperacao.
     * @return Value of property dataInicioOperacao.
     */
    public Timestamp getDataInicioOperacao() {
        return this.dataInicioOperacao;
    }

    /**
     * Setter for property dataInicioOperacao.
     * @param dataInicioOperacao New value of property dataInicioOperacao.
     */
    public void setDataInicioOperacao(Timestamp dataInicioOperacao) {
        this.dataInicioOperacao = dataInicioOperacao;
    }

    /**
     * Holds value of property dataFimOperacao.
     */
    private Timestamp dataFimOperacao;

    /**
     * Getter for property dataFimOperacao.
     * @return Value of property dataFimOperacao.
     */
    public Timestamp getDataFimOperacao() {
        return this.dataFimOperacao;
    }

    /**
     * Setter for property dataFimOperacao.
     * @param dataFimOperacao New value of property dataFimOperacao.
     */
    public void setDataFimOperacao(Timestamp dataFimOperacao) {
        this.dataFimOperacao = dataFimOperacao;
    }
    
}
