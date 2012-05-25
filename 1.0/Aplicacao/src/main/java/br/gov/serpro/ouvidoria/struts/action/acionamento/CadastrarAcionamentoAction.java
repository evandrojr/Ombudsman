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
package br.gov.serpro.ouvidoria.struts.action.acionamento;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.upload.FormFile;

import br.gov.serpro.ouvidoria.controller.acionamento.EnviarMensagemWebCtrl;
import br.gov.serpro.ouvidoria.controller.andamento.RecuperarCodigoAcessoCtrl;
import br.gov.serpro.ouvidoria.model.EstadoAcionamento;
import br.gov.serpro.ouvidoria.model.MeioEnvioResposta;
import br.gov.serpro.ouvidoria.model.TipoAcionador;
import br.gov.serpro.ouvidoria.struts.ActionSupport;
import br.gov.serpro.ouvidoria.struts.form.CadastrarAcionamentoForm;
import br.gov.serpro.ouvidoria.util.Constants;

/**
 * Objetivo: Cadastrar o acionamento
 * 
 * @author SERPRO
 * @version $Revision: 1.1.2.4 $, $Date: 2011/10/18 17:57:04 $
 * @version 0.1, 2004/12/07
 * 
 */
public class CadastrarAcionamentoAction extends ActionSupport {

	/**
	 * Método de execução da ação. Realiza dois forwards: um em caso de sucesso
	 * e outro em caso de falha
	 * 
	 * @param mapping
	 * @param form
	 *            ActionForm, caso necessário
	 * @param request
	 * @param response
	 * 
	 */
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		ActionErrors erros = new ActionErrors();

		EnviarMensagemWebCtrl enviarMensagemWebCtrl = new EnviarMensagemWebCtrl(
				getDaoFactory());

		String nome = "";
		String cpf = "";
		String strArquivoAnexo = "";
		String strMensagemDigitalizada = "";

		CadastrarAcionamentoForm _form = (CadastrarAcionamentoForm) form;
		Integer tipoMensagem = _form.getTipoMensagem();
		Integer assunto = _form.getAssunto();
		Integer localidadeOcorrencia = _form.getLocalidadeOcorrencia();
		Integer meioEnvioResposta = _form.getMeioEnvioResposta();
		Integer meioRecebimento = _form.getMeioRecebimento();
		String mensagem = _form.getMensagem();
		FormFile arquivoAnexo = _form.getArquivoAnexo();
		FormFile mensagemDigitalizada = _form.getMensagemDigitalizada();
		String sexo = _form.getSexo();
		Integer escolaridade = _form.getEscolaridade();
		Integer faixaEtaria = _form.getFaixaEtaria();
		Integer pais = _form.getPais();
		Integer uf = _form.getUf();
		String email = _form.getEmail();
		String codPaisTelefone = _form.getCodigoPaisTelefone();
		String codCidadeTelefone = _form.getCodigoCidadeTelefone();
		String telefone = _form.getTelefone();
		String codPaisFax = _form.getCodigoPaisFax();
		String codCidadeFax = _form.getCodigoCidadeFax();
		String fax = _form.getFax();
		Integer tipoAcionador = _form.getTipoAcionador();
		String nomeAcionadorPessoaFisica = _form.getNomeAcionadorPessoaFisica();
		String cpfAcionadorPessoaFisica = _form.getCpfAcionadorPessoaFisica();
		String razaoSocialAcionadorPessoaJuridica = _form
				.getRazaoSocialAcionadorPessoaJuridica();
		String cnpjAcionadorPessoaJuridica = _form
				.getCnpjAcionadorPessoaJuridica();
		String nomeContatoAcionadorPessoaJuridica = _form
				.getNomeContatoAcionadorPessoaJuridica();
		String cpfAcionadorPessoaJuridica = _form
				.getCpfAcionadorPessoaJuridica();
		String matriculaAcionadorFuncionario = _form
				.getMatriculaAcionadorFuncionario();
		String setorAcionadorFuncionario = _form.getSetorAcionadorFuncionario();
		String nomeAcionadorFuncionario = _form.getNomeAcionadorFuncionario();
		String cpfAcionadorFuncionario = _form.getCpfAcionadorFuncionario();
		String logradouroCarta = _form.getLogradouroCarta();
		String numeroCarta = _form.getNumeroCarta();
		String complementoCarta = _form.getComplementoCarta();
		String bairroCarta = _form.getBairroCarta();
		String cidadeCarta = _form.getCidadeCarta();
		String cepCarta = _form.getCepCarta();
		Integer paisCarta = _form.getPaisCarta();
		Integer ufCarta = _form.getUfCarta();
		String pergunta = _form.getPergunta();
		String resposta = _form.getResposta();

		// define qual nome e qual cpf a ser usado
		if (enviarMensagemWebCtrl.getTipoAcionador(tipoAcionador).equals(
				TipoAcionador.PESSOA_FISICA)) {
			nome = nomeAcionadorPessoaFisica;
			cpf = cpfAcionadorPessoaFisica;
		} else {
			if (enviarMensagemWebCtrl.getTipoAcionador(tipoAcionador).equals(
					TipoAcionador.FUNCIONARIO)) {
				nome = nomeAcionadorFuncionario;
				cpf = cpfAcionadorFuncionario;
			}
		}

		if (sexo == "") {
			sexo = null;
		}

		if (arquivoAnexo != null) {
			strArquivoAnexo = arquivoAnexo.getFileName();
		}
		if (mensagemDigitalizada != null) {
			strMensagemDigitalizada = mensagemDigitalizada.getFileName();
		}

		// Atribui número de protocolo do acionamento
		enviarMensagemWebCtrl.getAcionamento().setNumeroProtocolo(
				enviarMensagemWebCtrl.obterNumeroProtocolo());

		if ((arquivoAnexo != null) && (arquivoAnexo.getFileName().length() > 0)) {
			strArquivoAnexo = enviarMensagemWebCtrl.getAcionamento()
					.getNumeroProtocolo()
					+ "_" + this.convertToASCII2(arquivoAnexo.getFileName());
		}
		if ((mensagemDigitalizada != null)
				&& (mensagemDigitalizada.getFileName().length() > 0)) {
			strMensagemDigitalizada = enviarMensagemWebCtrl.getAcionamento()
					.getNumeroProtocolo()
					+ "_"
					+ this.convertToASCII2(mensagemDigitalizada.getFileName());
		}

		// Acionamento é criado como pendente
		enviarMensagemWebCtrl.getAcionamento().setEstadoAcionamento(
				EstadoAcionamento.PENDENTE);

		enviarMensagemWebCtrl.getAcionamento()
				.setOrigemAcionamento(
						(String) request.getSession().getAttribute(
								Constants.SS_ORIGEM));

		// Data do acionamento é a data atual
		enviarMensagemWebCtrl.getAcionamento().setDataAcionamento(
				new Timestamp(System.currentTimeMillis()));

		// Atribui a Localidade de Ocorrência do acionamento
		enviarMensagemWebCtrl.getAcionamento().setLocalidadeOcorrencia(
				enviarMensagemWebCtrl
						.getLocalidadeOcorrencia(localidadeOcorrencia));

		// Atribui o meio de recebimento do acionamento

		if ((meioRecebimento != null) && (meioRecebimento.intValue() != 0)) {
			enviarMensagemWebCtrl
					.getAcionamento()
					.setMeioRecebimentoAcionamento(
							enviarMensagemWebCtrl
									.getMeioRecebimentoAcionamento(meioRecebimento));

		}

		// Cria a mensagem do acionamento
		enviarMensagemWebCtrl.getAcionamento().criarMensagem(mensagem,
				strArquivoAnexo, strMensagemDigitalizada,
				enviarMensagemWebCtrl.getTipoMensagem(tipoMensagem),
				enviarMensagemWebCtrl.getAssunto(assunto));

		// Cria o acionador do acionamento
		enviarMensagemWebCtrl.getAcionamento().criarAcionador(
				sexo,
				email,
				codPaisTelefone,
				codCidadeTelefone,
				telefone,
				codPaisFax,
				codCidadeFax,
				fax,
				nome,
				cpf,
				cnpjAcionadorPessoaJuridica,
				razaoSocialAcionadorPessoaJuridica,
				cpfAcionadorPessoaJuridica,
				nomeContatoAcionadorPessoaJuridica,
				matriculaAcionadorFuncionario,
				setorAcionadorFuncionario,
				enviarMensagemWebCtrl.getPais(pais),
				enviarMensagemWebCtrl.getMeioEnvioRespostaOrgao(
						meioEnvioResposta, new Integer(this.getOrgao(request)
								.getId().intValue())),
				enviarMensagemWebCtrl.getEscolaridade(escolaridade),
				enviarMensagemWebCtrl.getUF(uf),
				enviarMensagemWebCtrl.getFaixaEtaria(faixaEtaria),
				enviarMensagemWebCtrl.getTipoAcionador(tipoAcionador));

		try {
			enviarMensagemWebCtrl.getAcionamento()
					.definirDataPrevistaResolucaoExterna();
		} catch (Exception e) {
			if (Constants.DEBUG) {
				System.out
						.println("Não há data prevista para resolução externa.");
				e.printStackTrace();
			}
		}
		try {
			enviarMensagemWebCtrl.getAcionamento()
					.definirDataPrevistaResolucaoInterna();
		} catch (Exception e) {
			if (Constants.DEBUG) {
				System.out
						.println("Não há data prevista para resolução interna.");
				e.printStackTrace();
			}
		}

		// define o especialista
		enviarMensagemWebCtrl.getAcionamento().definirEspecialista(
				enviarMensagemWebCtrl.getTipoMensagem(tipoMensagem),
				enviarMensagemWebCtrl.getAssunto(assunto),
				enviarMensagemWebCtrl.getLocalidadeOcorrencia(
						localidadeOcorrencia).getSubOrgao(),
				enviarMensagemWebCtrl
						.getLocalidadeOcorrencia(localidadeOcorrencia),
				this.getOrgao(request));

		// Se o meio de resposta for carta, armazena informações do endereço
		if (enviarMensagemWebCtrl.getMeioEnvioRespostaOrgao(meioEnvioResposta,
				new Integer(this.getOrgao(request).getId().intValue()))
				.getMeioEnvioResposta().equals(MeioEnvioResposta.CARTA)) {
			enviarMensagemWebCtrl.getAcionamento().getAcionador()
					.criarInformacoesRecebimentoRespostaCarta(logradouroCarta,
							numeroCarta, complementoCarta, cepCarta,
							bairroCarta, cidadeCarta,
							enviarMensagemWebCtrl.getPais(paisCarta),
							enviarMensagemWebCtrl.getUF(ufCarta));
		}

		// Se usa código de acesso, este precisa ser gerado e as informações de
		// cosnsulta armazenadas
		if (this.getOrgao(request).getConfiguracoes().getPossuiCodigoAcesso()
				.booleanValue()) {
			enviarMensagemWebCtrl.getAcionamento().getAcionador()
					.criarInformacoesConsultaAcionamento(pergunta, resposta,
							new Integer(0));
		}

		if ((arquivoAnexo != null) || (mensagemDigitalizada != null)) {

			String caminho = "";
			caminho += enviarMensagemWebCtrl.getParametrosGerais()
					.getDiretorioContextoAplicacao();
			caminho += Constants.DIR_ANEXOS;
			caminho += this.getOrgao(request).getConfiguracoes()
					.getNomeDiretorioOrgao()
					+ "/";

			if ((arquivoAnexo != null)
					&& (arquivoAnexo.getFileName().length() > 0)) {
				/* Salvamento de arquivos anexos */

				try {
					File f = new File(caminho);
					f.mkdirs();

					FileOutputStream fos = new FileOutputStream(caminho
							+ strArquivoAnexo);
					fos.write(arquivoAnexo.getFileData());

				} catch (FileNotFoundException e) {
					e.printStackTrace();
					throw (new FileNotFoundException(
							"Erro ao tentar anexar Arquivo."
									+ "\nCaso o nome do arquivo contenha acentos, retire-os e tente novamente.\n\n"));
				} catch (Exception e) {
					e.printStackTrace();
				}
			}

			if ((mensagemDigitalizada != null)
					&& (mensagemDigitalizada.getFileName().length() > 0)) {
				try {
					File f = new File(caminho);
					f.mkdirs();

					FileOutputStream fos = new FileOutputStream(caminho
							+ strMensagemDigitalizada);
					fos.write(mensagemDigitalizada.getFileData());

				} catch (FileNotFoundException e) {
					throw (new FileNotFoundException(
							"Erro ao tentar anexar Mensagem Digitalizada."
									+ "\nCaso o nome do arquivo contenha acentos, retire-os e tente novamente.\n\n"));
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}

		/* SALVA O ACIONAMENTO */
		enviarMensagemWebCtrl.salvarAcionamento();

		String nomeAcionador = enviarMensagemWebCtrl.getNomeAcionador();

		// Se houver email, envia email com o codigo de acesso (se houver) e
		// o codigo do protocolo
		if (!email.equals("")) {
			if (this.getOrgao(request).getConfiguracoes()
					.getPossuiCodigoAcesso().booleanValue()) {
				RecuperarCodigoAcessoCtrl recuperaCodigoAcesso = new RecuperarCodigoAcessoCtrl(
						daoFactory);
				recuperaCodigoAcesso.enviarCodigoAcessoViaEmail(this
						.getOrgao(request), enviarMensagemWebCtrl
						.getAcionamento().getNumeroProtocolo());
			} else {
				RecuperarCodigoAcessoCtrl recuperaCodigoAcesso = new RecuperarCodigoAcessoCtrl(
						daoFactory);
				recuperaCodigoAcesso.enviarProtocoloViaEmail(this
						.getOrgao(request), enviarMensagemWebCtrl
						.getAcionamento().getNumeroProtocolo());
			}
		}

		// mostrar somente o primeiro nome
		if (nomeAcionador != null) {
			int ind = nomeAcionador.indexOf(" ");
			if (ind != -1) {
				nomeAcionador = nomeAcionador.subSequence(0, ind).toString();
			}
		}

		request.setAttribute("nomeAcionador", nomeAcionador);

		request.setAttribute("sexo", enviarMensagemWebCtrl.getAcionamento()
				.getAcionador().getSexo());

		request.setAttribute("textoRespostaAcionamento", this.getOrgao(request)
				.getConfiguracoes().getTextoRespostaAcionamentoFormatado());

		request.setAttribute("protocolo", enviarMensagemWebCtrl
				.getAcionamento().getNumeroProtocolo());

		if (enviarMensagemWebCtrl.getAcionamento().getAcionador()
				.getInformacoesConsultaAcionamento() != null
				&& enviarMensagemWebCtrl.getAcionamento().getAcionador()
						.getInformacoesConsultaAcionamento().getCodigoAcesso() != null) {
			request.setAttribute("codigoAcesso", enviarMensagemWebCtrl
					.getAcionamento().getAcionador()
					.getInformacoesConsultaAcionamento().getCodigoAcesso());
		}

		if (enviarMensagemWebCtrl.getAcionamento()
				.getDataPrevistaResolucaoExterna() != null) {

			SimpleDateFormat sfd1 = new SimpleDateFormat("dd/MM/yyyy");
			String dataFormatada = sfd1.format(enviarMensagemWebCtrl
					.getAcionamento().getDataPrevistaResolucaoExterna());

			request.setAttribute("dataPrevistaResolucaoExterna", dataFormatada);
		}

		/* Gera histórico, se for o caso */
		this.geraHistorico(request, enviarMensagemWebCtrl.getAcionamento());

		if (erros.isEmpty()) {
			return (mapping.findForward("success"));
		}
		return (mapping.findForward("failure"));
	}

	public String convertToASCII2(String text) {

		return text.replaceAll("[áàãâä]", "a").replaceAll("[éèẽêë]", "e")
				.replaceAll("[íìĩîï]", "i").replaceAll("[óòõôö]", "o")
				.replaceAll("[úùũûü]", "u").replaceAll("[ÁÀÃÂÄ]", "A")
				.replaceAll("[ÉÈẼÊË]", "E").replaceAll("[ÍÌĨÎÏ]", "I")
				.replaceAll("[ÓÒÕÔÖ]", "O").replaceAll("[ÚÙŨÛÜ]", "U")
				.replace('ç', 'c').replace('Ç', 'C').replace('ñ', 'n')
				.replace('Ñ', 'N');
	}

}