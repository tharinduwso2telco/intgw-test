package com.wso2telco.tests.apimanager.steps.apimanager;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import org.junit.Assert;

import com.wso2telco.apimanager.pageobjects.apihome.manager.ManagerPage;
import com.wso2telco.apimanager.pageobjects.db.queries.SQLQuery;
import com.wso2telco.test.framework.tools.excelfile.ExcelFileReader;
import com.wso2telco.tests.apimanager.base.BasicTestObject;
import com.wso2telco.tests.util.data.RuntimeData;
import com.wso2telco.tests.util.data.WhiteListData;

import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;

public class APIManageSteps extends BasicTestObject {
	
	@Given("^I am in hubmanager$")
	public void i_am_in_hubmanager() throws Throwable {
		if (driver == null) {
			initialize();
			openBrowser();
			driver.get(config.getValue(getEnvironment() + "ApiManagerManage"));
		} else {
			driver.close();
			initialize();
			openBrowser();
			driver.get(config.getValue(getEnvironment() + "ApiManagerManage"));
		}
	}
	
	@Then("^I should see the apimanager Manager page header as \"([^\"]*)\"$")
	public void i_should_see_the_apimanager_Manager_page_header_as(String arg1) throws Throwable {
		Thread.sleep(sleepTime);
		for (String winHandle : driver.getWindowHandles()) {
			driver.switchTo().window(winHandle);
		}
		Thread.sleep(sleepTime);
		ManagerPage managerpage = new ManagerPage(driver);
		Assert.assertTrue("Manager page did not load properly", managerpage.isManagerPage(arg1));
	}

	@When("^I enter apimanager Manager page username and password for \"([^\"]*)\"$")
	public void i_enter_apimanager_Manager_page_username_and_password_for(String arg1) throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		Thread.sleep(sleepTime);
		managerpage.enterUserName(config.getValue(getEnvironment() + arg1 + "user"));
		Thread.sleep(sleepTime);
		managerpage.enterPassword(config.getValue(getEnvironment() + arg1 + "pwd"));
	}

	@When("^I enter apimanager Manager page admin username credentials$")
	public void i_enter_apimanager_Manager_page_admin_username_credentials() throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		managerpage.enterUserName(config.getValue(getEnvironment() + "AdminUserName"));
		managerpage.enterPassword(config.getValue(getEnvironment() + "AdminPassword"));
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
		Thread.sleep(28000);
	}

	@Then("^I should see the apimanager Manager Home page header as \"([^\"]*)\"$")
	public void i_should_see_the_apimanager_Manager_Home_page_header_as(
			String arg1) throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		Assert.assertTrue("Manager Home page did not load properly",
				managerpage.isHomePage(arg1));
	}

	@When("^I click on apimanager Manager username$")
	public void i_click_on_apimanager_Manager_username() throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		managerpage.clickUserName();
	}

	@When("^I click on apimanager Manager logout button$")
	public void i_click_on_apimanager_Manager_logout_button() throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		managerpage.clickLogout();
		Thread.sleep(sleepTime);
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
		Set<String> winHandleBefore = driver.getWindowHandles();
		String currentWindow = driver.getWindowHandle();
		ArrayList<String> elements = new ArrayList<>();
		for (String winNum : winHandleBefore) {
			elements.add(winNum);
		}
		driver.switchTo().window(currentWindow);
		driver.close();
		Thread.sleep(sleepTime);
		elements.remove(currentWindow);
		String mainWindow = null;
		if (elements.size() == 1){
			mainWindow = elements.get(0);
		}
		driver.switchTo().window(mainWindow);
		//String currentWindow = driver.getWindowHandle();
/*		
		Thread.sleep(sleepTime);
		driver.switchTo().window(currentWindow);

		Thread.sleep(sleepTime);*/
		
	}

	@Then("^I should see apimanager Manager Home and Billing tabs$")
	public void I_should_see_apimanager_Manager_Home_and_Billing_tabs()
			throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		Assert.assertTrue("System provide access to black list white list",
				managerpage.isManagerTwoTabsAccess());
	}

	@When("^I close the browser and reopen the browsers and navigate to apimanager page$")
	public void i_close_the_browser_and_reopen_the_browsers_and_navigate_to_apimanager_page() throws Throwable {
		driver.close();
		initialize();
		openBrowser();
		driver.get(config.getValue(getEnvironment() + "ApiManagerSiteName"));
	}

	@Then("^I should see apimanager Manager Home Billing Workflow Blacklist Whitelist tabs$")
	public void i_should_see_apimanager_Manager_Home_Billing_Workflow_Blacklist_Whitelist_tabs() throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		Thread.sleep(sleepTime);
		Assert.assertTrue("All the tabs are not visible", managerpage.isAllTabsAccessible());
	}

	@Then("^I should see apimanager Manager Home Billing Workflow$")
	public void i_should_see_apimanager_Manager_Home_Billing_Workflow()
			throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		Assert.assertTrue("3 Tabs are not visible", managerpage.isThreeTabs());
		Thread.sleep(sleepTime);
	}

	@When("^I click on apimanager Manager page Workflow tab$")
	public void i_click_on_apimanager_Manager_page_Workflow_tab() throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		Thread.sleep(sleepTime);
		managerpage.clickWorkflow();
		Thread.sleep(sleepTime);
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

	@Then("^I should see created application \"([^\"]*)\" at the top of the Approval Tasks table for \"([^\"]*)\"$")
	public void i_should_see_created_application_at_the_top_of_the_Approval_Tasks_table_for(String arg1, String arg2) throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		String appName = arg1;
		Thread.sleep(sleepTime);
		Assert.assertTrue("App name is not visible in the area", managerpage.isApplicationNameVisible(appName));
	}

	@When("^I click on Application Details drop box for \"([^\"]*)\" row for \"([^\"]*)\"$")
	public void i_click_on_Application_Details_drop_box_for_row_for(String arg1, String arg2) throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		String appName = arg1;
		managerpage.clickApplicationDetails(appName);
	}

	@When("^I select \"([^\"]*)\" for \"([^\"]*)\" Application Details row for \"([^\"]*)\"$")
	public void i_select_for_Application_Details_row_for(String arg1, String arg2, String arg3) throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		String appName = arg2;
		managerpage.selectTier(arg1, appName);
	}

	@When("^I click Assign To Me button for \"([^\"]*)\" Application Details row for \"([^\"]*)\"$")
	public void i_click_Assign_To_Me_button_for_Application_Details_row_for(String arg1, String arg2) throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		String appName = arg1;
		managerpage.clickAssignMe(appName);
		Thread.sleep(sleepTime);
	}

	@When("^I click on Start button for \"([^\"]*)\" Application Details row for \"([^\"]*)\"$")
	public void i_click_on_Start_button_for_Application_Details_row_for(String arg1, String arg2) throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		String appName = arg1;
		managerpage.clickStart(appName);
		Thread.sleep(sleepTime);
	}

	@When("^I select \"([^\"]*)\" and click complete button for \"([^\"]*)\" Application Details row for \"([^\"]*)\"$")
	public void i_select_and_click_complete_button_for_Application_Details_row_for(String arg1, String arg2, String arg3) throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		String appName = arg2;
		managerpage.selectCondition(arg1, appName);
		managerpage.clickComplete(appName);
		Thread.sleep(sleepTime);
	}

	@When("^I enter aprrove/reject reason as \"([^\"]*)\"$")
	public void i_enter_aprrove_reject_reason_as(String arg1) throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		managerpage.enterApproveRejectReason(arg1);
		Thread.sleep(sleepTime);
	}

	@When("^click aprrove/reject reason ok button$")
	public void click_aprrove_reject_reason_ok_button() throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		managerpage.clickApproveOK();
		Thread.sleep(sleepTime);
	}
	
	@Then("^I should see a pop message \"([^\"]*)\"$")
	public void i_should_see_a_pop_message(String arg1) throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		Assert.assertTrue("Action comment warning popup is not visible", managerpage.isActionCommentRequired(arg1));
	}

	@When("^I click the ok button of warning message popup$")
	public void i_click_the_ok_button_of_warning_message_popup() throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		managerpage.clickRequiredOk();
	}

	@Then("^I should not see the created application in Approval Tasks table as \"([^\"]*)\" for \"([^\"]*)\"$")
	public void i_should_not_see_the_created_application_in_Approval_Tasks_table_as_for(String arg1, String arg2) throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		String appName = arg1;
		Assert.assertTrue("App name is visible after approving", managerpage.isApplicationNameNotVisible(appName));
		Thread.sleep(sleepTime);
	}

	@When("^I click on subscriptions creation under tasks$")
	public void i_click_on_subscriptions_creation_under_tasks()
			throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		managerpage.clickSubCreation();
	}

	@Then("^I should see apimanager Manager Approval Tasks page header as \"([^\"]*)\"$")
	public void i_should_see_apimanager_Manager_Approval_Tasks_page_header_as(String arg1) throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		Assert.assertTrue("Approval Tasks page did not load properly", managerpage.isApprovalTaskDisplayed(arg1));
	}

	@Then("^I should see Enter aprrove/reject reasons pop up header as \"([^\"]*)\"$")
	public void i_should_see_Enter_aprrove_reject_reasons_pop_up_header_as(
			String arg1) throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		Assert.assertTrue(
				"Enter aprrove/reject reasons pop up did not load properly",
				managerpage.isApproveRejectPopupDisplayed(arg1));
		Thread.sleep(sleepTime);
	}

	@When("^I click on apimanager Manager page Blacklist tab$")
	public void i_click_on_apimanager_Manager_page_Blacklist_tab()
			throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		managerpage.clickBlackList();
		Thread.sleep(sleepTime);
	}

	@Then("^I should see apimanager Manager APIwise Blacklist page header as \"([^\"]*)\"$")
	public void i_should_see_apimanager_Manager_APIwise_Blacklist_page_header_as(
			String arg1) throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		Thread.sleep(sleepTime);
		Assert.assertTrue("APIwise blacklist page did not load properly", managerpage.isAPIBlacklistPageDisplayed(arg1));
	}

	@When("^I clear existing \"([^\"]*)\"$")
	public void i_clear_existing(String arg1) throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		managerpage.clearBlacklistNumber(arg1);
	}

	@When("^I select \"([^\"]*)\" as blacklist API$")
	public void i_select_as_blacklist_API(String arg1) throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		managerpage.selectAPI(arg1);
	}

	@When("^I click on Blacklisted subscribers Add New button$")
	public void i_click_on_Blacklisted_subscribers_Add_New_button() throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		managerpage.clickAddNewButton();
	}

	@Then("^I should see add nember alert header as \"([^\"]*)\"$")
	public void i_should_see_add_nember_alert_header_as(String arg1)
			throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		Assert.assertTrue("Add number alert did not load properly", managerpage.isAddNumberAlertDisplayed(arg1));
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

	@When("^I select \"([^\"]*)\" as subscriber$")
	public void i_select_as_subscriber(String arg1) throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		String username = config.getValue(getEnvironment() + arg1 + "user");
		managerpage.selectSubscriber(username);
	}

	@When("^I select \"([^\"]*)\" as Application$")
	public void i_select_as_Application(String arg1) throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		managerpage.selectApplication(arg1);
	}

	@When("^I select \"([^\"]*)\" as whitelist API$")
	public void i_select_as_whitelist_API(String arg1) throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		managerpage.selectWhiteListAPI(arg1);
	}
	
	@When("^I select Upload number Manually radio button$")
	public void i_select_Upload_number_Manually_radio_button() throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		managerpage.clickUploadManually();
	}
	
	@When("^I enter the same \"([^\"]*)\" as the number to whitelist$")
	public void i_enter_the_same_as_the_number_to_whitelist(String arg1) throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		WhiteListData data = new WhiteListData();
		String sameValue =data.getRedundentValue();
		managerpage.enterRedundentValue(sameValue);
		
	}
	
	@When("^I enter the \"([^\"]*)\" as the number to whitelist$")
	public void i_enter_the_as_the_number_to_whitelist(String arg1) throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		WhiteListData data = new WhiteListData();
		String whiteListNumber = managerpage.GenWhileListNum();
		data.setRedundentValue(whiteListNumber);
		managerpage.enterManualNumber(whiteListNumber);
		Thread.sleep(6000);
	}
	

	@When("^I click whitelist page Upload Number button$")
	public void i_click_whitelist_page_Upload_Number_button() throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		managerpage.clickUploadNumberButton();
	}
	
	@Then("^I should see success pop up message as \"([^\"]*)\"$")
	public void i_should_see_success_pop_up_message_as(String arg1) throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		Assert.assertTrue("APIwise Whitelist success pop up did not appear",
				managerpage.isWhiteListAddedSuccessfullyPopupDisplayed(arg1));
	}
	
	@Then("^I click on success pop up ok button$")
	public void i_click_on_success_pop_up_ok_button() throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		managerpage.clickOK();
	}
	
	@When("^I select Whitelist numbers range radio button$")
	public void i_select_Whitelist_numbers_range_radio_button() throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		managerpage.clickNumberRangeButton();
	}
	
	@When("^I enter \"([^\"]*)\" as Min Number$")
	public void i_enter_as_Min_Number(String arg1) throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		WhiteListData data = new WhiteListData();
		String minNumber = managerpage.GenMinNum();
		data.setMinNumberofNumberRange(minNumber);
		managerpage.enterMinNumber(minNumber);
	}
	
	@When("^I enter \"([^\"]*)\" as Max Number$")
	public void i_enter_as_Max_Number(String arg1) throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		WhiteListData data = new WhiteListData();
		String minNumber = data.getMinNumberofNumberRange();
		String maxNumber = managerpage.GenMaxNum(minNumber);
		managerpage.enterMaxNumber(maxNumber);
	}
	
	@When("^I click on whitelist Upload Number List button$")
	public void i_click_on_whitelist_Upload_Number_List_button() throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		managerpage.clickUploadNumberList();
	}
	
	@When("^I select Upload White list number list radio button$")
	public void i_select_Upload_White_list_number_list_radio_button() throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		managerpage.clickUploadWhitelistNumberList();
	}
	
	@When("^I click whitelist Add Number List button$")
	public void i_click_whitelist_Add_Number_List_button() throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		managerpage.clickAddNumberList();
	}
	
	@Then("^I should see the pop up to enter the numbers as \"([^\"]*)\"$")
	public void i_should_see_the_pop_up_to_enter_the_numbers_as(String arg1) throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		Assert.assertTrue("Enter Number alert did not appear",
				managerpage.isAddNumberAlertDisplayed(arg1));
	}
	
	@When("^I click on add number list pop up ok button$")
	public void i_click_on_add_number_list_pop_up_ok_button() throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		managerpage.clickAlertOKButton();
	}
	
	@When("^I enter the number list as \"([^\"]*)\"$")
	public void i_enter_the_number_list_as(String arg1) throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		managerpage.enterWhiteListNumberList(arg1);
	}
	
	@Then("^I should see error message as \"([^\"]*)\"$")
	public void i_should_see_error_message_as(String arg1) throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		Assert.assertTrue("Error message did not appear",
				managerpage.isWhiteListErrorPopupDisplayed(arg1));
	}

	@Then("^I should see the apimanager Manager page username and password text boxes$")
	public void i_should_see_the_apimanager_Manager_page_username_and_password_text_boxes() throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		Assert.assertTrue("Manager page user name and password text boxs did not appear",
				managerpage.isManagerPageUsenamePasswordTextBoxesDisplayed());
	}
	
	@When("^I enter apimanager Manager page login username and password for \"([^\"]*)\"$")
	public void i_enter_apimanager_Manager_page_login_username_and_password_for(String arg1) throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		managerpage.enterUserName(config.getValue(getEnvironment() + arg1 + "user"));
		managerpage.enterPassword(config.getValue(getEnvironment() + arg1 + "pwd"));
	}
	
	@When("^I click on SP Blacklist under Lists$")
	public void i_click_on_SP_Blacklist_under_Lists() throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		managerpage.clickOnSPBlackList();
	}
	
	@Then("^I should see apimanager Manager SP Blacklist page header as \"([^\"]*)\"$")
	public void i_should_see_apimanager_Manager_SP_Blacklist_page_header_as(String arg1) throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		Assert.assertTrue("SP Blacklist page did not appear",
				managerpage.isSPBlacklistPageDisplayed(arg1));
	}
	
	@When("^I select \"([^\"]*)\" as application to blacklist$")
	public void i_select_as_application_to_blacklist(String arg1) throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		managerpage.selectSPBlacklistApplication(arg1);
	}
	

	@When("^I click on SP Blacklist Blacklist button$")
	public void i_click_on_SP_Blacklist_Blacklist_button() throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		managerpage.clickOnSPBlackListButton();
	}
	
	@Then("^I should see API Admin Module pop up header as \"([^\"]*)\"$")
	public void i_should_see_API_Admin_Module_pop_up_header_as(String arg1) throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		Assert.assertTrue("API admin module page did not appear",
				managerpage.isSPBlacklistAPIAdminModulePageDisplayed(arg1));
	}

	@Then("^I click on API Admin Module pop up ok button$")
	public void i_click_on_API_Admin_Module_pop_up_ok_button() throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		managerpage.clickAdminModuleYes();
	}
	
	@When("^I write the UI table into a \"([^\"]*)\" excel file in \"([^\"]*)\" location$")
	public void i_write_the_UI_table_into_a_excel_file_in_location(String arg1, String arg2) throws Throwable {
		String nbUITableFilePath = projectPath + config.getValue("uploadRateCard") + arg2 + arg1;
		ManagerPage managerpage = new ManagerPage(driver);
		List<List<String>> nbUiData = managerpage.getNbUITableData();
		managerpage.writeStringAryToXlsx(nbUITableFilePath, nbUiData);
		
		Iterator<String> wh =driver.getWindowHandles().iterator();
		while (wh.hasNext()) {
			driver.switchTo().window(wh.next()).close();
			
		}
		driver=null;
	}
	
	@When("^I calculate the difference between \"([^\"]*)\" and \"([^\"]*)\" excel file from \"([^\"]*)\" location and write it to \"([^\"]*)\"$")
	public void i_calculate_the_difference_between_and_excel_file_from_location_and_write_it_to(String arg1, String arg2, String arg3, String arg4) throws Throwable {
		String beforeFile = projectPath + config.getValue("uploadRateCard") + arg3 + arg1;
		String afterFile = projectPath + config.getValue("uploadRateCard") + arg3 + arg2;
		String difFile = projectPath + config.getValue("uploadRateCard") + arg3 + arg4;
		ExcelFileReader excelFileReaderBefore = new ExcelFileReader(beforeFile, "Sheet1");
		List<List<String>> exceldataBefore = excelFileReaderBefore.readExcelFile("Sheet1");
		ExcelFileReader excelFileReaderAfter = new ExcelFileReader(afterFile, "Sheet1");
		List<List<String>> exceldataAfter = excelFileReaderAfter.readExcelFile("Sheet1");
		ManagerPage managerpage = new ManagerPage(driver);
		List<List<String>> excelDifAfterBefore = managerpage.nbMonthlyInvoiceDifference(exceldataBefore, exceldataAfter);
		managerpage.writeStringAryToXlsx(difFile, excelDifAfterBefore);
	}
	
	@When("^I calculate the difference between SB \"([^\"]*)\" and \"([^\"]*)\" excel file from \"([^\"]*)\" location and write it to \"([^\"]*)\"$")
	public void i_calculate_the_difference_between_SB_and_excel_file_from_location_and_write_it_to(String arg1, String arg2, String arg3, String arg4) throws Throwable {
		String beforeFile = projectPath + config.getValue("uploadRateCard") + arg3 + arg1;
		String afterFile = projectPath + config.getValue("uploadRateCard") + arg3 + arg2;
		String difFile = projectPath + config.getValue("uploadRateCard") + arg3 + arg4;
		ExcelFileReader excelFileReaderBefore = new ExcelFileReader(beforeFile, "Sheet1");
		List<List<String>> exceldataBefore = excelFileReaderBefore.readExcelFile("Sheet1");
		ExcelFileReader excelFileReaderAfter = new ExcelFileReader(afterFile, "Sheet1");
		List<List<String>> exceldataAfter = excelFileReaderAfter.readExcelFile("Sheet1");
		ManagerPage managerpage = new ManagerPage(driver);
		List<List<String>> excelDifAfterBefore = managerpage.sbMonthlyInvoiceDifference(exceldataBefore, exceldataAfter);
		managerpage.writeStringAryToXlsx(difFile, excelDifAfterBefore);
	}
	
	@Then("^I validate \"([^\"]*)\" records against \"([^\"]*)\" from \"([^\"]*)\" location$")
	public void i_validate_records_against_from_location(String arg1, String arg2, String arg3) throws Throwable {
		String difFileUi = projectPath + config.getValue("uploadRateCard") + arg3 + arg1;
		String difFileDifManual = projectPath + config.getValue("uploadRateCard") + arg3 + arg2;
		ExcelFileReader excelFileDiffUi = new ExcelFileReader(difFileUi, "Sheet1");
		List<List<String>> exceldataDiffUi = excelFileDiffUi.readExcelFile("Sheet1");
		ExcelFileReader excelFileDifManual = new ExcelFileReader(difFileDifManual, "Sheet1");
		List<List<String>> exceldataDifManual = excelFileDifManual.readExcelFile("Sheet1");
		ManagerPage managerpage = new ManagerPage(driver);
		Assert.assertTrue("Price difference mismatched", managerpage.isDifferenceMatch(exceldataDiffUi, exceldataDifManual));
	}
	
	@Then("^I validate SB invoice \"([^\"]*)\" records against \"([^\"]*)\" from \"([^\"]*)\" location$")
	public void i_validate_SB_invoice_records_against_from_location(String arg1, String arg2, String arg3) throws Throwable {
		String difFileUi = projectPath + config.getValue("uploadRateCard") + arg3 + arg1;
		String difFileDifManual = projectPath + config.getValue("uploadRateCard") + arg3 + arg2;
		ExcelFileReader excelFileDiffUi = new ExcelFileReader(difFileUi, "Sheet1");
		List<List<String>> exceldataDiffUi = excelFileDiffUi.readExcelFile("Sheet1");
		ExcelFileReader excelFileDifManual = new ExcelFileReader(difFileDifManual, "Sheet1");
		List<List<String>> exceldataDifManual = excelFileDifManual.readExcelFile("Sheet1");
		ManagerPage managerpage = new ManagerPage(driver);
		Assert.assertTrue("Price difference mismatched", managerpage.isSbDifferenceMatch(exceldataDiffUi, exceldataDifManual));
	}
	
	@When("^I write the SB UI table into a \"([^\"]*)\" excel file in \"([^\"]*)\" location$")
	public void i_write_the_SB_UI_table_into_a_excel_file_in_location(String arg1, String arg2) throws Throwable {
		String sbUITableFilePath = projectPath + config.getValue("uploadRateCard") + arg2 + arg1;
		ManagerPage managerpage = new ManagerPage(driver);
		List<List<String>> sbUiData = managerpage.getSbUITableData();
		managerpage.writeStringAryToXlsx(sbUITableFilePath, sbUiData);
		
		Iterator<String> wh =driver.getWindowHandles().iterator();
		while (wh.hasNext()) {
			driver.switchTo().window(wh.next()).close();
			
		}
		driver=null;
		
	}
	
	@Then("^I validate \"([^\"]*)\" \"([^\"]*)\" and \"([^\"]*)\" for \"([^\"]*)\" value as \"([^\"]*)\"$")
	public void i_validate_and_for_value_as(String arg1, String arg2, String arg3, String arg4, String arg5) throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		String valueUI = managerpage.getNbValueInvoice(arg1, arg2, arg3, arg4);
		//TODO:need t who add a comment
		Assert.assertTrue("", managerpage.compareString(valueUI, arg5));
	}

	@Then("^I validate total amount \"([^\"]*)\" application for \"([^\"]*)\" column value as \"([^\"]*)\"$")
	public void i_validate_total_amount_application_for_column_value_as(String arg1, String arg2, String arg3) throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		String valueUI = managerpage.getNbTotalAmount(arg1, arg2);
		//TODO:need to add a comment
		Assert.assertTrue("", managerpage.compareString(valueUI, arg3));
	}
	
	@Then("^I validate \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\" and \"([^\"]*)\" for \"([^\"]*)\" value as \"([^\"]*)\"$")
	public void i_validate_and_for_value_as(String arg1, String arg2, String arg3, String arg4, String arg5, String arg6) throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		String valueUI = managerpage.getSouthboundInvoicValue(arg1, arg2, arg3, arg4, arg5);
		//TODO:need to add a comment
		Assert.assertTrue("", managerpage.compareString(valueUI, arg6));
	}

	@Then("^I validate total amount for \"([^\"]*)\" column value as \"([^\"]*)\"$")
	public void i_validate_total_amount_for_column_value_as(String arg1, String arg2) throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		String valueUI = managerpage.getSouthboundTotalAmount(arg1);
		//TODO:need to add a comment
		Assert.assertTrue("", managerpage.compareString(valueUI, arg2));
	}

	@Then("^I should see the updated record in subscription_rates_nb table for \"([^\"]*)\"$")
	public void i_should_see_the_updated_record_in_subscription_rates_nb_table_for(String arg1) throws Throwable {
		String subscription_rates_nbQuery = String.format(SQLQuery.SUBSCRIPTION_RATES_NB, arg1);
		RuntimeData runtimeQuery = new RuntimeData();
		ManagerPage managerpage = new ManagerPage(driver);
		runtimeQuery.setRuntimeQuery(subscription_rates_nbQuery);
		Assert.assertTrue("subscription_rates_nb table is not updated", managerpage.isSubscriptionRatesTablesUpdated(subscription_rates_nbQuery));
		
	}

	@Then("^I should see the updated record in subscription_rates table for \"([^\"]*)\"$")
	public void i_should_see_the_updated_record_in_subscription_rates_table_for(String arg1) throws Throwable {
		String subscription_ratesQuery = String.format(SQLQuery.SUBSCRIPTION_RATES, arg1);
		RuntimeData runtimeQuery = new RuntimeData();
		ManagerPage managerpage = new ManagerPage(driver);
		runtimeQuery.setRuntimeQuery(subscription_ratesQuery);
		Assert.assertTrue("subscription_rates table is not updated", managerpage.isSubscriptionRatesTablesUpdated(subscription_ratesQuery));
	}

	@Then("^I should see the status of the application \"([^\"]*)\" approval task as \"([^\"]*)\"$")
	public void i_should_see_the_status_of_the_application_approval_task_as(String arg1, String arg2) throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		Assert.assertTrue("Approval Status mismatched", managerpage.isApprovalTaskStatus(arg1, arg2));
	}

	@Then("^I click on action dropdown of \"([^\"]*)\" task$")
	public void i_click_on_action_dropdown_of_task(String arg1) throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		managerpage.clickDropdownActions(arg1);
	}


	@Then("^I should see Action \"([^\"]*)\" of the \"([^\"]*)\" task in the dropdown$")
	public void i_should_see_Action_of_the_task_in_the_dropdown(String arg1, String arg2) throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		Assert.assertTrue("Action dropdown options not displayed", managerpage.isApprovalActionsDisplayed(arg1, arg2));
	}
	
	@Then("^I should see the selected throttling layer as \"([^\"]*)\" for \"([^\"]*)\" Application$")
	public void i_should_see_the_selected_throttling_layer_as_for_Application(String arg1, String arg2) throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		managerpage.isTierValueDisplayed(arg1, arg2);
	}
/*	
	@When("^I select \"([^\"]*)\" for \"([^\"]*)\" Subscription Details row for \"([^\"]*)\"$")
	public void i_select_for_Subscription_Details_row_for(String arg1, String arg2, String arg3) throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		String appName = arg2;
		managerpage.selectTier(arg1, appName);
	}
	*/
	
	@When("^I click on Subscription Details drop box for \"([^\"]*)\" row for \"([^\"]*)\"$")
	public void i_click_on_Subscription_Details_drop_box_for_row_for(String arg1, String arg2) throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		String appName = arg1;
		managerpage.clickSubscriptionDetails(appName);
	}
	

	@Then("^I should see created application \"([^\"]*)\" is removed from the Approval Tasks table for \"([^\"]*)\"$")
	public void i_should_see_created_application_is_removed_from_the_Approval_Tasks_table_for(String arg1, String arg2) throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		String appName = arg1;
		Thread.sleep(sleepTime);
		Assert.assertTrue("App name is visible in the area", managerpage.isSubscriptionTaskRemoved(appName));
		
	}
	
}
