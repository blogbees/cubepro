package com.cubepro.staff.action;

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
import com.cubepro.staff.StaffDetails;
import com.cubepro.staff.form.StaffDetailForm;
import com.cubepro.staff.helper.StaffDetailHelper;
import com.cubepro.subject.helper.SubjectDetailHelper;
import com.cubepro.transport.service.TransportService;

public class StaffTransactionAction extends TransactionAction {

	private String action;

	private static final String PARAM_ACTION = "action";

	private static final String ACTION_PERSIST_STAFF = "persistStaff";

	private static final String ACTION_GET_STAFF_DETAIL = "getStaff";

	private static final String ACTION_RESET_STAFF_DETAIL = "resetStaffFields";

	private static final String ACTION_GET_SUBJECT = "getSubject";

	private static final String PARAM_STAFF_ID = "staffId";

	@Override
	public CubeProActionForward processRequest(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response, Session session)
			throws HibernateException, GenericJDBCException, SQLException {
		CubeProActionForward forward = new CubeProActionForward();
		ActionMessages actionMessages = new ActionMessages();
		StaffDetailForm staffDetailForm = (StaffDetailForm) form;
		ClassDetailHelper classDetailHelper = new ClassDetailHelper();
		SubjectDetailHelper subjectDetailHelper = new SubjectDetailHelper();
		TransportService transportService = new TransportService();
		HostelService hostelService = new HostelService();
		try {
			StaffDetailHelper staffDetailHelper = new StaffDetailHelper();
			// get the action
			action = request.getParameter(PARAM_ACTION);

			if (action != null) {
				// validate action for user to login
				if (ACTION_GET_STAFF_DETAIL.equals(action)) {
					String staffId = request.getParameter(PARAM_STAFF_ID);
					if (staffId != null && staffId.trim().length() > 0) {
						StaffDetails studentDetails = staffDetailHelper
								.getStaffDetail(Integer.valueOf(staffId),
										session);
						staffDetailForm.setStaffDetails(studentDetails);
					}
				} else if (ACTION_PERSIST_STAFF.equals(action)) {
					staffDetailHelper.persistStaffImage(request
							.getRealPath(CubeProConstants.STUDENT_PHOTO_PATH),
							staffDetailForm.getStaffPhoto(), staffDetailForm
									.getStaffDetails(), session);
					staffDetailHelper.persistStaffDetail(staffDetailForm
							.getStaffDetails(), session);
					actionMessages.add("staffDetails.save.success",
							new ActionMessage("staffDetails.save.success"));

				} else if (ACTION_RESET_STAFF_DETAIL.equals(action)) {
					StaffDetails staffDetails = new StaffDetails();
					// staffDetails.getClassDetails().setClassId(Integer.valueOf(1));
					staffDetails.setStaffId(null);
					staffDetailForm.setStaffDetails(staffDetails);
				} else if (ACTION_GET_SUBJECT.equals(action)) {
					// staffDetailForm.setSubjectList(subjectDetailHelper.findByClass(staffDetailForm.getStaffDetails().getClassDetails(),
					// session));
				}
			}
			forward.setPath(mapping.findForward(CubeProConstants.SUCCESS)
					.getPath());
		} catch (Exception e) {
			Log.error(this.getClass(), this, e);
			actionMessages.add(e.getMessage(), new ActionMessage(
					"staffDetails.save.error", e.getMessage()));
		} finally {
			staffDetailForm.setClassList(classDetailHelper.findAll(session));
			staffDetailForm.setRouteStopList(transportService
					.findAllRouteStops(session));
			staffDetailForm.setRoomList(hostelService.findAllRooms(session));
			saveMessages(request, actionMessages);
			saveErrors(request, actionMessages);
		}
		return forward;
	}

}
