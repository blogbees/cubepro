package com.cubepro.registration.helper;

import java.util.List;

import org.apache.struts.upload.FormFile;
import org.hibernate.HibernateException;
import org.hibernate.Session;

import com.cubepro.general.components.Log;
import com.cubepro.registration.SchoolDetails;
import com.cubepro.registration.service.SchoolDetailsService;
import com.cubepro.util.FileUtils;

public class SchoolDetailsHelper {
	public SchoolDetails findAll(Session session) throws HibernateException {
		List<SchoolDetails> schoolDetails = null;
		try {
			SchoolDetailsService schoolDetailService = new SchoolDetailsService();
			schoolDetails = schoolDetailService.findAll(session);
		} catch (HibernateException e) {
			Log.error(getClass(),"exception",e);
			throw e;
		}
		return schoolDetails.get(0);
	}

	public boolean saveSchoolDetails(SchoolDetails schoolDetails, Session session){
		SchoolDetailsService schoolDetailsService = new SchoolDetailsService();
		//TimeTableDetails timeTableRecord = null;
		schoolDetailsService.saveSchoolDetails(schoolDetails, session);
		return true;
	}

	public boolean persistSchoolImage(String rootPath, FormFile schoolPhoto,
			SchoolDetails schoolDetails) throws Exception {
		Log.debug(this.getClass(), "contentType -"
				+ schoolPhoto.getContentType() + "fileName ="
				+ schoolPhoto.getFileName() + "fileSize ="
				+ schoolPhoto.getFileSize() + " rootPath-" + rootPath);
		// convert the image stream to file and save
		String filePath = rootPath + "/" + schoolDetails.getSchoolId() + ".jpg";
		schoolDetails.setLogo("/CubePro/photos/" + schoolDetails.getSchoolId()
				+ ".jpg");
		FileUtils.convertFormFileToFile(filePath, schoolPhoto, false);
		return true;
	}

}
