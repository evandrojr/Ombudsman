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

import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import br.gov.serpro.ouvidoria.controller.ExibirMensagemGenericaCtrl;
import br.gov.serpro.ouvidoria.controller.gerencial.administracao.FuncionarioCtrl;
import br.gov.serpro.ouvidoria.model.Assunto;
import br.gov.serpro.ouvidoria.model.Funcionalidade;
import br.gov.serpro.ouvidoria.model.Funcionario;
import br.gov.serpro.ouvidoria.model.TipoMensagem;
import br.gov.serpro.ouvidoria.struts.ActionSupport;
import br.gov.serpro.ouvidoria.util.Constants;

/**
 * 
 * @author SERPRO
 * @version $Revision: 1.1.2.4 $, $Date: 2011/10/20 15:30:36 $
 * @version 0.1, 2005/04/01
 */
public class ExibirMensagemGenericaAction extends ActionSupport {

    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        ExibirMensagemGenericaCtrl exibirMensagemGenericaCtrl = new ExibirMensagemGenericaCtrl(
                getDaoFactory());

        ActionErrors errors = new ActionErrors();
        String texto = "";

        if (request.getParameter("tela").compareToIgnoreCase(
                "CanaisComunicacao") == 0) {
            texto = this.getOrgao(request).getConfiguracoes()
                    .getTextoCanaisComunicacaoFormatado();
        }

        if (request.getParameter("tela").compareToIgnoreCase("Legislacao") == 0) {
            texto = this.getOrgao(request).getConfiguracoes()
                    .getTextoLegislacaoOuvidoriaFormatado();
        }

        if (request.getParameter("tela").compareToIgnoreCase(
                "ResultadosOuvidoria") == 0) {
            texto = this.getOrgao(request).getConfiguracoes()
                    .getTextoInformacaoOuvidoriaFormatado();
        }

        if (request.getParameter("tela").compareToIgnoreCase("TiposMensagem") == 0) {
            List lista = this.getOrgao(request).listarTipoMensagemAtivos();
            TipoMensagem tipoMensagem;
            Iterator iter = lista.iterator();
            int i = 2;
            while (iter.hasNext()) {
                tipoMensagem = (TipoMensagem) iter.next();
                texto += "<h2 tabindex=" + i + ">&nbsp;"
                        + tipoMensagem.getDescricao() + "</h2>";
                i++;
                texto += "<p tabindex=" + i + ">"
                        + tipoMensagem.getDescricaoDetalhada() + "</p>";
                i++;
            }
        }

        if (request.getParameter("tela").compareToIgnoreCase("TiposAssunto") == 0) {
            List lista = this.getOrgao(request).getListaAssuntosSubOrgaos();
            Assunto assunto;
            Iterator iter = lista.iterator();
            int i = 2;
            while (iter.hasNext()) {
                assunto = (Assunto) iter.next();
                texto += "<h2 tabindex=" + i + ">&nbsp;"
                        + assunto.getDescricao() + "</h2>";
                i++;
                texto += "<p tabindex=" + i + ">"
                        + assunto.getDescricaoDetalhada() + "</p>";
                i++;
            }
        }

        if (request.getParameter("tela").compareToIgnoreCase(
                "InformacoesOuvidoria") == 0) {
            texto += "<a tabindex=2 title='Legislação' href='../ExibirMensagemGenerica.do?titulo=Legislação&tela=Legislacao' target='conteudo'>&nbsp;<font class='mapaSiteNiv2'><img src='images/bullet1b.gif'>&nbsp;Legislação</font></a><br>";
            texto += "<a tabindex=3 title='Tipos de Mensagem' href='../ExibirMensagemGenerica.do?titulo=Tipos de Mensagem&tela=TiposMensagem' target='conteudo'>&nbsp;<font class='mapaSiteNiv2'><img src='images/bullet1b.gif'>&nbsp;Tipos de Mensagem</font></a><br>";
            texto += "<a tabindex=4 title='Tipos de Assunto' href='../ExibirMensagemGenerica.do?titulo=Tipos de Assunto&tela=TiposAssunto' target='conteudo'>&nbsp;<font class='mapaSiteNiv2'><img src='images/bullet1b.gif'>&nbsp;Tipos de Assunto</font></a><br>";
            texto += "<a tabindex=5 title='Resultados da Ouvidoria' href='../ExibirResultadoOuvidoria.do?titulo=Resultados%20da%20Ouvidoria' target='conteudo'>&nbsp;<font class='mapaSiteNiv2'><img src='images/bullet1b.gif'>&nbsp;Resultados da Ouvidoria</font></a><br>";
        }

        if (request.getParameter("tela").compareToIgnoreCase("FaleOuvidoria") == 0) {
            texto += "<a tabindex=2 title='Acionamento' href='../acionamento/EnviarMensagemWeb.do' target='conteudo'>&nbsp;<font class='mapaSiteNiv2'><img src='images/bullet1b.gif'>&nbsp;Acionamento</font></a></label><br>";
            texto += "<a tabindex=3 title='Outros Canais de Comunicação' href='../ExibirMensagemGenerica.do?titulo=Outros Canais de Comunicação&tela=CanaisComunicacao' target='conteudo'>&nbsp;<font class='mapaSiteNiv2'><img src='images/bullet1b.gif'>&nbsp;Outros Canais de Comunicação</font></a><br>";
        }

        if (request.getParameter("funcionalidade") != null) {

            Long funcionarioId = (Long) request.getSession().getAttribute(Constants.PA_FUNCIONARIO);
            
        	FuncionarioCtrl funcionarioCtrl = new FuncionarioCtrl(getDaoFactory());
        	
        	Funcionario funcionario = (Funcionario) funcionarioCtrl.get(funcionarioId);  

            if (funcionario == null) {
                return mapping.findForward(Constants.LOGIN_FORWARD);
            }

            Funcionalidade funcionalidade = exibirMensagemGenericaCtrl
                    .getFuncionalidade(new Integer(request
                            .getParameter("funcionalidade")));
            List subFuncionalidades = exibirMensagemGenericaCtrl.getSubMenu(
                    funcionario, funcionalidade);

            Iterator iter;

            iter = subFuncionalidades.iterator();
            int i = 2;
            while (iter.hasNext()) {
                funcionalidade = (Funcionalidade) iter.next();
                texto += "<font class='mapaSiteNiv2'><img src='images/bullet1b.gif'>&nbsp;<a tabindex="
                        + i
                        + " title='"
                        + funcionalidade.getDescricao()
                        + "' href='.."
                        + funcionalidade.getPath()
                        + "'"
                        + " target='conteudo'>&nbsp;"
                        + funcionalidade.getDescricao() + "</a></font><br>";
                i++;
            }
        }

        if (request.getParameter("tela").compareToIgnoreCase("AjudaInternet") == 0) {
            texto += "<a tabindex=2 title='Tópicos da Ajuda' href='../Ajuda.do' target='conteudo'>&nbsp;<font class='mapaSiteNiv1'><img src='images/bullet1a.gif'>&nbsp;Tópicos de Ajuda</font></a><br>";
            texto += "<a tabindex=3 title='Mapa do Site' href='../ExibirMensagemGenerica.do?titulo=Mapa do Site&tela=MapaSiteInternet' target='conteudo'>&nbsp;<font class='mapaSiteNiv1'><img src='images/bullet1a.gif'>&nbsp;Mapa do Site</font></a><br>";
        }

        if (request.getParameter("tela").compareToIgnoreCase("AjudaIntranet") == 0) {
            texto += "<a tabindex=2 title='Tópicos da Ajuda' href='../Ajuda.do' target='conteudo'>&nbsp;<font class='mapaSiteNiv1'><img src='images/bullet1a.gif'>&nbsp;Tópicos de Ajuda</font></a><br>";
            texto += "<a tabindex=3 title='Mapa do Site' href='../ExibirMensagemGenerica.do?titulo=Mapa do Site&tela=MapaSiteIntranet' target='conteudo'>&nbsp;<font class='mapaSiteNiv1'><img src='images/bullet1a.gif'>&nbsp;Mapa do Site</font></a><br>";
        }

        if (request.getParameter("tela").compareToIgnoreCase("AjudaLogado") == 0) {
            texto += "<a tabindex=2 title='Tópicos da Ajuda' href='../Ajuda.do' target='conteudo'>&nbsp;<font class='mapaSiteNiv1'><img src='images/bullet1a.gif'>&nbsp;Tópicos de Ajuda</font></a><br>";
            texto += "<a tabindex=3 title='Mapa do Site' href='../ExibirMensagemGenerica.do?titulo=Mapa do Site&tela=MapaSiteLogado' target='conteudo'>&nbsp;<font class='mapaSiteNiv1'><img src='images/bullet1a.gif'>&nbsp;Mapa do Site</font></a><br>";
        }
        
        if (request.getParameter("tela")
                .compareToIgnoreCase("MapaSiteInternet") == 0) {
            texto += "<a tabindex=2 title='Sistema Ouvidoria' href='../Main.do' target='conteudo'>&nbsp;<font class='mapaSiteNiv1'><img src='images/bullet1a.gif'>&nbsp;Sistema Ouvidoria</font></a><br>";
            texto += "<a tabindex=3 title='Fale com a Ouvidoria' href='../acionamento/EnviarMensagemWeb.do' target='conteudo'>&nbsp;<font class='mapaSiteNiv1Pai'><img src='images/bullet1a.gif'>&nbsp;Fale com a Ouvidoria</font></a><br>";
            texto += "<a tabindex=3 title='Acionamento' href='../acionamento/EnviarMensagemWeb.do' target='conteudo'>&nbsp;<font class='mapaSiteNiv2'><img src='images/bullet1b.gif'>&nbsp;Acionamento</font></a><br>";
            texto += "<a tabindex=3 title='Outros Canais de Comunicação' href='../ExibirMensagemGenerica.do?titulo=Outros Canais de Comunicação&tela=CanaisComunicacao' target='conteudo'>&nbsp;<font class='mapaSiteNiv2'><img src='images/bullet1b.gif'>&nbsp;Outros Canais de Comunicação</font></a><br>";
            texto += "<a tabindex=4 title='Consulte sua Resposta' href='../andamento/ConsultarResposta.do' target='conteudo'>&nbsp;<font class='mapaSiteNiv1'><img src='images/bullet1a.gif'>&nbsp;Consulte sua Resposta</font></a><br>";
            texto += "<a tabindex=5 title='Informações da Ouvidoria' href='../ExibirMensagemGenerica.do?titulo=Informações da Ouvidoria&tela=InformacoesOuvidoria' target='conteudo'>&nbsp;<font class='mapaSiteNiv1Pai'><img src='images/bullet1a.gif'>&nbsp;Informações da Ouvidoria</font></a><br>";
            texto += "<a tabindex=6 title='Legislação' href='../ExibirMensagemGenerica.do?titulo=Legislação&tela=Legislacao' target='conteudo'>&nbsp;<font class='mapaSiteNiv2'><img src='images/bullet1b.gif'>&nbsp;Legislação</font></a><br>";
            texto += "<a tabindex=7 title='Tipos de Mensagem' href='../ExibirMensagemGenerica.do?titulo=Tipos de Mensagem&tela=TiposMensagem' target='conteudo'>&nbsp;<font class='mapaSiteNiv2'><img src='images/bullet1b.gif'>&nbsp;Tipos de Mensagem</font></a><br>";
            texto += "<a tabindex=8 title='Tipos de Assunto' href='../ExibirMensagemGenerica.do?titulo=Tipos de Assunto&tela=TiposAssunto' target='conteudo'>&nbsp;<font class='mapaSiteNiv2'><img src='images/bullet1b.gif'>&nbsp;Tipos de Assunto</font></a><br>";
            texto += "<a tabindex=9 title='Resultados da Ouvidoria' href='../ExibirResultadoOuvidoria.do?titulo=Resultados%20da%20Ouvidoria' target='conteudo'>&nbsp;<font class='mapaSiteNiv2'><img src='images/bullet1b.gif'>&nbsp;Resultados da Ouvidoria</font></a><br>";
            texto += "<a tabindex=10 title='Ajuda' href='../ExibirMensagemGenerica.do?titulo=Ajuda&tela=AjudaInternet' target='conteudo'>&nbsp;<font class='mapaSiteNiv1Pai'><img src='images/bullet1a.gif'>&nbsp;Ajuda</font></a><br>";
            texto += "<a tabindex=11 title='Tópico da Ajuda' href='../Ajuda.do' target='conteudo'>&nbsp;<font class='mapaSiteNiv2'><img src='images/bullet1b.gif'>&nbsp;Tópicos da Ajuda</font></a><br>";
            texto += "<a tabindex=12 title='Mapa do Site' href='../ExibirMensagemGenerica.do?titulo=Mapa do Site&tela=MapaSiteInternet' target='conteudo'>&nbsp;<font class='mapaSiteNiv2'><img src='images/bullet1b.gif'>&nbsp;Mapa do Site</font></a><br>";
        }

        if (request.getParameter("tela")
                .compareToIgnoreCase("MapaSiteIntranet") == 0) {
            texto += "<a tabindex=2 title='Sistema Ouvidoria' href='../Main.do' target='conteudo'>&nbsp;<font class='mapaSiteNiv1'><img src='images/bullet1a.gif'>&nbsp;Sistema Ouvidoria</font></a><br>";
            texto += "<a tabindex=3 title='Fale com a Ouvidoria' href='../acionamento/EnviarMensagemWeb.do' target='conteudo'>&nbsp;<font class='mapaSiteNiv1'><img src='images/bullet1a.gif'>&nbsp;Fale com a Ouvidoria</font></a><br>";
            texto += "<a tabindex=3 title='Acionamento' href='../acionamento/EnviarMensagemWeb.do' target='conteudo'>&nbsp;<font class='mapaSiteNiv2'><img src='images/bullet1b.gif'>&nbsp;Acionamento</font></a><br>";
            texto += "<a tabindex=3 title='Outros Canais de Comunicação' href='../ExibirMensagemGenerica.do?titulo=Outros Canais de Comunicação&tela=CanaisComunicacao' target='conteudo'>&nbsp;<font class='mapaSiteNiv2'><img src='images/bullet1b.gif'>&nbsp;Outros Canais de Comunicação</font></a><br>";
            texto += "<a tabindex=4 title='Consulte sua Resposta' href='../andamento/ConsultarResposta.do' target='conteudo'>&nbsp;<font class='mapaSiteNiv1'><img src='images/bullet1a.gif'>&nbsp;Consulte sua Resposta</font></a><br>";
            texto += "<a tabindex=5 title='Informações da Ouvidoria' href='../ExibirMensagemGenerica.do?titulo=Informações da Ouvidoria&tela=InformacoesOuvidoria' target='conteudo'>&nbsp;<font class='mapaSiteNiv1Pai'><img src='images/bullet1a.gif'>&nbsp;Informações da Ouvidoria</font></a><br>";
            texto += "<a tabindex=6 title='Legislação' href='../ExibirMensagemGenerica.do?titulo=Legislação&tela=Legislacao' target='conteudo'>&nbsp;<font class='mapaSiteNiv2'><img src='images/bullet1b.gif'>&nbsp;Legislação</font></a><br>";
            texto += "<a tabindex=7 title='Tipos de Mensagem' href='../ExibirMensagemGenerica.do?titulo=Tipos de Mensagem&tela=TiposMensagem' target='conteudo'>&nbsp;<font class='mapaSiteNiv2'><img src='images/bullet1b.gif'>&nbsp;Tipos de Mensagem</font></a><br>";
            texto += "<a tabindex=8 title='Tipos de Assunto' href='../ExibirMensagemGenerica.do?titulo=Tipos de Assunto&tela=TiposAssunto' target='conteudo'>&nbsp;<font class='mapaSiteNiv2'><img src='images/bullet1b.gif'>&nbsp;Tipos de Assunto</font></a><br>";
            texto += "<a tabindex=9 title='Resultados da Ouvidoria' href='../ExibirResultadoOuvidoria.do?titulo=Resultados%20da%20Ouvidoria' target='conteudo'>&nbsp;<font class='mapaSiteNiv2'><img src='images/bullet1b.gif'>&nbsp;Resultados da Ouvidoria</font></a><br>";
            texto += "<a tabindex=10 title='Ajuda' href='../ExibirMensagemGenerica.do?titulo=Ajuda&tela=AjudaIntranet' target='conteudo'>&nbsp;<font class='mapaSiteNiv1Pai'><img src='images/bullet1a.gif'>&nbsp;Ajuda</font></a><br>";
            texto += "<a tabindex=11 title='Tópico da Ajuda' href='../Ajuda.do' target='conteudo'>&nbsp;<font class='mapaSiteNiv2'><img src='images/bullet1b.gif'>&nbsp;Tópicos da Ajuda</font></a><br>";
            texto += "<a tabindex=12 title='Mapa do Site' href='../ExibirMensagemGenerica.do?titulo=Mapa do Site&tela=MapaSiteIntranet' target='conteudo'>&nbsp;<font class='mapaSiteNiv2'><img src='images/bullet1b.gif'>&nbsp;Mapa do Site</font></a><br>";

        }

        if (request.getParameter("tela").compareToIgnoreCase("MapaSiteLogado") == 0) {

            Long funcionarioId = (Long) request.getSession().getAttribute(Constants.PA_FUNCIONARIO);
            
        	FuncionarioCtrl funcionarioCtrl = new FuncionarioCtrl(getDaoFactory());
        	
        	Funcionario funcionario = (Funcionario) funcionarioCtrl.get(funcionarioId);

            if (funcionario == null) {
                return mapping.findForward(Constants.LOGIN_FORWARD);
            }

            Funcionalidade funcionalidade;
            Funcionalidade funcionalidadeSub;
            List lista = exibirMensagemGenericaCtrl.getMenu(funcionario);
            Collection listaSubItem = new ArrayList();

            class FuncionalidadeComparator implements Comparator {
                public final int compare(Object a, Object b) {
                    return (((Funcionalidade) a).getOrdemItemMenu())
                            .compareTo((((Funcionalidade) b).getOrdemItemMenu()));
                } // end compare
            } // end class StringComparator

            Collections.sort(lista, new FuncionalidadeComparator());

            Iterator iter;
            Iterator iter2;

            iter = lista.iterator();

            texto += "<a tabindex=2 title='Sistema Ouvidoria' href='../Main.do' target='conteudo'>&nbsp;<font class='mapaSiteNiv1'><img src='images/bullet1a.gif'>&nbsp;Sistema Ouvidoria</font></a><br>";
            int i = 3;
            while (iter.hasNext()) {
                funcionalidade = (Funcionalidade) iter.next();

                if (funcionalidade.getListaSubItemMenu(funcionario).size() > 0) {
                    texto += "<a tabindex=" + i + " title='"
                            + funcionalidade.getDescricao()
                            + "'"
                            + " href='.."
                            + funcionalidade.getPath()
                            + "'"
                            + " target='conteudo'>&nbsp;<font class='mapaSiteNiv1Pai'><img src='images/bullet1a.gif'>&nbsp;"
                            + funcionalidade.getDescricao()
                            + "</font></a><br>";
                    i++;
                    listaSubItem = funcionalidade
                            .getListaSubItemMenu(funcionario);
                    iter2 = listaSubItem.iterator();
                    while (iter2.hasNext()) {
                        funcionalidadeSub = (Funcionalidade) iter2.next();
                        texto += "<a tabindex=" + i + " title='"
                                + funcionalidadeSub.getDescricao()
                                + "'"
                                + " href='.."
                                + funcionalidadeSub.getPath()
                                + "'"
                                + " target='conteudo'>&nbsp;<font class='mapaSiteNiv2'><img src='images/bullet1b.gif'>&nbsp;"
                                + funcionalidadeSub.getDescricao()
                                + "</font></a><br>";
                        i++;

                    }
                } else {
                    texto += "<a tabindex=" + i + " title='"
                            + funcionalidade.getDescricao()
                            + "'"
                            + " href='.."
                            + funcionalidade.getPath()
                            + "'"
                            + " target='conteudo'>&nbsp;<font class='mapaSiteNiv1'><img src='images/bullet1a.gif'>&nbsp;"
                            + funcionalidade.getDescricao()
                            + "</font></a><br>";
                    i++;
                }
            }
        }

        if (request.getParameter("tela").equalsIgnoreCase("Ajuda")) {
		    texto = request.getParameter("texto");
        }
        
        request.setAttribute("titulo", request.getParameter("titulo"));
        request.setAttribute("texto", texto);

        if (errors.isEmpty()) {
            return (mapping.findForward("success"));
        }
        return (mapping.findForward("failure"));
    }

}