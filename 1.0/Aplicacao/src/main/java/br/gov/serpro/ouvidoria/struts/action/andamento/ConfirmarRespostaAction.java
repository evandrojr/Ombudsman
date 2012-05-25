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

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.DynaActionForm;

import br.gov.serpro.ouvidoria.struts.ActionSupport;

/**
 * Objetivo: Exibir tela de confirmação de resposta do acionamento
 * 
 * @author SERPRO
 * @version $Revision: 1.1.2.3 $, $Date: 2011/10/18 17:57:03 $
 * @version 0.1, 2004/12/20
 */
public class ConfirmarRespostaAction extends ActionSupport {

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

        DynaActionForm _form = (DynaActionForm) form;

        // Recupera parâmetros da requisição
        String lsTitulo = _form.getString("txtTitulo");
        String lsResp = _form.getString("txtResposta");
        String lidAcion = _form.getString("idAcionamento");
        String lsAcao = _form.getString("txtAcao");
		String lidRemetenteRedirec = _form.getString("idRemetenteRedirec");
		String idSolucao = _form.getString("idSolucao");


        // Repassa os parâmetros para a tela de confirmação
        request.setAttribute("idAcionamento", lidAcion);
        request.setAttribute("txtTitulo", lsTitulo);
        request.setAttribute("txtResposta", lsResp);
        request.setAttribute("txtAcao", lsAcao);
        request.setAttribute("idRemetenteRedirec", lidRemetenteRedirec);
        request.setAttribute("idSolucao", idSolucao);

        return (mapping.findForward("success"));
    }

}