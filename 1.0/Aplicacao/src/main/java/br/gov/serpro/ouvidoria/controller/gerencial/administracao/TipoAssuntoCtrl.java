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
package br.gov.serpro.ouvidoria.controller.gerencial.administracao;

import java.sql.Timestamp;
import java.util.Comparator;
import java.util.Iterator;
import java.util.SortedSet;
import java.util.TreeSet;

import br.gov.serpro.ouvidoria.dao.Dao;
import br.gov.serpro.ouvidoria.dao.DaoException;
import br.gov.serpro.ouvidoria.dao.DaoFactory;
import br.gov.serpro.ouvidoria.model.Assunto;
import br.gov.serpro.ouvidoria.model.Instituicao;
import br.gov.serpro.ouvidoria.model.Orgao;

/**
 * TipoAssuntoCtrl
 * 
 * Objetivo: Funcionalidades CRUD de Assuntos
 * 
 * @author SERPRO
 * @version $Revision: 1.1.2.4 $, $Date: 2011/10/19 18:18:09 $
 * @version 0.1, Date: 2004/12/27
 */
public class TipoAssuntoCtrl {

	private Dao orgaoDao;

	private Dao defaultDao;

	/**
	 * Construtor recebendo objeto Dao
	 * 
	 * @param daoFactory
	 */
	public TipoAssuntoCtrl(final DaoFactory daoFactory) {
		orgaoDao = daoFactory.create(Orgao.class);
		defaultDao = daoFactory.create(Assunto.class);
	}

	public Assunto get(final Long id) throws DaoException {
		if (id == null) {
			throw new DaoException("ID do Objeto não pode ser nulo.");
		}
		return (Assunto) defaultDao.get(id);
	}

	public void save(Orgao orgao, Instituicao instituicao, final Assunto object)
			throws DaoException {

		if (orgao == null) {
			throw new DaoException("Órgão não pode ser nulo.");
		}

		if (instituicao == null) {
			throw new DaoException("Instituição não pode ser nulo.");
		}

		if (object == null) {
			throw new DaoException("Assunto não pode ser nulo.");
		}

		defaultDao.save(object);

		if (orgao.getListaAssunto() == null) {
			orgao.setListaAssunto(new TreeSet());
		}
		orgao.getListaAssunto().remove(object);
		orgao.getListaAssunto(Assunto.ATIVO).add(object);

		orgaoDao.save(orgao);
	}

	/**
	 * Método que faz a inserção de um objeto à partir dos parâmetros
	 * informados.
	 * 
	 * @param orgao
	 * @param instituicao
	 * @param descricao
	 * @param descricaoDetalhada
	 * @param prazoInterno
	 * @param prazoExterno
	 * @param vigencia
	 * @throws DaoException
	 */
	public void insert(Orgao orgao, Instituicao instituicao,
			final String descricao, String descricaoDetalhada,
			final Integer prazoInterno, final Integer prazoExterno,
			final Timestamp vigencia) throws DaoException {

		if (instituicao == null) {
			throw new DaoException("Órgão não pode ser nulo.");
		}

		Assunto object = new Assunto();

		object.setDataCadastramento(new Timestamp(System.currentTimeMillis()));
		object.setDescricao(descricao);
		object.setDescricaoDetalhada(descricaoDetalhada);
		object.setPrazoInterno(prazoInterno);
		object.setPrazoExterno(prazoExterno);
		object.setDataVigencia(vigencia);
		object.setInstituicao(instituicao);

		save(orgao, instituicao, object);
	}

	/**
	 * Método que faz a atualização de um objeto à partir dos parâmetros
	 * informados.
	 * 
	 * @param orgao
	 * @param instituicao
	 * @param id
	 * @param descricao
	 * @param descricaoDetalhada
	 * @param prazoInterno
	 * @param prazoExterno
	 * @param vigencia
	 * @throws DaoException
	 */
	public void update(Orgao orgao, Instituicao instituicao, final String id,
			final String descricao, String descricaoDetalhada,
			final Integer prazoInterno, final Integer prazoExterno,
			final Timestamp vigencia) throws DaoException {

		if (instituicao == null) {
			throw new DaoException("Órgão não pode ser nulo.");
		}

		if (id == null) {
			throw new DaoException("ID do Objeto não pode ser nulo.");
		}

		Assunto object = get(new Long(id));
		object.setDescricao(descricao);
		object.setDescricaoDetalhada(descricaoDetalhada);
		object.setPrazoInterno(prazoInterno);
		object.setPrazoExterno(prazoExterno);
		object.setDataVigencia(vigencia);
		object.setInstituicao(instituicao);

		save(orgao, instituicao, object);
	}

	/**
	 * Método que deleta um objeto à partir dos parâmetros informados.
	 * 
	 * @param orgao
	 * @param id
	 * @param dataVigencia
	 * @throws DaoException
	 */
	public void delete(Orgao orgao, Instituicao instituicao, final String id,
			final Timestamp dataVigencia) throws DaoException {

		if (instituicao == null) {
			throw new DaoException("Órgão não pode ser nulo.");
		}

		if (id == null) {
			throw new DaoException("ID do Objeto não pode ser nulo.");
		}

		Assunto object = get(new Long(id));

		object.setDataVigencia(dataVigencia);

		save(orgao, instituicao, object);
	}

	public SortedSet list(final Orgao orgao) {

		if (orgao == null) {
			throw new NullPointerException();
		}

		if (orgao.getListaTodosAssuntos() == null) {
			return new TreeSet();
		}

		SortedSet query = new TreeSet(new Comparator() {
			public int compare(Object obj1, Object obj2) {
				return ((Assunto) obj1).getId().compareTo(
						((Assunto) obj2).getId());
			}
		});

		final Timestamp agora = new Timestamp(System.currentTimeMillis());

		for (Iterator iter = orgao.getListaAssuntosSubOrgaos().iterator(); iter
				.hasNext();) {
			Assunto Assunto = (Assunto) iter.next();
			if (Assunto.getDataVigencia() == null
					|| Assunto.getDataVigencia().after(agora)) {
				query.add(Assunto);
			}
		}

		return query;
	}

}