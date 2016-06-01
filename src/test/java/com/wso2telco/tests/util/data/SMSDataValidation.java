package com.wso2telco.tests.util.data;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

/**
 * The Class SMSDataValidation.
 */
public class SMSDataValidation {
	
	/** The application number. */
	private static String applicationNumber;
	
	/** The sender address number. */
	private static String senderAddressNumber;
	
	/** The sms message. */
	private static String smsMessage;
	
	/** The row number before send. */
	private static int rowNumberBeforeSend;
	
	/** The delivery status. */
	private static String deliveryStatus;
	
	/** The notification delay. */
	private static String notificationDelay;
	
	/** The max notification allowed. */
	private static String maxNotificationAllowed;
	
	/** The notify url. */
	private static String notifyURL;
	
	/** The callback data. */
	private static String callbackData;
	
	/** The sms criteria. */
	private static String smsCriteria;
	
	/** The sms client correlator. */
	private static String smsClientCorrelator;
	
	/**
	 * Generate random string.
	 *
	 * @author SulakkhanaW
	 * @param length the length
	 * @return the string
	 * @throws Exception the exception
	 */
	public String generateRandomString(final int length) throws Exception {
		StringBuffer buffer = new StringBuffer();
		String characters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
		int charactersLength = characters.length();
		for (int i = 0; i < length; i++) {
			double index = Math.random() * charactersLength;
			buffer.append(characters.charAt((int) index));
		}
		return buffer.toString();
	}
	
	/**
	 * Checks if is send request data.
	 *
	 * @author SulakkhanaW
	 * @param rowDataArray the row data array
	 * @return true, if is send request data
	 */
	public boolean isSendRequestData(List<String> rowDataArray){
		if (!getApplicationNumber().isEmpty()){
			if (!rowDataArray.contains(getApplicationNumber())){
				return false;
			}
		} if (!getSenderAddressNumber().isEmpty()){
			if (!rowDataArray.contains(getSenderAddressNumber())){
				return false;
			}
		} if (!getSmsMessage().isEmpty()){
			if (!rowDataArray.contains(getSmsMessage())){
				return false;
			}
		}
		return true;
	}
	
	/**
	 * Checks if is SMS response data.
	 *
	 * @author SulakkhanaW
	 * @param reponseDataRow the reponse data row
	 * @return true, if is SMS response data
	 */
	public boolean isSMSResponseData(List<String> reponseDataRow){
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String today = dateFormat.format(date);
		String notifiactionFormat = "JSON";
		if (!getCallbackData().isEmpty()) {
			if (!reponseDataRow.contains(getCallbackData())) {
				return false;
			}
		} if (!getSmsClientCorrelator().isEmpty()) {
			if (!reponseDataRow.contains(getSmsClientCorrelator())) {
				return false;
			}
		} if (!getSmsCriteria().isEmpty()) {
			if (!reponseDataRow.contains(getSmsCriteria())) {
				return false;
			}
		} if (!getApplicationNumber().isEmpty()){
			if (!reponseDataRow.contains(getApplicationNumber())){
				return false;
			}
		} if (!getNotifyURL().isEmpty()){
			if (!reponseDataRow.contains(getNotifyURL())){
				return false;
			}
		} if (!today.isEmpty()){
			if (!reponseDataRow.contains(today)){
				return false;
			}
		} if (!notifiactionFormat.isEmpty()){
			if (!reponseDataRow.contains(notifiactionFormat)){
				return false;
			}
		}
		return true;
	}
	
	/**
	 * Checks if is SMS request payload.
	 *
	 * @author SulakkhanaW
	 * @param json the json
	 * @return true, if is SMS request payload
	 */
	public boolean isSMSRequestPayload(String json){
		if (!getSmsClientCorrelator().isEmpty()){
			String requestclientCorrelator = getValueFromJsonSMS("clientCorrelator", json);
			if (!requestclientCorrelator.equalsIgnoreCase(getSmsClientCorrelator())){
				return false;
			}
		} if (!getSmsCriteria().isEmpty()){
			String criteria = getValueFromJsonSMS("criteria", json);
			if (!criteria.equalsIgnoreCase(getSmsCriteria())){
				return false;
			}
		} if (!getApplicationNumber().isEmpty()){
			String destinationAddress = getValueFromJsonSMS("destinationAddress", json);
			if (!destinationAddress.equalsIgnoreCase(getApplicationNumber())){
				return false;
			}
		} if (!getNotifyURL().isEmpty()){
			String notifyURL = getValueFromJsonSMS("notifyURL", json);
			if (!notifyURL.equalsIgnoreCase(getNotifyURL())){
				return false;
			}
		} if (!getCallbackData().isEmpty()){
			String callbackData = getValueFromJsonSMS("callbackData", json);
			if (!callbackData.equalsIgnoreCase(getCallbackData())){
				return false;
			}
		}
		String notificationFormat = getValueFromJsonSMS("notificationFormat", json);
		if (!"JSON".equalsIgnoreCase(notificationFormat)){
			return false;
		}
		return true;
	}
	
	/**
	 * Checks if is SMS response payload.
	 *
	 * @author SulakkhanaW
	 * @param json the json
	 * @return true, if is SMS response payload
	 */
	public boolean isSMSResponsePayload(String json){
		if (!getSmsClientCorrelator().isEmpty()){
			String requestclientCorrelator = getValueFromJsonSMS("clientCorrelator", json);
			if (!requestclientCorrelator.equalsIgnoreCase(getSmsClientCorrelator())){
				return false;
			}
		} if (!getSmsCriteria().isEmpty()){
			String criteria = getValueFromJsonSMS("criteria", json);
			if (!criteria.equalsIgnoreCase(getSmsCriteria())){
				return false;
			}
		} if (!getApplicationNumber().isEmpty()){
			String destinationAddress = getValueFromJsonSMS("destinationAddress", json);
			if (!destinationAddress.equalsIgnoreCase(getApplicationNumber())){
				return false;
			}
		} if (!getNotifyURL().isEmpty()){
			String notifyURL = getValueFromJsonSMS("notifyURL", json);
			if (!notifyURL.equalsIgnoreCase(getNotifyURL())){
				return false;
			}
		} if (!getCallbackData().isEmpty()){
			String callbackData = getValueFromJsonSMS("callbackData", json);
			if (!callbackData.equalsIgnoreCase(getCallbackData())){
				return false;
			}
		}
		String notificationFormat = getValueFromJsonSMS("notificationFormat", json);
		if (!"JSON".equalsIgnoreCase(notificationFormat)){
			return false;
		}
		return true;
	}
	
	/**
	 * Gets the value from json sms.
	 *
	 * @author SulakkhanaW
	 * @param tag the tag
	 * @param json the json
	 * @return the value from json sms
	 */
	public String getValueFromJsonSMS(String tag, String json) {
		JsonElement jsonElement = new JsonParser().parse(json);
		JsonObject jsonObject = jsonElement.getAsJsonObject();
		String returnValue = null;
		switch (tag) {

		case "clientCorrelator":	
		case "criteria":	
		case "destinationAddress":	
		case "notificationFormat":	
		case "resourceURL":
			returnValue = getValueTerminalsubscription(tag, jsonObject);
			break;
			
		case "notifyURL":
		case "callbackData":
			returnValue = getValueTerminalCallbackReference(tag, jsonObject);
			break;
			
		default:
			break;
		}
		return returnValue;
	}
	
	/**
	 * Gets the value terminalsubscription.
	 *
	 * @author SulakkhanaW
	 * @param tag the tag
	 * @param jsonObject the json object
	 * @return the value terminalsubscription
	 */
	private String getValueTerminalsubscription(String tag, JsonObject jsonObject){
		jsonObject = jsonObject.getAsJsonObject("subscription");
		String returnValue = jsonObject.get(tag).toString();
		String firstCharacter = Character.toString(returnValue.charAt(0));
		if (firstCharacter.equalsIgnoreCase("\"")){
			returnValue = returnValue.substring(1, returnValue.length()-1);
		}
		return returnValue;
	}
	
	/**
	 * Gets the value terminal callback reference.
	 *
	 * @author SulakkhanaW
	 * @param tag the tag
	 * @param jsonObject the json object
	 * @return the value terminal callback reference
	 */
	private String getValueTerminalCallbackReference(String tag, JsonObject jsonObject){
		jsonObject = jsonObject.getAsJsonObject("subscription");
		jsonObject = jsonObject.getAsJsonObject("callbackReference");
		String returnValue = jsonObject.get(tag).toString();
		String firstCharacter = Character.toString(returnValue.charAt(0));
		if (firstCharacter.equalsIgnoreCase("\"")){
			returnValue = returnValue.substring(1, returnValue.length()-1);
		}
		return returnValue;
	}

	/**
	 * Gets the application number.
	 *
	 * @author SulakkhanaW
	 * @return the application number
	 */
	public static String getApplicationNumber() {
		return applicationNumber;
	}

	/**
	 * Sets the application number.
	 *
	 * @author SulakkhanaW
	 * @param applicationNumber the new application number
	 */
	public void setApplicationNumber(String applicationNumber) {
		SMSDataValidation.applicationNumber = applicationNumber;
	}

	/**
	 * Gets the sender address number.
	 *
	 * @author SulakkhanaW
	 * @return the sender address number
	 */
	public static String getSenderAddressNumber() {
		return senderAddressNumber;
	}

	/**
	 * Sets the sender address number.
	 *
	 * @author SulakkhanaW
	 * @param senderAddressNumber the new sender address number
	 */
	public void setSenderAddressNumber(String senderAddressNumber) {
		SMSDataValidation.senderAddressNumber = senderAddressNumber;
	}

	/**
	 * Gets the sms message.
	 *
	 * @author SulakkhanaW
	 * @return the sms message
	 */
	public static String getSmsMessage() {
		return smsMessage;
	}

	/**
	 * Sets the sms message.
	 *
	 * @author SulakkhanaW
	 * @param smsMessage the new sms message
	 */
	public void setSmsMessage(String smsMessage) {
		SMSDataValidation.smsMessage = smsMessage;
	}

	/**
	 * Gets the row number before send.
	 *
	 * @author SulakkhanaW
	 * @return the row number before send
	 */
	public int getRowNumberBeforeSend() {
		return rowNumberBeforeSend;
	}

	/**
	 * Sets the row number before send.
	 *
	 * @author SulakkhanaW
	 * @param rowNumberBeforeSend the new row number before send
	 */
	public void setRowNumberBeforeSend(int rowNumberBeforeSend) {
		SMSDataValidation.rowNumberBeforeSend = rowNumberBeforeSend;
	}

	/**
	 * Gets the delivery status.
	 *
	 * @author SulakkhanaW
	 * @return the delivery status
	 */
	public String getDeliveryStatus() {
		return deliveryStatus;
	}

	/**
	 * Sets the delivery status.
	 *
	 * @author SulakkhanaW
	 * @param deliveryStatus the new delivery status
	 */
	public void setDeliveryStatus(String deliveryStatus) {
		SMSDataValidation.deliveryStatus = deliveryStatus;
	}

	/**
	 * Gets the notification delay.
	 *
	 * @author SulakkhanaW
	 * @return the notification delay
	 */
	public String getNotificationDelay() {
		return notificationDelay;
	}

	/**
	 * Sets the notification delay.
	 *
	 * @author SulakkhanaW
	 * @param notificationDelay the new notification delay
	 */
	public void setNotificationDelay(String notificationDelay) {
		SMSDataValidation.notificationDelay = notificationDelay;
	}

	/**
	 * Gets the max notification allowed.
	 *
	 * @author SulakkhanaW
	 * @return the max notification allowed
	 */
	public String getMaxNotificationAllowed() {
		return maxNotificationAllowed;
	}

	/**
	 * Sets the max notification allowed.
	 *
	 * @author SulakkhanaW
	 * @param maxNotificationAllowed the new max notification allowed
	 */
	public void setMaxNotificationAllowed(String maxNotificationAllowed) {
		SMSDataValidation.maxNotificationAllowed = maxNotificationAllowed;
	}

	/**
	 * Gets the notify url.
	 *
	 * @author SulakkhanaW
	 * @return the notify url
	 */
	public static String getNotifyURL() {
		return notifyURL;
	}

	/**
	 * Sets the notify url.
	 *
	 * @author SulakkhanaW
	 * @param notifyURL the new notify url
	 */
	public void setNotifyURL(String notifyURL) {
		SMSDataValidation.notifyURL = notifyURL;
	}

	/**
	 * Gets the callback data.
	 *
	 * @author SulakkhanaW
	 * @return the callback data
	 */
	public static String getCallbackData() {
		return callbackData;
	}

	/**
	 * Sets the callback data.
	 *
	 * @author SulakkhanaW
	 * @param callbackData the new callback data
	 */
	public void setCallbackData(String callbackData) {
		SMSDataValidation.callbackData = callbackData;
	}

	/**
	 * Gets the sms criteria.
	 *
	 * @author SulakkhanaW
	 * @return the sms criteria
	 */
	public static String getSmsCriteria() {
		return smsCriteria;
	}

	/**
	 * Sets the sms criteria.
	 *
	 * @author SulakkhanaW
	 * @param smsCriteria the new sms criteria
	 */
	public void setSmsCriteria(String smsCriteria) {
		SMSDataValidation.smsCriteria = smsCriteria;
	}

	/**
	 * Gets the sms client correlator.
	 *
	 * @author SulakkhanaW
	 * @return the sms client correlator
	 */
	public static String getSmsClientCorrelator() {
		return smsClientCorrelator;
	}

	/**
	 * Sets the sms client correlator.
	 *
	 * @author SulakkhanaW
	 * @param smsClientCorrelator the new sms client correlator
	 */
	public void setSmsClientCorrelator(String smsClientCorrelator) {
		SMSDataValidation.smsClientCorrelator = smsClientCorrelator;
	}
	
}
