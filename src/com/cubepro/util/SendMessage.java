//package com.abc.test;
package com.cubepro.util;
import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpStatus;
import org.apache.commons.httpclient.MultiThreadedHttpConnectionManager;
import org.apache.commons.httpclient.methods.PostMethod;

import com.cubepro.general.components.Log;

// SendMessage.java - Sample application.
//
// This application shows you the basic procedure for sending messages.
// You will find how to send synchronous and asynchronous messages.
//
// For asynchronous dispatch, the example application sets a callback
// notification, to see what's happened with messages.




//import org.smslib.AGateway;
//import org.smslib.IOutboundMessageNotification;
//import org.smslib.Library;
//import org.smslib.OutboundMessage;
//import org.smslib.Service;
//import org.smslib.http.BulkSmsHTTPGateway;
//import org.smslib.modem.SerialModemGateway;

//import com.cubepro.general.components.Log;

public class SendMessage {


	public boolean sendSMS(final String portName, final String mobileNo,
			final String smsToBeSent) throws Exception {
	return 	sendSMS(portName,mobileNo,
			smsToBeSent,"Bulk");
	}
	
	public boolean sendSMS(final String portName, final String mobileNo,
			final String smsToBeSent, final String type) throws Exception {
		HttpClient client=null;
		PostMethod post=null;
		String sURL;
		client = new HttpClient(new MultiThreadedHttpConnectionManager());
		/* Set your proxy settings */
		//client.getHostConfiguration().setProxy("proxy.aspiresys.com", 3128);
		//client.getHttpConnectionManager().getParams().setConnectionTimeout(30000);//set		your time
		sURL = "http://www.smsgatewaycenter.com/library/send_sms_2.php?";
		post = new PostMethod(sURL);
		//give all in string
		post.addParameter("UserName", "sdamhs787");
		post.addParameter("Password", "456775859877");
		post.addParameter("Type", "Bulk");
		post.addParameter("To", mobileNo);		
		post.addParameter("Mask", "SEVMHS2");
		post.addParameter("Message", smsToBeSent);
		
		/* PUSH the URL http://bulksms.spry2sms.com/pushsms.php?
		 * username=mcchss
		 * &api_password=248264yki8f96r1pd
		 * &sender=MCCHSS
		 * &to=9840667904
		 * &message=hi%20dear
		 * &priority=1
		 * http://www.smsgatewaycenter.com/library/send_sms_2.php?
		 * UserName=username&Password=password&Type=Bulk&To=9999999999,9999999998,9999999997&Mask=Senderid&Message=Hello World
		 * */
		try {
		int statusCode = client.executeMethod(post);
		Log.info(this.getClass(),post.getStatusLine().toString());
		if (statusCode != HttpStatus.SC_OK) {
		Log.info(this.getClass(),"Method failed: " + post.getStatusLine());
		}
		Log.info(this.getClass(),"mobileNo -"+mobileNo+" smsToBeSent -"+smsToBeSent +" "+post.getResponseBodyAsString());
		}
		catch (Exception e) {
		e.printStackTrace();
		}
		finally {
		post.releaseConnection();
		}
		return true;
	}

	public static void main(String args[]) {
		SendMessage app = new SendMessage();
		try {
			//Info From MCCHS School, Sir/Madam, Your Child s was Absent On 11/09/2001 Due to fever.
			app.sendSMS("COM1","9840213301","Dear Parent, Info From Shikshaa School, Sir/Madam, Your Child s was Absent On 11/09/2001 Due to fever. Regards Shikshaa");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
