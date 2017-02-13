package com.cubepro.util;

import java.util.Arrays;
import java.util.EnumSet;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.cubepro.components.CodeAndNameEnum;

/**
 * @author sajeev.sreekantan
 *
 */
public enum FileType implements CodeAndNameEnum {
	/* 1 - 10 Reserved for text related file types */
	TEXT_PLAIN(1,"text/plain"),
	TEXT_HTML(2,"text/html"),
	TEXT_CSS(3, "text/css"),
	TEXT_XML(4, "text/xml"),
	
	/* 11 - 50 Reserved for image related file types */
	IMAGE_GIF(11, "image/gif"),
	IMAGE_X_PNG(12, "image/x-png"),
	IMAGE_JPEG(13, "image/jpeg"),
	IMAGE_JPG(14, "image/jpg"),
	IMAGE_TIFF(15, "image/tiff"),
	IMAGE_TIF(16, "image/tif"),
	IMAGE_MS_BMP(17, "image/x-ms-bmp"),
	IMAGE_BMP(18, "image/bmp"),
	IMAGE_P_JPEG(19, "image/pjpeg"),
	IMAGE_PNG(20, "image/png"),
	
	/* After 50  for application related file types */
	APPLICATION_PS(51,"application/postscript"),
	APPLICATION_RTF(52,"application/rtf"),
	APPLICATION_PDF(53,"application/pdf"),
	APPLICATION_DOC(54,"application/msword"),
	APPLICATION_XLS(55,"application/vnd.ms-excel"),
	APPLICATION_PPT(56,"application/vnd.ms-powerpoint"),
	APPLICATION_EXE(57,"application/octet-stream"),
	APPLICATION_BIN(58,"application/binary"),	
	APPLICATION_MS_DOWNLOAD(59,"application/x-msdownload"),
	OTHER(60,"Other");

	
	private static final Map<Integer, FileType> VALUES_BY_CODE_LOOKUP;
	private static final Map<String, FileType> VALUES_BY_TYPE_LOOKUP;
	
	public static final List<String> ALL_IMAGE_FILE_TYPES = Arrays.asList(IMAGE_GIF.getName(), IMAGE_X_PNG.getName(), IMAGE_JPEG.getName(), IMAGE_JPG.getName(), IMAGE_TIFF.getName(), IMAGE_TIF.getName(), IMAGE_MS_BMP.getName(), IMAGE_BMP.getName(), IMAGE_P_JPEG.getName(), IMAGE_PNG.getName());

	static {
		VALUES_BY_CODE_LOOKUP = new HashMap<Integer, FileType>();
		VALUES_BY_TYPE_LOOKUP = new HashMap<String, FileType>();
		for (FileType fileType : EnumSet.allOf(FileType.class)) {
			if (VALUES_BY_CODE_LOOKUP.get(fileType.getCode()) != null) {
				throw new IllegalStateException("Duplicate code:" + fileType.getCode());
			}
			if (VALUES_BY_TYPE_LOOKUP.get(fileType.getName()) != null) {
				throw new IllegalStateException("Duplicate value:" + fileType.getName());
			}
			VALUES_BY_CODE_LOOKUP.put(fileType.getCode(), fileType);
			VALUES_BY_TYPE_LOOKUP.put(fileType.getName(), fileType);
		}
	}

	/**
	 * Method to get the file type from given code
	 * 
	 * @param code
	 * @return CodeEnum
	 */
	public static FileType getValue(int code) {
		
		FileType codeEnum = VALUES_BY_CODE_LOOKUP.get(code);
		if (codeEnum == null) {
			throw new IllegalStateException("Invalid Code: " + code);
		}
		return codeEnum;
	}
	
	/**
	 * Method to get the file type from given value	
	 * @param value
	 * @return CodeEnum
	 */
	public static FileType getValue(String value) {
		FileType codeEnum = VALUES_BY_TYPE_LOOKUP.get(value);
		if (codeEnum == null) {
			throw new IllegalStateException("Invalid value: " + value);
		}
		return codeEnum;
	}

	private int code;
	private String name;
	
	private FileType(int code, String name) {
		this.code = code;
		this.name = name;
	}
	
	public String getName() {
		return name;
	}

	public int getCode() {
		return code;
	}
}