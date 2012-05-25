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
 * Esta classe representa os acionadores do sistema.
 * 
 * @author SERPRO
 * @version $Revision: 1.1.2.3 $, $Date: 2011/10/19 20:36:55 $
 * @version 0.1, Date: 2004/11/24
 */
public class Acionador extends PersistentObject {

	private static final long serialVersionUID = 1L;

	/* Requerido */
    private Long id;

    private String sexo;

    /* Requerido se meio de resposta é email */
    private String email;

    /* Requerido se meio de resposta é telefone */
    private String codigoPaisTelefone;

    /* Requerido se meio de resposta é telefone */
    private String codigoCidadeTelefone;

    /* Requerido se meio de resposta é telefone */
    private String telefone;

    /* Requerido se meio de resposta é fax */
    private String codigoPaisFax;

    /* Requerido se meio de resposta é fax */
    private String codigoCidadeFax;

    /* Requerido se meio de resposta é fax */
    private String fax;

    private Escolaridade escolaridade;

    private FaixaEtaria faixaEtaria;

    /* Requerido */
    private MeioEnvioRespostaOrgao meioEnvioRespostaOrgao;

    /* Requerido */
    private TipoAcionador tipoAcionador;

    private UF uf;

    private Pais pais;

    private InformacoesRecebimentoRespostaCarta informacoesRecebimentoRespostaCarta;

    /* Requerido se aplicação configurada para usar código de acesso */
    private InformacoesConsultaAcionamento informacoesConsultaAcionamento;

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
     * @return Retorna o sexo.
     */
    public String getSexo() {
        return sexo;
    }

    /**
     * @param sexo
     *            O sexo a ser atribuído.
     */
    public void setSexo(String sexo) {
        if ((sexo != null) && (sexo.length() > 0) && (sexo.compareTo("M") != 0)
                && (sexo.compareTo("F") != 0)) {
            throw new IllegalArgumentException();
        }
        this.sexo = sexo;
    }

    /**
     * @return Retorna o email.
     */
    public String getEmail() {
        String dec = null;

        if (this.email != null)
            try {
                dec = new String(Utilitario.decrypt(Constants.DES_KEY,
                        this.email));
            } catch (RuntimeException e) {
                if (Constants.DEBUG) {
                    System.out.println(e);
                }
                dec = this.email;
            }

        return dec;
    }

    /**
     * @param email
     *            O email a ser atribuído.
     */
    public void setEmail(final String email) {
        String enc = null;

        if (email != null)
            try {
                enc = Utilitario.encrypt(Constants.DES_KEY, email);
            } catch (RuntimeException e) {
                if (Constants.DEBUG) {
                    System.out.println(e);
                }
                enc = email;
            }

        this.email = enc;
    }

    /**
     * @return Retorna codigoCidadeTelefone.
     */
    public String getCodigoCidadeTelefone() {
        String dec = null;

        if (this.codigoCidadeTelefone != null)
            try {
                dec = new String(Utilitario.decrypt(Constants.DES_KEY,
                        this.codigoCidadeTelefone));
            } catch (RuntimeException e) {
                if (Constants.DEBUG) {
                    System.out.println(e);
                }
                dec = this.codigoCidadeTelefone;
            }

        return dec;
    }

    /**
     * @param codigoCidadeTelefone
     *            codigoCidadeTelefone a ser atribuido.
     */
    public void setCodigoCidadeTelefone(final String codigoCidadeTelefone) {
        String enc = null;

        if (codigoCidadeTelefone != null)
            try {
                enc = Utilitario.encrypt(Constants.DES_KEY,
                        codigoCidadeTelefone);
            } catch (RuntimeException e) {
                if (Constants.DEBUG) {
                    System.out.println(e);
                }
                enc = codigoCidadeTelefone;
            }

        this.codigoCidadeTelefone = enc;
    }

    /**
     * @return Retorna codigoPaisTelefone.
     */
    public String getCodigoPaisTelefone() {
        String dec = null;

        if (this.codigoPaisTelefone != null)
            try {
                dec = new String(Utilitario.decrypt(Constants.DES_KEY,
                        this.codigoPaisTelefone));
            } catch (RuntimeException e) {
                if (Constants.DEBUG) {
                    System.out.println(e);
                }
                dec = this.codigoPaisTelefone;
            }

        return dec;
    }

    /**
     * @param codigoPaisTelefone
     *            codigoPaisTelefone a ser atribuido.
     */
    public void setCodigoPaisTelefone(final String codigoPaisTelefone) {
        String enc = null;

        if (codigoPaisTelefone != null)
            try {
                enc = Utilitario.encrypt(Constants.DES_KEY, codigoPaisTelefone);
            } catch (RuntimeException e) {
                if (Constants.DEBUG) {
                    System.out.println(e);
                }
                enc = codigoPaisTelefone;
            }

        this.codigoPaisTelefone = enc;
    }

    /**
     * @return Retorna o telefone.
     */
    public String getTelefone() {
        String dec = null;

        if (this.telefone != null)
            try {
                dec = new String(Utilitario.decrypt(Constants.DES_KEY,
                        this.telefone));
            } catch (RuntimeException e) {
                if (Constants.DEBUG) {
                    System.out.println(e);
                }
                dec = this.telefone;
            }

        return dec;
    }

    /**
     * @param telefone
     *            O telefone a ser atribuído.
     */
    public void setTelefone(final String telefone) {
        String enc = null;

        if (telefone != null)
            try {
                enc = Utilitario.encrypt(Constants.DES_KEY, telefone);
            } catch (RuntimeException e) {
                if (Constants.DEBUG) {
                    System.out.println(e);
                }
                enc = telefone;
            }

        this.telefone = enc;
    }

    /**
     * @return Retorna codigoCidadeFax.
     */
    public String getCodigoCidadeFax() {
        String dec = null;

        if (this.codigoCidadeFax != null)
            try {
                dec = new String(Utilitario.decrypt(Constants.DES_KEY,
                        this.codigoCidadeFax));
            } catch (RuntimeException e) {
                if (Constants.DEBUG) {
                    System.out.println(e);
                }
                dec = this.codigoCidadeFax;
            }

        return dec;
    }

    /**
     * @param codigoCidadeFax
     *            codigoCidadeFax a ser atribuido.
     */
    public void setCodigoCidadeFax(final String codigoCidadeFax) {
        String enc = null;

        if (codigoCidadeFax != null)
            try {
                enc = Utilitario.encrypt(Constants.DES_KEY, codigoCidadeFax);
            } catch (RuntimeException e) {
                if (Constants.DEBUG) {
                    System.out.println(e);
                }
                enc = codigoCidadeFax;
            }

        this.codigoCidadeFax = enc;
    }

    /**
     * @return Retorna codigoPaisFax.
     */
    public String getCodigoPaisFax() {
        String dec = null;

        if (this.codigoPaisFax != null)
            try {
                dec = new String(Utilitario.decrypt(Constants.DES_KEY,
                        this.codigoPaisFax));
            } catch (RuntimeException e) {
                if (Constants.DEBUG) {
                    System.out.println(e);
                }
                dec = this.codigoPaisFax;
            }

        return dec;
    }

    /**
     * @param codigoPaisFax
     *            codigoPaisFax a ser atribuido.
     */
    public void setCodigoPaisFax(final String codigoPaisFax) {
        String enc = null;

        if (codigoPaisFax != null)
            try {
                enc = Utilitario.encrypt(Constants.DES_KEY, codigoPaisFax);
            } catch (RuntimeException e) {
                if (Constants.DEBUG) {
                    System.out.println(e);
                }
                enc = codigoPaisFax;
            }

        this.codigoPaisFax = enc;
    }

    /**
     * @return Retorna o fax.
     */
    public String getFax() {
        String dec = null;

        if (this.fax != null)
            try {
                dec = new String(Utilitario
                        .decrypt(Constants.DES_KEY, this.fax));
            } catch (RuntimeException e) {
                if (Constants.DEBUG) {
                    System.out.println(e);
                }
                dec = this.fax;
            }

        return dec;
    }

    /**
     * @param fax
     *            O fax a ser atribuído.
     */
    public void setFax(final String fax) {
        String enc = null;

        if (fax != null)
            try {
                enc = Utilitario.encrypt(Constants.DES_KEY, fax);
            } catch (RuntimeException e) {
                if (Constants.DEBUG) {
                    System.out.println(e);
                }
                enc = fax;
            }

        this.fax = enc;
    }

    /**
     * @return Retorna a escolaridade.
     */
    public Escolaridade getEscolaridade() {
        return escolaridade;
    }

    /**
     * @param escolaridade
     *            A escolaridade a ser atribuída.
     */
    public void setEscolaridade(Escolaridade escolaridade) {
        this.escolaridade = escolaridade;
    }

    /**
     * @return Retorna a faixa etária.
     */
    public FaixaEtaria getFaixaEtaria() {
        return faixaEtaria;
    }

    /**
     * @param faixaEtaria
     *            A faixaEtaria a ser atribuída.
     */
    public void setFaixaEtaria(FaixaEtaria faixaEtaria) {
        this.faixaEtaria = faixaEtaria;
    }

    /**
     * @return Retorna o meio de envio da resposta do acionamento.
     */
    public MeioEnvioRespostaOrgao getMeioEnvioRespostaOrgao() {
        return meioEnvioRespostaOrgao;
    }

    /**
     * @param meioEnvioResposta
     *            O meioEnvioResposta a ser atribuído.
     */
    public void setMeioEnvioRespostaOrgao(
            MeioEnvioRespostaOrgao meioEnvioRespostaOrgao) {
        if (meioEnvioRespostaOrgao == null) {
            throw new NullPointerException();
        }
        this.meioEnvioRespostaOrgao = meioEnvioRespostaOrgao;
    }

    /**
     * @return Retorna o tipo do acionador.
     */
    public TipoAcionador getTipoAcionador() {
        return tipoAcionador;
    }

    /**
     * @param tipoAcionador
     *            O tipoAcionador a ser atribuído.
     */
    public void setTipoAcionador(TipoAcionador tipoAcionador) {
        if (tipoAcionador == null) {
            throw new NullPointerException();
        }
        this.tipoAcionador = tipoAcionador;
    }

    /**
     * @return Retorna a UF do acionador.
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
     * @return Retorna o país.
     */
    public Pais getPais() {
        return pais;
    }

    /**
     * @param pais
     *            O país a ser atribuído.
     */
    public void setPais(Pais pais) {
        this.pais = pais;
    }

    /**
     * @return Retorna o objeto InformacoesRecebimentoRespostaCarta do
     *         acionador.
     */
    public InformacoesRecebimentoRespostaCarta getInformacoesRecebimentoRespostaCarta() {
        return informacoesRecebimentoRespostaCarta;
    }

    /**
     * @param informacoesRecebimentoRespostaCarta
     *            O objeto InformacoesRecebimentoRespostaCarta a ser atribuído.
     */
    public void setInformacoesRecebimentoRespostaCarta(
            InformacoesRecebimentoRespostaCarta informacoesRecebimentoRespostaCarta) {
        this.informacoesRecebimentoRespostaCarta = informacoesRecebimentoRespostaCarta;
    }

    /**
     * @return Retorna o objeto InformacoesConsultaAcionamento do acionador.
     */
    public InformacoesConsultaAcionamento getInformacoesConsultaAcionamento() {
        return informacoesConsultaAcionamento;
    }

    /**
     * @param informacoesConsultaAcionamento
     *            O objeto InformacoesConsultaAcionamento a ser atribuído.
     */
    public void setInformacoesConsultaAcionamento(
            InformacoesConsultaAcionamento informacoesConsultaAcionamento) {
        this.informacoesConsultaAcionamento = informacoesConsultaAcionamento;
    }

    /**
     * Este método é responsável por criar um objeto com as informações de
     * consulta do acionamento.
     * 
     * @param pergunta
     *            A pergunta que deve ser respondida para recuperação do código
     *            de acesso.
     * @param resposta
     *            A resposta à pergunta cadastrada.
     * @param numeroTentativas
     *            Número de vezes em que o usuário errou ou o código de acesso
     *            ou a resposta à pergunta.
     */
    public void criarInformacoesConsultaAcionamento(String pergunta,
            String resposta, Integer numeroTentativas) {
        if (this.informacoesConsultaAcionamento == null) {
            this.informacoesConsultaAcionamento = new InformacoesConsultaAcionamento();
        }
        this.informacoesConsultaAcionamento.gerarCodigoAcesso();
        this.informacoesConsultaAcionamento.setPergunta(pergunta);
        this.informacoesConsultaAcionamento.setResposta(resposta);
        this.informacoesConsultaAcionamento
                .setNumeroTentativasCodigo(numeroTentativas);
        this.informacoesConsultaAcionamento
                .setNumeroTentativasPergunta(numeroTentativas);

    }

    /**
     * Este método é responsável por criar um objeto com as informações de
     * recebimento de resposta via carta.
     * 
     * @param logradouro
     *            Logradouro do endereço para onde a carta será enviada.
     * @param numero
     *            Número do endereço para onde a carta será enviada.
     * @param complemento
     *            Complemento do endereço para onde a carta será enviada.
     * @param cep
     *            CEP do endereço para onde a carta será enviada.
     * @param bairro
     *            Bairro do endereço para onde a carta será enviada.
     * @param cidade
     *            Cidade do endereço para onde a carta será enviada. ou a
     *            resposta à pergunta.
     */
    public void criarInformacoesRecebimentoRespostaCarta(
            String logradouro, String numero, String complemento, String cep,
            String bairro, String cidade, Pais pPais, UF pUf) {

        if (this.informacoesRecebimentoRespostaCarta == null) {
            this.informacoesRecebimentoRespostaCarta = new InformacoesRecebimentoRespostaCarta();
        }

        this.informacoesRecebimentoRespostaCarta.setLogradouro(logradouro);
        this.informacoesRecebimentoRespostaCarta.setNumero(numero);
        this.informacoesRecebimentoRespostaCarta.setComplemento(complemento);
        this.informacoesRecebimentoRespostaCarta.setCep(cep);
        this.informacoesRecebimentoRespostaCarta.setBairro(bairro);
        this.informacoesRecebimentoRespostaCarta.setCidade(cidade);
        this.informacoesRecebimentoRespostaCarta.setPais(pPais);
        this.informacoesRecebimentoRespostaCarta.setUf(pUf);
    }

    /**
     * Este método retorna se um acionador é anônimo.
     * 
     * @return True se o acionador é anônimo e False caso contrário
     */
    public boolean checarAcionadorAnonimo() {
        if (this.tipoAcionador.equals(TipoAcionador.ANONIMO)) {
            return true;
        }
        return false;
    }

}