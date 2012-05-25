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
import java.util.ArrayList;
import java.util.Collection;
import java.util.Comparator;
import java.util.Iterator;
import java.util.Locale;
import java.util.SortedSet;
import java.util.TreeSet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.ActionMessages;

import br.gov.serpro.ouvidoria.controller.gerencial.administracao.FuncionarioCtrl;
import br.gov.serpro.ouvidoria.controller.gerencial.administracao.InstituicaoCtrl;
import br.gov.serpro.ouvidoria.controller.gerencial.administracao.SubOrgaoCtrl;
import br.gov.serpro.ouvidoria.controller.gerencial.administracao.TipoAssuntoCtrl;
import br.gov.serpro.ouvidoria.dao.DaoException;
import br.gov.serpro.ouvidoria.model.Assunto;
import br.gov.serpro.ouvidoria.model.Funcionario;
import br.gov.serpro.ouvidoria.model.Instituicao;
import br.gov.serpro.ouvidoria.model.SubOrgao;
import br.gov.serpro.ouvidoria.struts.DispatchActionSupport;
import br.gov.serpro.ouvidoria.util.Constants;

/**
 * AtualizarAssuntoAction
 * 
 * Objetivo: Manter tabela de Assunto
 * 
 * @author SERPRO
 * @version $Revision: 1.1.2.5 $, $Date: 2011/10/21 12:51:36 $
 * @version 0.1, 2004/12/27
 */
public class AtualizarTipoAssuntoAction extends DispatchActionSupport {


    public ActionForward listar(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        Long funcionarioId = (Long) request.getSession().getAttribute(Constants.PA_FUNCIONARIO);
        
    	FuncionarioCtrl funcionarioCtrl = new FuncionarioCtrl(getDaoFactory());
    	
    	Funcionario funcionario = (Funcionario) funcionarioCtrl.get(funcionarioId);  

        Collection lista = null;
        if (funcionario.getNivelAtuacao() == Funcionario.NA_ORGAO) {
            TipoAssuntoCtrl defaultCtrl = new TipoAssuntoCtrl(getDaoFactory());
            lista = defaultCtrl.list(getOrgao(request));
        } else {
            lista = new ArrayList();
            for (Iterator iter = funcionario.getListaSubOrgaosAtivos()
                    .iterator(); iter.hasNext();) {
                SubOrgao subOrgao = (SubOrgao) iter.next();
                lista.addAll(subOrgao.getListaAssunto(Assunto.ATIVO));
            }
        }

        request.setAttribute("listar", lista);

        return mapping.findForward("listar");
    }


    public ActionForward exibir(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        Long funcionarioId = (Long) request.getSession().getAttribute(Constants.PA_FUNCIONARIO);
        
    	FuncionarioCtrl funcionarioCtrl = new FuncionarioCtrl(getDaoFactory());
    	
    	Funcionario funcionario = (Funcionario) funcionarioCtrl.get(funcionarioId);  

        final String id = request.getParameter("id");

        Assunto object = null;
        if (id == null || id.trim().length() == 0) {
            object = new Assunto();
        } else {
            TipoAssuntoCtrl defaultCtrl = new TipoAssuntoCtrl(getDaoFactory());
            object = defaultCtrl.get(new Long(id));
        }

        SortedSet lista = new TreeSet(new Comparator() {
            public int compare(Object obj1, Object obj2) {
                return ((Instituicao) obj1).getDescricao().compareTo(
                        ((Instituicao) obj2).getDescricao());
            }
        });

        SubOrgaoCtrl subOrgaoCtrl = new SubOrgaoCtrl(getDaoFactory());

        if( funcionario.getNivelAtuacao() == Funcionario.NA_ORGAO ) {
            lista.addAll(subOrgaoCtrl.list(getOrgao(request)));
        } else {
            lista.addAll(funcionario.getListaSubOrgaosAtivos());
        }

        request.setAttribute("object", object);
        request.setAttribute("function", request.getParameter("function"));
        request.setAttribute("listarInstituicao", lista);

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

        String instituicaoId = request.getParameter("instituicao.id");
        if (instituicaoId == null || instituicaoId.trim().length() == 0) {
            instituicaoId = request.getParameter("instituicao");
        }

        if (descricao == null || descricao.trim().length() == 0) {
            msgs.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
                    "error.atualizarAssunto.descricao"));
        }

        Integer prazoInt = null;
        try {
            if (prazoInterno != null && prazoInterno.trim().length() > 0) {
                prazoInt = new Integer(prazoInterno);
            }
        } catch (NumberFormatException nfe) {
            msgs.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
                    "error.atualizarAssunto.prazoInterno"));
        }

        Integer prazoExt = null;
        try {
            if (prazoExterno != null && prazoExterno.trim().length() > 0) {
                prazoExt = new Integer(prazoExterno);
            }
        } catch (NumberFormatException nfe) {
            msgs.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
                    "error.atualizarAssunto.prazoInterno"));
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

        TipoAssuntoCtrl defaultCtrl = new TipoAssuntoCtrl(getDaoFactory());

        InstituicaoCtrl instituicaoCtrl = new InstituicaoCtrl(getDaoFactory());

        Instituicao instituicao = instituicaoCtrl.get(new Long(instituicaoId));

        if (id != null && id.trim().length() > 0) {

            defaultCtrl.update(getOrgao(request), instituicao, id, descricao,
                    descricaoDetalhada, prazoInt, prazoExt, vigencia);

            msgs.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
                    "message.atualizarTipoAssunto.alterar"));
        } else {
            defaultCtrl.insert(getOrgao(request), instituicao, descricao,
                    descricaoDetalhada, prazoInt, prazoExt, vigencia);

            msgs.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
                    "message.atualizarTipoAssunto.incluir"));
        }

        saveMessages(request, msgs);

        return mapping.findForward("success");
    }


    public ActionForward excluir(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        ActionMessages msgs = new ActionMessages();

        final String id = request.getParameter("id");
        final String instituicaoId = request.getParameter("instituicao.id");
        final String dataVigencia = request.getParameter("dataVigencia");
        final String horaVigencia = request.getParameter("horaVigencia");

        InstituicaoCtrl instituicaoCtrl = new InstituicaoCtrl(getDaoFactory());
        Instituicao instituicao = instituicaoCtrl.get(new Long(instituicaoId));

        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy hh:mm",
                new Locale("pt", "BR"));
        String message = null;
        try {
            final Timestamp vigencia = new Timestamp(sdf.parse(
                    dataVigencia + " " + horaVigencia).getTime());

            TipoAssuntoCtrl defaultCtrl = new TipoAssuntoCtrl(getDaoFactory());
            defaultCtrl.delete(getOrgao(request), instituicao, id, vigencia);
            message = "message.atualizarTipoAssunto.excluir";
        } catch (ParseException e) {
            message = "error.atualizarTipoAssunto.dataVigencia";
        }

        msgs.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(message));
        saveMessages(request, msgs);
        return mapping.findForward("success");
    }

}