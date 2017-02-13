package com.cubepro.util;

import java.io.File;
import java.io.IOException;
import java.io.OutputStream;

import javax.servlet.http.HttpServletResponse;

/**
 * Streams a file to http client. 
 * 
 * @author sajeev.sreekantan
 * 
 */
public final class FileStreamer {

	private static final String HEADER_CONTENT_DISPOSITION = "Content-Disposition";
	private File file;
	private long fileLength;
	private FileType fileType;
	private String targetFileName;

	public FileStreamer(FileAttachmentDTO<? extends EntityWithAttachment> fileDTO) {
		this.file = fileDTO.getFileData();
		validateFile();
		this.fileType = fileDTO.getFileType();
		this.targetFileName = fileDTO.getFileName();
	}

	public FileStreamer(File file, FileType fileType, String targetFileName) {
		this.file = file;
		validateFile();
		this.fileType = fileType;
		this.targetFileName = targetFileName;
	}
	
	/**
	 * Sends a file to user as attachment
	 * Popup save as dialog.
	 * Closes output stream after the work is complete. 
	 * 
	 * @param response
	 * @throws IOException
	 */
	public void sendAttachment(HttpServletResponse response) throws IOException {
		OutputStream outputStream = null;
		try {
			setHeaders(response);
			outputStream = response.getOutputStream();
			FileUtils.sendFile(file, outputStream);
		} finally {
			if (outputStream != null) {
				outputStream.close();
			}
		}
	}

	//Set the response headers
	private void setHeaders(HttpServletResponse response) {
		response.setContentType(fileType.getName());
		response.setCharacterEncoding(null);
		String contentDisposition;
		if (fileLength > 0) {
			response.setContentLength((int) fileLength);
			contentDisposition = "attachment; filename=\"" + targetFileName + "\"; size=\"" + fileLength + "\"";
		} else {
			contentDisposition = "attachment; filename=\"" + targetFileName + "\"";
		}
		response.setHeader(HEADER_CONTENT_DISPOSITION, contentDisposition);
	}

	// Method to perform sanity checks
	private void validateFile() {
		if (file == null) {
			throw new IllegalArgumentException("Null file is not allowed");
		}
		if (!file.exists()) {
			throw new IllegalArgumentException("File does not exist: " + file);
		}
		if (file.isDirectory()) {
			throw new IllegalArgumentException("File is a directory: " + file);
		}
		if (!file.canRead()) {
			throw new IllegalArgumentException("File is unreadable: " + file);
		}
		this.fileLength = file.length();
		if (fileLength > Integer.MAX_VALUE) {
			// HttpServletResponse only accepts int content-length. Managing
			// files over 2GB is a bad idea anyway.
			throw new IllegalArgumentException("File is too big: " + file + " - " + fileLength);
		}
	}
}