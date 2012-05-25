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

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.actions.DispatchAction;

import br.gov.serpro.ouvidoria.controller.HistoricoCtrl;
import br.gov.serpro.ouvidoria.controller.gerencial.administracao.FuncionarioCtrl;
import br.gov.serpro.ouvidoria.controller.gerencial.administracao.OrgaoCtrl;
import br.gov.serpro.ouvidoria.dao.DaoException;
import br.gov.serpro.ouvidoria.dao.DaoFactory;
import br.gov.serpro.ouvidoria.dao.hibernate.HibernateDaoFactory;
import br.gov.serpro.ouvidoria.model.Acionamento;
import br.gov.serpro.ouvidoria.model.Funcionario;
import br.gov.serpro.ouvidoria.model.Orgao;
import br.gov.serpro.ouvidoria.util.Constants;

/**
 * Objetivo: Extender as funcionalidades básicas de um Action
 * 
 * @author SERPRO
 * @version $Revision: 1.1.2.4 $, $Date: 2011/10/20 15:30:34 $
 * @version 0.1, Date: 11/11/2004
 */
public class DispatchActionSupport extends DispatchAction implements Support {

    protected Orgao orgao;

    protected DaoFactory daoFactory;

    /**
     * Gera o histórico das Funcionalidades que não requerem Acionamento
     * 
     * @param request
     */
    public void geraHistorico(HttpServletRequest request) {
        geraHistorico(request, null);
    }

    /**
     * Gera o historico da Funcionalidade
     * 
     * @param request
     * @param acionamento
     */
    public void geraHistorico(HttpServletRequest request,
            final Acionamento acionamento) {

        String funcionalidade = (String) request
                .getAttribute(Constants.SR_FUNCIONALIDADE);

        if (funcionalidade != null && funcionalidade.trim().length() > 0) {

            HistoricoCtrl historico = new HistoricoCtrl(
                    new HibernateDaoFactory());

                        
            Long funcionarioId = (Long) request.getSession().getAttribute(Constants.PA_FUNCIONARIO);
            
            try {
                
            	FuncionarioCtrl funcionarioCtrl = new FuncionarioCtrl(getDaoFactory());
            	
            	Funcionario funcionario = (Funcionario) funcionarioCtrl.get(funcionarioId);  
            	
                historico.Log(funcionario, funcionalidade, acionamento);
            } catch (DaoException e) {
                if (Constants.DEBUG) {
                    e.printStackTrace();
                }
            }

            historico = null;
        }

    }

    public Orgao getOrgao(HttpServletRequest request) {
    	String osessionId = (String) request.getSession().getAttribute(Constants.ID_SESSAO_ORGAO);
    	
		OrgaoCtrl orgaoCtrl = new OrgaoCtrl(daoFactory);
		
        return (Orgao) orgaoCtrl.get(osessionId);
    }
    
    
    public Funcionario getFuncionario(HttpServletRequest request){
    	
    	Funcionario funcionario = null;
    	
        Long funcionarioId = (Long) request.getSession().getAttribute(Constants.PA_FUNCIONARIO);
        
        if (funcionarioId == null){
        	return null;
        }
        
        FuncionarioCtrl funcionarioCtrl = new FuncionarioCtrl(daoFactory);   	
    	
		try {
			funcionario = (Funcionario) funcionarioCtrl.get(funcionarioId);			
		} catch (DaoException e) {
			e.printStackTrace();
		}
		return funcionario;
    } 
    


    public final DaoFactory getDaoFactory() {
        return daoFactory;
    }

    public void setDaoFactory(DaoFactory daoFactory) {
        this.daoFactory = daoFactory;
    }
}