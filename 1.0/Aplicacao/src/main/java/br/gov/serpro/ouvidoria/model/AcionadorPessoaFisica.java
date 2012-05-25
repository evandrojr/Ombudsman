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
 * Esta classe representa os acionadores do tipo pessoa física do sistema.
 * 
 * @author SERPRO
 * @version $Revision: 1.1.2.3 $, $Date: 2011/10/19 20:36:55 $
 * @version 0.1, Date: 2004/11/19
 */
public class AcionadorPessoaFisica extends Acionador {

	private static final long serialVersionUID = 1L;

	/*
	 * Requerido se o objeto é instância desta classe (e não de alguma
	 * subclasse)
	 */
	private String nome;

	/*
	 * Requerido se o objeto é instância da classe AcionadorFuncionario
	 * (subclasse)
	 */
	private String cpf;

	/**
	 * @return Retorna o nome.
	 */
	public String getNome() {
		String dec = null;

		if (this.nome != null)
			try {
				dec = new String(Utilitario.decrypt(Constants.DES_KEY,
						this.nome));
			} catch (RuntimeException e) {
				if (Constants.DEBUG) {
					System.out.println(e);
				}
				dec = this.nome;
			}

		return dec;
	}

	/**
	 * @param nome
	 *            O nome a ser atribuído.
	 */
	public void setNome(final String nome) {
		String enc = null;

		if (nome != null)
			try {
				enc = Utilitario.encrypt(Constants.DES_KEY, nome);
			} catch (RuntimeException e) {
				if (Constants.DEBUG) {
					System.out.println(e);
				}
				enc = nome;
			}

		this.nome = enc;
	}

	/**
	 * @return Retorna o cpf.
	 */
	public String getCpf() {
		String dec = null;

		if (this.cpf != null)
			try {
				dec = new String(
						Utilitario.decrypt(Constants.DES_KEY, this.cpf));
			} catch (RuntimeException e) {
				if (Constants.DEBUG) {
					System.out.println(e);
				}
				dec = this.cpf;
			}

		return dec;
	}

	/**
	 * @param cpf
	 *            O cpf a ser atribuído.
	 */
	public void setCpf(final String cpf) {
		String enc = null;

		if (cpf != null)
			try {
				enc = Utilitario.encrypt(Constants.DES_KEY, cpf);
			} catch (RuntimeException e) {
				if (Constants.DEBUG) {
					System.out.println(e);
				}
				enc = cpf;
			}

		this.cpf = enc;
	}
}