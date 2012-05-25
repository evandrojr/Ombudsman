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
package br.gov.serpro.ouvidoria.controller.andamento;

import java.sql.Timestamp;
import java.util.Iterator;
import java.util.List;

import br.gov.serpro.ouvidoria.dao.Dao;
import br.gov.serpro.ouvidoria.dao.DaoException;
import br.gov.serpro.ouvidoria.dao.DaoFactory;
import br.gov.serpro.ouvidoria.model.Assunto;
import br.gov.serpro.ouvidoria.model.EstadoScript;
import br.gov.serpro.ouvidoria.model.Funcionario;
import br.gov.serpro.ouvidoria.model.Script;

/**
 * Objetivo: Controlar as operações sobre os objetos relacionados à parte de
 * recuperar scripts da funcionalidade Consultar Banco de Scripts.
 *
 * @author SERPRO
 * @version $Revision: 1.1.2.4 $, $Date: 2011/10/18 17:55:13 $
 * @version 0.1, Date: 2004/12/17
 */
public class ConsultarBancoScriptsCtrl {
    
    /** atributo para datasource do script */
    /* Requerido */
    private Dao scriptDao;
    
    /**
     * Construtor recebendo objeto Dao
     */
    public ConsultarBancoScriptsCtrl(final DaoFactory daoFactory) {
        scriptDao = daoFactory.create(Script.class);
    }
    
    /**
     * Método para recuperar um script a partir de um id
     *
     * @param id
     *            identificador do script
     */
    public Script get(Long id) throws DaoException {
        if (id == null) {
            throw new DaoException("ID do Objeto não pode ser nulo.");
        }
        return (Script) scriptDao.get(id);
    }
    
    /**
     * Método para consultar os scripts do BD de acordo com os parámetros
     * informados
     *
     * @param pTexto
     *            texto a ser buscado no titulo ou texto do script
     * @param pAssunto
     *            Assunto do script a ser consultado
     * @param pFunc
     *            Funcionário logado
     * @param pSituacao
     *            Situação dos assuntos
     *
     */
    public List ListarScript(String pTexto, final String pAssunto, Funcionario pFunc,
            String pSituacao) throws DaoException {
        
        String lsFrom = "Select s from Script as s";
        String lsTexto = "";
        String lsOrdem = " order by s.titulo";
        String lsQuery = "";
        String lsAssunto = "";
        String lsEstadoScript = "";
        List listaScript = null;
        List listaAssunto = null;
        Assunto assunto;
        Iterator iter;
        
        // filtra pelo texto informado
        lsTexto = " Where (s.descricao LIKE '%" + pTexto + "%' OR"
                + " s.titulo LIKE '%" + pTexto + "%')";
        
        // Verifica se foi selecionado um assunto
        if (!pAssunto.equalsIgnoreCase("0")) {
            Timestamp hoje = new Timestamp(System.currentTimeMillis());
            
            lsAssunto = " and s.assunto.id = " + pAssunto;
            
            if (pSituacao.equalsIgnoreCase("Ativo")) {
                lsAssunto += " and ( s.assunto.dataVigencia >= '" + hoje + "' "
                        + "    or s.assunto.dataVigencia = 00000000  "
                        + "    or s.assunto.dataVigencia is null ) ";
            } else if (pSituacao.equalsIgnoreCase("Inativo")) {
                lsAssunto += " and ( s.assunto.dataVigencia <  '" + hoje + "' "
                        + "    and s.assunto.dataVigencia <> 00000000  "
                        + "    and not s.assunto.dataVigencia is null ) ";
            }
            
        }
        /* Caso não tenha sido selecionado um assunto, traz-se 
         * apenas os scripts cujo assunto esteja associado ao funcionario
         * através do relacionamento de atuação */
        else {
            // Filtra por assuntos na situação informada para o funcionario logado
            listaAssunto = pFunc.getListaAssuntosComAtuacao(pSituacao);
            
            // Varre os assuntos pegando seus respectivos IDs
            if (listaAssunto != null) {
                lsAssunto = " and (";
                iter = listaAssunto.iterator();
                while (iter.hasNext()) {
                    assunto = (Assunto) iter.next();
                    lsAssunto = lsAssunto + " s.assunto.id = "
                            + assunto.getId() + " or";
                }
                // retirar último " or"
                lsAssunto = lsAssunto.substring(0, (lsAssunto.length() - 3));
                lsAssunto = lsAssunto + ")";
                
            } else {
                // se o funcionario não atua em nenhum assunto, filtra para não
                // trazer nada
                lsAssunto = lsAssunto + " and s.assunto.id IS NULL";
            }
        }
        
        // filtra o estado do script
        lsEstadoScript = " and s.estado.id = " + EstadoScript.APROVADO.getId();
        
        // monta a string com a query
        lsQuery = lsFrom + lsTexto + lsAssunto + lsEstadoScript + lsOrdem;
        
        // Recupera lista de script
        listaScript = scriptDao.query(lsQuery);
        
        return listaScript;
    }
    
}