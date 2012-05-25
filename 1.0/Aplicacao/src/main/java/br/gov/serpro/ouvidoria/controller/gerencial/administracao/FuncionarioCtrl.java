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

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.TreeSet;

import br.gov.serpro.ouvidoria.dao.Dao;
import br.gov.serpro.ouvidoria.dao.DaoException;
import br.gov.serpro.ouvidoria.dao.DaoFactory;
import br.gov.serpro.ouvidoria.model.Acionamento;
import br.gov.serpro.ouvidoria.model.Assunto;
import br.gov.serpro.ouvidoria.model.EstadoAcionamento;
import br.gov.serpro.ouvidoria.model.Funcionalidade;
import br.gov.serpro.ouvidoria.model.Funcionario;
import br.gov.serpro.ouvidoria.model.Instituicao;
import br.gov.serpro.ouvidoria.model.LocalidadeOcorrencia;
import br.gov.serpro.ouvidoria.model.Orgao;
import br.gov.serpro.ouvidoria.model.Perfil;
import br.gov.serpro.ouvidoria.model.TipoMensagem;
import br.gov.serpro.ouvidoria.util.HibernateSessionFactory;
import br.gov.serpro.ouvidoria.util.Utilitario;
import org.hibernate.Query;

/**
 * TipoFuncionarioCtrl
 * 
 * Objetivo: Funcionalidades CRUD de Funcionário
 * 
 * @author SERPRO
 * @version $Revision: 1.1.2.3 $, $Date: 2011/10/18 17:55:14 $
 * @version 0.1, Date: 2004/12/27
 */
public class FuncionarioCtrl {

	private DaoFactory daoFactory;

	private Dao defaultDao;

	private Dao perfilDao;

	private Dao acionamentoDao;

	/**
	 * Construtor recebendo objeto Dao
	 * 
	 * @param daoFactory
	 */
	public FuncionarioCtrl(final DaoFactory daoFactory) {
		this.daoFactory = daoFactory;
		perfilDao = daoFactory.create(Perfil.class);
		defaultDao = daoFactory.create(Funcionario.class);
		acionamentoDao = daoFactory.create(Acionamento.class);
	}

	/**
	 * Retorna um funcionário pelo seu ID.
	 * 
	 * @param id
	 *            id do funcionário.
	 * @return funcionario (Funcionário) correspondente ao id.
	 * @throws DaoException
	 *             em caso de erro na comunicação com a base de dados.
	 */
	public Funcionario get(final Long id) throws DaoException {
		if (id == null) {
			return null;
		}
		return (Funcionario) defaultDao.get(id);
	}

	/**
	 * Retorna um funcionário pelo seu ID.
	 * 
	 * @param id
	 *            id do funcionário.
	 * @return funcionario (Funcionário) correspondente ao id.
	 * @throws DaoException
	 *             em caso de erro na comunicação com a base de dados.
	 */
	public Funcionario get(final String id) throws DaoException {
		return this.get(new Long(id));
	}

	public Funcionario getByLogin(final String login) throws DaoException {
		Funcionario funcionario = null;

		// montar consulta HQL
		String hql = "from Funcionario as f where f.login = :login";

		// construir e configurar a query do Hibernate
		Query query = HibernateSessionFactory.getFactory().getSession()
				.createQuery(hql);
		query.setString("login", login);

		List listaFunc = defaultDao.query(query);
		if (listaFunc != null && listaFunc.size() > 0) {
			funcionario = (Funcionario) listaFunc.get(0);
		}

		return funcionario;
	}

	/**
	 * Armazena um funcionário na base de dados.
	 * 
	 * @param object
	 *            funcionário a ser armazenado.
	 * @throws DaoException
	 *             em caso de erro na comunicação com a base de dados.
	 */
	private void save(final Funcionario object) throws DaoException {
		if (object == null) {
			throw new IllegalArgumentException(
					"Tentativa de salvar um funcionário nulo.");
		}

		defaultDao.save(object);
	}

	/**
	 * Insere um funcionário na base do Sistema Ouvidoria.
	 * 
	 * @param orgao
	 *            órgão do funcionário.
	 * @param nome
	 *            nome completo.
	 * @param login
	 *            login (CPF).
	 * @param senha
	 *            senha de acesso.
	 * @param situacao
	 *            situação (Ativo, Inativo, Suspenso)
	 * @param motivo
	 *            motivo (observação) de cadastro.
	 * @param perfil
	 *            perfil de acesso. ************************************
	 * @param consultor
	 *            flag de informação se é especialista consultor.
	 *            ************************************
	 * @param funcionalidades
	 *            lista de funcionalidades permitidas.
	 * @param tipoAssunto
	 *            lista de tipos de assuntos (de mensagens).
	 * @param tipoMensagem
	 *            lista de tipos de mensagens do funcionário.
	 * @param subOrgao
	 *            lista de sub-órgãos de atuação do funcionário.
	 * @param localidades
	 *            localidades associadas aos órgãos (e sub-órgãos).
	 * @throws DaoException
	 *             em caso de erro na comunicação com a base de dados.
	 */
	public void insert(Orgao orgao, final String nome, final String login,
			final String senha, final String situacao, final String motivo,
			final Long perfil, final Long[] funcionalidades,
			final Long[] tipoAssunto, final Long[] tipoMensagem,
			final Long[] subOrgao, final Long[] localidades,
			final String nivelAcesso, final String consultor, final String email)
			throws DaoException {

		if (orgao == null) {
			throw new IllegalArgumentException(
					"Tentativa de cadastrar funcionário para órgão nulo.");
		}

		Funcionario object = new Funcionario();

		object.setNome(nome);
		object.setLogin(login);
		object.setSenha(senha);
		object.setSituacao(situacao);
		object.setMotivoNivelAtuacao(motivo);
		object.setPerfil((Perfil) perfilDao.get(perfil));
		object.setListaFuncionalidade(listas(funcionalidades,
				Funcionalidade.class));
		object.setListaAssunto(listas(tipoAssunto, Assunto.class));
		object.setListaTipoMensagem(listas(tipoMensagem, TipoMensagem.class));

		object.setConsultor(consultor);
		
		/* Inclusão do campo email para permitir que o funcionário receba notificações 
		 * sobre mensagens pendentes via email
		 **/
		object.setEmail(email);

		object.setInstituicao(orgao);
		if (!Perfil.ADMINISTRADOR.equals(object.getPerfil())) {
			object.setInstituicao(orgao);

			if (object.getListaInstituicao() == null) {
				object.setListaInstituicao(new TreeSet());
			}
			object.getListaInstituicao().clear();

			if (object.getListaLocalidadeOcorrencia() == null) {
				object.setListaLocalidadeOcorrencia(new TreeSet());
			}
			object.getListaLocalidadeOcorrencia().clear();

			if (nivelAcesso.equals("O")) {
				object.getListaInstituicao().add(orgao);
			} else {
				object.setListaInstituicao(listas(subOrgao, Instituicao.class));
				object.setListaLocalidadeOcorrencia(listas(localidades,
						LocalidadeOcorrencia.class));
			}
		}

		save(object);
	}

	/**
	 * Atualiza um Funcionário
	 * 
	 * @param orgao
	 * @param gestor
	 * @param id
	 * @param nome
	 * @param login
	 * @param senha
	 * @param situacao
	 * @param motivo
	 * @param perfil
	 * @param consultor
	 * @param funcionalidades
	 * @param tipoAssunto
	 * @param tipoMensagem
	 * @param subOrgao
	 * @param localidades
	 * @param nivelAcesso
	 * @throws DaoException
	 * @throws Exception
	 */
	public void update(Orgao orgao, final Funcionario gestor, final Long id,
			final String nome, final String login, final String senha,
			final String situacao, final String motivo, final Long perfil,
			final Long[] funcionalidades, final Long[] tipoAssunto,
			final Long[] tipoMensagem, final Long[] subOrgao,
			final Long[] localidades, final String nivelAcesso,
			final String consultor, final String email) throws DaoException, Exception {

		if (orgao == null) {
			throw new NullPointerException();
		}

		if (gestor == null) {
			throw new NullPointerException();
		}

		if (id == null) {
			throw new NullPointerException();
		}

		Funcionario object = get(id);

		object.setNome(nome);
		object.setLogin(login);

		if (senha != null && senha.trim().length() > 0) {
			object.setSenha(senha);
		}
		object.setEmail(email);
		
		object.setSituacao(situacao);

		object.setPerfil((Perfil) perfilDao.get(perfil));
		object.setInstituicao(orgao);

		object.setListaFuncionalidade(listas(funcionalidades,
				Funcionalidade.class));

		object.setListaAssunto(listas(tipoAssunto, Assunto.class));

		object.setListaTipoMensagem(listas(tipoMensagem, TipoMensagem.class));

		object.setMotivoNivelAtuacao(motivo);
		
		object.setConsultor(consultor);

		if (!Perfil.ADMINISTRADOR.equals(object.getPerfil())) {

			/* Inicializo as collections, caso não existam */
			if (object.getListaInstituicao() == null) {
				object.setListaInstituicao(new TreeSet());
			}

			if (object.getListaLocalidadeOcorrencia() == null) {
				object.setListaLocalidadeOcorrencia(new TreeSet());
			}

			/* Limpo as collections dependendo do nível de acesso do gestor */
			if (gestor.getNivelAtuacao() == Funcionario.NA_ORGAO) {
				object.getListaInstituicao().clear();
				object.getListaLocalidadeOcorrencia().clear();
			} else {
				object.getListaInstituicao().removeAll(
						gestor.getListaInstituicao());

				object.getListaLocalidadeOcorrencia().removeAll(
						gestor.getListaLocalidadeOcorrencia());
			}

			/*
			 * Preencho as collections dependendo do nível de acesso
			 */
			if (nivelAcesso.equals("O")) {
				object.getListaInstituicao().add(orgao);
			} else {
				object.getListaInstituicao().addAll(
						listas(subOrgao, Instituicao.class));
				object.getListaLocalidadeOcorrencia().addAll(
						listas(localidades, LocalidadeOcorrencia.class));
			}

		}

		/* Redireciono meus acionamentos, caso eu me torne inativo */
		List acionamentos = new ArrayList();
		boolean erro = false;
		if (!object.getSituacao().equals(Funcionario.ATIVO)
				&& object.getListaAcionamento() != null) {

			for (Iterator iter = object.getListaAcionamento().iterator(); iter
					.hasNext();) {
				Acionamento acionamento = (Acionamento) iter.next();
				if (!(acionamento.getEstadoAcionamento().equals(
						EstadoAcionamento.RESPONDIDO) || acionamento
						.getEstadoAcionamento().equals(
								EstadoAcionamento.ENVIADO))) {
					if (acionamento.redirecionarAcionamento(orgao, object)) {
						acionamentos.add(acionamento);
					} else {
						erro = true;
						break;
					}
				}
			}
		}

		if (erro) {
			throw new Exception();
		}

		for (Iterator iter = acionamentos.iterator(); iter.hasNext();) {
			acionamentoDao.save((Acionamento) iter.next());
		}

		save(object);
	}

	/**
	 * Devolve a lista de funcionários de um órgão. Se o funcionário solicitante
	 * for Administrador, os outros administradores também serão incluídos na
	 * lista.
	 * 
	 * @param orgao
	 *            Órgão para o qual os funcionários serão listados.
	 * @return lista (Collection) de usuários do órgão.
	 * @throws DaoException
	 *             em caso de erro no processo de consulta.
	 */
	public Collection list(final Orgao orgao, final Funcionario funcionario,
			final String criterio) throws DaoException {

		// verificar que o Órgão não seja nulo
		if (orgao == null) {
			throw new NullPointerException();
		}

		// montar a consulta
		String crit = Utilitario.trataPlic(criterio);

		StringBuffer hql = new StringBuffer();
		hql.append("from Funcionario as f \n");
		hql.append("  inner join fetch f.perfil as p \n");
		hql.append("  left outer join fetch f.instituicao as i \n");
		hql.append("where ( f.instituicao.id = " + orgao.getId() + " \n");

		if (funcionario.getPerfil().equals(Perfil.ADMINISTRADOR)) {
			hql.append("  or f.perfil.id = " + Perfil.ADMINISTRADOR.getId()
					+ " ) \n");
		} else {
			hql.append("  and f.perfil.id <> " + Perfil.ADMINISTRADOR.getId()
					+ " ) \n");
		}

		if (criterio != null && criterio.trim().length() > 0) {
			hql.append("  and f.nome LIKE '%" + crit + "%' \n");
		}
		hql.append("order by f.nome asc \n");

		String sql = hql.toString();

		// executar a query
		List resultados = defaultDao.query(sql);

		// processar os resultados e montar a lista final de funcionários
		List listaFinal = null;
		if (!funcionario.getPerfil().equals(Perfil.ADMINISTRADOR)
				&& funcionario.getListaSubOrgaosAtivos() != null
				&& !funcionario.getListaSubOrgaosAtivos().isEmpty()) {
			listaFinal = new ArrayList();

			// manter apenas os usuários que são da localidade do funcionário
			// logado
			for (Iterator iter = resultados.iterator(); iter.hasNext();) {
				Funcionario func = (Funcionario) iter.next();

				for (Iterator iterLoc = funcionario
						.getListaLocalidadeOcorrencia().iterator(); iterLoc
						.hasNext();) {
					LocalidadeOcorrencia loc = (LocalidadeOcorrencia) iterLoc
							.next();
					if (func.getListaLocalidadeOcorrencia().contains(loc)) {
						listaFinal.add(func);
						break;
					}
				}
			}
		} else {
			listaFinal = resultados;
		}

		return listaFinal;
	}

	/**
	 * Retorna uma lista especificada do Tipo do Parâmetro pClass
	 * 
	 * @param ids
	 * @param pClass
	 * @return
	 * @throws DaoException
	 */
	public Collection listas(final Long[] ids, final Class pClass)
			throws DaoException {
		Dao dao = daoFactory.create(pClass);
		Collection lista = new HashSet();
		for (int i = 0; ids != null && i < ids.length; i++) {
			lista.add(dao.get(ids[i]));
		}
		return lista;
	}

	/**
	 * Retorna uma lista de funcionários por Perfil
	 * 
	 * @param orgao
	 * @param funcionario
	 * @param perfil
	 * @return
	 * @throws DaoException
	 */
	public List listaFuncionarioPorPerfil(final Orgao orgao,
			final Funcionario funcionario, final String perfil)
			throws DaoException {

		if (orgao == null) {
			throw new NullPointerException();
		}

		if (funcionario == null) {
			throw new NullPointerException();
		}

		String lsFrom = " Select f from Funcionario as f ";
		String lsWhere = " Where  f.instituicao.id = " + orgao.getId();

		// Se foi informado um perfil, consulta-se os funcionários do mesmo
		if (perfil != null && !perfil.equals("0")) {
			lsWhere = lsWhere + " And f.perfil.id = " + perfil;
		}

		String lsOrder = " Order By f.nome ";

		String lsQuery = lsFrom + lsWhere + lsOrder;

		// Recupera todos os funcionários dentro do perfil selecionado
		return defaultDao.query(lsQuery);
	}

	/**
	 * Retorna o funcionário por seu login
	 * 
	 * @param orgao
	 * @param login
	 * @return Funcionario
	 * @throws DaoException
	 */
	public Funcionario getByLogin(final Orgao orgao, final String login)
			throws DaoException {

		String sql = " select f from Funcionario as f " + "  where f.login = '"
				+ login.replaceAll("'", "") + "'" + "    and f.situacao = '"
				+ Funcionario.ATIVO + "'" + "    and ( f.perfil.id = "
				+ Perfil.ADMINISTRADOR.getId() + "     or f.instituicao.id = "
				+ orgao.getId() + " )";

		List lstFunc = defaultDao.query(sql);

		if (lstFunc == null || lstFunc.isEmpty()) {
			return null;
		}

		return (Funcionario) lstFunc.get(0);
	}
}
