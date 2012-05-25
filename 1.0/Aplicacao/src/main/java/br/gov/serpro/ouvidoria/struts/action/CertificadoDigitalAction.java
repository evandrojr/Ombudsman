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
package br.gov.serpro.ouvidoria.struts.action;

import java.security.cert.X509Certificate;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.ActionMessages;

import br.gov.serpro.ouvidoria.controller.CertificadoDigitalCtrl;
import br.gov.serpro.ouvidoria.controller.gerencial.administracao.FuncionarioCtrl;
import br.gov.serpro.ouvidoria.model.Funcionario;
import br.gov.serpro.ouvidoria.struts.ActionSupport;
import br.gov.serpro.ouvidoria.util.Constants;
import br.gov.serpro.ouvidoria.util.Utilitario;

/**
 * Objetivo: Efeturar o Login do Funcionario no Site com Certificado Digital
 * 
 * @author SERPRO
 * @version $Revision: 1.1.2.4 $, $Date: 2011/10/20 15:30:36 $
 * @version 0.1, 2005/04/01
 */
public class CertificadoDigitalAction extends ActionSupport {


    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        //imprimir informações de DEBUG
        if (Constants.DEBUG) {
            X509Certificate[] certs = (X509Certificate[]) request
                    .getAttribute("javax.servlet.request.X509Certificate");
            if (certs != null) {
                for (int i = 0; i < certs.length; i++) {
                    X509Certificate cert = certs[i];
                    request.getSession().setAttribute(
                            "javax.servlet.request.X509Certificate", cert);
                    String nm = cert.getSubjectDN().getName();
                    String[] nms = nm.split(",");
                    for (int j = 0; j < nms.length; j++) {
                        System.out.println(nms[j]);
                    }

                }
            } else {
                System.out.println("Certs returned NULL");
            }
        }

        ActionMessages errors = new ActionMessages();

        X509Certificate[] certs = (X509Certificate[]) request
                .getAttribute("javax.servlet.request.X509Certificate");

        if (certs == null) {
            errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
                    "certificadoDigital.error"));
            saveErrors(request, errors);
            return mapping.findForward("error");
        }

        String login = CertificadoDigitalCtrl.getLogin(certs);

        if (login == null || !Utilitario.validaCpf(login)) {
            errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
                    "certificadoDigital.invalido.error"));
            saveErrors(request, errors);
            return mapping.findForward("error");
        }

        FuncionarioCtrl funcCtrl = new FuncionarioCtrl(getDaoFactory());

        Funcionario funcionario = funcCtrl.getByLogin(getOrgao(request), login);

        if (funcionario == null) {
            errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
                    "certificadoDigital.recuperarFuncionario.error", "\""
                            + login + "\""));
            saveErrors(request, errors);
            return mapping.findForward("error");
        }

        request.getSession(true).setAttribute(Constants.PA_FUNCIONARIO,
                funcionario.getId());

        geraHistorico(request);

        return mapping.findForward("success");
    }
}