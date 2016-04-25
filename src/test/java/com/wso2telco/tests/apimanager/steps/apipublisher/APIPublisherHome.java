package com.wso2telco.tests.apimanager.steps.apipublisher;



import org.junit.Assert;

import com.wso2telco.apimanager.pageobjects.apipublisher.APIPublisherHomePage;
import com.wso2telco.apimanager.pageobjects.apipublisher.APIPublisherLoginPage;
import com.wso2telco.apimanager.pageobjects.publisher.PublisherHomePage;
import com.wso2telco.tests.apimanager.base.BasicTestObject;

import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;

public class APIPublisherHome extends BasicTestObject{
	
	@Given("^I am in apipublisher$")
	public void i_am_in_apipublisher() throws Throwable {
		if (driver==null){
			initialize();
			openBrowser();
			driver.get(config.getValue(getEnvironment() + "ApiManagerPublisher"));
		}
	}
	
	@When("^I provide apipublisher username and password for \"([^\"]*)\"$")
	public void i_provide_apipublisher_username_and_password_for(String arg1) throws Throwable {
		APIPublisherLoginPage publisherLogin = new APIPublisherLoginPage(driver);
		publisherLogin.enterUsername(config.getValue(getEnvironment() + arg1 + "user"));
		publisherLogin.enterPassword(config.getValue(getEnvironment() + arg1 + "pwd"));
	}
	
	@When("^I click on apipublisher login button$")
	public void i_click_on_apipublisher_login_button() throws Throwable {
		APIPublisherLoginPage publisherLogin = new APIPublisherLoginPage(driver);
		publisherLogin.clickLogin();
	}
	
	@Then("^I should see apipublisher username \"([^\"]*)\" at the top right corner of the page$")
	public void i_should_see_apipublisher_username_at_the_top_right_corner_of_the_page(String arg1) throws Throwable {
		APIPublisherHomePage publisherHome = new APIPublisherHomePage(driver);
		Assert.assertTrue("Incorrect user login", publisherHome.isUserLogin(config.getValue(getEnvironment() + arg1 + "user")));
	}
	
	@When("^I search existing API \"([^\"]*)\" and delete it$")
	public void i_search_existing_API_and_delete_it(String arg1) throws Throwable {
		APIPublisherHomePage publisherHome = new APIPublisherHomePage(driver);
		Thread.sleep(sleepTime);
		publisherHome.enterAPINameSearch(arg1);
		Thread.sleep(sleepTime);
		publisherHome.clickSearch();
		Thread.sleep(sleepTime);
		publisherHome.deleteExistingAPI(arg1);
		Thread.sleep(sleepTime);
	}

	@When("^I click on apipublisher Add link$")
	public void i_click_on_apipublisher_Add_link() throws Throwable {
		APIPublisherHomePage publisherHome = new APIPublisherHomePage(driver);
		publisherHome.clickApiAdd();
	}
	
	@When("^I provide apipublisher Design name as \"([^\"]*)\"$")
	public void i_provide_apipublisher_Design_name_as(String arg1) throws Throwable {
		APIPublisherHomePage publisherHome = new APIPublisherHomePage(driver);
		publisherHome.enterAPIName(arg1);
	}
	
	@When("^I provide apipublisher Design Context as \"([^\"]*)\"$")
	public void i_provide_apipublisher_Design_Context_as(String arg1) throws Throwable {
		APIPublisherHomePage publisherHome = new APIPublisherHomePage(driver);
		publisherHome.enterAPIContext(arg1);
	}
	
	@When("^I provide apipublisher Design Version as \"([^\"]*)\"$")
	public void i_provide_apipublisher_Design_Version_as(String arg1) throws Throwable {
		APIPublisherHomePage publisherHome = new APIPublisherHomePage(driver);
		publisherHome.enterAPIVersion(arg1);
	}
	
	@When("^I provide apipublisher Design Provide URL pattern as \"([^\"]*)\"$")
	public void i_provide_apipublisher_Design_Provide_URL_pattern_as(String arg1) throws Throwable {
		APIPublisherHomePage publisherHome = new APIPublisherHomePage(driver);
		publisherHome.enterAPIUrl(arg1);
	}
	
	@When("^I click on apipublisher Design \"([^\"]*)\" checkbox$")
	public void i_click_on_apipublisher_Design_checkbox(String arg1) throws Throwable {
		APIPublisherHomePage publisherHome = new APIPublisherHomePage(driver);
		Thread.sleep(sleepTime);
		publisherHome.setUrlType(arg1);
	}
	@When("^I provide apipublisher Design Provide Resource name as \"([^\"]*)\"$")
	public void i_provide_apipublisher_Design_Provide_Resource_name_as(String arg1) throws Throwable {
		APIPublisherHomePage publisherHome = new APIPublisherHomePage(driver);
		Thread.sleep(sleepTime);
		publisherHome.enterResourceName(arg1);
	}
	
	@When("^I click on apipublisher Design Add New Resources link$")
	public void i_click_on_apipublisher_Design_Add_New_Resources_link() throws Throwable {
		APIPublisherHomePage publisherHome = new APIPublisherHomePage(driver);
		publisherHome.clickAddNewResource();
	}
	
	@When("^I click on apipublisher Design new resources link \"([^\"]*)\"$")
	public void i_click_on_apipublisher_Design_new_resources_link(String arg1) throws Throwable {
		APIPublisherHomePage publisherHome = new APIPublisherHomePage(driver);
		Thread.sleep(sleepTime);
		publisherHome.clickResource();
	}
	
	@When("^I provide apipublisher Design parameter name \"([^\"]*)\"$")
	public void i_provide_apipublisher_Design_parameter_name(String arg1) throws Throwable {
		APIPublisherHomePage publisherHome = new APIPublisherHomePage(driver);
		publisherHome.enterParameterName(arg1);
	}
	
	@When("^I click on apipublisher Design \"([^\"]*)\" button$")
	public void i_click_on_apipublisher_Design_button(String arg1) throws Throwable {
		APIPublisherHomePage publisherHome = new APIPublisherHomePage(driver);
		publisherHome.clickAddParameter(arg1);
	}
	
	@When("^I click on apipublisher Design Description \\+Empty link$")
	public void i_click_on_apipublisher_Design_Description_Empty_link() throws Throwable {
		APIPublisherHomePage publisherHome = new APIPublisherHomePage(driver);
		publisherHome.clickAddDescription();		
	}
	
	@When("^I provide apipublisher Design description as \"([^\"]*)\"$")
	public void i_provide_apipublisher_Design_description_as(String arg1) throws Throwable {
		APIPublisherHomePage publisherHome = new APIPublisherHomePage(driver);
		publisherHome.enterParameterDescription(arg1);
	}
	
	@When("^I click on apipublisher Design submit description button$")
	public void i_click_on_apipublisher_Design_submit_description_button() throws Throwable {
		APIPublisherHomePage publisherHome = new APIPublisherHomePage(driver);
		publisherHome.submitParameterDescription();
	}
	
	@When("^I click on apipublisher Design Parameter Type query link$")
	public void i_click_on_apipublisher_Design_Parameter_Type_query_link() throws Throwable {
		APIPublisherHomePage publisherHome = new APIPublisherHomePage(driver);
		publisherHome.clickParameterType();
	}
	
	@When("^I select apipublisher Design parameter type \"([^\"]*)\" from the dropdown$")
	public void i_select_apipublisher_Design_parameter_type_from_the_dropdown(String arg1) throws Throwable {
		APIPublisherHomePage publisherHome = new APIPublisherHomePage(driver);
		publisherHome.selectParameterType(arg1);
	}
	
	@When("^I click on apipublisher Design submit parameter type button$")
	public void i_click_on_apipublisher_Design_submit_parameter_type_button() throws Throwable {
		APIPublisherHomePage publisherHome = new APIPublisherHomePage(driver);
		publisherHome.submitParameterType();
	}
	
	@When("^I click on apipublisher Design Data Type \\+Empty link$")
	public void i_click_on_apipublisher_Design_Data_Type_Empty_link() throws Throwable {
		APIPublisherHomePage publisherHome = new APIPublisherHomePage(driver);
		publisherHome.clickAddDataType();
	}
	
	@When("^I provide apipublisher Design data type as \"([^\"]*)\"$")
	public void i_provide_apipublisher_Design_data_type_as(String arg1) throws Throwable {
		APIPublisherHomePage publisherHome = new APIPublisherHomePage(driver);
		publisherHome.enterDataType(arg1);
	}
	
	@When("^I click on apipublisher Design submit data type button$")
	public void i_click_on_apipublisher_Design_submit_data_type_button() throws Throwable {
		APIPublisherHomePage publisherHome = new APIPublisherHomePage(driver);
		publisherHome.submitDataType();
	}
	
	@When("^I click on apipublisher Design Required \\+Empty link$")
	public void i_click_on_apipublisher_Design_Required_Empty_link() throws Throwable {
		APIPublisherHomePage publisherHome = new APIPublisherHomePage(driver);
		publisherHome.clickAddRequired();
	}
	
	@When("^I select \"([^\"]*)\" from the apipublisher Design Required dropdown$")
	public void i_select_from_the_apipublisher_Design_Required_dropdown(String arg1) throws Throwable {
		APIPublisherHomePage publisherHome = new APIPublisherHomePage(driver);
		publisherHome.selectRequiredType(arg1);
	}
	
	@When("^I click on apipublisher Design submit Required button$")
	public void i_click_on_apipublisher_Design_submit_Required_button() throws Throwable {
		APIPublisherHomePage publisherHome = new APIPublisherHomePage(driver);
		publisherHome.submitRequiredType();
	}
	
	@When("^I click on apipublisher Design implement button$")
	public void i_click_on_apipublisher_Design_implement_button() throws Throwable {
		APIPublisherHomePage publisherHome = new APIPublisherHomePage(driver);
		publisherHome.clickImplement();
	}
	
	@When("^I provide apipublisher Implement production endpoint as \"([^\"]*)\"$")
	public void i_provide_apipublisher_Implement_production_endpoint_as(String arg1) throws Throwable {
		APIPublisherHomePage publisherHome = new APIPublisherHomePage(driver);
		publisherHome.enterProdEndpoint(arg1);
	}
	
	@When("^I provide apipublisher Implement sandbox endpoint as \"([^\"]*)\"$")
	public void i_provide_apipublisher_Implement_sandbox_endpoint_as(String arg1) throws Throwable {
		APIPublisherHomePage publisherHome = new APIPublisherHomePage(driver);
		publisherHome.enterSandboxEndpoint(arg1);
	}
	
	@When("^I click on apipublisher apipublisher manage button$")
	public void i_click_on_apipublisher_apipublisher_manage_button() throws Throwable {
		APIPublisherHomePage publisherHome = new APIPublisherHomePage(driver);
		publisherHome.clickManage();
	}
	
	@When("^I select \"([^\"]*)\" as apipublisher Manage tier availability$")
	public void i_select_as_apipublisher_Manage_tier_availability(String arg1) throws Throwable {
		APIPublisherHomePage publisherHome = new APIPublisherHomePage(driver);
		publisherHome.selectTierAvailability(arg1);
	}
	
	@When("^I click on apipublisher Manage save & publish button$")
	public void i_click_on_apipublisher_Manage_save_publish_button() throws Throwable {
		APIPublisherHomePage publisherHome = new APIPublisherHomePage(driver);
		publisherHome.clickSavePublish();
		Thread.sleep(sleepTime);
	}
	
	@Then("^I should see apipublisher production URL as \"([^\"]*)\"$")
	public void i_should_see_apipublisher_production_URL_as(String arg1) throws Throwable {
		APIPublisherHomePage publisherHome = new APIPublisherHomePage(driver);
		Assert.assertTrue("Production URL mismatched", publisherHome.isProductionUrl(arg1));
	}
	
	@Then("^I should see apipublisher sandbox URL as \"([^\"]*)\"$")
	public void i_should_see_apipublisher_sandbox_URL_as(String arg1) throws Throwable {
		APIPublisherHomePage publisherHome = new APIPublisherHomePage(driver);
		Assert.assertTrue("Production URL mismatched", publisherHome.isSandboxUrl(arg1));
	}
	
	@Then("^I should see apipublisher tier availability as \"([^\"]*)\"$")
	public void i_should_see_apipublisher_tier_availability_as(String arg1) throws Throwable {
		APIPublisherHomePage publisherHome = new APIPublisherHomePage(driver);
		Assert.assertTrue("Production URL mismatched", publisherHome.isTierAvailability(arg1));
	}
	
	@When("^I provide  apipublisher Implement endpoint type as \"([^\"]*)\"$")
	public void i_provide_apipublisher_Implement_endpoint_type_as(String arg1) throws Throwable {
		APIPublisherHomePage publisherHome = new APIPublisherHomePage(driver);
		publisherHome.selectEndpointType(arg1);
	}
	
	@When("^I enter the credentials to login \"([^\"]*)\"$")
	public void i_enter_the_credentials_to_login_and(String arg1) throws Throwable {
		APIPublisherLoginPage publisherLogin = new APIPublisherLoginPage(driver);
		publisherLogin.enterUsername(config.getValue(getEnvironment() + arg1 + "user"));
		publisherLogin.enterPassword(config.getValue(getEnvironment() + arg1 + "pwd"));
	}
	
	@Then("^I should see the apipublisher page \"([^\"]*)\" label$")
	public void i_should_see_the_apipublisher_page_label(String arg1) throws Throwable {
		PublisherHomePage publisherHome = new PublisherHomePage(driver);
		//publisherHome.getURL();
		Assert.assertTrue("API Publisher label is not displayed",publisherHome.isPublisherLoginPageLabelDisplayed(arg1));   
	}
	
	@Then("^I should see the apipublisher \"([^\"]*)\" label$")
	public void i_should_see_the_apipublisher_label(String arg1) throws Throwable {
		PublisherHomePage publisherHome = new PublisherHomePage(driver);
		Assert.assertTrue("Subscription label is not displayed",publisherHome.isPublisherPageLabelDisplayed(arg1));
	    
	}
	
	@Then("^I click on MyApis Subscriptions link$")
	public void i_click_on_MyApis_Subscriptions_link() throws Throwable {
		PublisherHomePage publisherHome = new PublisherHomePage(driver);
		publisherHome.clickSubscritionLink();
	}
	
	@Then("^I should see the apipublisher_subscription page \"([^\"]*)\" label$")
	public void i_should_see_the_apipublisher_subscription_page_label(String arg1) throws Throwable {
		PublisherHomePage publisherHome = new PublisherHomePage(driver);
		publisherHome.isSubscriptionLabelDisplayed(arg1);
	    
	}
	
	@Given("^I validate the table content for \"([^\"]*)\",\"([^\"]*)\" and \"([^\"]*)\"$")
	public void i_validate_the_table_content_for_and(String arg1, String arg2, String arg3) throws Throwable {
		PublisherHomePage publisherHome = new PublisherHomePage(driver);
		String username = config.getValue(getEnvironment() + arg1 + "user");
		Assert.assertTrue("The application nor the apis relevant to your search is listed in the table", publisherHome.isTableSubscriptions(username, arg2, arg3));
	}
}
