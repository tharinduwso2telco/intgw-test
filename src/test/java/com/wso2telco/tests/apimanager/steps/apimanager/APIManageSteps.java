package com.wso2telco.tests.apimanager.steps.apimanager;

import org.junit.Assert;

import com.wso2telco.apimanager.pageobjects.apihome.manager.ManagerPage;
import com.wso2telco.tests.apimanager.base.BasicTestObject;

import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;

public class APIManageSteps extends BasicTestObject {
	
	String winHandleBefore = driver.getWindowHandle();

	@Then("^I should see the apimanager Manager page header as \"([^\"]*)\"$")
	public void i_should_see_the_apimanager_Manager_page_header_as(String arg1) throws Throwable {
		for(String winHandle : driver.getWindowHandles()){
		    driver.switchTo().window(winHandle);
		}
		ManagerPage managerpage = new ManagerPage(driver);
		Assert.assertTrue("Manager page did not load properly", managerpage.isManagerPage(arg1));
	}

	@When("^I enter apimanager Manager page \"([^\"]*)\" as user name and \"([^\"]*)\" as password$")
	public void i_enter_apimanager_Manager_page_as_user_name_and_as_password(String arg1, String arg2) throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		managerpage.enterUserName(arg1);
		managerpage.enterPassword(arg2);
	 }
	
	@When("^I enter apimanager Manager page admin username credentials$")
	public void i_enter_apimanager_Manager_page_admin_username_credentials() throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		managerpage.enterUserName(config.getValue("adminUserName"));
		managerpage.enterPassword(config.getValue("adminPassword"));
	}
	
	@When("^I enter apimanager Manager page operator username credentials$")
	public void i_enter_apimanager_Manager_page_operator_username_credentials() throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		managerpage.enterUserName(config.getValue("operatorUserName"));
		managerpage.enterPassword(config.getValue("operatorPassword"));
	}

	@When("^I click on apimanager Manager page login button$")
	public void i_click_on_apimanager_Manager_page_login_button() throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		managerpage.clickLogin();
	}

	@Then("^I should see the apimanager Manager Home page header as \"([^\"]*)\"$")
	public void i_should_see_the_apimanager_Manager_Home_page_header_as(String arg1) throws Throwable {
		  ManagerPage managerpage = new ManagerPage(driver);
		  Assert.assertTrue("Manager Home page did not load properly", managerpage.isHomePage(arg1));
	}
	
	@When("^I click on apimanager Manager \"([^\"]*)\"$")
	public void i_click_on_apimanager_Manager(String arg1) throws Throwable {
		 ManagerPage managerpage = new ManagerPage(driver);
		 managerpage.clickUserName();
	}

	@When("^I click on apimanager Manager logout button$")
	public void i_click_on_apimanager_Manager_logout_button() throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		managerpage.clickLogout();
	}
	
	@When("^I click on apimanager Manager admin$")
	public void i_click_on_apimanager_Manager_admin() throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		managerpage.clickLogout();
	}
	
	@When("^I click on apimanager Manager dialogAdmin$")
	public void i_click_on_apimanager_Manager_dialogAdmin() throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		managerpage.clickLogout();
	}

	@When("^I click on close window$")
	public void i_click_on_close_window() throws Throwable {
		driver.close();
		driver.switchTo().window(winHandleBefore);
	}
	
	@Then("^I should see apimanager Manager Home and Billing tabs$")
	public void I_should_see_apimanager_Manager_Home_and_Billing_tabs() throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		Assert.assertTrue("System provide access to black list white list", managerpage.isManagerTwoTabsAccess());
	}
	
	@When("^I close the browser and reopen the browsers and navigate to apimanager page$")
	public void i_close_the_browser_and_reopen_the_browsers_and_navigate_to_apimanager_page() throws Throwable {
		driver.close();
		launchBrowser();
		driver.get(config.getValue("apiManagerSiteName"));
	}

	@Then("^I should see apimanager Manager Home Billing Workflow Blacklist Whitelist tabs$")
	public void i_should_see_apimanager_Manager_Home_Billing_Workflow_Blacklist_Whitelist_tabs() throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		Assert.assertTrue("All the tabs are not visible", managerpage.isAllTabsAccessible());
	}
	
	@Then("^I should see apimanager Manager Home Billing Workflow$")
	public void i_should_see_apimanager_Manager_Home_Billing_Workflow() throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		Assert.assertTrue("3 Tabs are not visible", managerpage.isThreeTabs());
	}
	
	@When("^I click on apimanager Manager page Workflow tab$")
	public void i_click_on_apimanager_Manager_page_Workflow_tab() throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		managerpage.clickWorkflow();
	}
	
	@Then("^I should see apimanager Manager Approval Tasks page$")
	public void i_should_see_apimanager_Manager_Approval_Tasks_page() throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		Assert.assertTrue("Application creation link is not visible", managerpage.isApllicationCreation());
	}
	
	@When("^I click on Application creation link$")
	public void i_click_on_Application_creation_link() throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		managerpage.clickApplicationCration();
	}
	
	@Then("^I should see created application \"([^\"]*)\" at the top of the Approval Tasks table$")
	public void i_should_see_created_application_at_the_top_of_the_Approval_Tasks_table(String arg1) throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		Assert.assertTrue("App name is not visible in the area", managerpage.isApplicationNameVisible(arg1));
	}
	
	@When("^I click on Application Details drop box for \"([^\"]*)\" row$")
	public void i_click_on_Application_Details_drop_box_for_row(String arg1) throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		managerpage.clickApplicationDetails(arg1);
	}
	
	@When("^I select \"([^\"]*)\" for \"([^\"]*)\" Application Details row$")
	public void i_select_for_Application_Details_row(String arg1, String arg2) throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		managerpage.selectTier(arg1, arg2);
	}
	
	@When("^I click Assign To Me button for \"([^\"]*)\" Application Details row$")
	public void i_click_Assign_To_Me_button_for_Application_Details_row(String arg1) throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		managerpage.clickAssignMe(arg1);
	}
	
	@When("^I click on Start button for \"([^\"]*)\" Application Details row$")
	public void i_click_on_Start_button_for_Application_Details_row(String arg1) throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		managerpage.clickStart(arg1);
	}
	
	@When("^I select \"([^\"]*)\" and click complete button for \"([^\"]*)\" Application Details row$")
	public void i_select_and_click_complete_button_for_Application_Details_row(String arg1, String arg2) throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		managerpage.selectCondition(arg1, arg2);
		managerpage.clickComplete(arg2);
	}
	
	@When("^I enter aprrove/reject reason as \"([^\"]*)\"$")
	public void i_enter_aprrove_reject_reason_as(String arg1) throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		managerpage.enterApproveRejectReason(arg1);
	}
	
	@When("^click aprrove/reject reason ok button$")
	public void click_aprrove_reject_reason_ok_button() throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		managerpage.clickApproveOK();
	}
	
	@Then("^I should not see the created application in Approval Tasks table as \"([^\"]*)\"$")
	public void i_should_not_see_the_created_application_in_Approval_Tasks_table_as(String arg1) throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		Assert.assertTrue("App name is visible after approving", managerpage.isApplicationNameNotVisible(arg1));
	}
	
	@When("^I click on subscriptions creation under tasks$")
	public void i_click_on_subscriptions_creation_under_tasks() throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		managerpage.clickSubCreation();
	}
	
	@Then("^I should see apimanager Manager Approval Tasks page header as \"([^\"]*)\"$")
	public void i_should_see_apimanager_Manager_Approval_Tasks_page_header_as(String arg1) throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		Assert.assertTrue(managerpage.isApprovalTaskDisplayed(arg1));
	}
	
	@Then("^I should see Enter aprrove/reject reasons pop up header as \"([^\"]*)\"$")
	public void i_should_see_Enter_aprrove_reject_reasons_pop_up_header_as(String arg1) throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		Assert.assertTrue(managerpage.isApproveRejectPopupDisplayed(arg1));
	}
}
