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

import br.gov.serpro.ouvidoria.controller.andamento.RecuperarCodigoAcessoCtrl;
import br.gov.serpro.ouvidoria.struts.ActionSupport;

/**
 * Objetivo: Recuperar o Código de Acesso do Acionador
 * 
 * @author SERPRO
 * @version $Revision: 1.1.2.3 $, $Date: 2011/10/18 17:57:03 $
 * @version 0.1, 2004/12/11
 */
public class RecuperarCodigoAcessoSubmitAction extends ActionSupport {


    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        ActionErrors errors = new ActionErrors();

        RecuperarCodigoAcessoCtrl recuperarCodigoAcessoCtrl = new RecuperarCodigoAcessoCtrl(
                getDaoFactory());

        DynaActionForm _form = (DynaActionForm) form;
        Integer numeroProtocolo = (Integer) _form.get("numeroProtocolo");
        String campoObrigatorio = (String) _form.get("campoObrigatorio");
        String respostaUsuario = (String) _form.get("respostaUsuario");
        String action = (String) _form.get("action");

        if (action != null)
            request.setAttribute("action", action);

        ///////////////////////////////////////
        // 
        //	Códigos de retorno:
        //
        //	ERRO = 0
        //  PROTOCOLO_FOI_BLOQUEADO = 2
        //  RESPOSTA_INCORRETA = 7
        //  ALERTA_BLOQUEIO_PROTOCOLO = 8
        //  RESPOSTA_CORRETA = 9
        //    	
        ///////////////////////////////////////

        int codigoRetorno = recuperarCodigoAcessoCtrl
                .recuperarCodigoAcessoSubmit(this.getOrgao(request),
                        numeroProtocolo, respostaUsuario, campoObrigatorio);

        switch (codigoRetorno) {
        case 2:
            errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
                    "error.resposta.incorreta.protocoloBloqueado",
                    recuperarCodigoAcessoCtrl
                            .getCampoValidacao(numeroProtocolo)));
            break;

        case 7:
            errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
                    "error.resposta.incorreta"));
            break;

        case 8:
            errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
                    "error.alerta.resposta.invalida"));
            break;

        case 9:
            //mostrar codigo na tela
            request.setAttribute("numeroProtocolo", numeroProtocolo);
            request.setAttribute("codigoAcesso", recuperarCodigoAcessoCtrl
                    .getCodigoAcesso(numeroProtocolo));
            break;

        case 0: // ERRO
            errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
                    "error.recuperarCodigoAcesso"));
            break;
        }

        if (!errors.isEmpty()) {
            saveMessages(request, errors);
            return (mapping.findForward("failure"));
        }

        return (mapping.findForward("success"));

    }
}