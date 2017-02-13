/**
 * 
 */
package com.cubepro.util;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.zip.GZIPInputStream;
import java.util.zip.GZIPOutputStream;

import org.apache.struts.upload.FormFile;

import com.cubepro.general.components.Log;

/**
 * @author sajeev.sreekantan
 *
 */
public final class FileUtils {

	private static final int BUFFER_SIZE = 8192;
	
	// Should not initialize!
	private FileUtils() throws IllegalAccessException {
		throw new IllegalAccessException("Utility class should not be initialized!");
	}

	/**
	 * Converting a File Object into a Blob Object
	 * 
	 * @param file
	 * @return
	 * @throws IOException 
	 */
	public static Blob convertFileToBlob(File file) throws IOException{
		FileInputStream fis = new FileInputStream(file);
		//Create byte array large enough to hold the content of the file.       
		//Using File.length to determine size of the file in bytes.
		byte fileContent[] = new byte[(int)file.length()];
		//To read content of the file in byte array, using the  
		//int read(byte[] byteArray) method of java FileInputStream class. 
		fis.read(fileContent);
		java.sql.Blob blobData = null;//DB2LobFactory.createBlob(fileContent);//converting to blob
		fis.close();
		return blobData;
	}
	
	/**
	 * Converting a Byte[] into a Blob Object
	 * 
	 * @param file
	 * @return
	 */
	public static Blob convertByteArrayToBlob(byte fileContent[]){
		java.sql.Blob blobData = null;//DB2LobFactory.createBlob(fileContent);//converting to blob		
		return blobData;
	}

	/**
	 * Converts formfile to blob
	 * 
	 * @param formFile
	 * @param compress
	 * @return blob
	 * @throws IOException 
	 * @throws FileNotFoundException 
	 */
	public static Blob convertFormFileToBlob(FormFile formFile, boolean compress) throws FileNotFoundException, IOException {
		Blob blob = null;
		File tempFile = convertFormFileToFile(".",formFile, compress);
		blob = convertFileToBlob(tempFile);
		if (tempFile != null) {
			tempFile.delete();
		}		
		return blob;
	}
	
	/**
	 * Converts formfile to blob
	 * 
	 * @param formFile
	 * @param compress
	 * @return blob
	 * @throws IOException 
	 * @throws FileNotFoundException 
	 */
	public static File convertFormFileToFile(String rootPath, FormFile formFile, boolean compress) throws FileNotFoundException, IOException {
		File file = null;
		OutputStream outputStream = null;
		InputStream inputStream = null;
		if(formFile != null && formFile.getFileSize() > 0) {//TODO: Needs to give a temp file path
			//StringBuilder fileName = new StringBuilder("AttachmentData_").append(DateUtils.now().getTime()).append("_").append(formFile.getFileName());
			try {
				inputStream = formFile.getInputStream();
				file = new File(rootPath);
				outputStream = new FileOutputStream(file);
				if (compress) {
					outputStream = new GZIPOutputStream(outputStream);
				}
				copy(inputStream, outputStream);
				outputStream.close();				
			} finally {
				if (inputStream != null) {
					inputStream.close();
				}
				if (outputStream != null) {
					outputStream.close();
				}				
			}
		}
		return file;
	}
	
	/**
	 * Method to create a temp file
	 * 
	 * @param fileName
	 * @return temp file
	 * @throws IOException
	 */
	public static File createTempFile(String fileName) throws IOException {
		//TODO: Need to specify a temp directory
		File tempFile = File.createTempFile("AttachmentFileData_", fileName);
		tempFile.deleteOnExit();
		return tempFile;
	}
	
	/**
	 * Method to convert DB file data to a File
	 * 
	 * @param attachment
	 * @return File
	 * @throws SQLException 
	 * @throws IOException 
	 */
	public static File convert(FileAttachment attachment) throws IOException, SQLException {
		return convertBlobToFile(attachment.getObject(), attachment.getName(), attachment.getCompressed(), true);
	}
	
	/**
	 * Method to create an output file from given blob.
	 * 
	 * @param blob
	 * @param fileName
	 * @param compress
	 * @param hasIntermediateCommit
	 * @return file
	 * @throws IOException
	 * @throws SQLException
	 */
	public static File convertBlobToFile(Blob blob, String fileName, boolean compress, boolean hasIntermediateCommit) throws IOException, SQLException{
		InputStream inputStream = null;
		OutputStream outputStream = null;
		File tempFile = null;
		try {
			inputStream = blob.getBinaryStream();
			//If there is a chance for intermediate commits, then create a tempfile to avoid 'Blob' close exception
			if (hasIntermediateCommit) {
				//Create a temp file and write into it
				tempFile = new File("AttachmentDataFile_" + fileName);
				outputStream = new FileOutputStream(tempFile);
				copy(inputStream, outputStream);
				outputStream.close();
				inputStream.close();
				inputStream = new BufferedInputStream(new FileInputStream(tempFile));
			}
			if (compress) {
				inputStream = new GZIPInputStream(inputStream);
			}
			
			//Create output file
			File outFile = new File(fileName);
			outputStream = new BufferedOutputStream(new FileOutputStream(outFile));
			copy(inputStream, outputStream);
			outputStream.close();
			inputStream.close();
			return outFile;
		} finally {
			if (outputStream != null) {
				outputStream.close();
			}
			if (inputStream != null) {
				inputStream.close();
			}
			if (tempFile != null) {
				tempFile.delete();
			}
		}
	}
	
	/**
	 * Sends a file to an output stream
	 * 
	 * @param file
	 * @param outputStream
	 * @throws IOException
	 */
	public static void sendFile(File file, OutputStream outputStream) throws IOException {
		if (file == null){
			throw new IllegalArgumentException("File should not be null");
		}
		InputStream inputStream = null;
		try {
			inputStream = new FileInputStream(file);
			copy(inputStream, outputStream);
		}
		finally {
			if (inputStream != null) {
				inputStream.close();
			}
		}
	}

	/**
	 * Method to copy data from inputstream to output stream
	 * 
	 * @param inputStream
	 * @param outputStream
	 * @throws IOException
	 */
	public static void copy(InputStream inputStream, OutputStream outputStream) throws IOException {
		byte[] buffer = new byte[BUFFER_SIZE];
		int bytesRead;
		while ((bytesRead = inputStream.read(buffer)) >= 0) {
			outputStream.write(buffer, 0, bytesRead);
		}
	}
	
	/**
	 * Method to write input stream into a file
	 * 
	 * @param inputStream
	 * @param file
	 * @throws IOException 
	 */
	public static void writeInputStreamToFile(InputStream inputStream, File file) throws IOException {
		
		if (inputStream == null || file == null){
			throw new IllegalArgumentException("InputStream/file should not be null");
		}
		
		try {
			DataOutputStream outputStream = new DataOutputStream(new BufferedOutputStream(new FileOutputStream(file)));
			int readByte;
			while((readByte = inputStream.read()) != -1) {
				outputStream.writeByte(readByte);
			}
			inputStream.close();
			outputStream.close();
		}
		catch(IOException ioException) {
			Log.error(FileUtils.class, "Error Writing/Reading Streams.", ioException);
			throw new IOException();
		}
	}
	
	/**
	 * Method to get the instance of the file in the class path with the given name
	 * 
	 * @param qualifiedFileName - File should be available in the class path with the given name
	 * @return
	 * @throws IOException
	 */
	public static File getFileInstanceInClassPath(String qualifiedFileName) throws IOException {
		
		int fileNameStartIndex = qualifiedFileName.lastIndexOf("/");
		String fileName = qualifiedFileName.substring(fileNameStartIndex+1);
		File schemaFile = new File(fileName);
		ClassLoader classLoader = Thread.currentThread().getContextClassLoader();
		FileUtils.writeInputStreamToFile(classLoader.getResourceAsStream(qualifiedFileName), schemaFile);
		return schemaFile;
	}
}