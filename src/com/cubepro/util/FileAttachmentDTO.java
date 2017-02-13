package com.cubepro.util;

import java.io.File;

/**
 * Data holder for file attachments.
 * NOTE: Don't put this object in session!  
 * 
 * @author sajeev.sreekantan
 *
 */
public final class FileAttachmentDTO<Entity extends EntityWithAttachment> {

	private String fileIdString;
	private String fileName;
	private File fileData;
	private FileType fileType;
	private boolean compressed;
	private Entity entity;
	private int sequence;
	
	public String getFileIdString() {
		return fileIdString;
	}
	public void setFileIdString(String fileIdString) {
		this.fileIdString = fileIdString;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public File getFileData() {
		return fileData;
	}
	public void setFileData(File fileData) {
		this.fileData = fileData;
	}
	public FileType getFileType() {
		return fileType;
	}
	public void setFileType(FileType fileType) {
		this.fileType = fileType;
	}
	public boolean isCompressed() {
		return compressed;
	}
	public void setCompressed(boolean compressed) {
		this.compressed = compressed;
	}
	public Entity getEntity() {
		return entity;
	}
	public void setEntity(Entity entity) {
		this.entity = entity;
	}
	public int getSequence() {
		return sequence;
	}
	public void setSequence(int sequence) {
		this.sequence = sequence;
	}
}
