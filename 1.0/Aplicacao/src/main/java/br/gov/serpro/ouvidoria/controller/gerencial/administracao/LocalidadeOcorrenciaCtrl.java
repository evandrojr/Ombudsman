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
import br.gov.serpro.ouvidoria.model.LocalidadeOcorrencia;
import br.gov.serpro.ouvidoria.model.SubOrgao;

/**
 * SubOrgaoCtrl
 * 
 * Objetivo: Funcionalidades CRUD de LocalidadeOcorrencia
 * 
 * @author SERPRO
 * @version $Revision: 1.1.2.3 $, $Date: 2011/10/19 18:18:09 $
 * @version 0.1, Date: 2004/12/27
 */
public class LocalidadeOcorrenciaCtrl {

	private Dao subOrgaoDao;

	private Dao localidadeOcorrenciaDao;

	/**
	 * Construtor recebendo objeto Dao
	 * 
	 * @param daoFactory
	 */
	public LocalidadeOcorrenciaCtrl(final DaoFactory daoFactory) {
		subOrgaoDao = daoFactory.create(SubOrgao.class);
		localidadeOcorrenciaDao = daoFactory.create(LocalidadeOcorrencia.class);
	}

	/**
	 * Obtém a entidade à partir do ID recebido como parâmetro
	 * 
	 * @param id
	 * @return
	 * @throws DaoException
	 */
	public LocalidadeOcorrencia get(final Long id) throws DaoException {
		if (id == null) {
			throw new DaoException("ID do Objeto não pode ser nulo.");
		}
		return (LocalidadeOcorrencia) localidadeOcorrenciaDao.get(id);
	}

	/**
	 * Salva a entidade recebida como parâmetro
	 * 
	 * @param subOrgao
	 * @throws DaoException
	 */
	public void save(SubOrgao subOrgao,
			final LocalidadeOcorrencia localidadeOcorrencia)
			throws DaoException {

		if (subOrgao == null) {
			throw new DaoException("SubOrgao não pode ser nulo.");
		}

		if (localidadeOcorrencia == null) {
			throw new DaoException("LocalidadeOcorrencia não pode ser nulo.");
		}
		localidadeOcorrenciaDao.save(localidadeOcorrencia);

		subOrgao.getListaLocalidadeOcorrencia().remove(localidadeOcorrencia);
		subOrgao.getListaLocalidadeOcorrencia().add(localidadeOcorrencia);

		subOrgaoDao.save(subOrgao);
	}

	/**
	 * Insere a entidade no banco utilizando as informações recebidas como
	 * parâmetro
	 * 
	 * @param subOrgao
	 * @param descricao
	 * @param vigencia
	 * @throws DaoException
	 */
	public void insert(SubOrgao subOrgao, final String descricao,
			final Timestamp vigencia) throws DaoException {

		LocalidadeOcorrencia localidadeOcorrencia = new LocalidadeOcorrencia();

		localidadeOcorrencia.setDataCadastramento(new Timestamp(System
				.currentTimeMillis()));

		localidadeOcorrencia.setDescricao(descricao);
		localidadeOcorrencia.setDataVigencia(vigencia);
		localidadeOcorrencia.setSubOrgao(subOrgao);

		save(subOrgao, localidadeOcorrencia);
	}

	/**
	 * Atualiza a entidade no banco utilizando as informações recebidas como
	 * parâmetro
	 * 
	 * @param subOrgao
	 * @param id
	 * @param descricao
	 * @param vigencia
	 * @throws DaoException
	 */
	public void update(SubOrgao subOrgao, final String id,
			final String descricao, final Timestamp vigencia)
			throws DaoException {

		if (subOrgao == null) {
			throw new DaoException("SubOrgao não pode ser nulo.");
		}

		if (id == null) {
			throw new DaoException("ID do Objeto não pode ser nulo.");
		}

		LocalidadeOcorrencia localidadeOcorrencia = get(new Long(id));
		localidadeOcorrencia.setDescricao(descricao);
		localidadeOcorrencia.setDataVigencia(vigencia);

		save(subOrgao, localidadeOcorrencia);
	}

	/**
	 * Deleta a entidade do à partir das informações recebidas como parâmetro
	 * 
	 * @param subOrgao
	 * @param id
	 * @param dataVigencia
	 * @throws DaoException
	 */
	public void delete(SubOrgao subOrgao, final String id,
			final Timestamp dataVigencia) throws DaoException {

		if (subOrgao == null) {
			throw new DaoException("SubOrgao não pode ser nulo.");
		}

		if (id == null) {
			throw new DaoException("ID do Objeto não pode ser nulo.");
		}

		LocalidadeOcorrencia localidadeOcorrencia = get(new Long(id));
		localidadeOcorrencia.setDataVigencia(dataVigencia);
		save(subOrgao, localidadeOcorrencia);
	}

	/**
	 * Obtém uma lista de objetos da entidade à partir do parâmetro
	 * 
	 * @param subOrgao
	 * @return
	 */
	public SortedSet list(final SubOrgao subOrgao) {

		SortedSet query = new TreeSet(new Comparator() {
			public int compare(Object obj1, Object obj2) {
				return ((LocalidadeOcorrencia) obj1).getDescricao().compareTo(
						((LocalidadeOcorrencia) obj2).getDescricao());
			}
		});

		final Timestamp agora = new Timestamp(System.currentTimeMillis());
		for (Iterator iter = subOrgao.getListaLocalidadeOcorrencia().iterator(); iter
				.hasNext();) {
			LocalidadeOcorrencia localidadeOcorrencia = (LocalidadeOcorrencia) iter
					.next();

			if (localidadeOcorrencia.getDataVigencia() == null
					|| localidadeOcorrencia.getDataVigencia().after(agora)) {
				query.add(localidadeOcorrencia);
			}

		}

		return query;
	}

}