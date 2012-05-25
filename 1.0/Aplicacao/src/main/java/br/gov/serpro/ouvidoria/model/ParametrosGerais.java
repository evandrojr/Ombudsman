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
package br.gov.serpro.ouvidoria.model;

import java.sql.Timestamp;

/**
 * ParametrosGerais os parâmetros gerais do sistema.
 * 
 * @author SERPRO
 * @version $Revision: 1.1.2.3 $, $Date: 2011/10/20 19:27:38 $
 * @version 0.1, Date: 2004/11/19
 */
public class ParametrosGerais extends PersistentObject {

	private static final long serialVersionUID = 1L;

	/* Requerido */
	private Long id;

	/* Requerido */
	private String servidorSMTP;

	/* Requerido */
	private String diretorioContextoAplicacao;

	/* Requerido */
	private String extensoesArquivoAnexoNaoPermitidos;

	/* Requerido */
	private String extensoesMensagemDigitalizadaPermitidas;

	/* Requerido */
	private Integer tempoAcessoBaseFuncionarios;

	/* Requerido */
	private Integer limiteColunaIndicadores;

	/* Requerido */
	private Integer limiteFalhasLogin;

	/* Requerido */
	private Timestamp dataBloqueioLogin;

	/* Requerido */
	private Integer tempoBloqueioLogin;

	/*
	 * (non-Javadoc)
	 * 
	 * @see br.gov.serpro.ouvidoria.model.Identifiable#getId()
	 */
	public Long getId() {
		return id;
	}

	/**
	 * @param id
	 *            O id a ser atribuído.
	 */
	public void setId(Long id) {
		this.id = id;
	}

	/**
	 * @return Retorna servidorSMTP.
	 */
	public String getServidorSMTP() {
		return servidorSMTP;
	}

	/**
	 * @param servidorSMTP
	 *            servidorSMTP a ser atribuido.
	 */
	public void setServidorSMTP(String servidorSMTP) {
		if (servidorSMTP == null || servidorSMTP.length() == 0) {
			throw new NullPointerException();
		}
		this.servidorSMTP = servidorSMTP;
	}

	/**
	 * @return Retorna diretorioContextoAplicacao.
	 */
	public String getDiretorioContextoAplicacao() {
		return diretorioContextoAplicacao;
	}

	/**
	 * @param diretorioContextoAplicacao
	 *            diretorioContextoAplicacao a ser atribuido.
	 */
	public void setDiretorioContextoAplicacao(String diretorioContextoAplicacao) {
		if (diretorioContextoAplicacao == null
				|| diretorioContextoAplicacao.length() == 0) {
			throw new NullPointerException();
		}
		this.diretorioContextoAplicacao = diretorioContextoAplicacao;
	}

	/**
	 * @return Retorna extensoesArquivoAnexoNaoPermitidos.
	 */
	public String getExtensoesArquivoAnexoNaoPermitidos() {
		return extensoesArquivoAnexoNaoPermitidos;
	}

	/**
	 * @param extensoesArquivoAnexoNaoPermitidos
	 *            extensoesArquivoAnexoNaoPermitidos a ser atribuido.
	 */
	public void setExtensoesArquivoAnexoNaoPermitidos(
			String extensoesArquivoAnexoNaoPermitidos) {
		if (extensoesArquivoAnexoNaoPermitidos == null
				|| extensoesArquivoAnexoNaoPermitidos.length() == 0) {
			throw new NullPointerException();
		}
		this.extensoesArquivoAnexoNaoPermitidos = extensoesArquivoAnexoNaoPermitidos;
	}

	/**
	 * @return Retorna extensoesMensagemDigitalizadaPermitidas.
	 */
	public String getExtensoesMensagemDigitalizadaPermitidas() {
		return extensoesMensagemDigitalizadaPermitidas;
	}

	/**
	 * @param extensoesMensagemDigitalizadaPermitidas
	 *            extensoesMensagemDigitalizadaPermitidas a ser atribuido.
	 */
	public void setExtensoesMensagemDigitalizadaPermitidas(
			String extensoesMensagemDigitalizadaPermitidas) {
		if (extensoesMensagemDigitalizadaPermitidas == null
				|| extensoesMensagemDigitalizadaPermitidas.length() == 0) {
			throw new NullPointerException();
		}
		this.extensoesMensagemDigitalizadaPermitidas = extensoesMensagemDigitalizadaPermitidas;
	}

	/**
	 * @return Retorna tempoAcessoBaseFuncionarios.
	 */
	public Integer getTempoAcessoBaseFuncionarios() {
		return tempoAcessoBaseFuncionarios;
	}

	/**
	 * @param tempoAcessoBaseFuncionarios
	 *            tempoAcessoBaseFuncionarios a ser atribuido.
	 */
	public void setTempoAcessoBaseFuncionarios(
			Integer tempoAcessoBaseFuncionarios) {
		if (tempoAcessoBaseFuncionarios == null) {
			throw new NullPointerException();
		}
		this.tempoAcessoBaseFuncionarios = tempoAcessoBaseFuncionarios;
	}

	/**
	 * @return Retorna limiteColunaIndicadores.
	 */
	public Integer getLimiteColunaIndicadores() {
		return this.limiteColunaIndicadores;
	}

	/**
	 * @param limiteColunaIndicadores
	 *            limiteColunaIndicadores a ser atribuido.
	 */
	public void setLimiteColunaIndicadores(Integer limiteColunaIndicadores) {
		this.limiteColunaIndicadores = limiteColunaIndicadores;
	}

	/**
	 * @return Retorna limiteFalhasLogin.
	 */
	public Integer getLimiteFalhasLogin() {
		return this.limiteFalhasLogin;
	}

	/**
	 * @param limiteFalhasLogin
	 *            limiteFalhasLogin a ser atribuido.
	 */
	public void setLimiteFalhasLogin(Integer limiteFalhasLogin) {
		this.limiteFalhasLogin = limiteFalhasLogin;
	}

	/**
	 * @return Retorna dataBloqueioLogin
	 */
	public Timestamp getDataBloqueioLogin() {
		return this.dataBloqueioLogin;
	}

	/**
	 * @param dataBloqueioLogin
	 *            dataBloqueioLogin a ser atribuido.
	 */
	public void setDataBloqueioLogin(Timestamp dataBloqueioLogin) {
		this.dataBloqueioLogin = dataBloqueioLogin;
	}

	/**
	 * @return Retorna tempoBloqueioLogin
	 */
	public Integer getTempoBloqueioLogin() {
		return this.tempoBloqueioLogin;
	}

	/**
	 * @param tempoBloqueioLogin
	 *            tempoBloqueioLogin a ser atribuido.
	 */
	public void setTempoBloqueioLogin(Integer tempoBloqueioLogin) {
		this.tempoBloqueioLogin = tempoBloqueioLogin;
	}

}