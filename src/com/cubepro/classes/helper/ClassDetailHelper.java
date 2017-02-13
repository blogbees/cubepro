package com.cubepro.classes.helper;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;

import com.cubepro.classes.ClassDetails;
import com.cubepro.classes.service.ClassDetailService;
import com.cubepro.general.components.Log;

public class ClassDetailHelper {

	public List<ClassDetails> findAll(Session session, boolean isAll) throws HibernateException {
		List<ClassDetails> classDetails = null;
		try {
			ClassDetailService classDetailService = new ClassDetailService();
			classDetails = classDetailService.findAll(session, isAll);
		} catch (HibernateException e) {
			Log.error(this.getClass(), "exception occured e-", e);
			throw e;
		}
		return classDetails;
	}

	public List<ClassDetails> findAll(Session session) throws HibernateException {
		return findAll(session, false);
	}

	public boolean saveClassDetail(ClassDetails classDetails, Session session) throws HibernateException {
		ClassDetailService classDetailService = new ClassDetailService();
		classDetailService.saveClassDetail(session,classDetails);
		return true;
	}
	
	public boolean deleteClassDetail(String classId, Session session) throws HibernateException {
		ClassDetailService classDetailService = new ClassDetailService();
		classDetailService.deleteClassDetail(session,findByClassId(Integer.valueOf(classId), session));
		return true;
	}

	public ClassDetails findByClassId(int classId, Session session)
			throws HibernateException {
		ClassDetails classDetails = null;
		try {

			ClassDetailService classDetailService = new ClassDetailService();
			classDetails = classDetailService.findByClassId(Integer.valueOf(classId), session);
		} catch (HibernateException e) {
			Log.error(this.getClass(), "EXCEption occured ...", e);
			throw e;
		}
		return classDetails;
	}
	
	
}
