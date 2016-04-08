package com.wso2telco.tests.apimanager.steps.apimanager;

import org.junit.*;

import com.wso2telco.apimanager.pageobjects.apihome.sandbox.SandBoxPage;
import com.wso2telco.tests.apimanager.base.BasicTestObject;
import com.wso2telco.tests.util.data.DataValidation;
import com.wso2telco.tests.util.data.SandBoxValues;
import com.wso2telco.test.framework.tools.data.DataGenerator;

import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;

public class APISandBoxSteps extends BasicTestObject {

	@Then("^I should see the Login in apimanager Sandbox page header as \"([^\"]*)\"$")
	public void i_should_see_the_Login_in_apimanager_Sandbox_page_header_as(String arg1) throws Throwable {
		Thread.sleep(sleepTime);
		for(String winHandle : driver.getWindowHandles()){
		    driver.switchTo().window(winHandle);
		}
		SandBoxPage sandbox = new SandBoxPage(driver);
		Thread.sleep(sleepTime);
	    Assert.assertTrue("Sandbox page did not load properly", sandbox.isSandboxLoginPage(arg1));
	}

	@When("^I enter apimanager Sandbox page username and password for \"([^\"]*)\"$")
	public void i_enter_apimanager_Sandbox_page_username_and_password_for(String arg1) throws Throwable {
		SandBoxPage sandbox = new SandBoxPage(driver);
		sandbox.enterUserName(config.getValue(getEnvironment() + arg1 + "user"));
		Thread.sleep(sleepTime);
		sandbox.enterPassword(config.getValue(getEnvironment() + arg1 + "pwd"));
	}

	
	@When("^I click on apimanager Sandbox page login button$")
	public void i_click_on_apimanager_Sandbox_page_login_button() throws Throwable {
		SandBoxPage sandbox = new SandBoxPage(driver);
		sandbox.clickLogin();
		Thread.sleep(sleepTime);
	}

	@Then("^I should see the apimanager sandbox index page header as \"([^\"]*)\"$")
	public void i_should_see_the_apimanager_sandbox_index_page_header_as(String arg1) throws Throwable {
		SandBoxPage sandbox = new SandBoxPage(driver);
		Thread.sleep(sleepTime);
	    Assert.assertTrue("Sandbox Welcome page did not load properly", sandbox.isSandboxWelcome(arg1));
	}

	@When("^I click on apimanager Sandbox page username$")
	public void i_click_on_apimanager_Sandbox_page_username() throws Throwable {
		SandBoxPage sandbox = new SandBoxPage(driver);
		sandbox.clickUserName();
	}

	@When("^I click on apimanager Sandbox logout button$")
	public void i_click_on_apimanager_Sandbox_logout_button() throws Throwable {
		SandBoxPage sandbox = new SandBoxPage(driver);
		sandbox.clickLogout();
	}

	@When("^I click on numbers dropdown and select manage numbers$")
	public void i_click_on_numbers_dropdown_and_select_manage_numbers() throws Throwable {
		SandBoxPage sandbox = new SandBoxPage(driver);
		sandbox.clickNumbers();
		sandbox.selectManageNumbers();
	}
	
	@Then("^I should see the manage numbers page header as \"([^\"]*)\"$")
	public void i_should_see_the_manage_numbers_page_header_as(String arg1) throws Throwable {
		SandBoxPage sandbox = new SandBoxPage(driver);
		Assert.assertTrue("Sandbox Manage NUmbers page did not load properly", sandbox.isManageNumbers(arg1));
	}
	
	@When("^I clear existing \"([^\"]*)\" from the list$")
	public void i_clear_existing_from_the_list(String arg1) throws Throwable {
		SandBoxPage sandbox = new SandBoxPage(driver);
		sandbox.clearExistingNumber(arg1);
		Thread.sleep(sleepTime);
	}
	
	@When("^I click on add new button in manage numbers page$")
	public void i_click_on_add_new_button_in_manage_numbers_page() throws Throwable {
		SandBoxPage sandbox = new SandBoxPage(driver);
		sandbox.clickOnAddNewNumber();
	}
	
	@When("^I enter \"([^\"]*)\" as number$")
	public void i_enter_as_number(String arg1) throws Throwable {
		SandBoxPage sandbox = new SandBoxPage(driver);
		sandbox.enterNumber(arg1);
	}
	
	@When("^I enter \"([^\"]*)\" as number description$")
	public void i_enter_as_number_description(String arg1) throws Throwable {
		SandBoxPage sandbox = new SandBoxPage(driver);
		sandbox.enterDescription(arg1);
	}

	@When("^I enter \"([^\"]*)\" as balance$")
	public void i_enter_as_balance(String arg1) throws Throwable {
		SandBoxPage sandbox = new SandBoxPage(driver);
		SandBoxValues sandboxValues = new SandBoxValues();
		sandbox.enterBalance(arg1);
		sandboxValues.setBalance(arg1);
	}
	
	@When("^I click on save button in under actions column$")
	public void i_click_on_save_button_in_under_actions_column() throws Throwable {
		SandBoxPage sandbox = new SandBoxPage(driver);
		sandbox.clickSaveNumber();
		Thread.sleep(sleepTime);
	}
	
	@Then("^I should see the \"([^\"]*)\" as added number in the numbers table$")
	public void i_should_see_the_as_added_number_in_the_numbers_table(String arg1) throws Throwable {
		SandBoxPage sandbox = new SandBoxPage(driver);
		Assert.assertTrue("Number did not show properly", sandbox.isNumberAvailable(arg1));
	}
	
	@When("^I click on API dropdown and select payment$")
	public void i_click_on_API_dropdown_and_select_payment() throws Throwable {
		SandBoxPage sandbox = new SandBoxPage(driver);
		sandbox.clickOnApi();
		sandbox.clickOnPayment();
	}
	
	@Then("^I should see payment page header as \"([^\"]*)\"$")
	public void i_should_see_payment_page_header_as(String arg1) throws Throwable {
		SandBoxPage sandbox = new SandBoxPage(driver);
		Assert.assertTrue("Payment parameters page did not load properly", sandbox.isPaymentParameters(arg1));
	}
	
	@When("^I select \"([^\"]*)\" as transaction status$")
	public void i_select_as_transaction_status(String arg1) throws Throwable {
		SandBoxPage sandbox = new SandBoxPage(driver);
		sandbox.selectTransactionStatus(arg1);
	}
	
	@When("^I click save button in payment parameters page$")
	public void i_click_save_button_in_payment_parameters_page() throws Throwable {
		SandBoxPage sandbox = new SandBoxPage(driver);
		sandbox.clickOnSavePaymentParameters();
		Thread.sleep(sleepTime);
	}
	
	@When("^I enter \"([^\"]*)\" as end user id$")
	public void i_enter_as_end_user_id(String arg1) throws Throwable {
		SandBoxPage sandbox = new SandBoxPage(driver);
		String number = "tel:+" + arg1;
		sandbox.enterEndUserId(number);
		SandBoxValues sandboxValues = new SandBoxValues();
		sandboxValues.setSmsUserId(number);
	}
	
	@When("^I select \"([^\"]*)\" as transaction operation status$")
	public void i_select_as_transactio_operation_status(String arg1) throws Throwable {
		SandBoxPage sandbox = new SandBoxPage(driver);
		SandBoxValues sandboxValues = new SandBoxValues();
		sandbox.enterTransactionOperationStatus(arg1);
		sandboxValues.setTransactionOperationStatus(arg1);
	}
	
	@When("^I enter \"([^\"]*)\" as reference code$")
	public void i_enter_as_reference_code(String arg1) throws Throwable {
		SandBoxPage sandbox = new SandBoxPage(driver);
		SandBoxValues sandboxValues = new SandBoxValues();
		sandbox.enterReferenceCode(arg1);
		sandboxValues.setReferenceCode(arg1);
	}
	
	@When("^I enter \"([^\"]*)\" as the request description$")
	public void i_enter_as_the_request_description(String arg1) throws Throwable {
		SandBoxPage sandbox = new SandBoxPage(driver);
		SandBoxValues sandboxValues = new SandBoxValues();
		sandbox.enterRequestDescription(arg1);
		sandboxValues.setRequestDescription(arg1);
	}
	
	@When("^I enter \"([^\"]*)\" as currency$")
	public void i_enter_as_currency(String arg1) throws Throwable {
		SandBoxPage sandbox = new SandBoxPage(driver);
		SandBoxValues sandboxValues = new SandBoxValues();
		sandbox.enterCurrency(arg1);
		sandboxValues.setCurrency(arg1);
	}
	
	@When("^I enter \"([^\"]*)\" as request amount$")
	public void i_enter_as_request_amount(String arg1) throws Throwable {
		SandBoxPage sandbox = new SandBoxPage(driver);
		SandBoxValues sandboxValues = new SandBoxValues();
		sandbox.enterAmount(arg1);
		sandboxValues.setAmount(arg1);
	}
	

	@When("^I enter request client correlator$")
	public void i_enter_as_request_client_correlator() throws Throwable {
		SandBoxPage sandbox = new SandBoxPage(driver);
		SandBoxValues sandboxValues = new SandBoxValues();
		DataGenerator data = new DataGenerator();
		String correlator = data.generateRandomNumber(7);
		sandbox.enterClientCorrelator(correlator);
		sandboxValues.setClientCorrelation(correlator);
	}
	
	@When("^I enter \"([^\"]*)\" as notify URL$")
	public void i_enter_as_notify_URL(String arg1) throws Throwable {
		SandBoxPage sandbox = new SandBoxPage(driver);
		SandBoxValues sandboxValues = new SandBoxValues();
		sandbox.enterNotifyURL(arg1);
		sandboxValues.setNotifyURL(arg1);
	}
	
	@When("^I enter \"([^\"]*)\" as refund notify URL$")
	public void i_enter_as_refund_notify_URL(String arg1) throws Throwable {
		SandBoxPage sandbox = new SandBoxPage(driver);
		sandbox.enterRefundNotifyURL(arg1);
	}
	
	@When("^I enter \"([^\"]*)\" as purchase category code$")
	public void i_enter_as_purchase_category_code(String arg1) throws Throwable {
		SandBoxPage sandbox = new SandBoxPage(driver);
		SandBoxValues sandboxValues = new SandBoxValues();
		sandbox.enterPurchaseCategoryCode(arg1);
		sandboxValues.setPurchaseCategoryCode(arg1);
	}
	
	@When("^I enter \"([^\"]*)\" as channel$")
	public void i_enter_as_channel(String arg1) throws Throwable {
		SandBoxPage sandbox = new SandBoxPage(driver);
		SandBoxValues sandboxValues = new SandBoxValues();
		sandbox.enterChannel(arg1);
		sandboxValues.setChannel(arg1);
	}
	
	@When("^I enter \"([^\"]*)\" as tax amount$")
	public void i_enter_as_tax_amount(String arg1) throws Throwable {
		SandBoxPage sandbox = new SandBoxPage(driver);
		sandbox.enterTaxAmount(arg1);
		SandBoxValues sandboxValues = new SandBoxValues();
		sandboxValues.setTaxAmount(arg1);
	}
	
	@When("^I click on send request button in payment parameters page$")
	public void i_click_on_send_request_button_in_payment_parameters_page() throws Throwable {
		SandBoxPage sandbox = new SandBoxPage(driver);
		sandbox.clickOnSendRequest();
	}
	
	@When("^I get the request payload$")
	public void i_get_the_request_payload() throws Throwable {
		SandBoxPage sandbox = new SandBoxPage(driver);
		SandBoxValues sandboxValues = new SandBoxValues();
		sandboxValues.setRequestPayload(sandbox.getRequestPayloadUI());
	}

	@When("^I get the response payload$")
	public void i_get_the_response_payload() throws Throwable {
		SandBoxPage sandbox = new SandBoxPage(driver);
		SandBoxValues sandboxValues = new SandBoxValues();
		sandboxValues.setResponsePayload(sandbox.getRsponsePayloadUI());
	}
	
	@Then("^I validate the request payload$")
	public void i_validate_the_request_payload() throws Throwable {
		SandBoxValues sandboxValues = new SandBoxValues();
		DataValidation data = new DataValidation();
		String requestPayload = sandboxValues.getRequestPayload();
		Thread.sleep(sleepTime);
		Assert.assertTrue("Request payload data mismatched",data.isRequestPayload(requestPayload));
	}

	@Then("^I validate the response payload$")
	public void i_validate_the_response_payload() throws Throwable {
		SandBoxValues sandboxValues = new SandBoxValues();
		DataValidation data = new DataValidation();
		String responsePayload = sandboxValues.getResponsePayload();
		Thread.sleep(sleepTime);
		Assert.assertTrue("Response payload data mismatched", data.isResponsePayload(responsePayload));
	}
	
	@Then("^I validate the total amount$")
	public void i_validate_the_total_amount() throws Throwable {
		SandBoxValues sandboxValues = new SandBoxValues();
		DataValidation data = new DataValidation();
		String responsePayload = sandboxValues.getResponsePayload();
		Assert.assertTrue("Request payload data mismatched", data.isTotalAmount(responsePayload));
	}

	@When("^I select refund the user menu item$")
	public void i_select_refund_the_user_menu_item() throws Throwable {
		SandBoxPage sandbox = new SandBoxPage(driver);
		sandbox.clickOnRefundUser();
	}
	
	@Then("^I should see refund page header as \"([^\"]*)\"$")
	public void i_should_see_refund_page_header_as(String arg1) throws Throwable {
		SandBoxPage sandbox = new SandBoxPage(driver);
		Assert.assertTrue("Refund the user page did not load properly", sandbox.isRefundUser(arg1));
	}
	
	@When("^I enter \"([^\"]*)\" as call back data$")
	public void i_enter_as_call_back_data(String arg1) throws Throwable {
		SandBoxPage sandbox = new SandBoxPage(driver);
		SandBoxValues values = new SandBoxValues();
		sandbox.enterCallBackData(arg1);
		values.setCallBackData(arg1);
	}
	
	@When("^I enter \"([^\"]*)\" as request code$")
	public void i_enter_as_request_code(String arg1) throws Throwable {
		SandBoxPage sandbox = new SandBoxPage(driver);
		SandBoxValues values = new SandBoxValues();
		sandbox.enterCode(arg1);
		values.setCode(arg1);
	}
	
	@When("^I enter \"([^\"]*)\" as mandateID$")
	public void i_enter_as_mandateID(String arg1) throws Throwable {
		SandBoxPage sandbox = new SandBoxPage(driver);
		SandBoxValues values = new SandBoxValues();
		sandbox.enterMandateId(arg1);
		values.setMandateID(arg1);
	}
	
	@When("^I enter \"([^\"]*)\" as notification format$")
	public void i_enter_as_notification_format(String arg1) throws Throwable {
		SandBoxPage sandbox = new SandBoxPage(driver);
		SandBoxValues values = new SandBoxValues();
		sandbox.enterNotificationFormat(arg1);
		values.setNotificationFormat(arg1);
	}
	
	@When("^I enter \"([^\"]*)\" as on behalf of$")
	public void i_enter_as_on_behalf_of(String arg1) throws Throwable {
		SandBoxPage sandbox = new SandBoxPage(driver);
		SandBoxValues values = new SandBoxValues();
		sandbox.enterOnBehalfOf(arg1);
		values.setOnBehalfOf(arg1);
	}
	
	@Then("^I get the server reference code$")
	public void i_get_the_server_reference_code() throws Throwable {
		SandBoxPage sandbox = new SandBoxPage(driver);
		SandBoxValues values = new SandBoxValues();
		String responsePayload = values.getResponsePayload();
		Thread.sleep(sleepTime);
		String refCode = sandbox.getValueFromJson("serverReferenceCode", responsePayload);
		values.setServerReferenceCode(refCode);
	}
	
	@When("^I enter original server reference code$")
	public void i_enter_original_server_reference_code() throws Throwable {
		SandBoxPage sandbox = new SandBoxPage(driver);
		SandBoxValues values = new SandBoxValues();
		String refCode = values.getServerReferenceCode();
		sandbox.enterServerReferenceCode(refCode);
	}
	
	@When("^I enter \"([^\"]*)\" as product id$")
	public void i_enter_as_product_id(String arg1) throws Throwable {
		SandBoxPage sandbox = new SandBoxPage(driver);
		SandBoxValues values = new SandBoxValues();
		sandbox.enterProductId(arg1);
		values.setProductId(arg1);
	}

	@When("^I enter \"([^\"]*)\" as service id$")
	public void i_enter_as_service_id(String arg1) throws Throwable {
		SandBoxPage sandbox = new SandBoxPage(driver);
		SandBoxValues values = new SandBoxValues();
		sandbox.enterServiceId(arg1);
		values.setServiceId(arg1);
	}

	@When("^I enter \"([^\"]*)\" as max payment amount$")
	public void i_enter_as_max_payment_amount(String arg1) throws Throwable {
		SandBoxPage sandbox = new SandBoxPage(driver);
		sandbox.enterMaxPaymentAmount(arg1);
	}
	
	@When("^I get the refund request payload$")
	public void i_get_the_refund_request_payload() throws Throwable {
		SandBoxPage sandbox = new SandBoxPage(driver);
		SandBoxValues sandboxValues = new SandBoxValues();
		sandboxValues.setRequestPayload(sandbox.getRequestPayloadUI());
	}

	@When("^I get the refund response payload$")
	public void i_get_the_refund_response_payload() throws Throwable {
		SandBoxPage sandbox = new SandBoxPage(driver);
		SandBoxValues sandboxValues = new SandBoxValues();
		sandboxValues.setResponsePayload(sandbox.getRsponsePayloadUI());
	}
	
	@Then("^I validate the refund request payload$")
	public void i_validate_the_refund_request_payload() throws Throwable {
		SandBoxValues sandboxValues = new SandBoxValues();
		DataValidation data = new DataValidation();
		String requestPayload = sandboxValues.getRequestPayload();
		Thread.sleep(sleepTime);
		Assert.assertTrue("Request payload data mismatched",data.isRefundRequestPayload(requestPayload));
	}
	
	@Then("^I validate the refund response payload$")
	public void i_validate_the_refund_response_payload() throws Throwable {
		SandBoxValues sandboxValues = new SandBoxValues();
		DataValidation data = new DataValidation();
		String responsePayload = sandboxValues.getResponsePayload();
		Thread.sleep(sleepTime);
		Assert.assertTrue("Response payload data mismatched",data.isRefundResponsePayload(responsePayload));
	}
	
	@When("^I get the balance of the \"([^\"]*)\"$")
	public void i_get_the_balance_of_the(String arg1) throws Throwable {
	    SandBoxPage sandbox = new SandBoxPage(driver);
	    SandBoxValues sandboxValues = new SandBoxValues();
	    String balance = sandbox.getBalanceofTheNumber(arg1);
	    sandboxValues.setBalance(balance);
	}

	@When("^I enter same client correlator$")
	public void i_enter_same_client_correlator() throws Throwable {
		SandBoxPage sandbox = new SandBoxPage(driver);
	    SandBoxValues sandboxValues = new SandBoxValues();
	    String clientCorrelator = sandboxValues.getClientCorrelation();
	    sandbox.enterClientCorrelator(clientCorrelator);
	}

	@Then("^I validate the balance of the \"([^\"]*)\"$")
	public void i_validate_the_balance_of_the(String arg1) throws Throwable {
		  DataValidation data =  new DataValidation();
		  Assert.assertTrue("Response payload data mismatched",data.isBalance(arg1));
	}
	
	@When("^I get the error response payload$")
	public void i_get_the_error_response_payload() throws Throwable {
		SandBoxPage sandbox = new SandBoxPage(driver);
		SandBoxValues sandboxValues = new SandBoxValues();
		sandboxValues.setResponsePayload(sandbox.getRsponsePayloadUI());
	}
	
	@Then("^I validate the error response payload$")
	public void i_validate_the_error_response_payload() throws Throwable {
		SandBoxValues sandboxValues = new SandBoxValues();
		DataValidation data = new DataValidation();
		String responsePayload = sandboxValues.getResponsePayload();
		Thread.sleep(sleepTime);
		Assert.assertTrue("Response payload data mismatched", data.isErrorResponsePayload(responsePayload));
	}
	
	@Then("^I validate the error response payload containing \"([^\"]*)\"$")
	public void i_validate_the_error_response_payload_containing(String arg1) throws Throwable {
		DataValidation data = new DataValidation();
		Assert.assertTrue("Response payload data mismatched", data.isErrorResponsePayload(arg1));
	}
}
