package com.wso2telco.tests.apimanager.steps.apimanager;

import org.junit.Assert;

import com.wso2telco.apimanager.pageobjects.apihome.manager.ManagerPage;
import com.wso2telco.apimanager.pageobjects.db.queries.SQLQuery;
import com.wso2telco.test.framework.tools.excelfile.ExcelFileReader;
import com.wso2telco.tests.apimanager.base.BasicTestObject;
import com.wso2telco.tests.util.data.RuntimeData;

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
		Assert.assertTrue("Pie chart numbers mismatched with DB values", managerpage.isPieGraphTotalAPITraffic(arg1, arg2, arg3, arg4));
	}
	
	
	@When("^I click on Transaction log SB menu item$")
	public void i_click_on_Transaction_log_SB_menu_item() throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		managerpage.clickOnTransactionLog();
	}
	
	@Then("^I should see apimanager Manager Transaction LogSB page header as \"([^\"]*)\"$")
	public void i_should_see_apimanager_Manager_Transaction_LogSB_page_header_as(String arg1) throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		Assert.assertTrue("Transaction Log page did not appear", managerpage.isTransactionLogPageDisplayed(arg1));
	}
	
	@Then("^I should see apimanager Manager Transaction LogNB page header as \"([^\"]*)\"$")
	public void i_should_see_apimanager_Manager_Transaction_LogNB_page_header_as(String arg1) throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		Assert.assertTrue("Transaction Log page did not appear", managerpage.isTransactionLogPageDisplayed(arg1));
	}
	
	@Then("^I should check transaction log is existing in \"([^\"]*)\" named as \"([^\"]*)\" and delete$")
	public void i_should_check_transaction_log_is_existing_in_named_as_and_delete(String arg1, String arg2) throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		String csvFilePath = arg1 + arg2;
		Assert.assertTrue("Checking CSV file exists", managerpage.isCSVFileExists(csvFilePath));
	}
	
	@Then("^I should check Monthly invoice is existing in \"([^\"]*)\" named as \"([^\"]*)\" and \"([^\"]*)\" and delete$")
	public void i_should_check_Monthly_invoice_is_existing_in_named_as_and_and_delete(String arg1, String arg2, String arg3) throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		String csvFilelPath = arg1 + arg2;
		String xlsxFilelPath = arg1 + arg3;
		Assert.assertTrue("Checking and deleting existing CSV file", managerpage.isCSVFileExists(csvFilelPath));
		Assert.assertTrue("Checking and deleting existing xlsx file", managerpage.isCSVFileExists(xlsxFilelPath));
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
	
	
	@When("^I select \"([^\"]*)\" as Transaction Log Operation Type$")
	public void i_select_as_Transaction_Log_Operation_Type(String arg1) throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		managerpage.selectTransactionLogOperationType(arg1);
	}
	
	@When("^I select \"([^\"]*)\" as Transaction Log Records Type$")
	public void i_select_as_Transaction_Log_Records_Type(String arg1) throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		managerpage.selectTransactionLogRecordsType(arg1);
	}

	@When("^I click on Download report button$")
	public void i_click_on_Download_report_button() throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		managerpage.clickDownloadFile();
	}
	
	@Then("^I should see downloaded csv sheet with the \"([^\"]*)\" as path , \"([^\"]*)\" as the file name and \"([^\"]*)\" as the excel file name$")
	public void i_should_see_downloaded_csv_sheet_with_the_as_path_as_the_file_name_and_as_the_excel_file_name(String arg1, String arg2, String arg3) throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		managerpage.converCSVToXlsx(arg1, arg2, arg3);
		String excelFileName = arg1 + arg3;
		RuntimeData runtimeQuery = new RuntimeData();
		String transactionLogQuery = runtimeQuery.getRuntimeQuery();
		Assert.assertTrue("Transaction log time column validation failed", managerpage.isTransactionLogData(transactionLogQuery, excelFileName, "time", "Date & Time"));
		Assert.assertTrue("Transaction log userId column validation failed", managerpage.isTransactionLogData(transactionLogQuery, excelFileName, "userId", " Identifier - Service Provider"));
		Assert.assertTrue("Transaction log operatorId column validation failed", managerpage.isTransactionLogData(transactionLogQuery, excelFileName, "operatorId", " Operator Identifier"));
		Assert.assertTrue("Transaction log requestId column validation failed", managerpage.isTransactionLogData(transactionLogQuery, excelFileName, "requestId", " MIFE Reference Code"));
		Assert.assertTrue("Transaction log msisdn column validation failed", managerpage.isTransactionLogData(transactionLogQuery, excelFileName, "msisdn", " MSISDN"));
		Assert.assertTrue("Transaction log chargeAmount column validation failed", managerpage.isTransactionLogData(transactionLogQuery, excelFileName, "chargeAmount", " Amount"));
		Assert.assertTrue("Transaction log responseCode column validation failed", managerpage.isTransactionLogData(transactionLogQuery, excelFileName, "responseCode", " Response Code"));
		Assert.assertTrue("Transaction log purchaseCategoryCode column validation failed", managerpage.isTransactionLogData(transactionLogQuery, excelFileName, "purchaseCategoryCode", " Purchase Category Code"));
	}
	
	@When("^I click on Transaction log NB menu item$")
	public void i_click_on_Transaction_log_NB_menu_item() throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		managerpage.clickOnTransactionLogNB();
	}
	
	@When("^I prepare the transaction log query using \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\" and \"([^\"]*)\" parameters$")
	public void i_prepare_the_transaction_log_query_using_and_parameters(String arg1, String arg2, String arg3, String arg4) throws Throwable {
		String transactionQuery = String.format(SQLQuery.TRANSACTION_LOG, arg1, arg2, arg3, arg4);
		RuntimeData runtimeQuery = new RuntimeData();
		runtimeQuery.setRuntimeQuery(transactionQuery);
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
	
	@Then("^I should see the generated Operator API Traffic pie chart for \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\" parameters$")
	public void i_should_see_the_generated_Operator_API_Traffic_pie_chart_for_parameters(String arg1, String arg2, String arg3, String arg4, String arg5) throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		Assert.assertTrue("Pie chart numbers mismatched with DB values", managerpage.isPieChartOperatorAPITraffic(arg1, arg2, arg3, arg4, arg5));
	}
	
	@When("^I click on Monthly Invoice NB menu item$")
	public void i_click_on_Monthly_Invoice_NB_menu_item() throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		managerpage.clickMonthlyInvoiceNB();
	}
	
	@When("^I click on Monthly Invoice SB menu item$")
	public void i_click_on_Monthly_Invoice_SB_menu_item() throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		managerpage.clickMonthlyInvoiceSB();
	}
	
	@Then("^I should see apimanager Manager Monthly Invoice page header as \"([^\"]*)\"$")
	public void i_should_see_apimanager_Manager_Monthly_Invoice_page_header_as(String arg1) throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		Assert.assertTrue("Monthly Invoice page did not appear", managerpage.isMonthlyInvoicePageDisplayed(arg1));
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
	public void i_select_as_the_Monthly_Invoice_service_provider(String arg1) throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		managerpage.selectMonthlyInvoiceServiceProvider(arg1);
	}
	
	@Then("^I should see the generated Billing Summary of Monthly Invoice$")
	public void i_should_see_the_generated_Billing_Summary_of_Monthly_Invoice() throws Throwable {
	    // Write code here that turns the phrase above into concrete actions
	}
	
	@When("^I click on Revenue Breakdown SB menu item$")
	public void i_click_on_Revenue_Breakdown_SB_menu_item() throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		managerpage.clickOnRvenueBreakdownSB();
	}
	
	@When("^I click on Revenue Breakdown NB menu item$")
	public void i_click_on_Revenue_Breakdown_NB_menu_item() throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		managerpage.clickOnRvenueBreakdownNB();
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
	
	@When("^I prepare the OPERATOR_API_TRAFFIC query using \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\" and \"([^\"]*)\" parameters$")
	public void i_prepare_the_OPERATOR_API_TRAFFIC_query_using_and_parameters(String arg1, String arg2, String arg3, String arg4, String arg5) throws Throwable {
		String fromdate = arg1 + " 00:00:00";
		String toDate = arg2 + " 23:59:59";
		String operatorApiTraffic = String.format(SQLQuery.CUSTOMER_CARE, fromdate, toDate, arg3, arg4, arg5);
		RuntimeData runtimeQuery = new RuntimeData();
		runtimeQuery.setRuntimeQuery(operatorApiTraffic);  
	}
	
	@Then("^I should see the generated Customer Care Report$")
	public void i_should_see_the_generated_Customer_Care_Report() throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		RuntimeData runTimeQuery = new RuntimeData();
		String queryRes = runTimeQuery.getRuntimeQuery();
		Assert.assertTrue("Customer care 'Date' column mismatched", managerpage.isCustomerCareReport(queryRes, "Date", "time"));
		Assert.assertTrue("Customer care 'Json Body' column mismatched", managerpage.isCustomerCareReport(queryRes, "Json Body", "jsonBody"));
		Assert.assertTrue("Customer care 'API' column mismatched", managerpage.isCustomerCareReport(queryRes, "API", "api"));
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
		Thread.sleep(sleepTime);
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

	@Then("^I should see generated Performance Error Rates graph for \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\" parameters$")
	public void i_should_see_generated_Performance_Error_Rates_graph_for_parameters(String arg1, String arg2, String arg3, String arg4) throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		Assert.assertTrue("Pie chart numbers mismatched with DB values", managerpage.isPieGraphPerformanceErrorRates(arg1, arg2, arg3, arg4));
	}
	
	@When("^I click on Monthly Invoice Download report button$")
	public void i_click_on_Monthly_Invoice_Download_report_button() throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		managerpage.clickOnMonthlyInvoiceDownloadReport();
		Thread.sleep(sleepTime);
	}
	
	@When("^I convert \"([^\"]*)\" to \"([^\"]*)\" from \"([^\"]*)\" location$")
	public void i_convert_to_from_location(String arg1, String arg2, String arg3) throws Throwable {
		String excelPath = arg3 + arg2;
		ManagerPage managerpage = new ManagerPage(driver);
		managerpage.converCSVToXlsx(arg3, arg1, arg2);
		Thread.sleep(sleepTime);
		ExcelFileReader excelFileReader = new ExcelFileReader(excelPath, "sheet1");
		excelFileReader.removeEmptyRow("sheet1");
		Thread.sleep(sleepTime);
		RuntimeData runtimedata = new RuntimeData();
		runtimedata.setNbDownloadExcel(excelPath);
	}

	@Then("^I validate \"([^\"]*)\" \"([^\"]*)\" and \"([^\"]*)\" for \"([^\"]*)\" column with the repective value from downloaded file$")
	public void i_validate_and_for_column_with_the_repective_value_from_downloaded_file(String arg1, String arg2, String arg3, String arg4) throws Throwable {
		RuntimeData runtimedata = new RuntimeData();
		String excelFile = runtimedata.getNbDownloadExcel();
		ManagerPage managerpage = new ManagerPage(driver);
		String valueUI = managerpage.getNbValueInvoice(arg1, arg2, arg3, arg4);
		Thread.sleep(sleepTime);
		String excelColumnName = runtimedata.convertNBExcelColumnName(arg4);
		String excelValue = managerpage.getValueFromNBExcel(arg1, arg2, arg3, excelColumnName, excelFile);
		String uiValueOnlyString = managerpage.removeCurrencyType(valueUI);
		Thread.sleep(sleepTime);
		Assert.assertTrue(arg4 + " column Generated UI value - " + valueUI + " , Excel sheet value - " + excelValue, managerpage.isValidateNumbers(uiValueOnlyString, excelValue));
	}
	
	@Then("^I should see the refunds are accurately reflected on reports of Monthly Invoice$")
	public void i_should_see_the_refunds_are_accurately_reflected_on_reports_of_Monthly_Invoice() throws Throwable {
	    // validate refunds on reports
	}
	
	@When("^I copy the current URL and access it from a new browser$")
	public void i_copy_the_current_URL_and_access_it_from_a_new_browser() throws Throwable {
	    String currentUrl = driver.getCurrentUrl();
	    driver.close();
	    launchBrowser();
	    driver.get(currentUrl);
	}

	@Then("^I should see Total API Traffic as \"([^\"]*)\" under apimanager Manager Usage Reports$")
	public void i_should_see_Total_API_Traffic_as_under_apimanager_Manager_Usage_Reports(String arg1) throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		Assert.assertTrue("Total API Trsffic is not showed.", managerpage.isReportAccessing(arg1));
	}
	
	@Then("^I should see Transaction Log as \"([^\"]*)\" under apimanager Manager Usage Reports$")
	public void i_should_see_Transaction_Log_as_under_apimanager_Manager_Usage_Reports(String arg1) throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		Assert.assertTrue("Transaction Log is not showed.", managerpage.isReportAccessing(arg1));
	}
	
	@Then("^I should see Operator API Traffic as \"([^\"]*)\" under apimanager Manager Usage Reports$")
	public void i_should_see_Operator_API_Traffic_as_under_apimanager_Manager_Usage_Reports(String arg1) throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		Assert.assertTrue("Operator API Traffic is not showed.", managerpage.isReportAccessing(arg1));
	}
	
	@Then("^I should see Monthly Invoice as \"([^\"]*)\" under apimanager Manager Usage Reports$")
	public void i_should_see_Monthly_Invoice_as_under_apimanager_Manager_Usage_Reports(String arg1) throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		Assert.assertTrue("Monthly Invoice is not showed.", managerpage.isReportAccessing(arg1));
	}
	
	@Then("^I should see Cost Breakdown as \"([^\"]*)\" under apimanager Manager Usage Reports$")
	public void i_should_see_Cost_Breakdown_as_under_apimanager_Manager_Usage_Reports(String arg1) throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		Assert.assertTrue("Cost Breakdown is not showed.", managerpage.isReportAccessing(arg1));
	}
	
	@Then("^I should see API Response Times as \"([^\"]*)\" under apimanager Manager Performance Reports$")
	public void i_should_see_API_Response_Times_as_under_apimanager_Manager_Performance_Reports(String arg1) throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		Assert.assertTrue("API Response Times is not showed.", managerpage.isReportAccessing(arg1));
	}
	
	@Then("^I should see Customer care reports as \"([^\"]*)\" under apimanager Manager Usage Reports$")
	public void i_should_see_Customer_care_reports_as_under_apimanager_Manager_Usage_Reports(String arg1) throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		Assert.assertTrue("Customer care reports is not showed.", managerpage.isReportAccessing(arg1));
	}
	
	@Then("^I should see Revenue Breakdown as \"([^\"]*)\" under apimanager Manager Usage Reports$")
	public void i_should_see_Revenue_Breakdown_as_under_apimanager_Manager_Usage_Reports(String arg1) throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		Assert.assertTrue("Revenue Breakdown is not showed.", managerpage.isReportAccessing(arg1));
	}

	@Then("^I should see Customer Care as \"([^\"]*)\" under apimanager Manager Usage Reports$")
	public void i_should_see_Customer_Care_as_under_apimanager_Manager_Usage_Reports(String arg1) throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		Assert.assertTrue("Customer Care is not showed.", managerpage.isReportAccessing(arg1));
	}

	@Then("^I should see Performance Error Rates as \"([^\"]*)\" under apimanager Manager Performance Reports$")
	public void i_should_see_Performance_Error_Rates_as_under_apimanager_Manager_Performance_Reports(String arg1) throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		Assert.assertTrue("Performance Error Rates is not showed.", managerpage.isReportAccessing(arg1));
	}

	@Then("^I should see TPS Summary as \"([^\"]*)\" under apimanager Manager Performance Reports$")
	public void i_should_see_TPS_Summary_as_under_apimanager_Manager_Performance_Reports(String arg1) throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		Assert.assertTrue("TPS Summary is not showed.", managerpage.isReportAccessing(arg1));
	}

	@Then("^I should see Monthly Invoice menu item only for SB$")
	public void i_should_see_Monthly_Invoice_menu_item_only_for_SB() throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		Assert.assertTrue("Monthly invoice SB is not showed",managerpage.isMonthlyInvoiceSBShowed());
		Assert.assertTrue("Monthly invoice NB is showed",managerpage.isMonthlyInvoiceNBNotShowed());
	}
	
	@Then("^I should see Monthly Invoice menu item only for NB$")
	public void i_should_see_Monthly_Invoice_menu_item_only_for_NB() throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		Assert.assertTrue("Monthly invoice SB is not showed",managerpage.isMonthlyInvoiceSBNotShowed());
		Assert.assertTrue("Monthly invoice NB is showed",managerpage.isMonthlyInvoiceNBShowed());
	}
	
	@Then("^I should see \"([^\"]*)\" api count as \"([^\"]*)\"$")
	public void i_should_see_api_count_as(String arg1, String arg2) throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		Assert.assertTrue("Revenue Break down data not loaded accurately",managerpage.isPieGraphRevenueBreakdownSB(arg1, arg2));
	}
}
