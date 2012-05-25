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
import java.util.Collection;
import java.util.TreeSet;

import br.gov.serpro.ouvidoria.util.Utilitario;

/**
 * Esta classe representa as soluções de acionamento que podem ser usadas nas
 * soluções de outros acionamentos.
 * 
 * @author SERPRO
 * @version $Revision: 1.1.2.3 $, $Date: 2011/10/20 19:27:38 $
 * @version 0.1, Date: 2004/11/19
 */
public class Solucao extends PersistentObject {

	private static final long serialVersionUID = 1L;

	/* Requerido */
	private Long id;

	/* Requerido */
	private String titulo;

	/* Requerido */
	private String texto;

	/* Requerido */
	private Timestamp dataCadastramento;

	private Timestamp dataVigencia;

	/* Requerido */
	private Assunto assunto;

	private Funcionario funcionario;

	private EstadoSolucao estado;

	private String observacao;

	private Collection listaRespostaAcionamento = new TreeSet();

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
		return titulo;
	}

	/**
	 * @param titulo
	 *            O título a ser atribuído.
	 */
	public void setTitulo(String titulo) {
		if (titulo == null || titulo.length() == 0) {
			throw new NullPointerException();
		}
		this.titulo = titulo;
	}

	/**
	 * @return Retorna o texto.
	 */
	public String getTexto() {
		return texto;
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
	public void setTexto(String texto) {
		if (texto == null || texto.length() == 0) {
			throw new NullPointerException();
		}
		this.texto = texto;
	}

	/**
	 * @return Retorna a data (e hora) de cadastramento da solução.
	 */
	public Timestamp getDataCadastramento() {
		return dataCadastramento;
	}

	/**
	 * @param data
	 *            A data (e hora) de cadastramento da solução.
	 */
	public void setDataCadastramento(Timestamp dataCadastramento) {
		if (dataCadastramento == null) {
			throw new NullPointerException();
		}
		this.dataCadastramento = dataCadastramento;
	}

	/**
	 * @return Retorna dataVigencia.
	 */
	public Timestamp getDataVigencia() {
		return dataVigencia;
	}

	/**
	 * @param dataVigencia
	 *            dataVigencia a ser atribuido.
	 */
	public void setDataVigencia(Timestamp dataVigencia) {
		this.dataVigencia = dataVigencia;
	}

	/**
	 * @return Retorna o assunto ao qual a solução se refere.
	 */
	public Assunto getAssunto() {
		return assunto;
	}

	/**
	 * @param assunto
	 *            O assunto ao qual a solução se refere.
	 */
	public void setAssunto(Assunto assunto) {
		if (assunto == null) {
			throw new NullPointerException();
		}
		this.assunto = assunto;
	}

	/**
	 * @return Retorna funcionario.
	 */
	public Funcionario getFuncionario() {
		return funcionario;
	}

	/**
	 * @param funcionario
	 *            funcionario a ser atribuido.
	 */
	public void setFuncionario(Funcionario funcionario) {
		this.funcionario = funcionario;
	}

	public EstadoSolucao getEstado() {
		return estado;
	}

	public void setEstado(EstadoSolucao estado) {
		this.estado = estado;
	}

	public String getObservacao() {
		return observacao;
	}

	public void setObservacao(String observacao) {
		this.observacao = observacao;
	}

	public Collection getListaRespostaAcionamento() {
		return listaRespostaAcionamento;
	}

	public void setListaRespostaAcionamento(Collection listaRespostaAcionamento) {
		this.listaRespostaAcionamento = listaRespostaAcionamento;
	}

	public int getQuantidadeUtilizacoes() {
		int qtd = 0;
		if (this.listaRespostaAcionamento != null) {
			qtd = this.listaRespostaAcionamento.size();
		}
		return qtd;
	}

}