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
import com.cubepro.library.form.CategoryForm;
import com.cubepro.library.service.LibraryService;

public class CategoryAction extends TransactionAction {

	private String action;

	private static final String PARAM_ACTION = "action";

	private static final String ACTION_SAVE_CATEGORY = "saveCategory";

	private static final String ACTION_SET_CATEGORY = "setCategory";

	private static final String ACTION_DELETE_CATEGORY = "deleteCategory";

	private static final String ATTR_SEARCH_RESULT = "searchResult";

	@Override
	public CubeProActionForward processRequest(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response, Session session)
			throws HibernateException, GenericJDBCException, SQLException {
		CubeProActionForward forward = new CubeProActionForward();
		ActionMessages actionMessages = new ActionMessages();
		CategoryForm categoryForm = (CategoryForm) form;
		LibraryService libraryService = new LibraryService();
		try {
			// get the action
			action = request.getParameter(PARAM_ACTION);
			if (action != null) {
				if (action.equalsIgnoreCase(ACTION_SAVE_CATEGORY)) {
					libraryService.saveCategoryDetail(session, categoryForm
							.getCategory());
					actionMessages.add("save.success.all", new ActionMessage(
							"save.success.all"));

				} else if (action.equalsIgnoreCase(ACTION_SET_CATEGORY)) {
					String CategoryId = request.getParameter("categoryId");
					if (CategoryId != null) {
						categoryForm.setCategory(libraryService
								.findByCategoryId(Integer.valueOf(CategoryId)
										.intValue(), session));
					}
				} else if (action.equalsIgnoreCase(ACTION_DELETE_CATEGORY)) {
					String CategoryId = request.getParameter("categoryId");
					if (CategoryId != null) {
						categoryForm.setCategory(libraryService
								.findByCategoryId(Integer.valueOf(CategoryId)
										.intValue(), session));
						libraryService.deleteCategoryDetail(session, categoryForm
								.getCategory());
						actionMessages.add("save.success.delete",
								new ActionMessage("save.success.delete"));
					}
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
			categoryForm.setCategoryList(libraryService
					.findAllCategory(session));
			request.setAttribute(ATTR_SEARCH_RESULT, categoryForm.getCategoryList());
			saveMessages(request, actionMessages);
			saveErrors(request, actionMessages);
		}
		return forward;
	}

}
