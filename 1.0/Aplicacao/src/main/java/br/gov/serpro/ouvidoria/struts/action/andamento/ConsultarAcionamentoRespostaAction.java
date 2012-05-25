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
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.ActionMessages;

import br.gov.serpro.ouvidoria.model.MeioEnvioRespostaOrgao;
import br.gov.serpro.ouvidoria.model.Orgao;
import br.gov.serpro.ouvidoria.struts.ActionSupport;
import java.util.Collection;

/**
 * Objetivo: Montar a tela de busca de Acionamentos
 * 
 * @author SERPRO
 * @version $Revision: 1.1.2.3 $, $Date: 2011/10/18 17:57:04 $
 * @version 0.1, 2004/12/17
 */
public class ConsultarAcionamentoRespostaAction extends ActionSupport {

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

        ActionMessages error = new ActionMessages();
        
        //obter o órgão atual
        Orgao orgao = this.getOrgao(request);
        
        //obter os meios de envio de resposta para o órgão atual
        List meiosEnvioResposta = new ArrayList();
        Collection meiosEnvioRespOrgao = orgao.getListaMeioEnvioRespostaOrgao();
        if (meiosEnvioRespOrgao == null) {
            //NÃO HÁ MEIOS DE ENVIO DE RESPOSTA CADASTRADOS PARA O ÓRGÃO
            error.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
                    "error.listarAcioamentoResposta.meioEnvioResposta"));
        } else {

            for (Iterator iter = meiosEnvioRespOrgao.iterator(); iter.hasNext();) {
                MeioEnvioRespostaOrgao merOrgao = (MeioEnvioRespostaOrgao) iter
                        .next();

                if (merOrgao.getMeioEnvioResposta().getId().intValue() > 2) {
                    meiosEnvioResposta.add(merOrgao.getMeioEnvioResposta());
                }
            }

            request.setAttribute("lstMeioEnvioResposta", meiosEnvioResposta);
        }

        if (error.isEmpty()) {
            return (mapping.findForward("success"));
        }

        saveErrors(request, error);
        return (mapping.findForward("failure"));
    }

}