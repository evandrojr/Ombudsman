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

import java.util.ArrayList;
import java.util.Collection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.ActionMessages;
import org.apache.struts.action.DynaActionForm;

import br.gov.serpro.ouvidoria.controller.andamento.ListarAcionamentoRespostaCtrl;
import br.gov.serpro.ouvidoria.controller.gerencial.administracao.FuncionarioCtrl;
import br.gov.serpro.ouvidoria.model.Acionamento;
import br.gov.serpro.ouvidoria.model.EstadoAcionamento;
import br.gov.serpro.ouvidoria.model.Funcionario;
import br.gov.serpro.ouvidoria.model.Orgao;
import br.gov.serpro.ouvidoria.struts.ActionSupport;
import br.gov.serpro.ouvidoria.util.Constants;

/**
 * Objetivo: Listar os Acionamentos retornados na Busca
 * 
 * @author SERPRO
 * @version $Revision: 1.1.2.3 $, $Date: 2011/10/18 17:57:04 $
 * @version 0.1, 2004/12/17
 */
public class ListarAcionamentoRespostaAction extends ActionSupport {

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

        ActionMessages msgs = new ActionMessages();

        Orgao orgao = this.getOrgao(request);

        Long funcionarioId = (Long) request.getSession().getAttribute(Constants.PA_FUNCIONARIO);
        
    	FuncionarioCtrl funcionarioCtrl = new FuncionarioCtrl(getDaoFactory());
    	
    	Funcionario funcionario = (Funcionario) funcionarioCtrl.get(funcionarioId);  

        ListarAcionamentoRespostaCtrl controle = new ListarAcionamentoRespostaCtrl(
                getDaoFactory());

        String numeroProtocolo = ((DynaActionForm) form)
                .getString("numeroProtocolo");

        String enviados = ((DynaActionForm) form).getString("enviado");

        String naoEnviados = ((DynaActionForm) form).getString("naoEnviado");

        String meioEnvioResposta = ((DynaActionForm) form)
                .getString("meioEnvioResposta");

        Collection acionamentos = null;

        if (numeroProtocolo != null && numeroProtocolo.trim().length() > 0) {

            try {

                Acionamento acnmnt = controle.getAcionamentoPeloProtocolo(
                        orgao, funcionario, numeroProtocolo);

                if (acnmnt != null) {
                    acionamentos = new ArrayList();
                    acionamentos.add(acnmnt);
                }

            } catch (Exception a) {
                msgs.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
                        "error.listarAcionamentoResposta.protocolo.invalido"));
            }

        } else {

            String situacao = null;

            if ((enviados == null || enviados.trim().length() == 0)
                    && naoEnviados != null) {
                situacao = EstadoAcionamento.RESPONDIDO.getId().toString();
            } else if (enviados != null
                    && (naoEnviados == null || naoEnviados.trim().length() == 0)) {
                situacao = EstadoAcionamento.ENVIADO.getId().toString();
            }

            acionamentos = controle.listarAcionamentos(orgao, funcionario,
                    meioEnvioResposta, situacao);

        }

        request.setAttribute("numeroProtocolo", numeroProtocolo);
        request.setAttribute("meioEnvioResposta", meioEnvioResposta);
        request.setAttribute("enviado", enviados);
        request.setAttribute("naoEnviado", naoEnviados);

        request.setAttribute("listarAcionamentos", acionamentos);

        if (msgs.isEmpty()) {
            return (mapping.findForward("success"));
        }

        saveErrors(request, msgs);
        return (mapping.findForward("error"));
    }

}