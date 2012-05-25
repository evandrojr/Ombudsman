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

/**
 * Esta classe representa os meios de envio de resposta a acionamentos.
 * 
 * @author SERPRO
 * @version $Revision: 1.1.2.3 $, $Date: 2011/10/20 17:07:44 $
 * @version 0.1, Date: 2004/11/19
 */
public class MeioEnvioResposta extends PersistentObject {

	private static final long serialVersionUID = 1L;

	/* Requerido */
	private Long id;

	/* Requerido */
	private String descricao;

	/* Constante representando o meio de envio de resposta E-Mail */
	public static final MeioEnvioResposta EMAIL = new MeioEnvioResposta(
			new Long(1), "E-Mail");

	/* Constante representando o meio de envio de resposta Internet */
	public static final MeioEnvioResposta INTERNET = new MeioEnvioResposta(
			new Long(2), "Internet");

	/* Constante representando o meio de envio de resposta Carta */
	public static final MeioEnvioResposta CARTA = new MeioEnvioResposta(
			new Long(3), "Carta");

	/* Constante representando o meio de envio de resposta Telefone */
	public static final MeioEnvioResposta TELEFONE = new MeioEnvioResposta(
			new Long(4), "Telefone");

	/* Constante representando o meio de envio de resposta Fax */
	public static final MeioEnvioResposta FAX = new MeioEnvioResposta(new Long(
			5), "Fax");

	/**
	 * Default Constructor
	 * 
	 */
	MeioEnvioResposta() {
		// DO NOTHING
	}

	private MeioEnvioResposta(Long id, String descricao) {
		this.id = id;
		this.descricao = descricao;
	}

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
	 * @return Retorna a descrição.
	 */
	public String getDescricao() {
		return descricao;
	}

	/**
	 * @param descricao
	 *            A descrição a ser atribuída.
	 */
	public void setDescricao(String descricao) {
		if (descricao == null || descricao.length() == 0) {
			throw new NullPointerException();
		}
		this.descricao = descricao;
	}

}