package com.wso2telco.tests.apimanager.steps.apimanager;

import org.junit.Assert;

import com.wso2telco.apimanager.pageobjects.apihome.manager.ManagerPage;
import com.wso2telco.tests.apimanager.base.BasicTestObject;

import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;

public class APIManageSteps extends BasicTestObject {

	String winHandleBefore = driver.getWindowHandle();

	@Then("^I should see the apimanager Manager page header as \"([^\"]*)\"$")
	public void i_should_see_the_apimanager_Manager_page_header_as(String arg1)
			throws Throwable {
		for (String winHandle : driver.getWindowHandles()) {
			driver.switchTo().window(winHandle);
		}
		ManagerPage managerpage = new ManagerPage(driver);
		Assert.assertTrue("Manager page did not load properly",
				managerpage.isManagerPage(arg1));
	}

	@When("^I enter apimanager Manager page username and password for \"([^\"]*)\"$")
	public void i_enter_apimanager_Manager_page_username_and_password_for(
			String arg1) throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		managerpage.enterUserName(config.getValue(getEnvironment() + arg1
				+ "user"));
		managerpage.enterPassword(config.getValue(getEnvironment() + arg1
				+ "pwd"));
	}

	@When("^I enter apimanager Manager page admin username credentials$")
	public void i_enter_apimanager_Manager_page_admin_username_credentials()
			throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		managerpage.enterUserName(config.getValue(getEnvironment()
				+ "AdminUserName"));
		managerpage.enterPassword(config.getValue(getEnvironment()
				+ "AdminPassword"));
	}

	@When("^I enter apimanager Manager page operator username credentials$")
	public void i_enter_apimanager_Manager_page_operator_username_credentials()
			throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		managerpage.enterUserName(config.getValue(getEnvironment()
				+ "OperatorUserName"));
		managerpage.enterPassword(config.getValue(getEnvironment()
				+ "OperatorPassword"));
	}

	@When("^I click on apimanager Manager page login button$")
	public void i_click_on_apimanager_Manager_page_login_button()
			throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		managerpage.clickLogin();
	}

	@Then("^I should see the apimanager Manager Home page header as \"([^\"]*)\"$")
	public void i_should_see_the_apimanager_Manager_Home_page_header_as(
			String arg1) throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		Assert.assertTrue("Manager Home page did not load properly",
				managerpage.isHomePage(arg1));
	}

	@When("^I click on apimanager Manager$")
	public void i_click_on_apimanager_Manager() throws Throwable {
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
		managerpage.clickUserName();
	}

	@When("^I click on apimanager Manager dialogAdmin$")
	public void i_click_on_apimanager_Manager_dialogAdmin() throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		managerpage.clickUserName();
	}

	@When("^I click on close window$")
	public void i_click_on_close_window() throws Throwable {
		driver.close();
		driver.switchTo().window(winHandleBefore);
	}

	@Then("^I should see apimanager Manager Home and Billing tabs$")
	public void I_should_see_apimanager_Manager_Home_and_Billing_tabs()
			throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		Assert.assertTrue("System provide access to black list white list",
				managerpage.isManagerTwoTabsAccess());
	}

	@When("^I close the browser and reopen the browsers and navigate to apimanager page$")
	public void i_close_the_browser_and_reopen_the_browsers_and_navigate_to_apimanager_page()
			throws Throwable {
		driver.close();
		initialize();
		launchBrowser();
		driver.get(config.getValue(getEnvironment() + "ApiManagerSiteName"));
	}

	@Then("^I should see apimanager Manager Home Billing Workflow Blacklist Whitelist tabs$")
	public void i_should_see_apimanager_Manager_Home_Billing_Workflow_Blacklist_Whitelist_tabs()
			throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		Assert.assertTrue("All the tabs are not visible",
				managerpage.isAllTabsAccessible());
	}

	@Then("^I should see apimanager Manager Home Billing Workflow$")
	public void i_should_see_apimanager_Manager_Home_Billing_Workflow()
			throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		Assert.assertTrue("3 Tabs are not visible", managerpage.isThreeTabs());
		Thread.sleep(10000);
	}

	@When("^I click on apimanager Manager page Workflow tab$")
	public void i_click_on_apimanager_Manager_page_Workflow_tab()
			throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		managerpage.clickWorkflow();
		Thread.sleep(10000);
	}

	@Then("^I should see apimanager Manager Approval Tasks page$")
	public void i_should_see_apimanager_Manager_Approval_Tasks_page()
			throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		Assert.assertTrue("Application creation link is not visible",
				managerpage.isApplicationCreation());
	}

	@When("^I click on Application creation link$")
	public void i_click_on_Application_creation_link() throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		managerpage.clickApplicationCreation();
	}

	@Then("^I should see created application \"([^\"]*)\" at the top of the Approval Tasks table$")
	public void i_should_see_created_application_at_the_top_of_the_Approval_Tasks_table(
			String arg1) throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		Assert.assertTrue("App name is not visible in the area",
				managerpage.isApplicationNameVisible(arg1));
	}

	@When("^I click on Application Details drop box for \"([^\"]*)\" row$")
	public void i_click_on_Application_Details_drop_box_for_row(String arg1)
			throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		managerpage.clickApplicationDetails(arg1);
	}

	@When("^I select \"([^\"]*)\" for \"([^\"]*)\" Application Details row$")
	public void i_select_for_Application_Details_row(String arg1, String arg2)
			throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		managerpage.selectTier(arg1, arg2);
	}

	@When("^I click Assign To Me button for \"([^\"]*)\" Application Details row$")
	public void i_click_Assign_To_Me_button_for_Application_Details_row(
			String arg1) throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		managerpage.clickAssignMe(arg1);
		Thread.sleep(10000);
	}

	@When("^I click on Start button for \"([^\"]*)\" Application Details row$")
	public void i_click_on_Start_button_for_Application_Details_row(String arg1)
			throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		managerpage.clickStart(arg1);
		Thread.sleep(10000);
	}

	@When("^I select \"([^\"]*)\" and click complete button for \"([^\"]*)\" Application Details row$")
	public void i_select_and_click_complete_button_for_Application_Details_row(
			String arg1, String arg2) throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		managerpage.selectCondition(arg1, arg2);
		managerpage.clickComplete(arg2);
		Thread.sleep(10000);
	}

	@When("^I enter aprrove/reject reason as \"([^\"]*)\"$")
	public void i_enter_aprrove_reject_reason_as(String arg1) throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		managerpage.enterApproveRejectReason(arg1);
		Thread.sleep(10000);
	}

	@When("^click aprrove/reject reason ok button$")
	public void click_aprrove_reject_reason_ok_button() throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		managerpage.clickApproveOK();
		Thread.sleep(10000);
	}

	@Then("^I should not see the created application in Approval Tasks table as \"([^\"]*)\"$")
	public void i_should_not_see_the_created_application_in_Approval_Tasks_table_as(
			String arg1) throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		Assert.assertTrue("App name is visible after approving",
				managerpage.isApplicationNameNotVisible(arg1));
		Thread.sleep(10000);
	}

	@When("^I click on subscriptions creation under tasks$")
	public void i_click_on_subscriptions_creation_under_tasks()
			throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		managerpage.clickSubCreation();
	}

	@Then("^I should see apimanager Manager Approval Tasks page header as \"([^\"]*)\"$")
	public void i_should_see_apimanager_Manager_Approval_Tasks_page_header_as(
			String arg1) throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		Assert.assertTrue("Approval Tasks page did not load properly",
				managerpage.isApprovalTaskDisplayed(arg1));
	}

	@Then("^I should see Enter aprrove/reject reasons pop up header as \"([^\"]*)\"$")
	public void i_should_see_Enter_aprrove_reject_reasons_pop_up_header_as(
			String arg1) throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		Assert.assertTrue(
				"Enter aprrove/reject reasons pop up did not load properly",
				managerpage.isApproveRejectPopupDisplayed(arg1));
		Thread.sleep(10000);
	}

	@When("^I click on apimanager Manager page Blacklist tab$")
	public void i_click_on_apimanager_Manager_page_Blacklist_tab()
			throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		managerpage.clickBlackList();
		Thread.sleep(3000);
	}

	@Then("^I should see apimanager Manager APIwise Blacklist page header as \"([^\"]*)\"$")
	public void i_should_see_apimanager_Manager_APIwise_Blacklist_page_header_as(
			String arg1) throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		Assert.assertTrue("APIwise blacklist page did not load properly",
				managerpage.isAPIBlacklistPageDisplayed(arg1));
		Thread.sleep(2000);
	}

	@When("^I click on API dropbox$")
	public void i_click_on_API_dropbox() throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		managerpage.clickAPIDropDown();
		Thread.sleep(1000);
	}

	@When("^I select \"([^\"]*)\" as blacklist API$")
	public void i_select_as_blacklist_API(String arg1) throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		managerpage.selectUSSD();
	}

	@When("^I click on Blacklisted subscribers Add New button$")
	public void i_click_on_Blacklisted_subscribers_Add_New_button()
			throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		managerpage.clickAddNewButton();
	}

	@Then("^I should see add nember alert header as \"([^\"]*)\"$")
	public void i_should_see_add_nember_alert_header_as(String arg1)
			throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		Assert.assertTrue("Add number alert did not load properly",
				managerpage.isAddNumberAlertDisplayed(arg1));
	}

	@When("^I enter the \"([^\"]*)\" to blacklist$")
	public void i_enter_the_to_blacklist(String arg1) throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		managerpage.enterBlackListNumber(arg1);
	}

	@When("^I click add blacklist number alert ok button$")
	public void i_click_add_blacklist_number_alert_ok_button() throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		managerpage.clickAlertOKButton();
	}

	@Then("^I should see \"([^\"]*)\" in blacklisted subscribers table$")
	public void i_should_see_in_blacklisted_subscribers_table(String arg1)
			throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		Assert.assertTrue("Added number did not show in table",
				managerpage.isAddedNumberDisplayed(arg1));
	}

	@Then("^I should see error pop up header as \"([^\"]*)\"$")
	public void i_should_see_error_pop_up_header_as(String arg1)
			throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		Assert.assertTrue("API Manager module error pop up did not appear",
				managerpage.isAPIManagerAdminModuleErrorPopupDisplayed(arg1));
	}

	@When("^I click on apimanager Manager page Whitelist tab$")
	public void i_click_on_apimanager_Manager_page_Whitelist_tab()
			throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		managerpage.clickWhiteListTab();
	}

	@Then("^I should see apimanager Manager APIwise Whitelist page header as \"([^\"]*)\"$")
	public void i_should_see_apimanager_Manager_APIwise_Whitelist_page_header_as(
			String arg1) throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		Assert.assertTrue("APIwise Whitelist page did not appear",
				managerpage.isAPIwiseWhitelistPageDisplayed(arg1));
	}

	@When("^I click on whitelist subscriber drop box$")
	public void i_click_on_whitelist_subscriber_drop_box() throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		managerpage.clickSubscriberDropBox();
	}

	@When("^I select \"([^\"]*)\" as subscriber$")
	public void i_select_as_subscriber(String arg1) throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		managerpage.selectSubscriber(arg1);
	}

	@When("^I click on whitelist application drop box$")
	public void i_click_on_whitelist_application_drop_box() throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		managerpage.clickApplicationDropBox();
	}

	@When("^I select \"([^\"]*)\" as Application$")
	public void i_select_as_Application(String arg1) throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		managerpage.selectApplication(arg1);
	}

	@When("^I click on whitelist API drop box$")
	public void i_click_on_whitelist_API_drop_box() throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		managerpage.clickAPIDropBox();
	}
	
	@When("^I select \"([^\"]*)\" as whitelist API$")
	public void i_select_as_whitelist_API(String arg1) throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		managerpage.selectWhiteListAPIUSSD();
	}
	
	@When("^I select Upload number Manually radio button$")
	public void i_select_Upload_number_Manually_radio_button() throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		managerpage.clickUploadManually();
	}
	
	@When("^I enter the \"([^\"]*)\" as the number to whitelist$")
	public void i_enter_the_as_the_number_to_whitelist(String arg1) throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		managerpage.enterManualNumber(arg1);
	}
	

	@When("^I click whitelist page Upload Number button$")
	public void i_click_whitelist_page_Upload_Number_button() throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		managerpage.clickUploadNumberButton();
	}
}
