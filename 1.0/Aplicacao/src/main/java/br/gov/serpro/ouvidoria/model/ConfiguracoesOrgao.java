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

import br.gov.serpro.ouvidoria.util.Utilitario;

/**
 * ConfiguracoesOrgao Esta classe representa as configurações de sistema de um
 * órgão.
 * 
 * @author SERPRO
 * @version $Revision: 1.1.2.3 $, $Date: 2011/10/20 17:07:44 $
 * @version 0.1, Date: 2004/11/19
 */
public class ConfiguracoesOrgao extends PersistentObject {

	private static final long serialVersionUID = 1L;

	/* Requerido */
    private Long id;

    /* Requerido */
    private Orgao orgao;

    /* Requerido */
    private Boolean permiteMsgDigitalizadaAcionamento;

    private Integer tamanhoMaxArquivoCartaDigitalizada;

    /* Requerido */
    private Boolean permiteArquivoAnexoAcionamento;

    /* Requerido */
    private Boolean possuiCodigoAcesso;

    /* Requerido */
    private Boolean atendenteConsultaMsgNoAtendimento;

    /* Requerido */
    private Boolean exigeCertificadoDigitalGeral;

    /* Requerido */
    private Boolean exigeCertificadoDigitalOrgao;

    private Boolean existeBloqueioProtocoloPeloCodigo;

    private Boolean existeBloqueioProtocoloPelaPergunta;

    private Integer tempoBloqueioProtocoloPeloCodigo;

    private Integer tempoBloqueioProtocoloPelaPergunta;

    private Integer qtdeTentativasPossiveisCodigoAcesso;

    private Integer qtdeTentativasPossiveisPergunta;

    private Integer tamanhoMaxArquivoAnexo;

    /* Requerido */
    private String textoApresentacaoOuvidoria;

    /* Requerido */
    private String textoRespostaAcionamento;

    private String textoApresentacaoFormulario;

    private String textoCanaisComunicacao;

    /* Requerido */
    private String textoApresentacaoResposta;

    /* Requerido */
    private String textoInformacaoOuvidoria;
    
    /* Requerido */
    private String textoNotificacaoPendencia;

    /* Requerido */
    private String textoNotificacaoAtraso;
    
    /* Requerido */
    private String textoNotificacaoAtrasoCritico;
    
    /* Requerido */
    private String esquemaCoresLayout;

    /* Requerido */
    private String nomeExibicaoOrgao;

    private String imagemLogo;

    private String imagemBanner;

    private String imagem3;

    private String imagem4;

    private String imagem5;
    
    private String descricaoImagemLogo;

    private String descricaoImagemBanner;

    private String descricaoImagem3;

    private String descricaoImagem4;

    private String descricaoImagem5;
    
    private String linkImagemLogo;
    
    private String linkImagemBanner;
    
    private String linkImagem3;
    
    private String linkImagem4;
    
    private String linkImagem5;

    private String urlBaseFuncionarios;

    /* Requerido */
    private String textoConsultaRespostaNoPrazo;

    /* Requerido */
    private String textoConsultaRespostaSemPrazo;

    /* Requerido */
    private String textoConsultaRespostaEmAtraso;

    /* Requerido */
    private String textoAvaliacaoResposta;

    /* Requerido */
    private String nomeDiretorioOrgao;

    /* Requerido */
    private String remetenteEmail;

    private String textoLegislacaoOuvidoria;

    /* Requerido */
    private String corCabecalhoLogo;

    /* Requerido */
    private String corCabecalhoBanner;

    /* Requerido */
    private String urlSuporteUsuario;

    private String horaEnvioNotificacao;
    
    private String notificacaoEmail;
    
    public String getHoraEnvioNotificacao() {
		return horaEnvioNotificacao;
	}

	public void setHoraEnvioNotificacao(String horaEnvioNotificacao) {
		this.horaEnvioNotificacao = horaEnvioNotificacao;
	}

	public String getNotificacaoEmail() {
		return notificacaoEmail;
	}

	public void setNotificacaoEmail(String notificacaoEmail) {
		this.notificacaoEmail = notificacaoEmail;
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
     * @return Retorna orgao.
     */
    public Orgao getOrgao() {
        return orgao;
    }

    /**
     * @param orgao
     *            orgao a ser atribuido.
     */
    public void setOrgao(Orgao orgao) {
        if (orgao == null) {
            throw new NullPointerException();
        }
        this.orgao = orgao;
    }

    /**
     * @return Retorna permiteMsgDigitalizadaAcionamento.
     */
    public Boolean getPermiteMsgDigitalizadaAcionamento() {
        return permiteMsgDigitalizadaAcionamento;
    }

    /**
     * @param permiteMsgDigitalizadaAcionamento
     *            permiteMsgDigitalizadaAcionamento a ser atribuido.
     */
    public void setPermiteMsgDigitalizadaAcionamento(
            Boolean permiteMsgDigitalizadaAcionamento) {
        if (permiteMsgDigitalizadaAcionamento == null) {
            throw new NullPointerException();
        }
        this.permiteMsgDigitalizadaAcionamento = permiteMsgDigitalizadaAcionamento;
    }

    /**
     * @return Retorna tamanhoMaxArquivoCartaDigitalizada.
     */
    public Integer getTamanhoMaxArquivoCartaDigitalizada() {
        return tamanhoMaxArquivoCartaDigitalizada;
    }

    /**
     * 
     * @param tamanhoMaxAqruivoCartaDigitalizada
     */
    public void setTamanhoMaxArquivoCartaDigitalizada(
            Integer tamanhoMaxAqruivoCartaDigitalizada) {
        this.tamanhoMaxArquivoCartaDigitalizada = tamanhoMaxAqruivoCartaDigitalizada;
    }

    /**
     * @return Retorna permiteArquivoAnexoAcionamento.
     */
    public Boolean getPermiteArquivoAnexoAcionamento() {
        return permiteArquivoAnexoAcionamento;
    }

    /**
     * @param permiteArquivoAnexoAcionamento
     *            permiteArquivoAnexoAcionamento a ser atribuido.
     */
    public void setPermiteArquivoAnexoAcionamento(
            Boolean permiteArquivoAnexoAcionamento) {
        if (permiteArquivoAnexoAcionamento == null) {
            throw new NullPointerException();
        }
        this.permiteArquivoAnexoAcionamento = permiteArquivoAnexoAcionamento;
    }

    /**
     * @return Retorna possuiCodigoAcesso.
     */
    public Boolean getPossuiCodigoAcesso() {
        return possuiCodigoAcesso;
    }

    /**
     * @param possuiCodigoAcesso
     *            possuiCodigoAcesso a ser atribuido.
     */
    public void setPossuiCodigoAcesso(Boolean possuiCodigoAcesso) {
        if (possuiCodigoAcesso == null) {
            throw new NullPointerException();
        }
        this.possuiCodigoAcesso = possuiCodigoAcesso;
    }

    /**
     * @return Retorna atendenteConsultaMsgNoAtendimento.
     */
    public Boolean getAtendenteConsultaMsgNoAtendimento() {
        return atendenteConsultaMsgNoAtendimento;
    }

    /**
     * @param atendenteConsultaMsgNoAtendimento
     *            atendenteConsultaMsgNoAtendimento a ser atribuido.
     */
    public void setAtendenteConsultaMsgNoAtendimento(
            Boolean atendenteConsultaMsgNoAtendimento) {
        if (atendenteConsultaMsgNoAtendimento == null) {
            throw new NullPointerException();
        }
        this.atendenteConsultaMsgNoAtendimento = atendenteConsultaMsgNoAtendimento;
    }

    /**
     * @return Retorna exigeCertificadoDigitalGeral.
     */
    public Boolean getExigeCertificadoDigitalGeral() {
        return exigeCertificadoDigitalGeral;
    }

    /**
     * 
     * @param exibeCertificadoDigitalGeral
     */
    public void setExigeCertificadoDigitalGeral(
            Boolean exibeCertificadoDigitalGeral) {
        if (exibeCertificadoDigitalGeral == null) {
            throw new NullPointerException();
        }
        this.exigeCertificadoDigitalGeral = exibeCertificadoDigitalGeral;
    }

    /**
     * @return Retorna exigeCertificadoDigitalOrgao.
     */
    public Boolean getExigeCertificadoDigitalOrgao() {
        return exigeCertificadoDigitalOrgao;
    }

    /**
     * 
     * @param exibeCertificadoDigitalOrgao
     */
    public void setExigeCertificadoDigitalOrgao(
            Boolean exibeCertificadoDigitalOrgao) {
        if (exibeCertificadoDigitalOrgao == null) {
            throw new NullPointerException();
        }
        this.exigeCertificadoDigitalOrgao = exibeCertificadoDigitalOrgao;
    }

    /**
     * @return Retorna existeBloqueioProtocolo.
     */
    public Boolean getExisteBloqueioProtocoloPeloCodigo() {
        return existeBloqueioProtocoloPeloCodigo;
    }

    /**
     * 
     * @param existeBloqueioProtocoloPeloCodigo
     */
    public void setExisteBloqueioProtocoloPeloCodigo(
            Boolean existeBloqueioProtocoloPeloCodigo) {
        this.existeBloqueioProtocoloPeloCodigo = existeBloqueioProtocoloPeloCodigo;
    }

    /**
     * @return Retorna existeBloqueioProtocoloPelaPergunta.
     */
    public Boolean getExisteBloqueioProtocoloPelaPergunta() {
        return existeBloqueioProtocoloPelaPergunta;
    }

    /**
     * @param existeBloqueioProtocoloPelaPergunta
     *            existeBloqueioProtocoloPelaPergunta a ser atribuido.
     */
    public void setExisteBloqueioProtocoloPelaPergunta(
            Boolean existeBloqueioProtocoloPelaPergunta) {
        this.existeBloqueioProtocoloPelaPergunta = existeBloqueioProtocoloPelaPergunta;
    }

    /**
     * @return Retorna tempoBloqueioProtocoloPeloCodigo.
     */
    public Integer getTempoBloqueioProtocoloPeloCodigo() {
        return tempoBloqueioProtocoloPeloCodigo;
    }

    /**
     * @param tempoBloqueioProtocoloPeloCodigo
     *            tempoBloqueioProtocoloPeloCodigo a ser atribuido.
     */
    public void setTempoBloqueioProtocoloPeloCodigo(
            Integer tempoBloqueioProtocoloPeloCodigo) {
        this.tempoBloqueioProtocoloPeloCodigo = tempoBloqueioProtocoloPeloCodigo;
    }

    /**
     * @return Retorna tempoBloqueioProtocoloPelaPergunta.
     */
    public Integer getTempoBloqueioProtocoloPelaPergunta() {
        return tempoBloqueioProtocoloPelaPergunta;
    }

    /**
     * @param tempoBloqueioProtocoloPelaPergunta
     *            tempoBloqueioProtocoloPelaPergunta a ser atribuido.
     */
    public void setTempoBloqueioProtocoloPelaPergunta(
            Integer tempoBloqueioProtocoloPelaPergunta) {
        this.tempoBloqueioProtocoloPelaPergunta = tempoBloqueioProtocoloPelaPergunta;
    }

    /**
     * @return Retorna qtdeTentativasPossiveisCodigoAcesso.
     */
    public Integer getQtdeTentativasPossiveisCodigoAcesso() {
        return qtdeTentativasPossiveisCodigoAcesso;
    }

    /**
     * @param qtdeTentativasPossiveisCodigoAcesso
     *            qtdeTentativasPossiveisCodigoAcesso a ser atribuido.
     */
    public void setQtdeTentativasPossiveisCodigoAcesso(
            Integer qtdeTentativasPossiveisCodigoAcesso) {
        this.qtdeTentativasPossiveisCodigoAcesso = qtdeTentativasPossiveisCodigoAcesso;
    }

    /**
     * @return Retorna qtdeTentativasPossiveisPergunta.
     */
    public Integer getQtdeTentativasPossiveisPergunta() {
        return qtdeTentativasPossiveisPergunta;
    }

    /**
     * @param qtdeTentativasPossiveisPergunta
     *            qtdeTentativasPossiveisPergunta a ser atribuido.
     */
    public void setQtdeTentativasPossiveisPergunta(
            Integer qtdeTentativasPossiveisPergunta) {
        this.qtdeTentativasPossiveisPergunta = qtdeTentativasPossiveisPergunta;
    }

    /**
     * @return Retorna tamanhoMaxArquivoAnexo.
     */
    public Integer getTamanhoMaxArquivoAnexo() {
        return tamanhoMaxArquivoAnexo;
    }

    /**
     * @param tamanhoMaxArquivoAnexo
     *            tamanhoMaxArquivoAnexo a ser atribuido.
     */
    public void setTamanhoMaxArquivoAnexo(Integer tamanhoMaxArquivoAnexo) {
        this.tamanhoMaxArquivoAnexo = tamanhoMaxArquivoAnexo;
    }

    /**
     * @return Retorna textoApresentacaoOuvidoria.
     */
    public String getTextoApresentacaoOuvidoria() {
        return textoApresentacaoOuvidoria;
    }

    /**
     * Retorna o Texto substituindo <code>\n\r, \n ou \r por &lt;br/&gt;</code>;
     * 
     * @return Retorna o texto formatado.
     */
    public String getTextoApresentacaoOuvidoriaFormatado() {
        return Utilitario.trataEnter(getTextoApresentacaoOuvidoria());
    }

    /**
     * @param textoApresentacaoOuvidoria
     *            textoApresentacaoOuvidoria a ser atribuido.
     */
    public void setTextoApresentacaoOuvidoria(String textoApresentacaoOuvidoria) {
        if (textoApresentacaoOuvidoria == null
                || textoApresentacaoOuvidoria.length() == 0) {
            throw new NullPointerException();
        }
        this.textoApresentacaoOuvidoria = textoApresentacaoOuvidoria;
    }

    /**
     * @return Retorna textoRespostaAcionamento.
     */
    public String getTextoRespostaAcionamento() {
        return textoRespostaAcionamento;
    }

    /**
     * Retorna o Texto substituindo <code>\n\r, \n ou \r por &lt;br/&gt;</code>;
     * 
     * @return Retorna o texto formatado.
     */
    public String getTextoRespostaAcionamentoFormatado() {
        return Utilitario.trataEnter(getTextoRespostaAcionamento());
    }

    /**
     * @param textoRespostaAcionamento
     *            textoRespostaAcionamento a ser atribuido.
     */
    public void setTextoRespostaAcionamento(String textoRespostaAcionamento) {
        if (textoRespostaAcionamento == null
                || textoRespostaAcionamento.length() == 0) {
            throw new NullPointerException();
        }
        this.textoRespostaAcionamento = textoRespostaAcionamento;
    }

    /**
     * @return Retorna textoApresentacaoFormulario.
     */
    public String getTextoApresentacaoFormulario() {
        return textoApresentacaoFormulario;
    }

    /**
     * Retorna o Texto substituindo <code>\n\r, \n ou \r por &lt;br/&gt;</code>;
     * 
     * @return Retorna o texto formatado.
     */
    public String getTextoApresentacaoFormularioFormatado() {
        return Utilitario.trataEnter(getTextoApresentacaoFormulario());
    }

    /**
     * @param textoApresentacaoFormulario
     *            textoApresentacaoFormulario a ser atribuido.
     */
    public void setTextoApresentacaoFormulario(
            String textoApresentacaoFormulario) {
        this.textoApresentacaoFormulario = textoApresentacaoFormulario;
    }

    /**
     * @return Retorna textoCanaisComunicacao.
     */
    public String getTextoCanaisComunicacao() {
        return textoCanaisComunicacao;
    }

    /**
     * Retorna o Texto substituindo <code>\n\r, \n ou \r por &lt;br/&gt;</code>;
     * 
     * @return Retorna o texto formatado.
     */
    public String getTextoCanaisComunicacaoFormatado() {
        return Utilitario.trataEnter(getTextoCanaisComunicacao());
    }

    /**
     * @param textoCanaisComunicacao
     *            textoCanaisComunicacao a ser atribuido.
     */
    public void setTextoCanaisComunicacao(String textoCanaisComunicacao) {
        this.textoCanaisComunicacao = textoCanaisComunicacao;
    }

    /**
     * @return Retorna textoApresentacaoResposta.
     */
    public String getTextoApresentacaoResposta() {
        return textoApresentacaoResposta;
    }

    /**
     * Retorna o Texto substituindo <code>\n\r, \n ou \r por &lt;br/&gt;</code>;
     * 
     * @return Retorna o texto formatado.
     */
    public String getTextoApresentacaoRespostaFormatado() {
        return Utilitario.trataEnter(getTextoApresentacaoResposta());
    }

    /**
     * @param textoApresentacaoResposta
     *            textoApresentacaoResposta a ser atribuido.
     */
    public void setTextoApresentacaoResposta(String textoApresentacaoResposta) {
        if (textoApresentacaoResposta == null
                || textoApresentacaoResposta.length() == 0) {
            throw new NullPointerException();
        }
        this.textoApresentacaoResposta = textoApresentacaoResposta;
    }

    /**
     * @return Retorna textoInformacaoOuvidoria.
     */
    public String getTextoInformacaoOuvidoria() {
        return textoInformacaoOuvidoria;
    }

    /**
     * Retorna o Texto substituindo <code>\n\r, \n ou \r por &lt;br/&gt;</code>;
     * 
     * @return Retorna o texto formatado.
     */
    public String getTextoInformacaoOuvidoriaFormatado() {
        return Utilitario.trataEnter(getTextoInformacaoOuvidoria());
    }

    /**
     * @param textoInformacaoOuvidoria
     *            textoInformacaoOuvidoria a ser atribuido.
     */
    public void setTextoInformacaoOuvidoria(String textoInformacaoOuvidoria) {
        if (textoInformacaoOuvidoria == null
                || textoInformacaoOuvidoria.length() == 0) {
            throw new NullPointerException();
        }
        this.textoInformacaoOuvidoria = textoInformacaoOuvidoria;
    }

    /**
     * @return Retorna esquemaCoresLayout.
     */
    public String getEsquemaCoresLayout() {
        return esquemaCoresLayout;
    }

    /**
     * @param esquemaCoresLayout
     *            esquemaCoresLayout a ser atribuido.
     */
    public void setEsquemaCoresLayout(String esquemaCoresLayout) {
        if (esquemaCoresLayout == null || esquemaCoresLayout.length() == 0) {
            throw new NullPointerException();
        }
        this.esquemaCoresLayout = esquemaCoresLayout;
    }

    /**
     * @return Retorna imagemLogo.
     */
    public String getImagemLogo() {
        return imagemLogo;
    }

    /**
     * @param imagemLogo
     *            imagemLogo a ser atribuido.
     */
    public void setImagemLogo(String imagemLogo) {
        this.imagemLogo = imagemLogo;
    }

    /**
     * @return Retorna descricaoImagemLogo.
     */
    public String getDescricaoImagemLogo() {
        return descricaoImagemLogo;
    }

    /**
     * @param descricaoImagemLogo
     *            descricaoImagemLogo a ser atribuido.
     */
    public void setDescricaoImagemLogo(String descricaoImagemLogo) {
        this.descricaoImagemLogo = descricaoImagemLogo;
    }
    
    /**
     * @return Retorna linkImagemLogo.
     */
    public String getLinkImagemLogo() {
        return linkImagemLogo;
    }

    /**
     * @param linkImagemLogo
     *            linkImagemLogo a ser atribuido.
     */
    public void setLinkImagemLogo(String linkImagemLogo) {
        this.linkImagemLogo = linkImagemLogo;
    }
    
    /**
     * @return Retorna imagemBanner.
     */
    public String getImagemBanner() {
        return imagemBanner;
    }

    /**
     * @param imagemBanner
     *            imagemBanner a ser atribuido.
     */
    public void setImagemBanner(String imagemBanner) {
        this.imagemBanner = imagemBanner;
    }

    /**
     * @return Retorna descricaoImagemBanner.
     */
    public String getDescricaoImagemBanner() {
        return descricaoImagemBanner;
    }

    /**
     * @param descricaoImagemBanner
     *            descricaoImagemBanner a ser atribuido.
     */
    public void setDescricaoImagemBanner(String descricaoImagemBanner) {
        this.descricaoImagemBanner = descricaoImagemBanner;
    }
    
    /**
     * @return Retorna linkImagemBanner.
     */
    public String getLinkImagemBanner() {
        return linkImagemBanner;
    }

    /**
     * @param linkImagemBanner
     *            linkImagemBanner a ser atribuido.
     */
    public void setLinkImagemBanner(String linkImagemBanner) {
        this.linkImagemBanner = linkImagemBanner;
    }

    
    /**
     * @return Retorna imagem3.
     */
    public String getImagem3() {
        return imagem3;
    }

    /**
     * @param imagem3
     *            imagem3 a ser atribuido.
     */
    public void setImagem3(String imagem3) {
        this.imagem3 = imagem3;
    }

    /**
     * @return Retorna descricaoImagem3.
     */
    public String getDescricaoImagem3() {
        return descricaoImagem3;
    }

    /**
     * @param descricaoImagem3
     *            descricaoImagem3 a ser atribuido.
     */
    public void setDescricaoImagem3(String descricaoImagem3) {
        this.descricaoImagem3 = descricaoImagem3;
    }
    
    /**
     * @return Retorna linkImagem3.
     */
    public String getLinkImagem3() {
        return linkImagem3;
    }

    /**
     * @param linkImagemBanner
     *            linkImagemBanner a ser atribuido.
     */
    public void setLinkImagem3(String linkImagem3) {
        this.linkImagem3 = linkImagem3;
    }
    
    
    /**
     * @return Retorna imagem4.
     */
    public String getImagem4() {
        return imagem4;
    }

    /**
     * @param imagem4
     *            imagem4 a ser atribuido.
     */
    public void setImagem4(String imagem4) {
        this.imagem4 = imagem4;
    }
    
    /**
     * @return Retorna descricaoImagem4.
     */
    public String getDescricaoImagem4() {
        return descricaoImagem4;
    }

    /**
     * @param descricaoImagem4
     *            descricaoImagem4 a ser atribuido.
     */
    public void setDescricaoImagem4(String descricaoImagem4) {
        this.descricaoImagem4 = descricaoImagem4;
    }
    
    /**
     * @return Retorna linkImagem4.
     */
    public String getLinkImagem4() {
        return linkImagem4;
    }

    /**
     * @param linkImagem4
     *            linkImagem4 a ser atribuido.
     */
    public void setLinkImagem4(String linkImagem4) {
        this.linkImagem4 = linkImagem4;
    }

    /**
     * @return Retorna imagem5.
     */
    public String getImagem5() {
        return imagem5;
    }

    /**
     * @param imagem5
     *            imagem5 a ser atribuido.
     */
    public void setImagem5(String imagem5) {
        this.imagem5 = imagem5;
    }
    
    /**
     * @return Retorna descricaoImagem5.
     */
    public String getDescricaoImagem5() {
        return descricaoImagem5;
    }

    /**
     * @param descricaoImagem5
     *            descricaoImagem5 a ser atribuido.
     */
    public void setDescricaoImagem5(String descricaoImagem5) {
        this.descricaoImagem5 = descricaoImagem5;
    }
    
    /**
     * @return Retorna linkImagem5.
     */
    public String getLinkImagem5() {
        return linkImagem5;
    }

    /**
     * @param linkImagem5
     *            linkImagem5 a ser atribuido.
     */
    public void setLinkImagem5(String linkImagem5) {
        this.linkImagem5 = linkImagem5;
    }

    /**
     * @return Retorna urlBaseFuncionarios.
     */
    public String getUrlBaseFuncionarios() {
        return urlBaseFuncionarios;
    }

    /**
     * @param urlBaseFuncionarios
     *            urlBaseFuncionarios a ser atribuido.
     */
    public void setUrlBaseFuncionarios(String urlBaseFuncionarios) {
        this.urlBaseFuncionarios = urlBaseFuncionarios;
    }

    /**
     * @return Retorna nomeDiretorioOrgao.
     */
    public String getNomeDiretorioOrgao() {
        return nomeDiretorioOrgao;
    }

    /**
     * @param nomeDiretorioOrgao
     *            nomeDiretorioOrgao a ser atribuido.
     */
    public void setNomeDiretorioOrgao(String nomeDiretorioOrgao) {
        if (nomeDiretorioOrgao == null || nomeDiretorioOrgao.length() == 0) {
            throw new NullPointerException();
        }
        this.nomeDiretorioOrgao = nomeDiretorioOrgao;
    }

    /**
     * @return Retorna textoConsultaRespostaNoPrazo.
     */
    public String getTextoConsultaRespostaNoPrazo() {
        return textoConsultaRespostaNoPrazo;
    }

    /**
     * Retorna o Texto substituindo <code>\n\r, \n ou \r por &lt;br/&gt;</code>;
     * 
     * @return Retorna o texto formatado.
     */
    public String getTextoConsultaRespostaNoPrazoFormatado() {
        return Utilitario.trataEnter(getTextoConsultaRespostaNoPrazo());
    }
    
    /**
     * @param textoConsultaRespostaNoPrazo
     *            textoConsultaRespostaNoPrazo a ser atribuido.
     */
    public void setTextoConsultaRespostaNoPrazo(
            String textoConsultaRespostaNoPrazo) {
        if (textoConsultaRespostaNoPrazo == null
                || textoConsultaRespostaNoPrazo.length() == 0) {
            throw new NullPointerException();
        }
        this.textoConsultaRespostaNoPrazo = textoConsultaRespostaNoPrazo;
    }

    /**
     * @return Retorna textoConsultaRespostaSemPrazo.
     */
    public String getTextoConsultaRespostaSemPrazo() {
        return textoConsultaRespostaSemPrazo;
    }

    /**
     * Retorna o Texto substituindo <code>\n\r, \n ou \r por &lt;br/&gt;</code>;
     * 
     * @return Retorna o texto formatado.
     */
    public String getTextoConsultaRespostaSemPrazoFormatado() {
        return Utilitario.trataEnter(getTextoConsultaRespostaSemPrazo());
    }

    /**
     * @param textoConsultaRespostaSemPrazo
     *            textoConsultaRespostaSemPrazo a ser atribuido.
     */
    public void setTextoConsultaRespostaSemPrazo(
            String textoConsultaRespostaSemPrazo) {
        if (textoConsultaRespostaSemPrazo == null
                || textoConsultaRespostaSemPrazo.length() == 0) {
            throw new NullPointerException();
        }
        this.textoConsultaRespostaSemPrazo = textoConsultaRespostaSemPrazo;
    }

    /**
     * @return Retorna textoConsultaRespostaEmAtraso.
     */
    public String getTextoConsultaRespostaEmAtraso() {
        return textoConsultaRespostaEmAtraso;
    }

    /**
     * Retorna o Texto substituindo <code>\n\r, \n ou \r por &lt;br/&gt;</code>;
     * 
     * @return Retorna o texto formatado.
     */
    public String getTextoConsultaRespostaEmAtrasoFormatado() {
        return Utilitario.trataEnter(getTextoConsultaRespostaEmAtraso());
    }

    /**
     * @param textoConsultaRespostaEmAtraso
     *            textoConsultaRespostaEmAtraso a ser atribuido.
     */
    public void setTextoConsultaRespostaEmAtraso(
            String textoConsultaRespostaEmAtraso) {
        if (textoConsultaRespostaEmAtraso == null
                || textoConsultaRespostaEmAtraso.length() == 0) {
            throw new NullPointerException();
        }
        this.textoConsultaRespostaEmAtraso = textoConsultaRespostaEmAtraso;
    }

    /**
     * @return Retorna textoAvaliacaoResposta.
     */
    public String getTextoAvaliacaoResposta() {
        return textoAvaliacaoResposta;
    }

    /**
     * Retorna o Texto substituindo <code>\n\r, \n ou \r por &lt;br/&gt;</code>;
     * 
     * @return Retorna o texto formatado.
     */
    public String getTextoAvaliacaoRespostaFormatado() {
        return Utilitario.trataEnter(getTextoAvaliacaoResposta());
    }

    /**
     * @param textoAvaliacaoResposta
     *            textoAvaliacaoResposta a ser atribuido.
     */
    public void setTextoAvaliacaoResposta(String textoAvaliacaoResposta) {
        if (textoAvaliacaoResposta == null
                || textoAvaliacaoResposta.length() == 0) {
            throw new NullPointerException();
        }
        this.textoAvaliacaoResposta = textoAvaliacaoResposta;
    }

    /**
     * 
     * @return
     */
    public String getNomeExibicaoOrgao() {
        return this.nomeExibicaoOrgao;
    }

    /**
     * 
     * @param nomeExibicaoOrgao
     */
    public void setNomeExibicaoOrgao(String nomeExibicaoOrgao) {
        if (nomeExibicaoOrgao == null || nomeExibicaoOrgao.length() == 0) {
            throw new NullPointerException();
        }
        this.nomeExibicaoOrgao = nomeExibicaoOrgao;
    }

    /**
     * @return Retorna remetenteEmail.
     */
    public String getRemetenteEmail() {
        return remetenteEmail;
    }

    /**
     * @param remetenteEmail
     *            remetenteEmail a ser atribuido.
     */
    public void setRemetenteEmail(String remetenteEmail) {
        if (remetenteEmail == null || remetenteEmail.length() == 0) {
            throw new NullPointerException();
        }
        this.remetenteEmail = remetenteEmail;
    }

    /**
     * @return Retorna textoLegislacaoOuvidoria.
     */
    public String getTextoLegislacaoOuvidoria() {
        return textoLegislacaoOuvidoria;
    }

    /**
     * Retorna o Texto substituindo <code>\n\r, \n ou \r por &lt;br/&gt;</code>;
     * 
     * @return Retorna o texto formatado.
     */
    public String getTextoLegislacaoOuvidoriaFormatado() {
        return Utilitario.trataEnter(getTextoLegislacaoOuvidoria());
    }

    /**
     * @param textoLegislacaoOuvidoria
     *            textoLegislacaoOuvidoria a ser atribuido.
     */
    public void setTextoLegislacaoOuvidoria(String textoLegislacaoOuvidoria) {
        this.textoLegislacaoOuvidoria = textoLegislacaoOuvidoria;
    }

    /**
     * @return Retorna corCabecalhoLogo.
     */
    public String getCorCabecalhoLogo() {
        return corCabecalhoLogo;
    }

    /**
     * @param corCabecalhoLogo
     *            corCabecalhoLogo a ser atribuido.
     */
    public void setCorCabecalhoLogo(String corCabecalhoLogo) {
        if (corCabecalhoLogo == null || corCabecalhoLogo.length() == 0) {
            throw new NullPointerException();
        }
        this.corCabecalhoLogo = corCabecalhoLogo;
    }

    /**
     * @return Retorna corCabecalhoBanner.
     */
    public String getCorCabecalhoBanner() {
        return corCabecalhoBanner;
    }

    /**
     * @param corCabecalhoBanner
     *            corCabecalhoBanner a ser atribuido.
     */
    public void setCorCabecalhoBanner(String corCabecalhoBanner) {
        if (corCabecalhoBanner == null || corCabecalhoBanner.length() == 0) {
            throw new NullPointerException();
        }
        this.corCabecalhoBanner = corCabecalhoBanner;
    }

    /**
     * @return Retorna urlSuporteUsuario.
     */
    public String getUrlSuporteUsuario() {
        return urlSuporteUsuario;
    }

    /**
     * @param urlSuporteUsuario
     *            urlSuporteUsuario a ser atribuido.
     */
    public void setUrlSuporteUsuario(String urlSuporteUsuario) {
        if (urlSuporteUsuario == null || urlSuporteUsuario.length() == 0) {
            throw new NullPointerException();
        }
        this.urlSuporteUsuario = urlSuporteUsuario;
    }

	public String getTextoNotificacaoAtraso() {
		return textoNotificacaoAtraso;
	}

	public void setTextoNotificacaoAtraso(String textoNotificacaoAtraso) {
		this.textoNotificacaoAtraso = textoNotificacaoAtraso;
	}

	public String getTextoNotificacaoAtrasoCritico() {
		return textoNotificacaoAtrasoCritico;
	}

	public void setTextoNotificacaoAtrasoCritico(
			String textoNotificacaoAtrasoCritico) {
		this.textoNotificacaoAtrasoCritico = textoNotificacaoAtrasoCritico;
	}

	public String getTextoNotificacaoPendencia() {
		return textoNotificacaoPendencia;
	}

	public void setTextoNotificacaoPendencia(String textoNotificacaoPendencia) {
		this.textoNotificacaoPendencia = textoNotificacaoPendencia;
	}


}