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

import java.io.Serializable;
import java.sql.SQLException;
import java.util.Date;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.jfree.data.category.CategoryDataset;
import org.jfree.data.general.PieDataset;

import de.laures.cewolf.DatasetProduceException;
import de.laures.cewolf.DatasetProducer;
import de.laures.cewolf.links.CategoryItemLinkGenerator;
import de.laures.cewolf.tooltips.CategoryToolTipGenerator;

/**
 * 
 * @author SERPRO
 * @version $Revision: 1.1.2.4 $, $Date: 2011/10/21 18:53:46 $
 * @version 0.1, Date: 2005/01/21
 */
public class CategoryData implements DatasetProducer,
        CategoryItemLinkGenerator, CategoryToolTipGenerator, Serializable {

	private static final long serialVersionUID = 1L;


	private static final Log logger = LogFactory.getLog(CategoryData.class);


    private final String[] seriesNames = { "cewolfset.jsp", "tutorial.jsp",
            "testpage.jsp", "performancetest.jsp" };


    public Object produceDataset(Map params) throws DatasetProduceException {

        boolean detailed = false;
        if (params.containsKey("r_modo_exibicao")) {
            if ("d".equalsIgnoreCase((String) params.get("r_modo_exibicao")))
                detailed = true;
        }

        boolean table_on_x_axis = false;
        if (params.containsKey("r_base_x")) {
            if ("0".equalsIgnoreCase((String) params.get("r_base_x")))
                table_on_x_axis = true;
        }

        try {
            return ReportHelperInt.getDataSet(
                    (String) params.get("sel_tabela"), (String) params
                            .get("sel_tipo_grafico"), detailed,
                    table_on_x_axis, (Object[]) params.get("ii_itens_tabela"),
                    (String[]) params.get("sel_itens_tabela"), (String) params
                            .get("h_locais"), null, (String) params
                            .get("txt_periodo_i"), (String) params
                            .get("txt_periodo_f"));

        } catch (SQLException e) {
            e.printStackTrace();
            DatasetProduceException dspe = new DatasetProduceException(
                    "Erro ao gerar os dados de pizza");
            dspe.initCause(e);
            throw dspe;
        }

    }

    public boolean hasExpired(Map params, Date since) {
        logger.debug(getClass().getName() + "hasExpired()");
        return (System.currentTimeMillis() - since.getTime()) > 5000;
    }

    public String getProducerId() {
        return "Pie";
    }

     public String generateLink(Object dataset, Object category) {
        return null;
    }

    public String generateLink(Object dataset, int series, Object category) {
        return seriesNames[series];
    }

    public String generateToolTip(CategoryDataset data, int series, int item) {
        return seriesNames[series];
    }

    public String generateToolTip(PieDataset data, Comparable key, int pieIndex) {
        return String.valueOf(pieIndex);
    }

}