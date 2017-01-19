package com.wso2telco.tests.apimanager.steps.apipublisher;



import org.junit.Assert;
import com.wso2telco.apimanager.pageobjects.apihome.applications.ApplicationsPage;
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
		}else {
			driver.close();
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
	
	@When("^I search existing API \"([^\"]*)\" \"([^\"]*)\" and delete it$")
	public void i_search_existing_API_and_delete_it(String arg1, String arg2) throws Throwable {
		APIPublisherHomePage publisherHome = new APIPublisherHomePage(driver);
		Thread.sleep(sleepTime);
		publisherHome.enterAPINameSearch(arg1);
		Thread.sleep(sleepTime);
		publisherHome.clickSearch();
		Thread.sleep(sleepTime);
		publisherHome.deleteExistingAPI(arg1, arg2);
		Thread.sleep(sleepTime);
	}

	@When("^I click on apipublisher Add link$")
	public void i_click_on_apipublisher_Add_link() throws Throwable {
		APIPublisherHomePage publisherHome = new APIPublisherHomePage(driver);
		publisherHome.clickApiAdd();
	}
	
	@When("^I click Design new API radio button$")
	public void i_click_Design_new_API_radio_button() throws Throwable {
		APIPublisherHomePage publisherHome = new APIPublisherHomePage(driver);
		publisherHome.clickDesignAPI();		
	}
	
	@When("^I click Start Creating button$")
	public void i_click_Start_Creating_button() throws Throwable {
		APIPublisherHomePage publisherHome = new APIPublisherHomePage(driver);
		publisherHome.clickStartCreating();
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
	
	@When("^I click on Resource Add button$")
	public void i_click_on_Resource_Add_button() throws Throwable {
		APIPublisherHomePage publisherHome = new APIPublisherHomePage(driver);
		publisherHome.clickResourceAdd();
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
	
	@When("^I click on Manage API link$")
	public void i_click_on_Manage_API_link() throws Throwable {
		APIPublisherHomePage publisherHome = new APIPublisherHomePage(driver);
		publisherHome.clickMangeAPI();
		Thread.sleep(5000);
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
	
	@When("^I click on Go to Overview$")
	public void i_click_on_Go_to_Overview() throws Throwable {
		APIPublisherHomePage publisherHome = new APIPublisherHomePage(driver);
		publisherHome.clickGotoOverview();
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
	
	@When("^I provide apipublisher Implement endpoint type as \"([^\"]*)\"$")
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
	
	@When("^I click on apipublisher Manage save button$")
	public void i_click_on_apipublisher_Manage_save_button() throws Throwable {
		APIPublisherHomePage publisherHome = new APIPublisherHomePage(driver);
		publisherHome.clickSaveAPI();
	}

	@Then("^I should see the status as \"([^\"]*)\"$")
	public void i_should_see_the_status_as(String arg1) throws Throwable {
		APIPublisherHomePage publisherHome = new APIPublisherHomePage(driver);
		Assert.assertTrue(publisherHome.isAPIStatusAvailable(arg1));
	}
	
	@Then("^I should see api successfully published pop up with \"([^\"]*)\"$")
	public void i_should_see_api_successfully_published_pop_up_with(String arg1) throws Throwable {
		APIPublisherHomePage publisherHome = new APIPublisherHomePage(driver);
		Assert.assertTrue(publisherHome.isPublishSuccess(arg1));
	}

	@When("^I click on pop up button Go to Overview$")
	public void i_click_on_pop_up_button_Go_to_Overview() throws Throwable {
		APIPublisherHomePage publisherHome = new APIPublisherHomePage(driver);
		publisherHome.clickPopupGoToOverview();
		Thread.sleep(sleepTime);
	}
	
	@Then("^I click on apipublisher API \"([^\"]*)\" \"([^\"]*)\"$")
	public void i_click_on_apipublisher_API(String arg1, String arg2) throws Throwable {
		APIPublisherHomePage publisherHome = new APIPublisherHomePage(driver);
		publisherHome.clickOnApi(arg1, arg2);
	}
	
	@When("^I click on Lifecycle tab$")
	public void i_click_on_Lifecycle_tab() throws Throwable {
		APIPublisherHomePage publisherHome = new APIPublisherHomePage(driver);
		publisherHome.clickLifecycle();
	}
	
	@Then("^I should see the current state of the api as \"([^\"]*)\"$")
	public void i_should_see_the_current_state_of_the_api_as(String arg1) throws Throwable {
		APIPublisherHomePage publisherHome = new APIPublisherHomePage(driver);
		Assert.assertTrue(publisherHome.checkCurrentState(arg1));
	}
	
	@Then("^I click on \"([^\"]*)\" check box$")
	public void i_click_on_check_box(String arg1) throws Throwable {
		APIPublisherHomePage publisherHome = new APIPublisherHomePage(driver);
	    publisherHome.clickApiPublishOption(arg1);
	}
	
	@Then("^I click on Publish button$")
	public void i_click_on_Publish_button() throws Throwable {
		APIPublisherHomePage publisherHome = new APIPublisherHomePage(driver);
		publisherHome.clickPublish();
	}
	
	@When("^I click on create new version button$")
	public void i_click_on_create_new_version_button() throws Throwable {
		APIPublisherHomePage publisherHome = new APIPublisherHomePage(driver);
		publisherHome.clickCreateNewVersion();
	}
	
	@When("^I provide \"([^\"]*)\"$")
	public void i_provide(String arg1) throws Throwable {
		APIPublisherHomePage publisherHome = new APIPublisherHomePage(driver);
		publisherHome.enterNewVersionNumber(arg1);
	}
	
	@When("^I click on Done button$")
	public void i_click_on_Done_button() throws Throwable {
		APIPublisherHomePage publisherHome = new APIPublisherHomePage(driver);
		publisherHome.clickDone();
	}
	
	@Then("^I search API with \"([^\"]*)\"$")
	public void i_search_API_with(String arg1) throws Throwable {
		APIPublisherHomePage publisherHome = new APIPublisherHomePage(driver);
		Thread.sleep(sleepTime);
		publisherHome.enterAPINameSearch(arg1);
		Thread.sleep(sleepTime);
		publisherHome.clickSearch();
		Thread.sleep(sleepTime);
	}


	@Then("^I delete API \"([^\"]*)\" \"([^\"]*)\"$")
	public void i_delete_API(String arg1, String arg2) throws Throwable {
		APIPublisherHomePage publisherHome = new APIPublisherHomePage(driver);
		publisherHome.deleteExistingAPI(arg1, arg2);
		Thread.sleep(sleepTime);
	}
	
	@Then("^I should see API \"([^\"]*)\" \"([^\"]*)\" with \"([^\"]*)\" state$")
	public void i_should_see_API_with_state(String arg1, String arg2, String arg3) throws Throwable {
		APIPublisherHomePage publisherHome = new APIPublisherHomePage(driver);
		Assert.assertTrue(publisherHome.checkApiState(arg1, arg2, arg3));
	}

	@Then("^I should see API \"([^\"]*)\" \"([^\"]*)\" with \"([^\"]*)\" Subscriptions$")
	public void i_should_see_API_with_Subscriptions(String arg1, String arg2, String arg3) throws Throwable {
		APIPublisherHomePage publisherHome = new APIPublisherHomePage(driver);
		Assert.assertTrue(publisherHome.checkApiUsers(arg1, arg2, arg3));
	}

	@Then("^I should see the apipublisher error popup with \"([^\"]*)\"$")
	public void i_should_see_the_apipublisher_error_popup_with(String arg1) throws Throwable {
		APIPublisherHomePage publisherHome = new APIPublisherHomePage(driver);
		Assert.assertTrue(publisherHome.isApiPublisherError(arg1));
	}

	@Then("^I click on apipublisher error popup ok button$")
	public void i_click_on_apipublisher_error_popup_ok_button() throws Throwable {
		ApplicationsPage apppage = new ApplicationsPage(driver);
		apppage.clickOk();
		Thread.sleep(sleepTime);
	}
}
