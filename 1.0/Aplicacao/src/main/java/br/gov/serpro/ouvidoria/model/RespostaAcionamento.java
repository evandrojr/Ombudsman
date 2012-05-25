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

import br.gov.serpro.ouvidoria.util.Constants;
import br.gov.serpro.ouvidoria.util.Utilitario;

/**
 * Esta classe representa as respostas aos acionamento.
 * 
 * @author SERPRO
 * @version $Revision: 1.1.2.3 $, $Date: 2011/10/20 19:27:37 $
 * @version 0.1, Date: 2004/11/19
 */
public class RespostaAcionamento extends PersistentObject {

	private static final long serialVersionUID = 1L;

	/* Requerido */
	private Long id;

	private String titulo;

	private String texto;

	/* Requerido */
	private Timestamp data;

	private TipoAvaliacaoResposta tipoAvaliacaoResposta;

	private Timestamp dataEnvio;

	private Solucao solucao;

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
	 * @return Retorna o título.
	 */
	public String getTitulo() {

		String dec = null;

		if (this.titulo != null)
			try {
				dec = new String(Utilitario.decrypt(Constants.DES_KEY,
						this.titulo));
			} catch (RuntimeException e) {
				if (Constants.DEBUG) {
					System.out.println(e);
				}
				dec = this.titulo;
			}

		return dec;
	}

	/**
	 * @param titulo
	 *            O título a ser atribuído.
	 */
	public void setTitulo(final String titulo) {
		String enc = null;

		if (titulo != null)
			try {
				enc = Utilitario.encrypt(Constants.DES_KEY, titulo);
			} catch (RuntimeException e) {
				if (Constants.DEBUG) {
					System.out.println(e);
				}
				enc = titulo;
			}

		this.titulo = enc;
	}

	/**
	 * @return Retorna o título.
	 */
	public String getTexto() {
		String dec = null;

		if (this.texto != null)
			try {
				dec = new String(Utilitario.decrypt(Constants.DES_KEY,
						this.texto));
			} catch (RuntimeException e) {
				if (Constants.DEBUG) {
					System.out.println(e);
				}
				dec = this.texto;
			}

		return dec;
	}

	/**
	 * Retorna o Texto substituindo <code>\n\r, \n ou \r por &lt;br/&gt;</code>;
	 * 
	 * @return Retorna o texto formatado.
	 */
	public String getTextoFormatado() {
		return Utilitario.trataEnter(getTexto());
	}

	/**
	 * @param texto
	 *            O texto a ser atribuído.
	 */
	public void setTexto(final String texto) {
		String enc = null;

		if (texto != null)
			try {
				enc = Utilitario.encrypt(Constants.DES_KEY, texto);
			} catch (RuntimeException e) {
				if (Constants.DEBUG) {
					System.out.println(e);
				}
				enc = texto;
			}

		this.texto = enc;
	}

	/**
	 * @return Retorna a data (e hora) da resposta.
	 */
	public Timestamp getData() {
		return data;
	}

	/**
	 * @param data
	 *            A data (e hora) da resposta.
	 */
	public void setData(Timestamp data) {
		if (data == null) {
			throw new NullPointerException();
		}
		this.data = data;
	}

	/**
	 * @return Retorna a dataEnvio da resposta.
	 */
	public Timestamp getDataEnvio() {
		return dataEnvio;
	}

	/**
	 * @param data
	 *            A data de envio da resposta.
	 */
	public void setDataEnvio(Timestamp dataEnvio) {
		this.dataEnvio = dataEnvio;
	}

	/**
	 * @return Retorna o objeto tipo de avaliação resposta associado.
	 */
	public TipoAvaliacaoResposta getTipoAvaliacaoResposta() {
		return tipoAvaliacaoResposta;
	}

	/**
	 * @param tipoAvaliacaoResposta
	 *            O tipo de avaliação de resposta a ser atribuído.
	 */
	public void setTipoAvaliacaoResposta(
			TipoAvaliacaoResposta tipoAvaliacaoResposta) {
		this.tipoAvaliacaoResposta = tipoAvaliacaoResposta;
	}

	/**
	 * Este método é responsável por criar um objeto com a avaliação da
	 * resposta.
	 * 
	 * @param descricao
	 *            A descrição do tipo avaliação resposta.
	 * @param dataCadastramento
	 *            A data de cadastramento do tipo avaliação resposta.
	 */
	public void criarTipoAvaliacaoResposta(String descricao,
			Timestamp dataCadastramento) {
		if (this.tipoAvaliacaoResposta == null) {
			this.tipoAvaliacaoResposta = new TipoAvaliacaoResposta();
		}
		this.tipoAvaliacaoResposta.setDescricao(descricao);
		this.tipoAvaliacaoResposta.setDataCadastramento(dataCadastramento);
	}

	public Solucao getSolucao() {
		return solucao;
	}

	public void setSolucao(Solucao solucao) {
		this.solucao = solucao;
	}

}