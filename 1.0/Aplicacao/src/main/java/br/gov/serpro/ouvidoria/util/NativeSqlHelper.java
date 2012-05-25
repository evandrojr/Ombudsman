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
package br.gov.serpro.ouvidoria.util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

/**
 * Objetivo: Classe utilitária para realizar consultas SQL Nativas, sem passar pela API
 * do Hibernate (é utilizada a conexão obtida da sessão do Hibernate).
 * 
 * @author SERPRO
 * @version $Revision: 1.1.2.3 $, $Date: 2011/10/20 15:30:35 $
 * @version 0.1, Date: 2005/01/21
 */
public class NativeSqlHelper {
    
    private NativeSqlHelper() {
    }
    
    /**
     * Executa uma consulta SQL diretamente no BD, sem passar pelo Hibernate
     * (utiliza a conexão obtida da sessão do Hibernate).
     *
     * O segundo argumento deste método deve conter uma lista dos argumentos
     * de query, caso o comando sql inclua argumentos (indicados por um
     * caractere "?" dentro da string sql). Caso não haja argumentos de query,
     * deve-se passar null (ou uma lista vazia) para esse argumento.
     *
     * @param   sql string contendo o SQL a ser executado.
     * @param   argumentosDeQuery lista (java.util.List) ordenada dos argumentos
     *          de query, se houver.
     */
    public static ResultSet query( String sql, List argumentosDeQuery )
    throws SQLException {
        //obter a conexão da sessão do Hibernate
        Connection c = HibernateSessionFactory.getFactory().getSession().connection();
        
        //criar o prepared statement
        PreparedStatement ps = c.prepareStatement( sql );
        
        //configurar os argumentos de query (se houver)
        if ( argumentosDeQuery != null ) {
            for ( int i = 0; i < argumentosDeQuery.size(); i++ ) {
                Object argumento = argumentosDeQuery.get( i );
                
                if ( argumento instanceof java.lang.String ) {
                    ps.setString( i + 1, (String) argumento );
                } else if ( argumento instanceof java.util.Date ) {
                    ps.setDate( i + 1, (java.sql.Date) argumento );
                } else if ( argumento instanceof java.lang.Integer ) {
                    ps.setInt( i + 1, ((Integer) argumento).intValue() );
                } else if ( argumento instanceof java.lang.Long ) {
                    ps.setLong( i + 1, ((Long) argumento ).longValue() );
                } else {
                    throw new RuntimeException( "Agumentos do tipo "
                            + argumento.getClass().getName()
                            + " nao são suportados neste helper." );
                }
            }
        }
        
        //executar a query, guardando resultados num ResultSet
        ResultSet rs = ps.executeQuery();
        
        return rs;
    }
    
}
