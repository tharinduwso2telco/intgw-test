package com.wso2telco.tests.util.data;

import java.io.Serializable;

/**
 * The Class SandBoxValues.
 */
public class SandBoxValues implements Serializable {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = -4261389663879101218L;
	
	private static String smsUserId;
	
	private static String amount;
	
	private static String requestPayload;
	
	private static String responsePayload;

	public String getResponsePayload() {
		return responsePayload;
	}

	public void setResponsePayload(String responsePayload) {
		SandBoxValues.responsePayload = responsePayload;
	}

	public String getAmount() {
		return amount;
	}

	public void setAmount(String amount) {
		SandBoxValues.amount = amount;
	}

	public String getSmsUserId() {
		return smsUserId;
	}

	public void setSmsUserId(String smsUserId) {
		SandBoxValues.smsUserId = smsUserId;
	}

	public String getRequestPayload() {
		return requestPayload;
	}

	public void setRequestPayload(String requestPayload) {
		SandBoxValues.requestPayload = requestPayload;
	}
	
	

}
