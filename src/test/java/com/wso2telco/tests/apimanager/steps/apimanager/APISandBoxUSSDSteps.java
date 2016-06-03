package com.wso2telco.tests.apimanager.steps.apimanager;

import java.util.List;

import org.junit.Assert;

import com.wso2telco.apimanager.pageobjects.apihome.sandbox.SandBoxUSSDPage;
import com.wso2telco.tests.apimanager.base.BasicTestObject;
import com.wso2telco.tests.util.data.UssdDataValidation;

import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;

public class APISandBoxUSSDSteps extends BasicTestObject {

	@Then("^I should see the USSD parameter page as \"([^\"]*)\"$")
	public void i_should_see_the_USSD_parameter_page_as(String arg1)throws Throwable{
		SandBoxUSSDPage sandboxUssd = new SandBoxUSSDPage(driver);
		Assert.assertTrue("Sandbox USSD page did not load properly",sandboxUssd.isUssdParameters(arg1));
	}
	
	@When("^I enter USSD parameter page address \"([^\"]*)\"$")
	public void i_enter_USSD_parameter_page_address(String arg1) throws Throwable {
		SandBoxUSSDPage sandboxUssd = new SandBoxUSSDPage(driver);
		sandboxUssd.enterAdress(arg1);
		UssdDataValidation ussdDataValidation = new UssdDataValidation();
		ussdDataValidation.setAddress(arg1);
	}
	
	@When("^I enter USSD parameter page shortcode \"([^\"]*)\"$")
	public void i_enter_USSD_parameter_page_shortcode(String arg1) throws Throwable {
		SandBoxUSSDPage sandboxUssd = new SandBoxUSSDPage(driver);
		sandboxUssd.enterShortCode(arg1);
		UssdDataValidation ussdDataValidation = new UssdDataValidation();
		ussdDataValidation.setShortCode(arg1);
	}
	
	@When("^I enter USSD parameter page outboundUSSDMessage \"([^\"]*)\"$")
	public void i_enter_USSD_parameter_page_outboundUSSDMessage(String arg1) throws Throwable {
		SandBoxUSSDPage sandboxUssd = new SandBoxUSSDPage(driver);
		sandboxUssd.enterOutBoudMsg(arg1);
		UssdDataValidation ussdDataValidation = new UssdDataValidation();
		ussdDataValidation.setOutboundUSSDMessage(arg1);
	    
	}
	
	@When("^I enter USSD parameter page clientCorrelator \"([^\"]*)\"$")
	public void i_enter_USSD_parameter_page_clientCorrelator(String arg1) throws Throwable {
		SandBoxUSSDPage sandboxUssd = new SandBoxUSSDPage(driver);
		sandboxUssd.enterCorrelator(arg1);
		UssdDataValidation ussdDataValidation = new UssdDataValidation();
		ussdDataValidation.setClientCorrelator(arg1);
	}
	
	@When("^I enter USSD parameter page callbackData \"([^\"]*)\"$")
	public void i_enter_USSD_parameter_page_callbackData(String arg1) throws Throwable {
		SandBoxUSSDPage sandboxUssd = new SandBoxUSSDPage(driver);
		sandboxUssd.enterCallBackData(arg1); 
		UssdDataValidation ussdDataValidation = new UssdDataValidation();
		ussdDataValidation.setCallbackData(arg1);
	}
	
	@When("^I enter USSD parameter page notifyURL \"([^\"]*)\"$")
	public void i_enter_USSD_parameter_page_notifyURL(String arg1) throws Throwable {
		SandBoxUSSDPage sandboxUssd = new SandBoxUSSDPage(driver);
	    sandboxUssd.enterNotifyUrl(arg1);
		UssdDataValidation ussdDataValidation = new UssdDataValidation();
		ussdDataValidation.setNotifyURL(arg1);
	    
	}
	
	@When("^I enter USSD parameter page keyword \"([^\"]*)\"$")
	public void i_enter_USSD_parameter_page_keyword(String arg1) throws Throwable {
		SandBoxUSSDPage sandboxUssd = new SandBoxUSSDPage(driver);
	    sandboxUssd.enterKeyWord(arg1);
		UssdDataValidation ussdDataValidation = new UssdDataValidation();
		ussdDataValidation.setKeyword(arg1);
	    
	}
	
	@When("^I enter USSD parameter page ussdAction \"([^\"]*)\"$")
	public void i_enter_USSD_parameter_page_ussdAction(String arg1) throws Throwable {
		SandBoxUSSDPage sandboxUssd = new SandBoxUSSDPage(driver);
	    sandboxUssd.clickussdAction(arg1);
		UssdDataValidation ussdDataValidation = new UssdDataValidation();
		ussdDataValidation.setUssdAction(arg1);
	    
	}
	
	@When("^I click USSD parameter page send request button$")
	public void i_click_USSD_parameter_page_send_request_button() throws Throwable {
		SandBoxUSSDPage sandboxUssd = new SandBoxUSSDPage(driver);
	    sandboxUssd.clickSendrequest();
	}
	
	@Then("^I validate the request payload for USSD api$")
	public void i_validate_the_request_payload_for_USSD_api() throws Throwable {
		SandBoxUSSDPage ussdPage = new SandBoxUSSDPage(driver);
	    String USSDRequestPayload = ussdPage.getUSSDRequest();
	    UssdDataValidation UssdDataValidation = new UssdDataValidation();
	    Thread.sleep(sleepTime);
	    Assert.assertTrue("Ussd request payload mismatch", UssdDataValidation.isUssdRequestPayload(USSDRequestPayload));
	}
	
	@Then("^I validate the response payload for USSD api$")
	public void i_validate_the_response_payload_for_USSD_api() throws Throwable {
		SandBoxUSSDPage ussdPage = new SandBoxUSSDPage(driver);
	    String USSDResponsePayload = ussdPage.getUSSDResponse();
	    UssdDataValidation UssdDataValidation = new UssdDataValidation();
	    Thread.sleep(sleepTime);
	    Assert.assertTrue("Ussd response payload mismatch", UssdDataValidation.isUssdResponsePayload(USSDResponsePayload));
	}
	

	@Then("^I validate table contains a row with correct USSD send data$")
	public void i_validate_table_contains_a_row_with_correct_USSD_send_data() throws Throwable {
		SandBoxUSSDPage ussdPage = new SandBoxUSSDPage(driver);
		Thread.sleep(sleepTime);
		List<String> reponseDataRow = ussdPage.getRowResponseContentsArray();
		UssdDataValidation UssdDataValidation = new UssdDataValidation();
		Assert.assertTrue("Response data mismatched", UssdDataValidation.isUSSDResponseData(reponseDataRow));
	}

}
