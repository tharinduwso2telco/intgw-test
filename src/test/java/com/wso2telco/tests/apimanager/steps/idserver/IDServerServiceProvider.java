package com.wso2telco.tests.apimanager.steps.idserver;

import org.junit.Assert;

import com.wso2telco.identityserver.pageobjects.carbon.CarbonServiceProvider;
import com.wso2telco.tests.apimanager.base.BasicTestObject;
import com.wso2telco.tests.util.data.DataAuthenticationKeys;

import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;

public class IDServerServiceProvider extends BasicTestObject  {

	@Then("^I should see \"([^\"]*)\" Application in Service Providers table for \"([^\"]*)\"$")
	public void i_should_see_Application_in_Service_Providers_table_for(String arg1, String arg2) throws Throwable {
		CarbonServiceProvider csp = new CarbonServiceProvider(driver);
		String appName = config.getValue(getEnvironment() + arg2 + "user") + "_" + arg1;
		Assert.assertTrue("Application did not include in SP table",csp.isAppinSPTable(appName));	
	}
	
	@When("^I click on \"([^\"]*)\" edit link for \"([^\"]*)\"$")
	public void i_click_on_edit_link_for(String arg1, String arg2) throws Throwable {
		CarbonServiceProvider csp = new CarbonServiceProvider(driver);
		String appName = config.getValue(getEnvironment() + arg2 + "user") + "_" + arg1;
		csp.clickAppEdit(appName);
		Thread.sleep(sleepTime);
	}
	
	@Then("^I should see ids Service providers page header as \"([^\"]*)\"$")
	public void i_should_see_ids_Service_providers_page_header_as(String arg1) throws Throwable {
		CarbonServiceProvider csp = new CarbonServiceProvider(driver);
		Assert.assertTrue("Service providers page did not load properly",csp.isSPpageDisplyed(arg1));
	}
	
	@When("^I click on Inbound Authentication Configuration$")
	public void i_click_on_Inbound_Authentication_Configuration() throws Throwable {
		CarbonServiceProvider csp = new CarbonServiceProvider(driver);
		csp.clickInboundLink();
	}
	
	@When("^I click on OAuth/OpenID Connect Configuration$")
	public void i_click_on_OAuth_OpenID_Connect_Configuration() throws Throwable {
		CarbonServiceProvider csp = new CarbonServiceProvider(driver);
		csp.clickOAuthLink();
	}
	
	@When("^I click on OAth client secret show button$")
	public void i_click_on_OAth_client_secret_show_button() throws Throwable {
		CarbonServiceProvider csp = new CarbonServiceProvider(driver);
		csp.clickShow();
	}
	
	@When("^I click on Local and Outbound Authentication Configuration$")
	public void i_click_on_Local_and_Outbound_Authentication_Configuration() throws Throwable {
		CarbonServiceProvider csp = new CarbonServiceProvider(driver);
		csp.clickOutbound();
	}
	
	@When("^I select Advanced Configuration$")
	public void i_select_Advanced_Configuration() throws Throwable {
		CarbonServiceProvider csp = new CarbonServiceProvider(driver);
		csp.clickAddConfig(); 
	}
	
	@Then("^I should see Advanced Authentication Configuration for \"([^\"]*)\" page for \"([^\"]*)\"$")
	public void i_should_see_Advanced_Authentication_Configuration_for_page_for(String arg1, String arg2) throws Throwable {
		CarbonServiceProvider csp = new CarbonServiceProvider(driver);
		String appName = config.getValue(getEnvironment() + arg2 + "user") + "_" + arg1;
		Assert.assertTrue("Advanced Authentication Configuration page did not load properly", csp.isAddConfigPageDisplyed(appName));
	}
	
	@When("^I click on Add Authentication Step$")
	public void i_click_on_Add_Authentication_Step() throws Throwable {
		CarbonServiceProvider csp = new CarbonServiceProvider(driver);
		csp.clickAddAuthStep();
	}
	
	@When("^I select \"([^\"]*)\" under Local Authenticators$")
	public void i_select_under_Local_Authenticators(String arg1) throws Throwable {
		CarbonServiceProvider csp = new CarbonServiceProvider(driver);
		csp.selectAuthenticator(arg1);
		csp.clickAddAuthentication();
	}
	
	@When("^I click update$")
	public void i_click_update() throws Throwable {
		CarbonServiceProvider csp = new CarbonServiceProvider(driver);
		csp.clickUpdate();
	}
	
	@When("^I click edit in Actions$")
	public void i_click_edit_in_Actions() throws Throwable {
		CarbonServiceProvider csp = new CarbonServiceProvider(driver);
		csp.clickEdit();
	}
	
	@Then("^I should see View/Update application settings page header as \"([^\"]*)\"$")
	public void i_should_see_View_Update_application_settings_page_header_as(String arg1) throws Throwable {
		CarbonServiceProvider csp = new CarbonServiceProvider(driver);
		Assert.assertTrue("View/Update application settings page did not load properly",csp.isViewUpdatePageDisplyed(arg1));
	}
	
	@When("^I click on Code$")
	public void i_click_on_Code() throws Throwable {
		CarbonServiceProvider csp = new CarbonServiceProvider(driver);
		csp.selectCode();
	}
	
	@When("^I click on Implicit$")
	public void i_click_on_Implicit() throws Throwable {
		CarbonServiceProvider csp = new CarbonServiceProvider(driver);
		csp.selectImplicit();
	}

	@When("^I click on Password$")
	public void i_click_on_Password() throws Throwable {
		CarbonServiceProvider csp = new CarbonServiceProvider(driver);
		csp.selectPassword();
	}

	@When("^I click on Client Credential$")
	public void i_click_on_Client_Credential() throws Throwable {
		CarbonServiceProvider csp = new CarbonServiceProvider(driver);
		csp.selectClient();
	}

	@When("^I click on Refresh Token$")
	public void i_click_on_Refresh_Token() throws Throwable {
		CarbonServiceProvider csp = new CarbonServiceProvider(driver);
		csp.selectRefresh();
	}

	@When("^I click on SAML$")
	public void i_click_on_SAML() throws Throwable {
		CarbonServiceProvider csp = new CarbonServiceProvider(driver);
		csp.selectSAML();
	}

	@When("^I click on IWA-NTLM$")
	public void i_click_on_IWA_NTLM() throws Throwable {
		CarbonServiceProvider csp = new CarbonServiceProvider(driver);
		csp.selectIWA();
	}

	@When("^I click on View/Update application settings page update$")
	public void i_click_on_View_Update_application_settings_page_update() throws Throwable {
		CarbonServiceProvider csp = new CarbonServiceProvider(driver);
		csp.clickUpdate();
	}
	
	@Then("^I should see Application updated successfully pop up message as \"([^\"]*)\"$")
	public void i_should_see_Application_updated_successfully_pop_up_message_as(String arg1) throws Throwable {
		CarbonServiceProvider csp = new CarbonServiceProvider(driver);
		Assert.assertTrue("Application updated successfully message did not show properly",csp.isSuccessMessageDisplyed(arg1));
	}
	
	@Then("^I should see OAth client key$")
	public void i_should_see_OAth_client_key() throws Throwable {
		DataAuthenticationKeys auth = new DataAuthenticationKeys();
		String conKeyProd = auth.getSandboxConsumerKey();
		CarbonServiceProvider csp = new CarbonServiceProvider(driver);
		Assert.assertTrue("OAth client key did not match",csp.isClientKeyDisplyed(conKeyProd));
	}
	
	@Then("^I should see OAth client secret$")
	public void i_should_see_oath_client_secret() throws Throwable {
		DataAuthenticationKeys auth = new DataAuthenticationKeys();
		String secKeyProd = auth.getSandboxConsumerSecretKey();
		CarbonServiceProvider csp = new CarbonServiceProvider(driver);
		Assert.assertTrue("OAth client secret did not match",csp.isClientSecretDisplyed(secKeyProd));
	}
	
	@Then("^I should see \"([^\"]*)\" as call back url$")
	public void i_should_see_as_call_back_url(String arg1) throws Throwable {
		CarbonServiceProvider csp = new CarbonServiceProvider(driver);
		Assert.assertTrue("Call back URL did not show properly",csp.isCallBackURLDisplyed(arg1));
	}
}
