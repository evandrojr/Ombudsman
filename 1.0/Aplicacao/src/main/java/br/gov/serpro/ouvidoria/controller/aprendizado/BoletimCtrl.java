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
package br.gov.serpro.ouvidoria.controller.aprendizado;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.List;

import br.gov.serpro.ouvidoria.dao.Dao;
import br.gov.serpro.ouvidoria.dao.DaoException;
import br.gov.serpro.ouvidoria.dao.DaoFactory;
import br.gov.serpro.ouvidoria.model.Boletim;
import br.gov.serpro.ouvidoria.model.Funcionario;
import br.gov.serpro.ouvidoria.model.Orgao;
import br.gov.serpro.ouvidoria.model.ParametrosGerais;
import br.gov.serpro.ouvidoria.util.date.DateKit;

/**
 * BoletimCtrl
 * 
 * Objetivo: Oferecer Serviços de CRUD para Boletim
 * 
 * @author SERPRO
 * @version $Revision: 1.1.2.4 $, $Date: 2011/10/21 18:53:46 $
 * @version 0.1, Date: 2005/02/01
 */
public class BoletimCtrl {

	private Dao defaultDao;

	private Dao parametrosGeraisDao;

	/**
	 * Construtor recebendo objeto Dao
	 * 
	 * @param daoFactory
	 */
	public BoletimCtrl(final DaoFactory daoFactory) {
		defaultDao = daoFactory.create(Boletim.class);
		parametrosGeraisDao = daoFactory.create(ParametrosGerais.class);
	}

	/**
	 * Retorna um boletim pelo seu ID
	 * 
	 * @param id
	 * @return
	 * @throws DaoException
	 */
	public Boletim get(final Long id) throws DaoException {
		if (id == null) {
			throw new DaoException("ID do Objeto não pode ser nulo.");
		}
		return (Boletim) defaultDao.get(id);
	}

	public boolean existeNumeroCadastrado(final Orgao orgao,
			final Integer numero) throws DaoException {

		if (orgao == null) {
			throw new NullPointerException();
		}

		if (numero == null) {
			throw new NullPointerException();
		}

		String sql = " Select b from Boletim as b where b.orgao.id = ".concat(
				orgao.getId().toString()).concat(" and b.numero = ").concat(
				numero.toString());

		List query = defaultDao.query(sql);

		return (query == null || query.isEmpty()) ? false : true;
	}

	/**
	 * Salva um boletim no banco
	 * 
	 * @param object
	 * @throws DaoException
	 */
	public void save(final Boletim object) throws DaoException {

		if (object == null) {
			throw new NullPointerException();
		}

		defaultDao.save(object);
	}

	public ParametrosGerais getParametrosGerais() throws DaoException {
		return (ParametrosGerais) parametrosGeraisDao.list().get(0);
	}

	public void criaArquivoBoletim(final Orgao orgao, final Boletim boletim,
			final String html, final byte[] chartImage, final String domain,
			final String contextUrl) throws DaoException, IOException {

		if (orgao == null) {
			throw new NullPointerException();
		}

		if (orgao.getConfiguracoes() == null
				|| orgao.getConfiguracoes().getNomeDiretorioOrgao() == null) {
			throw new NullPointerException();
		}

		final ParametrosGerais parametrosGerais = this.getParametrosGerais();

		if (parametrosGerais == null
				|| parametrosGerais.getDiretorioContextoAplicacao() == null) {
			throw new NullPointerException();
		}

		String caminho = parametrosGerais.getDiretorioContextoAplicacao()
				.concat(orgao.getConfiguracoes().getNomeDiretorioOrgao())
				.concat("/boletins");

		String images = caminho.concat("/images");
		new File(images).mkdirs();
		final String url = domain.concat("/").concat(
				orgao.getConfiguracoes().getNomeDiretorioOrgao()).concat(
				"/boletins/images");

		String imgName = "img_".concat(boletim.getId().toString()).concat(
				".png");

		BufferedOutputStream imgOut = new BufferedOutputStream(
				new FileOutputStream(images + "/" + imgName));

		imgOut.write(chartImage);
		imgOut.flush();
		imgOut.close();

		int posI = html.indexOf("<IMG");

		if (posI == -1) {
			posI = html.indexOf("<img");
		}
		int posF = html.indexOf(">", posI);

		String iniHtml = html.substring(0, posI);
		String fimHtml = html.substring(posF + 1);

		String imageHtml = "<img border=\"0\" width=\"600\" height=\"320\" alt=\"Gr&aacute;fico com os &Iacute;ndices de Satisfa&ccedil;&atilde;o da Ouvidoria\" src=\""
				+ url.concat("/").concat(imgName) + "\">";

		String boletimHtml = iniHtml + imageHtml + fimHtml;
		BufferedOutputStream out = new BufferedOutputStream(
				new FileOutputStream(caminho
						+ "/boletim_".concat(boletim.getId().toString())
								.concat(".html")));

		out.write(boletimHtml.getBytes());
		out.flush();
		out.close();
	}

	/**
	 * Insere um boletim no banco
	 * 
	 * @param orgao
	 * @param funcionario
	 * @param nome
	 * @param numero
	 * @param area
	 * @param telefone
	 * @param conteudo
	 * @param possuiCabecalho
	 * @param possuiGrafico
	 * @param possuiTabela
	 * @return
	 */
	public Boletim gerar(Orgao orgao, final Funcionario funcionario,
			final String nome, final Integer numero, final String area,
			final String telefone, final String conteudo,
			final Boolean possuiCabecalho, final Boolean possuiGrafico,
			final Boolean possuiTabela) {

		if (orgao == null) {
			throw new NullPointerException();
		}

		Boletim object = new Boletim();

		object.setNome(nome);
		object.setNumero(numero);
		object.setAreaGeradora(area);
		object.setTelefone(telefone);
		object.setConteudo(conteudo);
		object.setPossuiCabecalho(possuiCabecalho);
		object.setPossuiGrafico(possuiGrafico);
		object.setPossuiTabelaDados(possuiTabela);
		object.setPublicar(Boolean.FALSE);

		object.setDataCadastramento(new Timestamp(System.currentTimeMillis()));

		object.setOrgao(orgao);
		object.setFuncionario(funcionario);

		return object;
	}

	/**
	 * Public um boletim no banco
	 * 
	 * @param id
	 * @param publicar
	 * @throws DaoException
	 */
	public void publicar(final Long id, final Boolean publicar)
			throws DaoException {

		Boletim object = this.get(id);
		object.setPublicar(publicar);
		defaultDao.save(object);
	}

	/**
	 * Retorna a lista de boletins do Órgão
	 * 
	 * @param orgao
	 * @param somentePublicados,
	 *            se null retorna todos
	 * @return
	 * @throws DaoException
	 */
	public List list(final Orgao orgao, final Boolean somentePublicados)
			throws DaoException {

		if (orgao == null) {
			throw new NullPointerException("Órgão não pode ser nulo.");
		}

		String sql = " Select b from Boletim as b where b.orgao.id = "
				.concat(orgao.getId().toString());

		if (somentePublicados != null) {
			sql += " and b.publicar = " + somentePublicados.toString();
		}

		sql += " order by b.dataCadastramento DESC ";

		List query = defaultDao.query(sql);

		return query;
	}

	public List obterBoletinsFiltro(String palavraChave, String strDataIni,
			String strDataFim, Orgao org) throws DaoException {
		String condicoes = "";

		String sqlString = "Select b from br.gov.serpro.ouvidoria.model.Boletim as b where 1=1 ";

		// -- Recupera apenas os boletins do órgão
		condicoes += " AND b.orgao.id = " + org.getId();

		if (palavraChave != null && !"".equals(palavraChave)) {
			condicoes += " AND lower(concat(b.nome, b.conteudo)) like lower('%"
					+ palavraChave + "%')";
		}

		if (strDataIni != null && !"".equals(strDataIni)) {
			condicoes += " AND b.dataCadastramento >= '"
			+ DateKit.convertPtBr2ISO8601Date(strDataIni, "/", "-") + " 00:00:00'";
		}

		if (strDataFim != null && !"".equals(strDataFim)) {
			condicoes += " AND b.dataCadastramento <= '"
			+ DateKit.convertPtBr2ISO8601Date(strDataFim, "/", "-") + " 23:59:59'";
		}

		if (condicoes.length() > 0) {
			sqlString += condicoes;
		}

		sqlString += " ORDER BY b.dataCadastramento DESC ";

		return defaultDao.query(sqlString);

	}

}