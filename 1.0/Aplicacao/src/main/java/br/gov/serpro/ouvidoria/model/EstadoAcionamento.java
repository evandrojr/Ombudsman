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
 * EstadoAcionamento Esta classe representa os possíveis estados de um
 * acionamento.
 * 
 * @author SERPRO
 * @version $Revision: 1.1.2.3 $, $Date: 2011/10/20 17:07:44 $
 * @version 0.1, Date: 2004/11/19
 */
public class EstadoAcionamento extends PersistentObject {

	private static final long serialVersionUID = 1L;

	/* Requerido */
    private Long id;

    /* Requerido */
    private String descricao;

    /* Constante representando o estado de acionamento Pendente */
    public static final EstadoAcionamento PENDENTE = new EstadoAcionamento(
            new Long(1), "Pendente");

    /* Constante representando o estado de acionamento Atraso */
    public static final EstadoAcionamento ATRASO = new EstadoAcionamento(
            new Long(2), "Atraso");

    /* Constante representando o estado de acionamento Crítico */
    public static final EstadoAcionamento CRITICO = new EstadoAcionamento(
            new Long(3), "Crítico");

    /* Constante representando o estado de acionamento Em Andamento */
    public static final EstadoAcionamento EM_ANDAMENTO = new EstadoAcionamento(
            new Long(4), "Em Andamento");

    /* Constante representando o estado de acionamento Respondido */
    public static final EstadoAcionamento RESPONDIDO = new EstadoAcionamento(
            new Long(5), "Respondido");

    /* Constante representando o estado de acionamento Respondido */
    public static final EstadoAcionamento ENVIADO = new EstadoAcionamento(
            new Long(6), "Enviado");

    /**
     * Construtor padrão
     */
    public EstadoAcionamento() {
        // DO NOTHING
    }

    /**
     * @param id
     *            Object ID do objeto Estado Acionamento
     * @param descricao
     *            descrição do estado de acionamento
     */
    private EstadoAcionamento(Long id, String descricao) {
        this.id = id;
        this.descricao = descricao;
    }

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
     * @return Retorna a descrição.
     */
    public String getDescricao() {
        return descricao;
    }

    /**
     * @param descricao
     *            A descrição a ser atribuída.
     */
    public void setDescricao(String descricao) {
        if (descricao == null || descricao.length() == 0) {
            throw new NullPointerException();
        }
        this.descricao = descricao;
    }

}