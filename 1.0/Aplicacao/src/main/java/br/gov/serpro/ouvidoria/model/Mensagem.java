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
 * Esta classe representa as mensagens de um acionamento (acionamento
 * propriamente dito).
 * 
 * @author SERPRO
 * @version $Revision: 1.1.2.3 $, $Date: 2011/10/20 19:27:38 $
 * @version 0.1, Date: 2004/11/19
 */
public class Mensagem extends PersistentObject {

	private static final long serialVersionUID = 1L;

	/* Requerido */
    private Long id;

    private String texto;

    private String arquivoAnexo;

    private String mensagemDigitalizada;

    /* Requerido */
    private Assunto assunto;

    /* Requerido */
    private TipoMensagem tipoMensagem;

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
     * @return Retorna o texto.
     */
    public String getTexto() {

        String dec = null;

        if (this.texto != null)
            try {
                dec = new String(Utilitario.decrypt(Constants.DES_KEY,
                        this.texto));
            } catch (RuntimeException e) {
                if (Constants.DEBUG) {
                    System.out.println(e);
                }
                dec = this.texto;
            }

        return dec;
    }

    /**
     * Retorna o Texto substituindo <code>\n ou \r por <br/>, "<" por &lt; e ">" por &gt;</code>, mas não alterando
     * o conteúdo no Banco de Dados
     * 
     * @return Retorna o texto formatado.
     */
    public String getTextoFormatado() {
        return Utilitario.trataEnter(getTexto());
    }

    /**
     * @param texto
     *            O texto a ser atribuído.
     */
    public void setTexto(final String texto) {
        String enc = null;

        if (texto != null) {
            final String temp = Utilitario.trataTagsHtml(texto);
            try {
                enc = Utilitario.encrypt(Constants.DES_KEY, temp);
            } catch (RuntimeException e) {
                if (Constants.DEBUG) {
                    System.out.println(e);
                }
                enc = texto;
            }
        }

        this.texto = enc;
    }

    /**
     * @param arquivoAnexo
     *            O nome do arquivo anexo a ser atribuído.
     */
    public void setArquivoAnexo(final String arquivoAnexo) {
        String enc = null;

        if (arquivoAnexo != null)
            try {
                enc = Utilitario.encrypt(Constants.DES_KEY, arquivoAnexo);
            } catch (RuntimeException e) {
                if (Constants.DEBUG) {
                    System.out.println(e);
                }
                enc = arquivoAnexo;
            }

        this.arquivoAnexo = enc;
    }

    /**
     * @return Retorna o nome do arquivo anexo.
     */
    public String getArquivoAnexo() {
        String dec = null;

        if (this.arquivoAnexo != null)
            try {
                dec = new String(Utilitario.decrypt(Constants.DES_KEY,
                        this.arquivoAnexo));
            } catch (RuntimeException e) {
                if (Constants.DEBUG) {
                    System.out.println(e);
                }
                dec = this.arquivoAnexo;
            }

        return dec;
    }

    /**
     * @param mensagemDigitalizada
     *            O nome do arquivo da mensagem digitalizada a ser atribuído.
     */
    public void setMensagemDigitalizada(final String mensagemDigitalizada) {
        String enc = null;

        if (mensagemDigitalizada != null)
            try {
                enc = Utilitario.encrypt(Constants.DES_KEY,
                        mensagemDigitalizada);
            } catch (RuntimeException e) {
                if (Constants.DEBUG) {
                    System.out.println(e);
                }
                enc = mensagemDigitalizada;
            }

        this.mensagemDigitalizada = enc;
    }

    /**
     * @return Retorna o nome do arquivo da mensagem digitalizada.
     */
    public String getMensagemDigitalizada() {
        String dec = null;

        if (this.mensagemDigitalizada != null)
            try {
                dec = new String(Utilitario.decrypt(Constants.DES_KEY,
                        this.mensagemDigitalizada));
            } catch (RuntimeException e) {
                if (Constants.DEBUG) {
                    System.out.println(e);
                }
                dec = this.mensagemDigitalizada;
            }

        return dec;
    }

    /**
     * @return Retorna o assunto da mensagem.
     */
    public Assunto getAssunto() {
        return assunto;
    }

    /**
     * @param assunto
     *            O assunto da mensagem.
     */
    public void setAssunto(Assunto assunto) {
        if (assunto == null) {
            throw new NullPointerException();
        }
        this.assunto = assunto;
    }

    /**
     * @return Retorna o tipo da mensagem.
     */
    public TipoMensagem getTipoMensagem() {
        return tipoMensagem;
    }

    /**
     * @param tipoMensagem
     *            O tipo da mensagem.
     */
    public void setTipoMensagem(TipoMensagem tipoMensagem) {
        if (tipoMensagem == null) {
            throw new NullPointerException();
        }
		this.tipoMensagem = tipoMensagem;
	}

}