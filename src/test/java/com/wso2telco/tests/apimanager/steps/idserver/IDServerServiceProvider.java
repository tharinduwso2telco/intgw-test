package com.wso2telco.tests.apimanager.steps.idserver;

import org.junit.Assert;

import com.wso2telco.identityserver.pageobjects.carbon.CarbonServiceProvider;
import com.wso2telco.tests.apimanager.base.BasicTestObject;

import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;

public class IDServerServiceProvider extends BasicTestObject  {

	@Then("^I should see \"([^\"]*)\" Application in Service Providers table$")
	public void i_should_see_Application_in_Service_Providers_table(String arg1) throws Throwable {
		CarbonServiceProvider csp = new CarbonServiceProvider(driver);
		Assert.assertTrue(csp.isAppinSPTable(arg1));	
	}
	
	@When("^I click on \"([^\"]*)\" edit link$")
	public void i_click_on_edit_link(String arg1) throws Throwable {
		CarbonServiceProvider csp = new CarbonServiceProvider(driver);
		csp.clickAppEdit(arg1);
	}
	
	@Then("^I should see ids Service providers page header as \"([^\"]*)\"$")
	public void i_should_see_ids_Service_providers_page_header_as(String arg1) throws Throwable {
		CarbonServiceProvider csp = new CarbonServiceProvider(driver);
		Assert.assertTrue(csp.isSPpageDisplyed(arg1));
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
	    
	}
	
	@When("^I click on Local and Outbound Authentication Configuration$")
	public void i_click_on_Local_and_Outbound_Authentication_Configuration() throws Throwable {
	    
	}
}
