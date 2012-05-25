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
package br.gov.serpro.ouvidoria.dao.hibernate;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Criterion;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import br.gov.serpro.ouvidoria.dao.Dao;
import br.gov.serpro.ouvidoria.dao.DaoException;
import br.gov.serpro.ouvidoria.model.Identifiable;
import br.gov.serpro.ouvidoria.util.Constants;
import br.gov.serpro.ouvidoria.util.HibernateSessionFactory;

/**
 * 
 * Objetivo: Implementar a interface Dao para o Hibernate.
 * 
 * @author SERPRO
 * @version $Revision: 1.1.2.3 $, $Date: 2011/10/19 20:36:56 $
 * @version 0.1, Date: 2004/12/27
 */
public class HibernateDao implements Dao {

	private static final long serialVersionUID = 1L;

	private final Log log = LogFactory.getLog(HibernateDao.class);

	private Class clazz;

	/**
	 * Construtor do HibernateDao.
	 * 
	 * Pega uma sessão usando o HibernateSessionFactory.
	 * 
	 * @see br.gov.serpro.ouvidoria.util.HibernateSessionFactory
	 */
	public HibernateDao(Class clazz) {
		this.clazz = clazz;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see br.gov.serpro.ouvidoria.dao.Dao#save(br.gov.serpro.ouvidoria.model.Identifiable)
	 */
	public void save(Identifiable object) throws DaoException {

		if (object == null) {
			throw new DaoException("Tentativa de persistir um Objeto nulo.");
		}

		Transaction trans = null;
		try {

			Session session = HibernateSessionFactory.getFactory().getSession();
			trans = session.beginTransaction();
			session.saveOrUpdate(object);
			session.flush();
			trans.commit();

		} catch (HibernateException e) {

			try {
				System.out.println(e.getMessage());
				trans.rollback();
			} catch (HibernateException e1) {
				log.error(e1);
			}

			log.error(e);
			String errorMessage = e.getMessage();
			if (e.getCause() != null && e.getCause().getMessage() != null) {
				errorMessage = e.getCause().getMessage();
			}
			// fecha-se a sessão.
			HibernateSessionFactory.getFactory().closeSession();
			throw new DaoException("DAO SAVE ERROR: " + errorMessage, e);
		}
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see br.gov.serpro.ouvidoria.dao.Dao#delete(br.gov.serpro.ouvidoria.model.Identifiable)
	 */
	public void delete(Identifiable object) throws DaoException {

		if (object == null) {
			throw new DaoException("Tentado excluir um Objeto nulo.");
		}

		try {
			Session session = HibernateSessionFactory.getFactory().getSession();
			Transaction trans = session.beginTransaction();
			session.delete(object);
			trans.commit();
		} catch (HibernateException e) {
			String errorMessage = e.getMessage();
			if (e.getCause() != null && e.getCause().getMessage() != null) {
				errorMessage = e.getCause().getMessage();
			}
			throw new DaoException("DAO DELETE ERROR: " + errorMessage, e);
		}
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see br.gov.serpro.ouvidoria.dao.Dao#delete(java.lang.Long)
	 */
	public void delete(Long id) throws DaoException {

		if (id == null) {
			throw new DaoException("ID do Objeto não pode ser nulo.");
		}

		delete((Identifiable) get(id));
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see br.gov.serpro.ouvidoria.dao.Dao#get(java.lang.Long)
	 */
	public Object get(Long id) throws DaoException {
		if (id == null) {
			throw new DaoException("ID do Objeto não pode ser nulo.");
		}
		Session session = HibernateSessionFactory.getFactory().getSession();
		try {
			if (Constants.DEBUG) {
				System.out.println("\n***** OBTENDO " + this.clazz.getName()
						+ " DE ID=" + id + " *****");
			}

			Object obj = session.get(this.clazz, id);
			return obj;
		} catch (HibernateException e) {
			String errorMessage = e.getMessage();
			if (e.getCause() != null && e.getCause().getMessage() != null) {
				errorMessage = e.getCause().getMessage();
			}
			throw new DaoException("DAO GET ERROR: " + errorMessage, e);
		}
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see br.gov.serpro.ouvidoria.dao.Dao#find(java.lang.Object)
	 */
	public List find(Object[] criteria) throws DaoException {

		if (criteria == null || criteria.length == 0) {
			throw new DaoException("Critério de busca não pode ser nulo.");
		}

		Session session = HibernateSessionFactory.getFactory().getSession();
		try {

			Criteria crit = session.createCriteria(this.clazz);

			for (int i = 0; i < criteria.length; i++) {
				crit.add((Criterion) criteria[i]);
			}
			List list = crit.list();
			return list;
		} catch (HibernateException e) {
			String errorMessage = e.getMessage();
			if (e.getCause() != null && e.getCause().getMessage() != null) {
				errorMessage = e.getCause().getMessage();
			}
			throw new DaoException("DAO FIND ERROR: " + errorMessage, e);
		}
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see br.gov.serpro.ouvidoria.dao.Dao#list()
	 */
	public List list() throws DaoException {

		Session session = HibernateSessionFactory.getFactory().getSession();

		try {

			Query query = session.createQuery("from " + this.clazz.getName());

			List list = query.list();
			return list;
		} catch (HibernateException e) {
			String errorMessage = e.getMessage();
			if (e.getCause() != null && e.getCause().getMessage() != null) {
				errorMessage = e.getCause().getMessage();
			}
			throw new DaoException("DAO LIST ERROR: " + errorMessage, e);
		}
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see br.gov.serpro.ouvidoria.dao.Dao#query(java.lang.String)
	 */
	public List query(String textoHql) throws DaoException {
		return query(textoHql, -1, -1);
	}

	/**
	 * Executa uma consulta, especificando a quantidade máxima de registros a
	 * ser devolvida e a posição do registro a partir de onde o restante será
	 * obtido.
	 * 
	 * IMPORTANTE: a posição do registro inicial deve ser maior ou igual a zero
	 * (posRegistroInicial >= 0) e a quantidade máxima de registros a ser
	 * devolvida deve ser maior que zero (maxRegistros > 0); caso contrário,
	 * esses argumentos não terão efeito sobre a query.
	 * 
	 * @param textoHql
	 *            texto da query em formato HQL (Hibernate).
	 * @param posRegistroInicial
	 *            posição do registro inicial.
	 * @param maxRegistros
	 *            quantidade máxima de registros a obter a partir do registro
	 *            inicial.
	 */
	public List query(String textoHql, int posRegistroInicial, int maxRegistros)
			throws DaoException {
		// obter a sessão do Hibernate
		Session session = HibernateSessionFactory.getFactory().getSession();

		try {
			if (Constants.DEBUG) {
				System.out
						.println("################## EXECUTANDO QUERY ################");
				System.out.println(textoHql);
			}

			// criar o objeto Query
			Query query = session.createQuery(textoHql);

			// indicar a posição do primeiro registro a ser devolvido
			if (posRegistroInicial >= 0) {
				query.setFirstResult(posRegistroInicial * maxRegistros);
			}

			// indicar a quantidade máxima de registros a ser buscada
			if (maxRegistros > 0) {
				query.setMaxResults(maxRegistros);
			}

			// executar a query
			List resultados = query.list();

			if (Constants.DEBUG) {
				System.out
						.println("################## TERMINOU A QUERY ################");
			}

			return resultados;
		} catch (HibernateException e) {
			String errorMessage = e.getMessage();
			if (e.getCause() != null && e.getCause().getMessage() != null) {
				errorMessage = e.getCause().getMessage();
			}
			throw new DaoException("DAO QUERY ERROR: " + errorMessage, e);
		}
	}

	public List query(Query query) throws DaoException {
		return query(query, -1, -1);
	}

	/**
	 * Executa uma consulta, especificando a quantidade máxima de registros a
	 * ser devolvida e a posição do registro a partir de onde o restante será
	 * obtido.
	 * 
	 * IMPORTANTE: a posição do registro inicial deve ser maior ou igual a zero
	 * (posRegistroInicial >= 0) e a quantidade máxima de registros a ser
	 * devolvida deve ser maior que zero (maxRegistros > 0); caso contrário,
	 * esses argumentos não terão efeito sobre a query.
	 * 
	 * @param query
	 *            query do Hibernate.
	 * @param posRegistroInicial
	 *            posição do registro inicial.
	 * @param maxRegistros
	 *            quantidade máxima de registros a obter a partir do registro
	 *            inicial.
	 */
	public List query(Query query, int posRegistroInicial, int maxRegistros)
			throws DaoException {

		try {
			if (Constants.DEBUG) {
				System.out
						.println("################## EXECUTANDO QUERY ################");
				System.out.println(query.getQueryString());
			}

			// indicar a posição do primeiro registro a ser devolvido
			if (posRegistroInicial >= 0) {
				query.setFirstResult(posRegistroInicial * maxRegistros);
			}

			// indicar a quantidade máxima de registros a ser buscada
			if (maxRegistros > 0) {
				query.setMaxResults(maxRegistros);
			}

			// executar a query
			List resultados = query.list();

			if (Constants.DEBUG) {
				System.out
						.println("################## TERMINOU A QUERY ################");
			}

			return resultados;
		} catch (HibernateException e) {
			String errorMessage = e.getMessage();
			if (e.getCause() != null && e.getCause().getMessage() != null) {
				errorMessage = e.getCause().getMessage();
			}
			throw new DaoException("DAO QUERY ERROR: " + errorMessage, e);
		}
	}

}
