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
import br.gov.serpro.ouvidoria.model.TipoAvaliacaoResposta;

/**
 * TipoAvaliacaoRespostaCtrl
 * 
 * @author SERPRO
 * @version $Revision: 1.1.2.3 $, $Date: 2011/10/19 18:18:09 $
 * @version 0.1, Date: 2005/01/07
 */
public class TipoAvaliacaoRespostaCtrl {

	private Dao defaultDao;

	private Dao orgaoDao;

	/**
	 * Construtor recebendo objeto Dao
	 * 
	 * @param daoFactory
	 */
	public TipoAvaliacaoRespostaCtrl(final DaoFactory daoFactory) {
		defaultDao = daoFactory.create(TipoAvaliacaoResposta.class);
		orgaoDao = daoFactory.create(Orgao.class);

	}

	/**
	 * Obtém a entidade à partir do ID recebido como parâmetro
	 * 
	 * @param id
	 * @return
	 * @throws DaoException
	 */
	public TipoAvaliacaoResposta get(final Long id) throws DaoException {
		if (id == null) {
			throw new DaoException("ID do Objeto não pode ser nulo.");
		}
		return (TipoAvaliacaoResposta) defaultDao.get(id);
	}

	/**
	 * Obtém uma lista de objetos da entidade à partir do parâmetro
	 * 
	 * @param orgao
	 * @return
	 */
	public SortedSet list(final Orgao orgao) {

		SortedSet query = new TreeSet(new Comparator() {
			public int compare(Object obj1, Object obj2) {
				return ((TipoAvaliacaoResposta) obj1).getId().compareTo(
						((TipoAvaliacaoResposta) obj2).getId());
			}
		});

		final Timestamp agora = new Timestamp(System.currentTimeMillis());

		for (Iterator iter = orgao.getListaTipoAvaliacaoResposta().iterator(); iter
				.hasNext();) {
			TipoAvaliacaoResposta tipoAvaliacaoResposta = (TipoAvaliacaoResposta) iter
					.next();
			if (tipoAvaliacaoResposta.getDataVigencia() == null
					|| tipoAvaliacaoResposta.getDataVigencia().after(agora)) {
				query.add(tipoAvaliacaoResposta);
			}
		}
		return query;
	}

	/**
	 * Salva a entidade recebida como parâmetro
	 * 
	 * @param orgao
	 * @param object
	 * @throws DaoException
	 */
	public void save(Orgao orgao, final TipoAvaliacaoResposta object)
			throws DaoException {

		if (orgao == null) {
			throw new DaoException("Orgao não pode ser nulo.");
		}

		if (object == null) {
			throw new DaoException("TipoAvaliacaoResposta não pode ser nulo.");
		}

		defaultDao.save(object);

		orgao.getListaTipoAvaliacaoResposta().remove(object);
		orgao.getListaTipoAvaliacaoResposta().add(object);

		orgaoDao.save(orgao);
	}

	/**
	 * Atualiza a entidade no banco utilizando as informações recebidas como
	 * parâmetro
	 * 
	 * @param orgao
	 * @param id
	 * @param descricao
	 * @param vigencia
	 * @param tipoAvaliacao
	 * @throws DaoException
	 */
	public void update(Orgao orgao, final String id, final String descricao,
			final Timestamp vigencia, final String tipoAvaliacao)
			throws DaoException {

		if (id == null) {
			throw new DaoException("ID do Objeto não pode ser nulo.");
		}

		TipoAvaliacaoResposta object = get(new Long(id));
		object.setDescricao(descricao);
		object.setDataVigencia(vigencia);
		object.setTipoAvaliacao(tipoAvaliacao);

		save(orgao, object);
	}

	/**
	 * Insere a entidade no banco utilizando as informações recebidas como
	 * parâmetro
	 * 
	 * @param orgao
	 * @param descricao
	 * @param vigencia
	 * @param tipoAvaliacao
	 * @throws DaoException
	 */
	public void insert(Orgao orgao, final String descricao,
			final Timestamp vigencia, final String tipoAvaliacao)
			throws DaoException {

		TipoAvaliacaoResposta object = new TipoAvaliacaoResposta();

		object.setDataCadastramento(new Timestamp(System.currentTimeMillis()));
		object.setDescricao(descricao);
		object.setDataVigencia(vigencia);
		object.setTipoAvaliacao(tipoAvaliacao);

		save(orgao, object);
	}

	/**
	 * Deleta a entidade do à partir das informações recebidas como parâmetro
	 * 
	 * @param orgao
	 * @param id
	 * @param dataVigencia
	 * @throws DaoException
	 */
	public void delete(Orgao orgao, final String id,
			final Timestamp dataVigencia) throws DaoException {

		if (id == null) {
			throw new DaoException("ID do Objeto não pode ser nulo.");
		}

		TipoAvaliacaoResposta object = get(new Long(id));

		object.setDataVigencia(dataVigencia);

		save(orgao, object);
	}

}