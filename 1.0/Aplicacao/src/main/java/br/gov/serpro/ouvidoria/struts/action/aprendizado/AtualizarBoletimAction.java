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
package br.gov.serpro.ouvidoria.struts.action.aprendizado;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.ActionMessages;
import org.apache.struts.action.DynaActionForm;

import br.gov.serpro.ouvidoria.controller.aprendizado.BoletimCtrl;
import br.gov.serpro.ouvidoria.dao.DaoException;
import br.gov.serpro.ouvidoria.model.Boletim;
import br.gov.serpro.ouvidoria.model.Funcionario;
import br.gov.serpro.ouvidoria.model.Orgao;
import br.gov.serpro.ouvidoria.struts.DispatchActionSupport;
import br.gov.serpro.ouvidoria.util.Constants;
import br.gov.serpro.ouvidoria.util.Utilitario;
import de.laures.cewolf.CewolfException;
import de.laures.cewolf.ChartImage;
import de.laures.cewolf.storage.TransientSessionStorage;

/**
 * Administrar as funcionalidades de Boleim
 * 
 * @author SERPRO
 * @version $Revision: 1.1.2.4 $, $Date: 2011/10/20 15:30:36 $
 * @version 0.1, 2005/02/01
 */
public class AtualizarBoletimAction extends DispatchActionSupport {

    public ActionForward listar(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        DynaActionForm _form = (DynaActionForm) form;
        BoletimCtrl defaultCtrl = new BoletimCtrl(getDaoFactory());

        Orgao org = this.getOrgao(request);
        
        List results = defaultCtrl.obterBoletinsFiltro(Utilitario
                .trataPlic(_form.getString("txtBusca")), _form
                .getString("txtPeriodoIni"), _form.getString("txtPeriodoFim"),
                org);

        request.setAttribute("listar", results);

        return mapping.findForward("listar");
    }

    public ActionForward exibir(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        Boletim object = (Boletim) request.getSession().getAttribute(
                Constants.BOLETIM);
        if (object == null) {
            object = new Boletim();
        }

        Funcionario funcionario = (Funcionario) this.getFuncionario(request);
        
        request.getSession().setAttribute(Constants.SS_FUNCIONARIO, funcionario);
        
        
        request.setAttribute(Constants.BOLETIM, object);

        return mapping.findForward("exibir");
    }

    public ActionForward exibirDetalhe(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        final String id = request.getParameter("id");

        Boletim object = null;
        if (id == null || id.trim().length() == 0) {
            object = new Boletim();
        } else {
            BoletimCtrl defaultCtrl = new BoletimCtrl(getDaoFactory());
            object = defaultCtrl.get(new Long(id));
        }

        request.setAttribute("diretorio", this.getOrgao(request)
                .getConfiguracoes().getNomeDiretorioOrgao());
        request.setAttribute("object", object);
        request.setAttribute("function", request.getParameter("function"));

        return mapping.findForward("exibirDetalhe");
    }

    public ActionForward gerar(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws DaoException {

        ActionMessages msgs = new ActionMessages();

        final String nome = request.getParameter("nome");
        final String numero = request.getParameter("numero");
        final String area = request.getParameter("area");
        final String telefone = request.getParameter("telefone");
        final String conteudo = request.getParameter("conteudo");

        final String cabecalho = request.getParameter("cabecalho");
        final String grafico = request.getParameter("grafico");
        final String tabela = request.getParameter("tabela");

        BoletimCtrl defaultCtrl = new BoletimCtrl(getDaoFactory());

        if (nome == null || nome.trim().length() == 0) {
            msgs.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
                    "error.atualizarBoletim.nome"));
        }

        Integer num = null;
        try {
            if (numero != null && numero.trim().length() > 0) {
                num = new Integer(numero);
            } else {
                msgs.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
                        "error.atualizarBoletim.numero"));
            }
        } catch (NumberFormatException nfe) {
            msgs.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
                    "error.atualizarBoletim.numero"));
        }

        if (area == null || area.trim().length() == 0) {
            msgs.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
                    "error.atualizarBoletim.area"));
        }

        if (telefone == null || telefone.trim().length() == 0) {
            msgs.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
                    "error.atualizarBoletim.telefone"));
        }

        if (conteudo == null || conteudo.trim().length() == 0) {
            msgs.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
                    "error.atualizarBoletim.conteudo"));
        }

        if (num != null
                && defaultCtrl.existeNumeroCadastrado(getOrgao(request), num)) {
            msgs.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
                    "error.atualizarBoletim.chaveDuplicada"));
        }

        Boolean possuiCabecalho = Boolean.TRUE;
        if (cabecalho == null) {
            possuiCabecalho = Boolean.FALSE;
        }

        Boolean possuiGrafico = Boolean.TRUE;
        if (grafico == null) {
            possuiGrafico = Boolean.FALSE;
        }

        Boolean possuiTabela = Boolean.TRUE;
        if (tabela == null) {
            possuiTabela = Boolean.FALSE;
        }

//    	Recupera o Funcionário logado
        Funcionario funcionario = (Funcionario) this.getFuncionario(request);  
    	
        Boletim boletim = defaultCtrl.gerar(getOrgao(request), funcionario,
                nome, num, area, telefone, conteudo, possuiCabecalho,
                possuiGrafico, possuiTabela);

        request.getSession().setAttribute(Constants.BOLETIM, boletim);        
        
        request.getSession().setAttribute(Constants.SS_FUNCIONARIO, funcionario);

        
        if (msgs.isEmpty()) {
            return mapping.findForward("exibir");
        }

        saveErrors(request, msgs);
        return mapping.findForward("error");

    }

    public ActionForward salvar(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws DaoException {

        ActionMessages msgs = new ActionMessages();

        BoletimCtrl defaultCtrl = new BoletimCtrl(getDaoFactory());

        Boletim boletim = (Boletim) request.getSession().getAttribute(
                Constants.BOLETIM);

        boolean erroLogica = false;
        try {
            defaultCtrl.save(boletim);

            final String html = request.getParameter("htmlBoletim");
            final String imgUrl = (String) request.getSession().getAttribute(
                    Constants.IMAGE_CHART);
            final String contextUrl = request.getContextPath();
            
            try {
                final String domain = request.getScheme()
                        + "://"
                                .concat(request.getServerName())
                                .concat(":")
                                .concat(String.valueOf(request.getServerPort()));
                	
                final TransientSessionStorage storage = new TransientSessionStorage();
                storage.init(this.getServlet().getServletContext());

                final String imgUrls = imgUrl;

                final int posI = imgUrls.indexOf("?") + 5;
                final int posF = imgUrls.indexOf("&", posI);

                final String imgId = imgUrls.substring(posI, posF);

                final ChartImage chartImages = storage.getChartImage(imgId,
                        request);

                defaultCtrl.criaArquivoBoletim(getOrgao(request), boletim,
                        html, chartImages.getBytes(), domain, contextUrl);

            } catch (CewolfException e1) {
                erroLogica = true;
                msgs.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
                        "error.atualizarBoletim.arquivo"));
            }

        } catch (IOException e) {
            erroLogica = true;
            msgs.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
                    "error.atualizarBoletim.arquivo"));
        } catch (DaoException e) {
            String errorMessage = e.getMessage();
            if (errorMessage != null
                    && errorMessage.toLowerCase().indexOf("duplicate key") >= 0) {
                erroLogica = true;
                msgs.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
                        "error.atualizarBoletim.chaveDuplicada"));
            } else {
                throw e;
            }
        }

        if (erroLogica) {
            saveErrors(request, msgs);
            return mapping.findForward("error");
        }

        msgs.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
                "message.atualizarBoletim.incluir"));

        saveMessages(request, msgs);

        return mapping.findForward("success");
    }

    public ActionForward publicar(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws DaoException {

        DynaActionForm _form = (DynaActionForm) form;

        BoletimCtrl defaultCtrl = new BoletimCtrl(getDaoFactory());

        ActionMessages msgs = new ActionMessages();

        Boletim boletim = defaultCtrl.get(new Long(request.getParameter("id")));

        //Se estava true e virou false
        if (boletim.getPublicar().booleanValue()
                && _form.getString("publicar").length() == 0) {
            defaultCtrl.publicar(boletim.getId(), Boolean.FALSE);
        }

        //Se estava false e virou true
        if (!boletim.getPublicar().booleanValue()
                && _form.getString("publicar").compareToIgnoreCase("true") == 0) {
            defaultCtrl.publicar(boletim.getId(), Boolean.TRUE);
        }

        boletim = defaultCtrl.get(new Long(request.getParameter("id")));
        request.setAttribute("diretorio", this.getOrgao(request)
                .getConfiguracoes().getNomeDiretorioOrgao());
        request.setAttribute("object", boletim);
        request.setAttribute("function", request.getParameter("function"));

        msgs.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
                "message.atualizarBoletim.publicar"));

        saveMessages(request, msgs);

        return mapping.findForward("success");
    }

}