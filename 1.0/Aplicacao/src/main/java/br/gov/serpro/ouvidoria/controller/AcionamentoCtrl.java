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
import java.util.ArrayList;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import br.gov.serpro.ouvidoria.bean.TotaisMsgBean;
import br.gov.serpro.ouvidoria.dao.Dao;
import br.gov.serpro.ouvidoria.dao.DaoException;
import br.gov.serpro.ouvidoria.dao.DaoFactory;
import br.gov.serpro.ouvidoria.dao.hibernate.HibernateDao;
import br.gov.serpro.ouvidoria.model.Acionamento;
import br.gov.serpro.ouvidoria.model.ConsultaAndamento;
import br.gov.serpro.ouvidoria.model.EstadoAcionamento;
import br.gov.serpro.ouvidoria.model.Funcionario;
import br.gov.serpro.ouvidoria.model.Orgao;
import br.gov.serpro.ouvidoria.model.Perfil;

/**
 * Objetivo: Controlar as operações sobre os objetos Acionamento, como por
 * exemplo, tratar a lista de mensagens pendentes
 * 
 * @author SERPRO
 * @version $Revision: 1.1.2.5 $, $Date: 2011/11/16 19:06:27 $
 * @version 0.1, Date: 2004/12/13
 */
public class AcionamentoCtrl {

	private final Log log = LogFactory.getLog(HibernateDao.class);

	/** campo para datasource */
	private Dao acionamentoDao;

	/**
	 * Construtor "default"
	 */
	public AcionamentoCtrl() {
		// DO NOTHING
	}

	/**
	 * Construtor recebendo objeto Dao
	 */
	public AcionamentoCtrl(final DaoFactory daoFactory) {
		acionamentoDao = daoFactory.create(Acionamento.class);
	}

	/**
	 * Método para recuperar o Acionamento a partir de um id
	 * 
	 * @param id
	 *            identificador do Acionamento
	 */
	public Acionamento get(Long id) throws DaoException {
		if (id == null) {
			throw new DaoException("ID do Objeto não pode ser nulo.");
		}
		return (Acionamento) acionamentoDao.get(id);
	}

	/**
	 * Método para persistir a Solução no BD
	 * 
	 * @param pAcionamento
	 *            acionamento a ser persistido
	 * 
	 */
	public void save(Acionamento pAcionamento) throws DaoException {
		acionamentoDao.save(pAcionamento);
	}

	/**
	 * Método para listar todos os acionamentos
	 */
	public List list() throws DaoException {
		return acionamentoDao.list();
	}

	/**
	 * Método para recuperar os acionamentos de uma Ouvidoria por estado
	 * (situação).
	 * 
	 * @param pOrgao
	 *            Órgão em questão.
	 * @param pPend
	 *            Pendente ("S")
	 * @param pAndamento
	 *            Em andamento ("S")
	 * @param pAtraso
	 *            Atraso ("S")
	 * @param pCritico
	 *            em atraso Crítico ("S")
	 */
	public List listaMensagensEstado(Orgao pOrgao, String pPend,
			String pAndamento, String pAtraso, String pCritico)
			throws DaoException {

		String lsEstado = "";
		List lstAcionamento = null;

		// Verifica estados dos acionamentos a serem consultados
		if (pPend.equalsIgnoreCase("S")) {
			lsEstado = lsEstado + EstadoAcionamento.PENDENTE.getId() + ",";
		}
		if (pAndamento.equalsIgnoreCase("S")) {
			lsEstado = lsEstado + EstadoAcionamento.EM_ANDAMENTO.getId() + ",";
		}
		if (pAtraso.equalsIgnoreCase("S")) {
			lsEstado = lsEstado + EstadoAcionamento.ATRASO.getId() + ",";
		}
		if (pCritico.equalsIgnoreCase("S")) {
			lsEstado = lsEstado + EstadoAcionamento.CRITICO.getId() + ",";
		}

		// retira a última vírgula
		lsEstado = lsEstado.substring(0, lsEstado.length() - 1);

		// Consulta-se as mensagens pendentes sob responsabilidade do
		// funcionário
		String lsFrom = " Select a from Acionamento as a, "
				+ " Orgao       as o, " + " SubOrgao    as s ";
		String lsWhere = " Where a.localidadeOcorrencia in elements(s.listaLocalidadeOcorrencia) "
				+ " And   s.id in elements( o.listaSubOrgao ) "
				+ " And   o.id = "
				+ pOrgao.getId()
				+ " And   a.estadoAcionamento.id in ( "
				+ lsEstado
				+ ") "
				+ " Order By a.dataAcionamento ";

		String lsQuery = lsFrom + lsWhere;

		// Recupera lista de acionamentos pendentes
		lstAcionamento = acionamentoDao.query(lsQuery);

		return lstAcionamento;
	}

	/**
	 * Método para recuperar os acionamentos de um funcionário por estado
	 * (situação)
	 * 
	 * @param pFunc
	 *            Funcionário
	 * @param pPend
	 *            Pendente ("S")
	 * @param pAndamento
	 *            Em andamento ("S")
	 * @param pAtraso
	 *            Atraso ("S")
	 * @param pCritico
	 *            em atraso Crítico ("S")
	 * @param pDatIni
	 *            Data inicial do período
	 * @param pDatFim
	 *            Data final do período
	 * @param pTipoMsg
	 *            Tipo da Mensagem (Id)
	 * @param pAssunto
	 *            Assunto (Id)
	 * @param pTitulo
	 *            Título da mensagem
	 * @param pOrdenacao
	 *            Ordenação da consulta
	 */
	public List listaMensagensEstado(final Funcionario pFunc,
			final String pPend, final String pAndamento, final String pAtraso,
			final String pCritico, final String pDatIni, final String pDatFim,
			final String pTipoMsg, final String pAssunto,
			final String pOrdenacao, final String pProtocolo)
			throws DaoException {

		String lsEstado = "";
		String lsOrder = "";

		List lstAcionamento = null;

		// Ordenação da consulta
		if (!pOrdenacao.equals("")) {
			lsOrder = " Order By a." + pOrdenacao;
		}

		// Verifica estados dos acionamentos a serem consultados
		if (pPend.equalsIgnoreCase("S")) {
			lsEstado = lsEstado + EstadoAcionamento.PENDENTE.getId() + ",";
		}
		if (pAndamento.equalsIgnoreCase("S")) {
			lsEstado = lsEstado + EstadoAcionamento.EM_ANDAMENTO.getId() + ",";
		}
		if (pAtraso.equalsIgnoreCase("S")) {
			lsEstado = lsEstado + EstadoAcionamento.ATRASO.getId() + ",";
		}
		if (pCritico.equalsIgnoreCase("S")) {
			lsEstado = lsEstado + EstadoAcionamento.CRITICO.getId() + ",";
		}

		// retira a última vírgula
		if (lsEstado != null && !lsEstado.equals("")) {
			lsEstado = lsEstado.substring(0, lsEstado.length() - 1);
		}

		// Consulta-se as mensagens pendentes sob responsabilidade do
		// funcionário
		String lsFrom = " Select a from Acionamento as a, "
				+ " Funcionario as f ";
		String lsWhere = " Where a.id in elements(f.listaAcionamento) "
				+ " And   f.id = " + pFunc.getId()
				+ " And   a.estadoAcionamento.id in ( " + lsEstado + ") ";

		// Trata os demais parâmetros passados para consulta
		if ((!pDatIni.equals("")) && (!pDatFim.equals(""))) {
			// Muda formato da data de dd/mm/yyyy para yyyymmdd
			String datIni = pDatIni.substring(6) + pDatIni.substring(3, 5)
					+ pDatIni.substring(0, 2) + "000000";

			// Na data fim acrescenta o último horário
			String datFim = pDatFim.substring(6) + pDatFim.substring(3, 5)
					+ pDatFim.substring(0, 2) + "235959";

			lsWhere = lsWhere + " and a.dataAcionamento >= '" + datIni + "' "
					+ " and a.dataAcionamento <= '" + datFim + "' ";
		}
		if (!pTipoMsg.equals("0")) {
			lsWhere = lsWhere + " and a.mensagem.tipoMensagem.id = " + pTipoMsg;
		}
		if (!pAssunto.equals("0")) {
			lsWhere = lsWhere + " and a.mensagem.assunto.id = " + pAssunto;
		}
		if (!pProtocolo.equals("")) {
			lsWhere = lsWhere + " and    a.numeroProtocolo =" + pProtocolo;
		}

		String lsQuery = "";

		// Caso tenha-se re-ordenado a lista pelo título da resposta
		// recupera-se primeiro as mensagens sem resposta e depois ordena-se
		// as mensagens com resposta
		List lstAcionamento_2 = null;
		if (pOrdenacao.equalsIgnoreCase("respostaAcionamento.titulo")) {
			lsQuery = lsFrom + lsWhere + " and a.respostaAcionamento is null ";
			lstAcionamento_2 = acionamentoDao.query(lsQuery);
		}

		// Recupera lista de acionamentos com resposta
		// O fato de ordenar-se a lista pelo título da resposta só trará
		// mensagens com resposta
		lsQuery = lsFrom + lsWhere + lsOrder;
		lstAcionamento = acionamentoDao.query(lsQuery);

		if (lstAcionamento_2 != null) {
			// adiciona-se a lista de mensagens com resposta ao final
			// da lista de mensagens sem resposta
			lstAcionamento_2.addAll(lstAcionamento);
			lstAcionamento = lstAcionamento_2;
		}

		return lstAcionamento;
	}

	/**
	 * Método para totalizar as mensagens (pendentes/em andamento/ em atraso/ am
	 * atraso crítico) de um Funcionário
	 * 
	 * @param pFunc
	 *            Funcionário
	 */
	public Hashtable informeTotaisMsgs(Orgao pOrgao, Funcionario pFunc)
			throws DaoException {

		Hashtable hsh = new Hashtable();
		Acionamento primeiroAcionamento = null;
		List lstAcionamentos = new ArrayList();
		List lstTotais = new ArrayList();
		Long totalFunc = new Long(0);
		Long totalOrgao = new Long(0);
		Long primeiroAcionId = new Long(0);
		long totalGeralFunc = 0;
		long totalGeralOrgao = 0;

		// --------------- PENDENTES ------------------
		// Consulta-se as mensagens pedentes sob responsabilidade do
		// órgão/funcionario

		// -- mensagens da Ouvidoria pendentes
		if (pOrgao != null) {
			lstAcionamentos = this.listaMensagensEstado(pOrgao, "S", "N", "N",
					"N");

			if (!lstAcionamentos.isEmpty()) {
				totalOrgao = new Long(lstAcionamentos.size());

				totalGeralOrgao = totalGeralOrgao + lstAcionamentos.size();
			}
		}

		// -- mensagens do Funcionário pendentes
		lstAcionamentos = this.listaMensagensEstado(pFunc, "S", "N", "N", "N",
				"", "", "0", "0", "", "");
		if (lstAcionamentos.isEmpty()) {
			totalFunc = new Long(0);
			primeiroAcionId = new Long(0);
		} else {
			totalFunc = new Long(lstAcionamentos.size());

			primeiroAcionamento = (Acionamento) lstAcionamentos.get(0);
			primeiroAcionId = primeiroAcionamento.getId();

			totalGeralFunc = totalGeralFunc + lstAcionamentos.size();
		}

		TotaisMsgBean totMsg = new TotaisMsgBean("PENDENTES", totalFunc,
				totalOrgao, primeiroAcionId);
		// Adiciona totais de mensagens pendentes
		lstTotais.add(totMsg);

		// -------- EM ANDAMENTO ---------------
		// Consulta-se as mensagens em andamento sob responsabilidade do
		// funcionário/órgão

		// -- mensagens da Ouvidoria em andamento
		if (pOrgao != null) {
			lstAcionamentos = this.listaMensagensEstado(pOrgao, "N", "S", "N",
					"N");

			if (lstAcionamentos.isEmpty()) {
				totalOrgao = new Long(0);
			} else {
				totalOrgao = new Long(lstAcionamentos.size());
				totalGeralOrgao = totalGeralOrgao + lstAcionamentos.size();
			}
		}

		// -- mensagens do Funcionário em andamento
		lstAcionamentos = this.listaMensagensEstado(pFunc, "N", "S", "N", "N",
				"", "", "0", "0", "", "");
		if (lstAcionamentos.isEmpty()) {
			totalFunc = new Long(0);
			primeiroAcionId = new Long(0);
		} else {
			totalFunc = new Long(lstAcionamentos.size());
			primeiroAcionamento = (Acionamento) lstAcionamentos.get(0);
			primeiroAcionId = primeiroAcionamento.getId();

			totalGeralFunc = totalGeralFunc + lstAcionamentos.size();
		}

		totMsg = new TotaisMsgBean("EM ANDAMENTO", totalFunc, totalOrgao,
				primeiroAcionId);
		// Adiciona totais de mensagens am andamento
		lstTotais.add(totMsg);

		// ---------- EM ATRASO ---------------
		// Consulta-se as mensagens em atraso sob responsabilidade do
		// funcionário/órgão

		// -- mensagens da Ouvidoria em atraso
		if (pOrgao != null) {
			lstAcionamentos = this.listaMensagensEstado(pOrgao, "N", "N", "S",
					"N");

			if (!lstAcionamentos.isEmpty()) {
				totalOrgao = new Long(lstAcionamentos.size());

				totalGeralOrgao = totalGeralOrgao + lstAcionamentos.size();
			} else {
				totalOrgao = new Long(0);
			}
		}

		// -- mensagens do Funcionário em atraso
		lstAcionamentos = this.listaMensagensEstado(pFunc, "N", "N", "S", "N",
				"", "", "0", "0", "", "");
		if (lstAcionamentos.isEmpty()) {
			totalFunc = new Long(0);
			primeiroAcionId = new Long(0);
		} else {
			totalFunc = new Long(lstAcionamentos.size());
			primeiroAcionamento = (Acionamento) lstAcionamentos.get(0);
			primeiroAcionId = primeiroAcionamento.getId();

			totalGeralFunc = totalGeralFunc + lstAcionamentos.size();
		}

		totMsg = new TotaisMsgBean("EM ATRASO", totalFunc, totalOrgao,
				primeiroAcionId);

		// Adiciona totais de mensagens am atraso
		lstTotais.add(totMsg);

		// ------- EM ATRASO CRÍTICO ---------------
		// Consulta-se as mensagens em atraso sob responsabilidade do
		// funcionário

		// -- mensagens da Ouvidoria em atraso CRÍTICO
		if (pOrgao != null) {
			lstAcionamentos = this.listaMensagensEstado(pOrgao, "N", "N", "N",
					"S");

			if (!lstAcionamentos.isEmpty()) {
				totalOrgao = new Long(lstAcionamentos.size());

				totalGeralOrgao = totalGeralOrgao + lstAcionamentos.size();
			} else {
				totalOrgao = new Long(0);
			}
		}

		// -- mensagens do Funcionário em atraso CRÍTICO
		lstAcionamentos = this.listaMensagensEstado(pFunc, "N", "N", "N", "S",
				"", "", "0", "0", "", "");
		if (lstAcionamentos.isEmpty()) {
			totalFunc = new Long(0);
			primeiroAcionId = new Long(0);
		} else {
			totalFunc = new Long(lstAcionamentos.size());
			primeiroAcionamento = (Acionamento) lstAcionamentos.get(0);
			primeiroAcionId = primeiroAcionamento.getId();

			totalGeralFunc = totalGeralFunc + lstAcionamentos.size();
		}

		totMsg = new TotaisMsgBean("EM ATRASO CRÍTICO", totalFunc, totalOrgao,
				primeiroAcionId);
		// Adiciona totais de mensagens am andamento
		lstTotais.add(totMsg);

		// Coloca os resultados na Hashtable de retorno
		hsh.put("Totais", lstTotais);
		hsh.put("Total Funcionario", new Long(totalGeralFunc));
		hsh.put("Total Orgao", new Long(totalGeralOrgao));

		return hsh;
	}

	/**
	 * Método para recuperar o acionamento a partir de um número de protocolo
	 * 
	 * @param orgao
	 *            Órgão sendo gerenciado
	 * @param numeroProtocolo
	 *            número do protocolo do acionamento
	 * @return Acionamento
	 * @throws DaoException
	 */
	public Acionamento getAcionamentoPeloProtocolo(final Orgao orgao,
			final Integer numeroProtocolo) throws DaoException {

		if (orgao == null || numeroProtocolo == null) {
			throw new IllegalArgumentException();
		}

		// montar a consulta em HQL
		StringBuffer hql = new StringBuffer();
		hql.append("select a \n");
		hql.append("from Acionamento as a \n");
		hql.append("  inner join fetch a.acionador, \n");
		hql.append("  Orgao as o \n");
		hql.append("where o.id = " + orgao.getId() + " \n");
		hql.append("  and a.numeroProtocolo = " + numeroProtocolo + " \n");
		hql.append("  and ( a.mensagem.assunto.instituicao.id = o.id \n");
		hql.append("        or a.mensagem.assunto.instituicao \n");
		hql.append("        in elements( o.listaSubOrgao ) ) \n");

		List acnmnts = acionamentoDao.query(hql.toString());

		if (acnmnts.isEmpty()) {
			return null;
		}

		return (Acionamento) acnmnts.get(0);
	}

	/**
	 * Método para recuperar as mensagens respondidas
	 * 
	 * @param pFunc
	 *            Funcionário
	 * @param pDatIni
	 *            Data inicial do período
	 * @param pDatFim
	 *            Data final do período
	 * @param pTipoMsg
	 *            Tipo da Mensagem (Id)
	 * @param pAssunto
	 *            Assunto (Id)
	 * @param pTexto
	 *            Palavra Chave
	 * @param pOrgao
	 *            Órgão logado
	 * 
	 */
	public List listaMensagensRespondidas(final Funcionario pFunc,
			final String pDatIni, final String pDatFim, final String pTipoMsg,
			final String pAssunto, final String pTexto, final Orgao pOrgao)
			throws DaoException {

		String lsOrder = " Order By a.dataAcionamento ";
		List lstAcionamento = null;
		String lsFrom = "";
		String lsWhere = "";

		// Caso o funcionário logado seja um Administrador,
		// ou se o funcionário logado tenha acesso a todo o órgão
		// Consulta-se os acionamentos associados às localidades
		// dos sub-órgão do órgão do contexto
		if (pFunc.getPerfil().getId().longValue() == Perfil.ADMINISTRADOR
				.getId().longValue()
				|| pFunc.getNivelAtuacao() == Funcionario.NA_ORGAO) {
			lsFrom = " Select DISTINCT a from Acionamento as a, "
					+ " Orgao 	 as o, SubOrgao as s ";
			lsWhere = " Where a.localidadeOcorrencia.id in elements(s.listaLocalidadeOcorrencia) "
					+ " And   s.id in elements(o.listaSubOrgao) "
					+ " And   o.id = "
					+ pOrgao.getId()
					+ " And   a.estadoAcionamento.id in ("
					+ EstadoAcionamento.RESPONDIDO.getId()
					+ ","
					+ EstadoAcionamento.ENVIADO.getId() + ")";
		} else {
			// Caso o funcionário não seja Administrador,
			// Consulta-se as mensagens respondidas associadas às localidades
			// ligadas aos sub-órgãos de atuação do funcionário
			lsFrom = " Select DISTINCT a from Acionamento as a, "
					+ " Funcionario as f ";
			lsWhere = " Where a.localidadeOcorrencia.id in elements(f.listaLocalidadeOcorrencia) "
					+ " And   f.id = "
					+ pFunc.getId()
					+ " And   a.estadoAcionamento.id in ("
					+ EstadoAcionamento.RESPONDIDO.getId()
					+ ","
					+ EstadoAcionamento.ENVIADO.getId() + ")";
		}

		// Trata os demais parâmetros passados para consulta
		if ((!pDatIni.equals("")) && (!pDatFim.equals(""))) {
			// Muda formato da data de dd/mm/yyyy para yyyymmdd
			String datIni = pDatIni.substring(6, 10) + pDatIni.substring(3, 5)
					+ pDatIni.substring(0, 2) + "000000";

			// Na data fim acrescenta o último horário
			String datFim = pDatFim.substring(6, 10) + pDatFim.substring(3, 5)
					+ pDatFim.substring(0, 2) + "235959";

			lsWhere = lsWhere + " and a.dataAcionamento >= '" + datIni + "' "
					+ " and a.dataAcionamento <= '" + datFim + "' ";
		}
		if (!pTipoMsg.equals("0")) {
			lsWhere = lsWhere + " and a.mensagem.tipoMensagem.id = " + pTipoMsg;
		}
		if (!pAssunto.equals("0")) {
			lsWhere = lsWhere + " and a.mensagem.assunto.id = " + pAssunto;
		}
		// A palavra chave pode estar no título/texto da mensagem ou da resposta
		if (!pTexto.equals("")) {
			lsWhere = lsWhere + " and  ( a.respostaAcionamento.titulo LIKE '%"
					+ pTexto + "%' "
					+ "    Or  a.respostaAcionamento.texto  LIKE '%" + pTexto
					+ "%' " + "    Or  a.mensagem.texto LIKE '%" + pTexto
					+ "%' )";
		}

		String lsQuery = lsFrom + lsWhere + lsOrder;

		// Recupera lista de acionamentos pendentes
		lstAcionamento = acionamentoDao.query(lsQuery);

		return lstAcionamento;
	}

	/**
	 * Método para atualizar os estados dos acionamentos
	 * 
	 * @param lstAcionamentos
	 *            Lista de acionamentos a serem atualizados
	 * 
	 */
	public boolean atualizaEstadoAcionamentos(List lstAcionamentos) {

		try {
			boolean result = true;
			Timestamp agora = new Timestamp(System.currentTimeMillis());

			// Varre a lista de acionamentos atualizando o
			// estado de cada um de acordo com os prazos
			
			for (Iterator it = lstAcionamentos.iterator(); it.hasNext();) {

				ConsultaAndamento consultaAndamento = (ConsultaAndamento) it
						.next();

				Acionamento acionamento = get(consultaAndamento.getId());
				
				long idEstadoAcion = consultaAndamento.getIdEstadoAcionamento()
						.longValue();
				Timestamp dataExterna = consultaAndamento.getDataExterna() != null ? new Timestamp(
						consultaAndamento.getDataExterna().getTime()) : null;
				Timestamp dataInterna = consultaAndamento.getDataInterna() != null ? new Timestamp(
						consultaAndamento.getDataInterna().getTime()) : null;

				// atualizar o estado do acionamento, dependendo do estado atual
				if (idEstadoAcion == EstadoAcionamento.PENDENTE.getId()
						.longValue()
						|| idEstadoAcion == EstadoAcionamento.EM_ANDAMENTO
								.getId().longValue()) {

	
					// acionamento PENDENTE ou EM ANDAMENTO - verificar se está
					// em ATRASO
					if (dataExterna != null && dataExterna.before(agora)) {
						acionamento.setEstadoAcionamento(EstadoAcionamento.CRITICO);
						acionamentoDao.save(acionamento);
						
					} else if (dataInterna != null && dataInterna.before(agora)) {
						acionamento.setEstadoAcionamento(EstadoAcionamento.ATRASO);
						acionamentoDao.save(acionamento);	
						
					}

				} else if (idEstadoAcion == EstadoAcionamento.ATRASO.getId()
						.longValue()) {


					// acionamento em ATRASO
					if (dataExterna != null && dataExterna.before(agora)) {
						acionamento.setEstadoAcionamento(EstadoAcionamento.CRITICO);
						acionamentoDao.save(acionamento);
					} else if (dataInterna != null && dataInterna.after(agora)) {
						// prazo interno foi "esticado" - voltar para PENDENTE
						acionamento.setEstadoAcionamento(EstadoAcionamento.PENDENTE);
						acionamentoDao.save(acionamento);
					}

				} else if (idEstadoAcion == EstadoAcionamento.CRITICO.getId()
						.longValue()) {


					// acionamento em atraso CRÍTICO
					if (dataInterna != null && dataInterna.after(agora)) {
						// prazo interno foi "esticado" - voltar para PENDENTE
						acionamento.setEstadoAcionamento(EstadoAcionamento.PENDENTE);
						acionamentoDao.save(acionamento);
					} else if (dataInterna != null && dataInterna.after(agora)) {
						// prazo externo foi "esticado" - voltar para ATRASO
						acionamento.setEstadoAcionamento(EstadoAcionamento.ATRASO);
						acionamentoDao.save(acionamento);
					}
				}
			}

			return result;
		} catch (Exception e) {
			log.error("EXCEÇÂO: " + e.getMessage());
			log.error(e.getStackTrace().toString());
			log.error("\n\n");
			e.printStackTrace();
			return false;
		}
	}

	public List listaAcionamentosPorEstado(Long idEstado) throws DaoException {

		String lsQuery = "";

		List lstAcionamento = null;

		// Consulta-se as mensagens pedentes sob responsabilidade do
		// funcionario
		String lsFrom = " Select a from Acionamento as a ";
		String lsWhere = " Where a.estadoAcionamento.id =" + idEstado;

		// Recupera lista de acionamentos com resposta
		// O fato de ordenar-se a lista pelo título da resposta só trará
		// mensagens com resposta
		lsQuery = lsFrom + lsWhere;
		System.out.println("\n\nQuery por Estado:" + lsQuery + "\n\n");
		lstAcionamento = acionamentoDao.query(lsQuery);

		return lstAcionamento;
	}

}