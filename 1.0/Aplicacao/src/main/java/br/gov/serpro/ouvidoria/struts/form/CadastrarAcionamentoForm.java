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
package br.gov.serpro.ouvidoria.struts.form;

import java.util.Hashtable;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.ActionMessages;
import org.apache.struts.upload.FormFile;

import br.gov.serpro.ouvidoria.controller.acionamento.EnviarMensagemWebCtrl;
import br.gov.serpro.ouvidoria.dao.hibernate.HibernateDaoFactory;
import br.gov.serpro.ouvidoria.util.Constants;
import br.gov.serpro.ouvidoria.util.Utilitario;

/**
 *
 * @author SERPRO
 * @version $Revision: 1.1.2.5 $, $Date: 2011/10/21 11:19:59 $
 * @version 0.1, 2004/12/08
 */
public class CadastrarAcionamentoForm extends ActionForm {
	
	private static final long serialVersionUID = 1L;

	private Integer tipoMensagem;
    
    private Integer assunto;
    
    private Integer localidadeOcorrencia;
    
    private String mensagem;
    
    private FormFile arquivoAnexo;
    
    private FormFile mensagemDigitalizada;
    
    private Integer tipoAcionador;
    
    private String sexo;
    
    private Integer escolaridade;
    
    private Integer faixaEtaria;
    
    private Integer pais;
    
    private Integer uf;
    
    private String codigoPaisTelefone;
    
    private String codigoCidadeTelefone;
    
    private String telefone;
    
    private String codigoPaisFax;
    
    private String codigoCidadeFax;
    
    private String fax;
    
    private String email;
    
    private String nomeAcionadorPessoaFisica;
    
    private String cpfAcionadorPessoaFisica;
    
    private String razaoSocialAcionadorPessoaJuridica;
    
    private String cnpjAcionadorPessoaJuridica;
    
    private String nomeContatoAcionadorPessoaJuridica;
    
    private String cpfAcionadorPessoaJuridica;
    
    private String matriculaAcionadorFuncionario;
    
    private String setorAcionadorFuncionario;
    
    private String nomeAcionadorFuncionario;
    
    private String cpfAcionadorFuncionario;
    
    private String logradouroCarta;
    
    private String numeroCarta;
    
    private String complementoCarta;
    
    private String bairroCarta;
    
    private String cidadeCarta;
    
    private String cepCarta;
    
    private Integer paisCarta;
    
    private Integer ufCarta;
    
    private String pergunta;
    
    private String resposta;
    
    private Integer meioEnvioResposta;
    
    private Integer meioRecebimento;
    
    private Integer ufRecebimento;
    
    private String checkRecuperaCodigoAcesso;
    
    private String srcImagem1;
    
    private String srcImagem2;
    
    private String srcImagem3;
    
    private String srcImagem4;
    
    private String altImagem1;
    
    private String altImagem2;
    
    private String altImagem3;
    
    private String altImagem4;
    
    private String validacao;
    
    private Hashtable imagens = new Hashtable();
    
    private Integer tamanhoArquivoAnexo;
    
    private Integer tamanhoMensagemDigitalizada;
    
    private String matriculaAnterior;
    

    public FormFile getArquivoAnexo() {
        return arquivoAnexo;
    }
    
    public void setArquivoAnexo(FormFile arquivoAnexo) {
        this.arquivoAnexo = arquivoAnexo;
    }
    
    public Integer getAssunto() {
        return assunto;
    }
    
    public void setAssunto(Integer assunto) {
        this.assunto = assunto;
    }
    
    public String getBairroCarta() {
        return bairroCarta;
    }
    
    public void setBairroCarta(String bairroCarta) {
        this.bairroCarta = bairroCarta;
    }
    
    public String getCepCarta() {
        return cepCarta;
    }
    
    public void setCepCarta(String cepCarta) {
        this.cepCarta = cepCarta;
    }
    
    public String getCidadeCarta() {
        return cidadeCarta;
    }
    
    public void setCidadeCarta(String cidadeCarta) {
        this.cidadeCarta = cidadeCarta;
    }
    
    public String getCnpjAcionadorPessoaJuridica() {
        return cnpjAcionadorPessoaJuridica;
    }
    
    public void setCnpjAcionadorPessoaJuridica(
            String cnpjAcionadorPessoaJuridica) {
        this.cnpjAcionadorPessoaJuridica = cnpjAcionadorPessoaJuridica;
    }
    
    public String getCodigoCidadeFax() {
        return codigoCidadeFax;
    }
    
    public void setCodigoCidadeFax(String codigoCidadeFax) {
        this.codigoCidadeFax = codigoCidadeFax;
    }
    
    public String getCodigoCidadeTelefone() {
        return codigoCidadeTelefone;
    }
    
    public void setCodigoCidadeTelefone(String codigoCidadeTelefone) {
        this.codigoCidadeTelefone = codigoCidadeTelefone;
    }
    
    public String getCodigoPaisFax() {
        return codigoPaisFax;
    }
    
    public void setCodigoPaisFax(String codigoPaisFax) {
        this.codigoPaisFax = codigoPaisFax;
    }
    
    public String getCodigoPaisTelefone() {
        return codigoPaisTelefone;
    }
    
    public void setCodigoPaisTelefone(String codigoPaisTelefone) {
        this.codigoPaisTelefone = codigoPaisTelefone;
    }
    
    public String getComplementoCarta() {
        return complementoCarta;
    }
    
    public void setComplementoCarta(String complementoCarta) {
        this.complementoCarta = complementoCarta;
    }
    
    public String getCpfAcionadorFuncionario() {
        return cpfAcionadorFuncionario;
    }
    
    public void setCpfAcionadorFuncionario(String cpfAcionadorFuncionario) {
        this.cpfAcionadorFuncionario = cpfAcionadorFuncionario;
    }
    
    public String getCpfAcionadorPessoaFisica() {
        return cpfAcionadorPessoaFisica;
    }
    
    public void setCpfAcionadorPessoaFisica(String cpfAcionadorPessoaFisica) {
        this.cpfAcionadorPessoaFisica = cpfAcionadorPessoaFisica;
    }
    
    public String getCpfAcionadorPessoaJuridica() {
        return cpfAcionadorPessoaJuridica;
    }
    
    public void setCpfAcionadorPessoaJuridica(String cpfAcionadorPessoaJuridica) {
        this.cpfAcionadorPessoaJuridica = cpfAcionadorPessoaJuridica;
    }
    
    public String getEmail() {
        return email;
    }
    
    public void setEmail(String email) {
        this.email = email;
    }
    
    public Integer getEscolaridade() {
        return escolaridade;
    }
    
    public void setEscolaridade(Integer escolaridade) {
        this.escolaridade = escolaridade;
    }
    
    public Integer getFaixaEtaria() {
        return faixaEtaria;
    }
    
    public void setFaixaEtaria(Integer faixaEtaria) {
        this.faixaEtaria = faixaEtaria;
    }
    
    public String getFax() {
        return fax;
    }
    
    public void setFax(String fax) {
        this.fax = fax;
    }
    
    public Integer getLocalidadeOcorrencia() {
        return localidadeOcorrencia;
    }
    
    public void setLocalidadeOcorrencia(Integer localidadeOcorrencia) {
        this.localidadeOcorrencia = localidadeOcorrencia;
    }
    
    public String getLogradouroCarta() {
        return logradouroCarta;
    }
    
    public void setLogradouroCarta(String logradouroCarta) {
        this.logradouroCarta = logradouroCarta;
    }
    
    public String getMatriculaAcionadorFuncionario() {
        return matriculaAcionadorFuncionario;
    }
    
    public void setMatriculaAcionadorFuncionario(
            String matriculaAcionadorFuncionario) {
        this.matriculaAcionadorFuncionario = matriculaAcionadorFuncionario;
    }
    
    public Integer getMeioEnvioResposta() {
        return meioEnvioResposta;
    }
    
    public void setMeioEnvioResposta(Integer meioEnvioResposta) {
        this.meioEnvioResposta = meioEnvioResposta;
    }
    
    public String getMensagem() {
        return mensagem;
    }
    
    public void setMensagem(String mensagem) {
        this.mensagem = mensagem;
    }
    
    public String getNomeAcionadorFuncionario() {
        return nomeAcionadorFuncionario;
    }
    
    public void setNomeAcionadorFuncionario(String nomeAcionadorFuncionario) {
        this.nomeAcionadorFuncionario = nomeAcionadorFuncionario;
    }
    
    public String getNomeAcionadorPessoaFisica() {
        return nomeAcionadorPessoaFisica;
    }
    
    public void setNomeAcionadorPessoaFisica(String nomeAcionadorPessoaFisica) {
        this.nomeAcionadorPessoaFisica = nomeAcionadorPessoaFisica;
    }
    
    public String getNomeContatoAcionadorPessoaJuridica() {
        return nomeContatoAcionadorPessoaJuridica;
    }
    
    public void setNomeContatoAcionadorPessoaJuridica(
            String nomeContatoAcionadorPessoaJuridica) {
        this.nomeContatoAcionadorPessoaJuridica = nomeContatoAcionadorPessoaJuridica;
    }
    
    public String getNumeroCarta() {
        return numeroCarta;
    }
    
    public void setNumeroCarta(final String numeroCarta) {
        this.numeroCarta = numeroCarta;
    }
    
    public Integer getPais() {
        return pais;
    }
    
    public void setPais(Integer pais) {
        this.pais = pais;
    }
    
    public Integer getPaisCarta() {
        return paisCarta;
    }
    
    public void setPaisCarta(Integer paisCarta) {
        this.paisCarta = paisCarta;
    }
    
    public String getPergunta() {
        return pergunta;
    }
    
    public void setPergunta(String pergunta) {
        this.pergunta = pergunta;
    }
    
    public String getRazaoSocialAcionadorPessoaJuridica() {
        return razaoSocialAcionadorPessoaJuridica;
    }
    
    public void setRazaoSocialAcionadorPessoaJuridica(
            String razaoSocialAcionadorPessoaJuridica) {
        this.razaoSocialAcionadorPessoaJuridica = razaoSocialAcionadorPessoaJuridica;
    }
    
    public String getResposta() {
        return resposta;
    }
    
    public void setResposta(String resposta) {
        this.resposta = resposta;
    }
    
    public String getSetorAcionadorFuncionario() {
        return setorAcionadorFuncionario;
    }
    
    public void setSetorAcionadorFuncionario(String setorAcionadorFuncionario) {
        this.setorAcionadorFuncionario = setorAcionadorFuncionario;
    }
    
    public String getSexo() {
        return sexo;
    }
    
    public void setSexo(String sexo) {
        this.sexo = sexo;
    }
    
    public String getTelefone() {
        return telefone;
    }
    
    public void setTelefone(String telefone) {
        this.telefone = telefone;
    }
    
    public Integer getTipoAcionador() {
        return tipoAcionador;
    }
    
    public void setTipoAcionador(Integer tipoAcionador) {
        this.tipoAcionador = tipoAcionador;
    }
    
    public Integer getTipoMensagem() {
        return tipoMensagem;
    }
    
    public void setTipoMensagem(Integer tipoMensagem) {
        this.tipoMensagem = tipoMensagem;
    }
    
    public Integer getUf() {
        return uf;
    }
    
    public void setUf(Integer uf) {
        this.uf = uf;
    }
    
    public Integer getUfCarta() {
        return ufCarta;
    }
    
    public void setUfCarta(Integer ufCarta) {
        this.ufCarta = ufCarta;
    }
    
    public Integer getUfRecebimento() {
        return ufRecebimento;
    }
    
    public void setUfRecebimento(Integer ufRecebimento) {
        this.ufRecebimento = ufRecebimento;
    }
    
    public String getCheckRecuperaCodigoAcesso() {
        return checkRecuperaCodigoAcesso;
    }
    
    public void setCheckRecuperaCodigoAcesso(String checkRecuperaCodigoAcesso) {
        this.checkRecuperaCodigoAcesso = checkRecuperaCodigoAcesso;
    }
    
    public String getAltImagem1() {
        return altImagem1;
    }
    
    public void setAltImagem1(String altImagem1) {
        this.altImagem1 = altImagem1;
    }
    
     public String getAltImagem2() {
        return altImagem2;
    }
    
    public void setAltImagem2(String altImagem2) {
        this.altImagem2 = altImagem2;
    }
    
    public String getAltImagem3() {
        return altImagem3;
    }
    
    public void setAltImagem3(String altImagem3) {
        this.altImagem3 = altImagem3;
    }
    
    public String getAltImagem4() {
        return altImagem4;
    }
    
    public void setAltImagem4(String altImagem4) {
        this.altImagem4 = altImagem4;
    }
    
    public String getSrcImagem1() {
        return srcImagem1;
    }
    
    public void setSrcImagem1(String srcImagem1) {
        this.srcImagem1 = srcImagem1;
    }
    
    public String getSrcImagem2() {
        return srcImagem2;
    }
    
    public void setSrcImagem2(String srcImagem2) {
        this.srcImagem2 = srcImagem2;
    }
    
    public String getSrcImagem3() {
        return srcImagem3;
    }
    
    public void setSrcImagem3(String srcImagem3) {
        this.srcImagem3 = srcImagem3;
    }
    
    public String getSrcImagem4() {
        return srcImagem4;
    }
    
    public void setSrcImagem4(String srcImagem4) {
        this.srcImagem4 = srcImagem4;
    }
    
    public Hashtable getImagens() {
        return imagens;
    }
    
    public void setImagens(Hashtable imagens) {
        this.imagens = imagens;
    }
    
    public Integer getMeioRecebimento() {
        return meioRecebimento;
    }
    
    public void setMeioRecebimento(Integer meioRecebimento) {
        this.meioRecebimento = meioRecebimento;
    }
    
    public FormFile getMensagemDigitalizada() {
        return mensagemDigitalizada;
    }
    
    public void setMensagemDigitalizada(FormFile mensagemDigitalizada) {
        this.mensagemDigitalizada = mensagemDigitalizada;
    }
    
    public String getValidacao() {
        return validacao;
    }
    
    public void setValidacao(String validacao) {
        this.validacao = validacao;
    }
    
    public Integer getTamanhoArquivoAnexo() {
        return tamanhoArquivoAnexo;
    }
    
    public void setTamanhoArquivoAnexo(Integer tamanhoArquivoAnexo) {
        this.tamanhoArquivoAnexo = tamanhoArquivoAnexo;
    }
    
    public Integer getTamanhoMensagemDigitalizada() {
        return tamanhoMensagemDigitalizada;
    }
    
    public void setTamanhoMensagemDigitalizada(
            Integer tamanhoMensagemDigitalizada) {
        this.tamanhoMensagemDigitalizada = tamanhoMensagemDigitalizada;
    }
    
    public void reset(ActionMapping arg0, HttpServletRequest arg1) {
        super.reset(arg0, arg1);
        
        imagens.put("0", "../images/img0.jpg");
        imagens.put("1", "../images/img1.jpg");
        imagens.put("2", "../images/img2.jpg");
        imagens.put("3", "../images/img3.jpg");
        imagens.put("4", "../images/img4.jpg");
        imagens.put("5", "../images/img5.jpg");
        imagens.put("6", "../images/img6.jpg");
        imagens.put("7", "../images/img7.jpg");
        imagens.put("8", "../images/img8.jpg");
        imagens.put("9", "../images/img9.jpg");

        pais = new Integer(1);

        validacao = "";
        
    }
    
    public ActionErrors validate(ActionMapping arg0, HttpServletRequest arg1) {
        ActionErrors erros = new ActionErrors();
        
        /* Checa se o tipo de mensagem foi preenchido */
        if (this.tipoMensagem.intValue() == 0) {
            erros.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
                    "error.acionamento.tipoMensagem"));
        }
        
        /* Checa se o assunto foi preenchido */
        if (this.assunto.intValue() == 0) {
            erros.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
                    "error.acionamento.assunto"));
        }
        
        /* Checa se a localidade de ocorrência foi preenchida */
        if (this.localidadeOcorrencia != null) {
            if (this.localidadeOcorrencia.intValue() == 0) {
                erros.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
                        "error.acionamento.localidadeOcorrencia"));
            }
        }
        
        /*
         * Checa se a mensagem foi preenchida (obrigatoriedade dependente da
         * mensagem digitalizada)
         */
        if (this.mensagemDigitalizada != null) {
            if (this.mensagemDigitalizada.getFileName().length() == 0) {
                if (this.mensagem.compareTo("") == 0) {
                    erros.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
                            "error.acionamento.mensagem"));
                } else {
                    if (this.mensagem.length() > 1000) {
                        erros.add(ActionMessages.GLOBAL_MESSAGE,
                                new ActionMessage(
                                "error.acionamento.tamanhoMensagem"));
                    }
                }
            }
        } else {
            if (this.mensagem.compareTo("") == 0) {
                erros.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
                        "error.acionamento.mensagem"));
            } else {
                if (this.mensagem.length() > 1000) {
                    erros.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
                            "error.acionamento.tamanhoMensagem"));
                }
            }
        }
        
        /* Checa se o tipo de acionador foi preenchido */
        if (this.tipoAcionador.intValue() == 0) {
            erros.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
                    "error.acionamento.tipoAcionador"));
        } else {
            //Se acionador é pessoa física
            if (this.tipoAcionador.intValue() == 2) {
                if (this.nomeAcionadorPessoaFisica.compareTo("") == 0) {
                    erros.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
                            "error.acionamento.nomePessoaFisica"));
                }
                if (this.cpfAcionadorPessoaFisica.compareTo("") != 0) {
                    if (!Utilitario.validaCpf(this.cpfAcionadorPessoaFisica)) {
                        erros.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
                                "error.acionamento.cpfInvalido"));
                    }
                }
                
            } else {
                //Se acionador é pessoa jurídica
                if (this.tipoAcionador.intValue() == 3) {
                    if (this.razaoSocialAcionadorPessoaJuridica == null
                            || this.razaoSocialAcionadorPessoaJuridica.trim().length() == 0) {
                        erros.add(ActionMessages.GLOBAL_MESSAGE,
                                new ActionMessage("error.acionamento.razaoSocialPessoaJuridica"));
                    }
                    if (this.cnpjAcionadorPessoaJuridica.compareTo("") == 0) {
                        erros.add(ActionMessages.GLOBAL_MESSAGE,
                                new ActionMessage("error.acionamento.cnpjPessoaJuridica"));
                    }
                    if (this.cpfAcionadorPessoaJuridica.compareTo("") == 0) {
                        erros.add(ActionMessages.GLOBAL_MESSAGE,
                                new ActionMessage("error.acionamento.cpfAcionadorPessoaJuridica"));
                    } else {
                        if (!Utilitario.validaCpf(this.cpfAcionadorPessoaJuridica)) {
                            erros.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
                                    "error.acionamento.cpfInvalido"));
                        }
                    }
                    
                } else {
                    // Se acionador é funcionário
                    if (this.tipoAcionador.intValue() == 4) {
                        if (this.matriculaAcionadorFuncionario.compareTo("") == 0) {
                            erros.add(ActionMessages.GLOBAL_MESSAGE,
                                    new ActionMessage("error.acionamento.matriculaFuncionario"));
                        }
                        if (this.cpfAcionadorFuncionario.compareTo("") == 0) {
                            erros.add(ActionMessages.GLOBAL_MESSAGE,
                                    new ActionMessage("error.acionamento.cpfFuncionario"));
                        } else {
                            /* Valida CPF */
                            if (!Utilitario.validaCpf(this.cpfAcionadorFuncionario)) {
                                erros.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
                                        "error.acionamento.cpfInvalido"));
                            }
                        }
                        
                        
                    }
                }
            }
        }
        //Se o meio de envio de resposta é email
        if (this.meioEnvioResposta.intValue() == 1) {
            if (this.email.compareTo("") == 0) {
                erros.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
                        "error.acionamento.email"));
            }
        } else {
            //carta
            if (this.meioEnvioResposta.intValue() == 3) {
                if (this.logradouroCarta.compareTo("") == 0) {
                    erros.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
                            "error.acionamento.logradouroCarta"));
                }
                if (this.bairroCarta.compareTo("") == 0) {
                    erros.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
                            "error.acionamento.bairroCarta"));
                }
                if (this.cidadeCarta.compareTo("") == 0) {
                    erros.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
                            "error.acionamento.cidadeCarta"));
                }
                if (this.cepCarta.compareTo("") == 0) {
                    erros.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
                            "error.acionamento.cepCarta"));
                } else {
                    try {
                        Integer.parseInt(cepCarta);
                    } catch (Exception e) {
                        erros.add(ActionMessages.GLOBAL_MESSAGE,
                                new ActionMessage(
                                "error.acionamento.cepCartaValor"));
                    }
                }
                if (this.paisCarta.intValue() == 1) {
                    if (this.ufCarta.intValue() == 0) {
                        erros.add(ActionMessages.GLOBAL_MESSAGE,
                                new ActionMessage("error.acionamento.ufCarta"));
                    }
                }
            } else {
                //Meio de envio de resposta é telefone
                if (this.meioEnvioResposta.intValue() == 4) {
                    //Se não é anônimo
                    if (this.tipoAcionador.intValue() != 1) {
                        if (this.codigoPaisTelefone.compareTo("") == 0) {
                            erros
                                    .add(
                                    ActionMessages.GLOBAL_MESSAGE,
                                    new ActionMessage(
                                    "error.acionamento.codigoPaisTelefone"));
                        } else {
                            try {
                                Integer.parseInt(this.codigoPaisTelefone);
                            } catch (Exception e) {
                                erros
                                        .add(
                                        ActionMessages.GLOBAL_MESSAGE,
                                        new ActionMessage(
                                        "error.acionamento.codigoPaisTelefoneValor"));
                            }
                        }
                        if (this.codigoCidadeTelefone.compareTo("") == 0) {
                            erros
                                    .add(
                                    ActionMessages.GLOBAL_MESSAGE,
                                    new ActionMessage(
                                    "error.acionamento.codigoCidadeTelefone"));
                        } else {
                            try {
                                Integer.parseInt(this.codigoCidadeTelefone);
                            } catch (Exception e) {
                                erros
                                        .add(
                                        ActionMessages.GLOBAL_MESSAGE,
                                        new ActionMessage(
                                        "error.acionamento.codigoCidadeTelefoneValor"));
                            }
                        }
                        if (this.telefone.compareTo("") == 0) {
                            erros.add(ActionMessages.GLOBAL_MESSAGE,
                                    new ActionMessage(
                                    "error.acionamento.telefone"));
                        } else {
                            try {
                                Integer.parseInt(this.telefone);
                            } catch (Exception e) {
                                erros
                                        .add(
                                        ActionMessages.GLOBAL_MESSAGE,
                                        new ActionMessage(
                                        "error.acionamento.telefoneValor"));
                            }
                        }
                    }
                } else {
                    //Meio de envio de resposta é fax
                    if (this.meioEnvioResposta.intValue() == 5) {
                        //Se não é anônimo
                        if (this.tipoAcionador.intValue() != 1) {
                            if (this.codigoPaisFax.compareTo("") == 0) {
                                erros
                                        .add(
                                        ActionMessages.GLOBAL_MESSAGE,
                                        new ActionMessage(
                                        "error.acionamento.codigoPaisFax"));
                            } else {
                                try {
                                    Integer.parseInt(this.codigoPaisFax);
                                } catch (Exception e) {
                                    erros
                                            .add(
                                            ActionMessages.GLOBAL_MESSAGE,
                                            new ActionMessage(
                                            "error.acionamento.codigoPaisFaxValor"));
                                }
                            }
                            if (this.codigoCidadeFax.compareTo("") == 0) {
                                erros
                                        .add(
                                        ActionMessages.GLOBAL_MESSAGE,
                                        new ActionMessage(
                                        "error.acionamento.codigoCidadeFax"));
                            } else {
                                try {
                                    Integer.parseInt(this.codigoCidadeFax);
                                } catch (Exception e) {
                                    erros
                                            .add(
                                            ActionMessages.GLOBAL_MESSAGE,
                                            new ActionMessage(
                                            "error.acionamento.codigoCidadeFaxValor"));
                                }
                            }
                            if (this.fax.compareTo("") == 0) {
                                erros.add(ActionMessages.GLOBAL_MESSAGE,
                                        new ActionMessage(
                                        "error.acionamento.fax"));
                            } else {
                                try {
                                    Integer.parseInt(this.fax);
                                } catch (Exception e) {
                                    erros
                                            .add(
                                            ActionMessages.GLOBAL_MESSAGE,
                                            new ActionMessage(
                                            "error.acionamento.faxValor"));
                                }
                            }
                        }
                    }
                }
            }
        }
        /*
         * Se o usuário quer cadastrar uma pergunta para recuperar código de
         * acesso, a pergunta e a resposta são campos obrigatórios
         */
        if (this.checkRecuperaCodigoAcesso != null) {
            if (this.checkRecuperaCodigoAcesso.compareTo("on") == 0) {
                if (this.pergunta.compareTo("") == 0) {
                    erros.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
                            "error.acionamento.pergunta"));
                }
                if (this.resposta.compareTo("") == 0) {
                    erros.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
                            "error.acionamento.resposta"));
                }
            }
        }
        
        // Se acionador não for anônimo
        if (this.tipoAcionador.intValue() != 1) {
            /* Valida formato do email */
            if (this.email.compareTo("") != 0) {
                if (!Utilitario.validaEmail(this.email)) {
                    erros.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
                            "error.acionamento.emailInvalido"));
                }
            }
        }
        
        /* Campo de validação da imagem exibida */
        if (this.validacao.compareTo((String) arg1.getSession().getAttribute(
                "valorValidacao")) != 0) {
            erros.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
                    "error.acionamento.validacao"));
        }
        
        /* Tratamento dos arquivos anexos */
        if (((arquivoAnexo != null) && (arquivoAnexo.getFileName().length() > 0))
        || ((mensagemDigitalizada != null) && (mensagemDigitalizada
                .getFileName().length() > 0))) {
            EnviarMensagemWebCtrl controlador = new EnviarMensagemWebCtrl(
                    new HibernateDaoFactory());
            String lista = "";
            StringTokenizer st = null;
            String extensao = "";
            
            /* Valida tamanho do arquivo anexo */
            if (arquivoAnexo != null && arquivoAnexo.getFileName().length() > 0) {
                if (Utilitario.conveterBytesKBytes(arquivoAnexo.getFileSize()) > this.tamanhoArquivoAnexo
                        .intValue()) {
                    erros.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
                            "error.acionamento.tamanhoArquivoAnexo"));
                }
                try {
                    extensao = arquivoAnexo.getFileName();
                    if (extensao.lastIndexOf(".") != -1) {
                        extensao = extensao
                                .substring(extensao.lastIndexOf(".") + 1);
                        
                        lista = controlador.getParametrosGerais()
                        .getExtensoesArquivoAnexoNaoPermitidos();
                        
                        st = new StringTokenizer(lista, ";");
                        int contador = 0;
                        
                        while (st.hasMoreTokens()) {
                            if (extensao.compareToIgnoreCase(st.nextToken()) == 0) {
                            	contador++;
                            }
                        }
                        if (contador == 0){
                          erros
                          .add(
                          ActionMessages.GLOBAL_MESSAGE,
                          new ActionMessage(
                          "error.acionamento.extensaoArquivoAnexo"));
                        }
                        
                    } else {
                        erros
                                .add(
                                ActionMessages.GLOBAL_MESSAGE,
                                new ActionMessage(
                                "error.acionamento.extensaoArquivoAnexo"));
                    }
                } catch (Exception e) {
                    if (Constants.DEBUG) {
                        e.printStackTrace();
                    }
                }
            }
            /* Valida tamanho da mensagem digitalizada */
            if (mensagemDigitalizada != null
                    && mensagemDigitalizada.getFileName().length() > 0) {
                if (Utilitario.conveterBytesKBytes(mensagemDigitalizada
                        .getFileSize()) > this.tamanhoMensagemDigitalizada
                        .intValue()) {
                    erros.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
                            "error.acionamento.tamanhoMensagemDigitalizada"));
                }
                try {
                    extensao = mensagemDigitalizada.getFileName();
                    boolean achou = false;
                    if (extensao.lastIndexOf(".") != -1) {
                        extensao = extensao
                                .substring(extensao.lastIndexOf(".") + 1);
                        
                        lista = controlador.getParametrosGerais()
                        .getExtensoesMensagemDigitalizadaPermitidas();
                        
                        st = new StringTokenizer(lista, ";");
                        
                        while (st.hasMoreTokens()) {
                            if (extensao.compareToIgnoreCase(st.nextToken()) == 0) {
                                achou = true;
                                break;
                            }
                        }
                        if (!achou) {
                            erros
                                    .add(
                                    ActionMessages.GLOBAL_MESSAGE,
                                    new ActionMessage(
                                    "error.acionamento.extensaoMensagemDigitalizada"));
                        }
                        
                    } else {
                        erros
                                .add(
                                ActionMessages.GLOBAL_MESSAGE,
                                new ActionMessage(
                                "error.acionamento.extensaoMensagemDigitalizada"));
                    }
                } catch (Exception e) {
                    if (Constants.DEBUG) {
                        e.printStackTrace();
                    }
                }
                
            }
            
            //Se algum erro e o arquivo anexo estava preenchido
            if ((erros.size() > 0) && (arquivoAnexo != null)
            && (arquivoAnexo.getFileName().length() > 0)) {
                erros.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
                        "error.acionamento.preencherArquivoAnexoNovamente"));
            }
            
            if ((erros.size() > 0) && (mensagemDigitalizada != null)
            && (mensagemDigitalizada.getFileName().length() > 0)) {
                erros
                        .add(
                        ActionMessages.GLOBAL_MESSAGE,
                        new ActionMessage(
                        "error.acionamento.preencherMensagemDigitalizadaNovamente"));
            }
        }
        return erros;
    }
    
    public String getMatriculaAnterior() {
        return matriculaAnterior;
    }
    
    public void setMatriculaAnterior(String matriculaAnterior) {
        this.matriculaAnterior = matriculaAnterior;
    }
}