package com.cubepro.invoice.action;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionErrors;
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
import com.cubepro.fees.FeesDetails;
import com.cubepro.fees.FeesMaster;
import com.cubepro.fees.helper.FeesDetailHelper;
import com.cubepro.fees.helper.FeesHelper;
import com.cubepro.general.components.Log;
import com.cubepro.hostel.Room;
import com.cubepro.hostel.service.HostelService;
import com.cubepro.invoice.form.InvoiceDetailForm;
import com.cubepro.invoice.helper.InvoiceDetailHelper;
import com.cubepro.registration.SchoolDetails;
import com.cubepro.registration.helper.SchoolDetailsHelper;
import com.cubepro.student.StudentDetails;
import com.cubepro.student.helper.StudentDetailHelper;
import com.cubepro.transport.RouteStop;
import com.cubepro.transport.service.TransportService;
import com.cubepro.util.StringUtils;

public class InvoiceDetailAction extends TransactionAction {

	private static final String ACTION_SAVE_INVOICE = "saveInvoice";

	private static final String ACTION_PRINT_INVOICE = "printInvoice";

	private static final String PARAM_ACTION = "action";

	private static final String PARAM_STUDENTID = "studentId";

	private static final String ATTR_SEARCH_RESULT = "searchResult";

	@Override
	protected CubeProActionForward processRequest(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response, Session session)
			throws HibernateException, GenericJDBCException, SQLException {
		CubeProActionForward forward = new CubeProActionForward();
		ActionMessages actionMessages = new ActionMessages();
		ActionErrors actionErrors = new ActionErrors();
		InvoiceDetailForm invoiceDetailForm = new InvoiceDetailForm();
		if(form  instanceof InvoiceDetailForm) {
			invoiceDetailForm = (InvoiceDetailForm) form;
		}
		InvoiceDetailHelper ettHelper = new InvoiceDetailHelper();
		FeesDetailHelper feesHelper = new FeesDetailHelper();
		StudentDetailHelper studentDetailHelper = new StudentDetailHelper();
		FeesHelper feesMasterHelper = new FeesHelper();
		try {
		//	invoiceDetailForm=null;
			if (request.getParameter(PARAM_STUDENTID) != null) {
				invoiceDetailForm.setStudentId(Integer.valueOf(
						request.getParameter(PARAM_STUDENTID)).intValue());
				StudentDetails studentDetails = studentDetailHelper
						.getStudentDetail(Integer.valueOf(invoiceDetailForm
								.getStudentId()), session);

				if (studentDetails != null
						&& studentDetails.getRouteStopId() != null
						&& studentDetails.getRouteStopId() != 0) {
					// set the transport fee
					TransportService transportService = new TransportService();
					RouteStop routeStop = transportService.findByRouteStopId(
							studentDetails.getRouteStopId(), session);
					if(StringUtils.isEmpty(invoiceDetailForm.getInvoiceDetails().getTransportFee())){
						invoiceDetailForm.getInvoiceDetails().setTransportFee(
								routeStop.getStopFees());
					}
				}
				// set the hostel fee
				if (studentDetails != null
						&& studentDetails.getRoomId() != null
						&& studentDetails.getRoomId() != 0) {
					HostelService hostelService = new HostelService();
					Room room = hostelService.findByRoomId(studentDetails
							.getRoomId(), session);
					if(StringUtils.isEmpty(invoiceDetailForm.getInvoiceDetails().getHostelFee())){
						invoiceDetailForm.getInvoiceDetails().setHostelFee(
								room.getRoomCost());
					}
				}
				
				//set Scholar Amount
				if(studentDetails != null && studentDetails.getScholar1()!=null ) {
					invoiceDetailForm.getInvoiceDetails().setScholarAmt(studentDetails.getScholar1());
				} else {
					if(StringUtils.isEmpty(invoiceDetailForm.getInvoiceDetails().getScholarAmt())){
						invoiceDetailForm.getInvoiceDetails().setScholarAmt("0");
					}
				}
				
				/*//set Gross Amount
				if(studentDetails != null) {
					studentDetails = studentDetailHelper.getStudentDetail(Integer.valueOf(invoiceDetailForm
							.getStudentId()), session);
					
					invoiceDetailForm.getInvoiceDetails().setGrossAmt(invoiceDetailForm.getInvoiceDetails().getGrossAmt());
				} else {
					invoiceDetailForm.getInvoiceDetails().setGrossAmt("0");
				}*/
				
				//set Paid Amount
				/*if(studentDetails != null) {
					studentDetails = studentDetailHelper.getStudentDetail(Integer.valueOf(invoiceDetailForm
							.getStudentId()), session);
					
					invoiceDetailForm.getInvoiceDetails().setPaidAmt(invoiceDetailForm.getInvoiceDetails().getPaidAmt());
				} else {
					//invoiceDetailForm.getInvoiceDetails().setPaidAmt("0");
				}

				//set Balance Amount
				if(studentDetails != null) {
					studentDetails = studentDetailHelper.getStudentDetail(Integer.valueOf(invoiceDetailForm
							.getStudentId()), session);
					
					invoiceDetailForm.getInvoiceDetails().setBalanceAmt(invoiceDetailForm.getInvoiceDetails().getBalanceAmt());
				} else {
					//invoiceDetailForm.getInvoiceDetails().setBalanceAmt("0");
				}
*/				
				invoiceDetailForm.getInvoiceDetails().setStudentDetails(
						studentDetails);
				List<FeesDetails> feesDetails = feesHelper.getFeesDetails(
						invoiceDetailForm.getInvoiceDetails()
								.getStudentDetails().getClassDetails()
								.getClassId().intValue(), session);

				invoiceDetailForm.setFeesDetails(feesDetails);
				forward.setPath(mapping.findForward(CubeProConstants.SUCCESS)
						.getPath());
			}

			if (request.getParameter(PARAM_ACTION) != null) {
				if (request.getParameter(PARAM_ACTION).equalsIgnoreCase(
						ACTION_SAVE_INVOICE)) {
					// boolean isInvoiceExists =
					// ettHelper.isInvoiceExists(invoiceDetailForm.getInvoiceDetails().getInvoiceNo(),
					// session);
					// if(isInvoiceExists==false){
					ettHelper.saveInvoiceDetail(invoiceDetailForm, session);
					// TODO: commented out fees account transaction save option
					// - need to remove in future
					/*
					 * TransactionDetails transactionDetails = new
					 * TransactionDetails();
					 * transactionDetails.setTransactionId(Integer.valueOf(0));
					 * transactionDetails.setTransactionDesc("STUDENT FEES");
					 * transactionDetails.setTransactionDate(invoiceDetailForm
					 * .getInvoiceDetails().getFeesDate());
					 * transactionDetails.setTransactionCode("CASH INCOME");
					 * transactionDetails.setTransactionType("GENERAL FUND
					 * A/C");
					 * transactionDetails.setPaymentType(invoiceDetailForm
					 * .getInvoiceDetails().getPayBy());
					 * transactionDetails.setAmount(invoiceDetailForm
					 * .getInvoiceDetails().getTotalAmtPaid());
					 * transactionDetailHelper.saveTransactionDetails(
					 * transactionDetails, session);
					 */
					actionMessages.add("invoicedetail.save.success",
							new ActionMessage("invoicedetail.save.success"));
					// }else{
					// actionErrors.add("invoicedetail.error.invno",
					// new ActionMessage("invoicedetail.error.invno"));
					// }
					forward.setPath(mapping.findForward(
							CubeProConstants.SUCCESS).getPath());
				} else if (request.getParameter(PARAM_ACTION).equalsIgnoreCase(
						ACTION_PRINT_INVOICE)) {
					String invoiceId = request.getParameter("invoiceId");
					invoiceDetailForm.setInvoicePrintDetails(ettHelper
							.printInvoice(invoiceId, invoiceDetailForm
									.getInvoiceDetails().getStudentDetails()
									.getClassDetails().getClassId().intValue(),
									session));
					SchoolDetailsHelper schoolDetailsHelper = new SchoolDetailsHelper();
					SchoolDetails schoolDetails = schoolDetailsHelper
							.findAll(session);
					request.setAttribute("schoolDetails", schoolDetails);
					request.setAttribute("invoicePrintDetails",
							invoiceDetailForm.getInvoicePrintDetails());
					forward.setPath(mapping.findForward("printInvoice")
							.getPath());
				}
				// get the student invoice details
				invoiceDetailForm.setInvoiceDetailList(ettHelper.findByStudent(
						invoiceDetailForm.getStudentId(), session));
			}

		} catch (final Exception e) {
			Log.error(this.getClass(), this, e);
		} finally {
			try {
				invoiceDetailForm.setFeesType(feesMasterHelper
						.getDistinctFeesType(session, invoiceDetailForm
								.getInvoiceDetails().getStudentDetails()
								.getClassDetails().getClassId()));
				if (invoiceDetailForm.getInvoiceDetails().getFeesType() != null
						&& StringUtils.isEmpty(invoiceDetailForm
								.getInvoiceDetails().getFeesType()) == false) {
					invoiceDetailForm.setFeesSubType(feesMasterHelper
							.getDistinctFeesSubType(session, invoiceDetailForm
									.getInvoiceDetails().getFeesType(),
									invoiceDetailForm.getInvoiceDetails()
											.getStudentDetails()
											.getClassDetails().getClassId()));
				} else {
					invoiceDetailForm.setFeesSubType(feesMasterHelper
							.getDistinctFeesSubType(session,
									((FeesMaster) invoiceDetailForm
											.getFeesType().get(0))
											.getFeesType(), invoiceDetailForm
											.getInvoiceDetails()
											.getStudentDetails()
											.getClassDetails().getClassId()));
				}
				request.setAttribute(ATTR_SEARCH_RESULT, invoiceDetailForm
						.getInvoiceDetailList());
			} catch (Exception e) {
				Log.error(this.getClass(), this, e);
			}
			saveMessages(request, actionMessages);
			saveErrors(request, actionErrors);
		}

		return forward;
	}

}
