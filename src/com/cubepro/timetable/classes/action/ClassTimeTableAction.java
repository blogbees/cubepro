package com.cubepro.timetable.classes.action;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.ActionMessages;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.exception.GenericJDBCException;

import com.cubepro.classes.ClassDetails;
import com.cubepro.classes.helper.ClassDetailHelper;
import com.cubepro.components.CubeProActionForward;
import com.cubepro.components.CubeProConstants;
import com.cubepro.components.TransactionAction;
import com.cubepro.general.CommonConstants;
import com.cubepro.general.components.Log;
import com.cubepro.staff.StaffDetails;
import com.cubepro.staff.helper.StaffDetailHelper;
import com.cubepro.subject.helper.SubjectDetailHelper;
import com.cubepro.timetable.classes.ClassTimeTable;
import com.cubepro.timetable.classes.ClassTimeTableDAO;
import com.cubepro.timetable.classes.form.ClassTimeTableForm;
import com.cubepro.timetable.classes.helper.ClassTimeTableHelper;

public class ClassTimeTableAction extends TransactionAction {
	/**
	 * 
	 */
	private static final long serialVersionUID = 76161912622939245L;

	private static final String ACTION_SEARCH_FOR_CLASS_TT_LIST = "getClassTimeTable";

	private static final String ACTION_SAVE_CLASS_TT_LIST = "saveClassTimeTable";

	private static final String PARAM_ACTION = "action";

	@Override
	public CubeProActionForward processRequest(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response, Session session)
			throws HibernateException, GenericJDBCException, SQLException {

		CubeProActionForward forward = new CubeProActionForward();
		ActionMessages actionMessages = new ActionMessages();
		ClassTimeTableForm classTTForm = (ClassTimeTableForm) form;
		ClassTimeTableHelper cttHelper = new ClassTimeTableHelper();
		ClassDetailHelper classDetailHelper = new ClassDetailHelper();
		StaffDetailHelper staffDetailHelper = new StaffDetailHelper();
		SubjectDetailHelper subjectDetailHelper = new SubjectDetailHelper();
		try {
			if (request.getParameter(PARAM_ACTION) != null) {
				if (request.getParameter(PARAM_ACTION).equalsIgnoreCase(
						ACTION_SEARCH_FOR_CLASS_TT_LIST)) {
					classTTForm.setClassTimeTableDetails(cttHelper.findAll(
							session, classTTForm.getClassId(), classTTForm
									.getYearOfTimeTable()));
				} else if (request.getParameter(PARAM_ACTION).equalsIgnoreCase(
						ACTION_SAVE_CLASS_TT_LIST)) {
					cttHelper.saveTimeTableRecords(classTTForm
							.getClassTimeTableDetails(), session);
					classTTForm.setClassTimeTableDetails(cttHelper.findAll(
							session, classTTForm.getClassId(), classTTForm
									.getYearOfTimeTable()));
					actionMessages.add("timetable.save.success",
							new ActionMessage("timetable.save.success"));
				}
			}
			forward.setPath(mapping.findForward(CubeProConstants.SUCCESS)
					.getPath());
		} catch (Exception e) {
			Log.error(this.getClass(), this, e);
		} finally {
			try{
			ClassDetails classDetails = new ClassDetails();
			classDetails.setClassId(Integer.valueOf(classTTForm
					.getClassId()));
			StaffDetails staffDetails = new StaffDetails();
			/*staffDetails.getClassDetails().setClassId(
					classTTForm.getClassId());*/
			classTTForm.setClassList(classDetailHelper.findAll(session));
			// set the subject list based on the class
			classTTForm.setSubjectList(subjectDetailHelper.findByClass(
					classDetails, session));
			// set the staff details based on the class
			classTTForm.setStaffList(staffDetailHelper.getStaffList(
					staffDetails, session));
			}catch(Exception e){
				Log.error(getClass(), "Exception occ ", e);
			}
			saveMessages(request, actionMessages);
			saveErrors(request, actionMessages);
		}
		return forward;
	}
}
