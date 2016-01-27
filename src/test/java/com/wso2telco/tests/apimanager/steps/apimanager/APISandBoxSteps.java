package com.wso2telco.tests.apimanager.steps.apimanager;

import org.junit.Assert;

import com.wso2telco.apimanager.pageobjects.apihome.sandbox.SandBoxPage;
import com.wso2telco.tests.apimanager.base.BasicTestObject;

import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;

public class APISandBoxSteps extends BasicTestObject {

	@Then("^I should see the Login in apimanager Sandbox page$")
	public void i_should_see_the_Login_in_apimanager_Sandbox_page() throws Throwable {
		for(String winHandle : driver.getWindowHandles()){
		    driver.switchTo().window(winHandle);
		}
		SandBoxPage sandbox = new SandBoxPage(driver);
	    Assert.assertTrue("Sandbox page did not load properly", sandbox.validateLoginPage());
	}

	@When("^I enter apimanager Sandbox page \"([^\"]*)\" as user name and \"([^\"]*)\" as password$")
	public void i_enter_apimanager_Sandbox_page_as_user_name_and_as_password(String arg1, String arg2) throws Throwable {
		SandBoxPage sandbox = new SandBoxPage(driver);
		sandbox.enterUserName(arg1);
		sandbox.enterPassword(arg2);
	}

	@When("^I click on apimanager Sandbox page login button$")
	public void i_click_on_apimanager_Sandbox_page_login_button() throws Throwable {
		SandBoxPage sandbox = new SandBoxPage(driver);
		sandbox.clickLogin();
		Thread.sleep(10000);
	}

	@Then("^I should see the apimanager sandbox index page$")
	public void I_should_see_the_apimanager_sandbox_index_page() throws Throwable {
		SandBoxPage sandbox = new SandBoxPage(driver);
		Thread.sleep(10000);
	    Assert.assertTrue("Sandbox Welcome page did not load properly", sandbox.validateWelcome());
	}

	@When("^I click on apimanager Sandbox page \"([^\"]*)\"$")
	public void i_click_on_apimanager_Sandbox_page(String arg1) throws Throwable {
		SandBoxPage sandbox = new SandBoxPage(driver);
		sandbox.clickUserName();
	}

	@When("^I click on apimanager Sandbox logout button$")
	public void i_click_on_apimanager_Sandbox_logout_button() throws Throwable {
		SandBoxPage sandbox = new SandBoxPage(driver);
		sandbox.clickLogout();
	}

}
