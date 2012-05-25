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

import br.gov.serpro.ouvidoria.controller.gerencial.administracao.TipoMensagemCtrl;
import br.gov.serpro.ouvidoria.dao.DaoException;
import br.gov.serpro.ouvidoria.model.TipoMensagem;
import br.gov.serpro.ouvidoria.struts.DispatchActionSupport;

/**
 * Objetivo: Manter tabela de Tipo de Mensagem
 * 
 * @author SERPRO
 * @version $Revision: 1.1.2.5 $, $Date: 2011/10/21 12:51:36 $
 * @version 0.1, 2004/12/27
 */
public class AtualizarTipoMensagemAction extends DispatchActionSupport {


    public ActionForward listar(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        TipoMensagemCtrl defaultCtrl = new TipoMensagemCtrl(getDaoFactory());

        request.setAttribute("listar", defaultCtrl.list(getOrgao(request)));

        return mapping.findForward("listar");
    }


    public ActionForward exibir(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        final String id = request.getParameter("id");

        TipoMensagem object = null;
        if (id == null || id.trim().length() == 0) {
            object = new TipoMensagem();
        } else {
            TipoMensagemCtrl defaultCtrl = new TipoMensagemCtrl(getDaoFactory());
            object = defaultCtrl.get(new Long(id));
        }

        request.setAttribute("function", request.getParameter("function"));
        request.setAttribute("object", object);

        return mapping.findForward("exibir");
    }


    public ActionForward salvar(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws DaoException {

        ActionMessages msgs = new ActionMessages();

        final String id = request.getParameter("id");
        final String descricao = request.getParameter("descricao");
        final String descricaoDetalhada = request
                .getParameter("descricaoDetalhada");
        final String prazoInterno = request.getParameter("prazoInterno");
        final String prazoExterno = request.getParameter("prazoExterno");
        final String dataVigencia = request.getParameter("dataVigencia");
        final String horaVigencia = request.getParameter("horaVigencia");

        TipoMensagemCtrl defaultCtrl = new TipoMensagemCtrl(getDaoFactory());

        if (descricao == null || descricao.trim().length() == 0) {
            msgs.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
                    "error.atualizarTipoMensagem.descricao"));
        }

        Integer prazoInt = null;
        try {
            if (prazoInterno != null && prazoInterno.trim().length() > 0) {
                prazoInt = new Integer(prazoInterno);
            }
        } catch (NumberFormatException nfe) {
            msgs.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
                    "error.atualizarTipoMensagem.prazoInterno"));
        }

        Integer prazoExt = null;
        try {
            if (prazoExterno != null && prazoExterno.trim().length() > 0) {
                prazoExt = new Integer(prazoExterno);
            }
        } catch (NumberFormatException nfe) {
            msgs.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
                    "error.atualizarTipoMensagem.prazoInterno"));
        }

        Timestamp vigencia = null;
        if (dataVigencia != null && dataVigencia.trim().length() > 0) {
            try {
                SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy hh:mm",
                        new Locale("pt", "BR"));

                vigencia = new Timestamp(sdf.parse(
                        dataVigencia + " " + horaVigencia).getTime());
            } catch (ParseException e) {
                msgs.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
                        "error.atualizarTipoMensagem.dataVigencia"));
            }
        }

        if (!msgs.isEmpty()) {
            saveErrors(request, msgs);
            return mapping.findForward("error");
        }

        if (id != null && id.trim().length() > 0) {

            defaultCtrl.update(getOrgao(request), id, descricao,
                    descricaoDetalhada, prazoInt, prazoExt, vigencia);

            msgs.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
                    "message.atualizarTipoMensagem.alterar"));
        } else {
            defaultCtrl.insert(getOrgao(request), descricao,
                    descricaoDetalhada, prazoInt, prazoExt, vigencia);

            msgs.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
                    "message.atualizarTipoMensagem.incluir"));
        }

        saveMessages(request, msgs);

        return mapping.findForward("success");
    }


    public ActionForward excluir(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        ActionMessages msgs = new ActionMessages();

        final String id = request.getParameter("id");
        final String dataVigencia = request.getParameter("dataVigencia");
        final String horaVigencia = request.getParameter("horaVigencia");

        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy hh:mm",
                new Locale("pt", "BR"));
        String message = null;
        try {
            final Timestamp vigencia = new Timestamp(sdf.parse(
                    dataVigencia + " " + horaVigencia).getTime());

            TipoMensagemCtrl defaultCtrl = new TipoMensagemCtrl(getDaoFactory());
            defaultCtrl.delete(getOrgao(request), id, vigencia);
            message = "message.atualizarTipoMensagem.excluir";
        } catch (ParseException e) {
            message = "error.atualizarTipoMensagem.dataVigencia";
        }

        msgs.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(message));
        saveMessages(request, msgs);
        return mapping.findForward("success");
    }

}