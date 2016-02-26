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

	@When("^I select \"([^\"]*)\" as Total API Traffic operator$")
	public void i_select_as_Total_API_Traffic_operator(String arg1)
			throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		managerpage.selectAPITrafficOperator(arg1);
	}
	
	@When("^I select \"([^\"]*)\" as the Total API Traffic service provider$")
	public void i_select_as_the_Total_API_Traffic_service_provider(String arg1) throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		managerpage.selectTotalAPITrafficServiceProvider(arg1);
	}

	@When("^I select \"([^\"]*)\" as Total API Traffic application$")
	public void i_select_as_Total_API_Traffic_application(String arg1) throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		managerpage.selectTotalAPITrafficApplication(arg1);
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
	
	@Then("^I should see the generated Total API Traffic pie chart for \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\" parameters$")
	public void i_should_see_the_generated_Total_API_Traffic_pie_chart_for_parameters(String arg1, String arg2, String arg3, String arg4) throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		Assert.assertTrue("Pie chart numbers mismatched with DB values", managerpage.isPieGraph(arg1, arg2, arg3, arg4));
	}
	
	@When("^I click on Transaction log menu item$")
	public void i_click_on_Transaction_log_menu_item() throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		managerpage.clickOnTransactionLog();
	}
	
	@Then("^I should see apimanager Manager Transaction Log page header as \"([^\"]*)\"$")
	public void i_should_see_apimanager_Manager_Transaction_Log_page_header_as(String arg1) throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		Assert.assertTrue("Transaction Log page did not appear", managerpage.isTransactionLogPageDisplayed(arg1));
	}
	
	@When("^I enter \"([^\"]*)\" as Transaction Log from date$")
	public void i_enter_as_Transaction_Log_from_date(String arg1) throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		managerpage.enterTransactionLogFromDate(arg1);
	}
	
	@When("^I enter \"([^\"]*)\" as Transaction Log to date$")
	public void i_enter_as_Transaction_Log_to_date(String arg1) throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		managerpage.enterTransactionLogToDate(arg1);
	}

	@When("^I select \"([^\"]*)\" as Transaction Log operator$")
	public void i_select_as_Transaction_Log_operator(String arg1) throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		managerpage.selectTransactionLogOperator(arg1);
	}
	
	@When("^I select \"([^\"]*)\" as the Transaction Log service provider$")
	public void i_select_as_the_Transaction_Log_service_provider(String arg1) throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		managerpage.selectTransactionLogServiceProvider(arg1);
	}
	

	@When("^I select \"([^\"]*)\" as Transaction Log API$")
	public void i_select_as_Transaction_Log_API(String arg1) throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		managerpage.selectTransactionLogAPI(arg1);
	}
	
	@When("^I select \"([^\"]*)\" as Transaction Log Status$")
	public void i_select_as_Transaction_Log_Status(String arg1) throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		managerpage.selectTransactionLogStatus(arg1);
	}

	@When("^I click on Download report button$")
	public void i_click_on_Download_report_button() throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		managerpage.clickDownloadFile();
	}
	
	@Then("^I should see downloaded excel sheet$")
	public void i_should_see_downloaded_excel_sheet() throws Throwable {
       //enter code here
	}
	
	@When("^I click on Operator API Traffic menu item$")
	public void i_click_on_Operator_API_Traffic_menu_item() throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		managerpage.clickOperatorAPITraffic();
	}
	
	@Then("^I should see apimanager Manager Opertor API Traffic page header as \"([^\"]*)\"$")
	public void i_should_see_apimanager_Manager_Opertor_API_Traffic_page_header_as(String arg1) throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		Assert.assertTrue("Operator wise API Traffic page did not appear",
				managerpage.isOperatorAPITrafficPageDisplayed(arg1));
	}

	@When("^I enter \"([^\"]*)\" as Operator API Traffic from date$")
	public void i_enter_as_Operator_API_Traffic_from_date(String arg1) throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		managerpage.enterOperatorAPITrafficFromDate(arg1);
	}
	
	@When("^I enter \"([^\"]*)\" as Operator API Traffic to date$")
	public void i_enter_as_Operator_API_Traffic_to_date(String arg1) throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		managerpage.enterOperatorAPITrafficToDate(arg1);
	}
	
	@When("^I select \"([^\"]*)\" as the Operator API Traffic service provider$")
	public void i_select_as_the_Operator_API_Traffic_service_provider(String arg1) throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		managerpage.selectOperatorAPITrafficServiceProvider(arg1);
	}

	@When("^I select \"([^\"]*)\" as Operator API Traffic application$")
	public void i_select_as_Operator_API_Traffic_application(String arg1) throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		managerpage.selectOperatorAPITrafficApplication(arg1);
	}

	@When("^I select \"([^\"]*)\" as Operator API Traffic API$")
	public void i_select_as_Operator_API_Traffic_API(String arg1) throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		managerpage.selectOperatorAPITrafficAPI(arg1);
	}
	
	@Then("^I should see the generated Operator API Traffic pie chart$")
	public void i_should_see_the_generated_Operator_API_Traffic_pie_chart() throws Throwable {
	    // Write code here to validate the graph 
	    
	}
	
	@When("^I click on Monthly Invoice menu item$")
	public void i_click_on_Monthly_Invoice_menu_item() throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		managerpage.clickMonthlyInvoice();
	}
	
	@Then("^I should see apimanager Manager Monthly Invoice page header as \"([^\"]*)\"$")
	public void i_should_see_apimanager_Manager_Monthly_Invoice_page_header_as(String arg1) throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		Assert.assertTrue("Monthly Invoice page did not appear",
				managerpage.isMonthlyInvoicePageDisplayed(arg1));
	}
	
	@When("^I select \"([^\"]*)\" as Monthly Invoice Year$")
	public void i_select_as_Monthly_Invoice_Year(String arg1) throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		managerpage.selectMonthlyInvoiceYear(arg1);
	}
	
	@When("^I select \"([^\"]*)\" as Monthly Invoice Month$")
	public void i_select_as_Monthly_Invoice_Month(String arg1) throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		managerpage.selectMonthlyInvoiceMonth(arg1);
	}
	

	@When("^I select \"([^\"]*)\" as the Monthly Invoice service provider$")
	public void i_select_as_the_Monthly_Invoice_service_provider(String arg1)
			throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		managerpage.selectMonthlyInvoiceServiceProvider(arg1);
	}
	
	@Then("^I should see the generated Billing Summary of Monthly Invoice$")
	public void i_should_see_the_generated_Billing_Summary_of_Monthly_Invoice() throws Throwable {
	    // Write code here that turns the phrase above into concrete actions
	}
	

	@When("^I click on Revenue Breakdown menu item$")
	public void i_click_on_Revenue_Breakdown_menu_item() throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		managerpage.clickOnRvenueBreakdown();
	}
	
	@Then("^I should see apimanager Manager Revenue Breakdown page header as \"([^\"]*)\"$")
	public void i_should_see_apimanager_Manager_Revenue_Breakdown_page_header_as(String arg1) throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		Assert.assertTrue("Revenue breakdown page did not appear",
				managerpage.isRevenueBreakdownPageDisplayed(arg1));
	}
	
	@When("^I select \"([^\"]*)\" as Revenue Breakdown Year$")
	public void i_select_as_Revenue_Breakdown_Year(String arg1) throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		managerpage.selectRevenueBreakdownYear(arg1);
	}
	
	@When("^I select \"([^\"]*)\" as Revenue Breakdown Month$")
	public void i_select_as_Revenue_Breakdown_Month(String arg1) throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		managerpage.selectRevenueBreakdownMonth(arg1);
	}
	

	@When("^I select \"([^\"]*)\" as Revenue Breakdown operator$")
	public void i_select_as_Revenue_Breakdown_operator(String arg1)
			throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		managerpage.selectRevenueBreakdownOperator(arg1);
	}
	
	@When("^I select \"([^\"]*)\" as the Revenue Breakdown service provider$")
	public void i_select_as_the_Revenue_Breakdown_service_provider(String arg1) throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		managerpage.selectRevenueBreakdownServiceProvider(arg1);
	}
	
	@When("^I select \"([^\"]*)\" as Revenue Breakdown Application$")
	public void i_select_as_Revenue_Breakdown_Application(String arg1) throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		managerpage.selectRevenueBreakdownApplication(arg1);
	}
	
	@Then("^I should see the generated pie chart of Revenue Breakdown$")
	public void i_should_see_the_generated_pie_chart_of_Revenue_Breakdown() throws Throwable {
	    // Write code here that turns the phrase above into concrete actions
	}
	
	@When("^I click on Customer Care Reports menu item$")
	public void i_click_on_Customer_Care_Reports_menu_item() throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		managerpage.clickOnCustomerCare();
	}

	@Then("^I should see apimanager Manager Customer Care Reports page header as \"([^\"]*)\"$")
	public void i_should_see_apimanager_Manager_Customer_Care_Reports_page_header_as(String arg1) throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		Assert.assertTrue("Customer care page did not appear",
				managerpage.isCustomerCarePageDisplayed(arg1));
	}
	

	@When("^I enter \"([^\"]*)\" as Customer Care Reports from date$")
	public void i_enter_as_Customer_Care_Reports_from_date(String arg1)
			throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		managerpage.enterCustomerCareFromDate(arg1);
	}

	@When("^I enter \"([^\"]*)\" as Customer Care Reports to date$")
	public void i_enter_as_Customer_Care_Reports_to_date(String arg1)
			throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		managerpage.enterCustomerCareToDate(arg1);
	}

	@When("^I enter \"([^\"]*)\" as Customer Care Reports MSISDN$")
	public void i_enter_as_Customer_Care_Reports_MSISDN(String arg1)
			throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		managerpage.enterCustomerCareMSISDN(arg1);
	}

	@When("^I select \"([^\"]*)\" as Customer Care Reports operator$")
	public void i_select_as_Customer_Care_Reports_operator(String arg1)
			throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		managerpage.selectCustomerCareOperator(arg1);
	}

	@When("^I select \"([^\"]*)\" as the Customer Care Reports service provider$")
	public void i_select_as_the_Customer_Care_Reports_service_provider(
			String arg1) throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		managerpage.selectCustomerCareServiceProvider(arg1);
	}

	@When("^I select \"([^\"]*)\" as Customer Care Reports Application$")
	public void i_select_as_Customer_Care_Reports_Application(String arg1)
			throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		managerpage.selectCustomerCareApplication(arg1);
	}

	@Then("^I should see the generated Customer Care Report$")
	public void i_should_see_the_generated_Customer_Care_Report() throws Throwable {
	    //enter code here
	}
	
	@When("^I click on API Response Times menu item$")
	public void i_click_on_API_Response_Times_menu_item() throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		managerpage.clickOnAPIResponseTime();
	}
	
	@Then("^I should see apimanager Manager API Response Times page header as \"([^\"]*)\"$")
	public void i_should_see_apimanager_Manager_API_Response_Times_page_header_as(String arg1) throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		Assert.assertTrue("API Response time page did not appear",
				managerpage.isAPIResponseTimePageDisplayed(arg1));
	}
	
	@When("^I enter \"([^\"]*)\" as API Response Times from date$")
	public void i_enter_as_API_Response_Times_from_date(String arg1) throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		managerpage.enterAPIResponseTimeFromDate(arg1);
	}
	
	@When("^I enter \"([^\"]*)\" as API Response Times to date$")
	public void i_enter_as_API_Response_Times_to_date(String arg1) throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		managerpage.enterAPIResponseTimeToDate(arg1);
	}
	
	@When("^I select \"([^\"]*)\" as API Response Times operator$")
	public void i_select_as_API_Response_Times_operator(String arg1) throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		managerpage.selectAPIResponseTimesOperator(arg1);
	}
	
	@When("^I select \"([^\"]*)\" as the API Response Times service provider$")
	public void i_select_as_the_API_Response_Times_service_provider(String arg1) throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		managerpage.selectAPIResponseTimesServiceProvider(arg1);
	}
	
	@When("^I select \"([^\"]*)\" as API Response Times Application$")
	public void i_select_as_API_Response_Times_Application(String arg1) throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		managerpage.selectAPIResponseTimesApplication(arg1);
	}

	@When("^I click on API Response Times generate button$")
	public void i_click_on_API_Response_Times_generate_button() throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		managerpage.clickOnAPIResponseTimeGenerate();
	}
	
	@Then("^I should see the generated API Response Times graphs$")
	public void i_should_see_the_generated_API_Response_Times_graphs() throws Throwable {
	    // Write code here that turns the phrase above into concrete actions
	}

	@When("^I click on Performance Error Rates menu item$")
	public void i_click_on_Performance_Error_Rates_menu_item() throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		managerpage.clickOnPerformanceErrorRates();
	}

	@Then("^I should see apimanager Manager Performance Error Rates page header as \"([^\"]*)\"$")
	public void i_should_see_apimanager_Manager_Performance_Error_Rates_page_header_as(String arg1) throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		Assert.assertTrue("Performance Error Rates page did not appear",
				managerpage.isPerformanceErrorRatesPageDisplayed(arg1));
	}
	
	@When("^I enter \"([^\"]*)\" as Performance Error Rates from date$")
	public void i_enter_as_Performance_Error_Rates_from_date(String arg1) throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		managerpage.enterPerformanceErrorRatesFromDate(arg1);
	}
	
	@When("^I enter \"([^\"]*)\" as Performance Error Rates to date$")
	public void i_enter_as_Performance_Error_Rates_to_date(String arg1) throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		managerpage.enterPerformanceErrorRatesToDate(arg1);
	}
	
	@When("^I select \"([^\"]*)\" as Performance Error Rates operator$")
	public void i_select_as_Performance_Error_Rates_operator(String arg1) throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		managerpage.selectPerformanceErrorOperator(arg1);
	}
	
	@When("^I select \"([^\"]*)\" as the Performance Error Rates service provider$")
	public void i_select_as_the_Performance_Error_Rates_service_provider(String arg1) throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		managerpage.selectPerformanceErrorServiceProvider(arg1);
	}
	

	@When("^I select \"([^\"]*)\" as Performance Error Rates Application$")
	public void i_select_as_Performance_Error_Rates_Application(String arg1)
			throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		managerpage.selectPerformanceErrorApplication(arg1);
	}
	
	@When("^I select \"([^\"]*)\" as Performance Error Rates API$")
	public void i_select_as_Performance_Error_Rates_API(String arg1) throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		managerpage.selectPerformanceErrorAPI(arg1);
	}

	@Then("^I should see generated Performance Error Rates graphs$")
	public void i_should_see_generated_Performance_Error_Rates_graphs() throws Throwable {
	    // Write code here that turns the phrase above into concrete actions
	}
	
	@When("^I click on Monthly Invoice Download report button$")
	public void i_click_on_Monthly_Invoice_Download_report_button() throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		managerpage.clickOnMonthlyInvoiceDownloadReport();
	}

	@Then("^I should see the downloaded report of Monthly Invoice$")
	public void i_should_see_the_downloaded_report_of_Monthly_Invoice() throws Throwable {
	    //validate report code
	}
	
	@Then("^I should see the refunds are accurately reflected on reports of Monthly Invoice$")
	public void i_should_see_the_refunds_are_accurately_reflected_on_reports_of_Monthly_Invoice() throws Throwable {
	    // validate refunds on reports
	}
}
