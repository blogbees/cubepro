package com.cubepro.util;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;

import org.hibernate.HibernateException;
import org.hibernate.Session;

import com.cubepro.general.components.Log;

/**
 *
 */
public final class FileManagementServiceImpl<Entity extends EntityWithAttachment> implements FileManagementService<Entity> {

	private FileAttachmentDAO dao = new FileAttachmentDAO();
	
	private Entity entity;
	
	public FileManagementServiceImpl(Entity entity) {
		this.entity = entity; 
	}
	/* (non-Javadoc)
	 * @see gov.nrega.business.filemgmt.FileManagementService#createNewFile(gov.nrega.business.filemgmt.FileAttachmentDTO, org.hibernate.Session)
	 */
	public boolean createNewFile(FileAttachmentDTO<Entity> fileDTO, Session session) throws HibernateException, IOException {
		FileAttachment attachment = new FileAttachment();
		populateAttachment(attachment, fileDTO);
		//dao.saveNewFile(attachment, session);
		if (attachment.getFileAttachmentId() == null) {
			Log.warn(FileAttachment.class, "Attachment not inserted...." + attachment);
			return false;
		}
		fileDTO.setFileIdString(attachment.getFileAttachmentId().toString());
		return true;
	}

	/* (non-Javadoc)
	 * @see gov.nrega.business.filemgmt.FileManagementService#getFile(java.lang.Long, boolean, org.hibernate.Session)
	 */
	public FileAttachmentDTO<Entity> getFile(Long fileId, boolean loadFileData, Session session) throws HibernateException, IOException, SQLException {
		FileAttachment attachment = null;//dao.loadFile(fileId, loadFileData, session);
		FileAttachmentDTO<Entity> attachmentDTO = populateAttachmentDTO(attachment, loadFileData);
		return attachmentDTO;
	}

	/* (non-Javadoc)
	 * @see gov.nrega.business.filemgmt.FileManagementService#getFiles(boolean, org.hibernate.Session)
	 */
	public Collection<FileAttachmentDTO<Entity>> getFiles(boolean loadFileData, Session session) throws HibernateException {
		Long entityId = entity.getEntityId();
		Integer entityType = entity.getEntityType().getCode();
		Collection<FileAttachment> attachments = null;//dao.loadFiles(entityId, entityType, loadFileData, session);
		Collection<FileAttachmentDTO<Entity>> fileAttachments = null;
		try {
			fileAttachments = populateAttachmentDTOs(attachments, loadFileData);	
		} catch (IOException e) {		
			Log.error(FileAttachment.class, "IO Exception Occured while getting files for entity " + entity.getEntityType().getName() + "whose Id is " + entityId , e);
		} catch (SQLException e) {
			Log.error(FileAttachment.class, "SQL Exception Occured while getting files for entity " + entity.getEntityType().getName() + "whose Id is " + entityId , e);
		}
		return fileAttachments;
	}

	/* (non-Javadoc)
	 * @see gov.nrega.business.filemgmt.FileManagementService#modifyFile(gov.nrega.business.filemgmt.FileAttachmentDTO, org.hibernate.Session)
	 */
	public boolean modifyFile(FileAttachmentDTO<Entity> fileDTO, Session session) throws HibernateException, IOException {
		FileAttachment attachment = null;//dao.loadFile(Long.valueOf(fileDTO.getFileIdString()), false, session);
		if (attachment == null) {
			Log.warn(FileAttachment.class, "Invalid attachment...." + attachment);
			return false;
		}
		populateAttachment(attachment, fileDTO);
		//dao.saveFile(attachment, session);
		return  true;
	}

	/* (non-Javadoc)
	 * @see gov.nrega.business.filemgmt.FileManagementService#removeFile(gov.nrega.business.filemgmt.FileAttachmentDTO, org.hibernate.Session)
	 */
	public boolean removeFile(FileAttachmentDTO<Entity> fileDTO, Session session) throws HibernateException {
		FileAttachment attachment = null;//dao.loadFile(Long.valueOf(fileDTO.getFileIdString()), true, session);
		if (attachment == null) {
			Log.warn(FileAttachment.class, "Invalid attachment...." + attachment);
			return false;
		}
		//dao.deleteFile(attachment, session);
		return true;
	}
	
	//Method to load all the attachments related to an entity
	private Collection<FileAttachmentDTO<Entity>> populateAttachmentDTOs(Collection<FileAttachment> attachments, boolean loadFileData) throws HibernateException, IOException, SQLException {
		Collection<FileAttachmentDTO<Entity>> attachmentDTOs = new ArrayList<FileAttachmentDTO<Entity>>();
		for (FileAttachment attachment : attachments) {
			FileAttachmentDTO<Entity> attachmentDTO = populateAttachmentDTO(attachment, loadFileData);
			if (attachmentDTO != null) {
				attachmentDTOs.add(attachmentDTO);
			}
		}
		return attachmentDTOs;
	}

	//Method to populate a Attachment File DTO from DB File Attachment Data
	private FileAttachmentDTO<Entity> populateAttachmentDTO(FileAttachment attachment, boolean loadFileData) throws HibernateException, IOException, SQLException {
		FileAttachmentDTO<Entity> attachmentDTO = new FileAttachmentDTO<Entity>();
		attachmentDTO.setFileIdString(attachment.getFileAttachmentId().toString());
		attachmentDTO.setFileName(attachment.getName());
		attachmentDTO.setFileType(FileType.getValue(attachment.getContentTypeId()));
		attachmentDTO.setSequence(attachment.getSequenceNumber());
		attachmentDTO.setCompressed(attachment.getCompressed());
		attachmentDTO.setEntity(this.entity);
		if (loadFileData) {
			attachmentDTO.setFileData(FileUtils.convert(attachment));
		}
		return attachmentDTO;
	}
	
	//Method to populate DB file attachment from attachment DTO 
	private void populateAttachment(FileAttachment attachment, FileAttachmentDTO<Entity> attachmentDTO) throws IOException {
		attachment.setEntityId(attachmentDTO.getEntity().getEntityId());
		attachment.setEntityType(attachmentDTO.getEntity().getEntityType().getCode());
		attachment.setName(attachmentDTO.getFileName());
		attachment.setSequenceNumber(attachmentDTO.getSequence());
		attachment.setCompressed(attachmentDTO.isCompressed());
		attachment.setContentTypeId(attachmentDTO.getFileType().getCode());
		attachment.setObject(FileUtils.convertFileToBlob(attachmentDTO.getFileData()));
	}
	
	/* (non-Javadoc)
	 * @see gov.nrega.business.filemgmt.FileManagementService#getFiles(java.lang.Integer[], boolean, org.hibernate.Session)
	 */
	public Collection<FileAttachmentDTO<Entity>> getFiles(Integer sequence[], boolean loadFileData, Session session) throws HibernateException {
		Long entityId = entity.getEntityId();
		Integer entityType = entity.getEntityType().getCode();
		Collection<FileAttachment> attachments = null;//dao.loadFiles(entityId, entityType, sequence, loadFileData, session);
		Collection<FileAttachmentDTO<Entity>> fileAttachments = null;
		try {
			fileAttachments = populateAttachmentDTOs(attachments, loadFileData);	
		} catch (IOException e) {		
			Log.error(FileAttachment.class, "IO Exception Occured while getting files for entity " + entity.getEntityType().getName() + "whose Id is " + entityId , e);
		} catch (SQLException e) {
			Log.error(FileAttachment.class, "SQL Exception Occured while getting files for entity " + entity.getEntityType().getName() + "whose Id is " + entityId , e);
		}
		return fileAttachments;
	}
	
}