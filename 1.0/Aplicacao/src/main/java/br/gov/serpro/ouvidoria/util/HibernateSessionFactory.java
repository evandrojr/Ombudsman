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

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**
 * 
 * @author SERPRO
 * @version $Revision: 1.1.2.3 $, $Date: 2011/10/20 15:30:35 $
 * @version 0.1, Date: 2005/01/21
 */
public class HibernateSessionFactory {

	private static Log log = LogFactory.getLog(HibernateSessionFactory.class);

	private static HibernateSessionFactory instance;

	private final SessionFactory sessionFactory;

	private static final ThreadLocal session = new ThreadLocal();

	private HibernateSessionFactory() {
		try {
			sessionFactory = new Configuration().configure()
					.buildSessionFactory();
		} catch (Throwable ex) {
			log.error("Initial SessionFactory creation failed.", ex);
			throw new ExceptionInInitializerError(ex);
		}
	}

	/**
	 * Acesso ao singleton.
	 * 
	 * @return o singleton desta classe
	 */
	public static HibernateSessionFactory getFactory() {
		if (instance == null) {
			try {
				instance = new HibernateSessionFactory();
			} catch (Exception e) {
				throw new RuntimeException(
						"problems while instantiating the singleton", e);
			}
		}
		return instance;
	}

	/**
	 * Obtem uma sessão para este thread
	 * 
	 * @return Session
	 */
	public Session getSession() {
		Session s = (Session) session.get();

		if (s == null) {
			s = sessionFactory.openSession();
			session.set(s);
		}

		return s;
	}

	/**
	 * Fecha uma sessão
	 * 
	 */
	public void closeSession() {
		Session s = (Session) session.get();
		session.set(null);
		if (s != null && s.isOpen())
			s.close();
	}
}