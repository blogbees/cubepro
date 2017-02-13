package com.cubepro.mark.service;

import java.sql.Connection;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.cubepro.general.components.Log;
import com.cubepro.general.database.CubeProDataSource;
import com.cubepro.mark.MarkDetails;
import com.cubepro.mark.StudentMarkSummary;
import com.cubepro.mark.dao.MarkDetailsDAO;
import com.cubepro.mark.dao.StudentMarkSummaryDAO;
import com.cubepro.student.StudentDetails;
import com.cubepro.student.service.StudentDetailService;
import com.cubepro.util.StringUtils;

public class MarkDetailService {
	
	
	public List<MarkDetails> getMarkListForSMS(Connection conn, int studentId, int examId) throws Exception{
		List<MarkDetails> studentAttendanceDetailList = null;
		try {
			MarkDetailsDAO markDetailsDAO = new MarkDetailsDAO();
			studentAttendanceDetailList = markDetailsDAO.getMarkListForSMS(conn, studentId, examId);
		} catch (Exception e) {
			Log.error(getClass(), "Exception occured ...", e);
			throw e;
		}finally{
		}
		return studentAttendanceDetailList;
		
	}
	/**
	 * @param searchDetails
	 * @param session
	 * @return
	 * @throws Exception
	 */
	public List<MarkDetails> getMarkList(StudentDetails searchDetails, int examId,
			Session session) throws Exception {
		List<MarkDetails> studentAttendanceDetailList = null;
		try {

			MarkDetailsDAO markDetailsDAO = new MarkDetailsDAO(session);
			studentAttendanceDetailList = markDetailsDAO
					.getMarkList(searchDetails, examId);

		} catch (Exception e) {
			Log.error(getClass(), "Exception occured ...", e);
			throw e;
		}

		return studentAttendanceDetailList;
	}
	
	public void saveStudentMarkSummary(String []studentIds, MarkDetails markDetails,Session session) throws Exception{
		StudentDetailService studentDetailService = new StudentDetailService();
		StudentMarkSummaryDAO markDetailsDAO = new StudentMarkSummaryDAO(session);
		Transaction transaction = null;
		try{
			StudentMarkSummary studentMarkSummary = null;
		for (String studentId : studentIds) {
			transaction = session.beginTransaction();
			transaction.begin();
			@SuppressWarnings("unused")
			StudentDetails studentDetails = studentDetailService.getStudentDetail(Integer.valueOf(studentId), session);
			List<StudentMarkSummary> studentMarkSumList = markDetailsDAO.getMarkList(studentDetails,markDetails.getExamDetails().getExamId());
			if(studentMarkSumList != null && studentMarkSumList.size() > 0){
				studentMarkSummary = studentMarkSumList.get(0);
			}else{
				studentMarkSummary = new StudentMarkSummary();
				studentMarkSummary.setStudentDetails(studentDetails);
				studentMarkSummary.setClassDetails(markDetails.getClassDetails());
				studentMarkSummary.setExamDetails(markDetails.getExamDetails());
			}
			Map<String,String> tot = markDetailsDAO.getStudentMarkSummary(markDetails.getExamDetails().getExamId(),studentDetails.getStudentId());
			if(tot!=null && tot.size()> 0){
				studentMarkSummary.setTotal(tot.get("total"));
				studentMarkSummary.setPercentage(tot.get("perc"));
				studentMarkSummary.setGrade(tot.get("grade"));
				markDetailsDAO.save(studentMarkSummary);
				transaction.commit();
				session.clear();
			}
		}
		}catch(Exception e){
			transaction.rollback();
			throw e;
		}
	}

	public String persistMark(List<List<MarkDetails>> markList,String []studentIds, Session session, HttpServletRequest request)
			throws Exception {
		MarkDetailsDAO markDetailsDAO = new MarkDetailsDAO(session);
		
		String unSavedList = "";
		MarkDetails markDetails = null;
		try {
			int i = 0, j = 0;
			Iterator<List<MarkDetails>> markListIterator = markList.iterator();
			while (markListIterator.hasNext()) {
				List<MarkDetails> markDetailsList = markListIterator.next();
				Iterator<MarkDetails> markDetailsIterator = markDetailsList
						.iterator();
				j = 0;
				while (markDetailsIterator.hasNext()) {
					Transaction transaction = session.beginTransaction();
					try {
						transaction.begin();
						markDetails = markDetailsIterator.next();
						markDetails.setCreateDate(new Date());
						markDetails.setCreateUserId(Integer.valueOf(1));
						//markDetails.setStudentDetails(studentDetails);
						if(StringUtils.isEmpty(((String[])request.getParameterValues("markDetail["+j+"].markObtained"))[i])){
							markDetails.setMarkId(Integer.valueOf(0));
						}else{
							markDetails.setMarkId(Integer.valueOf(((String[])request.getParameterValues("markDetail["+j+"].markId"))[i]));
						}
						if(StringUtils.isEmpty(((String[])request.getParameterValues("markDetail["+j+"].markObtained"))[i])){
							markDetails.setMarkObtained(null);
						}else{
							markDetails.setMarkObtained(((String[])request.getParameterValues("markDetail["+j+"].markObtained"))[i]);
						}
						markDetailsDAO.save((MarkDetails) session
								.merge(markDetails));
						transaction.commit();
						session.clear();
						j++;
					} catch (final Exception e) {
						transaction.rollback();
						Log.error(this.getClass(), "Exception in SA", e);
					}
				}
				i++;
			}
		} catch (Exception e) {
			Log.error(getClass(), "Exception occured ...", e);
			throw e;
		}
		return unSavedList;
	}

}
