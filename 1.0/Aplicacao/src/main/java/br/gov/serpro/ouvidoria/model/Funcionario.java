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

import br.gov.serpro.ouvidoria.util.Constants;
import br.gov.serpro.ouvidoria.util.Utilitario;

/**
 * Funcionario Esta classe representa os funcionários que são usuários do
 * sistema.
 * 
 * @author SERPRO
 * @version $Revision: 1.1.2.3 $, $Date: 2011/10/20 17:07:44 $
 * @version 0.1, Date: 2004/11/19
 */
public class Funcionario extends PersistentObject {

	private static final long serialVersionUID = 1L;

	public static final String ATIVO = "A";

	public static final String INATIVO = "I";

	public static final String SUSPENSO = "S";

	public static final int NA_ORGAO = 0;

	public static final int NA_SUB_ORGAO = 1;

	/* Requerido */
	private Long id;

	/* Requerido */
	private String login;

	/* Requerido */
	private String nome;

	/* Requerido */
	private String senha;

	/* Requerido */
	private Integer qtdTentativasLogin;

	/* Requerido */
	private Timestamp dataBloqueioLogin;

	/* Requerido */
	private String situacao;

	private String motivoNivelAtuacao;

	private Instituicao instituicao;

	/* Requerido */
	private Perfil perfil;

	private String email;

	private Collection listaLocalidadeOcorrencia = new TreeSet();

	private Collection listaFuncionalidade = new TreeSet();

	private Collection listaInstituicao = new TreeSet();

	private Collection listaTipoMensagem = new TreeSet();

	private Collection listaAssunto = new TreeSet();

	private Collection listaAcionamento = new TreeSet();

	private String consultor;

	/**
	 * @return Returns the consultor.
	 */
	public String getConsultor() {
		return consultor;
	}

	/**
	 * @param consultor
	 *            The consultor to set.
	 */
	public void setConsultor(String consultor) {
		this.consultor = consultor;
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
	 * @return Retorna o login.
	 */
	public String getLogin() {
		return login;
	}

	/**
	 * @param login
	 *            login a ser atribuído.
	 */
	public void setLogin(String login) {
		if (login == null || login.length() == 0) {
			throw new NullPointerException();
		}
		this.login = login;
	}

	/**
	 * @return Retorna o nome.
	 */
	public String getNome() {
		return nome;
	}

	/**
	 * @param nome
	 *            nome a ser atribuído.
	 */
	public void setNome(String nome) {
		if (nome == null || nome.length() == 0) {
			throw new NullPointerException();
		}
		this.nome = nome;
	}

	/**
	 * @return Retorna a senha.
	 */
	public String getSenha() {
		String dec = null;

		if (this.senha != null)
			try {
				dec = new String(Utilitario.decrypt(Constants.DES_KEY,
						this.senha));
				if (dec.trim().length() == 0) {
					dec = this.senha;
				}
			} catch (RuntimeException e) {
				if (Constants.DEBUG) {
					System.out.println(e);
				}
				dec = this.senha;
			}

		return dec;
	}

	/**
	 * @param senha
	 *            senha a ser atribuída.
	 */
	public void setSenha(final String senha) {
		if (senha == null || senha.length() == 0) {
			throw new NullPointerException();
		}

		String enc = null;

		if (senha != null)
			try {
				enc = Utilitario.encrypt(Constants.DES_KEY, senha);
			} catch (RuntimeException e) {
				if (Constants.DEBUG) {
					System.out.println(e);
				}
				enc = senha;
			}

		this.senha = enc;
	}

	/**
	 * @return Retorna situação.
	 */
	public String getSituacao() {
		return situacao;
	}

	/**
	 * @param situacao
	 *            situação a ser atribuída.
	 */
	public void setSituacao(String situacao) {
		if (situacao == null || situacao.length() == 0) {
			throw new NullPointerException();
		}
		if ((situacao != null) && (situacao.length() > 0)
				&& (situacao.compareTo(Funcionario.ATIVO) != 0)
				&& (situacao.compareTo(Funcionario.INATIVO) != 0)
				&& (situacao.compareTo(Funcionario.SUSPENSO) != 0)) {
			throw new IllegalArgumentException();
		}
		this.situacao = situacao;
	}

	/**
	 * @return Retorna instituicao.
	 */
	public Instituicao getInstituicao() {
		return instituicao;
	}

	/**
	 * @param instituicao
	 *            instituicao a ser atribuida.
	 */
	public void setInstituicao(Instituicao instituicao) {
		this.instituicao = instituicao;
	}

	/**
	 * @return Retorna perfil.
	 */
	public Perfil getPerfil() {
		return perfil;
	}

	/**
	 * @param perfil
	 *            perfil a ser atribuido.
	 */
	public void setPerfil(Perfil perfil) {
		if (perfil == null) {
			throw new NullPointerException();
		}
		this.perfil = perfil;
	}

	/**
	 * @return Retorna localidadeOcorrencia.
	 */
	public Collection getListaLocalidadeOcorrencia() {
		return listaLocalidadeOcorrencia;
	}

	/**
	 * 
	 * @param listaLocalidadeOcorrencia
	 */
	public void setListaLocalidadeOcorrencia(
			Collection listaLocalidadeOcorrencia) {
		this.listaLocalidadeOcorrencia = listaLocalidadeOcorrencia;
	}

	/**
	 * @return Retorna lista de tipos de mensagem sob responsabilidade do
	 *         funcionário.
	 */
	public Collection getListaTipoMensagem() {
		return listaTipoMensagem;
	}

	/**
	 * @param listaTipoMensagem
	 *            lista de tipos de mensagem a ser atribuída.
	 */
	public void setListaTipoMensagem(Collection listaTipoMensagem) {
		this.listaTipoMensagem = listaTipoMensagem;
	}

	/**
	 * Este método é responsável por adicionar um tipo de mensagem na lista de
	 * tipos de mensagem sob responsabilidade do funcionário
	 * 
	 * @param tipoMensagem
	 *            tipoMensagem a ser incluído
	 */
	public void adicionarTipoMensagem(TipoMensagem tipoMensagem) {
		this.listaTipoMensagem.add(tipoMensagem);
	}

	/**
	 * Este método é responsável por remover um tipo de mensagem da lista de
	 * tipos de mensagem sob responsabilidade do funcionário
	 * 
	 * @param tipoMensagem
	 *            tipoMensagem a ser removido
	 */
	public void removerTipoMensagem(TipoMensagem tipoMensagem) {
		this.listaTipoMensagem.remove(tipoMensagem);
	}

	/**
	 * @return Retorna lista de assuntos sob responsabilidade do funcionário.
	 */
	public Collection getListaAssunto() {
		return listaAssunto;
	}

	/**
	 * @param listaAssunto
	 *            lista de assuntos a ser atribuída.
	 */
	public void setListaAssunto(Collection listaAssunto) {
		this.listaAssunto = listaAssunto;
	}

	/**
	 * Este método é responsável por adicionar um assunto na lista de assuntos
	 * sob responsabilidade do funcionário
	 * 
	 * @param assunto
	 *            assunto a ser incluído
	 */
	public void adicionarAssunto(Assunto assunto) {
		this.listaAssunto.add(assunto);
	}

	/**
	 * Este método é responsável por remover um assunto da lista de assuntos sob
	 * responsabilidade do funcionário
	 * 
	 * @param assunto
	 *            assunto a ser removido
	 */
	public void removerAssunto(Assunto assunto) {
		this.listaAssunto.remove(assunto);
	}

	/**
	 * @return Retorna lista de instituições as quais o funcionário está
	 *         alocado.
	 */
	public Collection getListaInstituicao() {
		return listaInstituicao;
	}

	/**
	 * @return Retorna lista de instituições dentro da vigência.
	 * 
	 */
	public Collection getListaSubOrgaosAtivos() {
		Collection lista = new ArrayList();

		if (this.listaInstituicao == null || this.listaInstituicao.isEmpty()) {
			return null;
		}

		final Timestamp agora = new Timestamp(System.currentTimeMillis());

		for (Iterator iter = this.listaInstituicao.iterator(); iter.hasNext();) {
			Instituicao inst = (Instituicao) iter.next();

			if (inst instanceof SubOrgao
					&& (((SubOrgao) inst).getDataFimVigencia() == null || ((SubOrgao) inst)
							.getDataFimVigencia().after(agora))) {
				lista.add(inst);
			}
		}

		return lista;
	}

	/**
	 * @return Retorna lista de instituições independente da vigência.
	 * 
	 */
	public Collection getListaTodosSubOrgaos() {
		Collection lista = new ArrayList();

		if (this.listaInstituicao == null || this.listaInstituicao.isEmpty()) {
			return null;
		}

		for (Iterator iter = this.listaInstituicao.iterator(); iter.hasNext();) {
			Instituicao inst = (Instituicao) iter.next();

			if (inst instanceof SubOrgao) {
				lista.add(inst);
			}
		}

		return lista;
	}

	/**
	 * @param listaInstituicao
	 *            lista de instituições a ser atribuída.
	 */
	public void setListaInstituicao(Collection listaInstituicao) {
		this.listaInstituicao = listaInstituicao;
	}

	/**
	 * Este método é responsável por adicionar uma instituição na lista de
	 * instituições as quais o funcionário está alocado.
	 * 
	 * @param instituicao
	 *            instituicao a ser incluída
	 */
	public void adicionarInstituicao(Instituicao instituicao) {
		this.listaInstituicao.add(instituicao);
	}

	/**
	 * Este método é responsável por remover uma instituição da lista de
	 * instituições as quais o funcionário está alocado
	 * 
	 * @param instituicao
	 *            instituicao a ser removida
	 */
	public void removerInstituicao(Instituicao instituicao) {
		this.listaInstituicao.remove(instituicao);
	}

	/**
	 * @return Retorna listaAcionamento.
	 */
	public Collection getListaAcionamento() {
		return this.listaAcionamento;
	}

	/**
	 * @param listaAcionamento
	 *            listaAcionamento a ser atribuido.
	 */
	public void setListaAcionamento(Collection listaAcionamento) {
		this.listaAcionamento = listaAcionamento;
	}

	/**
	 * Este método é responsável por adicionar um acionamento na lista de
	 * acionamentos sob responsabilidade do funcionário.
	 * 
	 * @param acionamento
	 *            acionamento a ser incluído
	 */
	public void adicionarAcionamento(Acionamento acionamento) {
		this.listaAcionamento.add(acionamento);
	}

	/**
	 * Este método é responsável por remover um acionamento da lista de
	 * acionamentos sob responsabilidade do funcionário.
	 * 
	 * @param acionamento
	 *            acionamento a ser removido
	 */
	public void removerAcionamento(Acionamento acionamento) {
		this.listaAcionamento.remove(acionamento);
	}

	/**
	 * @return Lista de acionamentos pendentes sob responsabilidade do
	 *         funcionário.
	 */
	public List consultarMensagensPendentesPorResponsabilidade() {
		List listaMensagensPendentesFuncionario = new ArrayList();
		Iterator i = this.listaAcionamento.iterator();
		Acionamento acionamento;
		while (i.hasNext()) {
			acionamento = (Acionamento) i.next();
			if (!acionamento.getEstadoAcionamento().equals(
					EstadoAcionamento.RESPONDIDO)
					&& !acionamento.getEstadoAcionamento().equals(
							EstadoAcionamento.ENVIADO)) {
				listaMensagensPendentesFuncionario.add(acionamento);
			}
		}
		return listaMensagensPendentesFuncionario;
	}

	/**
	 * Este método testa se o funcionário tem responsabilidade sobre um assunto
	 * 
	 * @param assunto
	 *            Assunto o qual se deseja testar a responsabilidade do
	 *            funcionário
	 * @return True se o funcionário tem responsabilidade, falso caso contrário
	 */
	public boolean checarResponsabilidadeAssunto(Assunto assunto) {
		if (this.listaAssunto.contains(assunto)) {
			return true;
		}
		return false;
	}

	/**
	 * Este método testa se um funcionário está alocado a um sub órgão
	 * 
	 * @param subOrgao
	 *            SubOrgao que se deseja testar se o funcionario esta alocado
	 * @return True se o funcionario esta alocado ao suborgao, false caso
	 *         contrario
	 */
	public boolean checarAlocacaoSubOrgao(SubOrgao subOrgao) {
		if (this.listaInstituicao.contains(subOrgao)) {
			return true;
		}
		return false;
	}

	/**
	 * Este método testa se um funcionário esté responsável por uma localidade
	 * 
	 * @param localidadeOcorrencia
	 *            localidade que se deseja testar se o funcionário tem
	 *            responsabilidade sobre ela.
	 * @return true se o funcionário é responsável pela localidade, false caso
	 *         contrário
	 */
	public boolean checarResponsabilidadeLocalidade(
			LocalidadeOcorrencia localidadeOcorrencia) {
		if (this.listaLocalidadeOcorrencia.contains(localidadeOcorrencia)) {
			return true;
		}
		return false;
	}

	/**
	 * @return Número de mensagens pendentes sob responsabilidade do funcionário
	 */
	public int obterQtdMensagensSobResponsabilidade() {
		return consultarMensagensPendentesPorResponsabilidade().size();
	}

	/**
	 * @return Retorna listaFuncionalidade.
	 */
	public Collection getListaFuncionalidade() {
		return this.listaFuncionalidade;
	}

	/**
	 * @param listaFuncionalidade
	 *            listaFuncionalidade a ser atribuido.
	 */
	public void setListaFuncionalidade(Collection listaFuncionalidade) {
		this.listaFuncionalidade = listaFuncionalidade;
	}

	/**
	 * Recupera todos os assuntos nos quais o funcionario atua, seja através de
	 * algum órgão ou sub-órgão
	 * 
	 * @param situacao
	 *            "Ativo" - retorna os assuntos ativos "Inativo" - retorna os
	 *            assuntos inativos "Ambos" - retorna os assuntos ativos e
	 *            inativos
	 * 
	 * @return Retorna listaAssunto.
	 */
	public List getListaAssuntosComAtuacao(String situacao) {
		List listaAssunto = new ArrayList();
		Collection listaAssuntoInstituicao = new ArrayList();
		Assunto assunto;
		Instituicao inst;
		Iterator iterInst;
		Iterator iterAssunto;

		if (this.listaInstituicao != null) {
			iterInst = this.listaInstituicao.iterator();
			while (iterInst.hasNext()) {
				inst = (Instituicao) iterInst.next();

				if (inst instanceof Orgao) {
					listaAssuntoInstituicao = ((Orgao) inst)
							.getListaTodosAssuntos(situacao);
				}

				if (inst instanceof SubOrgao) {
					listaAssuntoInstituicao = ((SubOrgao) inst)
							.getListaTodosAssuntos(situacao);
				}

				if (listaAssuntoInstituicao != null) {
					iterAssunto = listaAssuntoInstituicao.iterator();
					while (iterAssunto.hasNext()) {
						assunto = (Assunto) iterAssunto.next();
						if (!listaAssunto.contains(assunto))
							listaAssunto.add(assunto);
					}
				}
			}

			class AssuntoComparator implements Comparator {
				public final int compare(Object a, Object b) {
					return (((Assunto) a).getDescricao())
							.compareTo((((Assunto) b).getDescricao()));
				} // end compare
			} // end class AssuntoComparator

			Collections.sort(listaAssunto, new AssuntoComparator());

			if (!listaAssunto.isEmpty())
				return listaAssunto;
		}

		return listaAssunto;

	}

	/**
	 * @return Retorna motivoNivelAtuacao.
	 */
	public String getMotivoNivelAtuacao() {
		return this.motivoNivelAtuacao;
	}

	/**
	 * @param motivoNivelAtuacao
	 *            motivoNivelAtuacao a ser atribuido.
	 */
	public void setMotivoNivelAtuacao(String motivoNivelAtuacao) {
		this.motivoNivelAtuacao = motivoNivelAtuacao;
	}

	/**
	 * Retorna o nível de atuação do funcionario
	 * 
	 * @return 0 para órgão, 1 para Sub-órgão
	 */
	public int getNivelAtuacao() {

		int nivel = NA_SUB_ORGAO;
		if (this.listaInstituicao == null || this.listaInstituicao.isEmpty()) {
			nivel = NA_ORGAO;
		} else if (this.listaInstituicao.size() == 1) {
			if (this.getListaInstituicao().iterator().next() instanceof Orgao) {
				nivel = NA_ORGAO;
			}
		}
		return nivel;
	}

	/**
	 * @return Retorna dataBloqueioLogin.
	 */
	public Timestamp getDataBloqueioLogin() {
		return this.dataBloqueioLogin;
	}

	/**
	 * @param dataBloqueioLogin
	 *            dataBloqueioLogin a ser atribuido.
	 */
	public void setdataBloqueioLogin(Timestamp dataBloqueioLogin) {
		this.dataBloqueioLogin = dataBloqueioLogin;
	}

	/**
	 * @return Retorna qtdTentativasLogin.
	 */
	public Integer getQtdTentativasLogin() {
		return this.qtdTentativasLogin;
	}

	/**
	 * @param qtdTentativasLogin
	 *            qtdTentativasLogin a ser atribuido.
	 */
	public void setQtdTentativasLogin(Integer qtdTentativasLogin) {
		this.qtdTentativasLogin = qtdTentativasLogin;
	}

	/**
	 * Este método incrementa o Número de tentativas erradas para login.
	 */
	public void incrementarQtdTentativasLogin() {
		if (this.qtdTentativasLogin == null) {
			this.setQtdTentativasLogin(new Integer(1));
		} else {
			this.setQtdTentativasLogin(new Integer(this.qtdTentativasLogin
					.intValue() + 1));
		}
	}

	/**
	 * Este método zera o Número de tentativas erradas para login.
	 */
	public void zerarQtdTentativasLogin() {
		this.qtdTentativasLogin = new Integer(0);
		this.dataBloqueioLogin = null;
	}

	/**
	 * Este método verifica se um login está bloqueado e se já pode ser
	 * desbloqueado.
	 * 
	 * @return <code>true</code> se o funcionário estiver bloqueado,
	 *         <code>false</code> caso contrário.
	 */
	public boolean checarLoginBloqueado() {

		// Se a data é nula, não está bloqueado
		if (this.dataBloqueioLogin == null) {
			return false;
		}

		// Se a data é menor que a dataAtual, não está bloqueado e
		// desbloqueia o protocolo
		Timestamp dataAtual = new Timestamp(System.currentTimeMillis());
		if (this.dataBloqueioLogin.before(dataAtual)) {
			desbloquearLogin();
			return false;
			// Login está bloqueado se a data é >= dataAtual
		}

		return true;
	}

	/**
	 * Este método é responsável por desbloquear um login.
	 */
	public void desbloquearLogin() {
		// limpa a data de desbloqueio
		this.dataBloqueioLogin = null;

		// Zera Número de tentativas erradas
		zerarQtdTentativasLogin();
	}

	/**
	 * Este método atribui o tempo limite de bloqueio.
	 * 
	 * @param tempoBloqueio
	 *            Tempo de bloqueio (em minutos)
	 */
	public void bloquearLogin(Integer tempoBloqueio) {
		this.dataBloqueioLogin = new Timestamp(System.currentTimeMillis()
				+ Utilitario.converterMinutoMilisegundos(tempoBloqueio
						.intValue()));
	}

	/**
	 * @param email
	 *            the email to set
	 */
	public void setEmail(String email) {
		this.email = email;
	}

	/**
	 * @return the email
	 */
	public String getEmail() {
		return email;
	}

}