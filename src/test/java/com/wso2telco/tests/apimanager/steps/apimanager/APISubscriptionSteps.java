package com.wso2telco.tests.apimanager.steps.apimanager;

import org.junit.Assert;

import com.wso2telco.apimanager.pageobjects.apihome.subscriptions.SubscriptionsPage;
import com.wso2telco.tests.apimanager.base.BasicTestObject;

import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;

public class APISubscriptionSteps extends BasicTestObject {

	
	@Then("^I should see \"([^\"]*)\" under Applications with Subscriptions for \"([^\"]*)\"$")
	public void i_should_see_under_Applications_with_Subscriptions_for(String arg1, String arg2) throws Throwable {
	   SubscriptionsPage subpage = new SubscriptionsPage(driver);
	   //subpage.clickSelectAppDD();
	   //subpage.selectApp();
	   String appName = config.getValue(getEnvironment() + arg2 + "user") + "_" + arg1;
	   Assert.assertTrue("Apps with subscription did not load properly", subpage.isAppsWithSubscriptions(appName));  
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
		Thread.sleep(sleepTime);
	}
	
	@When("^I click generate under apimanager Subscriptions page sandbox$")
	public void i_click_generate_under_apimanager_Subscriptions_page_sandbox() throws Throwable {
		SubscriptionsPage subpage = new SubscriptionsPage(driver);
		subpage.clickSandGen();
		Thread.sleep(sleepTime);
	}
	
	@When("^I enter token validity of sandbox as \"([^\"]*)\"$")
	public void i_enter_token_validity_of_sandbox_as(String arg1) throws Throwable {
		SubscriptionsPage subpage = new SubscriptionsPage(driver);
		subpage.enterTokenValiditySand(arg1);
	}

	@Then("^I should see consumer Key of production$")
	public String i_should_see_consumer_Key_of_production() throws Throwable {
		SubscriptionsPage subpage = new SubscriptionsPage(driver);
		String conKeyProd = subpage.getConsKeyProd();
		Assert.assertTrue("Consumer key is not generated", subpage.isProductionConsumerKey());
		return conKeyProd;
	}

	@Then("^I should see consumer Secret of production$")
	public String i_should_see_consumer_Secret_of_production() throws Throwable {
		SubscriptionsPage subpage = new SubscriptionsPage(driver);
		String secKeyProd = subpage.geteSecKeyProd();
		Assert.assertTrue("Production consumer secrect key is not displayed", subpage.isProductionConsumerSecrectKey());
		return secKeyProd;
	}

	@Then("^I should see consumer Key of sandbox$")
	public String i_should_see_consumer_Key_of_sandbox() throws Throwable {
		SubscriptionsPage subpage = new SubscriptionsPage(driver);
		String conKeySand = subpage.getConsKeySand();
		Assert.assertTrue("Sandbox consumer key is not displayed", subpage.isSandboxConsumerKey());
		return conKeySand;
	}

	@Then("^I should see consumer Secret of sandbox$")
	public String i_should_see_consumer_Secret_of_sandbox() throws Throwable {
		SubscriptionsPage subpage = new SubscriptionsPage(driver);
		String secKeySand = subpage.getSecKeySand();
		Assert.assertTrue("Sandbox consumer secrect key is not displayed", subpage.isSandboxSecrectKey());
		return secKeySand;
	}


	@When("^I click regenerate under apimanager Subscriptions page production$")
	public void i_click_regenerate_under_apimanager_Subscriptions_page_production() throws Throwable {
		SubscriptionsPage subpage = new SubscriptionsPage(driver);
		subpage.clickReGenProd();
	}

	@Then("^I should see \"([^\"]*)\" as Token Validity of production$")
	public void i_should_see_as_Token_Validity_of_production(String arg1) throws Throwable {
		SubscriptionsPage subpage = new SubscriptionsPage(driver);
		Assert.assertTrue(subpage.isTokenValidityProd(arg1));
	}

	@When("^I click regenerate under apimanager Subscriptions page sandbox$")
	public void i_click_regenerate_under_apimanager_Subscriptions_page_sandbox() throws Throwable {
		SubscriptionsPage subpage = new SubscriptionsPage(driver);
		subpage.clickReGenSand();
	}

	@Then("^I should see \"([^\"]*)\" as Token Validity of sandbox$")
	public void i_should_see_as_Token_Validity_of_sandbox(String arg1) throws Throwable {
		SubscriptionsPage subpage = new SubscriptionsPage(driver);
		Assert.assertTrue(subpage.isTokenValiditySand(arg1));
	}
}
