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
import br.gov.serpro.ouvidoria.model.TipoMensagem;

/**
 * TipoMensagemCtrl
 * 
 * Objetivo: Funcionalidades CRUD de Tipo Mensagem
 * 
 * @author SERPRO
 * @version $Revision: 1.1.2.3 $, $Date: 2011/10/19 18:18:09 $
 * @version 0.1, Date: 2004/12/27
 */
public class TipoMensagemCtrl {

	private Dao orgaoDao;

	private Dao defaultDao;

	/**
	 * Construtor recebendo objeto Dao
	 * 
	 * @param daoFactory
	 */
	public TipoMensagemCtrl(final DaoFactory daoFactory) {
		orgaoDao = daoFactory.create(Orgao.class);
		defaultDao = daoFactory.create(TipoMensagem.class);
	}

	/**
	 * Obtém a entidade à partir do ID recebido como parâmetro
	 * 
	 * @param id
	 * @return
	 * @throws DaoException
	 */
	public TipoMensagem get(final Long id) throws DaoException {
		if (id == null) {
			throw new DaoException("ID do Objeto não pode ser nulo.");
		}
		return (TipoMensagem) defaultDao.get(id);
	}

	/**
	 * Salva a entidade recebida como parâmetro
	 * 
	 * @param orgao
	 * @param object
	 * @throws DaoException
	 */
	public void save(Orgao orgao, final TipoMensagem object)
			throws DaoException {

		if (orgao == null) {
			throw new DaoException("Orgao não pode ser nulo.");
		}

		if (object == null) {
			throw new DaoException("Tipo da Mensagem não pode ser nula.");
		}

		defaultDao.save(object);

		if (orgao.getListaTipoMensagem().contains(object)) {
			orgao.getListaTipoMensagem().remove(object);
		}

		orgao.getListaTipoMensagem().add(object);

		orgaoDao.save(orgao);
	}

	/**
	 * Insere a entidade no banco utilizando as informações recebidas como
	 * parâmetro
	 * 
	 * @param orgao
	 * @param descricao
	 * @param descricaoDetalhada
	 * @param prazoInterno
	 * @param prazoExterno
	 * @param vigencia
	 * @throws DaoException
	 */
	public void insert(Orgao orgao, final String descricao,
			String descricaoDetalhada, final Integer prazoInterno,
			final Integer prazoExterno, final Timestamp vigencia)
			throws DaoException {

		TipoMensagem object = new TipoMensagem();

		object.setDataCadastramento(new Timestamp(System.currentTimeMillis()));
		object.setDescricao(descricao);
		object.setDescricaoDetalhada(descricaoDetalhada);
		object.setPrazoInterno(prazoInterno);
		object.setPrazoExterno(prazoExterno);
		object.setDataVigencia(vigencia);
		object.setOrgao(orgao);

		save(orgao, object);
	}

	/**
	 * Atualiza a entidade no banco utilizando as informações recebidas como
	 * parâmetro
	 * 
	 * @param orgao
	 * @param id
	 * @param descricao
	 * @param descricaoDetalhada
	 * @param prazoInterno
	 * @param prazoExterno
	 * @throws DaoException
	 */
	public void update(Orgao orgao, final String id, final String descricao,
			String descricaoDetalhada, final Integer prazoInterno,
			final Integer prazoExterno, final Timestamp vigencia)
			throws DaoException {

		if (orgao == null) {
			throw new DaoException("Orgao não pode ser nulo.");
		}

		if (id == null) {
			throw new DaoException("ID do Objeto não pode ser nulo.");
		}

		TipoMensagem object = get(new Long(id));
		object.setDescricao(descricao);
		object.setDescricaoDetalhada(descricaoDetalhada);
		object.setPrazoInterno(prazoInterno);
		object.setPrazoExterno(prazoExterno);
		object.setDataVigencia(vigencia);
		object.setOrgao(orgao);
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

		if (orgao == null) {
			throw new DaoException("Orgao não pode ser nulo.");
		}

		if (id == null) {
			throw new DaoException("ID do Objeto não pode ser nulo.");
		}

		TipoMensagem object = get(new Long(id));
		object.setDataVigencia(dataVigencia);
		save(orgao, object);
	}

	/**
	 * Obtém uma lista de objetos da entidade à partir do parâmetro
	 * 
	 * @param orgao
	 * @return
	 * @throws DaoException
	 */
	public SortedSet list(final Orgao orgao) {

		if (orgao == null) {
			throw new NullPointerException();
		}

		if (orgao.getListaTipoMensagem() == null) {
			return new TreeSet();
		}

		SortedSet query = new TreeSet(new Comparator() {
			public int compare(Object obj1, Object obj2) {
				int comp = ((TipoMensagem) obj1).getDescricao().compareTo(
						((TipoMensagem) obj2).getDescricao());

				if (comp == 0) {
					comp = ((TipoMensagem) obj1).getId().compareTo(
							((TipoMensagem) obj2).getId());
				}

				return comp;
			}
		});

		final Timestamp agora = new Timestamp(System.currentTimeMillis());

		for (Iterator iter = orgao.getListaTipoMensagem().iterator(); iter
				.hasNext();) {
			TipoMensagem tipoMensagem = (TipoMensagem) iter.next();
			if (tipoMensagem.getDataVigencia() == null
					|| tipoMensagem.getDataVigencia().after(agora)) {
				query.add(tipoMensagem);
			}
		}

		return query;
	}
}