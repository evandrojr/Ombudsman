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

/**
 * Órgão - Esta classe representa os sub-órgãos.
 * 
 * @author SERPRO
 * @version $Revision: 1.1.2.3 $, $Date: 2011/10/20 19:27:38 $
 * @version 0.1, Date: 2004/11/19
 */
public class SubOrgao extends Instituicao {

	private static final long serialVersionUID = 1L;

	/* Requerido */
	private Orgao orgao;

	/* Requerido */
	private Timestamp dataInicioVigencia;

	private Timestamp dataFimVigencia;

	private Collection listaLocalidadeOcorrencia = new TreeSet();

	/**
	 * @return Retorna orgao.
	 */
	public Orgao getOrgao() {
		return orgao;
	}

	/**
	 * @param orgao
	 *            orgao a ser atribuído.
	 */
	public void setOrgao(Orgao orgao) {
		if (orgao == null) {
			throw new NullPointerException();
		}
		this.orgao = orgao;
	}

	/**
	 * @return Retorna listaLocalidadeOcorrencia.
	 */
	public Collection getListaLocalidadeOcorrencia() {
		return listaLocalidadeOcorrencia;
	}

	/**
	 * @param listaLocalidadeOcorrencia
	 *            listaLocalidadeOcorrencia a ser atribuido.
	 */
	public void setListaLocalidadeOcorrencia(
			Collection listaLocalidadeOcorrencia) {
		this.listaLocalidadeOcorrencia = listaLocalidadeOcorrencia;
	}

	/**
	 * @return Retorna dataFimVigencia.
	 */
	public Timestamp getDataFimVigencia() {
		return this.dataFimVigencia;
	}

	/**
	 * @param dataFimVigencia
	 *            dataFimVigencia a ser atribuido.
	 */
	public void setDataFimVigencia(Timestamp dataFimVigencia) {
		this.dataFimVigencia = dataFimVigencia;
	}

	/**
	 * @return Retorna dataInicioVigencia.
	 */
	public Timestamp getDataInicioVigencia() {
		return this.dataInicioVigencia;
	}

	/**
	 * @param dataInicioVigencia
	 *            dataInicioVigencia a ser atribuido.
	 */
	public void setDataInicioVigencia(Timestamp dataInicioVigencia) {
		if (dataInicioVigencia == null) {
			throw new NullPointerException();
		}
		this.dataInicioVigencia = dataInicioVigencia;
	}
}