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
import br.gov.serpro.ouvidoria.controller.andamento.RecuperarCodigoAcessoCtrl;
import br.gov.serpro.ouvidoria.model.Acionamento;
import br.gov.serpro.ouvidoria.model.InformacoesConsultaAcionamento;
import br.gov.serpro.ouvidoria.model.TipoAcionador;
import br.gov.serpro.ouvidoria.struts.DispatchActionSupport;

/**
 * Objetivo: Interface para a recuperação do do Código de Acesso do Acionador
 * 
 * @author SERPRO
 * @version $Revision: 1.1.2.3 $, $Date: 2011/10/18 17:57:03 $
 * @version 0.1, 2004/12/03
 */
public class RecuperarCodigoAcessoAction extends DispatchActionSupport {

    /**
     * 
     * @param mapping
     * @param form
     * @param request
     * @param response
     * @return
     * @throws Exception
     */
    public ActionForward consultar(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        ActionErrors errors = new ActionErrors();

        DynaActionForm _form = (DynaActionForm) form;

        Integer numeroProtocolo = (Integer) _form.get("numeroProtocolo");

        AcionamentoCtrl acionamentoCtrl = new AcionamentoCtrl(getDaoFactory());

        Acionamento acionamento = acionamentoCtrl.getAcionamentoPeloProtocolo(
                getOrgao(request), numeroProtocolo);

        acionamentoCtrl = null;

        if (acionamento == null) {
            errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
                    "error.protocolo.invalido"));
        } else {
            if (acionamento.getAcionador().getTipoAcionador().equals(
                    TipoAcionador.ANONIMO)) {
                errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
                        "error.recuperarCodigoAcesso.acionador.anonimo"));
            } else {
                int resposta = 0;

                InformacoesConsultaAcionamento info = acionamento
                        .getAcionador().getInformacoesConsultaAcionamento();

                if (info != null && info.getPergunta() != null
                        && info.getPergunta().trim().length() > 0) {
                    resposta += 1;

                    RecuperarCodigoAcessoCtrl recuperarCodigoAcessoCtrl = new RecuperarCodigoAcessoCtrl(
                            getDaoFactory());

                    final String campoValidacao = recuperarCodigoAcessoCtrl
                            .getCampoValidacao(numeroProtocolo);
                    request.setAttribute("campoValidacao", campoValidacao);

                    final String perguntaUsuario = recuperarCodigoAcessoCtrl
                            .getPergunta(numeroProtocolo);

                    request.setAttribute("perguntaUsuario", perguntaUsuario);

                    recuperarCodigoAcessoCtrl = null;
                }

                String email = acionamento.getAcionador().getEmail();
                if (email != null && email.trim().length() > 0) {
                    resposta += 2;
                }

                request.setAttribute("numeroProtocolo", numeroProtocolo);
                request.setAttribute("opcao", String.valueOf(resposta));
            }
        }

        saveMessages(request, errors);

        if (errors.isEmpty()) {
            return mapping.findForward("exibirOpcoes");
        }

        return mapping.findForward("error");
    }

    /**
     * 
     * @param mapping
     * @param form
     * @param request
     * @param response
     * @return
     * @throws Exception
     */
    public ActionForward recuperar(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        int codigoRetorno;
        String campoValidacao;
        String perguntaUsuario;

        ActionErrors errors = new ActionErrors();

        DynaActionForm _form = (DynaActionForm) form;
        Integer numeroProtocolo = (Integer) _form.get("numeroProtocolo");
        Integer formaRecuperacao = (Integer) _form.get("formaRecuperacao");
        String action = (String) _form.get("action");

        if (action != null)
            request.setAttribute("action", action);

        AcionamentoCtrl acionamentoCtrl = new AcionamentoCtrl(getDaoFactory());

        Acionamento acionamento = acionamentoCtrl.getAcionamentoPeloProtocolo(
                getOrgao(request), numeroProtocolo);

        acionamentoCtrl = null;

        if (acionamento == null) {
            errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
                    "error.protocolo.invalido"));
        } else {
            RecuperarCodigoAcessoCtrl recuperarCodigoAcessoCtrl = new RecuperarCodigoAcessoCtrl(
                    getDaoFactory());

            codigoRetorno = recuperarCodigoAcessoCtrl.recuperarCodigoAcesso(
                    this.getOrgao(request), numeroProtocolo, formaRecuperacao);

            /////////////////////////////////////
            // 
            // Códigos de retorno:
            //        	
            //  ERRO = 0
            //  PROTOCOLO_ESTA_BLOQUEADO = 1
            //  ACIONADOR_ANONIMO = 3
            //  PERGUNTA_NAO_CADASTRADA = 4
            //  ENVIO_EMAIL = 5
            //  CAMPO_VALIDACAO = 6
            //	ERRO_ENVIO_EMAIL = 10
            //
            ////////////////////////////////////

            switch (codigoRetorno) {
            case 1:
                errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
                        "error.protocoloBloqueado"));
                break;
            case 3:
                errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
                        "error.recuperarCodigoAcesso.AcionadorAnonimo"));
                break;
            case 4:
                errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
                        "error.recuperarCodigoAcesso.PerguntaNaoCadastrada"));
                break;
            case 5:
                //não faz nada
                break;
            case 6:
                // MOSTRAR O JSP DO CAMPO DE VALIDACAO
                campoValidacao = recuperarCodigoAcessoCtrl
                        .getCampoValidacao(numeroProtocolo);
                perguntaUsuario = recuperarCodigoAcessoCtrl
                        .getPergunta(numeroProtocolo);
                request.setAttribute("campoValidacao", campoValidacao);
                request.setAttribute("perguntaUsuario", perguntaUsuario);
                request.setAttribute("numeroProtocolo", numeroProtocolo);
                return (mapping.findForward("campoValidacao"));
            case 10:
                errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
                        "error.envioEmail"));
                break;
            case 0: // ERRO
                errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
                        "error.recuperarCodigoAcesso"));
                break;
            }

            //Gerar histórico
            this.geraHistorico(request, acionamento);
        }

        if (!errors.isEmpty()) {
            saveMessages(request, errors);
            return (mapping.findForward("failure"));
        }

        return (mapping.findForward("exibirEmailEnviado"));

    }
}