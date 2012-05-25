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
package br.gov.serpro.ouvidoria.struts.action.andamento;

import java.sql.Timestamp;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.ActionMessages;
import org.apache.struts.action.DynaActionForm;

import br.gov.serpro.ouvidoria.controller.AcionamentoCtrl;
import br.gov.serpro.ouvidoria.controller.ValidarIdentificacaoCtrl;
import br.gov.serpro.ouvidoria.controller.andamento.ExibirRespostaCtrl;
import br.gov.serpro.ouvidoria.dao.DaoException;
import br.gov.serpro.ouvidoria.model.Acionador;
import br.gov.serpro.ouvidoria.model.AcionadorFuncionario;
import br.gov.serpro.ouvidoria.model.AcionadorPessoaFisica;
import br.gov.serpro.ouvidoria.model.AcionadorPessoaJuridica;
import br.gov.serpro.ouvidoria.model.Acionamento;
import br.gov.serpro.ouvidoria.model.EstadoAcionamento;
import br.gov.serpro.ouvidoria.model.TipoAcionador;
import br.gov.serpro.ouvidoria.struts.ActionSupport;

/**
 * Objetivo: Exibir a resposta de um acionamento
 *
 * @author SERPRO
 * @version $Revision: 1.1.2.3 $, $Date: 2011/10/18 17:57:04 $
 * @version 0.1, 2004/11/30
 */
public class ExibirRespostaAction extends ActionSupport {
    
    /**
     * Método de execução da ação. Realiza dois forwards: um em caso de sucesso
     * e outro em caso de falha
     *
     * @param mapping
     * @param form
     *            ActionForm, caso necessário
     * @param request
     * @param response
     *
     */
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        
        ActionErrors errors = new ActionErrors();
        
        try {
            //obter do form o número do protocolo
            DynaActionForm _form = (DynaActionForm) form;
            Integer numeroProtocolo = (Integer) _form.get("numeroProtocolo");
            
            //obter o acionamento
            AcionamentoCtrl acionamentoCtrl = new AcionamentoCtrl(getDaoFactory());
            Acionamento acionamento = acionamentoCtrl
                    .getAcionamentoPeloProtocolo(getOrgao(request),
                    numeroProtocolo);
            
            if (acionamento != null) {
                
                ExibirRespostaCtrl exibirRespostaCtrl = new ExibirRespostaCtrl(
                        getDaoFactory());
                
                List listarTipoAvaliacaoResposta = exibirRespostaCtrl
                        .listarTipoAvaliacaoResposta(this.getOrgao(request));
                
                Boolean possuiCodigoAcesso = this.getOrgao(request)
                .getConfiguracoes().getPossuiCodigoAcesso();
                
                if (possuiCodigoAcesso.booleanValue()) {
                    
                    //Validar identificação
                    String codigoAcesso = (String) _form.get("codigoAcesso");
                    ValidarIdentificacaoCtrl valIdentCtrl = new ValidarIdentificacaoCtrl(
                            getDaoFactory());
                    int retorno = valIdentCtrl.validaIdentificacao(this
                            .getOrgao(request), acionamento, codigoAcesso);
                    
                    switch (retorno) {
                        
                        // Orgão não possui Código de Acesso
                        // não é necessário tratar pois já é testado acima se
                        // possui código de acesso
                        case ValidarIdentificacaoCtrl.ORGAO_NAO_POSSUI_CODIGO_ACESSO:
                            break;
                            
                            // Código de Acesso válido - continuar execução normal
                        case ValidarIdentificacaoCtrl.CODIGO_ACESSO_VALIDO:
                            atribuiDadosExibicao(request, acionamento,
                                    numeroProtocolo, listarTipoAvaliacaoResposta);
                            break;
                            
                            // Código de Acesso inválido
                        case ValidarIdentificacaoCtrl.CODIGO_ACESSO_INVALIDO:
                            errors
                                    .add(ActionMessages.GLOBAL_MESSAGE,
                                    new ActionMessage(
                                    "error.codigoAcesso.invalido"));
                            break;
                            
                            // Alerta bloqueio de Protocolo
                        case ValidarIdentificacaoCtrl.ALERTA_BLOQUEIO_PROTOCOLO:
                            errors.add(ActionMessages.GLOBAL_MESSAGE,
                                    new ActionMessage(
                                    "error.alerta.codigoAcesso.invalido"));
                            break;
                            
                            // Protocolo foi bloqueado
                        case ValidarIdentificacaoCtrl.PROTOCOLO_FOI_BLOQUEADO:
                            errors
                                    .add(
                                    ActionMessages.GLOBAL_MESSAGE,
                                    new ActionMessage(
                                    "error.codigoAcesso.invalido.protocoloBloqueado"));
                            break;
                            
                            // Protocolo está bloqueado
                        case ValidarIdentificacaoCtrl.PROTOCOLO_ESTA_BLOQUEADO:
                            errors.add(ActionMessages.GLOBAL_MESSAGE,
                                    new ActionMessage("error.protocoloBloqueado"));
                            break;
                    }
                } else {
                    atribuiDadosExibicao(request, acionamento, numeroProtocolo,
                            listarTipoAvaliacaoResposta);
                }
                
                //Gerar histórico
                this.geraHistorico(request, acionamento);
                
            } else {
                errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
                        "error.protocolo.invalido"));
            }
            
        } catch (DaoException e) {
            e.printStackTrace(System.out);
            errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
                    "error.consulta.resposta"));
        }
        
        if (!errors.isEmpty()) {
            saveMessages(request, errors);
            return (mapping.findForward("failure"));
        }
        
        return (mapping.findForward("success"));
        
    }
    
    public void atribuiDadosExibicao(HttpServletRequest request,
            Acionamento acionamento, Integer numeroProtocolo,
            List listarTipoAvaliacaoResposta) {
        
        boolean estaRespondido = false;
        
        request.setAttribute("numeroProtocolo", numeroProtocolo);
        
        String nomeAcionador = null;
        String acionamentoRespondido;
        
        //obter o acionador
        Acionador acionador = acionamento.getAcionador();
        
        if ( acionador.getTipoAcionador().equals( TipoAcionador.PESSOA_FISICA ) ) {
            nomeAcionador = ((AcionadorPessoaFisica) acionador).getNome();
        } else if ( acionador.getTipoAcionador().equals( TipoAcionador.PESSOA_JURIDICA ) ) {
            nomeAcionador = ((AcionadorPessoaJuridica) acionador).getNomeContato();
        } else if ( acionador.getTipoAcionador().equals( TipoAcionador.FUNCIONARIO ) ) {
            nomeAcionador = ((AcionadorFuncionario) acionador).getNome();
        }
        
        // mostrar somente o primeiro nome
        if (nomeAcionador != null) {
            int ind = nomeAcionador.indexOf(" ");
            if (ind != -1) {
                nomeAcionador = nomeAcionador.subSequence(0, ind).toString();
            }
        }
        
        request.setAttribute("nomeAcionador", nomeAcionador);
        
        request.setAttribute("sexo", acionamento.getAcionador().getSexo());
        
        if (acionamento.getEstadoAcionamento().equals(
                EstadoAcionamento.RESPONDIDO)
                || acionamento.getEstadoAcionamento().equals(
                EstadoAcionamento.ENVIADO)) {
            acionamentoRespondido = "true";
            estaRespondido = true;
        } else {
            acionamentoRespondido = "false";
            estaRespondido = false;
        }
        
        request.setAttribute("acionamentoRespondido", acionamentoRespondido);
        
        request.setAttribute("dataPrevistaResolucaoExterna", acionamento
                .getDataPrevistaResolucaoExterna());
        
        if (acionamento.getDataPrevistaResolucaoExterna() != null) {
            int atrasada = acionamento.getDataPrevistaResolucaoExterna()
            .compareTo(new Timestamp(System.currentTimeMillis()));
            
            if (atrasada <= 0)
                request.setAttribute("respostaAtrasada", "true");
            else
                request.setAttribute("respostaAtrasada", "false");
        }
        request.setAttribute("mensagem", acionamento.getMensagem()
        .getTextoFormatado());
        
        String textoResposta = null;
        
        long avaliacaoResp = 0;
        
        if (acionamento.getRespostaAcionamento() != null && estaRespondido) {
            textoResposta = acionamento.getRespostaAcionamento()
            .getTextoFormatado();
            if (acionamento.getRespostaAcionamento().getTipoAvaliacaoResposta() != null) {
                avaliacaoResp = acionamento.getRespostaAcionamento()
                .getTipoAvaliacaoResposta().getId().longValue();
            }
        
        }
        
        request.setAttribute("resposta", textoResposta);
        
        
        request
                .setAttribute("avaliacaoResposta", String
                .valueOf(avaliacaoResp));
        
        request.setAttribute("listaTipoAvaliacaoResposta",
                listarTipoAvaliacaoResposta);
        
        request.setAttribute("numRows", String
                .valueOf(listarTipoAvaliacaoResposta.size()));
        
        request.setAttribute("textoApresentacaoResposta", this
                .getOrgao(request).getConfiguracoes()
                .getTextoApresentacaoRespostaFormatado());
        
        request.setAttribute("textoConsultaRespostaNoPrazo", this.getOrgao(
                request).getConfiguracoes()
                .getTextoConsultaRespostaNoPrazoFormatado());
        
        request.setAttribute("textoConsultaRespostaSemPrazo", this.getOrgao(
                request).getConfiguracoes()
                .getTextoConsultaRespostaSemPrazoFormatado());
        
        request.setAttribute("textoConsultaRespostaEmAtraso", this.getOrgao(
                request).getConfiguracoes()
                .getTextoConsultaRespostaEmAtrasoFormatado());
    }
    
}