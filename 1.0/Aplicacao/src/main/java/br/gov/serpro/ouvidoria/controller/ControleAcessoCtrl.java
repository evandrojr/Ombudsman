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
import java.util.Iterator;

import br.gov.serpro.ouvidoria.dao.Dao;
import br.gov.serpro.ouvidoria.dao.DaoException;
import br.gov.serpro.ouvidoria.dao.DaoFactory;
import br.gov.serpro.ouvidoria.model.Funcionalidade;
import br.gov.serpro.ouvidoria.model.Funcionario;
import br.gov.serpro.ouvidoria.model.Orgao;
import br.gov.serpro.ouvidoria.model.Perfil;

/**
 * ControleAcessoCtrl
 * 
 * Objetivo: Fornecer um ponto centralizado do controle de acesso da aplicação.
 * 
 * @author SERPRO
 * @version $Revision: 1.1.2.3 $, $Date: 2011/10/19 18:18:09 $
 * @version 0.1, Date: 2004/12/13
 */
public class ControleAcessoCtrl {

	/* Constantes para controle de acesso */
	public static final int CA_ACESSO_PERMITIDO = 0;

	public static final int CA_ACESSO_NEGADO = 1;

	public static final int CA_NECESSARIO_LOGIN = 2;

	/* Constantes para controle de vigência */
	public static final int VG_ACESSO_PERMITIDO = CA_ACESSO_PERMITIDO;

	public static final int VG_FORA_PERIODO_ACIONAMENTO = 11;

	public static final int VG_FORA_PERIODO_CONSULTA_RESPOSTA = 12;

	public static final int VG_FORA_PERIODO_OPERACAO = 13;

	private final Dao funcionalidadeDao;

	/**
	 * Construtor recebendo objeto Dao
	 * 
	 * @param daoFactory
	 */
	public ControleAcessoCtrl(DaoFactory daoFactory) {
		funcionalidadeDao = daoFactory.create(Funcionalidade.class);
	}

	/**
	 * Verifica se o Funcionário atua em um determinado Órgão
	 * 
	 * @param orgao
	 * @param funcionario
	 * @return
	 */
	public static int permiteGerencia(final Orgao orgao,
			final Funcionario funcionario) {

		/* se sou o administrador, tenho acesso a tudo */
		if (funcionario.getPerfil().equals(Perfil.ADMINISTRADOR)) {
			return ControleAcessoCtrl.CA_ACESSO_PERMITIDO;
		}

		final Timestamp now = new Timestamp(System.currentTimeMillis());

		/* se não sou administrador e não estou no período de operação */
		if (!(orgao.getDataInicioOperacao().before(now) && orgao
				.getDataFimOperacao().after(now))) {
			return ControleAcessoCtrl.VG_FORA_PERIODO_OPERACAO;
		}

		/* verifico o acesso ao órgão */
		if (funcionario.getListaInstituicao() == null
				|| funcionario.getListaInstituicao().isEmpty()) {
			return ControleAcessoCtrl.CA_ACESSO_NEGADO;
		}
		if (funcionario.getListaInstituicao().contains(orgao)) {
			return ControleAcessoCtrl.CA_ACESSO_PERMITIDO;
		}

		/* verifico o acesso aos sub-órgãos */
		if (orgao.getListaSubOrgao() == null
				|| orgao.getListaSubOrgao().isEmpty()) {
			return ControleAcessoCtrl.CA_ACESSO_NEGADO;
		}

		for (Iterator iter = orgao.getListaSubOrgao().iterator(); iter
				.hasNext();) {
			if (funcionario.getListaInstituicao().contains(iter.next())) {
				return ControleAcessoCtrl.CA_ACESSO_PERMITIDO;
			}
		}

		return ControleAcessoCtrl.CA_ACESSO_NEGADO;
	}

	/**
	 * Verifica se o Funcionário tem acesso a uma determinada Funcionalidade
	 * 
	 * @param orgao
	 * @param funcionario
	 * @param role
	 * @return int Valores possíveis de retorno <br>
	 *         0 - Acesso permitido <br>
	 *         1 - Acesso negado <br>
	 *         2 - Necessário efetuar login 13 - Fora do período de Operação
	 * @throws DaoException
	 */
	public int permiteAcesso(final Orgao orgao, final Funcionario funcionario,
			final ArrayList regras) throws DaoException {

		if (orgao == null) {
			throw new NullPointerException();
		}

		if (regras == null || regras.size() == 0) {
			return ControleAcessoCtrl.CA_ACESSO_PERMITIDO;
		}

		int controle = ControleAcessoCtrl.CA_ACESSO_PERMITIDO;
		int totalControle = 0;

		Iterator itRegras = regras.iterator();

		while (itRegras.hasNext()) {

			String role = (String) itRegras.next();

			Funcionalidade funcionalidade = (Funcionalidade) funcionalidadeDao
					.get(new Long(role));

			if (funcionalidade == null) {
				controle += ControleAcessoCtrl.CA_ACESSO_NEGADO;
				continue;
			}

			if (funcionalidade.getNecessarioLogin() == null
					|| funcionalidade.getNecessarioLogin().booleanValue()) {

				if (funcionario == null) {
					controle += ControleAcessoCtrl.CA_NECESSARIO_LOGIN;
					continue;

				} else {

					final int permiteGerencia = permiteGerencia(orgao,
							funcionario);

					if (permiteGerencia != ControleAcessoCtrl.CA_ACESSO_PERMITIDO) {
						controle += permiteGerencia;

						if (permiteGerencia > 0) {
							continue;
						}

					} else if (funcionario.getListaFuncionalidade().contains(
							funcionalidade)) {
						controle += ControleAcessoCtrl.CA_ACESSO_PERMITIDO;
					} else {
						controle += ControleAcessoCtrl.CA_ACESSO_NEGADO;
					}
				}
			}

			totalControle += controle + 1;
		}

		if (totalControle <= controle) {
			return controle;
		} else {
			return ControleAcessoCtrl.CA_ACESSO_PERMITIDO;
		}
	}

	/**
	 * Verifica se órgão está dentro de seus períodos de vigência
	 * 
	 * @param orgao
	 * @param role
	 * @return int Valores possíveis de retorno <br>
	 *         0 - Período de Vigência OK <br>
	 *         1 - Fora do Período de Cadastramento <br>
	 *         2 - Fora do Período de Consulta Resposta
	 * @throws DaoException
	 */
	public int verificaVigenciaOrgao(final Orgao orgao, final String role) {

		if (orgao == null) {
			throw new NullPointerException();
		}

		if (role == null || role.trim().length() == 0) {
			return ControleAcessoCtrl.VG_ACESSO_PERMITIDO;
		}

		final Timestamp now = new Timestamp(System.currentTimeMillis());

		/* Funcionalidade: EnviarMensagemWeb */
		if ("32".equals(role)) {

			if (!(orgao.getDataInicioAcionamento().before(now) && orgao
					.getDataFimAcionamento().after(now))) {
				return ControleAcessoCtrl.VG_FORA_PERIODO_ACIONAMENTO;
			}
		}

		/* Funcionalidade: ConsultarResposta */
		if ("1".equals(role)) {

			if (!(orgao.getDataInicioConsultaResposta().before(now) && orgao
					.getDataFimConsultaResposta().after(now))) {
				return ControleAcessoCtrl.VG_FORA_PERIODO_CONSULTA_RESPOSTA;
			}
		}

		/* Funcionalidade: Login */
		if ("2".equals(role)) {

			if (orgao.getDataInicioCadastramento().before(now)
					&& orgao.getDataFimCadastramento().after(now)) {
				return ControleAcessoCtrl.VG_ACESSO_PERMITIDO;
			}

			if (!(orgao.getDataInicioOperacao().before(now) && orgao
					.getDataFimOperacao().after(now))) {
				return ControleAcessoCtrl.VG_FORA_PERIODO_OPERACAO;
			}
		}

		return ControleAcessoCtrl.VG_ACESSO_PERMITIDO;
	}

	public boolean acessoFuncionalidade(Funcionario funcionario,
			Funcionalidade funcionalidade) {

		if (funcionario.getListaFuncionalidade().contains(funcionalidade)) {
			return true;
		}

		return false;
	}
}