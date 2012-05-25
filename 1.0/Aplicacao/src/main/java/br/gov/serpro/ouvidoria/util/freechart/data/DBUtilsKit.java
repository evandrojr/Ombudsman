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
package br.gov.serpro.ouvidoria.util.freechart.data;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.MessageFormat;
import java.util.Comparator;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import org.apache.commons.configuration.Configuration;
import org.apache.commons.configuration.XMLConfiguration;
import org.apache.commons.dbcp.BasicDataSource;
import org.apache.commons.dbutils.BasicRowProcessor;
import org.apache.commons.dbutils.DbUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.ArrayHandler;
import org.apache.commons.dbutils.handlers.ArrayListHandler;
import org.apache.commons.dbutils.handlers.MapHandler;
import org.apache.commons.dbutils.handlers.MapListHandler;
import org.apache.log4j.Logger;
import org.jfree.util.Log;

import br.gov.serpro.ouvidoria.util.collection.ListArrayTable;

/**
 * @author SERPRO
 * @version $Revision: 1.1.2.2 $, $Date: 2011/11/07 12:49:11 $
 */
public class DBUtilsKit {

	private static final Logger logger;
	private static Configuration config;
	private static DataSource dataSource;
	private static QueryRunner queryRunner;
	private static MapHandler mapHandler = new MapHandler(
			BasicRowProcessor.instance());
	private static ArrayHandler arrayHandler = new ArrayHandler(
			BasicRowProcessor.instance());
	private static MapListHandler mapListHandler = new MapListHandler(
			BasicRowProcessor.instance());
	private static ArrayListHandler arrayListHandler = new ArrayListHandler(
			BasicRowProcessor.instance());

	static {
		logger = Logger.getLogger(DBUtilsKit.class);
	}

	public static class ResultSetIterator extends
			org.apache.commons.dbutils.ResultSetIterator {

		public final void close() {
			DbUtils.closeQuietly(con, null, rs);
		}

		protected void finalize() throws Throwable {
			clone();
			super.finalize();
		}

		private Connection con;
		private ResultSet rs;

		public ResultSetIterator(ResultSet rs, Connection con) {
			super(rs);
			this.rs = rs;
			this.con = con;
		}
	}

	private DBUtilsKit() {
	}

	public static void init(Configuration config) {
		setConfiguration(config);
	}

	public static void setDataSource(DataSource ds) {
		dataSource = ds;
	}

	public static DataSource getDataSource() {
		if (dataSource == null) {
			logger.debug("Datasource is null, setting up");
			dataSource = setupDataSource(config);
			logger.debug("Data source is ready.");
		}
		return dataSource;
	}

	protected static DataSource getDataSource(String JNDIName)
			throws NamingException {
		Context ctx = new InitialContext();
		DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/" + JNDIName);
		logger.debug("DataSource for JNDI: " + ds);
		if (ds == null) {
			throw new RuntimeException("DataSource can't be found on server for JNDI: " + JNDIName);
		}
		return ds;
	}

	public static DataSource setupDataSource(Configuration config) {
		String JNDINameKey;
		String driverNameKey;
		String userNameKey;
		String passwordKey;
		logger.debug("ConfigurationClass: " + config.getClass());
		if (config instanceof XMLConfiguration) {
			JNDINameKey = "datasource[@jndiName]";
			driverNameKey = "datasource.driver[@name]";
			userNameKey = "datasource[@user]";
			passwordKey = "datasource[@password]";
		} else {
			JNDINameKey = "datasource.jndiName";
			driverNameKey = "datasource.driver.name";
			userNameKey = "datasource.user";
			passwordKey = "datasource.password";
		}
		String JNDIName = config.getString(JNDINameKey);
		logger.debug("JNDIName: " + JNDIName);
		if (JNDIName != null && JNDIName.length() > 0) {
			try {
				return getDataSource(JNDIName);
			} catch (NamingException e) {
				throw new RuntimeException(e);
			}
			// This can't happen, the application can't continue
			//return null;
		} else {
			logger.debug("JNDI is null, getting from config directly?");
			String driverName = config.getString(driverNameKey);
			String driverURI = getDBDriverURI(config);
			String userName = config.getString(userNameKey);
			String password = config.getString(passwordKey);
			return setupDataSource(driverName, driverURI, userName, password);
		}
	}

	public static DataSource setupDataSource(String driverName,
			String connectURI, String name, String pw) {
		logger.info("Setting up data source");
		logger.debug("Driver name: " + driverName);
		logger.debug("Driver URI: " + connectURI);
		logger.debug("User name: " + name);
		logger.debug("Password: " + pw);
		BasicDataSource ds = new BasicDataSource();
		ds.setDriverClassName(driverName);
		ds.setUsername(name);
		ds.setPassword(pw);
		ds.setUrl(connectURI);
		return ds;
	}

	protected static void setConfiguration(Configuration config) {
		DBUtilsKit.config = config;
	}

	protected static String getDBDriverURI(Configuration config) {
		String driverURIKey;
		String hostKey;
		String portKey;
		String dbNameKey;
		if (config instanceof XMLConfiguration) {
			driverURIKey = "datasource.driver[@uri]";
			hostKey = "datasource[@host]";
			portKey = "datasource[@port]";
			dbNameKey = "datasource[@dbName]";
		} else {
			driverURIKey = "datasource.driver.uri";
			hostKey = "datasource.host";
			portKey = "datasource.port";
			dbNameKey = "datasource.dbName";
		}
		return MessageFormat
				.format(config.getString(driverURIKey),
						new Object[] { config.getString(hostKey),
								config.getString(portKey),
								config.getString(dbNameKey) });
	}

	protected static void printDataSourceStats(DataSource ds)
			throws SQLException {
		BasicDataSource bds = (BasicDataSource) ds;
		logger.debug("NumActive: " + bds.getNumActive());
		logger.debug("NumIdle: " + bds.getNumIdle());
	}

	protected static void shutdownDataSource(DataSource ds) throws SQLException {
		BasicDataSource bds = (BasicDataSource) ds;
		bds.close();
	}

	public static QueryRunner getQueryRunner() {
		if (queryRunner == null) {
			logger.info("Setting up query runner.");
			queryRunner = getQueryRunner(getDataSource());
			logger.debug("Query runner is ready.");
		}
		return queryRunner;
	}

	public static QueryRunner getQueryRunner(DataSource ds) {
		logger.info("Getting query runner for datasource: " + ds);
		if (ds == null) {
			throw new IllegalArgumentException("Datasource can't be null!");
		}
		return new QueryRunner(ds);
	}

	public static Map selectAsMap(String query) throws SQLException {
		return selectAsMap(query, getQueryRunner());
	}

	public static Map selectAsMap(String query, QueryRunner runner)
			throws SQLException {
		if (logger.isDebugEnabled())
			logger.debug("selectAsMap: " + query);
		return (Map) runner.query(query, mapHandler);
	}

	public static Object[] selectAsArray(String query) throws SQLException {
		return selectAsArray(query, getQueryRunner());
	}

	public static Object[] selectAsArray(String query, QueryRunner runner)
			throws SQLException {
		if (logger.isDebugEnabled())
			logger.debug("selectAsArray: " + query);
		return (Object[]) runner.query(query, arrayHandler);
	}

	public static List selectAsListMap(String query) throws SQLException {
		return selectAsListMap(query, getQueryRunner());
	}

	public static List selectAsListMap(String query, QueryRunner runner)
			throws SQLException {
		if (logger.isDebugEnabled())
			logger.debug("selectAsListMap: " + query);
		return (List) runner.query(query, mapListHandler);
	}

	public static List selectAsListArray(String query) throws SQLException {
		return selectAsListArray(query, getQueryRunner());
	}

	public static List selectAsListArray(String query, QueryRunner runner)
			throws SQLException {
		if (logger.isDebugEnabled())
			logger.debug("selectAsListArray: " + query);
		return (List) runner.query(query, arrayListHandler);
	}

	public static ListArrayTable selectAsListArrayTable(String query)
			throws SQLException {
		return selectAsListArrayTable(query, null);
	}

	public static ListArrayTable selectAsListArrayTable(String query,
			Comparator comparator) throws SQLException {
		return selectAsListArrayTable(query, true, 0, comparator,
				getQueryRunner());
	}

	public static ListArrayTable selectAsListArrayTable(String query,
			boolean isSorted, int idColIndex, Comparator comparator,
			QueryRunner runner) throws SQLException {
		ListArrayTable result = new ListArrayTable(comparator);
		result.attach(selectAsListArray(query), isSorted, idColIndex);
		return result;
	}

	public static Iterator selectAsIteratorArray(String query)
			throws SQLException {
		return selectAsIterator(query, getDataSource().getConnection());
	}

	public static Iterator selectAsIterator(String query, Connection con)
			throws SQLException {
		if (logger.isDebugEnabled())
			logger.debug("selectAsIterator: " + query);
		Statement statement = null;
		ResultSet resultSet = null;
		statement = con.createStatement();
		resultSet = statement.executeQuery(query);
		return new ResultSetIterator(resultSet, con);
	}

	public static int update(String query) throws SQLException {
		return update(query, getQueryRunner());
	}

	public static int update(String query, QueryRunner runner)
			throws SQLException {
		if (logger.isDebugEnabled())
			logger.debug("update: " + query);
		return runner.update(query);
	}
}
