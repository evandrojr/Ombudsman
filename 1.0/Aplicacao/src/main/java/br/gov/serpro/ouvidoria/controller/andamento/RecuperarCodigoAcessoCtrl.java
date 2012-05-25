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

import org.hibernate.criterion.Expression;
import br.gov.serpro.ouvidoria.dao.Dao;
import br.gov.serpro.ouvidoria.dao.DaoException;
import br.gov.serpro.ouvidoria.dao.DaoFactory;
import br.gov.serpro.ouvidoria.model.AcionadorFuncionario;
import br.gov.serpro.ouvidoria.model.AcionadorPessoaFisica;
import br.gov.serpro.ouvidoria.model.AcionadorPessoaJuridica;
import br.gov.serpro.ouvidoria.model.Acionamento;
import br.gov.serpro.ouvidoria.model.Orgao;
import br.gov.serpro.ouvidoria.model.ParametrosGerais;
import br.gov.serpro.ouvidoria.model.TipoAcionador;
import br.gov.serpro.ouvidoria.util.Utilitario;

/**
 * CtrlRecuperarCodigoAcesso
 * 
 * Objetivo: Recuperar Código de Acesso
 * 
 * @author SERPRO
 * @version $Revision: 1.1.2.3 $, $Date: 2011/10/18 17:55:13 $
 * @version 0.1, Date: 2004/12/03
 */
public class RecuperarCodigoAcessoCtrl {

	private Dao acionamentoDao;

	private Dao parametrosGeraisDao;

	private final static int PROTOCOLO_ESTA_BLOQUEADO = 1;

	private final static int PROTOCOLO_FOI_BLOQUEADO = 2;

	private final static int ACIONADOR_ANONIMO = 3;

	private final static int PERGUNTA_NAO_CADASTRADA = 4;

	private final static int ENVIO_EMAIL = 5;

	private final static int CAMPO_VALIDACAO = 6;

	private final static int RESPOSTA_INCORRETA = 7;

	private final static int ALERTA_BLOQUEIO_PROTOCOLO = 8;

	public final static int RESPOSTA_CORRETA = 9;

	private final static int ERRO_ENVIO_EMAIL = 10;

	public RecuperarCodigoAcessoCtrl(final DaoFactory daoFactory) {
		acionamentoDao = daoFactory.create(Acionamento.class);
		parametrosGeraisDao = daoFactory.create(ParametrosGerais.class);
	}

	// formaRecuperacao = 1: Email
	// formaRecuperacao = 2: Tela
	public int recuperarCodigoAcesso(Orgao orgao, Integer numeroProtocolo,
			Integer formaRecuperacao) throws DaoException {
		boolean protocoloBloqueado = this
				.checarProtocoloBloqueado(numeroProtocolo);
		if (protocoloBloqueado) {
			return PROTOCOLO_ESTA_BLOQUEADO;
		}
		boolean acionadorAnonimo = this.checarAcionadorAnonimo(numeroProtocolo);

		if (acionadorAnonimo) {
			return ACIONADOR_ANONIMO;
		}
		if (formaRecuperacao.intValue() == 1) {
			if (this.enviarCodigoAcessoViaEmail(orgao, numeroProtocolo))
				return ENVIO_EMAIL;

			return ERRO_ENVIO_EMAIL;

		}

		if (formaRecuperacao.intValue() == 2) {
			String pergunta = this.getPergunta(numeroProtocolo);
			if (pergunta == null || pergunta.trim().length() == 0) {
				return PERGUNTA_NAO_CADASTRADA;
			}

			return CAMPO_VALIDACAO;
		}
		return 0;
	}

	public int recuperarCodigoAcessoSubmit(Orgao orgao,
			Integer numeroProtocolo, String respostaUsuario,
			String campoObrigatorio) throws DaoException {

		if (this.validarResposta(numeroProtocolo, respostaUsuario)) {
			return RESPOSTA_CORRETA;
		}

		int valorRetorno = RESPOSTA_INCORRETA;
		Integer tempoBloqueio;
		boolean existeBloqueio;

		Acionamento acionamento = this.getAcionamento(numeroProtocolo);

		// incrementa o número de tentativas
		acionamento.getAcionador().getInformacoesConsultaAcionamento()
				.incrementarNumeroTentativasPergunta();

		// tentativas na tela:
		int numeroTentativas = acionamento.getAcionador()
				.getInformacoesConsultaAcionamento()
				.getNumeroTentativasPergunta().intValue();

		// número limite:
		int numeroTentativasOrgao = 9999;
		if (orgao.getConfiguracoes().getQtdeTentativasPossiveisPergunta() != null) {
			numeroTentativasOrgao = orgao.getConfiguracoes()
					.getQtdeTentativasPossiveisPergunta().intValue();
		}

		existeBloqueio = false;

		if (orgao.getConfiguracoes().getExisteBloqueioProtocoloPelaPergunta() != null) {
			existeBloqueio = orgao.getConfiguracoes()
					.getExisteBloqueioProtocoloPelaPergunta().booleanValue();
		}

		if (existeBloqueio) {
			tempoBloqueio = orgao.getConfiguracoes()
					.getTempoBloqueioProtocoloPelaPergunta();

			if (numeroTentativas >= numeroTentativasOrgao) {

				acionamento.bloquearProtocolo(tempoBloqueio);
				valorRetorno = PROTOCOLO_FOI_BLOQUEADO;
				numeroTentativas = 0;

			} else if (numeroTentativas == (numeroTentativasOrgao - 1)) {
				valorRetorno = ALERTA_BLOQUEIO_PROTOCOLO;
			} else {
				valorRetorno = RESPOSTA_INCORRETA;
			}
		}

		acionamento.getAcionador().getInformacoesConsultaAcionamento()
				.setNumeroTentativasPergunta(new Integer(numeroTentativas));

		acionamentoDao.save(acionamento);

		return valorRetorno;
	}

	public Acionamento getAcionamento(Integer numeroProtocolo)
			throws DaoException {
		Object[] criteria = new Object[1];
		criteria[0] = Expression.eq("numeroProtocolo", numeroProtocolo);
		List acionamento = acionamentoDao.find(criteria);
		if (!acionamento.isEmpty())
			return (Acionamento) acionamento.get(0);

		return null;
	}

	public boolean checarProtocoloBloqueado(Integer numeroProtocolo)
			throws DaoException {
		return this.getAcionamento(numeroProtocolo).checarProtocoloBloqueado();
	}

	public boolean checarAcionadorAnonimo(Integer numeroProtocolo)
			throws DaoException {
		Acionamento acionamento = this.getAcionamento(numeroProtocolo);
		return acionamento.getAcionador().getTipoAcionador().equals(
				TipoAcionador.ANONIMO);
	}

	public boolean enviarCodigoAcessoViaEmail(Orgao orgao,
			Integer numeroProtocolo) throws DaoException {
		Acionamento acionamento = this.getAcionamento(numeroProtocolo);
		
			String codigoAcesso = this.getCodigoAcesso(numeroProtocolo);

			String lsServidorSMTP = "";
			String lsDe = "";
			String lsPara = "";
			String lsAssunto = "";
			String lsTopo = "";
			String lsNome = "";
			String lsTexto = "";

			List listaParametrosGerais = parametrosGeraisDao.list();
			if (listaParametrosGerais != null)
				lsServidorSMTP = ((ParametrosGerais) listaParametrosGerais
						.get(0)).getServidorSMTP();

			lsDe = orgao.getConfiguracoes().getRemetenteEmail();

			lsPara = acionamento.getAcionador().getEmail();

			lsAssunto = "Ouvidoria  " + orgao.getDescricao();

			// Recupera o nome do acionador
			if (acionamento.getAcionador().getTipoAcionador().equals(
					TipoAcionador.PESSOA_JURIDICA)) {
				lsNome = ((AcionadorPessoaJuridica) (acionamento.getAcionador()))
						.getNomeContato();
			}

			if (acionamento.getAcionador().getTipoAcionador().equals(
					TipoAcionador.PESSOA_FISICA)
					|| acionamento.getAcionador().getTipoAcionador().equals(
							TipoAcionador.FUNCIONARIO)) {
				lsNome = ((AcionadorPessoaFisica) (acionamento.getAcionador()))
						.getNome();
			}

			// Monta o cabeçalho do email
			if (acionamento.getAcionador().getSexo().equals("F")) {
				lsTopo = "Prezada";
				if (acionamento.getAcionador().checarAcionadorAnonimo()) {
					lsNome = "cidadã";
				}

			} else if (acionamento.getAcionador().getSexo().equals("M")){
				lsTopo = "Prezado";
				if (acionamento.getAcionador().checarAcionadorAnonimo()) {
					lsNome = "cidadão";
				}
				
			} else{
				lsTopo = "Prezado(a)";
				if (acionamento.getAcionador().checarAcionadorAnonimo()) {
					lsNome = "cidadão";
				}
			}

			lsTexto = "<p>"
					+ lsTopo
					+ " <b>"
					+ lsNome
					+ "</b>,<br><br>"
					+ "Estamos enviando o código de acesso e número de protocolo "
					+ "para consulta da resposta do seu acionamento.<br><br>"
					+ "Protocolo:<b>"+ numeroProtocolo +"</b><br><br>"
					+ "Código de acesso: <b>" + codigoAcesso + "</b><br><br>"
					+ "Atenciosamente,<br><br>" + "Ouvidoria - <b>"
					+ orgao.getDescricao() + "</b><br>"
					+ orgao.getConfiguracoes().getUrlSuporteUsuario();

			lsTexto = lsTexto + "</b></p>";

			return Utilitario.enviarEmail(lsServidorSMTP, lsDe, lsPara, "", "",
					lsAssunto, lsTexto);
		}
	
	public boolean enviarProtocoloViaEmail(Orgao orgao,
			Integer numeroProtocolo) throws DaoException {
			
			Acionamento acionamento = this.getAcionamento(numeroProtocolo);
		
			String lsServidorSMTP = "";
			String lsDe = "";
			String lsPara = "";
			String lsAssunto = "";
			String lsTopo = "";
			String lsNome = "";
			String lsTexto = "";

			List listaParametrosGerais = parametrosGeraisDao.list();
			
			if (listaParametrosGerais != null)
				lsServidorSMTP = ((ParametrosGerais) listaParametrosGerais
						.get(0)).getServidorSMTP();

			lsDe = orgao.getConfiguracoes().getRemetenteEmail();

			lsPara = acionamento.getAcionador().getEmail();

			lsAssunto = "Ouvidoria  " + orgao.getDescricao();

			// Recupera o nome do acionador
			if (acionamento.getAcionador().getTipoAcionador().equals(
					TipoAcionador.PESSOA_JURIDICA)) {
				lsNome = ((AcionadorPessoaJuridica) (acionamento.getAcionador()))
						.getNomeContato();
			}

			if (acionamento.getAcionador().getTipoAcionador().equals(
					TipoAcionador.PESSOA_FISICA)
					|| acionamento.getAcionador().getTipoAcionador().equals(
							TipoAcionador.FUNCIONARIO)) {
				lsNome = ((AcionadorPessoaFisica) (acionamento.getAcionador()))
						.getNome();
			}

			// Monta o cabeçalho do email
			if (acionamento.getAcionador().getSexo().equals("F")) {
				lsTopo = "Prezada";
				if (acionamento.getAcionador().checarAcionadorAnonimo()) {
					lsNome = "cidadã";
				}

			} else {
				lsTopo = "Prezado";
				if (acionamento.getAcionador().checarAcionadorAnonimo()) {
					lsNome = "cidadão";
				}
			}

			lsTexto = "<p>"
					+ lsTopo
					+ " <b>"
					+ lsNome
					+ "</b>,<br><br>"
					+ "Estamos enviando o número de Protocolo "
					+ "para consulta da resposta do seu acionamento.<br><br>"
					+ "Protocolo: <b>" + numeroProtocolo + "</b><br><br>"
					+ "Atenciosamente,<br><br>" + "Ouvidoria - <b>"
					+ orgao.getDescricao() + "</b><br>"
					+ orgao.getConfiguracoes().getUrlSuporteUsuario();

			lsTexto = lsTexto + "</b></p>";

			return Utilitario.enviarEmail(lsServidorSMTP, lsDe, lsPara, "", "",
					lsAssunto, lsTexto);
		}

	public String getCodigoAcesso(Integer numeroProtocolo) throws DaoException {
		Acionamento acionamento = this.getAcionamento(numeroProtocolo);
		return acionamento.getAcionador().getInformacoesConsultaAcionamento()
				.getCodigoAcesso();
	}

	public String getPergunta(Integer numeroProtocolo) throws DaoException {
		Acionamento acionamento = this.getAcionamento(numeroProtocolo);
		return acionamento.getAcionador().getInformacoesConsultaAcionamento()
				.getPergunta();
	}

	public String getCampoValidacao(Integer numeroProtocolo)
			throws DaoException {
		Acionamento acionamento = this.getAcionamento(numeroProtocolo);
		if (acionamento.getAcionador().getTipoAcionador().equals(
				TipoAcionador.FUNCIONARIO)) {
			return "Matricula";
		}

		if (acionamento.getAcionador().getTipoAcionador().equals(
				TipoAcionador.PESSOA_FISICA)) {
			return "CPF";
		}
		if (acionamento.getAcionador().getTipoAcionador().equals(
				TipoAcionador.PESSOA_JURIDICA)) {
			return "CNPJ";
		}

		return null;
	}

	public boolean validarCampoObrigatorio(Integer numeroProtocolo,
			String campoObrigatorioTela) throws DaoException {

		String campoObrigatorio;

		Acionamento acionamento = this.getAcionamento(numeroProtocolo);

		if (acionamento.getAcionador().getTipoAcionador().equals(
				TipoAcionador.FUNCIONARIO)) {
			campoObrigatorio = ((AcionadorFuncionario) (acionamento
					.getAcionador())).getMatricula();
			if (campoObrigatorioTela.equals(campoObrigatorio)) {
				return true;
			}
		}
		if (acionamento.getAcionador().getTipoAcionador().equals(
				TipoAcionador.PESSOA_FISICA)) {
			campoObrigatorio = ((AcionadorPessoaFisica) (acionamento
					.getAcionador())).getCpf();
			if (campoObrigatorioTela.equals(campoObrigatorio)) {
				return true;
			}
		}

		if (acionamento.getAcionador().getTipoAcionador().equals(
				TipoAcionador.PESSOA_JURIDICA)) {
			campoObrigatorio = ((AcionadorPessoaJuridica) (acionamento
					.getAcionador())).getCnpj();
			if (campoObrigatorioTela.equals(campoObrigatorio)) {
				return true;
			}
		}
		return false;
	}

	public boolean validarResposta(Integer numeroProtocolo,
			String respostaUsuario) throws DaoException {
		Acionamento acionamento = this.getAcionamento(numeroProtocolo);
		if (respostaUsuario.equalsIgnoreCase(acionamento.getAcionador()
				.getInformacoesConsultaAcionamento().getResposta())) {
			return true;
		}
		return false;
	}

}