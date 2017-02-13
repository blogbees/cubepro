package com.cubepro.library.action;

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

import com.cubepro.components.CubeProActionForward;
import com.cubepro.components.CubeProConstants;
import com.cubepro.components.TransactionAction;
import com.cubepro.general.components.Log;
import com.cubepro.library.Category;
import com.cubepro.library.form.StudentLendDetailsForm;
import com.cubepro.library.service.LibraryService;
import com.cubepro.student.StudentDetails;
import com.cubepro.student.helper.StudentDetailHelper;

public class StudentLendDetailsAction extends TransactionAction {

	private String action;

	private static final String PARAM_ACTION = "action";

	private static final String ACTION_SAVE_STUDENT_LEND_DETAILS = "saveStudentLendDetails";

	private static final String ACTION_SET_STUDENT_LEND_DETAILS = "setStudentLendDetails";

	private static final String PARAM_STUDENTID = "studentId";

	private static final String ACTION_DELETE_STUDENT_LEND_DETAILS = "deleteStudentLendDetails";

	private static final String ATTR_SEARCH_RESULT = "searchResult";

	private static final String ACTION_SET_BY_CATEGORY = "findBooksByCategory";

	@Override
	public CubeProActionForward processRequest(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response, Session session)
			throws HibernateException, GenericJDBCException, SQLException {
		CubeProActionForward forward = new CubeProActionForward();
		ActionMessages actionMessages = new ActionMessages();
		StudentDetailHelper studentDetailHelper = new StudentDetailHelper();
		StudentLendDetailsForm lendDetailsForm = (StudentLendDetailsForm) form;
		LibraryService libraryService = new LibraryService();
		boolean categorySet = false;
		try {
			// get the action

			if (request.getParameter(PARAM_STUDENTID) != null) {
				lendDetailsForm.setStudentId(Integer.valueOf(
						request.getParameter(PARAM_STUDENTID)).intValue());
				StudentDetails studentDetails = studentDetailHelper
						.getStudentDetail(Integer.valueOf(lendDetailsForm
								.getStudentId()), session);
				lendDetailsForm.setStudentDetails(studentDetails);
				lendDetailsForm.getLendDetailsDetail().setStudentDetails(
						studentDetails);
			}

			action = request.getParameter(PARAM_ACTION);
			if (action != null) {
				if (action.equalsIgnoreCase(ACTION_SAVE_STUDENT_LEND_DETAILS)) {
					libraryService.saveStudentLendDetailsDetail(session,
							lendDetailsForm.getLendDetailsDetail());
					actionMessages.add("save.success.all", new ActionMessage(
							"save.success.all"));

				} else if (action
						.equalsIgnoreCase(ACTION_SET_STUDENT_LEND_DETAILS)) {
					String lendDetailsId = request
							.getParameter("studentLendDetailsId");
					if (lendDetailsId != null) {
						lendDetailsForm.setLendDetailsDetail(libraryService
								.findByStudentLendDetailsId(Integer.valueOf(
										lendDetailsId).intValue(), session));
					}
				} else if (action
						.equalsIgnoreCase(ACTION_DELETE_STUDENT_LEND_DETAILS)) {
					String lendDetailsId = request
							.getParameter("lendDetailsId");
					if (lendDetailsId != null) {
						lendDetailsForm.setLendDetailsDetail(libraryService
								.findByStudentLendDetailsId(Integer.valueOf(
										lendDetailsId).intValue(), session));
						libraryService.deleteStudentLendDetailsDetail(session,
								lendDetailsForm.getLendDetailsDetail());
						actionMessages.add("save.success.delete",
								new ActionMessage("save.success.delete"));
					}
				} else if (action.equalsIgnoreCase(ACTION_SET_BY_CATEGORY)) {
					lendDetailsForm.setBookList((libraryService
							.findBooksByCategory(lendDetailsForm
									.getCategoryId(), session)));
					categorySet = true;
				}
			}

			// validate action for user to login
			forward.setPath(mapping.findForward(CubeProConstants.SUCCESS)
					.getPath());
		} catch (Exception e) {
			actionMessages.add("studentDetails.mark.error", new ActionMessage(e
					.getMessage()));
			Log.error(this.getClass(), this, e);
		} finally {
			lendDetailsForm.setLendDetailsList(libraryService
					.findByStudentId(lendDetailsForm.getStudentId(), session));
			lendDetailsForm.setCategoryList(libraryService
					.findAllCategory(session));
			if (categorySet == false) {
				lendDetailsForm.setBookList(libraryService.findBooksByCategory(
						((Category) lendDetailsForm.getCategoryList().get(0))
								.getCategoryId(), session));
			}
			request.setAttribute(ATTR_SEARCH_RESULT, lendDetailsForm
					.getLendDetailsList());
			saveMessages(request, actionMessages);
			saveErrors(request, actionMessages);
		}
		return forward;
	}

}
