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
 * Esta classe representa as informações referentes necessárias para o envio da
 * resposta do acionamento para o acionador via carta.
 * 
 * @author SERPRO
 * @version $Revision: 1.1.2.3 $, $Date: 2011/10/20 17:07:44 $
 * @version 0.1, Date: 2004/11/19
 */
public class InformacoesRecebimentoRespostaCarta extends PersistentObject {

	private static final long serialVersionUID = 1L;

	private Long id;

	/* Requerido */
	private String logradouro;

	private String numero;

	private String complemento;

	/* Requerido */
	private String cep;

	/* Requerido */
	private String bairro;

	/* Requerido */
	private String cidade;

	private UF uf;

	/* Requerido */
	private Pais pais;

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
	 * @return Retorna o logradouro.
	 */
	public String getLogradouro() {
		String dec = null;

		if (this.logradouro != null)
			try {
				dec = new String(Utilitario.decrypt(Constants.DES_KEY,
						this.logradouro));
			} catch (RuntimeException e) {
				if (Constants.DEBUG) {
					System.out.println(e);
				}
				dec = this.logradouro;
			}

		return dec;
	}

	/**
	 * @param logradouro
	 *            O logradouro a ser atribuído.
	 */
	public void setLogradouro(final String logradouro) {

		if (logradouro == null || logradouro.length() == 0) {
			throw new NullPointerException();
		}

		String enc = null;

		if (logradouro != null)
			try {
				enc = Utilitario.encrypt(Constants.DES_KEY, logradouro);
			} catch (RuntimeException e) {
				if (Constants.DEBUG) {
					System.out.println(e);
				}
				enc = logradouro;
			}

		this.logradouro = enc;
	}

	/**
	 * @return Retorna o Número.
	 */
	public String getNumero() {
		String dec = null;

		if (this.numero != null)
			try {
				dec = new String(Utilitario.decrypt(Constants.DES_KEY,
						this.numero));
			} catch (RuntimeException e) {
				if (Constants.DEBUG) {
					System.out.println(e);
				}
				dec = this.numero;
			}

		return dec;
	}

	/**
	 * @param numero
	 *            O Número a ser atribuído.
	 */
	public void setNumero(final String numero) {
		String enc = null;

		if (numero != null)
			try {
				enc = Utilitario.encrypt(Constants.DES_KEY, numero);
			} catch (RuntimeException e) {
				if (Constants.DEBUG) {
					System.out.println(e);
				}
				enc = numero;
			}

		this.numero = enc;
	}

	/**
	 * @return Retorna o complemento.
	 */
	public String getComplemento() {
		String dec = null;

		if (this.complemento != null)
			try {
				dec = new String(Utilitario.decrypt(Constants.DES_KEY,
						this.complemento));
			} catch (RuntimeException e) {
				if (Constants.DEBUG) {
					System.out.println(e);
				}
				dec = this.complemento;
			}

		return dec;
	}

	/**
	 * @param complemento
	 *            O complemento a ser atribuído.
	 */
	public void setComplemento(final String complemento) {
		String enc = null;

		if (complemento != null)
			try {
				enc = Utilitario.encrypt(Constants.DES_KEY, complemento);
			} catch (RuntimeException e) {
				if (Constants.DEBUG) {
					System.out.println(e);
				}
				enc = complemento;
			}

		this.complemento = enc;
	}

	/**
	 * @return Retorna o cep.
	 */
	public String getCep() {
		String dec = null;

		if (this.cep != null)
			try {
				dec = new String(
						Utilitario.decrypt(Constants.DES_KEY, this.cep));
			} catch (RuntimeException e) {
				if (Constants.DEBUG) {
					System.out.println(e);
				}
				dec = this.cep;
			}

		return dec;
	}

	/**
	 * @param cep
	 *            O cep a ser atribuído.
	 */
	public void setCep(final String cep) {
		if (cep == null || cep.length() == 0) {
			throw new NullPointerException();
		}

		String enc = null;

		if (cep != null)
			try {
				enc = Utilitario.encrypt(Constants.DES_KEY, cep);
			} catch (RuntimeException e) {
				if (Constants.DEBUG) {
					System.out.println(e);
				}
				enc = cep;
			}

		this.cep = enc;
	}

	/**
	 * @return Retorna o bairro.
	 */
	public String getBairro() {
		String dec = null;

		if (this.bairro != null)
			try {
				dec = new String(Utilitario.decrypt(Constants.DES_KEY,
						this.bairro));
			} catch (RuntimeException e) {
				if (Constants.DEBUG) {
					System.out.println(e);
				}
				dec = this.bairro;
			}

		return dec;
	}

	/**
	 * @param bairro
	 *            O bairro a ser atribuído.
	 */
	public void setBairro(final String bairro) {
		if (bairro == null || bairro.length() == 0) {
			throw new NullPointerException();
		}

		String enc = null;

		if (bairro != null)
			try {
				enc = Utilitario.encrypt(Constants.DES_KEY, bairro);
			} catch (RuntimeException e) {
				if (Constants.DEBUG) {
					System.out.println(e);
				}
				enc = bairro;
			}

		this.bairro = enc;
	}

	/**
	 * @return Retorna a cidade.
	 */
	public String getCidade() {
		String dec = null;

		if (this.cidade != null)
			try {
				dec = new String(Utilitario.decrypt(Constants.DES_KEY,
						this.cidade));
			} catch (RuntimeException e) {
				if (Constants.DEBUG) {
					System.out.println(e);
				}
				dec = this.cidade;
			}

		return dec;
	}

	/**
	 * @param cidade
	 *            A cidade a ser atribuída.
	 */
	public void setCidade(final String cidade) {
		if (cidade == null || cidade.length() == 0) {
			throw new NullPointerException();
		}

		String enc = null;

		if (cidade != null)
			try {
				enc = Utilitario.encrypt(Constants.DES_KEY, cidade);
			} catch (RuntimeException e) {
				if (Constants.DEBUG) {
					System.out.println(e);
				}
				enc = cidade;
			}

		this.cidade = enc;
	}

	/**
	 * @return Retorna a UF.
	 */
	public UF getUf() {
		return uf;
	}

	/**
	 * @param uf
	 *            A UF a ser atribuída.
	 */
	public void setUf(UF uf) {
		this.uf = uf;
	}

	/**
	 * @return Retorna pais.
	 */
	public Pais getPais() {
		return pais;
	}

	/**
	 * @param pais
	 *            pais a ser atribuido.
	 */
	public void setPais(Pais pais) {
		if (pais == null) {
			throw new NullPointerException();
		}
		this.pais = pais;
	}
}