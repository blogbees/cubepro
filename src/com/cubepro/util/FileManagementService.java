/**
 * 
 */
package com.cubepro.util;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Collection;

import org.hibernate.HibernateException;
import org.hibernate.Session;

/**
 * Manages all the file attachments
 * 
 * @author sajeev.sreekantan
 *
 */
public interface FileManagementService<Entity extends EntityWithAttachment> {

	/**
	 * Creates a new file in the DB.
	 * 
	 * @param fileDTO
	 * @param session
	 * @throws HibernateException
	 * @throws IOException
	 */
	public boolean createNewFile(FileAttachmentDTO<Entity> fileDTO, Session session) throws HibernateException, IOException;
	
	/**
	 * Updates an existing file in DB
	 * 
	 * @param fileDTO
	 * @param session
	 * @throws HibernateException
	 * @throws IOException
	 */
	public boolean modifyFile(FileAttachmentDTO<Entity> fileDTO, Session session) throws HibernateException, IOException;
	
	/**
	 * Deletes a file from DB
	 * 
	 * @param fileDTO
	 * @param session
	 * @throws HibernateException
	 */
	public boolean removeFile(FileAttachmentDTO<Entity> fileDTO, Session session) throws HibernateException;
	
	/**
	 * Retrieve a file for the give file id from the DB
	 * 
	 * @param fileId
	 * @param loadFileData
	 * @param session
	 * @return file attachment
	 * @throws HibernateException
	 * @throws IOException
	 * @throws SQLException
	 */
	public FileAttachmentDTO<Entity> getFile(Long fileId, boolean loadFileData, Session session) throws HibernateException, IOException, SQLException;
	
	/**
	 * Retrieves collection of files for the given entity
	 * 
	 * @param loadFileData
	 * @param session
	 * @return collection of files
	 * @throws HibernateException
	 * @throws IOException
	 * @throws SQLException
	 */
	public Collection<FileAttachmentDTO<Entity>> getFiles(boolean loadFileData, Session session) throws HibernateException, IOException, SQLException;
	
	/**
	 * Retrieves collection of files for the given entity
	 * 
	 * @param sequence
	 * @param loadFileData
	 * @param session
	 * @return collection of files
	 * @throws HibernateException
	 * @throws IOException
	 * @throws SQLException
	 */
	public Collection<FileAttachmentDTO<Entity>> getFiles(Integer sequence[], boolean loadFileData, Session session) throws HibernateException, IOException, SQLException;
}