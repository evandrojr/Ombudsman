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
import java.util.Collection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.ActionMessages;
import org.apache.struts.action.DynaActionForm;

import br.gov.serpro.ouvidoria.controller.andamento.AssuntoCtrl;
import br.gov.serpro.ouvidoria.controller.andamento.SolucaoCtrl;
import br.gov.serpro.ouvidoria.dao.DaoException;
import br.gov.serpro.ouvidoria.model.Assunto;
import br.gov.serpro.ouvidoria.model.EstadoSolucao;
import br.gov.serpro.ouvidoria.model.Orgao;
import br.gov.serpro.ouvidoria.model.Solucao;
import br.gov.serpro.ouvidoria.struts.DispatchActionSupport;

/**
 * Objetivo: Disparar as ações cadastrais do banco de soluções.
 * 
 * @author SERPRO
 * @version $Revision: 1.1.2.6 $, $Date: 2011/10/21 12:51:36 $
 * @version 0.1, 2004/12/27
 */
public class AtualizarSolucaoAction extends DispatchActionSupport {

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
    public ActionForward ListarBcoSolucoes(ActionMapping mapping,
            ActionForm form, HttpServletRequest request,
            HttpServletResponse response) throws Exception {

        ActionMessages errorMsgs = new ActionMessages();

        try {
            SolucaoCtrl ctrlSolucao = new SolucaoCtrl(getDaoFactory());

            DynaActionForm _form = (DynaActionForm) form;

            String lAssunto = _form.getString("txtAssunto");
            String lChave = _form.getString("txtChave");
            String sEstadoSolucao = _form.getString("idEstadoSolucao");
            Integer codEstadoSolucao = sEstadoSolucao!=null?new Integer(sEstadoSolucao):null;

            // Recupera órgão do funcionário
            Orgao org = getOrgao(request);

            // Recupera lista de soluçõess de acordo com os parâmetros
            // informados
            Collection lstSolucao = ctrlSolucao.listaSolucoesAtualizacao(
                    lAssunto, lChave, codEstadoSolucao, org);


            // Passa a lista de scripts através da requisição
            request.setAttribute("lstSolucao", lstSolucao);
            request.setAttribute("totalSolucoes", String.valueOf(lstSolucao
                    .size()));

        } catch (DaoException e) {
            errorMsgs.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
                    "error.solucao.excecao"));

            saveMessages(request, errorMsgs);
        }

        if (errorMsgs.isEmpty()) {
            return (mapping.findForward("success"));
        }
        return (mapping.findForward("failure"));
    }

    /**
     * Altera a Solucao. Realiza dois forwards: um em caso de sucesso e outro em
     * caso de falha
     * 
     * @param mapping
     * @param form
     *            ActionForm, caso necessário
     * @param request
     * @param response
     *  
     */
    public ActionForward AlterarSolucao(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        // Mensagens
        ActionMessages errorMsgs = new ActionMessages();
        ActionMessages Msgs = new ActionMessages();

        DynaActionForm _form = (DynaActionForm) form;

        String lAssunto = _form.getString("txtAssunto");
        String lTexto = _form.getString("txtTexto");
        String lTitulo = _form.getString("txtTitulo");
        String id = _form.getString("idSolucao");
        String lVigencia = _form.getString("txtDatVigencia");
        String lHoraVigencia = _form.getString("txtHoraVigencia");

        try {
            SolucaoCtrl ctrlSolucao = new SolucaoCtrl(getDaoFactory());

            // Verifica se foi passado o id do script
            if (id != null) {
                Solucao solucao = ctrlSolucao.get(new Long(id));

                // Se não encontrou a solucao, reporta o erro
                if (solucao == null) {
                    errorMsgs.add(ActionMessages.GLOBAL_MESSAGE,
                            new ActionMessage("error.solucao.notFound"));
                    saveMessages(request, errorMsgs);
                } else {
                    // Altera os dados
                    solucao.setTexto(lTexto);
                    solucao.setTitulo(lTitulo);

                    if ((lVigencia != null) && (!lVigencia.equals(""))) {
                        // Trata a vigência
                        String lVigenciaFormatada = lVigencia.substring(6)
                                + "-" + lVigencia.substring(3, 5) + "-"
                                + lVigencia.substring(0, 2) + " "
                                + lHoraVigencia + ":00.000000000";

                        Timestamp vigencia = Timestamp
                                .valueOf(lVigenciaFormatada);

                        solucao.setDataVigencia(vigencia);
                    } else {
                        solucao.setDataVigencia(null);
                    }

                    // Recupera Assunto
                    AssuntoCtrl ctrlAssnt = new AssuntoCtrl(getDaoFactory());
                    Assunto assunto = ctrlAssnt.get(new Long(lAssunto));

                    solucao.setAssunto(assunto);
                    
                    // Seta o status da solucao para Pendente
                    EstadoSolucao estado=new EstadoSolucao(EstadoSolucao.PENDENTE.getId(),
                    									   EstadoSolucao.PENDENTE.getDescricao());
                    solucao.setEstado(estado);
                    
                    // Salva a solucao
                    ctrlSolucao.save(solucao);
                }

                // Passa através da requisição a solução escolhida
                // e a ação chamadora, caso exista
                request.setAttribute("Solucao", solucao);

                // Mensagem de alteração OK
                Msgs.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
                        "alterar.solucao.sucesso"));
                saveMessages(request, Msgs);
            }

        } catch (DaoException e) {
            errorMsgs.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
                    "error.solucao.excecao"));
            saveMessages(request, errorMsgs);
        }


        if (errorMsgs.isEmpty()) {
            return (mapping.findForward("success"));
        }
        return (mapping.findForward("failure"));

    }

    /**
     * Excluir a Solucao. Realiza dois forwards: um em caso de sucesso e outro
     * em caso de falha
     * 
     * @param mapping
     * @param form
     *            ActionForm, caso necessário
     * @param request
     * @param response
     *  
     */
    public ActionForward ExcluirSolucao(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        ActionMessages errorMsgs = new ActionMessages();
        ActionMessages Msgs = new ActionMessages();

        DynaActionForm _form = (DynaActionForm) form;

        String id = _form.getString("idSolucao");

        try {
            SolucaoCtrl ctrlSolucao = new SolucaoCtrl(getDaoFactory());

            ctrlSolucao.delete(new Long(id));

            // Mensagem de exclusão OK
            Msgs.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
                    "excluir.solucao.sucesso"));
            saveMessages(request, Msgs);

        } catch (DaoException e) {
            errorMsgs.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
                    "error.solucao.excecao"));
            saveMessages(request, errorMsgs);
        }


        if (errorMsgs.isEmpty()) {
            return (mapping.findForward("success"));
        }
        return (mapping.findForward("failure"));

    }

    /**
     * Incluir a Solucao. Realiza dois forwards: um em caso de sucesso e outro
     * em caso de falha
     * 
     * @param mapping
     * @param form
     *            ActionForm, caso necessário
     * @param request
     * @param response
     *  
     */
    public ActionForward IncluirSolucao(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        ActionMessages errorMsgs = new ActionMessages();
        ActionMessages Msgs = new ActionMessages();

        DynaActionForm _form = (DynaActionForm) form;

        String lAssunto = _form.getString("txtAssunto");
        String lTexto = _form.getString("txtTexto");
        String lTitulo = _form.getString("txtTitulo");
        String id = _form.getString("idSolucao");
        String lVigencia = _form.getString("txtDatVigencia");
        String lHoraVigencia = _form.getString("txtHoraVigencia");

        try {
            SolucaoCtrl ctrlSolucao = new SolucaoCtrl(getDaoFactory());

            Solucao solucao = new Solucao();

            // Inclui a solucao
            solucao.setTexto(lTexto);
            solucao.setTitulo(lTitulo);
            solucao.setDataCadastramento(new Timestamp(System
                    .currentTimeMillis()));

            if ((lVigencia != null) && (!lVigencia.equals(""))) {
                // Trata a vigência
                String lVigenciaFormatada = lVigencia.substring(6) + "-" 
		                + lVigencia.substring(3, 5) + "-"
		                + lVigencia.substring(0, 2) + " "
		                + lHoraVigencia + ":00.000000000";

                Timestamp vigencia = Timestamp.valueOf(lVigenciaFormatada);

                solucao.setDataVigencia(vigencia);
            }

            // Recupera Assunto
            AssuntoCtrl ctrlAssnt = new AssuntoCtrl(getDaoFactory());
            Assunto assunto = ctrlAssnt.get(new Long(lAssunto));

            solucao.setAssunto(assunto);

            // Seta o status da solucao para Pendente
            EstadoSolucao estado=new EstadoSolucao(EstadoSolucao.PENDENTE.getId(),
            									   EstadoSolucao.PENDENTE.getDescricao());
            solucao.setEstado(estado);
            
            
            // Salva a solucao
            ctrlSolucao.save(solucao);

            // Mensagem de inclusão OK
            Msgs.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
                    "incluir.solucao.sucesso"));
            saveMessages(request, Msgs);

        } catch (DaoException e) {
            errorMsgs.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
                    "error.solucao.excecao"));
            saveMessages(request, errorMsgs);
        }

        // Repassa os parâmetros do Script para a tela de confirmação
        request.setAttribute("idSolucao", id);

        if (errorMsgs.isEmpty()) {
            return (mapping.findForward("success"));
        }
        return (mapping.findForward("failure"));

    }

}