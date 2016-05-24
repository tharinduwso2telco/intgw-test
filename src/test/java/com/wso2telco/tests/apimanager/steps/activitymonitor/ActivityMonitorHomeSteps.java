package com.wso2telco.tests.apimanager.steps.activitymonitor;

import org.junit.Assert;

import com.wso2telco.apimanager.pageobjects.activitymanager.ActivityManagerHomePage;
import com.wso2telco.apimanager.pageobjects.activitymanager.ActivityManagerHumanTask;
import com.wso2telco.apimanager.pageobjects.activitymanager.ActivityMangerAvailableScripts;
import com.wso2telco.apimanager.pageobjects.activitymanager.ActivityMangerLoginPage;
import com.wso2telco.tests.apimanager.base.BasicTestObject;

import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;

public class ActivityMonitorHomeSteps extends BasicTestObject {

	@Given("^I am in apimanger actvity manager login page$")
	public void i_am_in_apimanger_actvity_manager_login_page() throws Throwable {
		if (driver==null){
			initialize();
			openBrowser();
			driver.get(config.getValue(getEnvironment() + "ActivityMonitor"));
		} else {
			driver.close();
			initialize();
			openBrowser();
			driver.get(config.getValue(getEnvironment() + "ActivityMonitor"));
		}
	}
	
	@When("^I close the browsers$")
	public void i_close_the_browsers() throws Throwable {
	    if (driver != null){
			driver.close();	    	
	    }
	}

	@When("^I enter apimanger actvity manager admin username credentials$")
	public void i_enter_apimanger_actvity_manager_admin_username_credentials() throws Throwable {
		ActivityMangerLoginPage loginPage = new ActivityMangerLoginPage(driver);
		loginPage.setUsername(config.getValue(getEnvironment() + "AdminUserName"));
		loginPage.setPassword(config.getValue(getEnvironment() + "AdminPassword"));
	}

	@When("^I click on apimanger actvity manager sign in$")
	public void i_click_on_apimanger_actvity_manager_sign_in() throws Throwable {
		ActivityMangerLoginPage loginPage = new ActivityMangerLoginPage(driver);
		loginPage.clickSignin();
	}

	@Then("^I should see the apimanger actvity manager Home page header as \"([^\"]*)\"$")
	public void i_should_see_the_apimanger_actvity_manager_Home_page_header_as(String arg1) throws Throwable {
		ActivityManagerHomePage homepage = new ActivityManagerHomePage(driver);
		Assert.assertTrue("Activity manager home page header mismatched", homepage.isHomePageHeader(arg1));
	}

	@When("^I click on apimanger actvity manager Main tab$")
	public void i_click_on_apimanger_actvity_manager_Main_tab() throws Throwable {
		ActivityManagerHomePage homepage = new ActivityManagerHomePage(driver);
		homepage.clickMain();
	}
	
	@When("^I click on the apimanger actvity manager Human Tasks Add link$")
	public void i_click_on_the_apimanger_actvity_manager_Human_Tasks_Add_link() throws Throwable {
		ActivityManagerHomePage homepage = new ActivityManagerHomePage(driver);
		homepage.clickHumanTaskAdd();
	}

	@When("^I click on the apimanger actvity manager Analytics List llink$")
	public void i_click_on_the_apimanger_actvity_manager_Analytics_List_llink() throws Throwable {
		ActivityManagerHomePage homepage = new ActivityManagerHomePage(driver);
		homepage.clickAnalyticsLsit();
	}

	@Then("^I should see apimanger actvity manager List page header as \"([^\"]*)\"$")
	public void i_should_see_apimanger_actvity_manager_List_page_header_as(String arg1) throws Throwable {
		ActivityMangerAvailableScripts availableScripts = new ActivityMangerAvailableScripts(driver);
		Assert.assertTrue("Available script page header mismatched", availableScripts.isAnalyticsPageHeader(arg1));
	}

	@When("^I click on the apimanger actvity manager Available scripts execute button$")
	public void i_click_on_the_apimanger_actvity_manager_Available_scripts_execute_button() throws Throwable {
		ActivityMangerAvailableScripts availableScripts = new ActivityMangerAvailableScripts(driver);
		availableScripts.clickSbAmStatsAnalyzerExecute();
	}
	
	@Then("^I should see apimanger actvity manager Human Tasks Add page header as \"([^\"]*)\"$")
	public void i_should_see_apimanger_actvity_manager_Human_Tasks_Add_page_header_as(String arg1) throws Throwable {
	    ActivityManagerHumanTask humanTask = new ActivityManagerHumanTask(driver);
		Assert.assertTrue("Human Package page header mismatched", humanTask.isAnalyticsPageHeader(arg1));
	}
	
	@When("^I select the new human task package folder from \"([^\"]*)\" as \"([^\"]*)\"$")
	public void i_select_the_new_human_task_package_folder_from_as(String arg1, String arg2) throws Throwable {
		String zipFilePath = config.getValue("uploadRateCard") + arg1 + arg2;
		ActivityManagerHumanTask humanTask = new ActivityManagerHumanTask(driver);
		humanTask.selectFile(zipFilePath);
	}

	@When("^I click on new human task upload button$")
	public void i_click_on_new_human_task_upload_button() throws Throwable {
		ActivityManagerHumanTask humanTask = new ActivityManagerHumanTask(driver);
		humanTask.clickUpload();
	}
	
	@Then("^I validate success message as \"([^\"]*)\"$")
	public void i_validate_success_message_as(String arg1) throws Throwable {
		ActivityManagerHumanTask humanTask = new ActivityManagerHumanTask(driver);
		Assert.assertTrue("File successfully uploaded", humanTask.isFileUploaded(arg1));
	}
	
}
