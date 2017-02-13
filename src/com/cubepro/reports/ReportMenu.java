/**
 * 
 */
package com.cubepro.reports;



import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.xml.rpc.ServiceException;

import com.jaspersoft.jasperserver.api.metadata.xml.domain.impl.ResourceDescriptor;
import com.jaspersoft.jasperserver.api.metadata.xml.domain.impl.ResourceProperty;
import com.jaspersoft.jasperserver.ws.scheduling.ReportSchedulerFacade;

/**
 * @author ratnavel.sundaramurt
 *
 */
public class ReportMenu {

	/**
	 * @param <getMenu>
	 * @param args
	 */
	public static <getMenu> void main(String[] args) {
		String username = "jasperadmin";
		String password = "jasperadmin";
		String currentUri = null;
		String reportSchedulingWebServiceUrl = "http://aspire483.aspiresys.com:8080/jasperserver/services/repository";
		List<ResourceDescriptor> rootFolders = new ArrayList<ResourceDescriptor>();
		System.out.println("starting");
		try {
		WSClient client = new WSClient(reportSchedulingWebServiceUrl,
				username, password);

		ReportSchedulerFacade reportScheduler = new ReportSchedulerFacade(
				new URL(reportSchedulingWebServiceUrl), username, password);
		client.list(""); // Trick to check if the user is valid...
		
		 if (currentUri == null || currentUri.length() ==0) currentUri = "/";
		   if (currentUri.length() > 1 && currentUri.endsWith("/"))
		       currentUri = currentUri.substring(0, currentUri.length()-1);
		   String parentUri = "/";
		   if (currentUri.length() > 1 && currentUri.lastIndexOf("/") >=0)
		       parentUri = currentUri.substring(0, currentUri.lastIndexOf("/"));
		   
		   java.util.List list = null;
		   
		      list  = client.list(currentUri);
		      
		      for (int i=0; i<list.size(); ++i)
		       {
		            ResourceDescriptor rd =
		                   (ResourceDescriptor) list.get(i);
		            String type = rd.getWsType();
		            if ( !((type.equals( ResourceDescriptor.TYPE_FOLDER)) ||
		                   (type.equals( ResourceDescriptor.TYPE_REPORTUNIT))
		                   || type.equals(ResourceDescriptor.TYPE_CONTENT_RESOURCE))) {
		                continue;
		            }
		            if (type.equals( ResourceDescriptor.TYPE_FOLDER ))
		            	{	 	System.out.println(rd.getName() );
		            	
		            	getMenu(client, rd.getUriString());
		            			rd.setChildren(getMenu(client, rd.getUriString()));
	            				rootFolders.add(rd);
		            }else if (type.equals( ResourceDescriptor.TYPE_REPORTUNIT))
		            {
		            	List paramList = rd.getParameters();
		            	System.out.println(paramList.size());
		            	System.out.println("Rpt unit Name"+ rd.getName() );
		            }else if (type.equals(ResourceDescriptor.TYPE_CONTENT_RESOURCE))
		            {
//		            	System.out.println("content res Name"+ rd.getName() );
		            }
		            
		       }
		  /*    System.out.println("====================================================");
	            for (Iterator iterator = rootFolders.iterator(); iterator
						.hasNext();) {
					ResourceDescriptor folders = (ResourceDescriptor) iterator.next();
					System.out.println(folders.getName());
					if(folders.getChildren()!= null && folders.getChildren().size() > 0){
						iterateFolders(folders.getChildren());
						
					}
				}
	            System.out.println("====================================================");*/
		   } catch (MalformedURLException e) {
				e.printStackTrace();
			} catch (ServiceException e) {
				e.printStackTrace();
			} catch (Exception e) {
				e.printStackTrace();
			}
		
		
	}
	
	private static void iterateFolders(List<ResourceDescriptor> rd){
		int count = 1;
		for (Iterator<ResourceDescriptor> iterator2 = rd.iterator(); iterator2.hasNext();) {
			ResourceDescriptor folder = iterator2.next();
			count++;
			if(folder.getChildren()!= null && folder.getChildren().size() > 0){
				iterateFolders(folder.getChildren());
			}
		}
	}
	
	private static List<ResourceDescriptor> getMenu(WSClient client, String currentUri) throws Exception{
		int count = 1;
		List<ResourceDescriptor> childFolders = new ArrayList<ResourceDescriptor>();
		if (currentUri == null || currentUri.length() ==0) currentUri = "/";
		   if (currentUri.length() > 1 && currentUri.endsWith("/"))
		       currentUri = currentUri.substring(0, currentUri.length()-1);
		   String parentUri = "/";
		   if (currentUri.length() > 1 && currentUri.lastIndexOf("/") >=0)
		       parentUri = currentUri.substring(0, currentUri.lastIndexOf("/"));
		   java.util.List list = null;
		   
		      list  = client.list(currentUri);
		      for (int i=0; i<list.size(); ++i)
		       {
		            ResourceDescriptor rd =
		                   (ResourceDescriptor) list.get(i);
		            String type = rd.getWsType();
		            if ( !((type.equals( ResourceDescriptor.TYPE_FOLDER)) ||
		                   (type.equals( ResourceDescriptor.TYPE_REPORTUNIT))
		                   || type.equals(ResourceDescriptor.TYPE_CONTENT_RESOURCE))) {
		                continue;
		            }
		            if (type.equals( ResourceDescriptor.TYPE_FOLDER ))
		            {	System.out.println(count +")  "+ rd.getName() );
		            	count++;
		            	getMenu(client, rd.getUriString());
		            	rd.setChildren(getMenu(client, rd.getUriString()));
		            	childFolders.add(rd);
		            	
		            }else if (type.equals( ResourceDescriptor.TYPE_REPORTUNIT))
		            {	List<ResourceProperty> paramList = rd.getProperties();
//		            	for(ResourceProperty resourceDescriptor:paramList){
//		            		System.out.println("resourceDescriptor.getName  "+resourceDescriptor.getName());
//		            		System.out.println("resourceDescriptor.getValue  "+resourceDescriptor.getValue());
//		            	}
		            
		            	Map propertyMap = rd.getPropertyMap();
//	            		System.out.println("paramList  "+paramList.size());
//	            		System.out.println(" propertyMap    "+propertyMap.size());
		            	System.out.println("getMenu Rpt unit Name"+ rd.getName() );
		            }else if (type.equals(ResourceDescriptor.TYPE_CONTENT_RESOURCE))
		            {
		            	System.out.println("getMenu content res Name"+ rd.getName() );
		            }
		            
		       }
		      return childFolders;
	}
}
