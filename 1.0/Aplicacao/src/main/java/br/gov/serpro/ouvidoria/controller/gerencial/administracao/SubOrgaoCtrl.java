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
import br.gov.serpro.ouvidoria.model.Orgao;
import br.gov.serpro.ouvidoria.model.SubOrgao;

/**
 * SubOrgaoCtrl
 * 
 * Objetivo: Funcionalidades CRUD de Sub-Órgão
 * 
 * @author SERPRO
 * @version $Revision: 1.1.2.3 $, $Date: 2011/10/19 18:18:09 $
 * @version 0.1, Date: 2004/12/27
 */
public class SubOrgaoCtrl {

	private Dao orgaoDao;

	private Dao subOrgaoDao;

	/**
	 * Construtor recebendo objeto Dao
	 * 
	 * @param daoFactory
	 */
	public SubOrgaoCtrl(final DaoFactory daoFactory) {
		orgaoDao = daoFactory.create(Orgao.class);
		subOrgaoDao = daoFactory.create(SubOrgao.class);
	}

	/**
	 * Obtém a entidade à partir do ID recebido como parâmetro
	 * 
	 * @param id
	 * @return
	 * @throws DaoException
	 */
	public SubOrgao get(final Long id) throws DaoException {
		if (id == null) {
			throw new DaoException("ID do Objeto não pode ser nulo.");
		}
		return (SubOrgao) subOrgaoDao.get(id);
	}

	/**
	 * Salva a entidade recebida como parâmetro
	 * 
	 * @param subOrgao
	 * @throws DaoException
	 */
	public void save(Orgao orgao, final SubOrgao subOrgao) throws DaoException {

		if (orgao == null) {
			throw new DaoException("Orgao não pode ser nulo.");
		}

		if (subOrgao == null) {
			throw new DaoException("Orgao não pode ser nulo.");
		}

		subOrgaoDao.save(subOrgao);

		orgao.getListaSubOrgao().remove(subOrgao);
		orgao.getListaSubOrgao().add(subOrgao);

		orgaoDao.save(orgao);
	}

	/**
	 * Insere a entidade no banco utilizando as informações recebidas como
	 * parâmetro
	 * 
	 * @param orgao
	 * @param descricao
	 * @param dataInicioVigencia
	 * @param dataFimVigencia
	 * @throws DaoException
	 */
	public void insert(Orgao orgao, final String descricao,
			final Timestamp dataInicioVigencia, final Timestamp dataFimVigencia)
			throws DaoException {

		SubOrgao subOrgao = new SubOrgao();

		subOrgao.setDataCadastramento(new Timestamp(System.currentTimeMillis()));

		subOrgao.setDataInicioOperacao(orgao.getDataInicioOperacao());
		subOrgao.setDataFimOperacao(orgao.getDataFimOperacao());

		subOrgao.setDataInicioCadastramento(orgao.getDataInicioCadastramento());
		subOrgao.setDataFimCadastramento(orgao.getDataFimCadastramento());

		subOrgao.setDataInicioVigencia(dataInicioVigencia);
		subOrgao.setDataFimVigencia(dataFimVigencia);

		subOrgao.setDescricao(descricao);

		subOrgao.setOrgao(orgao);

		save(orgao, subOrgao);
	}

	/**
	 * Atualiza a entidade no banco utilizando as informações recebidas como
	 * parâmetro
	 * 
	 * @param orgao
	 * @param id
	 * @param descricao
	 * @param dataInicioVigencia
	 * @param dataFimVigencia
	 * @throws DaoException
	 */
	public void update(Orgao orgao, final String id, final String descricao,
			final Timestamp dataInicioVigencia, final Timestamp dataFimVigencia)
			throws DaoException {

		if (orgao == null) {
			throw new DaoException("Orgao não pode ser nulo.");
		}

		if (id == null) {
			throw new DaoException("ID do Objeto não pode ser nulo.");
		}

		SubOrgao subOrgao = get(new Long(id));
		subOrgao.setDescricao(descricao);
		subOrgao.setDataInicioVigencia(dataInicioVigencia);
		subOrgao.setDataFimVigencia(dataFimVigencia);
		save(orgao, subOrgao);
	}

	/**
	 * Deleta a entidade do banco à partir das informações recebidas como
	 * parâmetro
	 * 
	 * @param id
	 * @param dataFimVigencia
	 * @throws DaoException
	 */
	public void delete(Orgao orgao, final String id,
			final Timestamp dataFimVigencia) throws DaoException {

		if (orgao == null) {
			throw new DaoException("Orgao não pode ser nulo.");
		}

		if (id == null) {
			throw new DaoException("ID do Objeto não pode ser nulo.");
		}

		SubOrgao subOrgao = get(new Long(id));
		subOrgao.setDataFimVigencia(dataFimVigencia);
		save(orgao, subOrgao);
	}

	/**
	 * Obtém uma lista de objetos da entidade à partir do parâmetro
	 * 
	 * @param orgao
	 * @return
	 * @throws DaoException
	 */
	public SortedSet list(final Orgao orgao) {

		SortedSet query = new TreeSet(new Comparator() {
			public int compare(Object obj1, Object obj2) {
				return ((SubOrgao) obj1).getDescricao().compareTo(
						((SubOrgao) obj2).getDescricao());
			}
		});

		final Timestamp agora = new Timestamp(System.currentTimeMillis());

		for (Iterator iter = orgao.getListaSubOrgao().iterator(); iter
				.hasNext();) {
			SubOrgao subOrgao = (SubOrgao) iter.next();
			if (subOrgao.getDataFimVigencia() == null
					|| subOrgao.getDataFimVigencia().after(agora)) {
				query.add(subOrgao);
			}
		}

		return query;
	}

	/**
	 * Obtém uma lista de todos os sub-órgãos de um determinado órgão.
	 * 
	 * @param orgao
	 * @return
	 * @throws DaoException
	 */
	public SortedSet listarTodosSubOrgaos(final Orgao orgao) {

		SortedSet query = new TreeSet(new Comparator() {
			public int compare(Object obj1, Object obj2) {
				return ((SubOrgao) obj1).getDescricao().compareTo(
						((SubOrgao) obj2).getDescricao());
			}
		});

		for (Iterator iter = orgao.getListaTodosSubOrgaos().iterator(); iter
				.hasNext();) {
			SubOrgao subOrgao = (SubOrgao) iter.next();

			query.add(subOrgao);

		}

		return query;
	}

}