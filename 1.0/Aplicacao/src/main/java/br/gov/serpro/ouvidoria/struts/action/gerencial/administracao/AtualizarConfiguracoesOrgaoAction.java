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
package br.gov.serpro.ouvidoria.struts.action.gerencial.administracao;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.ActionMessages;
import org.apache.struts.upload.FormFile;
import org.quartz.Scheduler;

import br.gov.serpro.ouvidoria.agendador.OuvidoriaScheduler;
import br.gov.serpro.ouvidoria.controller.gerencial.administracao.ConfiguracoesOrgaoCtrl;
import br.gov.serpro.ouvidoria.controller.gerencial.administracao.OrgaoCtrl;
import br.gov.serpro.ouvidoria.dao.DaoException;
import br.gov.serpro.ouvidoria.model.ConfiguracoesOrgao;
import br.gov.serpro.ouvidoria.model.MeioEnvioResposta;
import br.gov.serpro.ouvidoria.model.Orgao;
import br.gov.serpro.ouvidoria.model.TipoAcionador;
import br.gov.serpro.ouvidoria.struts.DispatchActionSupport;
import br.gov.serpro.ouvidoria.struts.form.CadastrarConfiguracoesOrgaoForm;
import br.gov.serpro.ouvidoria.util.Constants;

/**
 * Objetivo: Exibir os dados da configuração de um órgão.
 *
 * @author SERPRO
 * @version $Revision: 1.1.2.5 $, $Date: 2011/10/21 12:51:37 $
 * @version 0.1, 2004/12/27
 */
public class AtualizarConfiguracoesOrgaoAction extends DispatchActionSupport {

	
	private static Logger log;
	private static String horaAgendadaAntiga = null;

    public ActionForward exibir(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        Orgao localOrgao = null;
        
        final String idOrgao = request.getParameter("id");
        OrgaoCtrl orgaoCtrl = new OrgaoCtrl(getDaoFactory());
        ConfiguracoesOrgaoCtrl configuracoesOrgaoCtrl = new ConfiguracoesOrgaoCtrl(
                getDaoFactory());
        
        if (idOrgao == null) {
            localOrgao = getOrgao(request);
        } else {
            localOrgao = orgaoCtrl.get(new Long(idOrgao));
        }
        
        ConfiguracoesOrgao configuracoes = localOrgao.getConfiguracoes();
        if (configuracoes == null) {
            configuracoes = new ConfiguracoesOrgao();
            request.setAttribute("function", "incluir");
        } else
            request.setAttribute("function", "alterar");
        
        request.setAttribute("orgao", localOrgao);
        request.setAttribute("configuracoes", configuracoes);
        
        request.setAttribute("listaMeioEnvioRespostaTodos",
                configuracoesOrgaoCtrl.listarMeioEnvioResposta());
        
        request.setAttribute("diretorioContextoAplicacao",
                configuracoesOrgaoCtrl.getParametrosGerais()
                .getDiretorioContextoAplicacao());
        
        request.setAttribute("listaDiretoriosCores", configuracoesOrgaoCtrl
                .listarDiretoriosCores(this.servlet.getServletContext()
                .getRealPath("")));
        
        horaAgendadaAntiga = configuracoes.getHoraEnvioNotificacao();
        
        return mapping.findForward("exibir");
        
    }
    

    public ActionForward salvar(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        ActionMessages msgs = new ActionMessages();
        
        final String id = request.getParameter("id");
        final String idOrgao = request.getParameter("idOrgao");
        final String meiosEnvioResp = request.getParameter("meiosEnvioResp");

        
        /*Campos de notificação por email*/
        
        
        
        final String textoNotificacaoPendencia = request.getParameter("textoNotificacaoPendencia");
        
        final String textoNotificacaoAtraso = request.getParameter("textoNotificacaoAtraso");;
        
        final String textoNotificacaoAtrasoCritico = request.getParameter("textoNotificacaoAtrasoCritico");
        
        final String notificacaoEmail = request.getParameter("notificacaoEmail");
        
        final String horaEnvioNotificacao = request.getParameter("horaEnvioNotificacao");
        
        /**/
        
        final String[] tipoAcionador = request.getParameterValues("tipoAcionador");
        
        Collection listaMeioEnvioResposta = new ArrayList();
        
        final String strPermiteMsgDigitalizadaAcionamento = request
                .getParameter("permiteMsgDigitalizadaAcionamento");
        Boolean permiteMsgDigitalizadaAcionamento;
        
        final String strTamanhoMaxArquivoCartaDigitalizada = request
                .getParameter("tamanhoMaxArquivoCartaDigitalizada");
        Integer tamanhoMaxArquivoCartaDigitalizada = null;
        
        final String strPermiteArquivoAnexoAcionamento = request
                .getParameter("permiteArquivoAnexoAcionamento");
        Boolean permiteArquivoAnexoAcionamento;
        
        final String strTamanhoMaxArquivoAnexo = request
                .getParameter("tamanhoMaxArquivoAnexo");
        Integer tamanhoMaxArquivoAnexo = null;
        
        final String strPossuiCodigoAcesso = request
                .getParameter("possuiCodigoAcesso");
        Boolean possuiCodigoAcesso;
        
        final String strAtendenteConsultaMsgNoAtendimento = request
                .getParameter("atendenteConsultaMsgNoAtendimento");
        Boolean atendenteConsultaMsgNoAtendimento;
        
        final String strExigeCertificadoDigitalGeral = request
                .getParameter("exigeCertificadoDigitalGeral");
        Boolean exigeCertificadoDigitalGeral;
        
        final String strExigeCertificadoDigitalOrgao = request
                .getParameter("exigeCertificadoDigitalOrgao");
        Boolean exigeCertificadoDigitalOrgao;
        
        final String strExisteBloqueioProtocoloPeloCodigo = request
                .getParameter("existeBloqueioProtocoloPeloCodigo");
        Boolean existeBloqueioProtocoloPeloCodigo;
        
        final String strExisteBloqueioProtocoloPelaPergunta = request
                .getParameter("existeBloqueioProtocoloPelaPergunta");
        Boolean existeBloqueioProtocoloPelaPergunta;
        
        final String strTempoBloqueioProtocoloPeloCodigo = request
                .getParameter("tempoBloqueioProtocoloPeloCodigo");
        Integer tempoBloqueioProtocoloPeloCodigo = null;
        
        final String strTempoBloqueioProtocoloPelaPergunta = request
                .getParameter("tempoBloqueioProtocoloPelaPergunta");
        Integer tempoBloqueioProtocoloPelaPergunta = null;
        
        final String strQtdeTentativasPossiveisCodigoAcesso = request
                .getParameter("qtdeTentativasPossiveisCodigoAcesso");
        Integer qtdeTentativasPossiveisCodigoAcesso = null;
        
        final String strQtdeTentativasPossiveisPergunta = request
                .getParameter("qtdeTentativasPossiveisPergunta");
        Integer qtdeTentativasPossiveisPergunta = null;
        
        final String textoApresentacaoOuvidoria = request
                .getParameter("textoApresentacaoOuvidoria");
        
        final String textoRespostaAcionamento = request
                .getParameter("textoRespostaAcionamento");
        
        final String textoApresentacaoFormulario = request
                .getParameter("textoApresentacaoFormulario");
        
        final String textoCanaisComunicacao = request
                .getParameter("textoCanaisComunicacao");
        
        final String textoApresentacaoResposta = request
                .getParameter("textoApresentacaoResposta");
        
        final String textoInformacaoOuvidoria = request
                .getParameter("textoInformacaoOuvidoria");
        
        final String esquemaCoresLayout = request
                .getParameter("esquemaCoresLayout");
        
        final String nomeExibicaoOrgao = request
                .getParameter("nomeExibicaoOrgao");
        
        final String descricaoImagemLogo = request
                .getParameter("descricaoImagemLogo");
        
        final String descricaoImagemBanner = request
                .getParameter("descricaoImagemBanner");
        
        final String descricaoImagem3 = request
                .getParameter("descricaoImagem3");
        
        final String descricaoImagem4 = request
                .getParameter("descricaoImagem4");
        
        final String descricaoImagem5 = request
                .getParameter("descricaoImagem5");
        
        final String linkImagemLogo = request.getParameter("linkImagemLogo");
        
        final String linkImagemBanner = request
                .getParameter("linkImagemBanner");
        
        final String linkImagem3 = request.getParameter("linkImagem3");
        
        final String linkImagem4 = request.getParameter("linkImagem4");
        
        final String linkImagem5 = request.getParameter("linkImagem5");
        
        CadastrarConfiguracoesOrgaoForm _form = (CadastrarConfiguracoesOrgaoForm) form;
        final FormFile imagemLogo = _form.getImagemLogo();
        final FormFile imagemBanner = _form.getImagemBanner();
        final FormFile imagem3 = _form.getImagem3();
        final FormFile imagem4 = _form.getImagem4();
        final FormFile imagem5 = _form.getImagem5();
        
        final String urlBaseFuncionarios = request
                .getParameter("urlBaseFuncionarios");
        final String textoConsultaRespostaNoPrazo = request
                .getParameter("textoConsultaRespostaNoPrazo");
        final String textoConsultaRespostaSemPrazo = request
                .getParameter("textoConsultaRespostaSemPrazo");
        final String textoConsultaRespostaEmAtraso = request
                .getParameter("textoConsultaRespostaEmAtraso");
        final String textoAvaliacaoResposta = request
                .getParameter("textoAvaliacaoResposta");
        final String nomeDiretorioOrgao = request
                .getParameter("nomeDiretorioOrgao");
        final String remetenteEmail = request.getParameter("remetenteEmail");
        final String textoLegislacaoOuvidoria = request
                .getParameter("textoLegislacaoOuvidoria");
        final String corCabecalhoLogo = request
                .getParameter("corCabecalhoLogo");
        final String corCabecalhoBanner = request
                .getParameter("corCabecalhoBanner");
        final String urlSuporteUsuario = request
                .getParameter("urlSuporteUsuario");
        
        OrgaoCtrl orgaoCtrl = new OrgaoCtrl(getDaoFactory());
        ConfiguracoesOrgaoCtrl configuracoesOrgaoCtrl = new ConfiguracoesOrgaoCtrl(
                getDaoFactory());
        
        try {
            
            if (idOrgao == null || idOrgao.trim().length() == 0)
                msgs.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
                        "error.atualizarConfiguracoesOrgao.masc", "Orgão"));
            
            if (strPermiteMsgDigitalizadaAcionamento != null) {
                permiteMsgDigitalizadaAcionamento = Boolean.TRUE;
                
                if (strTamanhoMaxArquivoCartaDigitalizada == null
                        || strTamanhoMaxArquivoCartaDigitalizada.trim()
                        .length() == 0)
                    msgs.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
                            "error.atualizarConfiguracoesOrgao.masc",
                            "Tamanho máximo para carta digitalizada"));
                else
                    tamanhoMaxArquivoCartaDigitalizada = new Integer(
                            strTamanhoMaxArquivoCartaDigitalizada);
            } else {
                permiteMsgDigitalizadaAcionamento = Boolean.FALSE;
                tamanhoMaxArquivoCartaDigitalizada = null;
            }
            
            if (strPermiteArquivoAnexoAcionamento != null) {
                permiteArquivoAnexoAcionamento = Boolean.TRUE;
                
                if (strTamanhoMaxArquivoAnexo == null
                        || strTamanhoMaxArquivoAnexo.trim().length() == 0)
                    msgs.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
                            "error.atualizarConfiguracoesOrgao.masc",
                            "Tamanho máximo para arquivos anexos"));
                else
                    tamanhoMaxArquivoAnexo = new Integer(
                            strTamanhoMaxArquivoAnexo);
            } else {
                permiteArquivoAnexoAcionamento = Boolean.FALSE;
                tamanhoMaxArquivoAnexo = null;
            }
            
            // possui código de acesso
            if (strPossuiCodigoAcesso != null) {
                possuiCodigoAcesso = Boolean.TRUE;
                
                // existe bloqueio pelo código de acesso
                if (strExisteBloqueioProtocoloPeloCodigo != null) {
                    existeBloqueioProtocoloPeloCodigo = Boolean.TRUE;
                    
                    if (strTempoBloqueioProtocoloPeloCodigo == null
                            || strTempoBloqueioProtocoloPeloCodigo.trim()
                            .length() == 0)
                        msgs
                            .add(
                                ActionMessages.GLOBAL_MESSAGE,
                                new ActionMessage(
                                "error.atualizarConfiguracoesOrgao.masc",
                                "Tempo de bloqueio pelo código de acesso"));
                    else
                        tempoBloqueioProtocoloPeloCodigo = new Integer(
                                strTempoBloqueioProtocoloPeloCodigo);
                    
                    if (strQtdeTentativasPossiveisCodigoAcesso == null
                            || strQtdeTentativasPossiveisCodigoAcesso.trim()
                            .length() == 0)
                        msgs
                            .add(
                                ActionMessages.GLOBAL_MESSAGE,
                                new ActionMessage(
                                "error.atualizarConfiguracoesOrgao.masc",
                                "Número máximo de falhas no código de acesso"));
                    else
                        qtdeTentativasPossiveisCodigoAcesso = new Integer(
                                strQtdeTentativasPossiveisCodigoAcesso);
                } else {
                    existeBloqueioProtocoloPeloCodigo = Boolean.FALSE;
                    tempoBloqueioProtocoloPeloCodigo = null;
                    qtdeTentativasPossiveisCodigoAcesso = null;
                }
                
                // existe bloqueio pela pergunta
                if (strExisteBloqueioProtocoloPelaPergunta != null) {
                    existeBloqueioProtocoloPelaPergunta = Boolean.TRUE;
                    
                    if (strTempoBloqueioProtocoloPelaPergunta == null
                            || strTempoBloqueioProtocoloPelaPergunta.trim()
                            .length() == 0)
                        msgs
                            .add(
                                ActionMessages.GLOBAL_MESSAGE,
                                new ActionMessage(
                                "error.atualizarConfiguracoesOrgao.masc",
                                "Tempo de bloqueio pela pergunta"));
                    else
                        tempoBloqueioProtocoloPelaPergunta = new Integer(
                                strTempoBloqueioProtocoloPelaPergunta);
                    
                    if (strQtdeTentativasPossiveisPergunta == null
                            || strQtdeTentativasPossiveisPergunta.trim()
                            .length() == 0)
                        msgs
                            .add(
                                ActionMessages.GLOBAL_MESSAGE,
                                new ActionMessage(
                                "error.atualizarConfiguracoesOrgao.masc",
                                "Número máximo de falhas na pergunta"));
                    else
                        qtdeTentativasPossiveisPergunta = new Integer(
                                strQtdeTentativasPossiveisPergunta);
                } else {
                    existeBloqueioProtocoloPelaPergunta = Boolean.FALSE;
                    tempoBloqueioProtocoloPelaPergunta = null;
                    qtdeTentativasPossiveisPergunta = null;
                }
                
            } else {
                possuiCodigoAcesso = Boolean.FALSE;
                existeBloqueioProtocoloPeloCodigo = null;
                existeBloqueioProtocoloPelaPergunta = null;
                tempoBloqueioProtocoloPeloCodigo = null;
                tempoBloqueioProtocoloPelaPergunta = null;
                qtdeTentativasPossiveisCodigoAcesso = null;
                qtdeTentativasPossiveisPergunta = null;
            }
            
            if (strAtendenteConsultaMsgNoAtendimento != null)
                atendenteConsultaMsgNoAtendimento = Boolean.TRUE;
            else
                atendenteConsultaMsgNoAtendimento = Boolean.FALSE;
            
            if (strExigeCertificadoDigitalGeral != null)
                exigeCertificadoDigitalGeral = Boolean.TRUE;
            else
                exigeCertificadoDigitalGeral = Boolean.FALSE;
            
            if (strExigeCertificadoDigitalOrgao != null)
                exigeCertificadoDigitalOrgao = Boolean.TRUE;
            else
                exigeCertificadoDigitalOrgao = Boolean.FALSE;
            
            if (textoApresentacaoOuvidoria == null
                    || textoApresentacaoOuvidoria.trim().length() == 0)
                msgs.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
                        "error.atualizarConfiguracoesOrgao.masc",
                        "Texto de apresentação da ouvidoria"));
            
            if (textoRespostaAcionamento == null
                    || textoRespostaAcionamento.trim().length() == 0)
                msgs.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
                        "error.atualizarConfiguracoesOrgao.masc",
                        "Texto de resposta no momento do acionamento"));
            
            if (textoApresentacaoResposta == null
                    || textoApresentacaoResposta.trim().length() == 0)
                msgs.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
                        "error.atualizarConfiguracoesOrgao.masc",
                        "Texto de apresentação da resposta"));
            
            if (textoInformacaoOuvidoria == null
                    || textoInformacaoOuvidoria.trim().length() == 0)
                msgs.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
                        "error.atualizarConfiguracoesOrgao.masc",
                        "Texto com informações sobre a ouvidoria"));
            
            if (textoConsultaRespostaNoPrazo == null
                    || textoConsultaRespostaNoPrazo.trim().length() == 0)
                msgs.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
                        "error.atualizarConfiguracoesOrgao.masc",
                        "Texto de consulta de resposta no prazo"));
            
            if (textoConsultaRespostaSemPrazo == null
                    || textoConsultaRespostaSemPrazo.trim().length() == 0)
                msgs.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
                        "error.atualizarConfiguracoesOrgao.masc",
                        "Texto de consulta de resposta sem prazo"));
            
            if (textoConsultaRespostaEmAtraso == null
                    || textoConsultaRespostaEmAtraso.trim().length() == 0)
                msgs.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
                        "error.atualizarConfiguracoesOrgao.masc",
                        "Texto de consulta de resposta em atraso"));
            
            if (textoAvaliacaoResposta == null
                    || textoAvaliacaoResposta.trim().length() == 0)
                msgs.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
                        "error.atualizarConfiguracoesOrgao.masc",
                        "Texto de avaliação da resposta"));
            
            if (esquemaCoresLayout == null
                    || esquemaCoresLayout.trim().length() == 0)
                msgs.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
                        "error.atualizarConfiguracoesOrgao.masc",
                        "Diretório de esquema de cores"));
            
            if (nomeExibicaoOrgao == null
                    || nomeExibicaoOrgao.trim().length() == 0)
                msgs.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
                        "error.atualizarConfiguracoesOrgao.masc",
                        "Nome do órgão para exibição"));
            
            if (id == null || id.trim().length() == 0) {

                if (nomeDiretorioOrgao == null
                        || nomeDiretorioOrgao.trim().length() == 0)
                    msgs.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
                            "error.atualizarConfiguracoesOrgao.masc",
                            "Nome do diretório do órgão"));
            }
            
            if (remetenteEmail == null || remetenteEmail.trim().length() == 0)
                msgs
                    .add(
                        ActionMessages.GLOBAL_MESSAGE,
                        new ActionMessage(
                        "error.atualizarConfiguracoesOrgao.masc",
                        "Remetente dos emails que serão enviados pela aplicação"));
            
            if (corCabecalhoLogo == null
                    || corCabecalhoLogo.trim().length() == 0)
                msgs.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
                        "error.atualizarConfiguracoesOrgao.fem",
                        "Cor referente a página do logo"));
            
            if (corCabecalhoBanner == null
                    || corCabecalhoBanner.trim().length() == 0)
                msgs.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
                        "error.atualizarConfiguracoesOrgao.fem",
                        "Cor referente a página do banner"));
            
            if (urlSuporteUsuario == null
                    || urlSuporteUsuario.trim().length() == 0)
                msgs.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
                        "error.atualizarConfiguracoesOrgao.fem",
                        "URL de suporte ao usuário"));
            
            Collection listaTipoAcionador = new ArrayList();
            if (tipoAcionador != null) {
                for (int i = 0; i < tipoAcionador.length; i++) {
                    listaTipoAcionador.add(TipoAcionador.get(new Long(
                            tipoAcionador[i])));
                }
            }
            
            if (meiosEnvioResp != null) {
                int posIni = 0;
                int pos = 0;
                String idMeioEnvioRespSel = "";
                // Recupera meios de envio de resposta selecionados para
                // o órgão
                while (posIni < meiosEnvioResp.length()) {
                    pos = meiosEnvioResp.indexOf(",", posIni);
                    if (pos > 0) {
                        idMeioEnvioRespSel = meiosEnvioResp.substring(posIni,
                                pos);
                        
                        MeioEnvioResposta mer = configuracoesOrgaoCtrl
                                .getMeioEnvioResposta(new Long(
                                idMeioEnvioRespSel));
                        listaMeioEnvioResposta.add(mer);
                    }
                    
                    posIni = pos + 1;
                }
            }

            if (!msgs.isEmpty()) {
                saveErrors(request, msgs);
                return mapping.findForward("error");
            }
            
            Orgao localOrgao = orgaoCtrl.get(new Long(idOrgao));
            if (id != null && id.trim().length() > 0) {
                configuracoesOrgaoCtrl.update(id, localOrgao,
                        permiteMsgDigitalizadaAcionamento,
                        tamanhoMaxArquivoCartaDigitalizada,
                        permiteArquivoAnexoAcionamento, tamanhoMaxArquivoAnexo,
                        atendenteConsultaMsgNoAtendimento,
                        exigeCertificadoDigitalGeral,
                        exigeCertificadoDigitalOrgao, possuiCodigoAcesso,
                        existeBloqueioProtocoloPeloCodigo,
                        existeBloqueioProtocoloPelaPergunta,
                        tempoBloqueioProtocoloPeloCodigo,
                        tempoBloqueioProtocoloPelaPergunta,
                        qtdeTentativasPossiveisCodigoAcesso,
                        qtdeTentativasPossiveisPergunta,
                        textoApresentacaoOuvidoria, textoRespostaAcionamento,
                        textoApresentacaoFormulario, textoCanaisComunicacao,
                        textoApresentacaoResposta, textoInformacaoOuvidoria,
                        textoConsultaRespostaNoPrazo,
                        textoConsultaRespostaSemPrazo,
                        textoConsultaRespostaEmAtraso, textoAvaliacaoResposta,
                        textoLegislacaoOuvidoria, esquemaCoresLayout,
                        nomeExibicaoOrgao, imagemLogo, corCabecalhoLogo,
                        imagemBanner, corCabecalhoBanner, imagem3, imagem4,
                        imagem5, descricaoImagemLogo, descricaoImagemBanner,
                        descricaoImagem3, descricaoImagem4, descricaoImagem5,
                        linkImagemLogo, linkImagemBanner, linkImagem3,
                        linkImagem4, linkImagem5, urlBaseFuncionarios,
                        urlSuporteUsuario, remetenteEmail,
                        listaMeioEnvioResposta, listaTipoAcionador,
                        notificacaoEmail,
                        horaEnvioNotificacao,
                        textoNotificacaoPendencia,
                        textoNotificacaoAtraso,
                        textoNotificacaoAtrasoCritico);
                
                msgs.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
                        "message.atualizar.alterar"));
            } else {
                configuracoesOrgaoCtrl.insert(localOrgao,
                        permiteMsgDigitalizadaAcionamento,
                        tamanhoMaxArquivoCartaDigitalizada,
                        permiteArquivoAnexoAcionamento, tamanhoMaxArquivoAnexo,
                        atendenteConsultaMsgNoAtendimento,
                        exigeCertificadoDigitalGeral,
                        exigeCertificadoDigitalOrgao, possuiCodigoAcesso,
                        existeBloqueioProtocoloPeloCodigo,
                        existeBloqueioProtocoloPelaPergunta,
                        tempoBloqueioProtocoloPeloCodigo,
                        tempoBloqueioProtocoloPelaPergunta,
                        qtdeTentativasPossiveisCodigoAcesso,
                        qtdeTentativasPossiveisPergunta,
                        textoApresentacaoOuvidoria, textoRespostaAcionamento,
                        textoApresentacaoFormulario, textoCanaisComunicacao,
                        textoApresentacaoResposta, textoInformacaoOuvidoria,
                        textoConsultaRespostaNoPrazo,
                        textoConsultaRespostaSemPrazo,
                        textoConsultaRespostaEmAtraso, textoAvaliacaoResposta,
                        textoLegislacaoOuvidoria, esquemaCoresLayout,
                        nomeExibicaoOrgao, nomeDiretorioOrgao, imagemLogo,
                        corCabecalhoLogo, imagemBanner, corCabecalhoBanner,
                        imagem3, imagem4, imagem5, descricaoImagemLogo,
                        descricaoImagemBanner, descricaoImagem3,
                        descricaoImagem4, descricaoImagem5, linkImagemLogo,
                        linkImagemBanner, linkImagem3, linkImagem4,
                        linkImagem5, urlBaseFuncionarios, urlSuporteUsuario,
                        remetenteEmail, listaMeioEnvioResposta,
                        listaTipoAcionador,
                        notificacaoEmail,
                        horaEnvioNotificacao,
                        textoNotificacaoPendencia,
                        textoNotificacaoAtraso,
                        textoNotificacaoAtrasoCritico);
                
                msgs.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
                        "message.atualizar.incluir"));
            }
            
        } catch (DaoException daoe) {
            if (Constants.DEBUG) {
                daoe.printStackTrace(System.out);
            }
            msgs.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
                    "error.atualizarConfiguracoesOrgao"));
        }
        
        //Caso o admistrador retire a indicação de agendamento o agendador será parado
        if(notificacaoEmail==null || notificacaoEmail.equals("")){
        	
        	boolean agendamentoFinalizado = OuvidoriaScheduler.sched.deleteJob( "EnviarAlertaJob", Scheduler.DEFAULT_GROUP);
        	
        	if(agendamentoFinalizado){
        		
        		getLog().info("\n\n Job 'EnviarAlertaJob' Finalizado em:"+new Date(System.currentTimeMillis()));
        	}
        	
        	
        }else if(horaAgendadaAntiga!=null && horaEnvioNotificacao!=null &&
        		!horaAgendadaAntiga.equals(horaEnvioNotificacao)){
        	//Caso a hora antiga seja diferente da atual o agendador deverá ser reiniciado
        	OuvidoriaScheduler.restart(request);
        
        }
        
        saveMessages(request, msgs);
        
        return mapping.findForward("success");
    }
    
    protected static Logger getLog() {
		
		if (log == null) {
			log = Logger.getLogger("OuvidoriaScheduler ------> ");
		}
		return log;
	}
    
}