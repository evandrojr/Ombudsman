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

import java.util.Collection;
import java.util.Comparator;
import java.util.Iterator;
import java.util.TreeSet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.ActionMessages;

import br.gov.serpro.ouvidoria.controller.gerencial.administracao.FuncionarioCtrl;
import br.gov.serpro.ouvidoria.dao.DaoFactory;
import br.gov.serpro.ouvidoria.dao.hibernate.HibernateDaoFactory;
import br.gov.serpro.ouvidoria.model.Assunto;
import br.gov.serpro.ouvidoria.model.Funcionario;
import br.gov.serpro.ouvidoria.model.Instituicao;
import br.gov.serpro.ouvidoria.model.Orgao;
import br.gov.serpro.ouvidoria.model.PersistentObject;
import br.gov.serpro.ouvidoria.model.Protocolo;
import br.gov.serpro.ouvidoria.model.SubOrgao;
import br.gov.serpro.ouvidoria.model.EstadoAcionamento;
import br.gov.serpro.ouvidoria.struts.ActionSupport;
import br.gov.serpro.ouvidoria.util.Constants;

/**
 * Recupera os dados utilizados na view consultarAndamentoSolucao.jsp
 * 
 * @author SERPRO
 * @version $Revision: 1.1.2.3 $, $Date: 2011/10/18 17:57:04 $
 * @version 0.1, 2004/12/15
 */
public class ConsultarAndamentoSolucaoControllerAction extends ActionSupport {

    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        ActionMessages errors = new ActionMessages();

        try {
            DaoFactory daoFactory = new HibernateDaoFactory();

            request.setAttribute("txt_periodo_i", "");
            request.setAttribute("txt_periodo_f", "");

            request.setAttribute("sel_ouvidoria", "");
            request.setAttribute("sel_assunto", "");
            request.setAttribute("sel_tipo_mensagem", "");
            request.setAttribute("sel_situacao", "");

            request.setAttribute("txt_protocolo", "");
            request.setAttribute("txt_palavra_chave", "");

            Long funcionarioId = (Long) request.getSession().getAttribute(Constants.PA_FUNCIONARIO);
            
        	FuncionarioCtrl funcionarioCtrl = new FuncionarioCtrl(getDaoFactory());
        	
        	Funcionario funcionario = (Funcionario) funcionarioCtrl.get(funcionarioId);  

            Orgao orgao = getOrgao(request);

            Collection assuntos = null; 
            if ( funcionario.getNivelAtuacao() == Funcionario.NA_ORGAO) {
                assuntos = orgao.getListaAssuntosSubOrgaos();  
            } else {
                Comparator ordem = new Comparator() {
                    public int compare(Object obj1, Object obj2) {
                        PersistentObject pobj1 = (PersistentObject) obj1;
                        PersistentObject pobj2 = (PersistentObject) obj2;
                        if (pobj1 != null && pobj1.getDescricao() != null) {
                            return pobj1.getDescricao().compareTo(pobj2.getDescricao());
                        }
                        return 0;
                    }
                };

                assuntos = new TreeSet(ordem);
                for(Iterator iter=funcionario.getListaSubOrgaosAtivos().iterator(); iter.hasNext(); ) {
                    SubOrgao subOrgao = (SubOrgao) iter.next();
                    assuntos.addAll(subOrgao.getListaAssunto(Assunto.ATIVO));
                }
            }
            
            Collection tipoMsg = orgao.getListaTipoMensagem();

            // Qual classe representa ouvidorias ?
            request.setAttribute("cas_ouvidorias", daoFactory.create(
                    Instituicao.class).list());

            request.setAttribute("cas_assuntos", assuntos);

            request.setAttribute("cas_tipos_mensagem", tipoMsg);

            request.setAttribute("cas_protocolos", daoFactory.create(
                    Protocolo.class).list());
            
            request.setAttribute("cas_situacao_mensagem", daoFactory.create(
                    EstadoAcionamento.class).list());

        } catch (Throwable t) {
            errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
                    "error.solucao.excecao"));
        }

        if (errors.isEmpty()) {
            return mapping.findForward("success");
        }

        saveErrors(request, errors);
        return mapping.findForward("failure");
    }

}