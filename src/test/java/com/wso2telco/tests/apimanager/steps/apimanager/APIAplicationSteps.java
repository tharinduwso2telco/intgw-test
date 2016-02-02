package com.wso2telco.tests.apimanager.steps.apimanager;

import org.junit.Assert;

import com.wso2telco.apimanager.pageobjects.apihome.applications.ApplicationsPage;
import com.wso2telco.tests.apimanager.base.BasicTestObject;

import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;

public class APIAplicationSteps extends BasicTestObject {
	
	@Then("^I should see the apimanager Application page header as \"([^\"]*)\"$")
	public void i_should_see_the_apimanager_Application_page_header_as(String arg1) throws Throwable {
	    ApplicationsPage apppage = new ApplicationsPage(driver);
	    apppage.isApplicationPageHeader(arg1);
	}

	@Then("^I should see the apimanager Application page Add New Application form header as \"([^\"]*)\"$")
	public void i_should_see_the_apimanager_Application_page_Add_New_Application_form_header_as(String arg1) throws Throwable {
	    ApplicationsPage apppage = new ApplicationsPage(driver);
	    Assert.assertTrue("Application Form header mismatched", apppage.isApplicationFormHeader(arg1));
	}

	
	@When("^I clear existing \"([^\"]*)\" for \"([^\"]*)\"$")
	public void i_clear_existing_for(String arg1, String arg2) throws Throwable {
		ApplicationsPage apppage = new ApplicationsPage(driver);
		if (apppage.isAppAvailable(arg1, config.getValue(getEnvironment() + arg2 + "user"))) {
			apppage.clickDelete(arg1);
			apppage.clickYes();
		}
		Thread.sleep(10000);
	}
	
	@When("^I enter \"([^\"]*)\" as Name \"([^\"]*)\" as Callback URL and \"([^\"]*)\" as Description$")
	public void i_enter_as_Name_as_Callback_URL_and_as_Description(String arg1, String arg2, String arg3) throws Throwable {
		ApplicationsPage apppage = new ApplicationsPage(driver);
		apppage.enterAppllicationName(arg1);
		Thread.sleep(5000);
		apppage.enterAppllicationCallbackUrl(arg2);
		Thread.sleep(5000);
		apppage.enterAppllicationDescription(arg3);
		Thread.sleep(5000);
	}
	
	@When("^I click on Add button$")
	public void i_click_on_Add_button() throws Throwable {
		ApplicationsPage apppage = new ApplicationsPage(driver);
		apppage.clickApplicationAdd();
		Thread.sleep(5000);
	}
	
	@Then("^I should see the added Application Name as \"([^\"]*)\" _ \"([^\"]*)\" Tier as \"([^\"]*)\" Status as \"([^\"]*)\" and Description as \"([^\"]*)\"$")
	public void i_should_see_the_added_Application_Name_as___Tier_as_Status_as_and_Description_as(String arg1, String arg2, String arg3, String arg4, String arg5) throws Throwable {
		ApplicationsPage apppage = new ApplicationsPage(driver);
		Assert.assertTrue("Application name mismatched", apppage.isApplicationName(arg1, arg2));
		Thread.sleep(5000);
		Assert.assertTrue("Application tier mismatched", apppage.isTeirname(arg3));
		Assert.assertTrue("Application status mismatched", apppage.isApplicationStatus(arg4));
		Assert.assertTrue("Application descripion mismatched", apppage.validateDescription(arg5));
	}

	@Then("^I should see the added Application Name as \"([^\"]*)\" _ \"([^\"]*)\" and the \"([^\"]*)\" as status$")
	public void i_should_see_the_added_Application_Name_as___and_the_as_status(String arg1, String arg2, String arg3) throws Throwable {
		ApplicationsPage apppage = new ApplicationsPage(driver);
		Assert.assertTrue("Application name mismatched", apppage.isApplicationName(arg1, arg2));
		Assert.assertTrue("Application status mismatched", apppage.isApplicationStatus(arg3));
	}

}
