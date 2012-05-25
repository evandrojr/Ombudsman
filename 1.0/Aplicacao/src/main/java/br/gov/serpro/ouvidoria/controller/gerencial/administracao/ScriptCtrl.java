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
import java.util.List;

import br.gov.serpro.ouvidoria.dao.Dao;
import br.gov.serpro.ouvidoria.dao.DaoException;
import br.gov.serpro.ouvidoria.dao.DaoFactory;
import br.gov.serpro.ouvidoria.model.EstadoScript;
import br.gov.serpro.ouvidoria.model.Orgao;
import br.gov.serpro.ouvidoria.model.Script;

/**
 * Objetivo: Controlar as operações sobre os objetos Script, inclusive
 * persistindo os mesmos
 * 
 * @author SERPRO
 * @version $Revision: 1.1.2.3 $, $Date: 2011/10/19 18:18:09 $
 * @version 0.1, Date: 2004/12/27
 */
public class ScriptCtrl {

	/** campo para datasource */
	private Dao scriptDao;

	/**
	 * Construtor recebendo objeto Dao
	 */
	public ScriptCtrl(final DaoFactory daoFactory) {
		scriptDao = daoFactory.create(Script.class);
	}

	/**
	 * Método para recuperar o Script a partir de um id
	 * 
	 * @param id
	 *            identificador do script
	 */
	public Script get(Long id) throws DaoException {
		if (id == null) {
			throw new DaoException("ID do Objeto não pode ser nulo.");
		}
		return (Script) scriptDao.get(id);
	}

	/**
	 * Método para persistir o Script no BD
	 * 
	 * @param script
	 *            script a ser salvo
	 */
	public void save(Script script) throws DaoException {

		scriptDao.save(script);
	}

	/**
	 * Método para excluir o Script do BD
	 * 
	 * @param id
	 *            identificador do script
	 */
	public void delete(Long id) throws DaoException {
		if (id == null) {
			throw new DaoException("ID do Objeto não pode ser nulo.");
		}
		scriptDao.delete(id);
	}

	/**
	 * Método para listar os scripts do BD
	 */
	public List list() throws DaoException {
		return scriptDao.list();
	}

	/**
	 * Método para listar os scripts de acrodo com os parâmetros informados
	 * 
	 * @param pAssunto
	 *            Assunto selecionado
	 * @param pTexto
	 *            Texto a ser consultado
	 * @param pOrgao
	 *            Órgão do gestor
	 */
	public List listaScripts(String pAssunto, String pTexto, String pEstado,
			Orgao pOrgao) throws DaoException {

		String lsFrom = "Select s from Script as s";
		String lsWhere = "";
		String lsOrdem = " order by s.id";

		String lsQuery = "";
		List listaScript = null;
		Timestamp hoje = new Timestamp(System.currentTimeMillis());

		// Verifica se foi selecionado um assunto
		if (!pAssunto.equalsIgnoreCase("0")) {
			lsWhere = " Where s.assunto.id = " + pAssunto;
		}
		// Caso não tenha sido selecionado um assunto, traz-se
		// apenas os scripts cujo assunto esteja associado ao órgão
		// do gestor
		else {
			lsFrom = "Select DISTINCT s from Script as s, " + " Orgao o, "
					+ " SubOrgao sub ";
			lsWhere = " Where ( s.assunto.id in elements(o.listaAssunto) "
					+ "   Or  ( s.assunto.id in elements(sub.listaAssunto) "
					+ "     and sub.id in elements(o.listaSubOrgao) ) )"
					+ " And  o.id = " + pOrgao.getId()
					+ " And ( s.assunto.dataVigencia >= '" + hoje + "' "
					+ "    or s.assunto.dataVigencia = 00000000  "
					+ "    or s.assunto.dataVigencia is null ) ";
		}

		// filtra pelo texto informado
		lsWhere = lsWhere + " And (s.descricao LIKE '%" + pTexto + "%' OR"
				+ "      s.titulo    LIKE '%" + pTexto + "%')";

		// Verifica se foi selecionado um assunto
		if (!pEstado.equalsIgnoreCase("0")) {
			lsWhere = lsWhere + " and s.estado.id = " + pEstado;
		}

		// monta a string com a query
		lsQuery = lsFrom + lsWhere + lsOrdem;

		// Recupera lista de script
		listaScript = scriptDao.query(lsQuery);

		return listaScript;
	}

	/**
	 * Método para listar os scripts de acordo com os parâmetros informados
	 * 
	 * @param pEstadoScript
	 *            Estado dos Scripts a serem listados
	 * @param pOrgao
	 *            Órgão do gestor
	 */
	public List listaScriptsEstado(EstadoScript pEstadoScript, Orgao pOrgao)
			throws DaoException {

		String lsFrom = "Select s from Script as s";
		String lsWhere = "";
		String lsOrdem = " order by s.id";

		String lsQuery = "";
		List listaScript = null;
		Timestamp hoje = new Timestamp(System.currentTimeMillis());

		// Traz-se apenas os scripts cujo assunto esteja associado
		// ao órgão do gestor ou aos sub-órgãos daquele
		lsFrom = "Select DISTINCT s from Script as s, " + " Orgao o, "
				+ " SubOrgao sub ";
		lsWhere = " Where ( s.assunto.id in elements(o.listaAssunto) "
				+ "   Or  ( s.assunto.id in elements(sub.listaAssunto) "
				+ "     and sub.id in elements(o.listaSubOrgao) ) )"
				+ " And  o.id = " + pOrgao.getId() + " And  s.estado.id = "
				+ pEstadoScript.getId() + " And ( s.assunto.dataVigencia >= '"
				+ hoje + "' " + "    or s.assunto.dataVigencia = 00000000  "
				+ "    or s.assunto.dataVigencia is null ) ";

		// monta a string com a query
		lsQuery = lsFrom + lsWhere + lsOrdem;

		// Recupera lista de script
		listaScript = scriptDao.query(lsQuery);

		return listaScript;
	}

	/**
	 * Método para listar todos estados possíveis para um script
	 * 
	 * @return
	 * @throws DaoException
	 */
	public List listaTodosEstadoScripts() throws DaoException {

		String lsQuery = "Select distinct es"
				+ " from Script as s, EstadoScript as es"
				+ " where s.id = s.id" + " order by es.descricao";

		// Recupera lista de script
		List listaScript = scriptDao.query(lsQuery);

		return listaScript;
	}

	/**
	 * Método que recupera a quantidade de utilizações de um Script
	 * 
	 * @return
	 * @throws DaoException
	 */
	public List listaQtdUtilizacaoScript(String pId) throws DaoException {

		String lsQuery = " select count(a.script.id) "
				+ " from Atendimento as a" + " where a.script.id = " + pId;

		// Recupera a quantidade de utilização de um script
		List listaqtdUtilizacao = scriptDao.query(lsQuery);

		return listaqtdUtilizacao;
	}

}