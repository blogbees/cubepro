/**
 * 
 */
package com.cubepro.reports;

import java.util.Date;
import java.util.List;

/**
 * @author ratnavel.sundaramurt
 *
 */
public class ReportResourceDTO {
	
	 private Long reportMenuId;
     private String name;
     private String label;
     private String uri;
     private Long parentId;
     private Integer position;
     private String cssClass;
     private Date creationDate;
     private List<ReportResourceDTO> children;
     
     
	/**
	 * @return the reportMenuId
	 */
	public Long getReportMenuId() {
		return reportMenuId;
	}
	/**
	 * @param reportMenuId the reportMenuId to set
	 */
	public void setReportMenuId(Long reportMenuId) {
		this.reportMenuId = reportMenuId;
	}
	/**
	 * @return the name
	 */
	public String getName() {
		return name;
	}
	/**
	 * @param name the name to set
	 */
	public void setName(String name) {
		this.name = name;
	}
	/**
	 * @return the label
	 */
	public String getLabel() {
		return label;
	}
	/**
	 * @param label the label to set
	 */
	public void setLabel(String label) {
		this.label = label;
	}
	/**
	 * @return the uri
	 */
	public String getUri() {
		return uri;
	}
	/**
	 * @param uri the uri to set
	 */
	public void setUri(String uri) {
		this.uri = uri;
	}
	/**
	 * @return the parentId
	 */
	public Long getParentId() {
		return parentId;
	}
	/**
	 * @param parentId the parentId to set
	 */
	public void setParentId(Long parentId) {
		this.parentId = parentId;
	}
	/**
	 * @return the position
	 */
	public Integer getPosition() {
		return position;
	}
	/**
	 * @param position the position to set
	 */
	public void setPosition(Integer position) {
		this.position = position;
	}
	/**
	 * @return the cssClass
	 */
	public String getCssClass() {
		return cssClass;
	}
	/**
	 * @param cssClass the cssClass to set
	 */
	public void setCssClass(String cssClass) {
		this.cssClass = cssClass;
	}
	/**
	 * @return the creationDate
	 */
	public Date getCreationDate() {
		return creationDate;
	}
	/**
	 * @param creationDate the creationDate to set
	 */
	public void setCreationDate(Date creationDate) {
		this.creationDate = creationDate;
	}
	/**
	 * @return the children
	 */
	public List<ReportResourceDTO> getChildren() {
		return children;
	}
	/**
	 * @param children the children to set
	 */
	public void setChildren(List<ReportResourceDTO> children) {
		this.children = children;
	}
	
}
