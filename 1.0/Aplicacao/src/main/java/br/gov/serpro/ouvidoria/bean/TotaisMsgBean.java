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
 * Objetivo: Auxiliar na exibição das informações das mensagens pendentes.
 * 
 * @author SERPRO
 * @version $Revision: 1.1.2.5 $, $Date: 2011/10/18 17:40:31 $
 * @version 0.1, 2004/12/13
 */
public class TotaisMsgBean {

    private String descricao;

    private Long totalMsgFunc;

    private Long totalMsgOrgao;

    private Long primeiroAcionamentoId;

    /*
     * Construtor
     */
    public TotaisMsgBean(String pDesc, Long ptotalMsgFunc, Long ptotalMsgOrgao,
            Long pAcionamento) {

        this.descricao = pDesc;
        this.totalMsgFunc = ptotalMsgFunc;
        this.totalMsgOrgao = ptotalMsgOrgao;
        this.primeiroAcionamentoId = pAcionamento;
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
     * @return Retorna totalMsgFunc.
     */
    public Long getTotalMsgFunc() {
        return totalMsgFunc;
    }

    /**
     * @param totalMsgFunc
     *            totalMsgFunc a ser atribuido.
     */
    public void setTotalMsgFunc(Long totalMsgFunc) {
        this.totalMsgFunc = totalMsgFunc;
    }

    /**
     * @return Retorna totalMsgOrgao.
     */
    public Long getTotalMsgOrgao() {
        return totalMsgOrgao;
    }

    /**
     * @param totalMsgOrgao
     *            totalMsgOrgao a ser atribuido.
     */
    public void setTotalMsgOrgao(Long totalMsgOrgao) {
        this.totalMsgOrgao = totalMsgOrgao;
    }

    /**
     * @return Retorna primeiroAcionamentoId.
     */
    public Long getPrimeiroAcionamentoId() {
        return primeiroAcionamentoId;
    }

    /**
     * @param primeiroAcionamentoId
     *            primeiroAcionamentoId a ser atribuido.
     */
    public void setPrimeiroAcionamentoId(Long primeiroAcionamentoId) {
        this.primeiroAcionamentoId = primeiroAcionamentoId;
    }
    
}