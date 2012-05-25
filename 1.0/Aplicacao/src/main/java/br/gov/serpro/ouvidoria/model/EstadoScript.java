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
 * EstadoScript Esta classe representa os possíveis estados de um script.
 * 
 * @author SERPRO
 * @version $Revision: 1.1.2.3 $, $Date: 2011/10/20 17:07:44 $
 * @version 0.1, Date: 2004/11/19
 */
public class EstadoScript extends PersistentObject {

	private static final long serialVersionUID = 1L;

	/* Requerido */
    private Long id;

    /* Requerido */
    private String descricao;

    /* Constante representando o estado de script Aprovado */
    public static final EstadoScript APROVADO = new EstadoScript(new Long(1),
            "Aprovado");

    /* Constante representando o estado de script Reprovado */
    public static final EstadoScript REPROVADO = new EstadoScript(new Long(2),
            "Reprovado");

    /* Constante representando o estado de script Pendente */
    public static final EstadoScript PENDENTE = new EstadoScript(new Long(3),
            "Pendente");

    /* Constante representando o estado de script Inativo */
    public static final EstadoScript INATIVO = new EstadoScript(new Long(4),
            "Inativo");

    /**
     * @param pId
     *            O id a ser atribuído.
     * @param pDesc
     *            A descrição do EstadoScript
     */
    public EstadoScript(Long pId, String pDesc) {
        this.id = pId;
        this.descricao = pDesc;
    }

	/**
	 * Construtor padrão
	 * 
	 */
    public EstadoScript() {
        // DO NOTHING
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