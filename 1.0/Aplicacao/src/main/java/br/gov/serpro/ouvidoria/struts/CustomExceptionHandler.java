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
package br.gov.serpro.ouvidoria.struts;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ExceptionHandler;
import org.apache.struts.config.ExceptionConfig;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**
 * Objetivo: Extender as funcionalidades básicas de um Action
 * 
 * @author SERPRO
 * @version $Revision: 1.1.2.3 $, $Date: 2011/10/20 15:30:34 $
 * @version 0.1, Date: 11/11/2004
 */
public class CustomExceptionHandler extends ExceptionHandler {

    /** Logger for this class and subclasses */
    protected final Log logger = LogFactory.getLog(getClass());


    public ActionForward execute(Exception exception,
            ExceptionConfig exceptionConfig, ActionMapping mapping,
            ActionForm form, HttpServletRequest request,
            HttpServletResponse response) throws ServletException {

        try {
            List errors = new ArrayList();

            String ne = String.valueOf(System.currentTimeMillis());
            String dt = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss")
                    .format(new Date(System.currentTimeMillis()));

            String id = "[" + dt + " ERRO-" + ne.substring(9) + "] ";

            if (exception.getCause() != null) {
                exception.getCause().printStackTrace(System.out);
            }
            logger.error(id, exception);
            
            errors
                    .add(id
                            + " Ocorreu um erro inesperado, por favor entre em contato com o suporte.");

            request.setAttribute("exception", errors);

            return (mapping.findForward("exception"));

        } catch (Exception e) {
            this.logException(e);
            throw new ServletException(e);
        }
    }
}