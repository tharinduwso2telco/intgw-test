package com.wso2telco.tests.apimanager.steps.apimanager;

import org.junit.Assert;

import com.wso2telco.apimanager.pageobjects.apihome.applications.ApplicationsPage;
import com.wso2telco.tests.apimanager.base.BasicTestObject;

import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;

public class APIAplicationSteps extends BasicTestObject {
	
	ApplicationsPage apppage = new ApplicationsPage(driver);
	String randomNumber = apppage.getRandomNumber(3);
	
	@Then("^I should see the apimanager Application page header as \"([^\"]*)\"$")
	public void i_should_see_the_apimanager_Application_page_header_as(String arg1) throws Throwable {
	    ApplicationsPage apppage = new ApplicationsPage(driver);
	    Assert.assertTrue("API manager header did not load", apppage.isApplicationPageHeader(arg1));
	}

	@Then("^I should see the apimanager Application page Add New Application form header as \"([^\"]*)\"$")
	public void i_should_see_the_apimanager_Application_page_Add_New_Application_form_header_as(String arg1) throws Throwable {
	    ApplicationsPage apppage = new ApplicationsPage(driver);
	    Assert.assertTrue("Application Form header mismatched", apppage.isApplicationFormHeader(arg1));
	}

/*	
	@When("^I clear existing \"([^\"]*)\" for \"([^\"]*)\"$")
	public void i_clear_existing_for(String arg1, String arg2) throws Throwable {
		ApplicationsPage apppage = new ApplicationsPage(driver);
		if (apppage.isAppAvailable(arg1, config.getValue(getEnvironment() + arg2 + "user"))) {
			apppage.clickDelete(arg1);
			apppage.clickYes();
		}
		Thread.sleep(sleepTime);
	}
*/
	@Then("^I delete existing \"([^\"]*)\"$")
	public void i_delete_existing(String arg1) throws Throwable {
		ApplicationsPage apppage = new ApplicationsPage(driver);
		if (apppage.isAppAvailable(config.getValue(arg1))) {
			apppage.clickDelete(config.getValue(arg1));
		}
		Thread.sleep(sleepTime);
	}

/*	
	@When("^I enter \"([^\"]*)\" as name \"([^\"]*)\" as Callback URL and \"([^\"]*)\" as Description$")
	public void i_enter_as_Name_as_Callback_URL_and_as_Description(String arg1, String arg2, String arg3) throws Throwable {
		ApplicationsPage apppage = new ApplicationsPage(driver);
		apppage.enterAppllicationName(arg1);
		Thread.sleep(sleepTime);
		apppage.enterAppllicationCallbackUrl(arg2);
		Thread.sleep(sleepTime);
		apppage.enterAppllicationDescription(arg3);
		Thread.sleep(sleepTime);
	}
*/
	@Then("^I enter \"([^\"]*)\" as name and \"([^\"]*)\" as Description$")
	public void i_enter_as_name_and_as_Description(String arg1, String arg2) throws Throwable {
		ApplicationsPage apppage = new ApplicationsPage(driver);
//		if(arg1.isEmpty()){
//			apppage.enterAppllicationName(arg1);
//		}
//		else{
//			String appName = arg1;// + randomNumber;
//
//			config.setValue(arg1, appName);
//		}
		apppage.enterAppllicationName(config.getValue(arg1));
		Thread.sleep(sleepTime);
		apppage.enterAppllicationDescription(arg2);
		Thread.sleep(sleepTime);
	}
	
	@When("^I click on Add button$")
	public void i_click_on_Add_button() throws Throwable {
		ApplicationsPage apppage = new ApplicationsPage(driver);
		apppage.clickApplicationAdd();
		Thread.sleep(sleepTime);
	}
	
/*	@Then("^I should see the added Application name as \"([^\"]*)\" _ \"([^\"]*)\" Tier as \"([^\"]*)\" Status as \"([^\"]*)\" and Description as \"([^\"]*)\"$")
	public void i_should_see_the_added_Application_Name_as___Tier_as_Status_as_and_Description_as(String arg1, String arg2, String arg3, String arg4, String arg5) throws Throwable {
		ApplicationsPage apppage = new ApplicationsPage(driver);
		String username = config.getValue(getEnvironment() + arg1 + "user");
		Assert.assertTrue("Application name mismatched", apppage.isApplicationName(username, arg2));
		Thread.sleep(sleepTime);
		Assert.assertTrue("Application tier mismatched", apppage.isTeirname(username,arg2,arg3));
		Assert.assertTrue("Application status mismatched", apppage.isApplicationStatus(username,arg2,arg4));
		Assert.assertTrue("Application descripion mismatched", apppage.validateDescription(username,arg2,arg5));
	}
*/
	@Then("^I should see the added Application name as \"([^\"]*)\" and the \"([^\"]*)\" as status$")
	public void i_should_see_the_added_Application_name_as_and_the_as_status(String arg1, String arg2) throws Throwable{
		ApplicationsPage apppage = new ApplicationsPage(driver);
		Assert.assertTrue("Application name mismatched", apppage.isApplicationName(config.getValue(arg1)));
		Assert.assertTrue("Application status mismatched", apppage.isApplicationStatus(config.getValue(arg1),arg2));
	}

	@Then("^I should see the Application Name validation failure prompt with \"([^\"]*)\"$")
	public void i_should_see_the_Application_Name_validation_failure_prompt_with(String arg1) throws Throwable {
		ApplicationsPage apppage = new ApplicationsPage(driver);
		Assert.assertTrue(apppage.isApplicationNameEmpty(arg1));
	}
/*	
	@Then("^I should see the confirm delete popup with \"([^\"]*)\"AuXTestAPP\\\"([^\"]*)\"$")
	public void i_should_see_the_confirm_delete_popup_with_AuXTestAPP(String arg1, String arg2) throws Throwable {
		ApplicationsPage apppage = new ApplicationsPage(driver);
		Assert.assertTrue(apppage.isConfirmDeleteMessage(errorMessage));
	}

	@Then("^I click on confirm delete popup Yes button$")
	public void i_click_on_confirm_delete_popup_Yes_button() throws Throwable {
	    // Write code here that turns the phrase above into concrete actions
	    throw new PendingException();
	}
*/
	@Then("^I should see the confirm delete popup with \"([^\"]*)\"$")
	public void i_should_see_the_confirm_delete_popup_with(String arg1) throws Throwable {
		ApplicationsPage apppage = new ApplicationsPage(driver);
		Assert.assertTrue(apppage.isConfirmDeleteMessage(arg1));
	}

	@Then("^I click on confirm delete popup Yes button$")
	public void i_click_on_confirm_delete_popup_Yes_button() throws Throwable {
		ApplicationsPage apppage = new ApplicationsPage(driver);
		apppage.clickYes();
	}
/*  TODO: Need to try this method in more specific way.
	@Then("^I should see the Duplicate Application error pop up with \"([^\"]*)\"\"([^\"]*)\"$")
	public void i_should_see_the_Duplicate_Application_error_pop_up_with(String arg1) throws Throwable {
		ApplicationsPage apppage = new ApplicationsPage(driver);
	    Assert.assertTrue(apppage.isDuplicateApplication(arg1));
	}
*/	
	@Then("^I should see the Duplicate Application error pop up with \"([^\"]*)\"$")
	public void i_should_see_the_Duplicate_Application_error_pop_up_with(String arg1) throws Throwable {
		ApplicationsPage apppage = new ApplicationsPage(driver);
	    Assert.assertTrue(apppage.isDuplicateApplication(arg1));
	}

	@Then("^I click on Duplicate Application error pop up Ok button$")
	public void i_click_on_Duplicate_Application_error_pop_up_Ok_button() throws Throwable {
		ApplicationsPage apppage = new ApplicationsPage(driver);
		apppage.clickOk();
		Thread.sleep(sleepTime);
	}

	@When("^I click on Application List link$")
	public void i_click_on_Application_List_link() throws Throwable {
		ApplicationsPage apppage = new ApplicationsPage(driver);
		apppage.clickApplicationList();
		Thread.sleep(sleepTime);
	}
	
	@When("^I enter \"([^\"]*)\" in search field$")
	public void i_enter_in_search_field(String arg1) throws Throwable {
		ApplicationsPage apppage = new ApplicationsPage(driver);
		apppage.enterSearchKey(config.getValue(arg1));
		Thread.sleep(sleepTime);
	}

	@Then("^I should see there is no editable field for \"([^\"]*)\"$")
	public void i_should_see_there_is_no_editable_field_for(String arg1) throws Throwable {
		ApplicationsPage apppage = new ApplicationsPage(driver);
		apppage.isAppAvailable(config.getValue(arg1));
		apppage.isAppEditable(config.getValue(arg1));
	}
		
	@When("^I click on apimanager Application \"([^\"]*)\"$")
	public void i_click_on_apimanager_Application(String arg1) throws Throwable {
		ApplicationsPage apppage = new ApplicationsPage(driver);
		apppage.isAppAvailable(config.getValue(arg1));
		apppage.clickAppName(config.getValue(arg1));
	}
	
	@Then("^I should see \"([^\"]*)\" Subscription for \"([^\"]*)\"$")
	public void i_should_see_Subscription_for(String arg1, String arg2) throws Throwable {
		ApplicationsPage apppage = new ApplicationsPage(driver);
		apppage.isNumOfSubscriptions(config.getValue(arg2));
	}
	
	@When("^I click Production Keys tab$")
	public void i_click_Production_Keys_tab() throws Throwable {
		ApplicationsPage apppage = new ApplicationsPage(driver);
		apppage.clickTabProductionKeys();
	}

	@Then("^I should see the Application \"([^\"]*)\" workflow status as \"([^\"]*)\" and Tier as \"([^\"]*)\"$")
	public void i_should_see_the_Application_workflow_status_as_and_Tier_as(String arg1, String arg2, String arg3) throws Throwable {
		ApplicationsPage apppage = new ApplicationsPage(driver);
		apppage.validateWorkflowStatus(config.getValue(arg1), arg2);
		apppage.validateApplicationTier(config.getValue(arg1), arg3);
	}
}
