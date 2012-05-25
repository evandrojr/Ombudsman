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
package br.gov.serpro.ouvidoria.controller.aprendizado;

import java.util.List;

import br.gov.serpro.ouvidoria.dao.Dao;
import br.gov.serpro.ouvidoria.dao.DaoException;
import br.gov.serpro.ouvidoria.dao.DaoFactory;
import br.gov.serpro.ouvidoria.model.GruposEmail;
import br.gov.serpro.ouvidoria.model.Orgao;

/**
 * Objetivo: Controlar as operações sobre os objetos Grupos de Email, inclusive
 * persistindo os mesmos
 * 
 * @author SERPRO
 * @version $Revision: 1.1.2.3 $, $Date: 2011/10/18 17:55:13 $
 * @version 0.1, Date: 2005/02/02
 */
public class GruposEmailCtrl {

    /** campo para datasource */
    private Dao grupoDao;

    /**
     * Construtor recebendo objeto Dao
     */
    public GruposEmailCtrl(final DaoFactory daoFactory) {
        grupoDao = daoFactory.create(GruposEmail.class);
    }

    /**
     * Método para recuperar o Grupo de email a partir de um id
     * 
     * @param id
     *            identificador do grupo de email
     */
    public GruposEmail get(Long id) throws DaoException {
        if (id == null) {
            throw new DaoException("ID do Objeto não pode ser nulo.");
        }
        return (GruposEmail) grupoDao.get(id);
    }

    /**
     * Método para persistir os Grupos de email no BD
     * 
     * @param param
     *            Grupos de email a serem salvos
     */
    public void save(GruposEmail grupo) throws DaoException {
        grupoDao.save(grupo);
    }

    /**
     * Método para excluir os grupos de email do BD
     * 
     * @param id
     *            identificador do grupo
     */
    public void delete(Long id) throws DaoException {
        if (id == null) {
            throw new DaoException("ID do Objeto não pode ser nulo.");
        }
        grupoDao.delete(id);
    }

    /**
     * Método para listar os grupos de email do BD
     */
    public List list() throws DaoException {
        return grupoDao.list();
    }

    /**
     * Método para listar os grupos de email de um órgão, período e contenham
     * uma palavra chave
     * 
     * @param pOrgao
     *            Órgão
     */
    public List list(final Orgao pOrgao, final String pDatIni,
            final String pDatFim, final String pPalavraChave)
            throws DaoException {

        String lsOrder = " Order By grp.id ";
        List lstGruposEmail = null;

        String lsFrom = " Select grp from GruposEmail as grp ";

        String lsWhere = " Where grp.orgao.id = " + pOrgao.getId();

        // Trata os demais parâmetros passados para consulta
        if ((!pDatIni.equals("")) && (!pDatFim.equals(""))) {
            // Muda formato da data de dd/mm/yyyy para yyyymmdd
            final String datIni = pDatIni.substring(6, 10)
                    + pDatIni.substring(3, 5) + pDatIni.substring(0, 2);

            // Na data fim acrescenta o último horário
            final String datFim = pDatFim.substring(6, 10)
                    + pDatFim.substring(3, 5) + pDatFim.substring(0, 2)
                    + "235959";

            lsWhere = lsWhere + " and grp.dataCriacao >= '" + datIni + "' "
                    + " and grp.dataCriacao <= '" + datFim + "' ";
        }

        // A palavra chave pode estar no título/texto da mensagem ou da resposta
        if (!pPalavraChave.equals("")) {
            lsWhere = lsWhere + " and  ( grp.descricao  LIKE '%"
                    + pPalavraChave + "%' " + "    Or  grp.listaEmail LIKE '%"
                    + pPalavraChave + "%' ) ";
        }

        String lsQuery = lsFrom + lsWhere + lsOrder;

        // Recupera lista de acionamentos pendentes
        lstGruposEmail = grupoDao.query(lsQuery);

        return lstGruposEmail;

    }

}