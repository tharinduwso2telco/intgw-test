package com.wso2telco.tests.apimanager.steps.idserver;

import org.junit.Assert;

import com.wso2telco.identityserver.pageobjects.carbon.CarbonHomePage;
import com.wso2telco.identityserver.pageobjects.carbon.CarbonLoginPage;
import com.wso2telco.identityserver.pageobjects.carbon.CarbonUserRoles;
import com.wso2telco.tests.apimanager.base.BasicTestObject;

import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;

public class IDServerHome extends BasicTestObject {
	
	@Given("^I am in ids page$")
	public void i_am_in_ids_page() throws Throwable {
		if (driver==null){
			initialize();
			launchBrowser();
			driver.get(config.getValue(getEnvironment() + "CarbonSiteName"));
		}
	}

	@When("^I enter ids username credentials$")
	public void i_enter_ids_username_credentials() throws Throwable {
		CarbonLoginPage carbonLogin = new CarbonLoginPage(driver);
		carbonLogin.setCarbonUsername(config.getValue(getEnvironment() + "AdminUserName"));
		carbonLogin.setCarbonPassword(config.getValue(getEnvironment() + "AdminPassword"));
	}

	@When("^I click on ids sign in$")
	public void i_click_on_ids_sign_in() throws Throwable {
		CarbonLoginPage carbonLogin = new CarbonLoginPage(driver);
		carbonLogin.clickCarbonLogin();
	}

	@Then("^I should see the ids Home page header as \"([^\"]*)\"$")
	public void i_should_see_the_ids_Home_page_header_as(String arg1) throws Throwable {
		CarbonHomePage carbonHome = new CarbonHomePage(driver);
		Assert.assertTrue("Home page did not load properly", carbonHome.isIDSHomeDisplayed(arg1));
	}

	@When("^I click on ids Configuration tab$")
	public void i_click_on_ids_Configuration_tab() throws Throwable {
		CarbonHomePage carbonHome = new CarbonHomePage(driver);
		carbonHome.clickConfigure();
	}

	@Then("^I should see ids Configuration menu with first item as \"([^\"]*)\"$")
	public void i_should_see_ids_Configuration_menu_with_first_item_as(String arg1) throws Throwable {
		CarbonUserRoles carbonUserRolePage = new CarbonUserRoles(driver);
		Assert.assertTrue("Configuration tab did not load properly", carbonUserRolePage.isConfigurePage(arg1));
	}

	@When("^I click on ids Configuration Users and Roles link$")
	public void i_click_on_ids_Configuration_Users_and_Roles_link() throws Throwable {
		CarbonUserRoles carbonUserRolePage = new CarbonUserRoles(driver);
		carbonUserRolePage.clickUserRoles();
	}

	@When("^I click on ids Main tab$")
	public void i_click_on_ids_Main_tab() throws Throwable {
		CarbonHomePage carbonHome = new CarbonHomePage(driver);
		carbonHome.clickMain();
	}
	
	@Then("^I should see ids Main menu \"([^\"]*)\" as the first item$")
	public void i_should_see_ids_Main_menu_as_the_first_item(String arg1) throws Throwable {
		CarbonHomePage carbonHome = new CarbonHomePage(driver);
		Assert.assertTrue("Main menu did not load properly",carbonHome.isMenuListDisplayed(arg1));
	}
	
	@When("^I click on ids Main List link$")
	public void i_click_on_ids_Main_List_link() throws Throwable {
		CarbonHomePage carbonHome = new CarbonHomePage(driver);
		carbonHome.clickList();
	}
	       
	   }

