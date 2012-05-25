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

import java.util.Collection;
import java.util.HashSet;

/**
 * Classe ajuda
 * 
 * @author SERPRO
 * @version $Revision: 1.1.2.3 $, $Date: 2011/10/20 17:07:44 $
 * @version 0.1, Date: 2004/11/19
 */
public class Ajuda extends PersistentObject {

	private static final long serialVersionUID = 1L;

	public static final String TIPO_CONTEUDO = "0";

	public static final String TIPO_INDICE = "1";

	public static final String TIPO_AMBOS = "2";

	public static final String GRUPO_GERAL = "1";

	public static final String GRUPO_OUVIDORIA = "2";

	public static final String GRUPO_PERFIL = "3";

	/* Requerido */
	private Long id;

	private Funcionalidade funcionalidade;

	private Ajuda ajudaPai;

	/* Requerido */
	private String descricao;

	/* Requerido */
	private String tipo;

	private String htmlAjuda;

	/* Requerido */
	private Integer ordem;

	/* Requerido */
	private Integer grupo;

	private int nivel;

	private Collection listaFilhos = new HashSet();

	/**
	 * @return Retorna nivel.
	 */
	public int getNivel() {
		return nivel;
	}

	/**
	 * @param nivel
	 *            nivel a ser atribuido.
	 */
	public void setNivel(int nivel) {
		this.nivel = nivel;
	}

	/**
	 * @return Retorna ajudaPai.
	 */
	public Ajuda getAjudaPai() {
		return ajudaPai;
	}

	/**
	 * @param ajudaPai
	 *            ajudaPai a ser atribuido.
	 */
	public void setAjudaPai(Ajuda ajudaPai) {
		this.ajudaPai = ajudaPai;
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

	/**
	 * @return Retorna grupo.
	 */
	public Integer getGrupo() {
		return grupo;
	}

	/**
	 * @param grupo
	 *            grupo a ser atribuido.
	 */
	public void setGrupo(Integer grupo) {
		this.grupo = grupo;
	}

	/**
	 * @return Retorna htmlAjuda.
	 */
	public String getHtmlAjuda() {
		return htmlAjuda;
	}

	/**
	 * @param htmlAjuda
	 *            htmlAjuda a ser atribuido.
	 */
	public void setHtmlAjuda(String htmlAjuda) {
		this.htmlAjuda = htmlAjuda;
	}

	/**
	 * @return Retorna id.
	 */
	public Long getId() {
		return id;
	}

	/**
	 * @param id
	 *            id a ser atribuido.
	 */
	public void setId(Long id) {
		this.id = id;
	}

	/**
	 * @return Retorna ordem.
	 */
	public Integer getOrdem() {
		return ordem;
	}

	/**
	 * @param ordem
	 *            ordem a ser atribuido.
	 */
	public void setOrdem(Integer ordem) {
		this.ordem = ordem;
	}

	/**
	 * @return Retorna tipo.
	 */
	public String getTipo() {
		return tipo;
	}

	/**
	 * @param tipo
	 *            tipo a ser atribuido.
	 */
	public void setTipo(String tipo) {
		this.tipo = tipo;
	}

	/**
	 * @return Retorna listaFilhos.
	 */
	public Collection getListaFilhos() {
		return listaFilhos;
	}

	/**
	 * @param listaFilhos
	 *            listaFilhos a ser atribuido.
	 */
	public void setListaFilhos(final Collection listaFilhos) {
		this.listaFilhos = listaFilhos;
	}
}