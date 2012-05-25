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
import java.util.Iterator;
import java.util.List;

import br.gov.serpro.ouvidoria.dao.Dao;
import br.gov.serpro.ouvidoria.dao.DaoException;
import br.gov.serpro.ouvidoria.dao.DaoFactory;
import br.gov.serpro.ouvidoria.model.Funcionario;
import br.gov.serpro.ouvidoria.model.Orgao;
import br.gov.serpro.ouvidoria.model.ParametrosGerais;
import br.gov.serpro.ouvidoria.model.Perfil;

/**
 * LoginCtrl
 * 
 * Objetivo: Controlar as operações sobre os objetos relacionados à
 * funcionalidade Login.
 * 
 * @author SERPRO
 * @version $Revision: 1.1.2.3 $, $Date: 2011/10/19 18:18:10 $
 * @version 0.1, Date: 2004/12/13
 */
public class LoginCtrl {

	private Dao parametrosDao;

	private Dao funcionarioDao;

	private int validaSenha = 3;

	/**
	 * Construtor recebendo objeto Dao
	 * 
	 * @param daoFactory
	 */
	public LoginCtrl(final DaoFactory daoFactory) {
		parametrosDao = daoFactory.create(ParametrosGerais.class);
		funcionarioDao = daoFactory.create(Funcionario.class);
	}

	/**
	 * Verifica se o Funcionário existe para um determinado Órgão, recebendo seu
	 * Login e sua senha válida também
	 * 
	 * @param orgao
	 * @param login
	 * @param senha
	 * @return Funcionario se ele existir, null caso contrário
	 * @throws DaoException
	 */
	public Funcionario validaFuncionario(final Orgao orgao, final String login,
			final String senha) throws DaoException {

		Timestamp agora = new Timestamp(System.currentTimeMillis());

		if (orgao == null) {
			throw new NullPointerException();
		}

		if (login == null || login.trim().length() == 0) {
			return null;
		}

		if (senha == null || senha.trim().length() == 0) {
			return null;
		}

		StringBuffer hql = new StringBuffer();
		hql.append("from Funcionario as f \n");
		hql.append("  inner join fetch f.perfil \n");
		hql.append("  inner join fetch f.instituicao \n");
		hql.append("where f.login = '" + login.replaceAll("'", "") + "' \n");
		hql.append("  and f.situacao = '" + Funcionario.ATIVO + "' \n");
		hql.append("  and ( f.perfil.id = " + Perfil.ADMINISTRADOR.getId()
				+ " \n");
		hql.append("        or f.instituicao.id = " + orgao.getId() + " ) \n");

		String sql = hql.toString();
		List funcionarios = funcionarioDao.query(sql);

		if (funcionarios == null || funcionarios.isEmpty()) {
			return null;
		}

		Funcionario funcionario = null;
		for (Iterator iter = funcionarios.iterator(); iter.hasNext();) {
			Funcionario temp = (Funcionario) iter.next();

			if (temp.checarLoginBloqueado()) {
				validaSenha = 1;
				continue;
			}

			if (senha.equals(temp.getSenha())) {

				if (temp.getDataBloqueioLogin() != null
						&& temp.getDataBloqueioLogin().after(agora)) {
					validaSenha = 1; // Mensagem de login bloqueado
				} else {
					temp.desbloquearLogin();
					funcionario = temp;
					funcionarioDao.save(temp);
					break;
				}

			} else {

				if (!orgao.equals(temp.getInstituicao())) {
					validaSenha = 3;
					continue;
				}

				// Valida tentativas de acesso
				Integer tempoBloqueio = null;
				int numeroTentativas = 0;
				int numeroTentativasPossiveis = 0;

				// número de tentativas
				if (temp.getQtdTentativasLogin() == null) {
					numeroTentativas = 1;
				} else {
					numeroTentativas = temp.getQtdTentativasLogin().intValue() + 1;
				}

				ParametrosGerais parametrosGerais = (ParametrosGerais) parametrosDao
						.get(new Long(1));

				// número limite de tentativas
				if (parametrosGerais.getLimiteFalhasLogin() != null) {
					numeroTentativasPossiveis = parametrosGerais
							.getLimiteFalhasLogin().intValue();
				}

				if (numeroTentativas >= numeroTentativasPossiveis) {
					// Recupera o tempo de bloqueio do login
					tempoBloqueio = parametrosGerais.getTempoBloqueioLogin();
					temp.bloquearLogin(tempoBloqueio);
					validaSenha = 1; // Mensagem de login bloqueado
				} else if (numeroTentativas == (numeroTentativasPossiveis - 1)) {
					validaSenha = 2; // Mensagem de alerta pra bloqueio
					temp.incrementarQtdTentativasLogin();
				} else {
					validaSenha = 3; // Senha inválida
					temp.incrementarQtdTentativasLogin();
				}
			}

			funcionarioDao.save(temp);
		}

		if (funcionario == null) {
			return null;
		}

		validaSenha = 0;

		final int permiteGerencia = ControleAcessoCtrl.permiteGerencia(orgao,
				funcionario);

		return permiteGerencia == ControleAcessoCtrl.CA_ACESSO_PERMITIDO ? funcionario
				: null;
	}

	public Funcionario alteraSenha(final Orgao orgao, final String login,
			final String senhaAntiga, final String senhaNova)
			throws DaoException {

		if (orgao == null) {
			throw new IllegalArgumentException();
		}

		if (login == null || login.trim().length() == 0) {
			return null;
		}

		if (senhaAntiga == null || senhaAntiga.trim().length() == 0) {
			return null;
		}

		if (senhaNova == null || senhaNova.trim().length() == 0) {
			return null;
		}

		String sql = " select f from Funcionario as f " + "  where f.login = '"
				+ login.replaceAll("'", "") + "'" + "    and f.situacao = '"
				+ Funcionario.ATIVO + "'" + "    and ( f.perfil.id = "
				+ Perfil.ADMINISTRADOR.getId() + "     or f.instituicao.id = "
				+ orgao.getId() + " )";

		List funcionarios = funcionarioDao.query(sql);

		if (funcionarios == null || funcionarios.isEmpty()) {
			return null;
		}

		Funcionario funcionario = null;
		for (Iterator iter = funcionarios.iterator(); iter.hasNext();) {
			Funcionario temp = (Funcionario) iter.next();
			if (senhaAntiga.equals(temp.getSenha())) {
				funcionario = temp;
				break;
			}
		}
		if (funcionario == null) {
			return null;
		}

		final int permiteGerencia = ControleAcessoCtrl.permiteGerencia(orgao,
				funcionario);

		if (permiteGerencia == ControleAcessoCtrl.CA_ACESSO_PERMITIDO) {
			funcionario.setSenha(senhaNova);
			funcionarioDao.save(funcionario);
			return funcionario;
		}

		return null;

	}

	public int getValidaSenha() {
		return this.validaSenha;
	}

}