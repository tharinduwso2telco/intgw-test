package com.wso2telco.tests.apimanager.steps.apimanager;

import org.junit.Assert;

import com.wso2telco.apimanager.pageobjects.apihome.manager.ManagerPage;
import com.wso2telco.tests.apimanager.base.BasicTestObject;

import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;

public class APIManageBillingAndMeteringSteps extends BasicTestObject {

	@When("^I click on apimanager Manager page Billing and Metering tab$")
	public void i_click_on_apimanager_Manager_page_Billing_and_Metering_tab()
			throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		managerpage.clickOnBillingandMetering();
	}

	@Then("^I should see apimanager Manager Total API Traffic page header as \"([^\"]*)\"$")
	public void i_should_see_apimanager_Manager_Total_API_Traffic_page_header_as(
			String arg1) throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		Assert.assertTrue("Total API traffic page did not appear",
				managerpage.isTotalAPITrafficPageDisplayed(arg1));
	}

	@When("^I enter \"([^\"]*)\" as Total API Traffic from date$")
	public void i_enter_as_Total_API_Traffic_from_date(String arg1)
			throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		managerpage.enterAPITrafficFromDate(arg1);
	}

	@When("^I enter \"([^\"]*)\" as Total API Traffic to date$")
	public void i_enter_as_Total_API_Traffic_to_date(String arg1)
			throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		managerpage.enterAPITrafficToDate(arg1);
	}

	@When("^I click on Total API Traffic operator drop down$")
	public void i_click_on_Total_API_Traffic_operator_drop_down()
			throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		managerpage.clickAPITrafficOperatorDropDown();
	}

	@When("^I select \"([^\"]*)\" as Total API Traffic operator$")
	public void i_select_as_Total_API_Traffic_operator(String arg1)
			throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		managerpage.selectTotalAPITrafficOperator(arg1);
	}
	
	@When("^I click on Total API Traffic service provider drop down$")
	public void i_click_on_Total_API_Traffic_service_provider_drop_down() throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		managerpage.clickAPITrafficServiceProviderDropDown();
	}
	
	@When("^I select \"([^\"]*)\" as the Total API Traffic service provider$")
	public void i_select_as_the_Total_API_Traffic_service_provider(String arg1) throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		managerpage.selectTotalAPITrafficServiceProvider(arg1);
	}
	
	@When("^I click on Total API Traffic Application drop down$")
	public void i_click_on_Total_API_Traffic_Application_drop_down() throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		managerpage.clickAPITrafficApplicationDropDown();
	}

	@When("^I select \"([^\"]*)\" as Total API Traffic application$")
	public void i_select_as_Total_API_Traffic_application(String arg1) throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		managerpage.selectTotalAPITrafficApplication(arg1);
	}
	
	@When("^I click on Total API Traffic API drop down$")
	public void i_click_on_Total_API_Traffic_API_drop_down() throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		managerpage.clickAPITrafficAPIDropDown();
	}

	@When("^I select \"([^\"]*)\" as Total API Traffic API$")
	public void i_select_as_Total_API_Traffic_API(String arg1) throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		managerpage.selectTotalAPITrafficAPI(arg1);
	}
	
	@When("^I click on generate button$")
	public void i_click_on_generate_button() throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		managerpage.clickOnGenerate();
	}

	@Then("^I should see generated Total API Traffic pie chart and the line graph$")
	public void i_should_see_generated_Total_API_Traffic_pie_chart_and_the_line_graph() throws Throwable {
	    // Write code here that turns the phrase above into concrete actions
	    
	}

}
