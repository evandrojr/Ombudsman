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
import java.util.Iterator;

import br.gov.serpro.ouvidoria.dao.DaoException;
import br.gov.serpro.ouvidoria.util.Utilitario;

/**
 * Acionamento Esta classe representa os acionamentos.
 * 
 * @author SERPRO
 * @version $Revision: 1.1.2.3 $, $Date: 2011/10/20 17:07:44 $
 * @version 0.1, Date: 2004/11/19
 */
public class Acionamento extends PersistentObject {

	private static final long serialVersionUID = 1L;

	/* Requerido */
	private Long id;

	/* Requerido */
	private Integer numeroProtocolo;

	/* Requerido */
	private Timestamp dataAcionamento;

	private String despacho;

	private Timestamp dataInicioAndamento;

	private Timestamp dataPrevistaResolucaoInterna;

	private Timestamp dataLimiteDesbloqueio;

	private Timestamp dataPrevistaResolucaoExterna;

	/* Requerido */
	private EstadoAcionamento estadoAcionamento;

	/* Requerido */
	private Acionador acionador;

	/* Requerido */
	private Mensagem mensagem;

	private MeioRecebimentoAcionamento meioRecebimentoAcionamento;

	/* Requerido */
	private LocalidadeOcorrencia localidadeOcorrencia;

	/* Requerido */
	private Funcionario funcionario;

	private RespostaAcionamento respostaAcionamento;

	private String origemAcionamento;

	private Boolean atendidoNoPrazo;

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
	 * @return Retorna numeroProtocolo.
	 */
	public Integer getNumeroProtocolo() {
		return numeroProtocolo;
	}

	/**
	 * @param numeroProtocolo
	 *            numeroProtocolo a ser atribuído.
	 */
	public void setNumeroProtocolo(Integer numeroProtocolo) {
		this.numeroProtocolo = numeroProtocolo;
	}

	/**
	 * @return Retorna dataAcionamento.
	 */
	public Timestamp getDataAcionamento() {
		return dataAcionamento;
	}

	/**
	 * @param dataAcionamento
	 *            dataAcionamento a ser atribuído.
	 */
	public void setDataAcionamento(Timestamp dataAcionamento) {
		this.dataAcionamento = dataAcionamento;
	}

	/**
	 * @return Retorna despacho.
	 */
	public String getDespacho() {
		return despacho;
	}

	/**
	 * @param despacho
	 *            despacho a ser atribuído.
	 */
	public void setDespacho(String despacho) {
		this.despacho = despacho;
	}

	/**
	 * @return Retorna dataInicioAndamento.
	 */
	public Timestamp getDataInicioAndamento() {
		return dataInicioAndamento;
	}

	/**
	 * @param dataInicioAndamento
	 *            dataInicioAndamento a ser atribuído.
	 */
	public void setDataInicioAndamento(Timestamp dataInicioAndamento) {
		this.dataInicioAndamento = dataInicioAndamento;
	}

	/**
	 * @return Retorna dataPrevistaResolucaoInterna.
	 */
	public Timestamp getDataPrevistaResolucaoInterna() {
		return dataPrevistaResolucaoInterna;
	}

	/**
	 * @param dataPrevistaResolucaoInterna
	 *            dataPrevistaResolucaoInterna a ser atribuído.
	 */
	public void setDataPrevistaResolucaoInterna(
			Timestamp dataPrevistaResolucaoInterna) {
		this.dataPrevistaResolucaoInterna = dataPrevistaResolucaoInterna;
	}

	/**
	 * @return Retorna dataLimiteDesbloqueio.
	 */
	public Timestamp getDataLimiteDesbloqueio() {
		return dataLimiteDesbloqueio;
	}

	/**
	 * @param dataLimiteDesbloqueio
	 *            dataLimiteDesbloqueio a ser atribuído.
	 */
	public void setDataLimiteDesbloqueio(Timestamp dataLimiteDesbloqueio) {
		this.dataLimiteDesbloqueio = dataLimiteDesbloqueio;
	}

	/**
	 * @return Retorna dataPrevistaResolucaoExterna.
	 */
	public Timestamp getDataPrevistaResolucaoExterna() {
		return dataPrevistaResolucaoExterna;
	}

	/**
	 * @param dataPrevistaResolucaoExterna
	 *            dataPrevistaResolucaoExterna a ser atribuído.
	 */
	public void setDataPrevistaResolucaoExterna(
			Timestamp dataPrevistaResolucaoExterna) {
		this.dataPrevistaResolucaoExterna = dataPrevistaResolucaoExterna;
	}

	/**
	 * @return Retorna estado.
	 */
	public EstadoAcionamento getEstadoAcionamento() {
		return estadoAcionamento;
	}

	/**
	 * @param estado
	 *            estado a ser atribuído.
	 */
	public void setEstadoAcionamento(EstadoAcionamento estadoAcionamento) {
		this.estadoAcionamento = estadoAcionamento;
	}

	/**
	 * @return Retorna acionador.
	 */
	public Acionador getAcionador() {
		return acionador;
	}

	/**
	 * @param acionador
	 *            acionador a ser atribuído.
	 */
	public void setAcionador(Acionador acionador) {
		this.acionador = acionador;
	}

	/**
	 * @return Retorna mensagem.
	 */
	public Mensagem getMensagem() {
		return mensagem;
	}

	/**
	 * @param mensagem
	 *            mensagem a ser atribuído.
	 */
	public void setMensagem(Mensagem mensagem) {
		this.mensagem = mensagem;
	}

	/**
	 * @return Retorna meioRecebimentoAcionamento.
	 */
	public MeioRecebimentoAcionamento getMeioRecebimentoAcionamento() {
		return meioRecebimentoAcionamento;
	}

	/**
	 * @param meioRecebimentoAcionamento
	 *            meioRecebimentoAcionamento a ser atribuído.
	 */
	public void setMeioRecebimentoAcionamento(
			MeioRecebimentoAcionamento meioRecebimentoAcionamento) {
		this.meioRecebimentoAcionamento = meioRecebimentoAcionamento;
	}

	/**
	 * @return Retorna localidadeOcorrencia.
	 */
	public LocalidadeOcorrencia getLocalidadeOcorrencia() {
		return localidadeOcorrencia;
	}

	/**
	 * @param localidadeOcorrencia
	 *            localidadeOcorrencia a ser atribuído.
	 */
	public void setLocalidadeOcorrencia(
			LocalidadeOcorrencia localidadeOcorrencia) {
		this.localidadeOcorrencia = localidadeOcorrencia;
	}

	/**
	 * @return Retorna funcionário.
	 */
	public Funcionario getFuncionario() {
		return funcionario;
	}

	/**
	 * @param funcionario
	 *            Funcionário a ser atribuído.
	 */
	public void setFuncionario(Funcionario funcionario) {
		this.funcionario = funcionario;
	}

	/**
	 * @return Retorna respostaAcionamento.
	 */
	public RespostaAcionamento getRespostaAcionamento() {
		return respostaAcionamento;
	}

	/**
	 * @param respostaAcionamento
	 *            respostaAcionamento a ser atribuído.
	 */
	public void setRespostaAcionamento(RespostaAcionamento respostaAcionamento) {
		this.respostaAcionamento = respostaAcionamento;
	}

	/**
	 * @return Retorna origemAcionamento.
	 */
	public String getOrigemAcionamento() {
		return origemAcionamento;
	}

	/**
	 * @param origemAcionamento
	 *            origemAcionamento a ser atribuído.
	 */
	public void setOrigemAcionamento(String origemAcionamento) {
		this.origemAcionamento = origemAcionamento;
	}

	/**
	 * @return Retorna atendidoNoPrazo.
	 */
	public Boolean getAtendidoNoPrazo() {
		return atendidoNoPrazo;
	}

	/**
	 * @param atendidoNoPrazo
	 *            atendidoNoPrazo a ser atribuído.
	 */
	public void setAtendidoNoPrazo(Boolean atendidoNoPrazo) {
		this.atendidoNoPrazo = atendidoNoPrazo;
	}

	/**
	 * Este método é responsável pela criação de um acionador anônimo.
	 * 
	 * @param sexo
	 *            Sexo do acionador
	 * @param email
	 *            Email do acionador
	 * @param telefone
	 *            Telefone do acionador
	 * @param fax
	 *            Fax do acionador
	 * @param pais
	 *            País de origem do acionamento
	 * @param meioEnvioRespostaOrgao
	 *            Meio pelo qual a resposta ao acionamento será enviada ao
	 *            acionador.
	 * @param escolaridade
	 *            Escolaridade do acionador
	 * @param uf
	 *            UF do acionador
	 * @param faixaEtaria
	 *            Faixa Etária do acionado
	 */
	private void criarAcionadorAnonimo(String sexo, String email,
			String codigoPaisTelefone, String codigoCidadeTelefone,
			String telefone, String codigoPaisFax, String codigoCidadeFax,
			String fax, Pais pais,
			MeioEnvioRespostaOrgao meioEnvioRespostaOrgao,
			Escolaridade escolaridade, UF uf, FaixaEtaria faixaEtaria) {
		if (this.acionador == null) {
			this.acionador = new Acionador();
		}
		this.acionador.setSexo(sexo);
		this.acionador.setEmail(email);
		this.acionador.setCodigoPaisTelefone(codigoPaisTelefone);
		this.acionador.setCodigoCidadeTelefone(codigoCidadeTelefone);
		this.acionador.setTelefone(telefone);
		this.acionador.setCodigoPaisFax(codigoPaisFax);
		this.acionador.setCodigoCidadeFax(codigoCidadeFax);
		this.acionador.setFax(fax);
		this.acionador.setPais(pais);
		this.acionador.setMeioEnvioRespostaOrgao(meioEnvioRespostaOrgao);
		this.acionador.setEscolaridade(escolaridade);
		this.acionador.setUf(uf);
		this.acionador.setTipoAcionador(TipoAcionador.ANONIMO);
		this.acionador.setFaixaEtaria(faixaEtaria);
	}

	/**
	 * Este método é responsável pela criação de um acionador pessoa física.
	 * 
	 * @param sexo
	 *            Sexo do acionador
	 * @param email
	 *            Email do acionador
	 * @param telefone
	 *            Telefone do acionador
	 * @param fax
	 *            Fax do acionador
	 * @param nome
	 *            Nome do acionador
	 * @param cpf
	 *            CPF do acionador
	 * @param pais
	 *            País de origem do acionamento
	 * @param meioEnvioRespostaOrgao
	 *            Meio pelo qual a resposta ao acionamento será enviada ao
	 *            acionador.
	 * @param escolaridade
	 *            Escolaridade do acionador
	 * @param uf
	 *            UF do acionador
	 * @param faixaEtaria
	 *            Faixa Etária do acionador
	 */
	private void criarAcionadorPessoaFisica(String sexo, String email,
			String codigoPaisTelefone, String codigoCidadeTelefone,
			String telefone, String codigoPaisFax, String codigoCidadeFax,
			String fax, String nome, String cpf, Pais pais,
			MeioEnvioRespostaOrgao meioEnvioRespostaOrgao,
			Escolaridade escolaridade, UF uf, FaixaEtaria faixaEtaria) {
		if (this.acionador == null) {
			this.acionador = new AcionadorPessoaFisica();
		}
		((AcionadorPessoaFisica) (this.acionador)).setSexo(sexo);
		((AcionadorPessoaFisica) (this.acionador)).setEmail(email);
		((AcionadorPessoaFisica) (this.acionador))
				.setCodigoPaisTelefone(codigoPaisTelefone);
		((AcionadorPessoaFisica) (this.acionador))
				.setCodigoCidadeTelefone(codigoCidadeTelefone);
		((AcionadorPessoaFisica) (this.acionador)).setTelefone(telefone);
		((AcionadorPessoaFisica) (this.acionador))
				.setCodigoPaisFax(codigoPaisFax);
		((AcionadorPessoaFisica) (this.acionador))
				.setCodigoCidadeFax(codigoCidadeFax);
		((AcionadorPessoaFisica) (this.acionador)).setFax(fax);
		((AcionadorPessoaFisica) (this.acionador)).setNome(nome);
		((AcionadorPessoaFisica) (this.acionador)).setCpf(cpf);
		((AcionadorPessoaFisica) (this.acionador)).setPais(pais);
		((AcionadorPessoaFisica) (this.acionador))
				.setMeioEnvioRespostaOrgao(meioEnvioRespostaOrgao);
		((AcionadorPessoaFisica) (this.acionador))
				.setEscolaridade(escolaridade);
		((AcionadorPessoaFisica) (this.acionador)).setUf(uf);
		((AcionadorPessoaFisica) (this.acionador))
				.setTipoAcionador(TipoAcionador.PESSOA_FISICA);
		((AcionadorPessoaFisica) (this.acionador)).setFaixaEtaria(faixaEtaria);
	}

	/**
	 * Este método é responsável pela criação de um acionador pessoa jurídica.
	 * 
	 * @param sexo
	 *            Sexo do acionador
	 * @param email
	 *            Email do acionador
	 * @param telefone
	 *            Telefone do acionador
	 * @param fax
	 *            Fax do acionador
	 * @param cnpj
	 *            CNPJ do acionador
	 * @param razaoSocial
	 *            Razão social do acionador
	 * @param cpfAcionador
	 *            CPF da pessoa física entrando com o acionamento no sistema em
	 *            nome da pessoa jurídica
	 * @param nomeContato
	 *            Nome de contato na pessoa jurídica
	 * @param pais
	 *            País de origem do acionamento
	 * @param meioEnvioRespostaOrgao
	 *            Meio pelo qual a resposta ao acionamento será enviada ao
	 *            acionador.
	 * @param escolaridade
	 *            Escolaridade do acionador
	 * @param uf
	 *            UF do acionador
	 * @param faixaEtaria
	 *            Faixa Etária do acionador
	 */
	private void criarAcionadorPessoaJuridica(String sexo, String email,
			String codigoPaisTelefone, String codigoCidadeTelefone,
			String telefone, String codigoPaisFax, String codigoCidadeFax,
			String fax, String cnpj, String razaoSocial, String cpfAcionador,
			String nomeContato, Pais pais,
			MeioEnvioRespostaOrgao meioEnvioRespostaOrgao,
			Escolaridade escolaridade, UF uf, FaixaEtaria faixaEtaria) {
		if (this.acionador == null) {
			this.acionador = new AcionadorPessoaJuridica();
		}
		((AcionadorPessoaJuridica) (this.acionador)).setSexo(sexo);
		((AcionadorPessoaJuridica) (this.acionador)).setEmail(email);
		((AcionadorPessoaJuridica) (this.acionador))
				.setCodigoPaisTelefone(codigoPaisTelefone);
		((AcionadorPessoaJuridica) (this.acionador))
				.setCodigoCidadeTelefone(codigoCidadeTelefone);
		((AcionadorPessoaJuridica) (this.acionador)).setTelefone(telefone);
		((AcionadorPessoaJuridica) (this.acionador))
				.setCodigoPaisFax(codigoPaisFax);
		((AcionadorPessoaJuridica) (this.acionador))
				.setCodigoCidadeFax(codigoCidadeFax);
		((AcionadorPessoaJuridica) (this.acionador)).setFax(fax);
		((AcionadorPessoaJuridica) (this.acionador)).setCnpj(cnpj);
		((AcionadorPessoaJuridica) (this.acionador))
				.setRazaoSocial(razaoSocial);
		((AcionadorPessoaJuridica) (this.acionador))
				.setCpfAcionador(cpfAcionador);
		((AcionadorPessoaJuridica) (this.acionador))
				.setNomeContato(nomeContato);
		((AcionadorPessoaJuridica) (this.acionador)).setPais(pais);
		((AcionadorPessoaJuridica) (this.acionador))
				.setMeioEnvioRespostaOrgao(meioEnvioRespostaOrgao);
		((AcionadorPessoaJuridica) (this.acionador))
				.setEscolaridade(escolaridade);
		((AcionadorPessoaJuridica) (this.acionador)).setUf(uf);
		((AcionadorPessoaJuridica) (this.acionador))
				.setTipoAcionador(TipoAcionador.PESSOA_JURIDICA);
		((AcionadorPessoaJuridica) (this.acionador))
				.setFaixaEtaria(faixaEtaria);
	}

	/**
	 * Este método é responsável pela criação de um acionador funcionário.
	 * 
	 * @param sexo
	 *            Sexo do acionador
	 * @param email
	 *            Email do acionador
	 * @param telefone
	 *            Telefone do acionador
	 * @param fax
	 *            Fax do acionador
	 * @param nome
	 *            Nome do acionador
	 * @param cpf
	 *            CPF do acionador
	 * @param matricula
	 *            Matrícula do acionador
	 * @param setor
	 *            Setor do acionador
	 * @param pais
	 *            País de origem do acionamento
	 * @param meioEnvioRespostaOrgao
	 *            Meio pelo qual a resposta ao acionamento será enviada ao
	 *            acionador.
	 * @param escolaridade
	 *            Escolaridade do acionador
	 * @param uf
	 *            UF do acionador
	 * @param faixaEtaria
	 *            Faixa Etária do acionador
	 */
	private void criarAcionadorFuncionario(String sexo, String email,
			String codigoPaisTelefone, String codigoCidadeTelefone,
			String telefone, String codigoPaisFax, String codigoCidadeFax,
			String fax, String nome, String cpf, String matricula,
			String setor, Pais pais,
			MeioEnvioRespostaOrgao meioEnvioRespostaOrgao,
			Escolaridade escolaridade, UF uf, FaixaEtaria faixaEtaria) {
		if (this.acionador == null) {
			this.acionador = new AcionadorFuncionario();
		}
		((AcionadorFuncionario) (this.acionador)).setSexo(sexo);
		((AcionadorFuncionario) (this.acionador)).setEmail(email);
		((AcionadorFuncionario) (this.acionador))
				.setCodigoPaisTelefone(codigoPaisTelefone);
		((AcionadorFuncionario) (this.acionador))
				.setCodigoCidadeTelefone(codigoCidadeTelefone);
		((AcionadorFuncionario) (this.acionador)).setTelefone(telefone);
		((AcionadorFuncionario) (this.acionador))
				.setCodigoPaisFax(codigoPaisFax);
		((AcionadorFuncionario) (this.acionador))
				.setCodigoCidadeFax(codigoCidadeFax);
		((AcionadorFuncionario) (this.acionador)).setFax(fax);
		((AcionadorFuncionario) (this.acionador)).setNome(nome);
		((AcionadorFuncionario) (this.acionador)).setCpf(cpf);
		((AcionadorFuncionario) (this.acionador)).setMatricula(matricula);
		((AcionadorFuncionario) (this.acionador)).setSetor(setor);
		((AcionadorFuncionario) (this.acionador)).setPais(pais);
		((AcionadorFuncionario) (this.acionador))
				.setMeioEnvioRespostaOrgao(meioEnvioRespostaOrgao);
		((AcionadorFuncionario) (this.acionador)).setEscolaridade(escolaridade);
		((AcionadorFuncionario) (this.acionador)).setUf(uf);
		((AcionadorFuncionario) (this.acionador))
				.setTipoAcionador(TipoAcionador.FUNCIONARIO);
		((AcionadorFuncionario) (this.acionador)).setFaixaEtaria(faixaEtaria);
	}

	/**
	 * Este método é responsável pela criação de um acionador.
	 * 
	 * @param sexo
	 *            Sexo do acionador
	 * @param email
	 *            Email do acionador
	 * @param telefone
	 *            Telefone do acionador
	 * @param fax
	 *            Fax do acionador
	 * @param nome
	 *            Nome do acionador (Pessoa física e funcionário)
	 * @param cpf
	 *            CPF do acionador (Pessoa física e funcionário)
	 * @param cnpj
	 *            CNPJ do acionador (pessoa jurídica)
	 * @param razaoSocial
	 *            Razão Social do acionador (pessoa jurídica)
	 * @param cpfAcionador
	 *            CPF da pessoa física representando o acionador (pessoa
	 *            jurídica)
	 * @param nomeContato
	 *            Nome de contato do acionador (pessoa jurídica)
	 * @param matricula
	 *            Matrícula do acionador (Funcionário)
	 * @param setor
	 *            Setor do acionador (Funcionário)
	 * @param pais
	 *            País de origem do acionamento
	 * @param meioEnvioResposta
	 *            Meio pelo qual a resposta ao acionamento será enviada ao
	 *            acionador.
	 * @param escolaridade
	 *            Escolaridade do acionador
	 * @param uf
	 *            UF do acionador
	 * @param faixaEtaria
	 *            Faixa Etária do acionador
	 * @param tipoAcionador
	 *            Tipo do acionador
	 */
	public void criarAcionador(String sexo, String email,
			String codigoPaisTelefone, String codigoCidadeTelefone,
			String telefone, String codigoPaisFax, String codigoCidadeFax,
			String fax, String nome, String cpf, String cnpj,
			String razaoSocial, String cpfAcionador, String nomeContato,
			String matricula, String setor, Pais pais,
			MeioEnvioRespostaOrgao meioEnvioRespostaOrgao,
			Escolaridade escolaridade, UF uf, FaixaEtaria faixaEtaria,
			TipoAcionador tipoAcionador) {

		if (tipoAcionador.equals(TipoAcionador.ANONIMO)) {
			criarAcionadorAnonimo(sexo, email, codigoPaisTelefone,
					codigoCidadeTelefone, telefone, codigoPaisFax,
					codigoCidadeFax, fax, pais, meioEnvioRespostaOrgao,
					escolaridade, uf, faixaEtaria);
		} else {
			if (tipoAcionador.equals(TipoAcionador.PESSOA_FISICA)) {
				criarAcionadorPessoaFisica(sexo, email, codigoPaisTelefone,
						codigoCidadeTelefone, telefone, codigoPaisFax,
						codigoCidadeFax, fax, nome, cpf, pais,
						meioEnvioRespostaOrgao, escolaridade, uf, faixaEtaria);
			} else {
				if (tipoAcionador.equals(TipoAcionador.PESSOA_JURIDICA)) {
					criarAcionadorPessoaJuridica(sexo, email,
							codigoPaisTelefone, codigoCidadeTelefone, telefone,
							codigoPaisFax, codigoCidadeFax, fax, cnpj,
							razaoSocial, cpfAcionador, nomeContato, pais,
							meioEnvioRespostaOrgao, escolaridade, uf,
							faixaEtaria);
				} else {
					if (tipoAcionador.equals(TipoAcionador.FUNCIONARIO)) {
						criarAcionadorFuncionario(sexo, email,
								codigoPaisTelefone, codigoCidadeTelefone,
								telefone, codigoPaisFax, codigoCidadeFax, fax,
								nome, cpf, matricula, setor, pais,
								meioEnvioRespostaOrgao, escolaridade, uf,
								faixaEtaria);
					}
				}
			}
		}
	}

	/**
	 * Este método é responsável por criar um objeto mensagem associado ao
	 * acionamento.
	 * 
	 * @param texto
	 *            texto da mensagem.
	 * @param arquivoAnexo
	 *            Arquivo anexo à mensagem, caso necessário.
	 * @param mensagemDigitalizada
	 *            Mensagem digitalizada, se necessário.
	 * @param titulo
	 *            Título da mensagem.
	 * @param tipoMensagem
	 *            tipo da mensagem.
	 * @param assunto
	 *            assunto da mensagem.
	 */
	public void criarMensagem(String texto, String arquivoAnexo,
			String mensagemDigitalizada, TipoMensagem tipoMensagem,
			Assunto assunto) {
		if (this.mensagem == null) {
			this.mensagem = new Mensagem();
		}
		this.mensagem.setTexto(texto);
		this.mensagem.setArquivoAnexo(arquivoAnexo);
		this.mensagem.setMensagemDigitalizada(mensagemDigitalizada);
		this.mensagem.setTipoMensagem(tipoMensagem);
		this.mensagem.setAssunto(assunto);
	}

	/**
	 * Este método é responsável por salvar um rascunho de uma resposta de um
	 * acionamento.
	 * 
	 * @param titulo
	 *            título da resposta.
	 * @param texto
	 *            texto da resposta.
	 * @param data
	 *            data (e hora) do salvamento do rascunho.
	 */
	public void salvarRascunhoRespostaAcionamento(String titulo, String texto,
			Timestamp data, Long idSolucao) {
		if (this.respostaAcionamento == null) {
			this.respostaAcionamento = new RespostaAcionamento();
		}
		this.respostaAcionamento.setTitulo(titulo);
		this.respostaAcionamento.setTexto(texto);
		this.respostaAcionamento.setData(data);

		if (idSolucao != null) {
			Solucao solucao = new Solucao();
			solucao.setId(idSolucao);
			this.respostaAcionamento.setSolucao(solucao);
		}
	}

	/**
	 * Este método é responsável por finalizar a resposta a um acionamento.
	 * 
	 * @param titulo
	 *            título da resposta.
	 * @param texto
	 *            texto da resposta.
	 * @param data
	 *            data (e hora) do salvamento do rascunho.
	 */
	public void finalizarRespostaAcionamento(String titulo, String texto,
			Timestamp data, Long idSolucao) {

		if (this.respostaAcionamento == null) {
			this.respostaAcionamento = new RespostaAcionamento();
		}

		this.respostaAcionamento.setTitulo(titulo);
		this.respostaAcionamento.setTexto(texto);
		this.respostaAcionamento.setData(data);
		// Muda o estado do acionamento para respondido
		this.estadoAcionamento = EstadoAcionamento.RESPONDIDO;

		if (idSolucao != null) {
			Solucao solucao = new Solucao();
			solucao.setId(idSolucao);
			this.respostaAcionamento.setSolucao(solucao);
		}

		// Caso DataPrevistaResolucaoExterna for > Hoje, Acionamento não foi
		// atendidoNoPrazo
		if (getDataPrevistaResolucaoExterna() != null
				&& getDataPrevistaResolucaoExterna().after(data)) {
			this.setAtendidoNoPrazo(Boolean.TRUE);
		} else {
			this.setAtendidoNoPrazo(Boolean.FALSE);
		}
	}

	public void finalizarRespostaConsultor(String titulo, String texto,
			Timestamp data, Long idSolucao) {

		if (this.respostaAcionamento == null) {
			this.respostaAcionamento = new RespostaAcionamento();
		}

		this.respostaAcionamento.setTitulo(titulo);
		this.respostaAcionamento.setTexto(texto);
		this.respostaAcionamento.setData(data);

		if (idSolucao != null) {
			Solucao solucao = new Solucao();
			solucao.setId(idSolucao);
			this.respostaAcionamento.setSolucao(solucao);
		}
	}

	/**
	 * Este método verifica se um protocolo está bloqueado e se já pode ser
	 * desbloqueado.
	 * 
	 * @param dataAtual
	 */
	public boolean checarProtocoloBloqueado() {
		Timestamp dataAtual = new Timestamp(System.currentTimeMillis());

		// Se a data é nula, não está bloqueado
		if (this.dataLimiteDesbloqueio == null) {
			return false;
		}

		// Se a data é menor que a dataAtual, não está bloqueado e
		// desbloqueia o protocolo
		if (this.dataLimiteDesbloqueio.before(dataAtual)) {
			desbloquearProtocolo();
			return false;
			// Protocolo está bloqueado se a data for maior ou igual a dataAtual
		}

		return true;
	}

	/**
	 * Este método é responsável por desbloquear um protocolo.
	 */
	public void desbloquearProtocolo() {
		// limpa a data de desbloqueio
		this.dataLimiteDesbloqueio = null;
		// Zera número de tentativas erradas (código e pergunta)
		this.acionador.getInformacoesConsultaAcionamento()
				.zerarNumeroTentativasCodigo();
		this.acionador.getInformacoesConsultaAcionamento()
				.zerarNumeroTentativasPergunta();
	}

	/**
	 * Este método é responsável por alterar o assunto de um acionamento sob
	 * responsabilidade de um especialista.
	 * 
	 * @param assunto
	 *            Novo assunto do acionamento
	 */
	public void reclassificarAcionamento(Assunto assunto) {
		this.mensagem.setAssunto(assunto);
	}

	/**
	 * Este método define a data prevista de resolução externa de um
	 * acionamento.
	 */
	public void definirDataPrevistaResolucaoExterna() {
		// Obtém primeiro o prazo no tipo de mensagem
		if (this.mensagem.getTipoMensagem().getPrazoExterno() != null) {
			this.dataPrevistaResolucaoExterna = new Timestamp(
					System.currentTimeMillis()
							+ Utilitario.converterDiaMilisegundos(this.mensagem
									.getTipoMensagem().getPrazoExterno()
									.intValue()));
		} else {
			// Se não há prazo no tipo de mensagem, busca no assunto
			if (this.mensagem.getAssunto().getPrazoExterno() != null) {
				this.dataPrevistaResolucaoExterna = new Timestamp(
						System.currentTimeMillis()
								+ Utilitario
										.converterDiaMilisegundos(this.mensagem
												.getAssunto().getPrazoExterno()
												.intValue()));

			}
		}
	}

	/**
	 * Este método define a data prevista de resolução interna de um
	 * acionamento.
	 */
	public void definirDataPrevistaResolucaoInterna() {
		// Obtém primeiro o prazo no tipo de mensagem
		if (this.mensagem.getTipoMensagem().getPrazoInterno() != null) {
			this.dataPrevistaResolucaoInterna = new Timestamp(
					System.currentTimeMillis()
							+ Utilitario.converterDiaMilisegundos(this.mensagem
									.getTipoMensagem().getPrazoInterno()
									.intValue()));
		} else {
			// Se não há prazo no tipo de mensagem, busca no assunto
			if (this.mensagem.getAssunto().getPrazoInterno() != null) {
				this.dataPrevistaResolucaoInterna = new Timestamp(
						System.currentTimeMillis()
								+ Utilitario
										.converterDiaMilisegundos(this.mensagem
												.getTipoMensagem()
												.getPrazoInterno().intValue()));
			}
		}
	}

	/**
	 * Este método atribui valor ao número do protocolo do acionamento. A
	 * geração do protocolo propriamente dita é feita pelo controlador que chama
	 * este método.
	 * 
	 * @param protocolo
	 *            Número do protocolo
	 */
	public void gerarProtocolo(Integer protocolo) {
		this.numeroProtocolo = protocolo;
	}

	/**
	 * Este método atribui o tempo limite de desbloqueio do acionamento, ou
	 * seja, o momento em que o protocolo estará desbloqueado.
	 * 
	 * @param tempoBloqueio
	 *            Tempo de bloqueio (em minutos)
	 */
	public void bloquearProtocolo(Integer tempoBloqueio) {
		this.dataLimiteDesbloqueio = new Timestamp(System.currentTimeMillis()
				+ Utilitario.converterMinutoMilisegundos(tempoBloqueio
						.intValue()));
	}

	/**
	 * Este método é responsável por obter quem é o especialista responsável por
	 * um acionamento
	 * 
	 * @param tipoMensagem
	 *            tipo de mensagem do acionamento
	 * @param assunto
	 *            assunto do acionamento
	 * @param subOrgao
	 *            sub órgão do assunto do acionamento
	 * @param localidadeOcorrencia
	 *            localidade de ocorrência do acionamento
	 * @param funcionario
	 *            Funcionário que está redirecionando, no caso de
	 *            redirecionamento
	 */
	private Funcionario obterEspecialista(TipoMensagem tipoMensagem,
			Assunto assunto, SubOrgao subOrgao,
			LocalidadeOcorrencia localidadeOcorrencia, Funcionario funcionario,
			Orgao orgao) {

		// "Pontuação" de cada funcionário, ou seja, função que determina o
		// quão adequado o funcionário está para assumir a responsabilidade
		int pontuacao;
		// Quantidade de mensagens sob responsabilidade do funcionário sendo
		// considerado
		int qtdMensagens;
		// Melhor pontuação acumulada
		int melhorPontuacao = 0;
		// melhor quantidade de mensagens acumulada
		int melhorQtdMensagens = 999999;
		// funcionário sendo considerado
		Funcionario funcionarioTemp;
		// melhor funcionário até o momento
		Funcionario melhorFuncionario = null;

		Iterator iter = null;

		Collection listaAcionador = tipoMensagem
				.getListaFuncionariosAtivosOrgao(orgao);

		// tratamento para redirecionamento de mensagem
		if ((listaAcionador.size() > 0) && (funcionario != null)) {
			listaAcionador.remove(funcionario);
		}

		iter = listaAcionador.iterator();

		// Se só há um funcionário para o tipo de mensagem, ele será o
		// responsável
		if (listaAcionador.size() == 1) {
			return (Funcionario) iter.next();
		}

		// Se há mais de um funcionário para o tipo de mensagem, é preciso
		// testar as outras condições
		if (listaAcionador.size() > 1) {

			// Testa quem é mais indicado para receber a responsabilidade do
			// acionamento
			for (int ind = 0; ind != listaAcionador.size(); ind++) {
				pontuacao = 0;
				qtdMensagens = 999999;
				funcionarioTemp = (Funcionario) iter.next();
				if (funcionarioTemp.checarResponsabilidadeAssunto(assunto)) {
					pontuacao += 10;
				}
				if (funcionarioTemp.checarAlocacaoSubOrgao(subOrgao)) {
					pontuacao += 5;
				}
				if (funcionarioTemp
						.checarResponsabilidadeLocalidade(localidadeOcorrencia)) {
					pontuacao += 1;
				}

				qtdMensagens = funcionarioTemp
						.obterQtdMensagensSobResponsabilidade();
				// Testa se o funcionário é o mais indicado até o momento
				if (pontuacao > melhorPontuacao) {
					melhorPontuacao = pontuacao;
					melhorQtdMensagens = qtdMensagens;
					melhorFuncionario = funcionarioTemp;
				} else {
					if (pontuacao == melhorPontuacao) {
						if (qtdMensagens < melhorQtdMensagens) {
							melhorQtdMensagens = qtdMensagens;
							melhorFuncionario = funcionarioTemp;
						}
					}
				}
			}

			// Retorna o especialista
			return melhorFuncionario;
		}
		// Caso em que não há nenhum associado ao tipo de mensagem

		listaAcionador = assunto.getListaFuncionariosAtivos();

		// tratamento para redirecionamento de mensagem
		if ((listaAcionador.size() > 0) && (funcionario != null)) {
			listaAcionador.remove(funcionario);
		}

		iter = listaAcionador.iterator();

		// Se só há um funcionário para o assunto, ele será o responsável
		if (listaAcionador.size() == 1) {
			return (Funcionario) iter.next();
		}

		// Se há mais de um funcionário para o assunto, é preciso
		// testar as outras condições
		if (listaAcionador.size() > 1) {

			// Testa quem é mais indicado para receber a responsabilidade do
			// acionamento
			for (int ind = 0; ind != listaAcionador.size(); ind++) {
				pontuacao = 0;
				qtdMensagens = 999999;

				funcionarioTemp = (Funcionario) iter.next();

				if (funcionarioTemp.checarAlocacaoSubOrgao(subOrgao)) {
					pontuacao += 5;
				}
				if (funcionarioTemp
						.checarResponsabilidadeLocalidade(localidadeOcorrencia)) {
					pontuacao += 1;
				}

				qtdMensagens = funcionarioTemp
						.obterQtdMensagensSobResponsabilidade();

				// Testa se o funcionário é o mais indicado até o momento
				if (pontuacao > melhorPontuacao) {
					melhorPontuacao = pontuacao;
					melhorQtdMensagens = qtdMensagens;
					melhorFuncionario = funcionarioTemp;
				} else {
					if (pontuacao == melhorPontuacao) {
						if (qtdMensagens < melhorQtdMensagens) {
							melhorQtdMensagens = qtdMensagens;
							melhorFuncionario = funcionarioTemp;
						}
					}
				}
			}

			// Retorna o especialista
			return melhorFuncionario;
		}

		return null;
	}

	/**
	 * Este método define o especialista de um acionamento no momento da criação
	 * do acionamento.
	 * 
	 * @param tipoMensagem
	 *            tipo de mensagem do acionamento
	 * @param assunto
	 *            assunto do acionamento
	 * @param subOrgao
	 *            sub órgão do assunto do acionamento
	 * @param localidadeOcorrencia
	 *            localidade de ocorrência do acionamento
	 */
	public void definirEspecialista(TipoMensagem tipoMensagem, Assunto assunto,
			SubOrgao subOrgao, LocalidadeOcorrencia localidadeOcorrencia,
			Orgao orgao) {

		this.funcionario = obterEspecialista(tipoMensagem, assunto, subOrgao,
				localidadeOcorrencia, null, orgao);

		if (this.funcionario == null) {
			try {
				this.funcionario = orgao.getOuvidorOrgao(orgao);
			} catch (DaoException e) {
				e.printStackTrace();
			}
		}
	}

	/**
	 * Este método passa a responsabilidade do acionamento para um outro
	 * funcionário.
	 * 
	 * @param tipoMensagem
	 *            tipo de mensagem do acionamento
	 * @param assunto
	 *            assunto do acionamento
	 * @param subOrgao
	 *            sub órgão do assunto do acionamento
	 * @param localidadeOcorrencia
	 *            localidade de ocorrência do acionamento
	 * @param funcionario
	 *            Funcionário que está redirecionando, no caso de
	 *            redirecionamento
	 */
	public boolean redirecionarAcionamento(TipoMensagem tipoMensagem,
			Assunto assunto, SubOrgao subOrgao,
			LocalidadeOcorrencia localidadeOcorrencia, Funcionario funcionario,
			String despacho, Orgao orgao) {

		Funcionario func = obterEspecialista(tipoMensagem, assunto, subOrgao,
				localidadeOcorrencia, funcionario, orgao);

		if (func == null) {
			return false;
		}

		this.despacho = despacho;
		this.funcionario = func;

		return true;
	}

	/**
	 * Este método passa a responsabilidade do acionamento para um funcionário
	 * CONSULTOR, previamente escolhido.
	 * 
	 * @param tipoMensagem
	 *            tipo de mensagem do acionamento
	 * @param assunto
	 *            assunto do acionamento
	 * @param subOrgao
	 *            sub órgão do assunto do acionamento
	 * @param localidadeOcorrencia
	 *            localidade de ocorrência do acionamento
	 * @param funcionario
	 *            Funcionário que está redirecionando, no caso de
	 *            redirecionamento
	 * @param consultor
	 *            Funcionário que está sendo redirecionado
	 * 
	 */

	public boolean redirecionarAcionamentoConsultor(TipoMensagem tipoMensagem,
			Assunto assunto, SubOrgao subOrgao, Funcionario consultor,
			LocalidadeOcorrencia localidadeOcorrencia, Funcionario funcionario,
			String despacho, Orgao orgao) {

		this.despacho = despacho;
		this.funcionario = consultor;

		return true;
	}

	/**
	 * Este método passa a responsabilidade do acionamento para um outro
	 * funcionário.
	 * 
	 * @param orgao
	 *            Órgão corrente
	 * @param funcionario
	 *            Funcionário que está redirecionando, no caso de
	 *            redirecionamento
	 */
	public boolean redirecionarAcionamento(Orgao orgao, Funcionario funcionario) {

		Funcionario func = obterEspecialista(this.getMensagem()
				.getTipoMensagem(), this.getMensagem().getAssunto(), this
				.getLocalidadeOcorrencia().getSubOrgao(),
				this.getLocalidadeOcorrencia(), funcionario, orgao);

		if (func == null) {
			return false;
		}

		this.funcionario = func;
		return true;
	}

}