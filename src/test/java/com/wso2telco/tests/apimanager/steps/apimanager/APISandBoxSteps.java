package com.wso2telco.tests.apimanager.steps.apimanager;

import org.junit.Assert;

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
		Thread.sleep(10000);
	}

	@Then("^I should see the apimanager sandbox index page header as \"([^\"]*)\"$")
	public void i_should_see_the_apimanager_sandbox_index_page_header_as(String arg1) throws Throwable {
		SandBoxPage sandbox = new SandBoxPage(driver);
		Thread.sleep(10000);
	    Assert.assertTrue("Sandbox Welcome page did not load properly", sandbox.isSandboxWelcome(arg1));
	}

	@When("^I click on apimanager Sandbox page$")
	public void i_click_on_apimanager_Sandbox_page() throws Throwable {
		SandBoxPage sandbox = new SandBoxPage(driver);
		sandbox.clickUserName();
	}

	@When("^I click on apimanager Sandbox logout button$")
	public void i_click_on_apimanager_Sandbox_logout_button() throws Throwable {
		SandBoxPage sandbox = new SandBoxPage(driver);
		sandbox.clickLogout();
	}

}
