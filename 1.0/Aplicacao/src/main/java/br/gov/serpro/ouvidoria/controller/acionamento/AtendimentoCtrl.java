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
package br.gov.serpro.ouvidoria.controller.acionamento;

import java.util.List;

import br.gov.serpro.ouvidoria.dao.Dao;
import br.gov.serpro.ouvidoria.dao.DaoException;
import br.gov.serpro.ouvidoria.dao.DaoFactory;
import br.gov.serpro.ouvidoria.model.Atendimento;
import br.gov.serpro.ouvidoria.model.Script;

/**
 * Objetivo: Controlar as operações sobre os objetos Atendimento, inclusive
 * persistindo os mesmos
 * 
 * @author SERPRO
 * @version $Revision: 1.1.2.4 $, $Date: 2011/10/18 17:55:14 $
 * @version 0.1, Date: 2005/01/03
 */
public class AtendimentoCtrl {

    /** campo para datasource */
    private Dao atendimentoDao;

    /**
     * Construtor "default"
     */
    public AtendimentoCtrl() {
        // DO NOTHING
    }

    /**
     * Construtor recebendo objeto Dao
     */
    public AtendimentoCtrl(final DaoFactory daoFactory) {
        atendimentoDao = daoFactory.create(Atendimento.class);
    }

    /**
     * Método para recuperar o Script a partir de um id
     * 
     * @param id
     *            identificador do script
     */
    public Atendimento get(Long id) throws DaoException {
        if (id == null) {
            throw new DaoException("ID do Objeto não pode ser nulo.");
        }
        return (Atendimento) atendimentoDao.get(id);
    }

    /**
     * Método para persistir o Atendimento no BD
     * 
     * @param atend
     *            Atendimento a ser salvo
     */
    public void save(Atendimento atend) throws DaoException {

        atendimentoDao.save(atend);
    }

    /**
     * Método para excluir o Atendimento do BD
     * 
     * @param id
     *            identificador do Atendimento
     */
    public void delete(Long id) throws DaoException {
        if (id == null) {
            throw new DaoException("ID do Objeto não pode ser nulo.");
        }
        atendimentoDao.delete(id);
    }

    /**
     * Método para listar os Atendimentos do BD
     */
    public List list() throws DaoException {
        return atendimentoDao.list();
    }

    /**
     * Método para listar os Atendimentos em que tenha sido utilizado um
     * determinado script
     * 
     * @param pScript
     *            Script cujos atendimentos deseja-se consultar
     *  
     */
    public List listaAtendimentosScript(Script pScript) throws DaoException {

        String lsFrom = " Select atd from Atendimento as atd";
        String lsWhere = " Where  atd.script.id = " + pScript.getId();
        String lsOrdem = " order by atd.id";

        // monta a string com a query
        String lsQuery = lsFrom + lsWhere + lsOrdem;
        List listaAtd = null;

        // Recupera lista de script
        listaAtd = atendimentoDao.query(lsQuery);

        return listaAtd;
    }

}