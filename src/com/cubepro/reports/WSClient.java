package com.cubepro.reports;

/*
 * WSClientSingleton.java
 *
 * Created on July 12, 2006, 4:56 PM
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */

/**
 *
 * @author gtoffoli
 */
import java.io.File;
import java.io.Serializable;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;

import com.cubepro.general.database.CubeProDataSource;
import com.jaspersoft.jasperserver.api.metadata.xml.domain.impl.ResourceDescriptor;
import com.jaspersoft.jasperserver.irplugin.JServer;

public class WSClient implements Serializable {

	private JServer server = null;
	private static String reportUnitDataSourceURI = "/datasources/JServerJdbcDS";

	public WSClient(String webServiceUrl, String username, String password) {
		server = new JServer();
		server.setUsername(username);
		server.setPassword(password);
		server.setUrl(webServiceUrl);
	}

	public List list(String uri) throws Exception {
		ResourceDescriptor rd = new ResourceDescriptor();
		rd.setWsType(ResourceDescriptor.TYPE_FOLDER);
		rd.setUriString(uri);
		return null;//server.getWSClient().list(rd);
	}

	public ResourceDescriptor get(String uri) throws Exception {
		return get(uri, null);
	}

	public ResourceDescriptor get(String uri, List args) throws Exception {
		return get(uri, null, args);
	}

	public ResourceDescriptor get(String uri, File outputFile, List args)
			throws Exception {
		ResourceDescriptor rd = new ResourceDescriptor();
		rd.setUriString(uri);
		return server.getWSClient().get(rd, outputFile, args);
	}

	public JasperPrint runReport(String reportUri, Map parameters)
			throws Exception {
		Connection connection = null;
		JasperPrint jasperPrint = null;
		JasperReport jasperReport = null;
		try {
			connection = new CubeProDataSource().getConnection();
			jasperReport = JasperCompileManager.compileReport(reportUri);
			jasperPrint = JasperFillManager.fillReport(jasperReport,
					parameters, connection);
		} finally {
			connection.close();
		}
		return jasperPrint;
		// ResourceDescriptor rd = new ResourceDescriptor();
		// rd.setWsType( ResourceDescriptor.TYPE_REPORTUNIT);
		// rd.setUriString(reportUri);

		// return server.getWSClient().runReport(rd, parameters);
	}

	public ResourceDescriptor put(String type, String name, String label,
			String desc, String parentFolder) throws Exception {
		ResourceDescriptor rd = new ResourceDescriptor();
		rd.setName(name);
		rd.setLabel(label);
		rd.setDescription(desc);
		rd.setParentFolder(parentFolder);
		rd.setUriString(rd.getParentFolder() + "/" + rd.getName());
		rd.setWsType(type);
		rd.setIsNew(true);

		if (type.equalsIgnoreCase(ResourceDescriptor.TYPE_FOLDER)) {
			return server.getWSClient().addOrModifyResource(rd, null);
		} else if (type.equalsIgnoreCase(ResourceDescriptor.TYPE_REPORTUNIT)) {
			return putReportUnit(rd);
		}

		// shouldn't reach here
		return null;

	}

	public ResourceDescriptor update(String name, String label, String desc,
			String parentFolder) throws Exception {
		ResourceDescriptor rd = get(parentFolder + "/" + name);
		rd.setLabel(label);
		rd.setDescription(desc);
		rd.setIsNew(false);

		// remove children for the update to be effective
		rd.setChildren(new ArrayList());

		return server.getWSClient().addOrModifyResource(rd, null);
	}

	public void delete(String uri) throws Exception {
		ResourceDescriptor rd = new ResourceDescriptor();
		;
		rd.setUriString(uri);

		server.getWSClient().delete(rd);
	}

	private ResourceDescriptor putReportUnit(ResourceDescriptor rd)
			throws Exception {
		File resourceFile = null;

		ResourceDescriptor tmpDataSourceDescriptor = new ResourceDescriptor();
		tmpDataSourceDescriptor.setWsType(ResourceDescriptor.TYPE_DATASOURCE);
		tmpDataSourceDescriptor.setReferenceUri(reportUnitDataSourceURI);
		tmpDataSourceDescriptor.setIsReference(true);
		rd.getChildren().add(tmpDataSourceDescriptor);

		ResourceDescriptor jrxmlDescriptor = new ResourceDescriptor();
		jrxmlDescriptor.setWsType(ResourceDescriptor.TYPE_JRXML);
		jrxmlDescriptor.setName("test_jrxml");
		jrxmlDescriptor.setLabel("Main jrxml");
		jrxmlDescriptor.setDescription("Main jrxml");
		jrxmlDescriptor.setIsNew(true);
		jrxmlDescriptor.setHasData(true);
		jrxmlDescriptor.setMainReport(true);
		rd.getChildren().add(jrxmlDescriptor);

		resourceFile = new File(getFileResourceURL("test.jrxml"));

		return server.getWSClient().addOrModifyResource(rd, resourceFile);

	}

	/**
	 * Fetches the URL of the Files in the classpath
	 * 
	 * @return file path
	 */
	private String getFileResourceURL(String name) {
		return getClass().getClassLoader().getResource(name).getFile();
	}
}
