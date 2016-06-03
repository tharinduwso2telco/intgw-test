package com.wso2telco.tests.apimanager.steps.apimanager.sms;

import java.util.List;

import org.junit.Assert;

import com.wso2telco.apimanager.pageobjects.apihome.sandbox.SandboxSMSPage;
import com.wso2telco.test.framework.tools.data.DataGenerator;
import com.wso2telco.tests.apimanager.base.BasicTestObject;
import com.wso2telco.tests.util.data.SMSDataValidation;

import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;

public class SandboxSMSSteps extends BasicTestObject {
	
	@When("^I click on Send SMS link$")
	public void i_click_on_Send_SMS_link() throws Throwable {
		SandboxSMSPage smsPage = new SandboxSMSPage(driver);
		smsPage.clickSendSMS();
		Thread.sleep(sleepTime);
	}
	
	@When("^I Select \"([^\"]*)\" from the application dropdown$")
	public void i_Select_from_the_application_dropdown(String arg1) throws Throwable {
		SandboxSMSPage smsPage = new SandboxSMSPage(driver);
		smsPage.selectApplication(arg1);
		SMSDataValidation smsDataValidation = new SMSDataValidation();
		smsDataValidation.setApplicationNumber(arg1);
		Thread.sleep(sleepTime);
	}
	
	@When("^I select \"([^\"]*)\" from the Sender Address$")
	public void i_select_from_the_Sender_Address(String arg1) throws Throwable {
		SandboxSMSPage smsPage = new SandboxSMSPage(driver);
		smsPage.selectSenderAddress(arg1);
		SMSDataValidation smsDataValidation = new SMSDataValidation();
		smsDataValidation.setSenderAddressNumber(arg1);
		Thread.sleep(sleepTime);
	}
	
	@When("^I set a SMS message$")
	public void i_set_a_SMS_message() throws Throwable {
		SMSDataValidation smsDataValidation = new SMSDataValidation();
		SandboxSMSPage smsPage = new SandboxSMSPage(driver);
		String msg = smsDataValidation.generateRandomString(15);
		smsPage.setSenderMessage(msg);
		smsDataValidation.setSmsMessage(msg);
		Thread.sleep(sleepTime);
	}
	
	@When("^I check send request table exists and note the table rows$")
	public void i_check_send_request_table_exists_and_note_the_table_rows() throws Throwable {
		SandboxSMSPage smsPage = new SandboxSMSPage(driver);
		SMSDataValidation smsDataValidation = new SMSDataValidation();
		smsDataValidation.setRowNumberBeforeSend(smsPage.checkRowNumbers());
	}
	
	@When("^I click on SMS Send Request button$")
	public void i_click_on_SMS_Send_Request_button() throws Throwable {
		SandboxSMSPage smsPage = new SandboxSMSPage(driver);
		Thread.sleep(sleepTime);
		smsPage.clickSendRequest();
		Thread.sleep(sleepTime);
	}
	
	@Then("^I validate the send request table last row for the updation$")
	public void i_validate_the_send_request_table_last_row_for_the_updation() throws Throwable {
		SMSDataValidation smsDataValidation = new SMSDataValidation();
		int lastRowBeforeSend = smsDataValidation.getRowNumberBeforeSend();
		SandboxSMSPage smsPage = new SandboxSMSPage(driver);
		List<String> rowDataArray = smsPage.getRowContentsArray(lastRowBeforeSend++);
		Thread.sleep(sleepTime);
		Assert.assertTrue("Send request data table content mismatched", smsDataValidation.isSendRequestData(rowDataArray));		
	}
	
	@When("^I click on Settings button$")
	public void i_click_on_Settings_button() throws Throwable {
		SandboxSMSPage smsPage = new SandboxSMSPage(driver);
		smsPage.clickSettings();
		Thread.sleep(sleepTime);
	}
	
	@Then("^I should see the page as \"([^\"]*)\"$")
	public void i_should_see_the_page_as(String arg1) throws Throwable {
		SandboxSMSPage smsPage = new SandboxSMSPage(driver);
		Assert.assertTrue("Page header mismatched", smsPage.isSMSPageHeader(arg1));
	}
	
	@When("^I select Delivery Status as \"([^\"]*)\"$")
	public void i_select_Delivery_Status_as(String arg1) throws Throwable {
		SandboxSMSPage smsPage = new SandboxSMSPage(driver);
		smsPage.selectDeliveryStatus(arg1);
		SMSDataValidation smsDataValidation = new SMSDataValidation();
		smsDataValidation.setDeliveryStatus(arg1);
		Thread.sleep(sleepTime);
	}
	
	@When("^I select Notification Delay as \"([^\"]*)\"$")
	public void i_select_Notification_Delay_as(String arg1) throws Throwable {
		SandboxSMSPage smsPage = new SandboxSMSPage(driver);
		smsPage.setNotificationDelay(arg1);
		SMSDataValidation smsDataValidation = new SMSDataValidation();
		smsDataValidation.setNotificationDelay(arg1);
	}
	
	@When("^I select Max Notifications Allowed as \"([^\"]*)\"$")
	public void i_select_Max_Notifications_Allowed_as(String arg1) throws Throwable {
		SandboxSMSPage smsPage = new SandboxSMSPage(driver);
		smsPage.setMaxNotificationAllwed(arg1);
		SMSDataValidation smsDataValidation = new SMSDataValidation();
		smsDataValidation.setMaxNotificationAllowed(arg1);
	}
	
	@When("^I click on SMS parameters Save button$")
	public void i_click_on_SMS_parameters_Save_button() throws Throwable {
		SandboxSMSPage smsPage = new SandboxSMSPage(driver);
		smsPage.clickParamSave();
		Thread.sleep(sleepTime);
	}
	
	@Then("^I validate Delivery Status as \"([^\"]*)\"$")
	public void i_validate_Delivery_Status_as(String arg1) throws Throwable {
		SandboxSMSPage smsPage = new SandboxSMSPage(driver);
		SMSDataValidation smsDataValidation = new SMSDataValidation();
		Thread.sleep(sleepTime);
		Assert.assertTrue("Delivery status mismatched", smsPage.isDeliveryStatus(smsDataValidation.getDeliveryStatus()));
	}
	
	@Then("^I validate Notification Delay as \"([^\"]*)\"$")
	public void i_validate_Notification_Delay_as(String arg1) throws Throwable {
		SandboxSMSPage smsPage = new SandboxSMSPage(driver);
		SMSDataValidation smsDataValidation = new SMSDataValidation();
		Thread.sleep(sleepTime);
		Assert.assertTrue("Notification delay mismatched", smsPage.isNotificationDelay(smsDataValidation.getNotificationDelay()));
	}
	
	@Then("^I validate Max Notifications Allowed as \"([^\"]*)\"$")
	public void i_validate_Max_Notifications_Allowed_as(String arg1) throws Throwable {
		SandboxSMSPage smsPage = new SandboxSMSPage(driver);
		SMSDataValidation smsDataValidation = new SMSDataValidation();
		Assert.assertTrue("Max Notification Allowed mismatched", smsPage.isMaxNotificationAllowed(smsDataValidation.getMaxNotificationAllowed()));
	}
	
	@When("^I set sender Address as \"([^\"]*)\"$")
	public void i_set_sender_Address_as(String arg1) throws Throwable {
		SandboxSMSPage smsPage = new SandboxSMSPage(driver);
		smsPage.SetShortCode(arg1);
	}
	
	@When("^I set notify URL as \"([^\"]*)\"$")
	public void i_set_notify_URL_as(String arg1) throws Throwable {
		SandboxSMSPage smsPage = new SandboxSMSPage(driver);
		smsPage.setNotifyURL(arg1);
		SMSDataValidation smsDataValidation = new SMSDataValidation();
		smsDataValidation.setNotifyURL(arg1);
	}
	
	@When("^I set callback Data as \"([^\"]*)\"$")
	public void i_set_callback_Data_as(String arg1) throws Throwable {
		SandboxSMSPage smsPage = new SandboxSMSPage(driver);
		smsPage.setCallbackData(arg1);
		SMSDataValidation smsDataValidation = new SMSDataValidation();
		smsDataValidation.setCallbackData(arg1);
	}
	
	@When("^I set random criteria$")
	public void i_set_random_criteria() throws Throwable {
		SandboxSMSPage smsPage = new SandboxSMSPage(driver);
		SMSDataValidation smsDataValidation = new SMSDataValidation();
		String randomCriteria = smsDataValidation.generateRandomString(8);
		smsPage.setCriteria(randomCriteria);
		smsDataValidation.setSmsCriteria(randomCriteria);
	}
	
	@When("^I set random clientCorrelator$")
	public void i_set_random_clientCorrelator() throws Throwable {
		SandboxSMSPage smsPage = new SandboxSMSPage(driver);
		DataGenerator dataGen = new DataGenerator();
		String clientCorelator = dataGen.generateRandomNumber(8);
		smsPage.setClientCorrelator(clientCorelator);
		SMSDataValidation smsDataValidation = new SMSDataValidation();
		smsDataValidation.setSmsClientCorrelator(clientCorelator);
	}
	
	@When("^I click on Send request in settings page$")
	public void i_click_on_Send_request_in_settings_page() throws Throwable {
		SandboxSMSPage smsPage = new SandboxSMSPage(driver);
		smsPage.clickNotifyAddButton();
		Thread.sleep(sleepTime);
	}
	
	@Then("^I validate SMS request payload$")
	public void i_validate_SMS_request_payload() throws Throwable {
		Thread.sleep(sleepTime);
		if (config.getValue("browser").equals("FIREFOX")){
			SandboxSMSPage smsPage = new SandboxSMSPage(driver);
			String smsRequestPayload = smsPage.getSmsRequestPayload();
			SMSDataValidation smsDataValidation = new SMSDataValidation();
			Assert.assertTrue("Request payload mismatched", smsDataValidation.isSMSRequestPayload(smsRequestPayload));
		} else {
			Assert.assertTrue("Chomre and IE browsers request payloads is null after loading the page", true);
		}
	}

	@Then("^I validate SMS response payload$")
	public void i_validate_SMS_response_payload() throws Throwable {
		Thread.sleep(sleepTime);
		if (config.getValue("browser").equals("FIREFOX")) {
			SandboxSMSPage smsPage = new SandboxSMSPage(driver);
			String smsResponsePayload = smsPage.getSmsResponsePayload();
			SMSDataValidation smsDataValidation = new SMSDataValidation();
			Assert.assertTrue("Request payload mismatched", smsDataValidation.isSMSResponsePayload(smsResponsePayload));
		} else {
			Assert.assertTrue("Chomre and IE browsers reponse payloads is null after loading the page", true);
		}
	}
	
	@Then("^I validate table contains a row with correct SMS send data$")
	public void i_validate_table_contains_a_row_with_correct_SMS_send_data() throws Throwable {
		SandboxSMSPage smsPage = new SandboxSMSPage(driver);
		Thread.sleep(sleepTime);
		List<String> reponseDataRow = smsPage.getRowResponseContentsArray();
		SMSDataValidation smsDataValidation = new SMSDataValidation();
		Assert.assertTrue("Response data mismatched", smsDataValidation.isSMSResponseData(reponseDataRow));
	}
	
	@When("^I click on retrive SMS$")
	public void i_click_on_retrive_SMS() throws Throwable {
		SandboxSMSPage smsPage = new SandboxSMSPage(driver);
		Thread.sleep(sleepTime);
		smsPage.clickRetriveSMS();
	}
	
	@Then("^I should see the retrive SMS page header as \"([^\"]*)\"$")
	public void i_should_see_the_retrive_SMS_page_header_as(String arg1) throws Throwable {
		SandboxSMSPage smsPage = new SandboxSMSPage(driver);
		Thread.sleep(sleepTime);
		Assert.assertTrue("SMS retrive Page header mismatched", smsPage.isSMSPageHeader(arg1));
	}
	
	@When("^I Select registraionID as \"([^\"]*)\"$")
	public void i_Select_registraionID_as(String arg1) throws Throwable {
		SandboxSMSPage smsPage = new SandboxSMSPage(driver);
		smsPage.selectRegistraionID(arg1);
	}
	
	@When("^I enter max Batch Size as \"([^\"]*)\"$")
	public void i_enter_max_Batch_Size_as(String arg1) throws Throwable {
		SandboxSMSPage smsPage = new SandboxSMSPage(driver);
		smsPage.enterMaxBatchSize(arg1);
	}
	
	@When("^I click on Send Request button for retrive SMS$")
	public void i_click_on_Send_Request_button_for_retrive_SMS() throws Throwable {
		SandboxSMSPage smsPage = new SandboxSMSPage(driver);
		smsPage.clickSMSRetriveRequest();
		Thread.sleep(sleepTime);
	}
	
	@Then("^I validate the SMS retrive response payload$")
	public void i_validate_the_SMS_retrive_response_payload() throws Throwable {
	    //TODO need to write method
		SandboxSMSPage smsPage = new SandboxSMSPage(driver);
		smsPage.getSMSRetrivePayload();
	}

	@Then("^I validate the SMS retrive response table$")
	public void i_validate_the_SMS_retrive_response_table() throws Throwable {
	    //TODO need to write method
		SandboxSMSPage smsPage = new SandboxSMSPage(driver);
		smsPage.getSMSRetriveMessage();
	}
	
	@When("^I click on Delivery Subscriptions link$")
	public void i_click_on_Delivery_Subscriptions_link() throws Throwable {
		SandboxSMSPage smsPage = new SandboxSMSPage(driver);
		smsPage.clickDeliverySubscription();
	}
	
	@Then("^I should see the page delivery subscription page header as \"([^\"]*)\"$")
	public void i_should_see_the_page_delivery_subscription_page_header_as(String arg1) throws Throwable {
		SandboxSMSPage smsPage = new SandboxSMSPage(driver);
		Thread.sleep(sleepTime);
		Assert.assertTrue("Delivery susbcription Page header mismatched", smsPage.isSMSPageHeader(arg1));
	}
	
	@When("^I enter filter criteria as \"([^\"]*)\"$")
	public void i_enter_filter_criteria_as(String arg1) throws Throwable {
		SandboxSMSPage smsPage = new SandboxSMSPage(driver);
		smsPage.enterFilterCriteria(arg1);
	}
	
	@When("^I enter notify URL as \"([^\"]*)\"$")
	public void i_enter_notify_URL_as(String arg1) throws Throwable {
		SandboxSMSPage smsPage = new SandboxSMSPage(driver);
		smsPage.enterSubscriptionNotifyURL(arg1);
	}
	
	@When("^I enter callback data as \"([^\"]*)\"$")
	public void i_enter_callback_data_as(String arg1) throws Throwable {
		SandboxSMSPage smsPage = new SandboxSMSPage(driver);
		smsPage.enterSubscriptionCallback(arg1);
	}
	
	@When("^I enter random client correlator$")
	public void i_enter_random_client_correlator() throws Throwable {
		SandboxSMSPage smsPage = new SandboxSMSPage(driver);
		DataGenerator dataGen = new DataGenerator();
		String clientCorelator = dataGen.generateRandomNumber(8);
		smsPage.enterSubscriptionClietnCorrelator(clientCorelator);
	}
	
	@When("^I click on delivery subscription send request button$")
	public void i_click_on_delivery_subscription_send_request_button() throws Throwable {
		SandboxSMSPage smsPage = new SandboxSMSPage(driver);
		smsPage.clickSubscriptionSendRequest();
	}
	
	@Then("^I validate delivery subscription request payload$")
	public void i_validate_delivery_subscription_request_payload() throws Throwable {
		SandboxSMSPage smsPage = new SandboxSMSPage(driver);
		smsPage.getSmsRequestPayload();
	}
	
	@Then("^I validate delivery subscription response payload$")
	public void i_validate_delivery_subscription_response_payload() throws Throwable {
		SandboxSMSPage smsPage = new SandboxSMSPage(driver);
		smsPage.getSmsResponsePayload();
	}
	
	@Then("^I validate delivery subscription table$")
	public void i_validate_delivery_subscription_table() throws Throwable {
		SandboxSMSPage smsPage = new SandboxSMSPage(driver);
		smsPage.getDeliveryRowTable("clietnCorrelator");
	}

	@When("^I unsubscribe the delivery subscrption$")
	public void i_unsubscribe_the_delivery_subscrption() throws Throwable {
		SandboxSMSPage smsPage = new SandboxSMSPage(driver);
		smsPage.clickDeleteSubscription("");
	}

	@Then("^I should not see the delivery subscribe on the subcription table$")
	public void i_should_not_see_the_delivery_subscribe_on_the_subcription_table() throws Throwable {
		SandboxSMSPage smsPage = new SandboxSMSPage(driver);
		smsPage.isSubscrtionDelete("");
	}

}
