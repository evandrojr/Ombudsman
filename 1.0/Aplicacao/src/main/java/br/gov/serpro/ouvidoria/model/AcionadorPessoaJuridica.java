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
 * Esta classe representa os acionadores do tipo pessoa jurídica do sistema.
 * 
 * @author SERPRO
 * @version $Revision: 1.1.2.3 $, $Date: 2011/10/19 20:36:55 $
 * @version 0.1, Date: 2004/11/19
 */
public class AcionadorPessoaJuridica extends Acionador {

	private static final long serialVersionUID = 1L;

	/* Requerido */
    private String cnpj;

    /* Requerido */
    private String razaoSocial;

    /* Requerido */
    private String cpfAcionador;

    private String nomeContato;

    /**
     * @return Retorna o CNPJ.
     */
    public String getCnpj() {
        String dec = null;

        if (this.cnpj != null)
            try {
                dec = new String(Utilitario.decrypt(Constants.DES_KEY,
                        this.cnpj));
            } catch (RuntimeException e) {
                if (Constants.DEBUG) {
                    System.out.println(e);
                }
                dec = this.cnpj;
            }

        return dec;
    }

    /**
     * @param cnpj
     *            O cnpj a ser atribuído.
     */
    public void setCnpj(final String cnpj) {
        if (cnpj == null || cnpj.length() == 0) {
            throw new NullPointerException();
        }

        String enc = null;

        if (cnpj != null)
            try {
                enc = Utilitario.encrypt(Constants.DES_KEY, cnpj);
            } catch (RuntimeException e) {
                if (Constants.DEBUG) {
                    System.out.println(e);
                }
                enc = cnpj;
            }

        this.cnpj = enc;
    }

    /**
     * @return Retorna a razão social.
     */
    public String getRazaoSocial() {
        String dec = null;

        if (this.razaoSocial != null)
            try {
                dec = new String(Utilitario.decrypt(Constants.DES_KEY,
                        this.razaoSocial));
            } catch (RuntimeException e) {
                if (Constants.DEBUG) {
                    System.out.println(e);
                }
                dec = this.razaoSocial;
            }

        return dec;
    }

    /**
     * @param razaoSocial
     *            A razão social a ser atribuída.
     */
    public void setRazaoSocial(final String razaoSocial) {
        if (razaoSocial == null || razaoSocial.trim().length() == 0) {
            throw new NullPointerException();
        }
        
        String enc = null;

        if (razaoSocial != null)
            try {
                enc = Utilitario.encrypt(Constants.DES_KEY, razaoSocial);
            } catch (RuntimeException e) {
                if (Constants.DEBUG) {
                    System.out.println(e);
                }
                enc = razaoSocial;
            }

        this.razaoSocial = enc;
    }

    /**
     * @return Retorna o cpf do acionador.
     */
    public String getCpfAcionador() {
        String dec = null;

        if (this.cpfAcionador != null)
            try {
                dec = new String(Utilitario.decrypt(Constants.DES_KEY,
                        this.cpfAcionador));
            } catch (RuntimeException e) {
                if (Constants.DEBUG) {
                    System.out.println(e);
                }
                dec = this.cpfAcionador;
            }

        return dec;
    }

    /**
     * @param cpfAcionador
     *            O CPF do acionador a ser atribuído.
     */
    public void setCpfAcionador(final String cpfAcionador) {
        if (cpfAcionador == null || cpfAcionador.length() == 0) {
            throw new NullPointerException();
        }

        String enc = null;

        if (cpfAcionador != null)
            try {
                enc = Utilitario.encrypt(Constants.DES_KEY, cpfAcionador);
            } catch (RuntimeException e) {
                if (Constants.DEBUG) {
                    System.out.println(e);
                }
                enc = cpfAcionador;
            }

        this.cpfAcionador = enc;
    }

    /**
     * @return Retorna o nome do contato.
     */
    public String getNomeContato() {
        String dec = null;

        if (this.nomeContato != null)
            try {
                dec = new String(Utilitario.decrypt(Constants.DES_KEY,
                        this.nomeContato));
            } catch (RuntimeException e) {
                if (Constants.DEBUG) {
                    System.out.println(e);
                }
                dec = this.nomeContato;
            }

        return dec;
    }

    /**
     * @param nomeContato
     *            O nome do contato a ser atribuído.
     */
    public void setNomeContato(final String nomeContato) {
        String enc = null;

        if (nomeContato != null)
            try {
                enc = Utilitario.encrypt(Constants.DES_KEY, nomeContato);
            } catch (RuntimeException e) {
                if (Constants.DEBUG) {
                    System.out.println(e);
                }
                enc = nomeContato;
            }

        this.nomeContato = enc;
    }
}