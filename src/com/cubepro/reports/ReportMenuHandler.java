/**
 * 
 */
package com.cubepro.reports;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

/**
 * @author ratnavel.sundaramurt
 *
 */
public class ReportMenuHandler {

	
	
	/**
	 * Function to get Menu, sub menus and child menus 
	 * from the folders created dynamically in Jasperserver
	 * 
	 * @param session
	 * @return
	 */
	public List<ReportResourceDTO> getReportMenu(Session session){
		List<ReportResourceDTO> reportRootFolderList = getReportResourceFolders(session);
		List<ReportResourceDTO> reportMenuList = new ArrayList<ReportResourceDTO>();
		List<ReportResourceDTO> children = new ArrayList<ReportResourceDTO>();

		if(reportRootFolderList != null && reportRootFolderList.size() > 0){
			
			for ( ReportResourceDTO reportResourceDTO : reportRootFolderList) {
//				System.out.println(reportResourceDTO.getName());
				children = getReportResourceChildren(session, reportResourceDTO);
				reportResourceDTO.setChildren(children);
				iterateChildFolders(session, children);
				reportMenuList.add(reportResourceDTO);
			}
		}
		
		return reportMenuList;
	}
	
	/**
	 * Function to iterate through the sub menu to 
	 * 		get the children of each menu element
	 * 
	 * @param session
	 * @param children
	 */
	private void iterateChildFolders(Session session, List<ReportResourceDTO> children){
		if(children != null && children.size() > 0){
			for(ReportResourceDTO reportResourceDTO : children){
//				System.out.println(reportResourceDTO.getName());
				children = getReportResourceChildren(session, reportResourceDTO);
				reportResourceDTO.setChildren(children);
				iterateChildFolders(session, children);
			}
		}
	}
	
	/**
	 * Function to return the available folders
	 * 
	 * @param session
	 * @param parentId
	 * @return
	 */
	private List<ReportResourceDTO> getReportResourceFolders(Session session, Long parentId){
		List<ReportResourceDTO> reportResourceFolders = new ArrayList<ReportResourceDTO>();
		reportResourceFolders = getReportMenus(session, parentId);
		return reportResourceFolders;
	}
	
	/**
	 *  Function to return the available folders
	 *  	(returns only the root folders)
	 *  
	 * @param session
	 * @return
	 */
	private List<ReportResourceDTO> getReportResourceFolders(Session session){
		List<ReportResourceDTO> reportResourceFolders = new ArrayList<ReportResourceDTO>();
		reportResourceFolders = getReportMenus(session);
		return reportResourceFolders;
	}
	
	/**
	 *  Function to return the children of any folders
	 *  
	 * @param session
	 * @param reportResourceDTO
	 * @return
	 */
	private List<ReportResourceDTO> getReportResourceChildren(Session session, ReportResourceDTO reportResourceDTO){
		List<ReportResourceDTO> children = getReportResourceFolders(session, reportResourceDTO.getReportMenuId());
		return children;
	}
	
	/**
	 * Function to return List of reportmenu objects whose parent_id is null
	 * 
	 * @param session
	 * @return
	 */
	@SuppressWarnings("unchecked")
	private List<ReportResourceDTO> getReportMenus(Session session){	
		List<ReportMenu> reportResources = session.createCriteria(ReportMenu.class).add(Restrictions.isNull("parentId")).list();
		return populateReportResource(reportResources);
	}
	
	/**
	 * Function to return List of reportmenu objects
	 * @param session
	 * @param parentId
	 * @return
	 */
	@SuppressWarnings("unchecked")
	private List<ReportResourceDTO> getReportMenus(Session session, Long parentId){	
		List<ReportMenu> reportResources = session.createCriteria(ReportMenu.class).add(Restrictions.eq("parentId", parentId)).list();
		return populateReportResource(reportResources);
	}
	
	/**
	 * Function to populate DTO from Entity/Pojo
	 * @param reportResources
	 * @return
	 */
	private List<ReportResourceDTO> populateReportResource(List<ReportMenu> reportResources){
		List<ReportResourceDTO> reportResourceFolders = new ArrayList<ReportResourceDTO>();
		if(reportResources != null && reportResources.size() > 0){
			for (ReportMenu reportMenu: reportResources) {
				
			/*	ReportResourceDTO reportResourceDTO = new ReportResourceDTO();
				
				reportResourceDTO.setReportMenuId(reportMenu.getReportMenuId());
				reportResourceDTO.setName(reportMenu.getName());
				reportResourceDTO.setLabel(reportMenu.getLabel());
				reportResourceDTO.setParentId(reportMenu.getParentId());
				reportResourceDTO.setPosition(reportMenu.getPosition());
				reportResourceDTO.setCssClass(reportMenu.getCssClass());
				reportResourceDTO.setUri(reportMenu.getUri());
				reportResourceFolders.add(reportResourceDTO);
			*/	
			}
			
		}
		return reportResourceFolders;
	}
	
	public Map<String, List<ReportResourceDTO>> getReportUnitsByCategory(Session session) {
		Map<String, List<ReportResourceDTO>> reportUnitsByCategory = new HashMap<String, List<ReportResourceDTO>>();
		List<ReportResourceDTO> reportCategories = getReportResourceFolders(session);
		for(ReportResourceDTO reportCategory : reportCategories){
			List<ReportResourceDTO> reports = getReportResourceChildren(session, reportCategory);
			reportUnitsByCategory.put(reportCategory.getName(), reports);
		}
		return reportUnitsByCategory;
	}
	
}
