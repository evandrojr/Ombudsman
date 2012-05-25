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

import java.util.List;

import br.gov.serpro.ouvidoria.dao.Dao;
import br.gov.serpro.ouvidoria.dao.DaoException;
import br.gov.serpro.ouvidoria.dao.DaoFactory;
import br.gov.serpro.ouvidoria.model.Acionamento;
import br.gov.serpro.ouvidoria.model.Orgao;
import br.gov.serpro.ouvidoria.model.ParametrosGerais;
import br.gov.serpro.ouvidoria.util.Utilitario;

/**
 * Objetivo: Controlar as operações sobre os objetos relacionados à parte de
 * envio da resposta de um acionamento por email.
 * 
 * @author SERPRO
 * @version $Revision: 1.1.2.6 $, $Date: 2011/11/10 12:40:51 $
 * @version 0.1, Date: 2004/12/20
 */
public class EnviarEmailCtrl {

	/** atributo para datasource do acionamento */
	/* Requerido */
	private Dao acionamentoDao;

	/** atributo para datasource dos Parâmetros Gerais */
	/* Requerido */
	private Dao parametrosGeraisDao;

	/**
	 * Construtor recebendo objeto Dao
	 * 
	 * @param daoFactory
	 */
	public EnviarEmailCtrl(final DaoFactory daoFactory) {
		acionamentoDao = daoFactory.create(Acionamento.class);
		parametrosGeraisDao = daoFactory.create(ParametrosGerais.class);
	}

	/**
	 * Método para recuperar um acionamento a partir de um id
	 * 
	 * @param id
	 *            identificador do acionamento
	 */
	public Acionamento get(Long id) throws DaoException {
		if (id == null) {
			throw new DaoException("ID do Objeto não pode ser nulo.");
		}
		return (Acionamento) acionamentoDao.get(id);
	}

	/**
	 * Método para salvar um acionamento
	 * 
	 * @param pAcionamento
	 *            acionamento a ser salvo
	 */
	public void salvarAcionamento(Acionamento pAcionamento) throws DaoException {

		acionamentoDao.save(pAcionamento);
	}

	/**
	 * Este método é responsável por enviar email.
	 * 
	 * @param pAcionamento
	 *            acionamento cuja resposta será enviada do email.
	 * @param pOrgao
	 *            Órgão da aplicação.
	 * @throws MessagingException
	 * @throws AddressException
	 */
	public boolean enviarEmail(Acionamento pAcionamento, Orgao pOrgao,
			String pEnderecoUrl) throws DaoException {

		String lsServidorSMTP = "";
		String lsDe = "";
		String lsPara = "";
		String lsAssunto = "";
		String lsTexto = "";

		List listaParametrosGerais = parametrosGeraisDao.list();
		if (listaParametrosGerais != null)
			lsServidorSMTP = ((ParametrosGerais) listaParametrosGerais.get(0))
					.getServidorSMTP();

		lsDe = pOrgao.getConfiguracoes().getRemetenteEmail();

		lsPara = pAcionamento.getAcionador().getEmail();

		lsAssunto = "Ouvidoria - "
				+ pOrgao.getConfiguracoes().getNomeExibicaoOrgao();

		lsTexto = pOrgao.getConfiguracoes().getTextoApresentacaoResposta()
				+ "<br><br>";

		lsTexto = lsTexto + "Resposta referente ao acionamento de "
				+ "protocolo n\u00FAmero: <b>" + pAcionamento.getNumeroProtocolo()
				+ "</b><br><br>";

		lsTexto = lsTexto + "<br><b>Sua Mensagem</b><br>"
				+ pAcionamento.getMensagem().getTexto() + "<br><br>";

		lsTexto = lsTexto + "<b>Resposta da Ouvidoria</b><br>"
				+ pAcionamento.getRespostaAcionamento().getTexto() + "<br><br>";

		lsTexto = lsTexto + "<b>Avalie a sua resposta no link:</b><br>"
				+ "<a href='"
				+ pEnderecoUrl + "'>Avaliar Resposta</a><br><br>";
		lsTexto = lsTexto
				+ "Atenciosamente,<br><br>"
				+ "Ouvidoria - "
				+ pOrgao.getConfiguracoes().getNomeExibicaoOrgao()
				+ "<br>"
				+ pOrgao.getConfiguracoes().getUrlBaseFuncionarios()
				+ "<br><br> MENSAGEM AUTOM&Aacute;TICA: N&atilde;o responda &agrave; esta mensagem. <BR>"
				+ "Se desejar entrar em contato, acesse novamente o sistema.<BR>";

		return Utilitario.enviarEmail(lsServidorSMTP, lsDe, lsPara, "", "",
				lsAssunto, lsTexto);
	}

}