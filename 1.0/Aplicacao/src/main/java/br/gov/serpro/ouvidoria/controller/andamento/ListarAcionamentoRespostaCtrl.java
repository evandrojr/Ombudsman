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
package br.gov.serpro.ouvidoria.controller.andamento;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;

import br.gov.serpro.ouvidoria.controller.AcionamentoCtrl;
import br.gov.serpro.ouvidoria.dao.Dao;
import br.gov.serpro.ouvidoria.dao.DaoException;
import br.gov.serpro.ouvidoria.dao.DaoFactory;
import br.gov.serpro.ouvidoria.model.Acionamento;
import br.gov.serpro.ouvidoria.model.EstadoAcionamento;
import br.gov.serpro.ouvidoria.model.Funcionario;
import br.gov.serpro.ouvidoria.model.Instituicao;
import br.gov.serpro.ouvidoria.model.MeioEnvioResposta;
import br.gov.serpro.ouvidoria.model.Orgao;
import br.gov.serpro.ouvidoria.model.SubOrgao;

/**
 * ListarAcionamentoRespostaCtrl
 * 
 * Objetivo: Responsável pelo processo de Envio de Resposta para Acionamentos
 * 
 * @author SERPRO
 * @version $Revision: 1.1.2.4 $, $Date: 2011/10/18 17:55:13 $
 * @version 0.1, Date: 2004/12/16
 */
public class ListarAcionamentoRespostaCtrl {

    private Dao acionamentoDao;

    private DaoFactory daoFactory;

    /**
     * Construtor recebendo objeto Dao
     * 
     * @param daoFactory
     */
    public ListarAcionamentoRespostaCtrl(final DaoFactory daoFactory) {
        this.daoFactory = daoFactory;
        acionamentoDao = daoFactory.create(Acionamento.class);
    }

    /**
     * Recupera o Acionamento a partir do código e verifica se o
     * funcionário tem permissão de acesso a ele.
     * 
     * @param orgao
     * @param funcionario
     * @param acionamentoId
     * @return
     * @throws DaoException
     */
    public Acionamento getAcionamentoPeloCodigo(final Orgao orgao,
            final Funcionario funcionario, final String acionamentoId)
            throws DaoException {

        if (orgao == null || funcionario == null || acionamentoId == null) {
            throw new IllegalArgumentException();
        }

        Acionamento acionamento = (Acionamento) acionamentoDao.get(new Long(
                acionamentoId));

        if (verificaPermissao(funcionario, acionamento)) {
            return acionamento;
        }

        return null;
    }

    /**
     * Recupera o Acionamento a partir do número do protocolo e verifica se o
     * Funcionário tem permissão de acesso a ele.
     * 
     * @param orgao
     * @param funcionario
     * @param numeroProtocolo
     * @return Acionamento
     * @throws DaoException
     */
    public Acionamento getAcionamentoPeloProtocolo(final Orgao orgao,
            final Funcionario funcionario, final String numeroProtocolo)
            throws DaoException {

        if (orgao == null || funcionario == null || numeroProtocolo == null) {
            throw new IllegalArgumentException();
        }

        AcionamentoCtrl acionamentoCtrl = new AcionamentoCtrl(daoFactory);

        Acionamento acionamento = acionamentoCtrl.getAcionamentoPeloProtocolo(
                orgao, new Integer(numeroProtocolo));

        if (acionamento == null) {
            return null;
        }

        if (verificaPermissao(funcionario, acionamento)) {
            return acionamento;
        }

        return null;
    }

    /**
     * Recupera uma lista de Acionamentos a partir dos parâmetros de busca e
     * verifica se o funcionário tem permissão de acesso a eles.
     * 
     * @param orgao
     * @param funcionario
     * @param meioEnvio
     * @param situacao
     * @return
     * @throws DaoException
     */
    public Collection listarAcionamentos(final Orgao orgao,
            final Funcionario funcionario, final String meioEnvio,
            final String situacao) throws DaoException {

        if (orgao == null || funcionario == null) {
            throw new IllegalArgumentException();
        }

        List acionamentos = new ArrayList();

        String sql = " select a  from Acionamento as a, Orgao as o "
                + "  where o.id = " + orgao.getId();

        if (meioEnvio != null) {
            sql += " and a.acionador.meioEnvioRespostaOrgao.meioEnvioResposta.id = "
                    + meioEnvio;
        }

        if (situacao == null) {
            sql += " and a.estadoAcionamento.id in ( "
                    + EstadoAcionamento.RESPONDIDO.getId() + ","
                    + EstadoAcionamento.ENVIADO.getId() + ")";
        } else {
            sql += " and a.estadoAcionamento.id = " + situacao;
        }

        sql += " and ( a.mensagem.assunto.instituicao.id = o.id or a.mensagem.assunto.instituicao in elements( o.listaSubOrgao ) ) "
                + "  order by a.respostaAcionamento.data desc ";
            
        List acnmnts = acionamentoDao.query(sql);

        for (Iterator iter = acnmnts.iterator(); iter.hasNext();) {
            Acionamento acionamento = (Acionamento) iter.next();

            if (verificaPermissao(funcionario, acionamento)) {
                acionamentos.add(acionamento);
            }
        }

        return acionamentos;
    }

    /**
     * Verifica se o funcionário tem permissão de acesso ao acionamento.
     * 
     * @param funcionario
     * @param acionamento
     * @return True se tem acesso, False caso contrário.
     */
    private boolean verificaPermissao(final Funcionario funcionario,
            final Acionamento acionamento) {

        boolean permiteAcesso = false;

        Instituicao inst = acionamento.getMensagem().getAssunto()
                .getInstituicao();

        if (funcionario.getListaInstituicao().contains(inst)) {
            permiteAcesso = true;
        } else {
            if (inst instanceof SubOrgao) {
                inst = ((SubOrgao) inst).getOrgao();
                if (funcionario.getListaInstituicao().contains(inst)) {
                    permiteAcesso = true;
                }
            }
        }

        return permiteAcesso;
    }

    /**
     * Altera o Estado de um grupo de Acionamento para EstadoAcionamento.ENVIADO
     * 
     * @param String[]
     *            de Identificadores de acionamentos
     * @throws DaoException
     */
    public void atualizaEstadoAcionamentos(final String[] acionamentos)
            throws DaoException {

        if (acionamentos == null) {
            throw new IllegalArgumentException();
        }

        Acionamento acionamento = null;
        for (int i = 0; i < acionamentos.length; i++) {

            acionamento = (Acionamento) acionamentoDao.get(new Long(
                    acionamentos[i]));

            if (acionamento != null) {
                acionamento.setEstadoAcionamento(EstadoAcionamento.ENVIADO);

                if (acionamento.getAcionador().getMeioEnvioRespostaOrgao()
                        .getMeioEnvioResposta().equals(MeioEnvioResposta.CARTA)
                        || acionamento.getAcionador()
                                .getMeioEnvioRespostaOrgao()
                                .getMeioEnvioResposta().equals(
                                        MeioEnvioResposta.TELEFONE)
                        || acionamento.getAcionador()
                                .getMeioEnvioRespostaOrgao()
                                .getMeioEnvioResposta().equals(
                                        MeioEnvioResposta.FAX)
                        || acionamento.getAcionador()
                                .getMeioEnvioRespostaOrgao()
                                .getMeioEnvioResposta().equals(
                                        MeioEnvioResposta.EMAIL)) {                	
                    acionamento.getRespostaAcionamento().setDataEnvio(
                            new Timestamp(System.currentTimeMillis()));
                }

                acionamentoDao.save(acionamento);
            }

        }

    }

}