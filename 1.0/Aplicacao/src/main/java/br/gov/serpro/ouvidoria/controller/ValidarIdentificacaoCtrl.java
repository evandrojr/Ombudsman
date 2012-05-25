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
package br.gov.serpro.ouvidoria.controller;

import br.gov.serpro.ouvidoria.dao.Dao;
import br.gov.serpro.ouvidoria.dao.DaoException;
import br.gov.serpro.ouvidoria.dao.DaoFactory;
import br.gov.serpro.ouvidoria.model.Acionamento;
import br.gov.serpro.ouvidoria.model.Orgao;

/**
 * ValidarIdentificacaoCtrl
 * 
 * Objetivo: Validar a Identificação do acionador a um determidado Acionamento
 * 
 * @author SERPRO
 * @version $Revision: 1.1.2.3 $, $Date: 2011/10/19 18:18:09 $
 * @version 0.1, Date: 2004/12/13
 */
public class ValidarIdentificacaoCtrl {

    private Dao acionamentoDao;

    public final static int ORGAO_NAO_POSSUI_CODIGO_ACESSO = 0;

    public final static int CODIGO_ACESSO_VALIDO = 1;

    public final static int CODIGO_ACESSO_INVALIDO = 2;

    public final static int ALERTA_BLOQUEIO_PROTOCOLO = 3;

    public final static int PROTOCOLO_FOI_BLOQUEADO = 4;

    public final static int PROTOCOLO_ESTA_BLOQUEADO = 5;

    /**
     * Construtor recebendo objeto Dao
     * 
     * @param daoFactory
     */
    public ValidarIdentificacaoCtrl(final DaoFactory daoFactory) {
        acionamentoDao = daoFactory.create(Acionamento.class);
    }

    /**
     * Verifica se Código de Acesso é válido respeitando as configurações do
     * Órgão
     * 
     * @param orgao
     * @param acionamento
     * @param codigoAcesso
     * @return int Valores possíveis de retorno <br>
     *         0 - Órgão não possui Código de Acesso <br>
     *         1 - Código de Acesso válido <br>
     *         2 - Código de Acesso inválido <br>
     *         3 - Alerta bloqueio de Protocolo <br>
     *         4 - Protocolo foi bloqueado <br>
     *         5 - Protocolo está bloqueado <br>
     * @throws DaoException
     */
    public int validaIdentificacao(final Orgao orgao, Acionamento acionamento,
            final String codigoAcesso) throws DaoException {

        int valorRetorno = ValidarIdentificacaoCtrl.CODIGO_ACESSO_INVALIDO;

        if (orgao == null || acionamento == null) {
            throw new IllegalArgumentException();
        }

        if (!orgao.getConfiguracoes().getPossuiCodigoAcesso().booleanValue()) {
            return ValidarIdentificacaoCtrl.ORGAO_NAO_POSSUI_CODIGO_ACESSO;
        }

        final boolean existeBloqueio = orgao.getConfiguracoes()
                .getExisteBloqueioProtocoloPeloCodigo().booleanValue();

        if (acionamento.checarProtocoloBloqueado()) {
            return ValidarIdentificacaoCtrl.PROTOCOLO_ESTA_BLOQUEADO;
        }

        final boolean codigoAcessoValido = acionamento.getAcionador()
                .getInformacoesConsultaAcionamento().validarIdentificacao(
                        codigoAcesso);

        int numeroTentativas = 0;

        if (codigoAcessoValido) {
            valorRetorno = ValidarIdentificacaoCtrl.CODIGO_ACESSO_VALIDO;
        } else {

            numeroTentativas = acionamento.getAcionador()
                    .getInformacoesConsultaAcionamento().getNumeroTentativasCodigo()
                    .intValue();

            numeroTentativas++;

            if (existeBloqueio) {

                final int numeroTentativasOrgao = orgao.getConfiguracoes()
                        .getQtdeTentativasPossiveisCodigoAcesso().intValue();

                if (numeroTentativas >= numeroTentativasOrgao) {

                    Integer tempoBloqueio = orgao.getConfiguracoes()
                            .getTempoBloqueioProtocoloPeloCodigo();

                    acionamento.bloquearProtocolo(tempoBloqueio);

                    valorRetorno = ValidarIdentificacaoCtrl.PROTOCOLO_FOI_BLOQUEADO;
                    numeroTentativas = 0;
                } else if (numeroTentativas == (numeroTentativasOrgao - 1)) {
                    valorRetorno = ValidarIdentificacaoCtrl.ALERTA_BLOQUEIO_PROTOCOLO;
                } else {
                    valorRetorno = ValidarIdentificacaoCtrl.CODIGO_ACESSO_INVALIDO;
                }
            }
        }

        acionamento.getAcionador().getInformacoesConsultaAcionamento()
                .setNumeroTentativasCodigo(new Integer(numeroTentativas));

        acionamentoDao.save(acionamento);

        return valorRetorno;
    }

}