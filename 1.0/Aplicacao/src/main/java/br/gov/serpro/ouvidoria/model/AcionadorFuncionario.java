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
 * Esta classe representa os acionadores do tipo funcionário do sistema.
 * 
 * @author SERPRO
 * @version $Revision: 1.1.2.3 $, $Date: 2011/10/19 20:36:55 $
 * @version 0.1, Date: 2004/11/19
 */
public class AcionadorFuncionario extends AcionadorPessoaFisica {

	private static final long serialVersionUID = 1L;

	/* Requerido */
    private String matricula;

    private String setor;

    /**
     * @return Retorna a matrícula.
     */
    public String getMatricula() {
        String dec = null;

        if (this.matricula != null)
            try {
                dec = new String(Utilitario.decrypt(Constants.DES_KEY,
                        this.matricula));
            } catch (RuntimeException e) {
                if (Constants.DEBUG) {
                    System.out.println(e);
                }
                dec = this.matricula;
            }

        return dec;
    }

    /**
     * @param matricula
     *            A matrícula a ser atribuída.
     */
    public void setMatricula(final String matricula) {
        if (matricula == null) {
            throw new NullPointerException();
        }

        String enc = null;

        if (matricula != null)
            try {
                enc = Utilitario.encrypt(Constants.DES_KEY, matricula);
            } catch (RuntimeException e) {
                if (Constants.DEBUG) {
                    System.out.println(e);
                }
                enc = matricula;
            }

        this.matricula = enc;
    }

    /**
     * @return Retorna o setor.
     */
    public String getSetor() {
        String dec = null;

        if (this.setor != null)
            try {
                dec = new String(Utilitario.decrypt(Constants.DES_KEY,
                        this.setor));
            } catch (RuntimeException e) {
                if (Constants.DEBUG) {
                    System.out.println(e);
                }
                dec = this.setor;
            }

        return dec;
    }

    /**
     * @param setor
     *            O setor a ser atribuído.
     */
    public void setSetor(final String setor) {
        String enc = null;

        if (setor != null)
            try {
                enc = Utilitario.encrypt(Constants.DES_KEY, setor);
            } catch (RuntimeException e) {
                if (Constants.DEBUG) {
                    System.out.println(e);
                }
                enc = setor;
            }

        this.setor = enc;
    }
}