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

import java.util.Date;

/**
 * Esta classe representa uma consulta ao andamento de um acionamento no
 * sistema.
 * 
 * @author SERPRO
 * @version $Revision: 1.1.2.3 $, $Date: 2011/10/20 17:07:44 $
 * @version 0.1, Date: 2004/11/19
 */
public class ConsultaAndamento {

	private Long id;
	private String situacao;
	private String assunto;
	private Integer protocolo;
	private Date dataInterna;
	private Date dataExterna;
	private String responsavel;
	private Long idEstadoAcionamento;
	private String titulo;
	private String descricao;

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public String getTitulo() {
		return titulo;
	}

	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}

	public Long getIdEstadoAcionamento() {
		return idEstadoAcionamento;
	}

	public void setIdEstadoAcionamento(Long idEstadoAcionamento) {
		this.idEstadoAcionamento = idEstadoAcionamento;
	}

	public ConsultaAndamento(Long id, Date dataExterna, String situacao,
			String assunto, Integer protocolo, Date dataInterna,
			String responsavel, Long idEstadoAcionamento, String titulo,
			String descricao) {
		setSituacao(situacao);
		setAssunto(assunto);
		setProtocolo(protocolo);
		setDataInterna(dataInterna);
		setResponsavel(responsavel);
		setDataExterna(dataExterna);
		setIdEstadoAcionamento(idEstadoAcionamento);
		setId(id);
		setTitulo(titulo);
		setDescricao(descricao);
	}

	public ConsultaAndamento(Long id, Date dataExterna, String situacao,
			String assunto, Integer protocolo, Date dataInterna,
			String responsavel, Long idEstadoAcionamento) {
		setSituacao(situacao);
		setAssunto(assunto);
		setProtocolo(protocolo);
		setDataInterna(dataInterna);
		setResponsavel(responsavel);
		setDataExterna(dataExterna);
		setIdEstadoAcionamento(idEstadoAcionamento);
		setId(id);
	}

	public String getAssunto() {
		return assunto;
	}

	public void setAssunto(String assunto) {
		this.assunto = assunto;
	}

	public Date getDataInterna() {
		return dataInterna;
	}

	public void setDataInterna(Date dataInterna) {
		this.dataInterna = dataInterna;
	}

	public Integer getProtocolo() {
		return protocolo;
	}

	public void setProtocolo(Integer protocolo) {
		this.protocolo = protocolo;
	}

	public String getResponsavel() {
		return responsavel;
	}

	public void setResponsavel(String responsavel) {
		this.responsavel = responsavel;
	}

	public String getSituacao() {
		return situacao;
	}

	public void setSituacao(String situacao) {
		this.situacao = situacao;
	}

	public Date getDataExterna() {
		return dataExterna;
	}

	public void setDataExterna(Date dataExterna) {
		this.dataExterna = dataExterna;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}
}
