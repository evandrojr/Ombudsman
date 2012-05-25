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

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import br.gov.serpro.ouvidoria.dao.Dao;
import br.gov.serpro.ouvidoria.dao.DaoException;
import br.gov.serpro.ouvidoria.dao.DaoFactory;
import br.gov.serpro.ouvidoria.model.Funcionario;
import br.gov.serpro.ouvidoria.util.HibernateSessionFactory;

/**
 * @author SERPRO
 * @version $Revision: 1.1.2.3 $, $Date: 2011/10/19 18:18:10 $
 * @version 0.1, Date: 2004/12/13
 */
public class AdminFuncionario {

	private Dao funcionarioDao;

	public AdminFuncionario(final DaoFactory daoFactory) {
		funcionarioDao = daoFactory.create(Funcionario.class);
	}

	/**
	 * Obtém a entidade à partir do ID recebido como parâmetro
	 * 
	 * @param id
	 * @return
	 * @throws DaoException
	 */
	public Funcionario get(Long id) throws DaoException {
		if (id == null) {
			throw new DaoException("ID do Objeto não pode ser nulo.");
		}
		return (Funcionario) funcionarioDao.get(id);
	}

	/**
	 * Salva a entidade à partir das informações recebidas como parâmetro. 
	 * @param id
	 * @param nome
	 * @param login
	 * @param senha
	 * @throws DaoException
	 */
	public void save(final String id, final String nome, final String login,
			final String senha) throws DaoException {

		Funcionario funcionario = new Funcionario();
		if (id != null && id.trim().length() > 0) {
			funcionario.setId(new Long(id));
		}
		funcionario.setNome(nome);
		funcionario.setLogin(login);
		funcionario.setSenha(senha);
		funcionarioDao.save(funcionario);
	}

	/**
	 * Salva a entidade recebida como parâmetro
	 * @param funcionario
	 * @throws DaoException
	 */
	public void save(final Funcionario funcionario) throws DaoException {
		funcionarioDao.save(funcionario);
	}

	/**
	 * Deleta a entidade do à partir das informações recebidas como parâmetro
	 * @param id
	 * @throws DaoException
	 */
	public void delete(Long id) throws DaoException {
		if (id == null) {
			throw new DaoException("ID do Objeto não pode ser nulo.");
		}
		funcionarioDao.delete(id);
	}

	/**
	 * Obtém uma lista de objetos da entidade
	 * 
	 * @return
	 */
	public List list() throws DaoException {
		return funcionarioDao.list();
	}

	public Funcionario find(final Long id) throws DaoException {

		Session session = HibernateSessionFactory.getFactory().getSession();
		try {

			List lista = session.createQuery(
					"from Funcionario as func where func.funcExt = " + id)
					.list();
			if (lista != null && !lista.isEmpty()) {
				return (Funcionario) lista.get(0);
			}
		} catch (HibernateException e) {
			throw new DaoException(
					"Ocorreu um problema ao tentar recuperar os dados", e);
		}
		return null;

	}
}