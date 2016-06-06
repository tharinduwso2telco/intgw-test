package com.wso2telco.tests.util.data;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.wso2telco.apimanager.pageobjects.apihome.sandbox.SandboxNumbers;
import com.wso2telco.tests.apimanager.base.BasicTestObject;

public class PaymentDataValidation extends BasicTestObject {
	
	/**
	 * Gets the value amount transaction.
	 *
	 * @author JayaniP
	 * @param tag the tag
	 * @param jsonObject the json object
	 * @return the value amount transaction
	 */
	private String getValueAmountTransaction(String tag, JsonObject jsonObject){
		jsonObject = jsonObject.getAsJsonObject("amountTransaction");
		String returnValue = jsonObject.get(tag).toString();
		String firstCharacter = Character.toString(returnValue.charAt(0));
		if (firstCharacter.equalsIgnoreCase("\"")){
			returnValue = returnValue.substring(1, returnValue.length()-1);
		}
		return returnValue;
	}
	
	/**
	 * Gets the value paymnet amount.
	 *
	 * @author JayaniP
	 * @param tag the tag
	 * @param jsonObject the json object
	 * @return the value paymnet amount
	 */
	private String getValuePaymnetAmount(String tag, JsonObject jsonObject){
		jsonObject = jsonObject.getAsJsonObject("amountTransaction");
		jsonObject = jsonObject.getAsJsonObject("paymentAmount");
		String returnValue = jsonObject.get(tag).toString();
		String firstCharacter = Character.toString(returnValue.charAt(0));
		if (firstCharacter.equalsIgnoreCase("\"")){
			returnValue = returnValue.substring(1, returnValue.length()-1);
		}
		return returnValue;
	}
	
	/**
	 * Gets the value charging meta data.
	 *
	 * @author JayaniP
	 * @param tag the tag
	 * @param jsonObject the json object
	 * @return the value charging meta data
	 */
	private String getValueChargingMetaData(String tag, JsonObject jsonObject){
		jsonObject = jsonObject.getAsJsonObject("amountTransaction");
		jsonObject = jsonObject.getAsJsonObject("paymentAmount");
		jsonObject = jsonObject.getAsJsonObject("chargingMetaData");
		String returnValue = jsonObject.get(tag).toString();
		String firstCharacter = Character.toString(returnValue.charAt(0));
		if (firstCharacter.equalsIgnoreCase("\"")){
			returnValue = jsonObject.get(tag).toString().substring(1, tag.length()-1);
		}
		return returnValue;
	}
	
	/**
	 * Gets the value charging information.
	 *
	 * @author JayaniP
	 * @param tag the tag
	 * @param jsonObject the json object
	 * @return the value charging information
	 */
	private String getValueChargingInformation(String tag, JsonObject jsonObject){
		jsonObject = jsonObject.getAsJsonObject("amountTransaction");
		jsonObject = jsonObject.getAsJsonObject("paymentAmount");
		jsonObject = jsonObject.getAsJsonObject("chargingInformation");
		String firstCharacter = Character.toString(jsonObject.get(tag).toString().charAt(0));
		String returnValue = null;
		if (firstCharacter.equalsIgnoreCase("\"")){
			returnValue = jsonObject.get(tag).toString().substring(1, tag.length()-1);
		} else {
			returnValue = jsonObject.get(tag).toString();
		}
		return returnValue;
	}
	
	/**
	 * Gets the value policy exception.
	 *
	 * @author JayaniP
	 * @param tag the tag
	 * @param jsonObject the json object
	 * @return the value policy exception
	 */
	private String getValuePolicyException(String tag, JsonObject jsonObject){
		jsonObject = jsonObject.getAsJsonObject("requestError");
		jsonObject = jsonObject.getAsJsonObject("policyException");
		String returnValue = jsonObject.get(tag).toString();
		String firstCharacter = Character.toString(returnValue.charAt(0));
		if (firstCharacter.equalsIgnoreCase("\"")){
			returnValue = returnValue.substring(1, returnValue.length()-1);
		}
		return returnValue;
	}
	
	/**
	 * Gets the value from json.
	 *
	 * @author JayaniP
	 * @param tag the tag
	 * @param json the json
	 * @return the value from json
	 */
	public String getValueFromJson(String tag, String json) {
		JsonElement jsonElement = new JsonParser().parse(json);
		JsonObject jsonObject = jsonElement.getAsJsonObject();
		String returnValue = null;
		switch (tag) {

		case "serverReferenceCode":	
		case "endUserId":
		case "transactionOperationStatus":
		case "clientCorrelator":
		case "referenceCode":
		case "callbackData":
		case "notificationFormat":
		case "originalServerReferenceCode":
			returnValue = getValueAmountTransaction(tag, jsonObject);
			break;
			
		case "totalAmountCharged":
		case "totalAmountRefunded":
			returnValue = getValuePaymnetAmount(tag, jsonObject);
			break;

		case "taxAmount":
		case "purchaseCategoryCode":
		case "channel":
		case "onBehalfOf":
		case "serviceId":	
		case "mandateId":
		case "productId":
			returnValue = getValueChargingMetaData(tag, jsonObject);
			break;

		case "amount":
		case "description":
		case "currency":
		case "code":
			returnValue = getValueChargingInformation(tag, jsonObject);
			break;
			
		case "text":
			returnValue = getValuePolicyException(tag, jsonObject);
			break;
			
		default:
			break;
		}
		return returnValue;
	}
	
	/**
	 * Checks if is request payload.
	 *
	 * @author JayaniP
	 * @param json the json
	 * @return true, if is request payload
	 */
	public boolean isRequestPayload(String json){
		SandBoxValues sandboxValues = new SandBoxValues();
		if (!sandboxValues.getAmount().isEmpty()){
			String requestAmount = getValueFromJson("amount", json);
			if (!requestAmount.equalsIgnoreCase(sandboxValues.getAmount())){
				return false;
			}
		} else if (sandboxValues.getSmsUserId().isEmpty()){
			String smsUserId = getValueFromJson("endUserId", json);
			if (!smsUserId.equalsIgnoreCase(sandboxValues.getSmsUserId())){
				return false;
			}
		} else if (sandboxValues.getTransactionOperationStatus().isEmpty()){
			String transactionOperationStatus = getValueFromJson("transactionOperationStatus", json);
			if (!transactionOperationStatus.equalsIgnoreCase(sandboxValues.getTransactionOperationStatus())){
				return false;
			}
		} else if (sandboxValues.getReferenceCode().isEmpty()){
			String referenceCode = getValueFromJson("referenceCode", json);
			if (!referenceCode.equalsIgnoreCase(sandboxValues.getReferenceCode())){
				return false;
			}
		} else if (sandboxValues.getRequestDescription().isEmpty()){
			String description = getValueFromJson("description", json);
			if (!description.equalsIgnoreCase(sandboxValues.getRequestDescription())){
				return false;
			}
		} else if (sandboxValues.getCurrency().isEmpty()){
			String currency = getValueFromJson("currency", json);
			if (!currency.equalsIgnoreCase(sandboxValues.getCurrency())){
				return false;
			}
		} else if (sandboxValues.getClientCorrelation().isEmpty()){
			String clientCorrelator = getValueFromJson("clientCorrelator", json);
			if (!clientCorrelator.equalsIgnoreCase(sandboxValues.getClientCorrelation())){
				return false;
			}
		} else if (sandboxValues.getPurchaseCategoryCode().isEmpty()){
			String purchaseCategoryCode = getValueFromJson("purchaseCategoryCode", json);
			if (!purchaseCategoryCode.equalsIgnoreCase(sandboxValues.getPurchaseCategoryCode())){
				return false;
			}
		} else if (sandboxValues.getChannel().isEmpty()){
			String channel = getValueFromJson("channel", json);
			if (!channel.equalsIgnoreCase(sandboxValues.getChannel())){
				return false;
			}
		} else if (sandboxValues.getTaxAmount().isEmpty()){
			String taxAmount = getValueFromJson("taxAmount", json);
			if (!taxAmount.equalsIgnoreCase(sandboxValues.getTaxAmount())){
				return false;
			}
		}
		return true;
	}
	
	/**
	 * Checks if is response payload.
	 *
	 * @author JayaniP
	 * @param json the json
	 * @return true, if is response payload
	 */
	public boolean isResponsePayload(String json){
		SandBoxValues sandboxValues = new SandBoxValues();
		if (!sandboxValues.getAmount().isEmpty()){
			String requestAmount = getValueFromJson("amount", json);
			if (!requestAmount.equalsIgnoreCase(sandboxValues.getAmount())){
				return false;
			}
		} else if (sandboxValues.getSmsUserId().isEmpty()){
			String smsUserId = getValueFromJson("endUserId", json);
			if (!smsUserId.equalsIgnoreCase(sandboxValues.getSmsUserId())){
				return false;
			}
		}  else if (sandboxValues.getTransactionOperationStatus().isEmpty()){
			String transactionOperationStatus = getValueFromJson("transactionOperationStatus", json);
			if (!transactionOperationStatus.equalsIgnoreCase(sandboxValues.getTransactionOperationStatus())){
				return false;
			}
		} else if (sandboxValues.getReferenceCode().isEmpty()){
			String referenceCode = getValueFromJson("referenceCode", json);
			if (!referenceCode.equalsIgnoreCase(sandboxValues.getReferenceCode())){
				return false;
			}
		} else if (sandboxValues.getRequestDescription().isEmpty()){
			String description = getValueFromJson("description", json);
			if (!description.equalsIgnoreCase(sandboxValues.getRequestDescription())){
				return false;
			}
		} else if (sandboxValues.getCurrency().isEmpty()){
			String currency = getValueFromJson("currency", json);
			if (!currency.equalsIgnoreCase(sandboxValues.getCurrency())){
				return false;
			}
		} else if (sandboxValues.getClientCorrelation().isEmpty()){
			String clientCorrelator = getValueFromJson("clientCorrelator", json);
			if (!clientCorrelator.equalsIgnoreCase(sandboxValues.getClientCorrelation())){
				return false;
			}
		} else if (sandboxValues.getPurchaseCategoryCode().isEmpty()){
			String purchaseCategoryCode = getValueFromJson("purchaseCategoryCode", json);
			if (!purchaseCategoryCode.equalsIgnoreCase(sandboxValues.getPurchaseCategoryCode())){
				return false;
			}
		} else if (sandboxValues.getChannel().isEmpty()){
			String channel = getValueFromJson("channel", json);
			if (!channel.equalsIgnoreCase(sandboxValues.getChannel())){
				return false;
			}
		} else if (sandboxValues.getTaxAmount().isEmpty()){
			String taxAmount = getValueFromJson("taxAmount", json);
			if (!taxAmount.equalsIgnoreCase(sandboxValues.getTaxAmount())){
				return false;
			}
		}
		return true;
	}
	
	/**
	 * Checks if is total amount.
	 *
	 * @author JayaniP
	 * @param json the json
	 * @return true, if is total amount
	 */
	public boolean isTotalAmount(String json){
		SandBoxValues sandboxValues = new SandBoxValues();
		double amount = Double.parseDouble(sandboxValues.getAmount());
		double tax = Double.parseDouble(sandboxValues.getTaxAmount());
		double total = amount + tax;
		double totalUI = Double.parseDouble(getValueFromJson("totalAmountCharged", json));
		if (!(Math.abs(totalUI-total)<= 0.01)) {
			return false;
		}
		
		return true;
	}
	
	/**
	 * Checks if is refund request payload.
	 *
	 * @author JayaniP
	 * @param json the json
	 * @return true, if is refund request payload
	 */
	public boolean isRefundRequestPayload(String json){
		SandBoxValues sandboxValues = new SandBoxValues();
		if (!sandboxValues.getAmount().isEmpty()){
			String requestAmount = getValueFromJson("amount", json);
			if (!requestAmount.equalsIgnoreCase(sandboxValues.getAmount())){
				return false;
			}
		} else if (sandboxValues.getSmsUserId().isEmpty()){
			String smsUserId = getValueFromJson("endUserId", json);
			if (!smsUserId.equalsIgnoreCase(sandboxValues.getSmsUserId())){
				return false;
			}
		} else if (sandboxValues.getTransactionOperationStatus().isEmpty()){
			String transactionOperationStatus = getValueFromJson("transactionOperationStatus", json);
			if (!transactionOperationStatus.equalsIgnoreCase(sandboxValues.getTransactionOperationStatus())){
				return false;
			}
		} else if (sandboxValues.getReferenceCode().isEmpty()){
			String referenceCode = getValueFromJson("referenceCode", json);
			if (!referenceCode.equalsIgnoreCase(sandboxValues.getReferenceCode())){
				return false;
			}
		} else if (sandboxValues.getRequestDescription().isEmpty()){
			String description = getValueFromJson("description", json);
			if (!description.equalsIgnoreCase(sandboxValues.getRequestDescription())){
				return false;
			}
		} else if (sandboxValues.getCurrency().isEmpty()){
			String currency = getValueFromJson("currency", json);
			if (!currency.equalsIgnoreCase(sandboxValues.getCurrency())){
				return false;
			}
		} else if (sandboxValues.getClientCorrelation().isEmpty()){
			String clientCorrelator = getValueFromJson("clientCorrelator", json);
			if (!clientCorrelator.equalsIgnoreCase(sandboxValues.getClientCorrelation())){
				return false;
			}
		} else if (sandboxValues.getPurchaseCategoryCode().isEmpty()){
			String purchaseCategoryCode = getValueFromJson("purchaseCategoryCode", json);
			if (!purchaseCategoryCode.equalsIgnoreCase(sandboxValues.getPurchaseCategoryCode())){
				return false;
			}
		} else if (sandboxValues.getChannel().isEmpty()){
			String channel = getValueFromJson("channel", json);
			if (!channel.equalsIgnoreCase(sandboxValues.getChannel())){
				return false;
			}
		} else if (sandboxValues.getTaxAmount().isEmpty()){
			String taxAmount = getValueFromJson("taxAmount", json);
			if (!taxAmount.equalsIgnoreCase(sandboxValues.getTaxAmount())){
				return false;
			}
		} else if (sandboxValues.getServerReferenceCode().isEmpty()){
			String taxAmount = getValueFromJson("originalServerReferenceCode", json);
			if (!taxAmount.equalsIgnoreCase(sandboxValues.getServerReferenceCode())){
				return false;
			}
		} else if (sandboxValues.getCode().isEmpty()){
			String taxAmount = getValueFromJson("code", json);
			if (!taxAmount.equalsIgnoreCase(sandboxValues.getCode())){
				return false;
			}
		} else if (sandboxValues.getOnBehalfOf().isEmpty()){
			String taxAmount = getValueFromJson("onBehalfOf", json);
			if (!taxAmount.equalsIgnoreCase(sandboxValues.getOnBehalfOf())){
				return false;
			}
		} else if (sandboxValues.getMandateID().isEmpty()){
			String taxAmount = getValueFromJson("mandateId", json);
			if (!taxAmount.equalsIgnoreCase(sandboxValues.getMandateID())){
				return false;
			}
		} else if (sandboxValues.getProductId().isEmpty()){
			String taxAmount = getValueFromJson("productId", json);
			if (!taxAmount.equalsIgnoreCase(sandboxValues.getProductId())){
				return false;
			}
		} else if (sandboxValues.getServiceId().isEmpty()){
			String taxAmount = getValueFromJson("serviceId", json);
			if (!taxAmount.equalsIgnoreCase(sandboxValues.getServiceId())){
				return false;
			}
		} else if (sandboxValues.getNotificationFormat().isEmpty()){
			String taxAmount = getValueFromJson("notificationFormat", json);
			if (!taxAmount.equalsIgnoreCase(sandboxValues.getNotificationFormat())){
				return false;
			}
		} else if (sandboxValues.getNotifyURL().isEmpty()){
			String taxAmount = getValueFromJson("notifyURL", json);
			if (!taxAmount.equalsIgnoreCase(sandboxValues.getNotifyURL())){
				return false;
			}
		} else if (sandboxValues.getCallBackData().isEmpty()){
			String taxAmount = getValueFromJson("callbackData", json);
			if (!taxAmount.equalsIgnoreCase(sandboxValues.getCallBackData())){
				return false;
			}
		}
		return true;
	}
	
	
	/**
	 * Checks if is refund response payload.
	 *
	 * @author JayaniP
	 * @param json the json
	 * @return true, if is refund response payload
	 */
	public boolean isRefundResponsePayload(String json){
		SandBoxValues sandboxValues = new SandBoxValues();
		if (!sandboxValues.getAmount().isEmpty()){
			String requestAmount = getValueFromJson("amount", json);
			if (!requestAmount.equalsIgnoreCase(sandboxValues.getAmount())){
				return false;
			}
		} else if (sandboxValues.getSmsUserId().isEmpty()){
			String smsUserId = getValueFromJson("endUserId", json);
			if (!smsUserId.equalsIgnoreCase(sandboxValues.getSmsUserId())){
				return false;
			}
		}  else if (sandboxValues.getTransactionOperationStatus().isEmpty()){
			String transactionOperationStatus = getValueFromJson("transactionOperationStatus", json);
			if (!transactionOperationStatus.equalsIgnoreCase(sandboxValues.getTransactionOperationStatus())){
				return false;
			}
		} else if (sandboxValues.getReferenceCode().isEmpty()){
			String referenceCode = getValueFromJson("referenceCode", json);
			if (!referenceCode.equalsIgnoreCase(sandboxValues.getReferenceCode())){
				return false;
			}
		} else if (sandboxValues.getRequestDescription().isEmpty()){
			String description = getValueFromJson("description", json);
			if (!description.equalsIgnoreCase(sandboxValues.getRequestDescription())){
				return false;
			}
		} else if (sandboxValues.getCurrency().isEmpty()){
			String currency = getValueFromJson("currency", json);
			if (!currency.equalsIgnoreCase(sandboxValues.getCurrency())){
				return false;
			}
		} else if (sandboxValues.getClientCorrelation().isEmpty()){
			String clientCorrelator = getValueFromJson("clientCorrelator", json);
			if (!clientCorrelator.equalsIgnoreCase(sandboxValues.getClientCorrelation())){
				return false;
			}
		} else if (sandboxValues.getPurchaseCategoryCode().isEmpty()){
			String purchaseCategoryCode = getValueFromJson("purchaseCategoryCode", json);
			if (!purchaseCategoryCode.equalsIgnoreCase(sandboxValues.getPurchaseCategoryCode())){
				return false;
			}
		} else if (sandboxValues.getChannel().isEmpty()){
			String channel = getValueFromJson("channel", json);
			if (!channel.equalsIgnoreCase(sandboxValues.getChannel())){
				return false;
			}
		} else if (sandboxValues.getTaxAmount().isEmpty()){
			String taxAmount = getValueFromJson("taxAmount", json);
			if (!taxAmount.equalsIgnoreCase(sandboxValues.getTaxAmount())){
				return false;
			}
		} else if (sandboxValues.getServiceId().isEmpty()){
			String taxAmount = getValueFromJson("serviceId", json);
			if (!taxAmount.equalsIgnoreCase(sandboxValues.getServiceId())){
				return false;
			}
		} else if (sandboxValues.getMandateID().isEmpty()){
			String taxAmount = getValueFromJson("mandateId", json);
			if (!taxAmount.equalsIgnoreCase(sandboxValues.getMandateID())){
				return false;
			}
		} else if (sandboxValues.getProductId().isEmpty()){
			String taxAmount = getValueFromJson("productId", json);
			if (!taxAmount.equalsIgnoreCase(sandboxValues.getProductId())){
				return false;
			}
		} else if (sandboxValues.getOnBehalfOf().isEmpty()){
			String taxAmount = getValueFromJson("onBehalfOf", json);
			if (!taxAmount.equalsIgnoreCase(sandboxValues.getOnBehalfOf())){
				return false;
			}
		} else if (sandboxValues.getAmount().isEmpty()){
			String taxAmount = getValueFromJson("totalAmountRefunded", json);
			if (!taxAmount.equalsIgnoreCase(sandboxValues.getAmount())){
				return false;
			}
		} else if (sandboxValues.getCode().isEmpty()){
			String taxAmount = getValueFromJson("code", json);
			if (!taxAmount.equalsIgnoreCase(sandboxValues.getCode())){
				return false;
			}
		} else if (sandboxValues.getNotifyURL().isEmpty()){
			String taxAmount = getValueFromJson("notifyURL", json);
			if (!taxAmount.equalsIgnoreCase(sandboxValues.getNotifyURL())){
				return false;
			}
		} else if (sandboxValues.getCallBackData().isEmpty()){
			String taxAmount = getValueFromJson("callbackData", json);
			if (!taxAmount.equalsIgnoreCase(sandboxValues.getCallBackData())){
				return false;
			}
		} else if (sandboxValues.getNotificationFormat().isEmpty()){
			String taxAmount = getValueFromJson("notificationFormat", json);
			if (!taxAmount.equalsIgnoreCase(sandboxValues.getNotificationFormat())){
				return false;
			}
		} else if (sandboxValues.getServerReferenceCode().isEmpty()){
			String taxAmount = getValueFromJson("originalServerReferenceCode", json);
			if (!taxAmount.equalsIgnoreCase(sandboxValues.getServerReferenceCode())){
				return false;
			}
		}
		return true;
	}

	/**
	 * Checks if is balance.
	 *
	 * @author JayaniP
	 * @param number the number
	 * @return true, if is balance
	 * @throws Exception the exception
	 */
	public boolean isBalance(String number) throws Exception{
		SandBoxValues sandboxValues = new SandBoxValues();
		SandboxNumbers sandbox = new SandboxNumbers(driver);
		
		if (!sandbox.getBalanceofTheNumber(number).equalsIgnoreCase(sandboxValues.getBalance())) {
			return false;
		}
		return true;
		
	}
	
	/**
	 * Checks if is error response payload.
	 *
	 * @author JayaniP
	 * @param json the json
	 * @return true, if is error response payload
	 */
	public boolean isErrorResponsePayload(String message){
		SandBoxValues sandboxValues = new SandBoxValues();
		String responsePayload = sandboxValues.getResponsePayload();
		String errorText = getValueFromJson("text", responsePayload);
		
		if (!errorText.equalsIgnoreCase(message)) {
			return false;
		}
		return true;
}
	}
