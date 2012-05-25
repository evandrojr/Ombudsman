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
package br.gov.serpro.ouvidoria.dao.hibernate;

import java.io.Serializable;
import java.util.HashMap;
import java.util.Map;

import br.gov.serpro.ouvidoria.dao.Dao;
import br.gov.serpro.ouvidoria.dao.DaoFactory;

/**
 * Objetivo: Responsável por fabricar os Daos para os controladores que utilizam
 * o Hibernate.
 * 
 * A política atual de criação desses Daos é que eles são uma única instância
 * por cada Factory.
 * 
 * @author SERPRO
 * @version $Revision: 1.1.2.3 $, $Date: 2011/10/19 20:36:56 $
 * @version 0.1, Date: 2004/12/27
 */
public class HibernateDaoFactory implements DaoFactory, Serializable {

	private static final long serialVersionUID = 1L;

	private static final Map mapDao = new HashMap();

	/*
	 * (non-Javadoc)
	 * 
	 * @see br.gov.serpro.ouvidoria.dao.DaoFactory#create(java.lang.Class)
	 */
	public Dao create(Class clazz) {

		Dao dao = (Dao) mapDao.get(clazz);

		if (dao == null) {
			dao = new HibernateDao(clazz);
			mapDao.put(clazz, dao);
		}

		return dao;

	}

}