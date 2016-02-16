package com.wso2telco.tests.apimanager.steps.apimanager;

import org.junit.Assert;

import com.wso2telco.apimanager.pageobjects.apihome.subscriptions.SubscriptionsPage;
import com.wso2telco.tests.apimanager.base.BasicTestObject;
import com.wso2telco.tests.util.data.DataAuthenticationKeys;

import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;

public class APISubscriptionSteps extends BasicTestObject {

	
    String existingAccessTokenSand;
	
	String regenAccessTokenSand;
	
	@Then("^I should see \"([^\"]*)\" under Applications with Subscriptions for \"([^\"]*)\"$")
	public void i_should_see_under_Applications_with_Subscriptions_for(String arg1, String arg2) throws Throwable {
	   SubscriptionsPage subpage = new SubscriptionsPage(driver);
	   String appName = config.getValue(getEnvironment() + arg2 + "user") + "_" + arg1;
	   Assert.assertTrue("Apps with subscription did not load properly", subpage.isAppsWithSubscriptions(appName));  
	}
	
	@When("^I select created application \"([^\"]*)\" from the dropdown for \"([^\"]*)\"$")
	public void i_select_created_application_from_the_dropdown_for(String arg1, String arg2) throws Throwable {
		SubscriptionsPage subpage = new SubscriptionsPage(driver);
		String appName = config.getValue(getEnvironment() + arg2 + "user") + "_" + arg1;
		subpage.clickSelectAppDD(appName);
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
		DataAuthenticationKeys auth = new DataAuthenticationKeys();
		auth.setSandboxConsumerKey(conKeySand);
		Assert.assertTrue("Sandbox consumer key is not displayed", subpage.isSandboxConsumerKey());
		return conKeySand;
	}

	@Then("^I should see consumer Secret of sandbox$")
	public String i_should_see_consumer_Secret_of_sandbox() throws Throwable {
		SubscriptionsPage subpage = new SubscriptionsPage(driver);
		String secKeySand = subpage.getSecKeySand();
		DataAuthenticationKeys auth = new DataAuthenticationKeys();
		auth.setSandboxConsumerSecretKey(secKeySand);
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
	
	@Then("^I should see the excisting Access Token of Production$")
	public String i_should_see_the_excisting_Access_Token_of_Production() throws Throwable {
		SubscriptionsPage subpage = new SubscriptionsPage(driver);
		DataAuthenticationKeys authKeys = new DataAuthenticationKeys();
		String accessTokenProd = subpage.getAccessTokenProd();
		authKeys.setProductionAccessToken(accessTokenProd);
		return accessTokenProd;
	}
	
	@Then("^I should see the excisting Access Token of Sandbox$")
	public String i_should_see_the_excisting_Access_Token_of_Sandbox() throws Throwable {
		SubscriptionsPage subpage = new SubscriptionsPage(driver);
		DataAuthenticationKeys authKeys = new DataAuthenticationKeys();
		String accessTokenSand = subpage.getAccessTokenSand();
		authKeys.setSandboxAccessToken(accessTokenSand);
		return accessTokenSand;
	}
	
	@Then("^I should see the regenerated Access Token of Production$")
	public void i_should_see_the_regenerated_Access_Token_of_Production() throws Throwable {
		SubscriptionsPage subpage = new SubscriptionsPage(driver);
		DataAuthenticationKeys authKeys = new DataAuthenticationKeys();
		String regeneratedAccessTokenProd = subpage.getAccessTokenProd();
		authKeys.setProducionRegenerateAcessToken(regeneratedAccessTokenProd);
	}
	
	@Then("^I should see the regenerated Access Token of production is different from the previous Access Token of production$")
	public void i_should_see_the_regenerated_Access_Token_of_production_is_different_from_the_previous_Access_Token_of_production() throws Throwable {
		DataAuthenticationKeys authKeys = new DataAuthenticationKeys();
		SubscriptionsPage subpage = new SubscriptionsPage(driver);
		String productionAccessToken = authKeys.getProductionAccessToken();
		String producionRegenerateAcessToken = authKeys.getProducionRegenerateAcessToken();
		Assert.assertTrue("Access token is not regenerated", subpage.isAccessKeyRegenerated(productionAccessToken, producionRegenerateAcessToken));
	}
	

	@Then("^I should see the regenerated Access Token of Sandbox$")
	public void i_should_see_the_regenerated_Access_Token_of_Sandbox()
			throws Throwable {
		SubscriptionsPage subpage = new SubscriptionsPage(driver);
		DataAuthenticationKeys authKeys = new DataAuthenticationKeys();
		String regeratedAccessTokenSand = subpage.getAccessTokenSand();
		authKeys.setSandboxRegenerateAccessToken(regeratedAccessTokenSand);
	}

	@Then("^I should see the regenerated Access Token of sandbox is different from the previous Access Token of sandbox$")
	public void i_should_see_the_regenerated_Access_Token_of_sandbox_is_different_from_the_previous_Access_Token_of_sandbox()
			throws Throwable {
		DataAuthenticationKeys authKeys = new DataAuthenticationKeys();
		SubscriptionsPage subpage = new SubscriptionsPage(driver);
		String sandboxAccessToken = authKeys.getSandboxAccessToken();
		String sandboxRegenerateAccessToken = authKeys.getSandboxRegenerateAccessToken();
		Assert.assertTrue("Access token is not regenerated", subpage.isAccessKeyRegenerated(sandboxAccessToken, sandboxRegenerateAccessToken));
	}

}
