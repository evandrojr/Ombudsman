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

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.ActionMessages;
import org.apache.struts.action.DynaActionForm;
import org.hibernate.Query;
import org.hibernate.Session;

import br.gov.serpro.ouvidoria.controller.AcionamentoCtrl;
import br.gov.serpro.ouvidoria.controller.gerencial.administracao.FuncionarioCtrl;
import br.gov.serpro.ouvidoria.dao.DaoException;
import br.gov.serpro.ouvidoria.dao.hibernate.HibernateDao;
import br.gov.serpro.ouvidoria.model.Acionamento;
import br.gov.serpro.ouvidoria.model.ConsultaAndamento;
import br.gov.serpro.ouvidoria.model.Funcionario;
import br.gov.serpro.ouvidoria.model.Orgao;
import br.gov.serpro.ouvidoria.struts.ActionSupport;
import br.gov.serpro.ouvidoria.util.Constants;
import br.gov.serpro.ouvidoria.util.HibernateSessionFactory;
import br.gov.serpro.ouvidoria.util.Utilitario;

/**
 * Objetivo: Ouvidor Geral e Ouvidor Assistente solicita consultar o andamento de uma
 * mensagem. Para isso ele informa um ou mais dos itens abaixo:
 * <ul>
 * <li>O tipo da mensagem</li>
 * <li>Tipo do assunto</li>
 * <li>O número do protocolo</li>
 * <li>Palavras chaves para busca</li>
 * <li>Período de cadastramento</li>
 * </ul>
 * 
 * @author SERPRO
 * @version $Revision: 1.1.2.4 $, $Date: 2011/11/11 21:09:55 $
 * @version 0.1, 2004/12/15
 */
public class ConsultarAndamentoSolucaoAction extends ActionSupport {
    
	
    private List filtrarPalavraChave(List lstAcionamento,String palavraChave)
    {
    	Iterator iterator = lstAcionamento.iterator(); 
    	ArrayList list = new ArrayList();
    	
    	   while (iterator.hasNext())
    	   {
    		   ConsultaAndamento consultaAndamento = (ConsultaAndamento)iterator.next();
    		   
    		     if (((consultaAndamento.getTitulo()!=null) && (consultaAndamento.getTitulo().trim()!= "")) ||
    		    	 ((consultaAndamento.getDescricao()!=null) && (consultaAndamento.getDescricao().trim()!= ""))) 
    		     {
    		    	String tituloDec = new String(Utilitario.decrypt(Constants.DES_KEY, consultaAndamento.getTitulo()));
    		    	String textoDec  = new String(Utilitario.decrypt(Constants.DES_KEY, consultaAndamento.getDescricao()));    		    	

    		    	String titulo    = new String(tituloDec==null?"":tituloDec);
    		        String texto     = new String(textoDec==null?"":textoDec);    		       	
    		        String chave     = titulo + texto;
    		        
    		          if  (chave.toLowerCase().indexOf(palavraChave.toLowerCase())==-1)
    		        	 list.add(consultaAndamento);
    		     }
    		     else
    			   list.add(consultaAndamento);   
    	   }
    	
    	lstAcionamento.removeAll(list);
    	   
    	return lstAcionamento;
    }
	
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        
        ActionMessages errors = new ActionMessages();
        
        try {
            //obter do Form os dados para pesquisa
            DynaActionForm _form = (DynaActionForm) form;
            
            String periodoI = _form.getString("txt_periodo_i");
            String periodoF = _form.getString("txt_periodo_f");
            
            String assuntoId = _form.getString("sel_assunto");
            String tipoMensagemId = _form.getString("sel_tipo_mensagem");
            String estadoAcionamento = _form.getString("sel_situacao_mensagem");
            
            String sProtocolo = _form.getString("txt_protocolo");
            String palavraChave = Utilitario.trataPlic(_form.getString("txt_palavra_chave"));
            
            //	Recupera o Funcionário logado
            Long funcionarioId = (Long) request.getSession().getAttribute(Constants.PA_FUNCIONARIO);
            FuncionarioCtrl funcionarioCtrl = new FuncionarioCtrl(getDaoFactory());
            Funcionario func = (Funcionario) funcionarioCtrl.get(funcionarioId);
            
            // Recupera o órgão do funcionário
            Orgao orgao = getOrgao(request);
            
            //obter os assuntos sob a responsabilidade do funcionário
            Collection assuntosFuncionario = null;
            if ( func.getNivelAtuacao() == Funcionario.NA_SUB_ORGAO ) {
                assuntosFuncionario = func.getListaAssuntosComAtuacao("Ambos");
            } else if ( func.getNivelAtuacao() == Funcionario.NA_ORGAO ) {
                assuntosFuncionario = orgao.getListaTodosAssuntos();
            }
            
            /**
             * ESTE MÉTODO AINDA NÃO ESTÁ FUNCIONANDO 100%. INVESTIGAR PROBLEMA:
             *  Caused by: line 1:41: expecting EQ, found '.'
             * */
            
            //montar consulta HQL
			StringBuffer hql = new StringBuffer();
			hql.append("Select new br.gov.serpro.ouvidoria.model.ConsultaAndamento(a.id,");
			hql.append(" a.dataPrevistaResolucaoExterna, a.estadoAcionamento.descricao,");
			hql.append(" ass.descricao, a.numeroProtocolo,");
			hql.append(" a.dataPrevistaResolucaoInterna, a.funcionario.nome, a.estadoAcionamento.id ");
			
			// Caso o filtro tenha sido preenchido
			if (!palavraChave.trim().equals("")) {
				hql.append(", a.respostaAcionamento.titulo, a.respostaAcionamento.texto ) ");
        	} else {
        		hql.append(" )");
        	}
            		    
            hql.append(" from Acionamento as a ");
            hql.append(" inner join a.funcionario as f ");
            hql.append(" inner join a.mensagem as m ");
            hql.append(" inner join m.assunto as ass ");
            hql.append(" inner join a.estadoAcionamento as ea ");
            
            if (!palavraChave.trim().equals(""))
                hql.append(" left outer join a.respostaAcionamento as resp ");
                        
            hql.append(" where ass in (:assuntos) ");
            
            //assunto
            if ( assuntoId != null && !"".equals(assuntoId) && !"0".equals(assuntoId) ) {
                hql.append(" and ass.id = :assId ");
            }
            
            //tipo de mensagem
            if ( tipoMensagemId != null && !"".equals(tipoMensagemId) && !"0".equals(tipoMensagemId) ) {
                hql.append(" and m.tipoMensagem.id = :tipoMsgId ");
            }
            
            //período (data inicial e data final)
            if ( periodoI != null && !"".equals(periodoI) ) {
                hql.append(" and a.dataAcionamento >= :dataIni ");
            }
            
            if ( periodoF != null && !"".equals(periodoF) ) {
                hql.append(" and a.dataAcionamento <= :dataFim ");
            }
            
            //protocolo
            if ( sProtocolo != null && !"".equals(sProtocolo) && !"0".equals(sProtocolo) ) {
                hql.append(" and a.numeroProtocolo = :numProtoc ");
            }
            
            //estado da mensagem
            if ( !estadoAcionamento.equalsIgnoreCase("0") ) {
                hql.append(" and a.estadoAcionamento.id = :estadoId ");
            }                   
            
            // obter o objeto DAO
            HibernateDao acionamentoDao = (HibernateDao) getDaoFactory().create( Acionamento.class );
            
            // montar a query Hibernate
            Session session = HibernateSessionFactory.getFactory().getSession();
            Query query = session.createQuery( hql.toString() );
            SimpleDateFormat dateFormatter = new SimpleDateFormat( "dd/MM/yyyy HH:mm:ss" );
            
            //configurar os parâmetros da query
            query.setParameterList( "assuntos", assuntosFuncionario );
            
            if ( assuntoId != null && !"".equals(assuntoId) && !"0".equals(assuntoId) ) {
                //assunto
                query.setInteger( "assId", Integer.parseInt( assuntoId ) );
            }
            if ( tipoMensagemId != null && !"".equals(tipoMensagemId) && !"0".equals(tipoMensagemId) ) {
                //tipo de mensagem
                query.setInteger( "tipoMsgId", Integer.parseInt( tipoMensagemId ) );
            }
            
            if ( periodoI != null && !"".equals(periodoI) ) {
                //data inicial
                periodoI = periodoI +" 00:00:00";
            	Date dataInit = dateFormatter.parse( periodoI );
                query.setTimestamp( "dataIni", dataInit );
            }
            if ( periodoF != null && !"".equals(periodoF) ) {
                //na data fim acrescentar a última hora do dia
                
                Date dataFim = dateFormatter.parse( periodoF+" 23:59:59");
                
                query.setTimestamp( "dataFim", dataFim);
            }
            if ( sProtocolo != null && !"".equals(sProtocolo) && !"0".equals(sProtocolo) ) {
                //protocolo
                query.setInteger( "numProtoc", Integer.parseInt( sProtocolo ) );
            }

            if ( !estadoAcionamento.equalsIgnoreCase("0") ) {
                //estado da mensagem
                query.setInteger( "estadoId", Integer.parseInt( estadoAcionamento ) );
            }
            
            // obter os acionamentos para atualizar seus estados
            List results = acionamentoDao.query( query );
            
              if (!palavraChave.trim().equals(""))
            	  results = filtrarPalavraChave(results, palavraChave);
             
            // atualizar os estados dos acionamentos
            AcionamentoCtrl acionCtrl = new AcionamentoCtrl( getDaoFactory() );
            boolean result = acionCtrl.atualizaEstadoAcionamentos(results);
            
            //verificar se houve erros na atualização de estado
            if (result == false) {
                errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
                        "error.acionamento.atualizaestado"));
            }
                                    
            //Remontar a query Hibernate
            session = HibernateSessionFactory.getFactory().getSession();
            query = session.createQuery( hql.toString() );
            dateFormatter = new SimpleDateFormat( "dd/MM/yyyy HH:mm:ss" );
            
            //configurar os parâmetros da query
            query.setParameterList( "assuntos", assuntosFuncionario );
            
            if ( assuntoId != null && !"".equals(assuntoId) && !"0".equals(assuntoId) ) {
                //assunto
                query.setInteger( "assId", Integer.parseInt( assuntoId ) );
            }
            if ( tipoMensagemId != null && !"".equals(tipoMensagemId) && !"0".equals(tipoMensagemId) ) {
                //tipo de mensagem
                query.setInteger( "tipoMsgId", Integer.parseInt( tipoMensagemId ) );
            }
            
            if ( periodoI != null && !"".equals(periodoI) ) {
                //data inicial
                periodoI = periodoI +" 00:00:00";
            	Date dataInit = dateFormatter.parse( periodoI );
                query.setTimestamp( "dataIni", dataInit );
            }
            if ( periodoF != null && !"".equals(periodoF) ) {
                //na data fim acrescentar a última hora do dia
                
                Date dataFim = dateFormatter.parse( periodoF+" 23:59:59");
                
                query.setTimestamp( "dataFim", dataFim);
            }
            if ( sProtocolo != null && !"".equals(sProtocolo) && !"0".equals(sProtocolo) ) {
                //protocolo
                query.setInteger( "numProtoc", Integer.parseInt( sProtocolo ) );
            }

            if ( !estadoAcionamento.equalsIgnoreCase("0") ) {
                //estado da mensagem
                query.setInteger( "estadoId", Integer.parseInt( estadoAcionamento ) );
            }
            
            // obter o objeto DAO
            acionamentoDao = (HibernateDao) getDaoFactory().create( Acionamento.class );
            
            // obter os acionamentos da consulta após a atualização dos estados do acionamento
            results = acionamentoDao.query( query );
            
            if (!palavraChave.trim().equals(""))
          	  results = filtrarPalavraChave(results, palavraChave);
            
            request.setAttribute("CAS_RESULTS", results);
        } catch (DaoException e) {
            if (Constants.DEBUG) {
                e.printStackTrace();
            }
            
            errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage("error.solucao.excecao"));
        }
        
        geraHistorico(request);
        
        if (errors.isEmpty()) {
            return mapping.findForward("success");
        }
        
        saveErrors(request, errors);
        
        return mapping.findForward("failure");
    }
    
}