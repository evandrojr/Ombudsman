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

import java.util.ArrayList;
import java.util.Collection;

import br.gov.serpro.ouvidoria.dao.Dao;
import br.gov.serpro.ouvidoria.dao.DaoException;
import br.gov.serpro.ouvidoria.dao.DaoFactory;
import br.gov.serpro.ouvidoria.model.Acionamento;
import br.gov.serpro.ouvidoria.model.Assunto;
import br.gov.serpro.ouvidoria.model.Funcionario;

/**
 * ReclassificarMensagemCtrl
 * 
 * Objetivo: Responsável pelo processo de Reclassificar Mensagens
 * 
 * @author SERPRO
 * @version $Revision: 1.1.2.3 $, $Date: 2011/10/18 17:55:13 $
 * @version 0.1, Date: 2004/12/21
 */
public class ReclassificarMensagemCtrl {

    private Dao acionamentoDao;

    private Dao assuntoDao;

    public ReclassificarMensagemCtrl() {
        /**/
    }

    public ReclassificarMensagemCtrl(final DaoFactory daoFactory) {
        acionamentoDao = daoFactory.create(Acionamento.class);
        assuntoDao = daoFactory.create(Assunto.class);
    }

    public void salvarAcionamento(Acionamento acionamento) throws DaoException {
        acionamentoDao.save(acionamento);
    }

    public Collection getAssuntos(Funcionario funcionario, Assunto assunto) {
        Collection retorno = new ArrayList();
        retorno.addAll(funcionario.getListaAssunto());
        retorno.remove(assunto);
        return retorno;
    }

    public Acionamento getAcionamento(Integer id) throws DaoException {
        Acionamento acionamento = (Acionamento) acionamentoDao.get(new Long(id
                .longValue()));
        return acionamento;
    }

    public Assunto getAssunto(Integer id) throws DaoException {
        Assunto assunto = (Assunto) assuntoDao.get(new Long(id.longValue()));
        return assunto;
    }

}