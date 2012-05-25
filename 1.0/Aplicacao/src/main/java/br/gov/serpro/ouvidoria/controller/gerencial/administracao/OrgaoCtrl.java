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
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.TreeSet;

import org.hibernate.criterion.Expression;

import br.gov.serpro.ouvidoria.dao.Dao;
import br.gov.serpro.ouvidoria.dao.DaoException;
import br.gov.serpro.ouvidoria.dao.DaoFactory;
import br.gov.serpro.ouvidoria.dao.hibernate.HibernateDaoFactory;
import br.gov.serpro.ouvidoria.model.Assunto;
import br.gov.serpro.ouvidoria.model.Orgao;
import br.gov.serpro.ouvidoria.util.Constants;
import br.gov.serpro.ouvidoria.util.Utilitario;

/**
 * Objetivo: Funcionalidades CRUD de órgão
 * 
 * @author SERPRO
 * @version $Revision: 1.1.2.4 $, $Date: 2011/10/19 18:18:09 $
 * @version 0.1, Date: 2005/01/03
 */
public class OrgaoCtrl {

	private Dao orgaoDao;

	private Dao assuntoDao;

	/**
	 * Construtor default
	 */
	public OrgaoCtrl() {
		// Construtor default
	}

	/**
	 * Construtor recebendo objeto Dao
	 * 
	 * @param daoFactory
	 */
	public OrgaoCtrl(final DaoFactory daoFactory) {
		orgaoDao = daoFactory.create(Orgao.class);
		assuntoDao = daoFactory.create(Assunto.class);
	}

	/**
	 * Obtém a entidade à partir do ID recebido como parâmetro
	 * 
	 * @param id
	 * @return
	 * @throws DaoException
	 */
	public Orgao get(final Long id) throws DaoException {

		if (id == null) {
			throw new DaoException("ID do Objeto não pode ser nulo.");
		}

		final Orgao orgao = (Orgao) orgaoDao.get(id);

		if (orgao == null) {
			return null;
		}

		return orgao;
	}

	/**
	 * Obtém a entidade à partir do ID da Sessão recebido como parâmetro
	 * 
	 * @param id
	 * @return
	 * @throws DaoException
	 */
	public Orgao get(String osessionid) {

		Orgao orgao = null;

		try {
			String orgaoId = null;
			if (Constants.DEBUG) {
				orgaoId = "47";
			} else {
				orgaoId = new String(Utilitario.decrypt(Constants.DES_KEY,
						osessionid));
			}

			orgao = this.get(new Long(orgaoId));
		} catch (NumberFormatException e) {
			if (Constants.DEBUG) {
				e.printStackTrace(System.out);
			}
		} catch (DaoException e) {
			if (Constants.DEBUG) {
				e.printStackTrace(System.out);
			}
		} catch (RuntimeException e) {
			if (Constants.DEBUG) {
				e.printStackTrace(System.out);
			}
		}
		return orgao;
	}

	/**
	 * Obtém uma lista de objetos da entidade à partir do parâmetro
	 * 
	 * @return
	 */
	public List list() throws DaoException {
		return orgaoDao.list();
	}

	public List listarOrgaosAtivos() throws DaoException {

		Object[] criteria = new Object[1];
		criteria[0] = Expression.eq("statusOrgao", Orgao.ATIVO);
		List orgaos = orgaoDao.find(criteria);

		class OrgaoComparator implements Comparator {
			public final int compare(Object a, Object b) {
				return (((Orgao) a).getDescricao()).compareTo((((Orgao) b)
						.getDescricao()));
			} // end compare
		}

		Collections.sort(orgaos, new OrgaoComparator());

		return orgaos;

	}

	/**
	 * Insere a entidade no banco utilizando as informações recebidas como
	 * parâmetro
	 * 
	 * @param descricao
	 * @param gestorResponsavel
	 * @param codigoPaisTelefoneResponsavel
	 * @param codigoCidadeTelefoneResponsavel
	 * @param telefoneContatoGestor
	 * @param statusOrgao
	 * @param dataInicioCadastramento
	 * @param dataFimCadastramento
	 * @param dataInicioOperacao
	 * @param dataFimOperacao
	 * @param dataInicioAcionamento
	 * @param dataFimAcionamento
	 * @param dataInicioConsultaResposta
	 * @param dataFimConsultaResposta
	 * @throws DaoException
	 */
	public void insert(final String descricao, final String gestorResponsavel,
			final String codigoPaisTelefoneResponsavel,
			final String codigoCidadeTelefoneResponsavel,
			final String telefoneContatoGestor, final String statusOrgao,
			final Timestamp dataInicioCadastramento,
			final Timestamp dataFimCadastramento,
			final Timestamp dataInicioOperacao,
			final Timestamp dataFimOperacao,
			final Timestamp dataInicioAcionamento,
			final Timestamp dataFimAcionamento,
			final Timestamp dataInicioConsultaResposta,
			final Timestamp dataFimConsultaResposta) throws DaoException {

		Orgao orgao = new Orgao();

		orgao.setDescricao(descricao);
		orgao.setGestorResponsavel(gestorResponsavel);
		orgao.setCodigoPaisTelefoneResponsavel(codigoPaisTelefoneResponsavel);
		orgao.setCodigoCidadeTelefoneResponsavel(codigoCidadeTelefoneResponsavel);
		orgao.setTelefoneContatoGestor(telefoneContatoGestor);
		orgao.setStatusOrgao(statusOrgao);
		orgao.setDataInicioCadastramento(dataInicioCadastramento);
		orgao.setDataFimCadastramento(dataFimCadastramento);
		orgao.setDataInicioOperacao(dataInicioOperacao);
		orgao.setDataFimOperacao(dataFimOperacao);
		orgao.setDataInicioAcionamento(dataInicioAcionamento);
		orgao.setDataFimAcionamento(dataFimAcionamento);
		orgao.setDataInicioConsultaResposta(dataInicioConsultaResposta);
		orgao.setDataFimConsultaResposta(dataFimConsultaResposta);
		orgao.setDataCadastramento(new Timestamp(System.currentTimeMillis()));
		orgao.setListaAssunto(new TreeSet());
		orgaoDao.save(orgao);

		Assunto assunto = new Assunto();
		assunto.setDataCadastramento(new Timestamp(System.currentTimeMillis()));
		assunto.setDescricao("Assunto Geral");
		assunto.setDescricaoDetalhada("Assunto geral para este órgão");
		assunto.setPrazoInterno(null);
		assunto.setPrazoExterno(null);
		assunto.setDataVigencia(null);
		assunto.setInstituicao(orgao);
		assuntoDao.save(assunto);

		orgao.getListaAssunto().add(assunto);
		orgaoDao.save(orgao);

	}

	/**
	 * Atualiza a entidade no banco utilizando as informações recebidas como
	 * parâmetro
	 * 
	 * @param id
	 * @param descricao
	 * @param gestorResponsavel
	 * @param codigoPaisTelefoneResponsavel
	 * @param codigoCidadeTelefoneResponsavel
	 * @param telefoneContatoGestor
	 * @param statusOrgao
	 * @param dataInicioCadastramento
	 * @param dataFimCadastramento
	 * @param dataInicioOperacao
	 * @param dataFimOperacao
	 * @param dataInicioAcionamento
	 * @param dataFimAcionamento
	 * @param dataInicioConsultaResposta
	 * @param dataFimConsultaResposta
	 * @throws DaoException
	 */
	public void update(final String id, final String descricao,
			final String gestorResponsavel,
			final String codigoPaisTelefoneResponsavel,
			final String codigoCidadeTelefoneResponsavel,
			final String telefoneContatoGestor, final String statusOrgao,
			final Timestamp dataInicioCadastramento,
			final Timestamp dataFimCadastramento,
			final Timestamp dataInicioOperacao,
			final Timestamp dataFimOperacao,
			final Timestamp dataInicioAcionamento,
			final Timestamp dataFimAcionamento,
			final Timestamp dataInicioConsultaResposta,
			final Timestamp dataFimConsultaResposta) throws DaoException {

		if (id == null) {
			throw new DaoException("ID do Objeto não pode ser nulo.");
		}

		Orgao orgao = get(new Long(id));
		orgao.setDescricao(descricao);
		orgao.setGestorResponsavel(gestorResponsavel);
		orgao.setCodigoPaisTelefoneResponsavel(codigoPaisTelefoneResponsavel);
		orgao.setCodigoCidadeTelefoneResponsavel(codigoCidadeTelefoneResponsavel);
		orgao.setTelefoneContatoGestor(telefoneContatoGestor);
		orgao.setStatusOrgao(statusOrgao);
		orgao.setDataInicioCadastramento(dataInicioCadastramento);
		orgao.setDataFimCadastramento(dataFimCadastramento);
		orgao.setDataInicioOperacao(dataInicioOperacao);
		orgao.setDataFimOperacao(dataFimOperacao);
		orgao.setDataInicioAcionamento(dataInicioAcionamento);
		orgao.setDataFimAcionamento(dataFimAcionamento);
		orgao.setDataInicioConsultaResposta(dataInicioConsultaResposta);
		orgao.setDataFimConsultaResposta(dataFimConsultaResposta);
		orgaoDao.save(orgao);
	}

	/**
	 * Recupera lista de meios de envio de resposta do órgão. Método utilizado
	 * no JSP de configuração do órgão para permitir a visualização dinâmica das
	 * alterações
	 * 
	 * @param idOrgao
	 * @return
	 */
	public Collection listaMeiosEnvioRespostaOrgao(Long idOrgao) {

		DaoFactory daoFactory = new HibernateDaoFactory();
		orgaoDao = daoFactory.create(Orgao.class);
		Collection lstMeiosEnvioResp = new ArrayList();

		try {
			Orgao orgao = this.get(idOrgao);
			if (orgao != null) {
				lstMeiosEnvioResp = orgao.getListaMeioEnvioRespostaOrgao();
			}
		} catch (DaoException e) {
			if (Constants.DEBUG) {
				e.printStackTrace(System.out);
			}
		}

		return lstMeiosEnvioResp;

	}

}