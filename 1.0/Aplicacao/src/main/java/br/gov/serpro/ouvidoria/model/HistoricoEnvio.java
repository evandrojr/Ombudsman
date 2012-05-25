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
 * HistoricoEnvio Histórico de envios de boletins
 * 
 * @author SERPRO
 * @version $Revision: 1.1.2.3 $, $Date: 2011/10/20 17:07:44 $
 * @version 0.1, Date: 2004/11/19
 */
public class HistoricoEnvio extends PersistentObject {

	private static final long serialVersionUID = 1L;

	/* Requerido */
	private Long id;

	private Timestamp dataEnvio;

	private String listaEmails;

	private Boletim boletim;

	private Funcionario funcionario;

	/**
	 * @return Retorna dataEnvio.
	 */
	public Timestamp getDataEnvio() {
		return dataEnvio;
	}

	/**
	 * @param dataEnvio
	 *            dataEnvio a ser atribuido.
	 */
	public void setDataEnvio(Timestamp dataEnvio) {
		this.dataEnvio = dataEnvio;
	}

	/**
	 * @return Retorna id.
	 */
	public Long getId() {
		return id;
	}

	/**
	 * @param id
	 *            id a ser atribuido.
	 */
	public void setId(Long id) {
		this.id = id;
	}

	/**
	 * @return Retorna listaEmails.
	 */
	public String getListaEmails() {
		return listaEmails;
	}

	/**
	 * @param listaEmails
	 *            listaEmails a ser atribuido.
	 */
	public void setListaEmails(String listaEmails) {
		this.listaEmails = listaEmails;
	}

	/**
	 * @return Retorna boletim.
	 */
	public Boletim getBoletim() {
		return boletim;
	}

	/**
	 * @param boletim
	 *            boletim a ser atribuido.
	 */
	public void setBoletim(Boletim boletim) {
		this.boletim = boletim;
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
}