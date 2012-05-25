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
package br.gov.serpro.ouvidoria.dao;

/**
 * 
 * Objetivo: Ser um wrapper das exceções que podem acontecer ao invocar um
 * método de um Dao.
 * 
 * @author SERPRO
 * @version $Revision: 1.1.2.3 $, $Date: 2011/10/19 20:36:56 $
 * @version 0.1, Date: 2004/12/27
 */
public class DaoException extends Exception {

	private static final long serialVersionUID = 1L;

	/**
     * Constrói uma DaoException vazia.
     */
    public DaoException() {
        super();
    }

    /**
     * Constrói uma DaoException com uma mensagem.
     * 
     * @param message
     *            mensagem da exceção.
     */
    public DaoException(String message) {
        super(message);
    }

    /**
     * Constrói uma DaoException com uma mensagem e uma causa.
     * 
     * @param message
     *            mensagem da exceção.
     * @param cause
     *            causa da exceção.
     */
    public DaoException(String message, Throwable cause) {
        super(message, cause);
    }

    /**
     * Constrói uma DaoException com uma causa.
     * 
     * @param cause
     *            causa da excecao.
     */
    public DaoException(Throwable cause) {
        super(cause);
    }

}