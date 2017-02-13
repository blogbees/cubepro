package com.cubepro.util;

import static com.cubepro.util.DateUtils.now;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Blob;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.text.SimpleDateFormat;

//import com.ibm.db2.jcc.t2zos.DB2LobFactory;
/**
 * Util class for Database related methods
 * 
 * @author sajeev.sreekantan
 * 
 */
public final class SQLUtils {

	static SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
	
	public static final String CONVERT_TO_CHAR_FUNCTION = "char"; //number to char conversion function in db2
	
	// Should not initialize!
	private SQLUtils() throws IllegalAccessException {
		throw new IllegalAccessException("Utility class should not be initialized!");
	}

	/**
	 * Set a Long Object value in the prepared statement. This will also handle nulls.
	 * 
	 * @param index
	 * @param preparedStatement
	 * @param value
	 * @throws SQLException
	 */
	public static void setParameter(int index, PreparedStatement preparedStatement, Long value)	throws SQLException {
		if (value == null) {
			preparedStatement.setNull(index, Types.BIGINT);
		} else {
			preparedStatement.setLong(index, value.longValue());
		}
	}

	/**
	 * Set a Integer Object value in the prepared statement. This will also handle nulls.
	 * 
	 * @param index
	 * @param preparedStatement
	 * @param value
	 * @throws SQLException
	 */
	public static void setParameter(int index, PreparedStatement preparedStatement, Integer value) throws SQLException {
		if (value == null) {
			preparedStatement.setNull(index, Types.INTEGER);
		} else {
			preparedStatement.setInt(index, value.intValue());
		}
	}

	/**
	 * Set a Double Object value in the prepared statement. This will also handle nulls.
	 * 
	 * @param index
	 * @param preparedStatement
	 * @param value
	 * @throws SQLException
	 */
	public static void setParameter(int index, PreparedStatement preparedStatement, Double value) throws SQLException {
		if (value == null) {
			preparedStatement.setNull(index, Types.DECIMAL);
		} else {
			preparedStatement.setDouble(index, value.doubleValue());
		}
	}

	/**
	 * Set a Boolean Object value in the prepared statement. This will also handle nulls.
	 * 
	 * @param index
	 * @param preparedStatement
	 * @param value
	 * @throws SQLException
	 */
	public static void setParameter(int index, PreparedStatement preparedStatement, Boolean value) throws SQLException {
		if (value == null) {
			preparedStatement.setNull(index, Types.INTEGER);
		} else {
			preparedStatement.setBoolean(index, value.booleanValue());
		}
	}

	/**
	 * Set a String Object value in the prepared statement. This will also handle nulls.
	 * 
	 * @param index
	 * @param preparedStatement
	 * @param value
	 * @throws SQLException
	 */
	public static void setParameter(int index, PreparedStatement preparedStatement, String value) throws SQLException {
		if (value == null) {
			preparedStatement.setNull(index, Types.VARCHAR);
		} else {
			preparedStatement.setString(index, value);
		}
	}
	
	/**
	 * Get a Long from the resultset returning null, instead of zero, if the result set is null.
	 * 
	 * @param resultSet
	 * @param columnName
	 * @return A Long object or null if the result set was null.
	 * @throws SQLException
	 */
	public static Long getLong(ResultSet resultSet, String columnName) throws SQLException {
		Long value = null;
		long tmpValue = resultSet.getLong(columnName);
		if (!resultSet.wasNull()) {
			value = Long.valueOf(tmpValue);
		}
		return value;
	}

	/**
	 * Get a Integer from the resultset returning null, instead of zero, if the result set is null.
	 * 
	 * @param resultSet
	 * @param columnName
	 * @return A Integer object or null if the result set was null.
	 * @throws SQLException
	 */
	public static Integer getInteger(ResultSet resultSet, String columnName) throws SQLException {
		Integer value = null;
		int tmpValue = resultSet.getInt(columnName);
		if (!resultSet.wasNull()) {
			value = Integer.valueOf(tmpValue);
		}
		return value;
	}

	/**
	 * Get a Double from the resultset returning null, instead of zero, if the result set is null.
	 * 
	 * @param resultSet
	 * @param columnName
	 * @return A Double object or null if the result set was null.
	 * @throws SQLException
	 */
	public static Double getDouble(ResultSet resultSet, String columnName) throws SQLException {
		Double value = null;
		double tmpValue = resultSet.getDouble(columnName);
		if (!resultSet.wasNull()) {
			value = Double.valueOf(tmpValue);
		}
		return value;
	}

	/**
	 * Get a Boolean from the resultset.
	 * 
	 * @param resultSet
	 * @param columnName
	 * @return A Boolean object.
	 * @throws SQLException
	 */
	public static Boolean getBoolean(ResultSet resultSet, String columnName) throws SQLException {
		boolean tmpValue = resultSet.getBoolean(columnName);
		return Boolean.valueOf(tmpValue);
	}
	
	/**
	 * Method to close DB Objects
	 * 
	 * @param preparedStatement
	 * @param resultSet
	 * @throws SQLException
	 */
	public static void closeDBObjects(PreparedStatement preparedStatement, ResultSet resultSet) throws SQLException {
		if (resultSet != null) {
			resultSet.close();
		}
		if (preparedStatement != null) {
			preparedStatement.close();
		}
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
	 * Method to set Audit trail columns (DB level)
	 * 
	 * @param <Entity>
	 * @param entity
	 * @param user
	 */
/*	public static <Entity extends EntityModificationInfo> void setAuditTrailParameters(Entity entity, Users user) {
		entity.setCreatedOn(now());
		entity.setUpdatedOn(now());
		entity.setUsersByCreatedBy(user);
		entity.setUsersByUpdatedBy(user);
	}*/
}