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
package br.gov.serpro.ouvidoria.controller.gerencial.administracao;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;

import org.apache.struts.upload.FormFile;

import br.gov.serpro.ouvidoria.dao.Dao;
import br.gov.serpro.ouvidoria.dao.DaoException;
import br.gov.serpro.ouvidoria.dao.DaoFactory;
import br.gov.serpro.ouvidoria.model.ConfiguracoesOrgao;
import br.gov.serpro.ouvidoria.model.MeioEnvioResposta;
import br.gov.serpro.ouvidoria.model.MeioEnvioRespostaOrgao;
import br.gov.serpro.ouvidoria.model.Orgao;
import br.gov.serpro.ouvidoria.model.ParametrosGerais;
import br.gov.serpro.ouvidoria.model.TipoAcionador;
import br.gov.serpro.ouvidoria.model.TipoAcionadorOrgao;
import br.gov.serpro.ouvidoria.util.Constants;
import br.gov.serpro.ouvidoria.util.Utilitario;

/**
 * 
 * Objetivo: Funcionalidades CRUD de Configurações do Órgão
 * 
 * @author SERPRO
 * @version $Revision: 1.1.2.3 $, $Date: 2011/10/18 17:55:14 $
 * @version 0.1, Date: 2005/01/05
 */
public class ConfiguracoesOrgaoCtrl {

    private Dao orgaoDao;

    private Dao configuracoesOrgaoDao;

    private Dao meioEnvioRespostaDao;

    private Dao meioEnvioRespostaOrgaoDao;

    private Dao parametrosGeraisDao;

    private Dao tipoAcionadorOrgaoDao;

    /**
     * Construtor recebendo objeto Dao
     * 
     * @param daoFactory
     */
    public ConfiguracoesOrgaoCtrl(final DaoFactory daoFactory) {
        orgaoDao = daoFactory.create(Orgao.class);
        configuracoesOrgaoDao = daoFactory.create(ConfiguracoesOrgao.class);
        meioEnvioRespostaDao = daoFactory.create(MeioEnvioResposta.class);
        meioEnvioRespostaOrgaoDao = daoFactory
                .create(MeioEnvioRespostaOrgao.class);
        parametrosGeraisDao = daoFactory.create(ParametrosGerais.class);
        tipoAcionadorOrgaoDao = daoFactory.create(TipoAcionadorOrgao.class);
    }

    public List listarMeioEnvioResposta() throws DaoException {
        List listaMeioEnvioResposta = meioEnvioRespostaDao.list();
        MeioEnvioResposta merInternet = MeioEnvioResposta.INTERNET;

        if (listaMeioEnvioResposta != null)
            listaMeioEnvioResposta.remove(merInternet);

        return listaMeioEnvioResposta;
    }

    public ConfiguracoesOrgao get(final Long id) throws DaoException {
        if (id == null) {
            throw new DaoException("ID do Objeto não pode ser nulo.");
        }
        return (ConfiguracoesOrgao) configuracoesOrgaoDao.get(id);
    }

    public MeioEnvioResposta getMeioEnvioResposta(final Long id)
            throws DaoException {
        if (id == null) {
            throw new DaoException("ID do Objeto não pode ser nulo.");
        }
        return (MeioEnvioResposta) meioEnvioRespostaDao.get(id);
    }

    public ParametrosGerais getParametrosGerais() throws DaoException {
        return (ParametrosGerais) parametrosGeraisDao.list().get(0);
    }

    public void insert(final Orgao localOrgao,
            final Boolean permiteMsgDigitalizadaAcionamento,
            final Integer tamanhoMaxArquivoCartaDigitalizada,
            final Boolean permiteArquivoAnexoAcionamento,
            final Integer tamanhoMaxArquivoAnexo,
            final Boolean atendenteConsultaMsgNoAtendimento,
            final Boolean exigeCertificadoDigitalGeral,
            final Boolean exigeCertificadoDigitalOrgao,
            final Boolean possuiCodigoAcesso,
            final Boolean existeBloqueioProtocoloPeloCodigo,
            final Boolean existeBloqueioProtocoloPelaPergunta,
            final Integer tempoBloqueioProtocoloPeloCodigo,
            final Integer tempoBloqueioProtocoloPelaPergunta,
            final Integer qtdeTentativasPossiveisCodigoAcesso,
            final Integer qtdeTentativasPossiveisPergunta,
            final String textoApresentacaoOuvidoria,
            final String textoRespostaAcionamento,
            final String textoApresentacaoFormulario,
            final String textoCanaisComunicacao,
            final String textoApresentacaoResposta,
            final String textoInformacaoOuvidoria,
            final String textoConsultaRespostaNoPrazo,
            final String textoConsultaRespostaSemPrazo,
            final String textoConsultaRespostaEmAtraso,
            final String textoAvaliacaoResposta,
            final String textoLegislacaoOuvidoria,
            final String esquemaCoresLayout, final String nomeExibicaoOrgao,
            final String nomeDiretorioOrgao, final FormFile imagemLogo,
            final String corCabecalhoLogo, final FormFile imagemBanner,
            final String corCabecalhoBanner, final FormFile imagem3,
            final FormFile imagem4, final FormFile imagem5,
            final String descricaoImagemLogo,
            final String descricaoImagemBanner, final String descricaoImagem3,
            final String descricaoImagem4, final String descricaoImagem5,
            final String linkImagemLogo, final String linkImagemBanner,
            final String linkImagem3, final String linkImagem4,
            final String linkImagem5, final String urlBaseFuncionarios,
            final String urlSuporteUsuario, final String remetenteEmail,
            Collection listaMeioEnvioResposta, Collection listaTipoAcionador,
            final String notificacaoEmail,
            final String horaEnvioNotificacao,
            final String textoNotificacaoPendencia,
            final String textoNotificacaoAtraso,
            final String textoNotificacaoAtrasoCritico)
            throws DaoException {

        ConfiguracoesOrgao configuracoesOrgao = new ConfiguracoesOrgao();
        
        /*Campos para envio de notificacao*/
        configuracoesOrgao
        	.setNotificacaoEmail(notificacaoEmail);
        
        configuracoesOrgao
    	.setHoraEnvioNotificacao(horaEnvioNotificacao);
        
        configuracoesOrgao
    	.setTextoNotificacaoPendencia(textoNotificacaoPendencia);
        
        configuracoesOrgao
    	.setTextoNotificacaoAtraso(textoNotificacaoAtraso);
        
        configuracoesOrgao
    	.setTextoNotificacaoAtrasoCritico(textoNotificacaoAtrasoCritico);
        
        /*Fim Campos para envio de notificacao*/
        
        configuracoesOrgao
                .setPermiteMsgDigitalizadaAcionamento(permiteMsgDigitalizadaAcionamento);
        configuracoesOrgao
                .setTamanhoMaxArquivoCartaDigitalizada(tamanhoMaxArquivoCartaDigitalizada);
        configuracoesOrgao
                .setPermiteArquivoAnexoAcionamento(permiteArquivoAnexoAcionamento);
        configuracoesOrgao.setTamanhoMaxArquivoAnexo(tamanhoMaxArquivoAnexo);
        configuracoesOrgao
                .setAtendenteConsultaMsgNoAtendimento(atendenteConsultaMsgNoAtendimento);
        configuracoesOrgao
                .setExigeCertificadoDigitalGeral(exigeCertificadoDigitalGeral);
        configuracoesOrgao
                .setExigeCertificadoDigitalOrgao(exigeCertificadoDigitalOrgao);
        configuracoesOrgao.setPossuiCodigoAcesso(possuiCodigoAcesso);
        configuracoesOrgao
                .setExisteBloqueioProtocoloPeloCodigo(existeBloqueioProtocoloPeloCodigo);
        configuracoesOrgao
                .setExisteBloqueioProtocoloPelaPergunta(existeBloqueioProtocoloPelaPergunta);
        configuracoesOrgao
                .setTempoBloqueioProtocoloPeloCodigo(tempoBloqueioProtocoloPeloCodigo);
        configuracoesOrgao
                .setTempoBloqueioProtocoloPelaPergunta(tempoBloqueioProtocoloPelaPergunta);
        configuracoesOrgao
                .setQtdeTentativasPossiveisCodigoAcesso(qtdeTentativasPossiveisCodigoAcesso);
        configuracoesOrgao
                .setQtdeTentativasPossiveisPergunta(qtdeTentativasPossiveisPergunta);
        configuracoesOrgao
                .setTextoApresentacaoOuvidoria(textoApresentacaoOuvidoria);
        configuracoesOrgao
                .setTextoRespostaAcionamento(textoRespostaAcionamento);
        configuracoesOrgao
                .setTextoApresentacaoFormulario(textoApresentacaoFormulario);
        configuracoesOrgao.setTextoCanaisComunicacao(textoCanaisComunicacao);
        configuracoesOrgao
                .setTextoApresentacaoResposta(textoApresentacaoResposta);
        configuracoesOrgao
                .setTextoInformacaoOuvidoria(textoInformacaoOuvidoria);
        configuracoesOrgao
                .setTextoConsultaRespostaNoPrazo(textoConsultaRespostaNoPrazo);
        configuracoesOrgao
                .setTextoConsultaRespostaSemPrazo(textoConsultaRespostaSemPrazo);
        configuracoesOrgao
                .setTextoConsultaRespostaEmAtraso(textoConsultaRespostaEmAtraso);
        configuracoesOrgao.setTextoAvaliacaoResposta(textoAvaliacaoResposta);
        configuracoesOrgao
                .setTextoLegislacaoOuvidoria(textoLegislacaoOuvidoria);
        configuracoesOrgao.setEsquemaCoresLayout(esquemaCoresLayout);
        configuracoesOrgao.setNomeExibicaoOrgao(nomeExibicaoOrgao);
        configuracoesOrgao.setNomeDiretorioOrgao(nomeDiretorioOrgao);
        configuracoesOrgao.setCorCabecalhoLogo(corCabecalhoLogo);
        configuracoesOrgao.setCorCabecalhoBanner(corCabecalhoBanner);

        this.tratarImagens(configuracoesOrgao, imagemLogo, imagemBanner,
                imagem3, imagem4, imagem5);

        configuracoesOrgao.setDescricaoImagemLogo(descricaoImagemLogo);
        configuracoesOrgao.setDescricaoImagemBanner(descricaoImagemBanner);
        configuracoesOrgao.setDescricaoImagem3(descricaoImagem3);
        configuracoesOrgao.setDescricaoImagem4(descricaoImagem4);
        configuracoesOrgao.setDescricaoImagem5(descricaoImagem5);
        configuracoesOrgao.setLinkImagemLogo(linkImagemLogo);
        configuracoesOrgao.setLinkImagemBanner(linkImagemBanner);
        configuracoesOrgao.setLinkImagem3(linkImagem3);
        configuracoesOrgao.setLinkImagem4(linkImagem4);
        configuracoesOrgao.setLinkImagem5(linkImagem5);

        configuracoesOrgao.setUrlBaseFuncionarios(urlBaseFuncionarios);
        configuracoesOrgao.setUrlSuporteUsuario(urlSuporteUsuario);
        configuracoesOrgao.setRemetenteEmail(remetenteEmail);

        // MeioEnvioResposta Internet sempre ocorre
        // inserir na lista de MER vindo da tela
        MeioEnvioResposta merInternet = MeioEnvioResposta.INTERNET;
        listaMeioEnvioResposta.add(merInternet);

        this.salvarMeioEnvioResposta(localOrgao, listaMeioEnvioResposta);
        this.salvarTipoAcionador(localOrgao, listaTipoAcionador);

        localOrgao.setConfiguracoes(configuracoesOrgao);

        try {
            orgaoDao.save(localOrgao);
        } catch (Exception e) {
            if (Constants.DEBUG) {
                System.out.println(e);
            }
        }

        criaEstruturaDiretorio(localOrgao);
    }

    public void update(final String id, final Orgao localOrgao,
            final Boolean permiteMsgDigitalizadaAcionamento,
            final Integer tamanhoMaxArquivoCartaDigitalizada,
            final Boolean permiteArquivoAnexoAcionamento,
            final Integer tamanhoMaxArquivoAnexo,
            final Boolean atendenteConsultaMsgNoAtendimento,
            final Boolean exigeCertificadoDigitalGeral,
            final Boolean exigeCertificadoDigitalOrgao,
            final Boolean possuiCodigoAcesso,
            final Boolean existeBloqueioProtocoloPeloCodigo,
            final Boolean existeBloqueioProtocoloPelaPergunta,
            final Integer tempoBloqueioProtocoloPeloCodigo,
            final Integer tempoBloqueioProtocoloPelaPergunta,
            final Integer qtdeTentativasPossiveisCodigoAcesso,
            final Integer qtdeTentativasPossiveisPergunta,
            final String textoApresentacaoOuvidoria,
            final String textoRespostaAcionamento,
            final String textoApresentacaoFormulario,
            final String textoCanaisComunicacao,
            final String textoApresentacaoResposta,
            final String textoInformacaoOuvidoria,
            final String textoConsultaRespostaNoPrazo,
            final String textoConsultaRespostaSemPrazo,
            final String textoConsultaRespostaEmAtraso,
            final String textoAvaliacaoResposta,
            final String textoLegislacaoOuvidoria,
            final String esquemaCoresLayout, final String nomeExibicaoOrgao,
            final FormFile imagemLogo, final String corCabecalhoLogo,
            final FormFile imagemBanner, final String corCabecalhoBanner,
            final FormFile imagem3, final FormFile imagem4,
            final FormFile imagem5, final String descricaoImagemLogo,
            final String descricaoImagemBanner, final String descricaoImagem3,
            final String descricaoImagem4, final String descricaoImagem5,
            final String linkImagemLogo, final String linkImagemBanner,
            final String linkImagem3, final String linkImagem4,
            final String linkImagem5, final String urlBaseFuncionarios,
            final String urlSuporteUsuario, final String remetenteEmail,
            final Collection listaMeioEnvioResposta,
            final Collection listaTipoAcionador,
            final String notificacaoEmail,
            final String horaEnvioNotificacao,
            final String textoNotificacaoPendencia,
            final String textoNotificacaoAtraso,
            final String textoNotificacaoAtrasoCritico) throws DaoException {

        if (id == null) {
            throw new DaoException("ID do Objeto não pode ser nulo.");
        }

        ConfiguracoesOrgao configuracoesOrgao = get(new Long(id));

        /*Campos para envio de notificacao*/
        configuracoesOrgao
        	.setNotificacaoEmail(notificacaoEmail);
        
        configuracoesOrgao
    	.setHoraEnvioNotificacao(horaEnvioNotificacao);
        
        configuracoesOrgao
    	.setTextoNotificacaoPendencia(textoNotificacaoPendencia);
        
        configuracoesOrgao
    	.setTextoNotificacaoAtraso(textoNotificacaoAtraso);
        
        configuracoesOrgao
    	.setTextoNotificacaoAtrasoCritico(textoNotificacaoAtrasoCritico);
        
        /*Fim campos para envio de notificação*/
        
        configuracoesOrgao
                .setPermiteMsgDigitalizadaAcionamento(permiteMsgDigitalizadaAcionamento);
        configuracoesOrgao
                .setTamanhoMaxArquivoCartaDigitalizada(tamanhoMaxArquivoCartaDigitalizada);
        configuracoesOrgao
                .setPermiteArquivoAnexoAcionamento(permiteArquivoAnexoAcionamento);
        configuracoesOrgao.setTamanhoMaxArquivoAnexo(tamanhoMaxArquivoAnexo);
        configuracoesOrgao
                .setAtendenteConsultaMsgNoAtendimento(atendenteConsultaMsgNoAtendimento);
        configuracoesOrgao
                .setExigeCertificadoDigitalGeral(exigeCertificadoDigitalGeral);
        configuracoesOrgao
                .setExigeCertificadoDigitalOrgao(exigeCertificadoDigitalOrgao);
        configuracoesOrgao.setPossuiCodigoAcesso(possuiCodigoAcesso);
        configuracoesOrgao
                .setExisteBloqueioProtocoloPeloCodigo(existeBloqueioProtocoloPeloCodigo);
        configuracoesOrgao
                .setExisteBloqueioProtocoloPelaPergunta(existeBloqueioProtocoloPelaPergunta);
        configuracoesOrgao
                .setTempoBloqueioProtocoloPeloCodigo(tempoBloqueioProtocoloPeloCodigo);
        configuracoesOrgao
                .setTempoBloqueioProtocoloPelaPergunta(tempoBloqueioProtocoloPelaPergunta);
        configuracoesOrgao
                .setQtdeTentativasPossiveisCodigoAcesso(qtdeTentativasPossiveisCodigoAcesso);
        configuracoesOrgao
                .setQtdeTentativasPossiveisPergunta(qtdeTentativasPossiveisPergunta);
        configuracoesOrgao
                .setTextoApresentacaoOuvidoria(textoApresentacaoOuvidoria);
        configuracoesOrgao
                .setTextoRespostaAcionamento(textoRespostaAcionamento);
        configuracoesOrgao
                .setTextoApresentacaoFormulario(textoApresentacaoFormulario);
        configuracoesOrgao.setTextoCanaisComunicacao(textoCanaisComunicacao);
        configuracoesOrgao
                .setTextoApresentacaoResposta(textoApresentacaoResposta);
        configuracoesOrgao
                .setTextoInformacaoOuvidoria(textoInformacaoOuvidoria);
        configuracoesOrgao
                .setTextoConsultaRespostaNoPrazo(textoConsultaRespostaNoPrazo);
        configuracoesOrgao
                .setTextoConsultaRespostaSemPrazo(textoConsultaRespostaSemPrazo);
        configuracoesOrgao
                .setTextoConsultaRespostaEmAtraso(textoConsultaRespostaEmAtraso);
        configuracoesOrgao.setTextoAvaliacaoResposta(textoAvaliacaoResposta);
        configuracoesOrgao
                .setTextoLegislacaoOuvidoria(textoLegislacaoOuvidoria);
        configuracoesOrgao.setEsquemaCoresLayout(esquemaCoresLayout);
        configuracoesOrgao.setNomeExibicaoOrgao(nomeExibicaoOrgao);
        configuracoesOrgao.setCorCabecalhoLogo(corCabecalhoLogo);
        configuracoesOrgao.setCorCabecalhoBanner(corCabecalhoBanner);

        this.tratarImagens(configuracoesOrgao, imagemLogo, imagemBanner,
                imagem3, imagem4, imagem5);

        configuracoesOrgao.setDescricaoImagemLogo(descricaoImagemLogo);
        configuracoesOrgao.setDescricaoImagemBanner(descricaoImagemBanner);
        configuracoesOrgao.setDescricaoImagem3(descricaoImagem3);
        configuracoesOrgao.setDescricaoImagem4(descricaoImagem4);
        configuracoesOrgao.setDescricaoImagem5(descricaoImagem5);
        configuracoesOrgao.setLinkImagemLogo(linkImagemLogo);
        configuracoesOrgao.setLinkImagemBanner(linkImagemBanner);
        configuracoesOrgao.setLinkImagem3(linkImagem3);
        configuracoesOrgao.setLinkImagem4(linkImagem4);
        configuracoesOrgao.setLinkImagem5(linkImagem5);

        configuracoesOrgao.setUrlBaseFuncionarios(urlBaseFuncionarios);
        configuracoesOrgao.setUrlSuporteUsuario(urlSuporteUsuario);
        configuracoesOrgao.setRemetenteEmail(remetenteEmail);

        // MeioEnvioResposta Internet sempre ocorre
        // inserir na lista de MER vindo da tela
        MeioEnvioResposta merInternet = MeioEnvioResposta.INTERNET;
        listaMeioEnvioResposta.add(merInternet);

        this.salvarMeioEnvioResposta(localOrgao, listaMeioEnvioResposta);
        this.salvarTipoAcionador(localOrgao, listaTipoAcionador);

        localOrgao.setConfiguracoes(configuracoesOrgao);

        try {
            orgaoDao.save(localOrgao);
        } catch (Exception e) {

            if (Constants.DEBUG) {
                System.out.println(e);
            }
        }

        criaEstruturaDiretorio(localOrgao);
    }

    private MeioEnvioRespostaOrgao getMeioEnvioRespostaOrgao(Orgao orgao,
            MeioEnvioResposta meioEnvioResposta) throws DaoException {

        // monta a string com a query
        String sql = "Select mero from MeioEnvioRespostaOrgao as mero";
        sql += " where mero.orgao.id = " + orgao.getId();
        sql += " and mero.meioEnvioResposta.id = " + meioEnvioResposta.getId();

        // Recupera lista
        List listaMeioEnvioRespostaOrgao = meioEnvioRespostaOrgaoDao.query(sql);

        if (listaMeioEnvioRespostaOrgao == null
                || listaMeioEnvioRespostaOrgao.isEmpty()) {
            return null;
        }

        return (MeioEnvioRespostaOrgao) listaMeioEnvioRespostaOrgao.get(0);
    }

    private void salvarMeioEnvioResposta(Orgao orgao,
            Collection listaMeioEnvioResposta) throws DaoException {

        Collection listaMeioEnvioRespOrgao = orgao
                .getListaMeioEnvioRespostaOrgao();
        Timestamp dataAtual = new Timestamp(System.currentTimeMillis());

        for (Iterator iter = listaMeioEnvioRespOrgao.iterator(); iter.hasNext();) {

            MeioEnvioRespostaOrgao meioEnvioRespostaOrgao = (MeioEnvioRespostaOrgao) iter
                    .next();
            MeioEnvioResposta mer = meioEnvioRespostaOrgao
                    .getMeioEnvioResposta();

            // se meioEnvioResposta não está na nova lista
            // tratar exclusão, atualizando a data de vigência
            if (!listaMeioEnvioResposta.contains(mer)) {
                meioEnvioRespostaOrgao.setDataVigencia(dataAtual);
                meioEnvioRespostaOrgaoDao.save(meioEnvioRespostaOrgao);
            }
            // excluir o meioEnvioResposta da lista nova pois não precisa ser
            // inserido novamente
            listaMeioEnvioResposta.remove(mer);
        }

        for (Iterator iter = listaMeioEnvioResposta.iterator(); iter.hasNext();) {

            MeioEnvioResposta meioEnvioResposta = (MeioEnvioResposta) iter
                    .next();
            MeioEnvioRespostaOrgao meioEnvioRespostaOrgao = this
                    .getMeioEnvioRespostaOrgao(orgao, meioEnvioResposta);

            if (meioEnvioRespostaOrgao == null) {
                meioEnvioRespostaOrgao = new MeioEnvioRespostaOrgao();
                meioEnvioRespostaOrgao.setOrgao(orgao);
                meioEnvioRespostaOrgao.setMeioEnvioResposta(meioEnvioResposta);
            }

            meioEnvioRespostaOrgao.setDataVigencia(null);
            meioEnvioRespostaOrgaoDao.save(meioEnvioRespostaOrgao);

            listaMeioEnvioRespOrgao.add(meioEnvioRespostaOrgao);
        }
    }

    private TipoAcionadorOrgao getTipoAcionadorOrgao(final Orgao orgao,
            final TipoAcionador tipoAcionador) throws DaoException {

        // monta a string com a query
        String sql = "Select t from TipoAcionadorOrgao as t ";
        sql += " where t.orgao.id = " + orgao.getId();
        sql += " and t.tipoAcionador.id = " + tipoAcionador.getId();

        // Recupera lista
        List listaTipoAcionadorOrgao = tipoAcionadorOrgaoDao.query(sql);

        if (listaTipoAcionadorOrgao == null
                || listaTipoAcionadorOrgao.isEmpty()) {
            return null;
        }

        return (TipoAcionadorOrgao) listaTipoAcionadorOrgao.get(0);
    }

    private void salvarTipoAcionador(Orgao orgao, Collection listaTipoAcionador)
            throws DaoException {

        Timestamp dataAtual = new Timestamp(System.currentTimeMillis());

        Collection listaTipoAcionadorOrgao = orgao.getListaTipoAcionadorOrgao();
        Collection removeTipoAcionadorOrgao = new ArrayList();

        for (Iterator iter = listaTipoAcionadorOrgao.iterator(); iter.hasNext();) {

            TipoAcionadorOrgao tipoAcionadorOrgao = (TipoAcionadorOrgao) iter
                    .next();

            if (tipoAcionadorOrgao.getDataVigencia() != null
                    && tipoAcionadorOrgao.getDataVigencia().before(dataAtual)) {
                continue;
            }

            TipoAcionador tipoAcionador = tipoAcionadorOrgao.getTipoAcionador();

            if (!listaTipoAcionador.contains(tipoAcionador)) {
                tipoAcionadorOrgao.setDataVigencia(dataAtual);
                tipoAcionadorOrgaoDao.save(tipoAcionadorOrgao);
                removeTipoAcionadorOrgao.add(tipoAcionadorOrgao);
            }

            listaTipoAcionador.remove(tipoAcionador);
        }

        listaTipoAcionadorOrgao.removeAll(removeTipoAcionadorOrgao);

        removeTipoAcionadorOrgao = null;

        for (Iterator iter = listaTipoAcionador.iterator(); iter.hasNext();) {

            TipoAcionador tipoAcionador = (TipoAcionador) iter.next();

            TipoAcionadorOrgao tipoAcionadorOrgao = this.getTipoAcionadorOrgao(
                    orgao, tipoAcionador);

            if (tipoAcionadorOrgao == null) {
                tipoAcionadorOrgao = new TipoAcionadorOrgao();
                tipoAcionadorOrgao.setOrgao(orgao);
                tipoAcionadorOrgao.setTipoAcionador(tipoAcionador);
            }

            tipoAcionadorOrgao.setDataVigencia(null);
            tipoAcionadorOrgaoDao.save(tipoAcionadorOrgao);

            listaTipoAcionadorOrgao.add(tipoAcionadorOrgao);
        }
    }

    public void tratarImagens(ConfiguracoesOrgao configuracoesOrgao,
            FormFile imagemLogo, FormFile imagemBanner, FormFile imagem3,
            FormFile imagem4, FormFile imagem5) throws DaoException {

        if (imagemLogo != null && imagemLogo.getFileName().length() > 0) {
            configuracoesOrgao.setImagemLogo(imagemLogo.getFileName());
            this.uploadArquivo(imagemLogo, configuracoesOrgao
                    .getNomeDiretorioOrgao());
        }

        if (imagemBanner != null && imagemBanner.getFileName().length() > 0) {
            configuracoesOrgao.setImagemBanner(imagemBanner.getFileName());
            this.uploadArquivo(imagemBanner, configuracoesOrgao
                    .getNomeDiretorioOrgao());
        }

        if (imagem3 != null && imagem3.getFileName().length() > 0) {
            configuracoesOrgao.setImagem3(imagem3.getFileName());
            this.uploadArquivo(imagem3, configuracoesOrgao
                    .getNomeDiretorioOrgao());
        }

        if (imagem4 != null && imagem4.getFileName().length() > 0) {
            configuracoesOrgao.setImagem4(imagem4.getFileName());
            this.uploadArquivo(imagem4, configuracoesOrgao
                    .getNomeDiretorioOrgao());
        }

        if (imagem5 != null && imagem5.getFileName().length() > 0) {
            configuracoesOrgao.setImagem5(imagem5.getFileName());
            this.uploadArquivo(imagem5, configuracoesOrgao
                    .getNomeDiretorioOrgao());
        }
    }

    private void criaEstruturaDiretorio(final Orgao orgao) throws DaoException {

        String caminho = this.getParametrosGerais()
                .getDiretorioContextoAplicacao()
                + orgao.getConfiguracoes().getNomeDiretorioOrgao();

        String temp = null;

        try {
            String enc = Utilitario.encrypt(Constants.DES_KEY, orgao.getId()
                    .toString());

            File indexInternet = new File(caminho);
            indexInternet.mkdirs();
            BufferedOutputStream out = new BufferedOutputStream(
                    new FileOutputStream(caminho + "/index.html"));
            temp = "<html><head><meta http-equiv=\"refresh\" content=\"0; URL=../../ouvidoriainterna/MainInternet.do?osessionid="
                    .concat(enc).concat("\"></head></html>");
            out.write(temp.getBytes());
            out.flush();
            out.close();

            File indexIntranet = new File(caminho + "/intranet/");
            indexIntranet.mkdirs();
            out = new BufferedOutputStream(new FileOutputStream(caminho
                    + "/intranet/index.html"));
            temp = "<html><head><meta http-equiv=\"refresh\" content=\"0; URL=../../../ouvidoriainterna/MainIntranet.do?osessionid="
                    .concat(enc).concat("\"></head></html>");
            out.write(temp.getBytes());
            out.flush();
            out.close();

        } catch (IOException ie) {
            if (Constants.DEBUG) {
                ie.printStackTrace(System.out);
            }
        }

    }

    private void uploadArquivo(FormFile arquivo, String nomeDiretorioOrgao)
            throws DaoException {
        String caminho = "";

        caminho += this.getParametrosGerais().getDiretorioContextoAplicacao();
        caminho += nomeDiretorioOrgao + "/images/";

        try {
            File f = new File(caminho);
            f.mkdirs();

            FileOutputStream fos = new FileOutputStream(caminho
                    + arquivo.getFileName());
            fos.write(arquivo.getFileData());
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    public List listarDiretoriosCores(final String realPath) {
        String caminho = realPath.concat("/pages/estilos");
        File arquivo = new File(caminho);
        File[] listaFiles = arquivo.listFiles();
        List listaDiretorios = null;

        if (listaFiles != null && listaFiles.length > 0) {

            listaDiretorios = new ArrayList();

            try {
                for (int i = 0; i < listaFiles.length; i++) {
                    if (listaFiles[i].isDirectory())
                        listaDiretorios.add(listaFiles[i].getName());
                }
            } catch (Exception e) {
                if (Constants.DEBUG)
                    e.printStackTrace(System.out);
            }
        }
        return listaDiretorios;
    }

}