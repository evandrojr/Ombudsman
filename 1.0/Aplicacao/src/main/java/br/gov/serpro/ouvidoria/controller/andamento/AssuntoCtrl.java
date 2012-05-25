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

import java.util.List;

import br.gov.serpro.ouvidoria.dao.Dao;
import br.gov.serpro.ouvidoria.dao.DaoException;
import br.gov.serpro.ouvidoria.dao.DaoFactory;
import br.gov.serpro.ouvidoria.model.Assunto;

/**
 * Objetivo: Controlar as operações sobre os objetos Assunto, inclusive
 * persistindo os mesmos
 * 
 * @author SERPRO
 * @version $Revision: 1.1.2.4 $, $Date: 2011/10/18 17:55:13 $
 * @version 0.1, Date: 2004/11/25
 */
public class AssuntoCtrl {
    /** campo para datasource */
    private Dao assuntoDao;

    /**
     * Construtor "default"
     */
    public AssuntoCtrl() {
        // DO NOTHING
    }

    /**
     * Construtor recebendo objeto Dao
     */
    public AssuntoCtrl(final DaoFactory daoFactory) {
        assuntoDao = daoFactory.create(Assunto.class);
    }

    /**
     * Método para recuperar o Assunto a partir de um id
     * 
     * @param id
     *            identificador do assunto
     */
    public Assunto get(Long id) throws DaoException {
        if (id == null) {
            throw new DaoException("ID do Objeto não pode ser nulo.");
        }
        return (Assunto) assuntoDao.get(id);
    }

    /**
     * Método para persistir a Solucao no BD
     * 
     * @param id
     *            identificador da solução
     */
    public void save(final String id) throws DaoException {

        Assunto assunto = new Assunto();
        if (id != null && id.trim().length() > 0) {
            assunto.setId(new Long(id));
        }

        assuntoDao.save(assunto);
    }

    /**
     * Método para excluir o Assunto do BD
     * 
     * @param id
     *            identificador dao assunto
     */
    public void delete(Long id) throws DaoException {
        if (id == null) {
            throw new DaoException("ID do Objeto não pode ser nulo.");
        }
        assuntoDao.delete(id);
    }

    /**
     * Método para listar os assuntos do BD
     */
    public List list() throws DaoException {
        return assuntoDao.list();
    }

}