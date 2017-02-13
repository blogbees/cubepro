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
import com.cubepro.library.form.BookForm;
import com.cubepro.library.service.LibraryService;

public class BookAction extends TransactionAction {

	private String action;

	private static final String PARAM_ACTION = "action";

	private static final String ACTION_SAVE_BOOK = "saveBook";

	private static final String ACTION_SET_BOOK = "setBook";

	private static final String ACTION_DELETE_BOOK = "deleteBook";

	private static final String ATTR_SEARCH_RESULT = "searchResult";

	@Override
	public CubeProActionForward processRequest(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response, Session session)
			throws HibernateException, GenericJDBCException, SQLException {
		CubeProActionForward forward = new CubeProActionForward();
		ActionMessages actionMessages = new ActionMessages();
		BookForm bookForm = (BookForm) form;
		LibraryService libraryService = new LibraryService();
		try {
			// get the action
			action = request.getParameter(PARAM_ACTION);
			if (action != null) {
				if (action.equalsIgnoreCase(ACTION_SAVE_BOOK)) {
					libraryService.saveBookDetail(session,
							bookForm.getBookDetail());
					actionMessages.add("save.success.all", new ActionMessage(
							"save.success.all"));

				} else if (action.equalsIgnoreCase(ACTION_SET_BOOK)) {
					String bookId = request
							.getParameter("bookId");
					if (bookId != null) {
						bookForm.setBookDetail(libraryService
								.findByBookId(Integer.valueOf(
										bookId).intValue(), session));
					}
				} else if (action.equalsIgnoreCase(ACTION_DELETE_BOOK)) {
					String bookId = request
							.getParameter("bookId");
					if (bookId != null) {
						bookForm.setBookDetail(libraryService
								.findByBookId(Integer.valueOf(
										bookId).intValue(), session));
						libraryService.deleteBookDetail(session,
								bookForm.getBookDetail());
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
			bookForm.setBookList(libraryService
					.findAllBooks(session));
			bookForm.setCategoryList(libraryService
					.findAllCategory(session));
			request.setAttribute(ATTR_SEARCH_RESULT, bookForm
					.getBookList());
			saveMessages(request, actionMessages);
			saveErrors(request, actionMessages);
		}
		return forward;
	}

}
