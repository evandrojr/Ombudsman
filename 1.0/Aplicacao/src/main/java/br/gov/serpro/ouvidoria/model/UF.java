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
 * Esta classe representa as unidades da federação.
 * 
 * @author SERPRO
 * @version $Revision: 1.1.2.3 $, $Date: 2011/10/20 19:27:38 $
 * @version 0.1, Date: 2004/11/19
 */
public class UF extends PersistentObject {

	private static final long serialVersionUID = 1L;

	private Long id;

	private String sigla;

	private String nome;

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
	 * @return Retorna a sigla.
	 */
	public String getSigla() {
		return sigla;
	}

	/**
	 * @param sigla
	 *            A sigla a ser atribuída.
	 */
	public void setSigla(String sigla) {
		if (sigla == null || sigla.length() == 0) {
			throw new NullPointerException();
		}
		this.sigla = sigla;
	}

	/**
	 * @return Retorna o nome.
	 */
	public String getNome() {
		return nome;
	}

	/**
	 * @param nome
	 *            O nome a ser atribuído.
	 */
	public void setNome(String nome) {
		if (nome == null || nome.length() == 0) {
			throw new NullPointerException();
		}
		this.nome = nome;
	}
}