package com.wso2telco.tests.apimanager.steps.apimanager;



import org.junit.*;


import com.wso2telco.apimanager.pageobjects.apihome.sandbox.SandBoxPage;
import com.wso2telco.tests.apimanager.base.BasicTestObject;

import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;

public class APISandBoxSteps extends BasicTestObject {

	@Then("^I should see the Login in apimanager Sandbox page header as \"([^\"]*)\"$")
	public void i_should_see_the_Login_in_apimanager_Sandbox_page_header_as(String arg1) throws Throwable {
		for(String winHandle : driver.getWindowHandles()){
		    driver.switchTo().window(winHandle);
		}
		SandBoxPage sandbox = new SandBoxPage(driver);
	    Assert.assertTrue("Sandbox page did not load properly", sandbox.isSandboxLoginPage(arg1));
	}

	@When("^I enter apimanager Sandbox page username and password for \"([^\"]*)\"$")
	public void i_enter_apimanager_Sandbox_page_username_and_password_for(String arg1) throws Throwable {
		SandBoxPage sandbox = new SandBoxPage(driver);
		sandbox.enterUserName(config.getValue(getEnvironment() + arg1 + "user"));
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
		sandbox.enterBalance(arg1);
	}
	
	@When("^I click on save button in under actions column$")
	public void i_click_on_save_button_in_under_actions_column() throws Throwable {
	    
	}
}
