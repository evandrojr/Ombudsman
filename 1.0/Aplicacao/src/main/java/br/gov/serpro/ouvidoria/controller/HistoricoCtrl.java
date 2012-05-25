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

import java.sql.Timestamp;
import java.util.List;

import br.gov.serpro.ouvidoria.dao.Dao;
import br.gov.serpro.ouvidoria.dao.DaoException;
import br.gov.serpro.ouvidoria.dao.DaoFactory;
import br.gov.serpro.ouvidoria.model.Acionamento;
import br.gov.serpro.ouvidoria.model.Funcionalidade;
import br.gov.serpro.ouvidoria.model.Funcionario;
import br.gov.serpro.ouvidoria.model.Historico;

/**
 * HistoricoCtrl
 * 
 * Objetivo: Fornecer um ponto centralizado de log das Funcionalidades da
 * aplicação
 * 
 * @author SERPRO
 * @version $Revision: 1.1.2.3 $, $Date: 2011/10/19 18:18:10 $
 * @version 0.1, Date: 2004/12/13
 */
public class HistoricoCtrl {

	private final Dao historicoDao;

	private final Dao funcionalidadeDao;

	/**
	 * Construtor recebendo objeto Dao
	 * 
	 * @param daoFactory
	 */
	public HistoricoCtrl(DaoFactory daoFactory) {
		historicoDao = daoFactory.create(Historico.class);
		funcionalidadeDao = daoFactory.create(Funcionalidade.class);
	}

	/**
	 * Grava o histórico da funcionalidade
	 * 
	 * @param funcionario
	 * @param role
	 * @param acionamento
	 * @throws DaoException
	 */
	public void Log(final Funcionario funcionario, final String role,
			final Acionamento acionamento) throws DaoException {

		// se o funcionário é nulo, nada a fazer
		if (funcionario == null) {
			return;
		}

		// se o perfil (role) for nulo ou vazio, nada a fazer
		if (role == null || role.trim().length() == 0) {
			return;
		}

		// obter a funcionalidade
		Funcionalidade funcionalidade = (Funcionalidade) funcionalidadeDao
				.get(new Long(role));

		// se a funcionalidade é nula, nada a fazer
		if (funcionalidade == null) {
			return;
		}

		// verificar se a funcionalidade deve ser gravada em histórico
		Boolean geraHistorico = funcionalidade.getGeraHistorico();
		if (geraHistorico != null && geraHistorico.booleanValue()) {
			Historico historico = new Historico();

			historico.setDataCadastramento(new Timestamp(System
					.currentTimeMillis()));
			historico.setFuncionalidade(funcionalidade);
			historico.setFuncionario(funcionario);
			historico.setAcionamento(acionamento);

			historicoDao.save(historico);
		}
	}

	/**
	 * Método para consultar histórico de acionamento
	 * 
	 * @param pAcionamento
	 *            - Acionamento a ser consultado
	 */
	public List consultaHistAcionamento(final Acionamento pAcionamento)
			throws DaoException {
		String lsQuery = "";
		List lstHistorico = null;

		lsQuery = " Select h from Historico as h "
				+ " Where h.acionamento.id = " + pAcionamento.getId()
				+ " Order by h.dataCadastramento DESC ";

		// Recupera lista de soluções
		lstHistorico = historicoDao.query(lsQuery);

		return lstHistorico;
	}

}