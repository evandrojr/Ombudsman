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

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.ActionMessages;
import org.apache.struts.action.DynaActionForm;

import br.gov.serpro.ouvidoria.controller.gerencial.administracao.ParametrosGeraisCtrl;
import br.gov.serpro.ouvidoria.dao.DaoException;
import br.gov.serpro.ouvidoria.model.ParametrosGerais;
import br.gov.serpro.ouvidoria.struts.DispatchActionSupport;

/**
 * Objetivo: Disparar as ações cadastrais dos parâmetros gerais.
 * 
 * @author SERPRO
 * @version $Revision: 1.1.2.5 $, $Date: 2011/10/21 12:51:36 $
 * @version 0.1, 2004/12/27
 */
public class AtualizarParametrosGeraisAction extends DispatchActionSupport {

    /**
     * Altera o Script. Realiza dois forwards: um em caso de sucesso e outro em
     * caso de falha
     * 
     * @param mapping
     * @param form
     *            ActionForm, caso necessário
     * @param request
     * @param response
     *  
     */
    public ActionForward alterarParametros(ActionMapping mapping,
            ActionForm form, HttpServletRequest request,
            HttpServletResponse response) throws Exception {

        ActionMessages errorMsgs = new ActionMessages();
        ActionMessages Msgs = new ActionMessages();

        DynaActionForm _form = (DynaActionForm) form;

        String lId = _form.getString("idParametro");
        String lHost = _form.getString("txtHostEmail");
        String lTempo = _form.getString("txtTempoLimite");
        String lExtNaoPermit = _form.getString("txtExtensaoNaoPermitida");
        String lExtPermit = _form.getString("txtExtensaoPermitida");
        String lDir = _form.getString("txtDirContexto");
        String lLimColunas = _form.getString("txtlimiteColunaIndicadores");
        String lLimiteFalhasLogin = _form.getString("limiteFalhasLogin");
        String lTempoBloqueioLogin = _form.getString("tempoBloqueioLogin");
        

        try {
            ParametrosGeraisCtrl paramCtrl = new ParametrosGeraisCtrl(
                    getDaoFactory());

            // Verifica se foi passado o id do Parâmetro
            if (lId != null) {
                ParametrosGerais param = paramCtrl.get(new Long(lId));

                // Se não encontrou o parâmetro, reporta o erro
                if (param == null) {
                    errorMsgs
                            .add(ActionMessages.GLOBAL_MESSAGE,
                                    new ActionMessage(
                                            "error.parametrosgerais.notfound"));
                    saveMessages(request, errorMsgs);
                } else {
                    // Altera os dados
                    param.setServidorSMTP(lHost);
                    param.setTempoAcessoBaseFuncionarios(new Integer(lTempo));
                    param.setExtensoesArquivoAnexoNaoPermitidos(lExtNaoPermit);
                    param
                            .setExtensoesMensagemDigitalizadaPermitidas(lExtPermit);
                    param.setDiretorioContextoAplicacao(lDir);
                    param.setLimiteColunaIndicadores(new Integer(lLimColunas));
                    param.setLimiteFalhasLogin(new Integer(lLimiteFalhasLogin));
                    param.setTempoBloqueioLogin(new Integer(lTempoBloqueioLogin));

                    // Salva o script
                    paramCtrl.save(param);

                    // Mensagem de alteração OK
                    Msgs.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
                            "alterar.parametros.sucesso"));
                    saveMessages(request, Msgs);

                    // Passa ação a ser executada após a mensagem
                    request.setAttribute("txtAcao",
                            "../../../gerencial/ExibirParametrosGerais");

                }

            }

        } catch (DaoException e) {
            errorMsgs.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
                    "error.parametrosgerais.excecao"));
            saveMessages(request, errorMsgs);
        }

        if (errorMsgs.isEmpty()) {
            return (mapping.findForward("success"));
        }
        return (mapping.findForward("failure"));
    }

}