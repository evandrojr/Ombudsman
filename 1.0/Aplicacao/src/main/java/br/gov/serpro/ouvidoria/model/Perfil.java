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
import java.util.Collection;

/**
 * Perfil Esta classe representa os perfis dos usuários do sistema.
 * 
 * @author SERPRO
 * @version $Revision: 1.1.2.3 $, $Date: 2011/10/20 19:27:38 $
 * @version 0.1, Date: 2004/11/19
 */
public class Perfil extends PersistentObject {

	private static final long serialVersionUID = 1L;

	/* Requerido */
	private Long id;

	/* Requerido */
	private String descricao;

	/* Requerido */
	private Timestamp dataCadastramento;

	private Collection listaFuncionalidade;

	private Funcionalidade funcionalidade;

	/* Constante representando o perfil ouvidor geral */
	public static final Perfil OUVIDOR_GERAL = new Perfil(new Long(1),
			"Ouvidor Geral");

	/* Constante representando o perfil ouvidor assistente */
	public static final Perfil OUVIDOR_ASSISTENTE = new Perfil(new Long(2),
			"Ouvidor Assistente");

	/* Constante representando o perfil gestor do sistema */
	public static final Perfil GESTOR_SISTEMA = new Perfil(new Long(3),
			"Gestor do Sistema");

	/* Constante representando o perfil gestor do conteúdo */
	public static final Perfil GESTOR_CONTEUDO = new Perfil(new Long(4),
			"Gestor do Conteúdo");

	/* Constante representando o perfil especialista */
	public static final Perfil ESPECIALISTA = new Perfil(new Long(5),
			"Especialista");

	/* Constante representando o perfil atendente */
	public static final Perfil ATENDENTE = new Perfil(new Long(6), "Atendente");

	/* Constante representando o perfil administrador */
	public static final Perfil ADMINISTRADOR = new Perfil(new Long(7),
			"Administrador");

	/**
	 * Construtor default, sem parâmetros, requerido pelo Hibernate.
	 */
	public Perfil() {
	}

	/**
	 * Construtor privado da classe Perfil
	 * 
	 * @param id
	 *            Object ID do objeto
	 * @param descricao
	 *            descricao do perfil
	 */
	private Perfil(Long id, String descricao) {
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
	 * @return Retorna dataCadastramento.
	 */
	public Timestamp getDataCadastramento() {
		return dataCadastramento;
	}

	/**
	 * @param dataCadastramento
	 *            dataCadastramento a ser atribuido.
	 */
	public void setDataCadastramento(Timestamp dataCadastramento) {
		this.dataCadastramento = dataCadastramento;
	}

	/**
	 * @return Retorna listaFuncionalidade.
	 */
	public Collection getListaFuncionalidade() {
		return this.listaFuncionalidade;
	}

	/**
	 * @param listaFuncionalidade
	 *            listaFuncionalidade a ser atribuido.
	 */
	public void setListaFuncionalidade(Collection listaFuncionalidade) {
		this.listaFuncionalidade = listaFuncionalidade;
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
	 * Método que identifica se o Perfil de um Funcionário do tipo Ouvidor, seja
	 * ele Geral ou Assistente, para facilitar a validação de Regras de Negócio
	 * ligadas ao Perfil do funcionário.
	 * 
	 * @return Valor booleano que indica se o funcionário possui ou não perfil
	 *         de Ouvidor junto ao sistema.
	 */
	public boolean isOuvidor() {
		if (Perfil.OUVIDOR_GERAL.equals(this)
				|| Perfil.OUVIDOR_ASSISTENTE.equals(this)) {
			return true;
		} else {
			return false;
		}
	}
}
