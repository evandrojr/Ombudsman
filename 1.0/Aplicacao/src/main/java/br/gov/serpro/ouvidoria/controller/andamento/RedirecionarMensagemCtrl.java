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
package br.gov.serpro.ouvidoria.controller.andamento;

import java.sql.Timestamp;
import java.util.Iterator;
import java.util.List;

import br.gov.serpro.ouvidoria.dao.Dao;
import br.gov.serpro.ouvidoria.dao.DaoException;
import br.gov.serpro.ouvidoria.dao.DaoFactory;
import br.gov.serpro.ouvidoria.model.Acionamento;
import br.gov.serpro.ouvidoria.model.Assunto;
import br.gov.serpro.ouvidoria.model.Funcionario;
import br.gov.serpro.ouvidoria.model.LocalidadeOcorrencia;
import br.gov.serpro.ouvidoria.model.Orgao;
import br.gov.serpro.ouvidoria.model.Perfil;
import br.gov.serpro.ouvidoria.model.SubOrgao;

/**
 * RedirecionarMensagemCtrl
 * 
 * Objetivo: Informar a descrição da classes
 * 
 * @author
 * @version $Revision: 1.1.2.3 $, $Date: 2011/10/18 17:55:13 $
 * @version 0.1, Date: 2004/12/20
 */
public class RedirecionarMensagemCtrl {

	private Dao subOrgaoDao;

	private Dao assuntoDao;

	private Dao localidadeOcorrenciaDao;

	private Dao acionamentoDao;

	private Dao consultorDao;

	/**
	 * Default Constructor
	 * 
	 */
	public RedirecionarMensagemCtrl() {
		// DO NOTHING
	}

	/**
	 * Constructor recebendo um Dao
	 * 
	 * @param daoFactory
	 */
	public RedirecionarMensagemCtrl(final DaoFactory daoFactory) {
		subOrgaoDao = daoFactory.create(SubOrgao.class);
		assuntoDao = daoFactory.create(Assunto.class);
		localidadeOcorrenciaDao = daoFactory.create(LocalidadeOcorrencia.class);
		acionamentoDao = daoFactory.create(Acionamento.class);
		consultorDao = daoFactory.create(Funcionario.class);
	}

	/**
	 * Obtém uma lista de sub-órgãos para o órgão informado
	 * @param orgao
	 * @return
	 * @throws DaoException
	 */
	public List getListaSubOrgao(Orgao orgao) throws DaoException {

		final Timestamp agora = new Timestamp(System.currentTimeMillis());

		String query = " from SubOrgao so " + " where so.orgao.id = "
				+ orgao.getId() + " and (so.dataInicioVigencia < '"
				+ agora.toString() + "')"
				+ " and (so.dataFimVigencia is null or so.dataFimVigencia > '"
				+ agora.toString() + "')" + " order by so.descricao";

		List subOrgaos = subOrgaoDao.query(query);

		return subOrgaos;
	}

	/**
	 * Obtém uma lista de assuntos ligados ao sub-órgão informado
	 * @param subOrgao
	 * @return
	 * @throws DaoException
	 */
	public List getListaAssunto(Integer subOrgao) throws DaoException {

		final Timestamp agora = new Timestamp(System.currentTimeMillis());

		String query = " from Assunto a" + " where" + " a.instituicao.id = "
				+ subOrgao
				+ " and (a.dataVigencia is null or a.dataVigencia > '"
				+ agora.toString() + "'" + ")" + " order by a.descricao";

		List assuntos = assuntoDao.query(query);

		return assuntos;
	}

	/**
	 * Obtém uma lista de localidades ligadas ao sub-órgão informado
	 * @param subOrgao
	 * @return
	 * @throws DaoException
	 */
	public List getListaLocalidadeOcorrencia(Integer subOrgao)
			throws DaoException {

		final Timestamp agora = new Timestamp(System.currentTimeMillis());

		String query = " from LocalidadeOcorrencia lo" + " where"
				+ " lo.subOrgao.id = " + subOrgao
				+ " and (lo.dataVigencia is null or lo.dataVigencia > '"
				+ agora.toString() + "'" + ")" + " order by lo.descricao";

		List localidades = localidadeOcorrenciaDao.query(query);

		return localidades;
	}

	public List getConsultor(Integer subOrgao, Integer assunto,
			Integer localidadeOcorrencia) throws DaoException {

		String query = " select f from Funcionario f, Assunto a, LocalidadeOcorrencia lo "
				+ " where "
				+ " consultor like '%on%' "
				+ " and f.situacao = 'A' "
				+ " and a in elements (f.listaAssunto) "
				+ " and a.id = "
				+ assunto
				+ " and lo in elements (f.listaLocalidadeOcorrencia) "
				+ " and lo.id = " + localidadeOcorrencia + " order by f.nome ";

		List consultores = consultorDao.query(query);

		return consultores;

	}

	/**
	 * Obtém um acionamento a partir do ID informado
	 * @param id
	 * @return
	 * @throws DaoException
	 */
	public Acionamento getAcionamento(Integer id) throws DaoException {
		Acionamento acionamento = (Acionamento) acionamentoDao.get(new Long(id
				.longValue()));
		return acionamento;
	}

	/**
	 * Obtém uma localidade de Ocorrência a partir do ID informado
	 * @param id
	 * @return
	 * @throws DaoException
	 */
	public LocalidadeOcorrencia getLocalidadeOcorrencia(Integer id)
			throws DaoException {
		LocalidadeOcorrencia localidadeOcorrencia = (LocalidadeOcorrencia) localidadeOcorrenciaDao
				.get(new Long(id.longValue()));
		return localidadeOcorrencia;
	}

	/**
	 * Obtém um assunto a partir do ID informado
	 * @param id
	 * @return
	 * @throws DaoException
	 */
	public Assunto getAssunto(Integer id) throws DaoException {
		Assunto assunto = (Assunto) assuntoDao.get(new Long(id.longValue()));
		return assunto;
	}

	/**
	 * Obtém um sub-órgão a partir do ID informado
	 * @param id
	 * @return
	 * @throws DaoException
	 */
	public SubOrgao getSubOrgao(Integer id) throws DaoException {
		SubOrgao subOrgao = (SubOrgao) subOrgaoDao
				.get(new Long(id.longValue()));
		return subOrgao;
	}

	/**
	 * Salva um acionamento
	 * @param acionamento
	 * @throws DaoException
	 */
	public void salvarAcionamento(Acionamento acionamento) throws DaoException {
		acionamentoDao.save(acionamento);
	}

	public Funcionario obterOuvidorAssistente(Acionamento acionamento,
			Orgao orgao) throws DaoException {
		Funcionario funcionarioLoc = null;
		Funcionario funcionarioLoc2 = null;
		Iterator iter = null;

		// Obtém os ouvidores assistentes
		List listaOuvidorAssistente = acionamentoDao
				.query("select f from Funcionario f, Acionamento a where a.id = "
						+ acionamento.getId()
						+ " and f.instituicao.id = "
						+ orgao.getId()
						+ " and a.localidadeOcorrencia.subOrgao in elements( f.listaInstituicao ) and f.perfil.id = "
						+ Perfil.OUVIDOR_ASSISTENTE.getId());

		iter = listaOuvidorAssistente.iterator();
		if (listaOuvidorAssistente.size() == 1) {
			funcionarioLoc = (Funcionario) iter.next();
			return funcionarioLoc;
		}
		if (listaOuvidorAssistente.size() > 1) {
			// há mais de um ouvidor assistente, é preciso atribuir
			// responsabilidade ao menos ocupado
			int qtdMensagens = 99999999;
			iter = listaOuvidorAssistente.iterator();
			while (iter.hasNext()) {
				funcionarioLoc = (Funcionario) iter.next();
				if (funcionarioLoc.getListaAcionamento().size() < qtdMensagens) {
					qtdMensagens = funcionarioLoc.getListaAcionamento().size();
					funcionarioLoc2 = funcionarioLoc;
				}
			}
			return funcionarioLoc2;

		}

		// não há ouvidor assistente, é preciso redirecionar para o
		// ouvidor geral
		return null;
	}

	public Funcionario obterOuvidorGeral(Acionamento acionamento, Orgao orgao)
			throws DaoException {
		Funcionario funcionarioLoc = null;
		Funcionario funcionarioLoc2 = null;
		Iterator iter = null;

		// Obtém os ouvidores gerais
		List listaOuvidorGeral = acionamentoDao
				.query("select f from Funcionario f, Acionamento a where a.id = "
						+ acionamento.getId()
						+ " and f.instituicao.id = "
						+ orgao.getId()
						+ " and a.localidadeOcorrencia.subOrgao.orgao in elements( f.listaInstituicao ) and f.perfil.id = "
						+ Perfil.OUVIDOR_GERAL.getId());

		iter = listaOuvidorGeral.iterator();
		if (listaOuvidorGeral.size() == 1) {
			funcionarioLoc = (Funcionario) iter.next();
			return funcionarioLoc;
		}

		if (listaOuvidorGeral.size() > 1) {
			// há mais de um ouvidor geral, é preciso atribuir
			// responsabilidade ao menos ocupado
			int qtdMensagens = 99999999;
			iter = listaOuvidorGeral.iterator();
			while (iter.hasNext()) {
				funcionarioLoc = (Funcionario) iter.next();
				if (funcionarioLoc.getListaAcionamento().size() < qtdMensagens) {
					qtdMensagens = funcionarioLoc.getListaAcionamento().size();
					funcionarioLoc2 = funcionarioLoc;
				}
			}
			return funcionarioLoc2;
		}

		return null;
	}
	
	public Funcionario obterOuvidor(Long idOuvidor) throws DaoException {
		Funcionario funcionarioOuvidor= null;
		Iterator iter = null;
		// Obtém os ouvidores
		List listaOuvidor = acionamentoDao.query("select f from Funcionario f where f.id = "+ idOuvidor);
		iter = listaOuvidor.iterator();
		if (listaOuvidor.size() == 1) {
			funcionarioOuvidor = (Funcionario) iter.next();
			return funcionarioOuvidor;
		}
		return funcionarioOuvidor;
	}

}