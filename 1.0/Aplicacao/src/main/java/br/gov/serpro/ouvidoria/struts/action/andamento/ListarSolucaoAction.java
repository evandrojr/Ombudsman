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

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.ActionMessages;
import org.apache.struts.action.DynaActionForm;

import br.gov.serpro.ouvidoria.controller.andamento.SolucaoCtrl;
import br.gov.serpro.ouvidoria.dao.DaoException;
import br.gov.serpro.ouvidoria.model.Funcionario;
import br.gov.serpro.ouvidoria.model.Orgao;
import br.gov.serpro.ouvidoria.struts.ActionSupport;
import br.gov.serpro.ouvidoria.util.Utilitario;

/**
 * Objetivo: Listar soluções de acordo com critérios escohidos
 * 
 * @author SERPRO
 * @version $Revision: 1.1.2.3 $, $Date: 2011/10/18 17:57:04 $
 * @version 0.1, 2004/11/19
 */
public class ListarSolucaoAction extends ActionSupport {

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

        List solucoes = null;
        ActionMessages errorMsgs = new ActionMessages();

        try {
            SolucaoCtrl ctrlSolucao = new SolucaoCtrl(getDaoFactory());

            DynaActionForm _form = (DynaActionForm) form;

            String lsTexto = Utilitario.trataPlic(_form.getString("txtBusca"));
            String lsAssunto = _form.getString("txtAssunto");
            String lsAtivo = _form.getString("chkAtivo");
            String lsInAtivo = _form.getString("chkInativo");
            String acaoChamadora = _form.getString("acaoChamadora");
            String lsSituac = "";

            // Trata checkboxes selecionados
            if (lsAtivo.equalsIgnoreCase("S")
                    && lsInAtivo.equalsIgnoreCase("S")) {
                lsSituac = "Ambos";
            } else if (lsAtivo.equalsIgnoreCase("S")) {
                lsSituac = "Ativos";
            } else if (lsInAtivo.equalsIgnoreCase("S")) {
                lsSituac = "Inativos";
            }

            // 	Recupera o Funcionário logado            
            Funcionario func = this.getFuncionario(request);

            // Recupera órgão
            Orgao org = getOrgao(request);


            solucoes = ctrlSolucao.consultaSolucao(lsTexto, lsAssunto,
                    lsSituac, func, org);

            // Passa através da requisição a lista de soluções
            // e a ação chamadora, caso exista
            request.setAttribute("listarSolucoes", solucoes);
            request.setAttribute("acaoChamadora", acaoChamadora);

        } catch (DaoException e) {
            errorMsgs.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
                    "error.solucao.excecao"));
        }

        if (errorMsgs.isEmpty()) {
            return (mapping.findForward("success"));
        }
        
        saveMessages(request, errorMsgs);
        return (mapping.findForward("failure"));


    }

}