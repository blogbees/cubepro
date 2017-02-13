package com.cubepro.student.action;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.ActionMessages;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.exception.GenericJDBCException;

import com.cubepro.classes.helper.ClassDetailHelper;
import com.cubepro.components.CubeProActionForward;
import com.cubepro.components.CubeProConstants;
import com.cubepro.components.TransactionAction;
import com.cubepro.general.components.Log;
import com.cubepro.hostel.service.HostelService;
import com.cubepro.student.StudentDetails;
import com.cubepro.student.form.StudentDetailForm;
import com.cubepro.student.helper.StudentDetailHelper;
import com.cubepro.transport.service.TransportService;

public class StudentTransactionAction extends TransactionAction {

	private String action;

	private static final String PARAM_ACTION = "action";

	private static final String ACTION_PERSIST_STUDENT = "persistStudent";

	private static final String ACTION_GET_STUDENT_DETAIL = "getStudent";
	
	private static final String ACTION_RESET_STUDENT_DETAIL = "resetStudentFields";
	
	private static final String PARAM_STUDENT_ID = "studentId";

	@SuppressWarnings("deprecation")
	@Override
	public CubeProActionForward processRequest(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response, Session session)
			throws HibernateException, GenericJDBCException, SQLException {
		CubeProActionForward forward = new CubeProActionForward();
		ActionMessages actionMessages = new ActionMessages();
		StudentDetailForm studentDetailForm = (StudentDetailForm) form;
		ClassDetailHelper classDetailHelper = new ClassDetailHelper();
		TransportService transportService = new TransportService();
		HostelService hostelService = new HostelService();
		try {
			StudentDetailHelper studentDetailHelper = new StudentDetailHelper();

			// get the action
			action = request.getParameter(PARAM_ACTION);

			if (action != null) {
				// validate action for user to login
				if (ACTION_GET_STUDENT_DETAIL.equals(action)) {
					String studentId = request.getParameter(PARAM_STUDENT_ID);
					if(studentId!=null && studentId.trim().length() > 0){
					StudentDetails studentDetails = studentDetailHelper.getStudentDetail(Integer.valueOf(studentId), session);
					studentDetailForm.setStudentDetails(studentDetails);
					}
				} else if (ACTION_PERSIST_STUDENT.equals(action)) {
					studentDetailHelper.persistStudentImage(request.getRealPath(CubeProConstants.STUDENT_PHOTO_PATH),studentDetailForm.getStudentPhoto(),studentDetailForm.getStudentDetails(), session);
					Integer studentId = studentDetailHelper.persistStudentDetail(studentDetailForm.getStudentDetails(), session);
					//studentDetailForm.getStudentDetails().setStudentId(studentId);
					actionMessages.add("studentDetails.save.success", new ActionMessage("studentDetails.save.success"));
					//Changes Made - By Arun.M-Beg
					forward.setPath(mapping.findForward("transactionsSuccess")
							.getPath());
					return forward;
					//Changes Made - By Arun.M-End

				} else if (ACTION_RESET_STUDENT_DETAIL.equals(action)) {
					StudentDetails studentDetails = new StudentDetails();
					studentDetails.getClassDetails().setClassId(Integer.valueOf(1));
					studentDetails.setStudentId(null);
					studentDetailForm.setStudentDetails(studentDetails);
				}
			}
		} catch (Exception e) {
			Log.error(this.getClass(), this, e);
			actionMessages.add(e.getMessage(), new ActionMessage("studentDetails.save.error", e.getMessage()));
		} finally {
			studentDetailForm.setClassList(classDetailHelper.findAll(session));
			studentDetailForm.setRouteStopList(transportService.findAllRouteStops(session));
			studentDetailForm.setRoomList(hostelService.findAllRooms(session));
			saveMessages(request, actionMessages);
			saveErrors(request, actionMessages);
		}
		forward.setPath(mapping.findForward(CubeProConstants.SUCCESS)
				.getPath());
		return forward;
	}

}
