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

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

/**
 * Objetivo: Servlet Filter de teste, para imprimir no console as URL's acessadas. ESTA
 * SERVLET DEVE SER DESABILITADA EM AMBIENTE DE PRODUÇÃO.
 * Para escolher quais URLs serão impressas no console, deve-se configurar
 * elementos <url-pattern> em diferentes elementos <filter-mapping> no
 * arquivo de configuração 'web.xml' (descritor de aplicação J2EE).
 * 
 * @author SERPRO
 * @version $Revision: 1.1.2.4 $, $Date: 2011/10/20 15:30:35 $
 * @version 0.1, Date: 2005/01/21
 */
public class DebugUrlFilter implements Filter {
    
    private FilterConfig filterConfig = null;
    
    public void init(FilterConfig filterConfig) throws ServletException {
        this.filterConfig = filterConfig;
    }
    
    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain) throws IOException, ServletException {
        HttpServletRequest httpReq = null;
        
        try {
            httpReq = (HttpServletRequest) request;
        } catch (Exception e) {
            // não fazer nada
        }
        
        //logar início de processamento da Action
        boolean isCenarioCritico = false;
        if (httpReq != null) {
            String uri = httpReq.getRequestURI();
            
            if ( uri.indexOf("/AtualizarUsuario") >= 0
                    || uri.indexOf("/ConsultaMsgPorRespons") >= 0
                    || uri.indexOf("/consultarAndamentoSolucaoSearch") >= 0 ) {
                isCenarioCritico = true;
                
                //logar
                System.out.println( "***********************************************" );
                System.out.println( "* Executando cenário crítico: " + uri );
                System.out.println( "*==============================================" );
            } else {
                System.out.println("Entrou em: " + uri);
            }
        }
        
        //variáveis para cronometragem do sistema
        long dataIni = 0;
        long dataFim = 0;
        long tempoDecorridoMs = 0;
        
        //iniciar cronometragem
        dataIni = System.currentTimeMillis();
        
        chain.doFilter(request, response);
        
        //finalizar cronometragem
        dataFim = System.currentTimeMillis();
        tempoDecorridoMs = dataFim - dataIni;
        double segundos = tempoDecorridoMs / 1000;
        double minutos = segundos / 60;
        
        //logar tempo decorrido
        if ( isCenarioCritico ) {
            System.out.println( "\n*==============================================" );
            System.out.println( "* processado em " + segundos + " segundos - " + minutos + " minutos."  );
            System.out.println( "***********************************************" );
        } else {
            System.out.println( "(processado em " + segundos + " segundos - " + minutos + " minutos.)"  );
        }
        
    }
    
    public void destroy() {
        this.filterConfig = null;
    }
    
}
