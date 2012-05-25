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
import br.gov.serpro.ouvidoria.model.HistoricoEnvio;
import br.gov.serpro.ouvidoria.model.Orgao;

/**
 * HistoricoEnvioCtrl
 * 
 * @author SERPRO
 * @version $Revision: 1.1.2.3 $, $Date: 2011/10/18 17:55:13 $
 * @version 0.1, Date: 2005/02/03
 */
public class HistoricoEnvioCtrl {

    private Dao defaultDao;

    /**
     * Construtor recebendo objeto Dao
     * 
     * @param daoFactory
     */
    public HistoricoEnvioCtrl(final DaoFactory daoFactory) {
        defaultDao = daoFactory.create(HistoricoEnvio.class);
    }

    /**
     * Retorna um boletim pelo seu ID
     * 
     * @param id
     * @return
     * @throws DaoException
     */
    public HistoricoEnvio get(final Long id) throws DaoException {
        if (id == null) {
            throw new DaoException("ID do Objeto não pode ser nulo.");
        }
        return (HistoricoEnvio) defaultDao.get(id);
    }

    /**
     * Salva um boletim no banco
     * 
     * @param object
     * @throws DaoException
     */
    public void save(final HistoricoEnvio object) throws DaoException {

        if (object == null) {
            throw new NullPointerException();
        }
       
        defaultDao.save(object);
    }

    /**
     * Retorna a lista de Histórico Envio do Boletim
     * 
     * @param boletim
     * 
     * @return List
     * @throws DaoException
     */
    public List list(final String boletim) throws DaoException {

        if ((boletim == null) || (boletim.length() == 0)) {
            throw new NullPointerException("Boletim não pode ser nulo.");
        }

        String sql = " Select he from HistoricoEnvio as he where he.boletim.id = "
                .concat(boletim);

        sql += " order by he.dataEnvio desc ";

        List query = defaultDao.query(sql);

        return query;
    }

    /**
     * Retorna a Lista de Grupos de E-mails
     * 
     * @param orgao
     * @return List
     * @throws DaoException
     */
    public List getGrupos(final Orgao orgao) throws DaoException {

        if (orgao == null) {
            throw new NullPointerException("Órgão não pode ser nulo.");
        }

        String sql = " Select g from GruposEmail as g where g.orgao.id = "
                .concat(orgao.getId().toString());

        sql += " order by g.descricao";

        List query = defaultDao.query(sql);

        return query;
    }

}