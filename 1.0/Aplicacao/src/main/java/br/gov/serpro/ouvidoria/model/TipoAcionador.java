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
 * Esta classe representa os tipos de acionador do sistema.
 * 
 * @author SERPRO
 * @version $Revision: 1.1.2.3 $, $Date: 2011/10/20 19:27:38 $
 * @version 0.1, Date: 2004/11/19
 */
public class TipoAcionador extends PersistentObject {

	private static final long serialVersionUID = 1L;

	/* Requerido */
	private Long id;

	/* Requerido */
	private String descricao;

	/* Constante representando o tipo de usuário anônimo */
	public static final TipoAcionador ANONIMO = new TipoAcionador(new Long(1),
			"anônimo");

	/* Constante representando o tipo de usuário pessoa física */
	public static final TipoAcionador PESSOA_FISICA = new TipoAcionador(
			new Long(2), "Pessoa Física");

	/* Constante representando o tipo de usuário pessoa jurídica */
	public static final TipoAcionador PESSOA_JURIDICA = new TipoAcionador(
			new Long(3), "Pessoa Jurídica");

	/* Constante representando o tipo de usuário funcionário */
	public static final TipoAcionador FUNCIONARIO = new TipoAcionador(new Long(
			4), "Funcionário");

	/**
	 * Construtor padrão
	 */
	public TipoAcionador() {
		// DO NOTHING
	}

	/**
	 * Construtor privado da classe TipoAcionador
	 * 
	 * @param id
	 *            Object ID do objeto
	 * @param descricao
	 *            descricao do tipo acionador
	 */
	private TipoAcionador(Long id, String descricao) {
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

	public static TipoAcionador get(final Long id) {
		if (id.equals(TipoAcionador.ANONIMO.getId())) {
			return TipoAcionador.ANONIMO;
		} else if (id.equals(TipoAcionador.PESSOA_FISICA.getId())) {
			return TipoAcionador.PESSOA_FISICA;
		} else if (id.equals(TipoAcionador.PESSOA_JURIDICA.getId())) {
			return TipoAcionador.PESSOA_JURIDICA;
		} else if (id.equals(TipoAcionador.FUNCIONARIO.getId())) {
			return TipoAcionador.FUNCIONARIO;
		}
		return null;
	}

}