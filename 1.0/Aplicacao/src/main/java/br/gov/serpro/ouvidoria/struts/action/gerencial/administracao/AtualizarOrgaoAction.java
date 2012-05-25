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

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.ActionMessages;

import br.gov.serpro.ouvidoria.controller.gerencial.administracao.OrgaoCtrl;
import br.gov.serpro.ouvidoria.dao.DaoException;
import br.gov.serpro.ouvidoria.model.Orgao;
import br.gov.serpro.ouvidoria.struts.DispatchActionSupport;

/**
 * Objetivo: Exibir a lista de órgãos e permitir a atualização.
 * 
 * @author SERPRO
 * @version $Revision: 1.1.2.5 $, $Date: 2011/10/21 12:51:36 $
 * @version 0.1, 2004/12/27
 */
public class AtualizarOrgaoAction extends DispatchActionSupport {


    public ActionForward listar(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        OrgaoCtrl orgaoCtrl = new OrgaoCtrl(getDaoFactory());

        request.setAttribute("listarOrgaos", orgaoCtrl.listarOrgaosAtivos());

        return mapping.findForward("listar");
    }


    public ActionForward exibir(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        final String id = request.getParameter("id");

        Orgao o = null;
        if (id == null || id.trim().length() == 0) {
            o = new Orgao();
        } else {
            OrgaoCtrl orgaoCtrl = new OrgaoCtrl(getDaoFactory());
            o = orgaoCtrl.get(new Long(id));
        }

        request.setAttribute("function", request.getParameter("function"));
        request.setAttribute("orgao", o);

        return mapping.findForward("exibir");
    }


    public ActionForward salvar(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        ActionMessages msgs = new ActionMessages();

        final String id = request
				.getParameter("id");
        final String descricao = request
				.getParameter("descricao");
        final String gestorResponsavel = request
                .getParameter("gestorResponsavel");
        final String codigoPaisTelefoneResponsavel = request
        		.getParameter("codigoPaisTelefoneResponsavel");
        final String codigoCidadeTelefoneResponsavel = request
        		.getParameter("codigoCidadeTelefoneResponsavel");
        final String telefoneContatoGestor = request
                .getParameter("telefoneContatoGestor");
        String statusOrgao = request
				.getParameter("statusOrgao");
        final String dataInicioCadastramento = request
                .getParameter("dataInicioCadastramento");
        final String horaInicioCadastramento = request
                .getParameter("horaInicioCadastramento");
        final String dataFimCadastramento = request
                .getParameter("dataFimCadastramento");
        final String horaFimCadastramento = request
                .getParameter("horaFimCadastramento");
        final String dataInicioOperacao = request
                .getParameter("dataInicioOperacao");
        final String horaInicioOperacao = request
                .getParameter("horaInicioOperacao");
        final String dataFimOperacao = request
				.getParameter("dataFimOperacao");
        final String horaFimOperacao = request
				.getParameter("horaFimOperacao");
        final String dataInicioAcionamento = request
                .getParameter("dataInicioAcionamento");
        final String horaInicioAcionamento = request
                .getParameter("horaInicioAcionamento");
        final String dataFimAcionamento = request
                .getParameter("dataFimAcionamento");
        final String horaFimAcionamento = request
                .getParameter("horaFimAcionamento");
        final String dataInicioConsultaResposta = request
                .getParameter("dataInicioConsultaResposta");
        final String horaInicioConsultaResposta = request
                .getParameter("horaInicioConsultaResposta");
        final String dataFimConsultaResposta = request
                .getParameter("dataFimConsultaResposta");
        final String horaFimConsultaResposta = request
                .getParameter("horaFimConsultaResposta");

        Timestamp inicioCadastramento = null;
        Timestamp fimCadastramento = null;
        Timestamp inicioOperacao = null;
        Timestamp fimOperacao = null;
        Timestamp inicioAcionamento = null;
        Timestamp fimAcionamento = null;
        Timestamp inicioConsultaResposta = null;
        Timestamp fimConsultaResposta = null;

        OrgaoCtrl orgaoCtrl = new OrgaoCtrl(getDaoFactory());

        try {

            // descrição
            if (descricao == null || descricao.trim().length() == 0) {
                msgs.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
                        "error.atualizarOrgao.fem", "Descrição"));
            }

            // responsável
            if (gestorResponsavel == null
                    || gestorResponsavel.trim().length() == 0) {
                msgs.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
                        "error.atualizarOrgao.masc", "Responsável"));
            }

            // DDI telefone de contato
            if (codigoPaisTelefoneResponsavel == null
                    || codigoPaisTelefoneResponsavel.trim().length() == 0) {
                msgs.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
                        "error.atualizarOrgao.masc", "DDI para Telefone de contato"));
            }

            // DDD telefone de contato
            if (codigoCidadeTelefoneResponsavel == null
                    || codigoCidadeTelefoneResponsavel.trim().length() == 0) {
                msgs.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
                        "error.atualizarOrgao.masc", "DDD para Telefone de contato"));
            }

            
            // telefone de contato
            if (telefoneContatoGestor == null
                    || telefoneContatoGestor.trim().length() == 0) {
                msgs.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
                        "error.atualizarOrgao.masc", "Telefone de contato"));
            }

            // situação
            if (statusOrgao == null)
                statusOrgao = Orgao.INATIVO;

            if (statusOrgao.compareTo(Orgao.ATIVO) != 0
                    && statusOrgao.compareTo(Orgao.INATIVO) != 0) {
                msgs.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
                        "error.atualizarOrgao.invalida", "Situação"));
            }

            SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy hh:mm",
                    new Locale("pt", "BR"));

            // data de início de cadastramento
            try {
                inicioCadastramento = new Timestamp(sdf
                        .parse(
                                dataInicioCadastramento + " "
                                        + horaInicioCadastramento).getTime());
            } catch (ParseException e) {
                msgs.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
                        "error.atualizarOrgao.invalida",
                        "Data inicio de cadastramento"));
            }

            // data de fim de cadastramento
            try {
                fimCadastramento = new Timestamp(sdf.parse(
                        dataFimCadastramento + " " + horaFimCadastramento)
                        .getTime());
            } catch (ParseException e) {
                msgs.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
                        "error.atualizarOrgao.invalida",
                        "Data fim de cadastramento"));
            }

            // data de início de operação
            try {
                inicioOperacao = new Timestamp(sdf.parse(
                        dataInicioOperacao + " " + horaInicioOperacao)
                        .getTime());
            } catch (ParseException e) {
                msgs.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
                        "error.atualizarOrgao.invalida",
                        "Data início de operação"));
            }

            // data de fim de operação
            try {
                fimOperacao = new Timestamp(sdf.parse(
                        dataFimOperacao + " " + horaFimOperacao).getTime());
            } catch (ParseException e) {
                msgs.add(ActionMessages.GLOBAL_MESSAGE,
                        new ActionMessage("error.atualizarOrgao.invalida",
                                "Data fim de operação"));
            }

            // data de início de acionamento
            try {
                inicioAcionamento = new Timestamp(sdf.parse(
                        dataInicioAcionamento + " " + horaInicioAcionamento)
                        .getTime());
            } catch (ParseException e) {
                msgs.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
                        "error.atualizarOrgao.invalida",
                        "Data início de acionamento"));
            }

            // data de fim de acionamento
            try {
                fimAcionamento = new Timestamp(sdf.parse(
                        dataFimAcionamento + " " + horaFimAcionamento)
                        .getTime());
            } catch (ParseException e) {
                msgs.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
                        "error.atualizarOrgao.invalida",
                        "Data fim de acionamento"));
            }

            // data de início de consulta de resposta
            try {
                inicioConsultaResposta = new Timestamp(sdf.parse(
                        dataInicioConsultaResposta + " "
                                + horaInicioConsultaResposta).getTime());
            } catch (ParseException e) {
                msgs.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
                        "error.atualizarOrgao.invalida",
                        "Data início de consulta de resposta"));
            }

            // data de fim de consulta de resposta
            try {
                fimConsultaResposta = new Timestamp(sdf
                        .parse(
                                dataFimConsultaResposta + " "
                                        + horaFimConsultaResposta).getTime());
            } catch (ParseException e) {
                msgs.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
                        "error.atualizarOrgao.invalida",
                        "Data fim de consulta de resposta"));
            }

            if (!msgs.isEmpty()) {
                saveErrors(request, msgs);
                return mapping.findForward("error");
            }

            if (id != null && id.trim().length() > 0) {
                orgaoCtrl.update(id, descricao, gestorResponsavel,
                		codigoPaisTelefoneResponsavel, codigoCidadeTelefoneResponsavel,
                        telefoneContatoGestor, statusOrgao,
                        inicioCadastramento, fimCadastramento, inicioOperacao,
                        fimOperacao, inicioAcionamento, fimAcionamento,
                        inicioConsultaResposta, fimConsultaResposta);

                msgs.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
                        "message.atualizar.alterar"));
            } else {
                orgaoCtrl.insert(descricao, gestorResponsavel,
                		codigoPaisTelefoneResponsavel, codigoCidadeTelefoneResponsavel,
                        telefoneContatoGestor, statusOrgao,
                        inicioCadastramento, fimCadastramento, inicioOperacao,
                        fimOperacao, inicioAcionamento, fimAcionamento,
                        inicioConsultaResposta, fimConsultaResposta);

                msgs.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
                        "message.atualizar.incluir"));
            }

        } catch (DaoException daoe) {
            daoe.printStackTrace(System.out);
            msgs.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
                    "error.atualizarOrgao"));
        }

        saveMessages(request, msgs);

        return mapping.findForward("success");
    }

}