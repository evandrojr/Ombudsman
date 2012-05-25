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
package br.gov.serpro.ouvidoria.controller;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import br.gov.serpro.ouvidoria.dao.Dao;
import br.gov.serpro.ouvidoria.dao.DaoException;
import br.gov.serpro.ouvidoria.dao.DaoFactory;
import br.gov.serpro.ouvidoria.model.Ajuda;
import br.gov.serpro.ouvidoria.model.Funcionalidade;
import br.gov.serpro.ouvidoria.model.Funcionario;
import br.gov.serpro.ouvidoria.util.Utilitario;

/**
 * Persistir e consultar objetos da classe Ajuda
 * 
 * @author SERPRO
 * @version $Revision: 1.1.2.3 $, $Date: 2011/10/19 18:18:09 $
 * @version 0.1, Date: 2004/12/13
 */
public class AjudaCtrl {

	private Dao ajudaDao;

	/**
	 * Construtor recebendo objeto Dao
	 * 
	 * @param daoFactory
	 */
	public AjudaCtrl(final DaoFactory daoFactory) {
		ajudaDao = daoFactory.create(Ajuda.class);
	}

	/**
	 * Obtém a entidade à partir do ID recebido como parâmetro
	 * 
	 * @param id
	 * @return objeto da classe Ajuda
	 * @throws DaoException
	 */
	public Ajuda get(final Long id) throws DaoException {
		if (id == null) {
			throw new DaoException("ID do Objeto não pode ser nulo.");
		}
		return (Ajuda) ajudaDao.get(id);
	}

	/**
	 * Método para listar os objetos Ajuda
	 */
	public List list() throws DaoException {
		return ajudaDao.list();
	}

	/**
	 * Método para consultar ajuda de uma determinada funcionalidade
	 * 
	 * @param funcionario
	 * @param tipo
	 * @return
	 * @throws DaoException
	 */
	public List consultaAjuda(final Funcionario funcionario, final String tipo)
			throws DaoException {

		StringBuffer sql = new StringBuffer();

		sql.append(" Select a from Ajuda as a ");

		if (funcionario != null) {
			sql.append(" , Funcionario as f ");
		}

		sql.append(" where a.tipo in ('" + Ajuda.TIPO_AMBOS + "','" + tipo
				+ "')");

		if (funcionario == null) {
			sql.append(" and a.grupo = " + Ajuda.GRUPO_GERAL);
		} else {
			sql.append(" and a.funcionalidade in elements(f.listaFuncionalidade) and f.id = "
					+ funcionario.getId());
		}

		if (tipo.equals(Ajuda.TIPO_INDICE)) {
			sql.append(" order by a.descricao ");
		} else {
			sql.append(" order by a.ordem ");
		}

		return ajudaDao.query(sql.toString());
	}

	/**
	 * Método para montar a árvore de conteúdo de ajuda
	 * 
	 * @param funcionario
	 * @return
	 * @throws DaoException
	 */
	public List montaArvoreConteudo(final Funcionario funcionario)
			throws DaoException {

		StringBuffer sql = new StringBuffer();

		sql.append(" select a from Ajuda as a ");

		if (funcionario != null) {
			sql.append(" , Funcionario as f ");
		}

		sql.append(" where a.ajudaPai is null ");

		if (funcionario == null) {
			sql.append(" and a.grupo = " + Ajuda.GRUPO_GERAL);
		} else {
			sql.append(" and a.funcionalidade in elements(f.listaFuncionalidade) and f.id = "
					+ funcionario.getId());
		}

		sql.append(" and a.tipo in ('" + Ajuda.TIPO_AMBOS + "','"
				+ Ajuda.TIPO_CONTEUDO + "' )");

		sql.append(" order by a.descricao ");

		List lstAjudaRaiz = ajudaDao.query(sql.toString());

		if (lstAjudaRaiz == null || lstAjudaRaiz.isEmpty()) {
			return new ArrayList();
		}

		List lstArvoreAjuda = new ArrayList();

		for (Iterator it = lstAjudaRaiz.iterator(); it.hasNext();) {
			Ajuda ajuda = (Ajuda) it.next();
			ajuda.setNivel(1);
			lstArvoreAjuda.add(ajuda);
		}

		return lstArvoreAjuda;
	}

	/**
	 * Recupera conteúdo da ajuda para uma funcionalidade
	 * 
	 * @param funcionalidade
	 * @param funcionario
	 * @return
	 * @throws DaoException
	 */
	public Ajuda get(final Funcionalidade funcionalidade,
			final Funcionario funcionario) throws DaoException {

		if (funcionalidade == null) {
			throw new NullPointerException();
		}

		StringBuffer sql = new StringBuffer();

		sql.append(" select a from Ajuda as a ");

		if (funcionario != null) {
			sql.append(" , Funcionario as f ");
		}

		sql.append(" where a.tipo in ('" + Ajuda.TIPO_AMBOS + "','"
				+ Ajuda.TIPO_CONTEUDO + "' )");

		if (funcionario == null) {
			sql.append(" and a.grupo = " + Ajuda.GRUPO_GERAL);
		} else {
			sql.append(" and a.funcionalidade in elements(f.listaFuncionalidade) and f.id = "
					+ funcionario.getId());
		}

		sql.append(" and a.funcionalidade.id = " + funcionalidade.getId());
		sql.append(" order by a.descricao ");

		List lstAjuda = ajudaDao.query(sql.toString());

		if (lstAjuda == null || lstAjuda.isEmpty()) {
			return null;
		}

		return (Ajuda) lstAjuda.get(0);
	}

	/**
	 * Consulta ajuda a partir de texto informado
	 * 
	 * @param funcionario
	 * @param texto
	 * @return
	 * @throws DaoException
	 */
	public List consultaTextoAjuda(final Funcionario funcionario,
			final String texto) throws DaoException {

		StringBuffer sql = new StringBuffer();

		sql.append(" select a from Ajuda as a ");

		if (funcionario != null) {
			sql.append(" , Funcionario as f ");
		}

		sql.append(" where a.tipo in ('" + Ajuda.TIPO_AMBOS + "','"
				+ Ajuda.TIPO_CONTEUDO + "' )");

		if (funcionario == null) {
			sql.append(" and a.grupo = " + Ajuda.GRUPO_GERAL);
		} else {
			sql.append(" and a.funcionalidade in elements(f.listaFuncionalidade) and f.id = "
					+ funcionario.getId());
		}

		sql.append(" and a.descricao LIKE '%" + Utilitario.trataPlic(texto)
				+ "%'");

		sql.append(" order by a.descricao ");

		return ajudaDao.query(sql.toString());
	}

}