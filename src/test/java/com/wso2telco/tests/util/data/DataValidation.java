package com.wso2telco.tests.util.data;

import com.wso2telco.apimanager.pageobjects.apihome.sandbox.SandBoxPage;
import com.wso2telco.tests.apimanager.base.BasicTestObject;

public class DataValidation extends BasicTestObject {
	
	/**
	 * Checks if is request payload.
	 *
	 * @author JayaniP
	 * @param json the json
	 * @return true, if is request payload
	 */
	public boolean isRequestPayload(String json){
		SandBoxPage sandbox = new SandBoxPage(driver);
		SandBoxValues sandboxValues = new SandBoxValues();
		if (!sandboxValues.getAmount().isEmpty()){
			String requestAmount = sandbox.getValueFromJson("amount", json);
			if (!requestAmount.equalsIgnoreCase(sandboxValues.getAmount())){
				return false;
			}
		} else if (sandboxValues.getSmsUserId().isEmpty()){
			String smsUserId = sandbox.getValueFromJson("endUserId", json);
			if (!smsUserId.equalsIgnoreCase(sandboxValues.getSmsUserId())){
				return false;
			}
		} else if (sandboxValues.getTransactionOperationStatus().isEmpty()){
			String transactionOperationStatus = sandbox.getValueFromJson("transactionOperationStatus", json);
			if (!transactionOperationStatus.equalsIgnoreCase(sandboxValues.getTransactionOperationStatus())){
				return false;
			}
		} else if (sandboxValues.getReferenceCode().isEmpty()){
			String referenceCode = sandbox.getValueFromJson("referenceCode", json);
			if (!referenceCode.equalsIgnoreCase(sandboxValues.getReferenceCode())){
				return false;
			}
		} else if (sandboxValues.getRequestDescription().isEmpty()){
			String description = sandbox.getValueFromJson("description", json);
			if (!description.equalsIgnoreCase(sandboxValues.getRequestDescription())){
				return false;
			}
		} else if (sandboxValues.getCurrency().isEmpty()){
			String currency = sandbox.getValueFromJson("currency", json);
			if (!currency.equalsIgnoreCase(sandboxValues.getCurrency())){
				return false;
			}
		} else if (sandboxValues.getClientCorrelation().isEmpty()){
			String clientCorrelator = sandbox.getValueFromJson("clientCorrelator", json);
			if (!clientCorrelator.equalsIgnoreCase(sandboxValues.getClientCorrelation())){
				return false;
			}
		} else if (sandboxValues.getPurchaseCategoryCode().isEmpty()){
			String purchaseCategoryCode = sandbox.getValueFromJson("purchaseCategoryCode", json);
			if (!purchaseCategoryCode.equalsIgnoreCase(sandboxValues.getPurchaseCategoryCode())){
				return false;
			}
		} else if (sandboxValues.getChannel().isEmpty()){
			String channel = sandbox.getValueFromJson("channel", json);
			if (!channel.equalsIgnoreCase(sandboxValues.getChannel())){
				return false;
			}
		} else if (sandboxValues.getTaxAmount().isEmpty()){
			String taxAmount = sandbox.getValueFromJson("taxAmount", json);
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
		SandBoxPage sandbox = new SandBoxPage(driver);
		SandBoxValues sandboxValues = new SandBoxValues();
		if (!sandboxValues.getAmount().isEmpty()){
			String requestAmount = sandbox.getValueFromJson("amount", json);
			if (!requestAmount.equalsIgnoreCase(sandboxValues.getAmount())){
				return false;
			}
		} else if (sandboxValues.getSmsUserId().isEmpty()){
			String smsUserId = sandbox.getValueFromJson("endUserId", json);
			if (!smsUserId.equalsIgnoreCase(sandboxValues.getSmsUserId())){
				return false;
			}
		}  else if (sandboxValues.getTransactionOperationStatus().isEmpty()){
			String transactionOperationStatus = sandbox.getValueFromJson("transactionOperationStatus", json);
			if (!transactionOperationStatus.equalsIgnoreCase(sandboxValues.getTransactionOperationStatus())){
				return false;
			}
		} else if (sandboxValues.getReferenceCode().isEmpty()){
			String referenceCode = sandbox.getValueFromJson("referenceCode", json);
			if (!referenceCode.equalsIgnoreCase(sandboxValues.getReferenceCode())){
				return false;
			}
		} else if (sandboxValues.getRequestDescription().isEmpty()){
			String description = sandbox.getValueFromJson("description", json);
			if (!description.equalsIgnoreCase(sandboxValues.getRequestDescription())){
				return false;
			}
		} else if (sandboxValues.getCurrency().isEmpty()){
			String currency = sandbox.getValueFromJson("currency", json);
			if (!currency.equalsIgnoreCase(sandboxValues.getCurrency())){
				return false;
			}
		} else if (sandboxValues.getClientCorrelation().isEmpty()){
			String clientCorrelator = sandbox.getValueFromJson("clientCorrelator", json);
			if (!clientCorrelator.equalsIgnoreCase(sandboxValues.getClientCorrelation())){
				return false;
			}
		} else if (sandboxValues.getPurchaseCategoryCode().isEmpty()){
			String purchaseCategoryCode = sandbox.getValueFromJson("purchaseCategoryCode", json);
			if (!purchaseCategoryCode.equalsIgnoreCase(sandboxValues.getPurchaseCategoryCode())){
				return false;
			}
		} else if (sandboxValues.getChannel().isEmpty()){
			String channel = sandbox.getValueFromJson("channel", json);
			if (!channel.equalsIgnoreCase(sandboxValues.getChannel())){
				return false;
			}
		} else if (sandboxValues.getTaxAmount().isEmpty()){
			String taxAmount = sandbox.getValueFromJson("taxAmount", json);
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
		SandBoxPage sandbox = new SandBoxPage(driver);
		SandBoxValues sandboxValues = new SandBoxValues();
		double amount = Double.parseDouble(sandboxValues.getAmount());
		double tax = Double.parseDouble(sandboxValues.getTaxAmount());
		double total = amount + tax;
		double totalUI = Double.parseDouble(sandbox.getValueFromJson("totalAmountCharged", json));
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
		SandBoxPage sandbox = new SandBoxPage(driver);
		SandBoxValues sandboxValues = new SandBoxValues();
		if (!sandboxValues.getAmount().isEmpty()){
			String requestAmount = sandbox.getValueFromJson("amount", json);
			if (!requestAmount.equalsIgnoreCase(sandboxValues.getAmount())){
				return false;
			}
		} else if (sandboxValues.getSmsUserId().isEmpty()){
			String smsUserId = sandbox.getValueFromJson("endUserId", json);
			if (!smsUserId.equalsIgnoreCase(sandboxValues.getSmsUserId())){
				return false;
			}
		} else if (sandboxValues.getTransactionOperationStatus().isEmpty()){
			String transactionOperationStatus = sandbox.getValueFromJson("transactionOperationStatus", json);
			if (!transactionOperationStatus.equalsIgnoreCase(sandboxValues.getTransactionOperationStatus())){
				return false;
			}
		} else if (sandboxValues.getReferenceCode().isEmpty()){
			String referenceCode = sandbox.getValueFromJson("referenceCode", json);
			if (!referenceCode.equalsIgnoreCase(sandboxValues.getReferenceCode())){
				return false;
			}
		} else if (sandboxValues.getRequestDescription().isEmpty()){
			String description = sandbox.getValueFromJson("description", json);
			if (!description.equalsIgnoreCase(sandboxValues.getRequestDescription())){
				return false;
			}
		} else if (sandboxValues.getCurrency().isEmpty()){
			String currency = sandbox.getValueFromJson("currency", json);
			if (!currency.equalsIgnoreCase(sandboxValues.getCurrency())){
				return false;
			}
		} else if (sandboxValues.getClientCorrelation().isEmpty()){
			String clientCorrelator = sandbox.getValueFromJson("clientCorrelator", json);
			if (!clientCorrelator.equalsIgnoreCase(sandboxValues.getClientCorrelation())){
				return false;
			}
		} else if (sandboxValues.getPurchaseCategoryCode().isEmpty()){
			String purchaseCategoryCode = sandbox.getValueFromJson("purchaseCategoryCode", json);
			if (!purchaseCategoryCode.equalsIgnoreCase(sandboxValues.getPurchaseCategoryCode())){
				return false;
			}
		} else if (sandboxValues.getChannel().isEmpty()){
			String channel = sandbox.getValueFromJson("channel", json);
			if (!channel.equalsIgnoreCase(sandboxValues.getChannel())){
				return false;
			}
		} else if (sandboxValues.getTaxAmount().isEmpty()){
			String taxAmount = sandbox.getValueFromJson("taxAmount", json);
			if (!taxAmount.equalsIgnoreCase(sandboxValues.getTaxAmount())){
				return false;
			}
		} else if (sandboxValues.getServerReferenceCode().isEmpty()){
			String taxAmount = sandbox.getValueFromJson("originalServerReferenceCode", json);
			if (!taxAmount.equalsIgnoreCase(sandboxValues.getServerReferenceCode())){
				return false;
			}
		} else if (sandboxValues.getCode().isEmpty()){
			String taxAmount = sandbox.getValueFromJson("code", json);
			if (!taxAmount.equalsIgnoreCase(sandboxValues.getCode())){
				return false;
			}
		} else if (sandboxValues.getOnBehalfOf().isEmpty()){
			String taxAmount = sandbox.getValueFromJson("onBehalfOf", json);
			if (!taxAmount.equalsIgnoreCase(sandboxValues.getOnBehalfOf())){
				return false;
			}
		} else if (sandboxValues.getMandateID().isEmpty()){
			String taxAmount = sandbox.getValueFromJson("mandateId", json);
			if (!taxAmount.equalsIgnoreCase(sandboxValues.getMandateID())){
				return false;
			}
		} else if (sandboxValues.getProductId().isEmpty()){
			String taxAmount = sandbox.getValueFromJson("productId", json);
			if (!taxAmount.equalsIgnoreCase(sandboxValues.getProductId())){
				return false;
			}
		} else if (sandboxValues.getServiceId().isEmpty()){
			String taxAmount = sandbox.getValueFromJson("serviceId", json);
			if (!taxAmount.equalsIgnoreCase(sandboxValues.getServiceId())){
				return false;
			}
		} else if (sandboxValues.getNotificationFormat().isEmpty()){
			String taxAmount = sandbox.getValueFromJson("notificationFormat", json);
			if (!taxAmount.equalsIgnoreCase(sandboxValues.getNotificationFormat())){
				return false;
			}
		} else if (sandboxValues.getNotifyURL().isEmpty()){
			String taxAmount = sandbox.getValueFromJson("notifyURL", json);
			if (!taxAmount.equalsIgnoreCase(sandboxValues.getNotifyURL())){
				return false;
			}
		} else if (sandboxValues.getCallBackData().isEmpty()){
			String taxAmount = sandbox.getValueFromJson("callbackData", json);
			if (!taxAmount.equalsIgnoreCase(sandboxValues.getCallBackData())){
				return false;
			}
		}
		return true;
	}
	

}
