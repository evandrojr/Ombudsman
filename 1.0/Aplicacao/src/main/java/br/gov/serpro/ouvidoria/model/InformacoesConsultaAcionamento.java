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

import br.gov.serpro.ouvidoria.util.Constants;
import br.gov.serpro.ouvidoria.util.Utilitario;

/**
 * Esta classe representa as informações necessárias para que um acionador
 * acesse um acionamento.
 * 
 * @author SERPRO
 * @version $Revision: 1.1.2.3 $, $Date: 2011/10/20 17:07:44 $
 * @version 0.1, Date: 2004/11/19
 */
public class InformacoesConsultaAcionamento extends PersistentObject {

	private static final long serialVersionUID = 1L;

	private Long id;

    private String codigoAcesso;

    private String pergunta;

    private String resposta;

    private Integer numeroTentativasCodigo;

    private Integer numeroTentativasPergunta;

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
     * @return Retorna o código de acesso.
     */
    public String getCodigoAcesso() {
        String dec = null;

        if (this.codigoAcesso != null)
            try {
                dec = new String(Utilitario.decrypt(Constants.DES_KEY,
                        this.codigoAcesso));
            } catch (RuntimeException e) {
                if (Constants.DEBUG) {
                    System.out.println(e);
                }
                dec = this.codigoAcesso;
            }

        return dec;

    }

    /**
     * @param codigoAcesso
     *            O código de acesso a ser atribuído.
     */
    public void setCodigoAcesso(final String codigoAcesso) {
        String enc = null;

        if (codigoAcesso != null)
            try {
                enc = Utilitario.encrypt(Constants.DES_KEY, codigoAcesso);
            } catch (RuntimeException e) {
                if (Constants.DEBUG) {
                    System.out.println(e);
                }
                enc = codigoAcesso;
            }

        this.codigoAcesso = enc;
    }

    /**
     * @return Retorna a pergunta.
     */
    public String getPergunta() {
        return pergunta;
    }

    /**
     * @param pergunta
     *            A pergunta a ser atribuída.
     */
    public void setPergunta(String pergunta) {
        this.pergunta = pergunta;
    }

    /**
     * @return Retorna a resposta.
     */
    public String getResposta() {
        return resposta;
    }

    /**
     * @param resposta
     *            A resposta a ser atribuída.
     */
    public void setResposta(String resposta) {
        this.resposta = resposta;
    }

    /**
     * Este método verifica se o código de acesso informado pelo acionador para
     * consultar um acionamento é igual ao que foi gerado no momento da criação
     * do acionamento.
     * 
     * @param codigoAcesso
     *            O código de acesso informado pelo acionador.
     * @return Retorna True se o código de acesso passado corresponde ao
     *         registrado no sistema e False caso contrário.
     */
    public boolean validarIdentificacao(final String codigoAcesso) {
        return codigoAcesso == null ? false : codigoAcesso
                .equalsIgnoreCase(getCodigoAcesso());
    }

    /**
     * Este método é responsável por gerar o código de acesso de um acionamento.
     */
    public void gerarCodigoAcesso() {
        setCodigoAcesso(Utilitario.gerarStringRandomica(8));
    }

    /**
     * Este método é responsável por verificar se a resposta informada para a
     * pergunta cadastrada corresponde à resposta correta.
     * 
     * @param resposta
     *            A resposta informada para verificação.
     * @return Retorna True se a resposta passada corresponde à registrada no
     *         sistema e False caso contrário.
     */
    public boolean verificarRespostaPergunta(String resposta) {
        if (this.resposta.compareToIgnoreCase(resposta) == 0) {
            return true;
        }
        return false;
    }

    /**
     * Este método incrementa o Número de tentativas erradas para código.
     */
    public void incrementarNumeroTentativasCodigo() {
        if (this.numeroTentativasCodigo == null) {
            this.numeroTentativasCodigo = new Integer(1);
        } else {
            this.numeroTentativasCodigo = new Integer(
                    this.numeroTentativasCodigo.intValue() + 1);
        }
    }

    /**
     * Este método zera o Número de tentativas erradas para código.
     */
    public void zerarNumeroTentativasCodigo() {
        this.numeroTentativasCodigo = new Integer(0);
    }

    /**
     * Este método incrementa o Número de tentativas erradas para pergunta.
     */
    public void incrementarNumeroTentativasPergunta() {
        if (this.numeroTentativasPergunta == null) {
            this.numeroTentativasPergunta = new Integer(1);
        } else {
            this.numeroTentativasPergunta = new Integer(
                    this.numeroTentativasPergunta.intValue() + 1);
        }
    }

    /**
     * Este método zera o Número de tentativas erradas para pergunta.
     */
    public void zerarNumeroTentativasPergunta() {
        this.numeroTentativasPergunta = new Integer(0);
    }

    /**
     * @return Retorna numeroTentativasCodigo.
     */
    public Integer getNumeroTentativasCodigo() {
        return numeroTentativasCodigo;
    }

    /**
     * @param numeroTentativasCodigo
     *            numeroTentativasCodigo a ser atribuido.
     */
    public void setNumeroTentativasCodigo(Integer numeroTentativasCodigo) {
        this.numeroTentativasCodigo = numeroTentativasCodigo;
    }

    /**
     * @return Retorna numeroTentativasPergunta.
     */
    public Integer getNumeroTentativasPergunta() {
        return numeroTentativasPergunta;
    }

    /**
     * @param numeroTentativasPergunta
     *            numeroTentativasPergunta a ser atribuido.
     */
    public void setNumeroTentativasPergunta(Integer numeroTentativasPergunta) {
        this.numeroTentativasPergunta = numeroTentativasPergunta;
    }
}