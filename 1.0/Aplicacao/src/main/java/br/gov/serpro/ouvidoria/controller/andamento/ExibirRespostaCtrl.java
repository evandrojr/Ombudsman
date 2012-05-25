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
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import br.gov.serpro.ouvidoria.dao.DaoFactory;
import br.gov.serpro.ouvidoria.model.Orgao;
import br.gov.serpro.ouvidoria.model.TipoAvaliacaoResposta;

/**
 * Objetivo: Controlar as operações sobre os objetos relacionados à parte de
 * exibição da funcionalidade Consultar Resposta.
 * 
 * @author SERPRO
 * @version $Revision: 1.1.2.4 $, $Date: 2011/10/18 17:55:13 $
 * @version 0.1, Date: 2004/11/30
 */
public class ExibirRespostaCtrl {

    /**
     * Construtor recebendo objeto Dao
     * 
     * @param daoFactory
     */
    public ExibirRespostaCtrl(final DaoFactory daoFactory) {
        // DO NOTHING
    }

    /**
     * Método para recuperar uma lista dos tipos de avaliação de uma resposta
     * @param orgao
     * @return
     */
    public List listarTipoAvaliacaoResposta(Orgao orgao) {

        List tipoAvaliacaoResposta = new ArrayList(orgao
                .getListaTipoAvaliacaoResposta());

        class TipoAvaliacaoRespostaComparator implements Comparator {
            public final int compare(Object a, Object b) {
                return (((TipoAvaliacaoResposta) a).getId())
                        .compareTo((((TipoAvaliacaoResposta) b).getId()));
            }
        }

        Collections.sort(tipoAvaliacaoResposta,
                new TipoAvaliacaoRespostaComparator());

        return tipoAvaliacaoResposta;
    }

}