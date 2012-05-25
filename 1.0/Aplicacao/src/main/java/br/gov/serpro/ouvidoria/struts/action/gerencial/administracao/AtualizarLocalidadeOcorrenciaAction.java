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

import br.gov.serpro.ouvidoria.controller.gerencial.administracao.LocalidadeOcorrenciaCtrl;
import br.gov.serpro.ouvidoria.controller.gerencial.administracao.SubOrgaoCtrl;
import br.gov.serpro.ouvidoria.dao.DaoException;
import br.gov.serpro.ouvidoria.model.LocalidadeOcorrencia;
import br.gov.serpro.ouvidoria.model.SubOrgao;
import br.gov.serpro.ouvidoria.struts.DispatchActionSupport;

/**
 * AtualizarSubOrgaoAction
 * 
 * Objetivo: Manter tabela de Localidade de Ocorrencia
 * 
 * @author Luis alvarenga
 * @version $Revision: 1.1.2.4 $, $Date: 2011/10/21 12:51:36 $
 * @version 0.1, 2004/12/27
 */
public class AtualizarLocalidadeOcorrenciaAction extends DispatchActionSupport {


    public ActionForward listar(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        SubOrgaoCtrl subOrgaoCtrl = new SubOrgaoCtrl(getDaoFactory());

        SubOrgao subOrgao = subOrgaoCtrl.get(new Long(request
                .getParameter("id")));

        LocalidadeOcorrenciaCtrl localidadeOcorrenciaCtrl = new LocalidadeOcorrenciaCtrl(
                getDaoFactory());

        request.setAttribute("subOrgao", subOrgao);
        request.setAttribute("listarLocalidadeOcorrencia",
                localidadeOcorrenciaCtrl.list(subOrgao));

        return mapping.findForward("listar");
    }


    public ActionForward exibir(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {

    	ActionMessages errorMsgs = new ActionMessages();
    	
        final String id = request.getParameter("id");
        final String subOrgaoId = request.getParameter("subOrgaoId");

        try {
	        LocalidadeOcorrencia localidadeOcorrencia = null;
	        if (id == null || id.trim().length() == 0) {
	            localidadeOcorrencia = new LocalidadeOcorrencia();
	        } else {
	            LocalidadeOcorrenciaCtrl localidadeOcorrenciaCtrl = new LocalidadeOcorrenciaCtrl(
	                    getDaoFactory());
	            localidadeOcorrencia = localidadeOcorrenciaCtrl.get(new Long(id));
	        }
	
	        request.setAttribute("function", request.getParameter("function"));
	        request.setAttribute("subOrgaoId", subOrgaoId);
	        request.setAttribute("localidadeOcorrencia", localidadeOcorrencia);
        } catch (DaoException e) {
            errorMsgs.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
                    "error.localidadeocorrencia.excecao"));
            saveMessages(request, errorMsgs);
        }

        if (errorMsgs.isEmpty()) {
            return (mapping.findForward("exibir"));
        }
        return (mapping.findForward("failure"));
    }


    public ActionForward salvar(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        ActionMessages msgs = new ActionMessages();

        final String id = request.getParameter("id");
        final String descricao = request.getParameter("descricao");
        final String dataVigencia = request.getParameter("dataVigencia");
        final String horaVigencia = request.getParameter("horaVigencia");
        final String subOrgaoId = request.getParameter("subOrgaoId");

        if (descricao == null || descricao.trim().length() == 0) {
            msgs.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
                    "error.atualizarLocalidadeOcorrencia.descricao"));
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
                        "error.atualizarLocalidadeOcorrencia.dataVigencia"));
            }
        }

        if (!msgs.isEmpty()) {
            saveErrors(request, msgs);
            return mapping.findForward("error");
        }

        SubOrgaoCtrl subOrgaoCtrl = new SubOrgaoCtrl(getDaoFactory());
        SubOrgao subOrgao = subOrgaoCtrl.get(new Long(subOrgaoId));

        LocalidadeOcorrenciaCtrl localidadeOcorrenciaCtrl = new LocalidadeOcorrenciaCtrl(
                getDaoFactory());

        try {

            if (id != null && id.trim().length() > 0) {
                localidadeOcorrenciaCtrl.update(subOrgao, id, descricao,
                        vigencia);

                msgs.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
                        "message.atualizarLocalidadeOcorrencia.alterar"));
            } else {
                localidadeOcorrenciaCtrl.insert(subOrgao, descricao, vigencia);

                msgs.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
                        "message.atualizarLocalidadeOcorrencia.incluir"));
            }

        } catch (DaoException daoe) {
            msgs.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
                    "error.atualizarLocalidadeOcorrencia"));
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

        final String subOrgaoId = request.getParameter("subOrgaoId");

        SubOrgaoCtrl subOrgaoCtrl = new SubOrgaoCtrl(getDaoFactory());
        SubOrgao subOrgao = subOrgaoCtrl.get(new Long(subOrgaoId));

        LocalidadeOcorrenciaCtrl localidadeOcorrenciaCtrl = new LocalidadeOcorrenciaCtrl(
                getDaoFactory());

        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy hh:mm",
                new Locale("pt", "BR"));
        String message = null;
        try {
            final Timestamp vigencia = new Timestamp(sdf.parse(
                    dataVigencia + " " + horaVigencia).getTime());

            localidadeOcorrenciaCtrl.delete(subOrgao, id, vigencia);
            message = "message.atualizarLocalidadeOcorrencia.excluir";
        } catch (ParseException e) {
            message = "error.atualizarLocalidadeOcorrencia.dataVigencia";
        }

        msgs.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(message));
        saveMessages(request, msgs);
        return mapping.findForward("success");
    }
}