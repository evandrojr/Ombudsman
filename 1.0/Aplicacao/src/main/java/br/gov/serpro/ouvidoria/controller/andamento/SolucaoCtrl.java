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
import java.util.List;

import br.gov.serpro.ouvidoria.dao.Dao;
import br.gov.serpro.ouvidoria.dao.DaoException;
import br.gov.serpro.ouvidoria.dao.DaoFactory;
import br.gov.serpro.ouvidoria.model.EstadoScript;
import br.gov.serpro.ouvidoria.model.EstadoSolucao;
import br.gov.serpro.ouvidoria.model.Funcionario;
import br.gov.serpro.ouvidoria.model.Orgao;
import br.gov.serpro.ouvidoria.model.Solucao;

/**
 * Objetivo: Controlar as operações sobre os objetos Solução, inclusive
 * persistindo os mesmos
 * 
 * @author SERPRO
 * @version $Revision: 1.1.2.3 $, $Date: 2011/10/18 17:55:13 $
 * @version 0.1, Date: 2004/11/19
 *  
 */
public class SolucaoCtrl {

    /** campo para datasource */
    private Dao solucaoDao;

    /**
     * Construtor "default"
     */
    public SolucaoCtrl() {
        // DO NOTHING
    }

    /**
     * Construtor recebendo objeto Dao
     */
    public SolucaoCtrl(final DaoFactory daoFactory) {
        solucaoDao = daoFactory.create(Solucao.class);
    }

    /**
     * Método para recuperar a Solução a partir de um id
     * 
     * @param id
     *            identificador da solução
     */
    public Solucao get(Long id) throws DaoException {
        if (id == null) {
            throw new DaoException("ID do Objeto não pode ser nulo.");
        }
        return (Solucao) solucaoDao.get(id);
    }

    /**
     * Método para persistir a Solução no BD
     * 
     * @param id
     *            identificador da solução
     * @param assunto
     *            id do assunto
     * @param titulo
     *            descrição do título
     * @param texto
     *            texto da solução
     *  
     */
    public void save(final String id, final String assunto,
            final String titulo, final String texto) throws DaoException {

        Solucao solucao = new Solucao();
        if (id != null && id.trim().length() > 0) {
            solucao.setId(new Long(id));
        }

        AssuntoCtrl ctAssnto = new AssuntoCtrl();

        solucao.setAssunto(ctAssnto.get(new Long(assunto)));
        solucao.setTitulo(titulo);
        solucao.setTexto(texto);

        solucaoDao.save(solucao);
    }

    /**
     * Método para persistir a Solução no BD
     * 
     * @param solucao
     *            solução a ser salva
     */
    public void save(Solucao solucao) throws DaoException {

        solucaoDao.save(solucao);
    }

    /**
     * Método para excluir a Solução do BD
     * 
     * @param id
     *            identificador da solução
     */
    public void delete(Long id) throws DaoException {
        if (id == null) {
            throw new DaoException("ID do Objeto não pode ser nulo.");
        }
        solucaoDao.delete(id);
    }

    /**
     * Método para listar as soluções do BD
     */
    public List list() throws DaoException {
        return solucaoDao.list();
    }

    /**
     * Método para consultar as soluções do BD de acordo com os parâmetros
     * informados
     * 
     * @param pTexto -
     *            texto da solução a ser consultado
     * @param pAssunto -
     *            Assunto da solução a ser consultado
     * @param pSituacao -
     *            Situação do assunto (A - ativo; I - inativo)
     *  
     */
    public List consultaSolucao(String pTexto, String pAssunto,
            String pSituacao, Funcionario pFuncionario, Orgao pOrgao)
            throws DaoException {

        String lsFrom = " Select s from Solucao as s ";
        String lsSituac = "";
        String lsAssunto = "";
        String lsTexto = "";
        String lsQuery = "";
        String lsSolAuto="";
        List solucaoList = null;

        Timestamp hoje = new Timestamp(System.currentTimeMillis());

        lsTexto = " Where ( s.texto  LIKE '%" + pTexto + "%'  OR "
                + "        s.titulo LIKE '%" + pTexto + "%' ) ";
        
        lsSolAuto =" and s.estado.id="+EstadoSolucao.APROVADO.getId();

        // Selecionar assuntos e soluções ativos (vigentes) ou não
        // de acordo com o parâmetro informado
        if (pSituacao.equalsIgnoreCase("Ativos")) {
            lsSituac = " and ( s.assunto.dataVigencia >= '" + hoje + "' "
                    + "    or s.assunto.dataVigencia = 00000000  "
                    + "    or s.assunto.dataVigencia is null ) ";
        } else if (pSituacao.equalsIgnoreCase("Inativos")) {
            lsSituac = " and ( s.assunto.dataVigencia <  '" + hoje + "' "
                    + "    and s.assunto.dataVigencia <> 00000000  "
                    + "    and not s.assunto.dataVigencia is null ) ";
        } else if (pSituacao.equalsIgnoreCase("Ambos")) {
            lsSituac = "";
        }

        // Traz apenas as soluções ativas
        lsSituac = lsSituac + "  and ( s.dataVigencia >= '" + hoje + "' "
                + "    or s.dataVigencia = 00000000  "
                + "    or s.dataVigencia is null ) ";

        // Verifica se foi selecionado um assunto
        if (!pAssunto.equalsIgnoreCase("0")) {
            lsAssunto = " and s.assunto.id = " + pAssunto;
        }
        // Caso não tenha sido selecionado um assunto, traz-se
        // apenas as soluções cujo assunto esteja associado ao órgão
        // do especialista ou aos sub-órgãos daquele
        else {

        	// Usou-se o DISTINCT pelo fato de um mesmo assunto poder
            // estar associado a mais de um sub-órgão, o que faz com
            // que suas soluções venham duplicadas
            
        	lsFrom = " Select DISTINCT s  " + " from   Solucao     as s, "
                    + " Funcionario as f, " + " Orgao       as o ";
            lsAssunto = " and ( ( s.assunto in elements(f.listaAssunto) "
                    + "         and f.id = " + pFuncionario.getId() + " ) "
                    + "     or  s.assunto.instituicao.id = " + pOrgao.getId()
                    + ") ";
                    
        }

        lsQuery = lsFrom + lsTexto + lsSolAuto + lsAssunto + lsSituac;

        // Recupera lista de soluções
        solucaoList = solucaoDao.query(lsQuery);

        return solucaoList;
    }

    /**
     * Método para listar as soluções a serem alteradas, de acordo com os
     * parâmetros informados
     * 
     * @param pAssunto
     *            Assunto selecionado
     * @param pTexto
     *            Texto a ser consultado
     * @param pOrgao
     *            Órgão do gestor
     */
    public List listaSolucoesAtualizacao(String pAssunto, String pTexto, Integer codEstadoSolucao, 
            Orgao pOrgao) throws DaoException {

        String lsFrom = "Select s from Solucao as s";
        String lsWhere = "";
        String lsOrdem = " order by s.id";

        String lsQuery = "";
        List listaSolucao = null;
        Timestamp hoje = new Timestamp(System.currentTimeMillis());

        // Verifica se foi selecionado um assunto
        if (!pAssunto.equalsIgnoreCase("0")) {
            lsWhere = " Where s.assunto.id = " + pAssunto;
        }
        // Caso não tenha sido selecionado um assunto, traz-se
        // apenas os scripts cujo assunto esteja associado ao órgão
        // do gestor
        else {
            lsFrom = "Select DISTINCT s from Solucao as s, " + " Orgao o, "
                    + " SubOrgao sub ";
            lsWhere = " Where ( s.assunto.id in elements(o.listaAssunto) "
                    + "   Or  ( s.assunto.id in elements(sub.listaAssunto) "
                    + "     and sub.id in elements(o.listaSubOrgao) ) )"
                    + " And  o.id = " + pOrgao.getId()
                    + " And ( s.assunto.dataVigencia >= '" + hoje + "' "
                    + "    or s.assunto.dataVigencia = 00000000  "
                    + "    or s.assunto.dataVigencia is null ) ";
        }

        //filtra pelo estadoSolucao informado
        int codigoEstado=codEstadoSolucao!=null?codEstadoSolucao.intValue():0;
        
        if (codigoEstado!=0) {
        lsWhere = lsWhere + " And (("+codEstadoSolucao+" is not null and s.estado.id = "+codEstadoSolucao+")" 
        				  + " Or "+codEstadoSolucao+" is null)";
        }
        // filtra pelo texto informado
        lsWhere = lsWhere + " And (s.texto  LIKE '%" + pTexto + "%' OR"
                + "      s.titulo LIKE '%" + pTexto + "%')";

        // monta a string com a query
        lsQuery = lsFrom + lsWhere + lsOrdem;

        // Recupera lista de script
        listaSolucao = solucaoDao.query(lsQuery);

        return listaSolucao;
    }
    
    /**
     * Método para listar as soluções de acordo com os parâmetros informados
     *
     * @param pEstadoScript
     *            Estado dos scripts a serem listados
     * @param pOrgao
     *            Órgão do gestor
     */
    public List listaSolucoesPorEstado(EstadoScript pEstadoScript, Orgao pOrgao)
    throws DaoException {
        
        String lsFrom = "Select s from Solucao as s";
        String lsWhere = "";
        String lsOrdem = " order by s.id";
        
        String lsQuery = "";
        List listaSolucao = null;
        Timestamp hoje = new Timestamp(System.currentTimeMillis());
        
        // Traz-se apenas os scripts cujo assunto esteja associado
        // ao órgão do gestor ou aos sub-órgãos daquele
        lsFrom = "Select DISTINCT s from Solucao as s, " + " Orgao o, "
                + " SubOrgao sub ";
        lsWhere = " Where ( s.assunto.id in elements(o.listaAssunto) "
                + "   Or  ( s.assunto.id in elements(sub.listaAssunto) "
                + "     and sub.id in elements(o.listaSubOrgao) ) )"
                + " And  o.id = " + pOrgao.getId() + " And  s.estado.id = "
                + pEstadoScript.getId() + " And ( s.dataVigencia >= '"
                + hoje + "' " + "    or s.dataVigencia = 00000000  "
                + "    or s.dataVigencia is null ) ";
        
        // monta a string com a query
        lsQuery = lsFrom + lsWhere + lsOrdem;
        
        // Recupera lista de script
        listaSolucao = solucaoDao.query(lsQuery);
        
        return listaSolucao;
    }
    
    /**
     * Método para listar todos estados possíveis para uma solução
     *
     * @return
     * @throws DaoException
     */
    public List listaTodosEstadoSolucao() throws DaoException {
        
        String lsQuery = "Select distinct es"
                + " from EstadoSolucao as es"
                + " order by es.descricao";
        
        // Recupera lista de script
        List listaEstadoSolucao = solucaoDao.query(lsQuery);
        
        return listaEstadoSolucao;
    }
    
    /**
     * Método que recupera a quantidade de utilizações de uma Solução
     *
     * @return
     * @throws DaoException
     */
    public List listaQtdUtilizacaoSolucao(String id) throws DaoException {

    	  String lsQuery = " select count(r.solucao.id) "
              + " from RespostaAcionamento as r"
              + " where r.solucao.id = " + id;
       
    	  List listaqtdUtilizacao = solucaoDao.query(lsQuery);
          
          return listaqtdUtilizacao;
    }
    
}