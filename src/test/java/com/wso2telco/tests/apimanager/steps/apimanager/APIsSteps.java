package com.wso2telco.tests.apimanager.steps.apimanager;

import org.junit.Assert;

import com.wso2telco.apimanager.pageobjects.apihome.apis.APIsPage;
import com.wso2telco.tests.apimanager.base.BasicTestObject;

import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;

public class APIsSteps extends BasicTestObject {

	@Then("^I should see the apimanager APIs page header as \"([^\"]*)\"$")
	public void i_should_see_the_apimanager_APIs_page_header_as(String arg1) throws Throwable {
	    APIsPage apispage = new APIsPage(driver);
	    Thread.sleep(sleepTime);
	    Assert.assertTrue("API page header did not load", apispage.isAPIPage(arg1));
	}
	
	@Then("^I should see the created API on the page as \"([^\"]*)\"$")
	public void i_should_see_the_created_API_on_the_page_as(String arg1) throws Throwable {
		APIsPage apispage = new APIsPage(driver);
		Assert.assertTrue("Created API is not visible", apispage.isCreatedAPIOnAPIPage(arg1));
	}
	
	@Then("^I should see apimanager \"([^\"]*)\" api from the left pane$")
	public void i_should_see_apimanager_api_from_the_left_pane(String arg1) throws Throwable {
		APIsPage apispage = new APIsPage(driver);
		Assert.assertTrue("API is not properly created", apispage.isCreatedAPI(arg1));
	}
/*	
	@When("^I click on the apimanager \"([^\"]*)\" api$")
	public void i_click_on_the_apimanager_api(String arg1) throws Throwable {
		APIsPage apispage = new APIsPage(driver);
		apispage.clickCreatedAPI(arg1);
	}
*/	
	@When("^I click on the apimanager \"([^\"]*)\" \"([^\"]*)\" api$")
	public void i_click_on_the_apimanager_api(String arg1, String arg2) throws Throwable {
		APIsPage apispage = new APIsPage(driver);
		apispage.clickCreatedAPI(config.getValue(arg1), arg2);
		config.setValue(arg1+arg2,config.getValue(arg1)+" - "+arg2);
		System.out.println(config.getValue(arg1+arg2));
	}


	@Then("^I should see the apimanager APIs \"([^\"]*)\" status as \"([^\"]*)\"$")
	public void i_should_see_the_apimanager_APIs_status_as(String arg1, String arg2) throws Throwable {
		APIsPage apispage = new APIsPage(driver);
		Assert.assertTrue("API status is not published", apispage.isAPIStatus(arg2));
	}
	
	@When("^I click on Applications dropdown$")
	public void i_click_on_Applications_dropdown() throws Throwable {
		APIsPage apiPage = new APIsPage(driver);
		apiPage.clickApplicationDropDown();
	}
	
	@Then("^I should not see \"([^\"]*)\" Application$")
	public void i_should_not_see_Application(String arg1) throws Throwable {
		APIsPage apiPage = new APIsPage(driver);
		Assert.assertTrue("Application name is on the drop down", apiPage.isApplicationNameNotVisible(arg1));
	}
	
	@Then("^I should see \"([^\"]*)\" Application for \"([^\"]*)\"$")
	public void i_should_see_Application_for(String arg1, String arg2) throws Throwable {
		APIsPage apiPage = new APIsPage(driver);
		String appName = config.getValue(arg1);
		Assert.assertTrue("Application name is not on the drop down", apiPage.isApplicationNameVisible(appName));
		Thread.sleep(sleepTime);
	}
	

	@When("^I select \"([^\"]*)\" for \"([^\"]*)\"$")
	public void i_select_for(String arg1, String arg2) throws Throwable {
		APIsPage apiPage = new APIsPage(driver);
		String appName = config.getValue(arg1);
		Thread.sleep(sleepTime);
		apiPage.clickAppName(appName);
		Thread.sleep(sleepTime);
	}
	
	@When("^I select operator as \"([^\"]*)\"$")
	public void i_select_operator_as(String arg1) throws Throwable {
		APIsPage apiPage = new APIsPage(driver);
		Thread.sleep(sleepTime);
		apiPage.clickOperator(arg1);
	}

	@When("^I click apimanager \"([^\"]*)\" API page subscribe button$")
	public void i_click_apimanager_API_page_subscribe_button(String arg1) throws Throwable {
		APIsPage apiPage = new APIsPage(driver);
		Thread.sleep(sleepTime);
		apiPage.clickSubscribe();
	}

	@Then("^I should see \"([^\"]*)\" on Subscription Successful pop up$")
	public void i_should_see_on_Subscription_Successful_pop_up(String arg1) throws Throwable {
		APIsPage apiPage = new APIsPage(driver);
		Thread.sleep(sleepTime);
		Assert.assertTrue("Subscription success popup is not loaded", apiPage.isSubscriptionSuccessPopup(arg1));
	}

	@When("^I click Go to My Subscription button$")
	public void i_click_Go_to_My_Subscription_button() throws Throwable {
		APIsPage apiPage = new APIsPage(driver);
		apiPage.clickGoToSubscriber();
	}
	
	@Then("^I should search apimanager API \"([^\"]*)\"$")
	public void i_should_search_apimanager_API(String arg1) throws Throwable {
		APIsPage apiPage = new APIsPage(driver);
		apiPage.enterAPINameSearch(config.getValue(arg1));
		Thread.sleep(1000);
		apiPage.clickSearch();
	}

	@When("^I click on Stay on this page button$")
	public void i_click_on_Stay_on_this_page_button() throws Throwable {
		APIsPage apiPage = new APIsPage(driver);
		apiPage.clickStayOnThisPage();
	}
}
