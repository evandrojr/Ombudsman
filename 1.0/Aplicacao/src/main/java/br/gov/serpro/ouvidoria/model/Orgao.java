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
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.Iterator;
import java.util.List;
import java.util.TreeSet;

import br.gov.serpro.ouvidoria.dao.Dao;
import br.gov.serpro.ouvidoria.dao.DaoException;
import br.gov.serpro.ouvidoria.dao.DaoFactory;
import br.gov.serpro.ouvidoria.dao.hibernate.HibernateDaoFactory;

/**
 * Órgão
 * 
 * Objetivo: Esta classe representa os órgãos.
 * 
 * @author SERPRO
 * @version $Revision: 1.1.2.3 $, $Date: 2011/10/20 19:27:38 $
 * @version 0.1, Date: 2004/11/19
 */
public class Orgao extends Instituicao {

	private static final long serialVersionUID = 1L;

	public static String ATIVO = "A";

	public static String INATIVO = "I";

	/** Requerido */
	private Timestamp dataInicioConsultaResposta;

	/** Requerido */
	private Timestamp dataFimConsultaResposta;

	/** Requerido */
	private String gestorResponsavel;

	/** Requerido */
	private String codigoPaisTelefoneResponsavel;

	/** Requerido */
	private String codigoCidadeTelefoneResponsavel;

	/** Requerido */
	private String telefoneContatoGestor;

	/** Requerido */
	private Timestamp dataInicioAcionamento;

	/** Requerido */
	private Timestamp dataFimAcionamento;

	/** Requerido */
	private String statusOrgao;

	private ConfiguracoesOrgao configuracoes;

	private Collection listaGruposEmail = new TreeSet();

	private Collection listaMeioEnvioRespostaOrgao = new TreeSet();

	private Collection listaSubOrgao = new TreeSet();

	private Collection listaTodosSubOrgaos = new TreeSet();

	private Collection listaTipoAcionadorOrgao = new TreeSet();

	private Collection listaTipoAvaliacaoResposta = new TreeSet();

	private Collection listaTipoMensagem = new TreeSet();

	public Collection getListaTodosSubOrgaos() {
		return listaTodosSubOrgaos;
	}

	public void setListaTodosSubOrgaos(Collection listaTodosSubOrgaos) {
		this.listaTodosSubOrgaos = listaTodosSubOrgaos;
	}

	/**
	 * @return Retorna dataInicioAcionamento.
	 */
	public Timestamp getDataInicioAcionamento() {
		return dataInicioAcionamento;
	}

	/**
	 * @param dataInicioAcionamento
	 *            dataInicioAcionamento a ser atribuída.
	 */
	public void setDataInicioAcionamento(Timestamp dataInicioAcionamento) {
		if (dataInicioAcionamento == null) {
			throw new NullPointerException();
		}
		this.dataInicioAcionamento = dataInicioAcionamento;
	}

	/**
	 * @return Retorna dataFimConsultaResposta.
	 */
	public Timestamp getDataFimConsultaResposta() {
		return dataFimConsultaResposta;
	}

	/**
	 * @param dataFimConsultaResposta
	 *            dataFimConsultaResposta a ser atribuída.
	 */
	public void setDataFimConsultaResposta(Timestamp dataFimConsultaResposta) {
		if (dataFimConsultaResposta == null) {
			throw new NullPointerException();
		}
		this.dataFimConsultaResposta = dataFimConsultaResposta;
	}

	/**
	 * @return Retorna gestorResponsavel.
	 */
	public String getGestorResponsavel() {
		return gestorResponsavel;
	}

	/**
	 * @param gestorResponsavel
	 *            gestorResponsavel a ser atribuído.
	 */
	public void setGestorResponsavel(String gestorResponsavel) {
		if (gestorResponsavel == null || gestorResponsavel.length() == 0) {
			throw new NullPointerException();
		}
		this.gestorResponsavel = gestorResponsavel;
	}

	/**
	 * @return Retorna codigoPaisTelefoneResponsavel.
	 */
	public String getCodigoPaisTelefoneResponsavel() {
		return codigoPaisTelefoneResponsavel;
	}

	/**
	 * @param codigoPaisTelefoneResponsavel
	 *            codigoPaisTelefoneResponsavel a ser atribuído.
	 */
	public void setCodigoPaisTelefoneResponsavel(
			String codigoPaisTelefoneResponsavel) {
		this.codigoPaisTelefoneResponsavel = codigoPaisTelefoneResponsavel;
	}

	/**
	 * @return Retorna codigoCidadeTelefoneResponsavel.
	 */
	public String getCodigoCidadeTelefoneResponsavel() {
		return codigoCidadeTelefoneResponsavel;
	}

	/**
	 * @param codigoCidadeTelefoneResponsavel
	 *            codigoCidadeTelefoneResponsavel a ser atribuído.
	 */
	public void setCodigoCidadeTelefoneResponsavel(
			String codigoCidadeTelefoneResponsavel) {
		this.codigoCidadeTelefoneResponsavel = codigoCidadeTelefoneResponsavel;

	}

	/**
	 * @return Retorna telefoneContatoGestor.
	 */
	public String getTelefoneContatoGestor() {
		return telefoneContatoGestor;
	}

	/**
	 * @param telefoneContatoGestor
	 *            telefoneContatoGestor a ser atribuído.
	 */
	public void setTelefoneContatoGestor(String telefoneContatoGestor) {
		if (telefoneContatoGestor == null
				|| telefoneContatoGestor.length() == 0) {
			throw new NullPointerException();
		}
		this.telefoneContatoGestor = telefoneContatoGestor;
	}

	/**
	 * @return Retorna dataInicioConsultaResposta.
	 */
	public Timestamp getDataInicioConsultaResposta() {
		return dataInicioConsultaResposta;
	}

	/**
	 * @param dataInicioConsultaResposta
	 *            dataInicioConsultaResposta a ser atribuída.
	 */
	public void setDataInicioConsultaResposta(
			Timestamp dataInicioConsultaResposta) {
		if (dataInicioConsultaResposta == null) {
			throw new NullPointerException();
		}
		this.dataInicioConsultaResposta = dataInicioConsultaResposta;
	}

	/**
	 * @return Retorna dataFimAcionamento.
	 */
	public Timestamp getDataFimAcionamento() {
		return dataFimAcionamento;
	}

	/**
	 * @param dataFimAcionamento
	 *            dataFimAcionamento a ser atribuída.
	 */
	public void setDataFimAcionamento(Timestamp dataFimAcionamento) {
		if (dataFimAcionamento == null) {
			throw new NullPointerException();
		}
		this.dataFimAcionamento = dataFimAcionamento;
	}

	/**
	 * @return Retorna o status.
	 */
	public String getStatusOrgao() {
		return statusOrgao;
	}

	/**
	 * @param status
	 *            status a ser atribuído.
	 */
	public void setStatusOrgao(String status) {
		if (status == null || status.length() == 0) {
			throw new NullPointerException();
		}
		if ((status != null) && (status.length() > 0)
				&& (status.compareTo(Orgao.ATIVO) != 0)
				&& (status.compareTo(Orgao.INATIVO) != 0)) {
			throw new IllegalArgumentException();
		}
		this.statusOrgao = status;
	}

	/**
	 * @return Retorna configuracoes.
	 */
	public ConfiguracoesOrgao getConfiguracoes() {
		return this.configuracoes;
	}

	/**
	 * @param configuracoes
	 *            configuracoes a ser atribuido.
	 */
	public void setConfiguracoes(ConfiguracoesOrgao configuracoes) {
		this.configuracoes = configuracoes;
	}

	/**
	 * @return Retorna listaMeioEnvioRespostaOrgao.
	 */
	public Collection getListaMeioEnvioRespostaOrgao() {
		return listaMeioEnvioRespostaOrgao;
	}

	/**
	 * @param listaMeioEnvioRespostaOrgao
	 *            listaMeioEnvioRespostaOrgao a ser atribuido.
	 */
	public void setListaMeioEnvioRespostaOrgao(
			Collection listaMeioEnvioRespostaOrgao) {
		this.listaMeioEnvioRespostaOrgao = listaMeioEnvioRespostaOrgao;
	}

	/**
	 * Este método é responsável por adicionar um meio de envio resposta na
	 * lista de meios de envio de resposta disponíveis para o órgão.
	 * 
	 * @param meioEnvioRespostaOrgao
	 *            meioEnvioRespostaOrgao a ser incluído
	 */
	public void adicionarMeioEnvioRespostaOrgao(
			MeioEnvioRespostaOrgao meioEnvioRespostaOrgao) {
		this.listaMeioEnvioRespostaOrgao.add(meioEnvioRespostaOrgao);
	}

	/**
	 * Este método é responsável por remover um meio de envio resposta da lista
	 * de meios de envio de resposta disponíveis para o órgão.
	 * 
	 * @param meioEnvioRespostaOrgao
	 *            meioEnvioRespostaOrgao a ser removido
	 */
	public void removerMeioEnvioRespostaOrgao(
			MeioEnvioRespostaOrgao meioEnvioRespostaOrgao) {
		this.listaMeioEnvioRespostaOrgao.remove(meioEnvioRespostaOrgao);
	}

	/**
	 * @return Retorna listaSubOrgao.
	 */
	public Collection getListaSubOrgao() {
		return listaSubOrgao;
	}

	/**
	 * @param listaSubOrgao
	 *            listaSubOrgao a ser atribuido.
	 */
	public void setListaSubOrgao(Collection listaSubOrgao) {
		this.listaSubOrgao = listaSubOrgao;
	}

	/**
	 * Recupera todos os assuntos associados aos sub-órgãos do órgão
	 */
	public List getListaAssuntosSubOrgaos() {
		SubOrgao subOrgao;
		Assunto assunto;
		Collection listaAssuntoSubOrgao = new ArrayList();
		Collection listaSubOrgaos = this.getListaSubOrgao();
		List listaAssunto = new ArrayList();
		Iterator iter;
		Iterator iter2;

		// Caso exista sub-órgãos, busca-se seus assuntos
		if (listaSubOrgaos != null) {
			iter = listaSubOrgaos.iterator();
			while (iter.hasNext()) {
				subOrgao = (SubOrgao) iter.next();
				listaAssuntoSubOrgao = subOrgao.getListaAssunto();
				if (listaAssuntoSubOrgao == null)
					continue;
				iter2 = listaAssuntoSubOrgao.iterator();
				while (iter2.hasNext()) {
					assunto = (Assunto) iter2.next();
					if ((!listaAssunto.contains(assunto))
							&& (assunto.getSituacao().compareToIgnoreCase(
									"Ativo") == 0)) {
						listaAssunto.add(assunto);
					}
				}
			}
			class AssuntoComparator implements Comparator {
				public final int compare(Object a, Object b) {
					return (((Assunto) a).getDescricao())
							.compareTo((((Assunto) b).getDescricao()));
				} // end compare
			} // end class StringComparator

			Collections.sort(listaAssunto, new AssuntoComparator());
			return listaAssunto;
		}

		return null;

	}

	/**
	 * Recupera todos os assuntos associados ao órgão e seus sub-órgãos
	 */
	public List getListaTodosAssuntos() {
		SubOrgao subOrgao;
		Assunto assunto;
		Collection listaAssuntoOrgao = new ArrayList();
		Collection listaAssuntoSubOrgao = new ArrayList();
		Collection listaSubOrgaos = this.getListaSubOrgao();
		List listaAssunto = new ArrayList();
		Iterator iter;
		Iterator iter2;

		// Inicialmente recupera a lista de assuntos do órgão
		listaAssuntoOrgao = this.getListaAssunto();
		if (listaAssuntoOrgao != null) {
			iter = listaAssuntoOrgao.iterator();
			while (iter.hasNext()) {
				assunto = (Assunto) iter.next();
				listaAssunto.add(assunto);
			}
		}

		// Caso exista sub-órgãos, busca-se seus assuntos
		if (listaSubOrgaos != null) {
			iter = listaSubOrgaos.iterator();
			while (iter.hasNext()) {
				subOrgao = (SubOrgao) iter.next();
				listaAssuntoSubOrgao = subOrgao.getListaAssunto();
				if (listaAssuntoSubOrgao == null)
					continue;
				iter2 = listaAssuntoSubOrgao.iterator();
				while (iter2.hasNext()) {
					assunto = (Assunto) iter2.next();
					if (!listaAssunto.contains(assunto)) {
						listaAssunto.add(assunto);
					}
				}
			}
			class AssuntoComparator implements Comparator {
				public final int compare(Object a, Object b) {
					return (((Assunto) a).getDescricao())
							.compareTo((((Assunto) b).getDescricao()));
				} // end compare
			} // end class StringComparator

			Collections.sort(listaAssunto, new AssuntoComparator());
			return listaAssunto;
		}

		return null;
	}

	/**
	 * Recupera todos os assuntos associados ao órgão e seus sub-órgãos
	 * 
	 * @param situacao
	 *            "Ativo" - retorna os assuntos ativos "Inativo" - retorna os
	 *            assuntos inativos "Ambos" - retorna os assuntos ativos e
	 *            inativos
	 * 
	 */
	public List getListaTodosAssuntos(String situacao) {
		SubOrgao subOrgao;
		Assunto assunto;
		Collection listaAssuntoOrgao = new ArrayList();
		Collection listaAssuntoSubOrgao = new ArrayList();
		List listaAssunto = new ArrayList();
		Iterator iter;
		Iterator iter2;

		// Inicialmente recupera a lista de assuntos do órgão
		listaAssuntoOrgao = this.getListaAssunto();
		if (listaAssuntoOrgao != null) {
			iter = listaAssuntoOrgao.iterator();
			while (iter.hasNext()) {
				assunto = (Assunto) iter.next();
				if (situacao.equalsIgnoreCase("Ativo"))
					if (assunto.getSituacao() == "Ativo")
						listaAssunto.add(assunto);

				if (situacao.equalsIgnoreCase("Inativo"))
					if (assunto.getSituacao() == "Inativo")
						listaAssunto.add(assunto);

				if (situacao.equalsIgnoreCase("Ambos"))
					listaAssunto.add(assunto);
			}
		}

		// Recupera a lista de sub-órgãos
		Collection listaSubOrgaos = this.getListaSubOrgao();

		// Caso exista sub-órgãos, busca-se seus assuntos
		if (listaSubOrgaos != null) {
			iter = listaSubOrgaos.iterator();
			while (iter.hasNext()) {
				subOrgao = (SubOrgao) iter.next();
				listaAssuntoSubOrgao = subOrgao.getListaAssunto();
				iter2 = listaAssuntoSubOrgao.iterator();
				while (iter2.hasNext()) {
					assunto = (Assunto) iter2.next();
					if (!listaAssunto.contains(assunto)) {

						if (situacao.equalsIgnoreCase("Ativo"))
							if (assunto.getSituacao() == "Ativo")
								listaAssunto.add(assunto);

						if (situacao.equalsIgnoreCase("Inativo"))
							if (assunto.getSituacao() == "Inativo")
								listaAssunto.add(assunto);

						if (situacao.equalsIgnoreCase("Ambos"))
							listaAssunto.add(assunto);

					}
				}
			}

			class AssuntoComparator implements Comparator {
				public final int compare(Object a, Object b) {
					return (((Assunto) a).getDescricao())
							.compareTo((((Assunto) b).getDescricao()));
				} // end compare
			} // end class StringComparator

			Collections.sort(listaAssunto, new AssuntoComparator());
			return listaAssunto;
		}

		return null;
	}

	/**
	 * Este método retorna lista de objetos meioEnvioResposta, que estão dentro
	 * dos objetos MeioEnvioRespostaOrgao
	 * 
	 * @return Lista de objetos Meio Envio Resposta
	 */
	public List getListaMeioEnvioResposta() {
		Iterator iter;
		List listaMeioEnvioResposta = new ArrayList();
		iter = this.listaMeioEnvioRespostaOrgao.iterator();
		while (iter.hasNext()) {
			listaMeioEnvioResposta.add(((MeioEnvioRespostaOrgao) iter.next())
					.getMeioEnvioResposta());
		}

		class MeioEnvioRespostaComparator implements Comparator {
			public final int compare(Object a, Object b) {
				return (((MeioEnvioResposta) a).getDescricao())
						.compareTo((((MeioEnvioResposta) b).getDescricao()));
			} // end compare
		} // end class StringComparator

		Collections.sort(listaMeioEnvioResposta,
				new MeioEnvioRespostaComparator());

		return listaMeioEnvioResposta;
	}

	public String getSituacao() {
		if (this.statusOrgao.compareTo(Orgao.ATIVO) == 0)
			return "Ativo";
		return "Inativo";
	}

	/**
	 * @return Retorna listaTipoMensagem.
	 */
	public Collection getListaTipoMensagem() {
		return listaTipoMensagem;
	}

	/**
	 * @param listaTipoMensagem
	 *            listaTipoMensagem a ser atribuido.
	 */
	public void setListaTipoMensagem(Collection listaTipoMensagem) {
		this.listaTipoMensagem = listaTipoMensagem;
	}

	/**
	 * @return Retorna listaTipoAvaliacaoResposta.
	 */
	public Collection getListaTipoAvaliacaoResposta() {
		return listaTipoAvaliacaoResposta;
	}

	/**
	 * @param listaTipoAvaliacaoResposta
	 *            listaTipoAvaliacaoResposta a ser atribuido.
	 */
	public void setListaTipoAvaliacaoResposta(
			Collection listaTipoAvaliacaoResposta) {
		this.listaTipoAvaliacaoResposta = listaTipoAvaliacaoResposta;
	}

	public List listarTipoMensagemAtivos() {
		Iterator iter;
		TipoMensagem tipoMensagem;

		ArrayList retorno = new ArrayList();

		if (!this.listaTipoMensagem.isEmpty()) {
			iter = this.listaTipoMensagem.iterator();

			while (iter.hasNext()) {
				tipoMensagem = (TipoMensagem) iter.next();
				if (tipoMensagem.getDataVigencia() != null) {
					if (tipoMensagem.getDataVigencia().after(
							new Timestamp(System.currentTimeMillis()))) {
						retorno.add(tipoMensagem);
					}
				} else {
					retorno.add(tipoMensagem);
				}
			}
		}

		class TipoMensagemComparator implements Comparator {
			public final int compare(Object a, Object b) {
				return (((TipoMensagem) a).getDescricao())
						.compareTo((((TipoMensagem) b).getDescricao()));
			} // end compare
		} // end class StringComparator

		Collections.sort(retorno, new TipoMensagemComparator());

		return retorno;
	}

	/**
	 * @return Retorna listaGruposEmail.
	 */
	public Collection getListaGruposEmail() {
		return listaGruposEmail;
	}

	/**
	 * @param listaGruposEmail
	 *            listaGruposEmail a ser atribuido.
	 */
	public void setListaGruposEmail(Collection listaGruposEmail) {
		this.listaGruposEmail = listaGruposEmail;
	}

	/**
	 * @return Retorna listaTipoAcionadorOrgao.
	 */
	public Collection getListaTipoAcionadorOrgao() {
		return listaTipoAcionadorOrgao;
	}

	/**
	 * @param listaTipoAcionadorOrgao
	 *            listaTipoAcionadorOrgao a ser atribuido.
	 */
	public void setListaTipoAcionadorOrgao(Collection listaTipoAcionadorOrgao) {
		this.listaTipoAcionadorOrgao = listaTipoAcionadorOrgao;
	}

	/**
	 * 
	 * @param orgao
	 * @return funcionario
	 * @throws DaoException
	 */
	public Funcionario getOuvidorOrgao(final Orgao orgao) throws DaoException {

		final DaoFactory daoFactory = new HibernateDaoFactory();
		Dao funcionarioDao = daoFactory.create(Funcionario.class);

		Funcionario funcionario = new Funcionario();

		String sql = " select f from Orgao o, Funcionario as f "
				+ " where o.id = " + orgao.getId() + " and f.instituicao = "
				+ orgao.getId() + " and f.perfil = 1 ";

		funcionario = (Funcionario) funcionarioDao.query(sql).get(0);

		return funcionario;
	}

}