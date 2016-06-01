package com.wso2telco.tests.util.data;

import java.util.List;

import org.apache.log4j.Logger;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

public class UssdDataValidation {

	Logger logger = Logger.getLogger(UssdDataValidation.class);

	/** The address */
	private static String address;

	/** The address */
	private static String shortCode;

	/** The keyword */
	private static String keyword;

	/** The outboundUSSDMessage */
	private static String outboundUSSDMessage;

	/** The clientCorrelator */
	private static String clientCorrelator;

	/** The notifyURL */
	private static String notifyURL;

	/** The callbackData */
	private static String callbackData;

	/** The ussdAction */
	private static String ussdAction;

	/** The deliveryStatus */
	private static String deliveryStatus = "SENT";

	/**
	 * Get Address
	 * 
	 * @author Achiniuj
	 * @return
	 */
	public static String getAddress() {
		return address;
	}

	/**
	 * Set Address
	 * 
	 * @author Achiniuj
	 * @param address
	 */
	public void setAddress(String address) {
		UssdDataValidation.address = address;
	}

	/**
	 * Get Short code
	 * 
	 * @author Achiniuj
	 */
	public static String getShortCode() {
		return shortCode;
	}

	/**
	 * Set Short code
	 * 
	 * @author Achiniuj
	 * @param shortCode
	 */
	public void setShortCode(String shortCode) {
		UssdDataValidation.shortCode = shortCode;
	}

	/**
	 * Get KeyWord
	 * 
	 * @author Achiniuj
	 * @return
	 */
	public static String getKeyword() {
		return keyword;
	}

	/**
	 * Set Key word
	 * 
	 * @author Achiniuj
	 * @param keyword
	 */
	public void setKeyword(String keyword) {
		UssdDataValidation.keyword = keyword;
	}

	/**
	 * Get OutboundUSSDMessage
	 * 
	 * @author Achiniuj
	 * @return
	 */
	public static String getOutboundUSSDMessage() {
		return outboundUSSDMessage;
	}

	/**
	 * Set OutboundUSSDMessage
	 * 
	 * @author Achiniuj
	 * @param outboundUSSDMessage
	 */
	public void setOutboundUSSDMessage(String outboundUSSDMessage) {
		UssdDataValidation.outboundUSSDMessage = outboundUSSDMessage;
	}

	/**
	 * Get Client Correlator
	 * 
	 * @author Achiniuj
	 * @return
	 */
	public static String getClientCorrelator() {
		return clientCorrelator;
	}

	/**
	 * Set Client Correlator
	 * 
	 * @author Achiniuj
	 * @param clientCorrelator
	 */
	public void setClientCorrelator(String clientCorrelator) {
		UssdDataValidation.clientCorrelator = clientCorrelator;
	}

	/**
	 * Get Notify URL
	 * 
	 * @author Achiniuj
	 * @return
	 */
	public static String getNotifyURL() {
		return notifyURL;
	}

	/**
	 * Set Notify URL
	 * 
	 * @author Achiniuj
	 * @param notifyURL
	 */
	public void setNotifyURL(String notifyURL) {
		UssdDataValidation.notifyURL = notifyURL;
	}

	/**
	 * get Callback Data
	 * 
	 * @author Achiniuj
	 * @return
	 */
	public static String getCallbackData() {
		return callbackData;
	}

	/**
	 * Set Callback Data
	 * 
	 * @author Achiniuj
	 * @param callbackData
	 */
	public void setCallbackData(String callbackData) {
		UssdDataValidation.callbackData = callbackData;
	}

	/**
	 * Get Ussd Action
	 * 
	 * @author Achiniuj
	 * @return
	 */
	public static String getUssdAction() {
		return ussdAction;
	}

	/**
	 * Set Ussd Action
	 * 
	 * @author Achiniuj
	 * @param ussdAction
	 */
	public void setUssdAction(String ussdAction) {
		UssdDataValidation.ussdAction = ussdAction;
	}

	/**
	 * get Delivery Status
	 * 
	 * @author Achiniuj
	 * @return
	 */
	public static String getDeliveryStatus() {
		return deliveryStatus;
	}

	/**
	 * Set Delivery Status
	 * 
	 * @author Achiniuj
	 * @param deliveryStatus
	 */
	public void setDeliveryStatus(String deliveryStatus) {
		UssdDataValidation.deliveryStatus = deliveryStatus;

	}

	/**
	 * Check if is USSD request payload
	 * 
	 * @author Achiniuj
	 * @param json
	 *            the json
	 * @return true, if is USSD request payload
	 */
	public boolean isUssdRequestPayload(String json) {

		if (!getAddress().isEmpty()) {
			String requestAddress = getValueFromJsonUssd("address", json);
			if (!requestAddress.equalsIgnoreCase(getAddress())) {
				return false;
			}
		}

		if (!getShortCode().isEmpty()) {
			String requestShortCode = getValueFromJsonUssd("shortCode", json);
			if (!requestShortCode.equalsIgnoreCase(getShortCode())) {
				return false;
			}
		}
		if (!getKeyword().isEmpty()) {
			String requestKeyword = getValueFromJsonUssd("keyword", json);
			if (!requestKeyword.equalsIgnoreCase(getKeyword())) {
				return false;
			}
		}
		if (!getOutboundUSSDMessage().isEmpty()) {
			String requestOutboundUSSDMessage = getValueFromJsonUssd("outboundUSSDMessage", json);
			if (!requestOutboundUSSDMessage.equalsIgnoreCase(getOutboundUSSDMessage())) {
				return false;
			}
		}

		if (!getClientCorrelator().isEmpty()) {
			String requestClientCorrelator = getValueFromJsonUssd("clientCorrelator", json);
			if (!requestClientCorrelator.equalsIgnoreCase(getClientCorrelator())) {
				return false;
			}
		}

		if (!getNotifyURL().isEmpty()) {
			String requestNotifyURL = getValueFromJsonUssd("notifyURL", json);
			if (!requestNotifyURL.equalsIgnoreCase(getNotifyURL())) {
				return false;
			}
		}

		if (!getCallbackData().isEmpty()) {
			String requestCallbackData = getValueFromJsonUssd("callbackData", json);
			if (!requestCallbackData.equalsIgnoreCase(getCallbackData())) {
				return false;
			}
		}

		if (!getUssdAction().isEmpty()) {
			String requestUssdAction = getValueFromJsonUssd("ussdAction", json);
			if (!requestUssdAction.equalsIgnoreCase(getUssdAction())) {
				return false;
			}
		}

		return true;
	}

	/**
	 * Get value from Json USSD
	 * 
	 * @author Achiniuj
	 * @param tag
	 *            the tag
	 * @param json
	 *            the json
	 * @return the value form Jason USSD
	 */
	public String getValueFromJsonUssd(String tag, String json) {
		JsonElement jsonElement = new JsonParser().parse(json);
		JsonObject jsonObject = jsonElement.getAsJsonObject();
		String returnValue = null;

		switch (tag) {
		case "address":
		case "shortCode":
		case "keyword":
		case "outboundUSSDMessage":
		case "clientCorrelator":
		case "ussdAction":
		case "deliveryStatus":
			returnValue = getValueOutboundUSSDMessageRequest(tag, jsonObject);
			break;

		case "notifyURL":
		case "callbackData":
			returnValue = getValueResponseRequest(tag, jsonObject);
			break;
		}
		return returnValue;
	}

	/**
	 * Get Value from OutboundUSSDMessageRequest
	 * 
	 * @author Achiniuj
	 * @param tag
	 *            tag
	 * @param jsonObject
	 *            jsonObject
	 * @return value from OutboundUSSDMessageRequest
	 */
	private String getValueOutboundUSSDMessageRequest(String tag, JsonObject jsonObject) {
		jsonObject = jsonObject.getAsJsonObject("outboundUSSDMessageRequest");
		String returnValue = jsonObject.get(tag).toString();
		String firstCharacter = Character.toString(returnValue.charAt(0));
		if (firstCharacter.equalsIgnoreCase("\"")) {
			returnValue = returnValue.substring(1, returnValue.length() - 1);
		}
		return returnValue;
	}

	/**
	 * Get value from USSD ResponseRequest
	 * 
	 * @author Achiniuj
	 * @param tag
	 *            tag
	 * @param jsonObject
	 *            jsonObject
	 * @return value from USSD ResponseRequest
	 */
	private String getValueResponseRequest(String tag, JsonObject jsonObject) {

		jsonObject = jsonObject.getAsJsonObject("outboundUSSDMessageRequest");
		jsonObject = jsonObject.getAsJsonObject("responseRequest");
		String returnValue = jsonObject.get(tag).toString();
		String firstCharacter = Character.toString(returnValue.charAt(0));
		if (firstCharacter.equalsIgnoreCase("\"")) {
			returnValue = returnValue.substring(1, returnValue.length() - 1);
		}
		return returnValue;
	}

	/**
	 * Check if is USSD Responnse payload
	 * 
	 * @author Achiniuj
	 * @param json
	 *            json
	 * @return true, if is USSD response
	 */
	public boolean isUssdResponsePayload(String json) {

		if (!getUssdAction().isEmpty()) {
			String responseUssdAction = getValueFromJsonUssd("ussdAction", json);
			if (!responseUssdAction.equalsIgnoreCase(getUssdAction())) {
				return false;
			}
		}

		if (!getShortCode().isEmpty()) {
			String responseShortCode = getValueFromJsonUssd("shortCode", json);
			if (!responseShortCode.equalsIgnoreCase(getShortCode())) {
				return false;
			}
		}

		if (!getClientCorrelator().isEmpty()) {
			String responseClientCorrelator = getValueFromJsonUssd("clientCorrelator", json);
			if (!responseClientCorrelator.equalsIgnoreCase(getClientCorrelator())) {
				return false;
			}
		}

		if (!getDeliveryStatus().isEmpty()) {
			String responseDeliveryStatus = getValueFromJsonUssd("deliveryStatus", json);
			if (!responseDeliveryStatus.equalsIgnoreCase(getDeliveryStatus())) {
				return false;
			}
		}

		if (!getKeyword().isEmpty()) {
			String responseKeyword = getValueFromJsonUssd("keyword", json);
			if (!responseKeyword.equalsIgnoreCase(getKeyword())) {
				return false;
			}
		}

		if (!getOutboundUSSDMessage().isEmpty()) {
			String responseOutboundUSSDMessage = getValueFromJsonUssd("outboundUSSDMessage", json);
			if (!responseOutboundUSSDMessage.equalsIgnoreCase(getOutboundUSSDMessage())) {
				return false;
			}
		}

		if (!getAddress().isEmpty()) {
			String responseAddress = getValueFromJsonUssd("address", json);
			if (!responseAddress.equalsIgnoreCase(getAddress())) {
				return false;
			}
		}

		if (!getCallbackData().isEmpty()) {
			String responseCallbackData = getValueFromJsonUssd("callbackData", json);
			if (!responseCallbackData.equalsIgnoreCase(getCallbackData())) {
				return false;
			}
		}

		if (!getNotifyURL().isEmpty()) {
			String responseNotifyURL = getValueFromJsonUssd("notifyURL", json);
			if (!responseNotifyURL.equalsIgnoreCase(getNotifyURL())) {
				return false;
			}
		}

		return true;
	}

	/**
	 * Check the USSD is response data in the table
	 * 
	 * @author Achiniuj
	 * @param reponseDataRow
	 * @return true, if is response data table
	 */
	public boolean isUSSDResponseData(List<String> reponseDataRow) {

		if (!getUssdAction().isEmpty()) {
			if (!reponseDataRow.contains(getUssdAction())) {
				return false;
			}
		}
		if (!getShortCode().isEmpty()) {
			if (!reponseDataRow.contains(getShortCode())) {
				return false;
			}
		}
		if (!getClientCorrelator().isEmpty()) {
			if (!reponseDataRow.contains(getClientCorrelator())) {
				return false;
			}
		}
		if (!getAddress().isEmpty()) {
			if (!reponseDataRow.contains(getAddress())) {
				return false;
			}
		}
		if (!getOutboundUSSDMessage().isEmpty()) {
			if (!reponseDataRow.contains(getOutboundUSSDMessage())) {
				return false;
			}
		}
		return true;
	}

}
