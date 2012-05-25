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

import java.sql.Timestamp;

/**
 * MeioEnvioRespostaOrgao 
 * 
 * Objetivo: Mapeia os Meios de Envio de Resposta de um órgão. 
 * 
 * @author SERPRO
 * @version $Revision: 1.1.2.3 $, $Date: 2011/10/20 17:10:35 $
 * @version 0.1, Date: 2004/11/19
 */
public class MeioEnvioRespostaOrgao extends PersistentObject {

	private static final long serialVersionUID = 1L;

	private Long id;

    /* Requerido */
    private MeioEnvioResposta meioEnvioResposta;

    /* Requerido */
    private Orgao orgao;

    private Timestamp dataVigencia;

    /*
     * (non-Javadoc)
     * 
     * @see br.gov.serpro.ouvidoria.model.Identifiable#getId()
     */
    public Long getId() {
        return id;
    }

    /**
     * @return Retorna meioEnvioResposta.
     */
    public MeioEnvioResposta getMeioEnvioResposta() {
        return this.meioEnvioResposta;
    }

    /**
     * @param meioEnvioResposta
     *            meioEnvioResposta a ser atribuido.
     */
    public void setMeioEnvioResposta(MeioEnvioResposta meioEnvioResposta) {
        if (meioEnvioResposta == null) {
            throw new NullPointerException();
        }
        this.meioEnvioResposta = meioEnvioResposta;
    }

    /**
     * @return Retorna orgao.
     */
    public Orgao getOrgao() {
        return this.orgao;
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
     * @param id
     *            id a ser atribuido.
     */
    public void setId(Long id) {
        this.id = id;
    }

    /**
     * @return Retorna a data de vigência.
     */
    public Timestamp getDataVigencia() {
        return dataVigencia;
    }

    /**
     * @param dataVigencia
     *            A data de vigência a ser atribuída.
     */
    public void setDataVigencia(Timestamp dataVigencia) {
        this.dataVigencia = dataVigencia;
    }

}