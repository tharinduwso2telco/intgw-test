package com.wso2telco.tests.apimanager.steps.apimanager;

import org.junit.Assert;

import com.wso2telco.apimanager.pageobjects.apihome.subscriptions.SubscriptionsPage;
import com.wso2telco.tests.apimanager.base.BasicTestObject;



import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;

public class APISubscriptionSteps extends BasicTestObject {

	
	@Then("^I should see \"([^\"]*)\" under Applications with Subscriptions$")
	public void i_should_see_under_Applications_with_Subscriptions(String arg1) throws Throwable {
	   SubscriptionsPage subpage = new SubscriptionsPage(driver);
	   Assert.assertTrue("Apps with subscription did not load properly", subpage.validateAppsWithSubscriptions(arg1));  
	}

	@When("^I enter token validity of production as \"([^\"]*)\"$")
	public void i_enter_token_validity_of_production_as(String arg1) throws Throwable {
		SubscriptionsPage subpage = new SubscriptionsPage(driver);
		subpage.enterTokenValidityProd(arg1);
	}
	
	@When("^I click generate under apimanager Subscriptions page production$")
	public void i_click_generate_under_apimanager_Subscriptions_page_production() throws Throwable {
		SubscriptionsPage subpage = new SubscriptionsPage(driver);
		subpage.clickProdGen();
	}
	
	@When("^I click generate under apimanager Subscriptions page sandbox$")
	public void i_click_generate_under_apimanager_Subscriptions_page_sandbox() throws Throwable {
		SubscriptionsPage subpage = new SubscriptionsPage(driver);
		subpage.clickSandGen();
	}
	
	@When("^I enter token validity of sandbox as \"([^\"]*)\"$")
	public void i_enter_token_validity_of_sandbox_as(String arg1) throws Throwable {
		SubscriptionsPage subpage = new SubscriptionsPage(driver);
		subpage.enterTokenValiditySand(arg1);
	}

	@Then("^I should see consumer Key of production$")
	public String i_should_see_consumer_Key_of_production() throws Throwable {
		SubscriptionsPage subpage = new SubscriptionsPage(driver);
		String conKeyProd = subpage.validateConsKeyProd();
		return conKeyProd;
	}

	@Then("^I should see consumer Secret of production$")
	public String i_should_see_consumer_Secret_of_production() throws Throwable {
		SubscriptionsPage subpage = new SubscriptionsPage(driver);
		String secKeyProd = subpage.validateSecKeyProd();
		return secKeyProd;
	}

	@Then("^I should see consumer Key of sandbox$")
	public String i_should_see_consumer_Key_of_sandbox() throws Throwable {
		SubscriptionsPage subpage = new SubscriptionsPage(driver);
		String conKeySand = subpage.validateConsKeySand();
		return conKeySand;
	}

	@Then("^consumer Secret of sandbox$")
	public String consumer_Secret_of_sandbox() throws Throwable {
		SubscriptionsPage subpage = new SubscriptionsPage(driver);
		String secKeySand = subpage.validateSecKeySand();
		return secKeySand;
	}


}
