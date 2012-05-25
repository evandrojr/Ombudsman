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

import java.sql.Timestamp;
import java.util.Iterator;
import java.util.List;

import br.gov.serpro.ouvidoria.dao.Dao;
import br.gov.serpro.ouvidoria.dao.DaoException;
import br.gov.serpro.ouvidoria.dao.DaoFactory;
import br.gov.serpro.ouvidoria.model.Assunto;
import br.gov.serpro.ouvidoria.model.Atendimento;
import br.gov.serpro.ouvidoria.model.Funcionario;
import br.gov.serpro.ouvidoria.model.Script;

/**
 * Objetivo: Controlar as operações sobre os objetos relacionados à parte de
 * recuperar scripts da funcionalidade Consultar Script.
 * 
 * @author SERPRO
 * @version $Revision: 1.1.2.4 $, $Date: 2011/10/18 17:55:14 $
 * @version 0.1, Date: 2004/12/08
 */
public class ConsultarScriptCtrl {

    /** atributo para datasource do script */
    /* Requerido */
    private Dao scriptDao;

    /** atributo para datasource do atendimento */
    /* Requerido */
    private Dao atendimentoDao;

    /**
     * Construtor recebendo objeto Dao
     */
    public ConsultarScriptCtrl(final DaoFactory daoFactory) {
        scriptDao = daoFactory.create(Script.class);
        atendimentoDao = daoFactory.create(Atendimento.class);
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
     * * @param pEstado
     *            Estado do script a ser consultado
     * @param pFunc
     *            Funcionário logado
     * @param pBuscarNovamente
     *            Identificador de busca sobre os resultados de outra busca
     *            anterior
     * @param pHistoricoTextos
     *            Lista com o histórico dos textos consultado anteriormente
     *  
     */
    public List ListarScript(String pTexto, String pAssunto, Funcionario pFunc,
            String pBuscarNovamente, List pHistoricoTextos) throws DaoException {

        String lsFrom = "Select s from Script as s";
        String lsTexto = "";
        String lsOrdem = " order by s.titulo";
        String lsStringHistorico = "";
        String lsHistoricoTexto = "";
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

        // Monta filtro com o histórico de busca se a opção "Buscar nestes
        // resultados" estiver marcada
        if ((pBuscarNovamente != null)
                && (pBuscarNovamente.equalsIgnoreCase("S"))) {

            if (pHistoricoTextos != null) {
                iter = pHistoricoTextos.iterator();
                while (iter.hasNext()) {
                    lsStringHistorico = (String) iter.next();
                    lsHistoricoTexto = lsHistoricoTexto
                            + " and (s.descricao LIKE '%" + lsStringHistorico
                            + "%' OR" + " s.titulo LIKE '%" + lsStringHistorico
                            + "%')";
                }

                lsTexto = lsTexto + lsHistoricoTexto;
            }
        }

        // Filtra por assuntos ativos para o funcionario logado
        listaAssunto = pFunc.getListaAssuntosComAtuacao("Ativo");

        // Verifica se foi selecionado um assunto
        if (!pAssunto.equalsIgnoreCase("0")) {
            lsAssunto = " and s.assunto.id = " + pAssunto;
        }
        // Caso não tenha sido selecionado um assunto, traz-se
        // apenas os scripts cujo assunto esteja associado ao funcionario
        // através do relacionamento de atuação
        else {
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

         // filtra apenas pelo estado de APROVADO
        lsEstadoScript = " and s.estado.descricao = 'APROVADO'";

        // monta a string com a query
        lsQuery = lsFrom + lsTexto + lsAssunto + lsEstadoScript + lsOrdem;

        // Recupera lista de script
        listaScript = scriptDao.query(lsQuery);
        return listaScript;
    }

    /**
     * Método para salvar um atendimento
     * 
     * @param s
     *            script consultado
     * @param func
     *            funcionario logado
     */
    public void salvarAtendimento(Script s, Funcionario func)
            throws DaoException {

        Atendimento atendimento = new Atendimento();

        if (s == null)
            throw new NullPointerException("Script não pode ser nulo.");

        if (func == null)
            throw new NullPointerException("Funcionario não pode ser nulo.");

        atendimento.setScript(s);
        atendimento.setFuncionario(func);
        atendimento.setData(new Timestamp(System.currentTimeMillis()));
        atendimentoDao.save(atendimento);
    }
}