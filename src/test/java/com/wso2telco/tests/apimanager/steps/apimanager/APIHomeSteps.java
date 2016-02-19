package com.wso2telco.tests.apimanager.steps.apimanager;

import org.junit.Assert;

import com.wso2telco.apimanager.pageobjects.apihome.HomePage;
import com.wso2telco.apimanager.pageobjects.apihome.subscriptions.SubscriptionsPage;
import com.wso2telco.apimanager.pageobjects.login.LoginPage;
import com.wso2telco.apimanager.pageobjects.signup.SignUpPage;
import com.wso2telco.tests.apimanager.base.BasicTestObject;

import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;

public class APIHomeSteps extends BasicTestObject {
	
	@Given("^I am in apimanager$")
	public void i_am_in_apimanager() throws Throwable {
		if (driver==null){
			initialize();
			launchBrowser();
			driver.get(config.getValue(getEnvironment() + "ApiManagerSiteName"));
		}
	}

	@When("^I click on apimanager sign-up button$")
	public void i_click_on_apimanager_sign_up_button() throws Throwable {
		LoginPage loginPage = new LoginPage(driver);
		loginPage.clickSignUp();
	}
	
	@Then("^I should see the apimanager sign-up for a new account form as \"([^\"]*)\"$")
	public void i_should_see_the_apimanager_sign_up_for_a_new_account_form_as(String arg1) throws Throwable {
	    SignUpPage signupPage = new SignUpPage(driver);
		Assert.assertTrue("Sign up page did not load properly", signupPage.isSignUpHeader(arg1));
	}

	@When("^I enter apimanager Sign-up for a new account username for \"([^\"]*)\"$")
	public void i_enter_apimanager_Sign_up_for_a_new_account_username_for(String arg1) throws Throwable {
	    SignUpPage signupPage = new SignUpPage(driver);
		signupPage.enterNewUName(config.getValue(getEnvironment() + arg1 + "user"));
	}

	@When("^I enter apimanager Sign-up for a new account Password for \"([^\"]*)\"$")
	public void i_enter_apimanager_Sign_up_for_a_new_account_Password_for(String arg1) throws Throwable {
	    SignUpPage signupPage = new SignUpPage(driver);
		signupPage.enterPWord(config.getValue(getEnvironment() + arg1 + "pwd"));
	}

	@When("^I enter apimanager Sign-up for a new account Re-type password for \"([^\"]*)\"$")
	public void i_enter_apimanager_Sign_up_for_a_new_account_Re_type_password_for(String arg1) throws Throwable {
	    SignUpPage signupPage = new SignUpPage(driver);
		signupPage.reTypePWord(config.getValue(getEnvironment() + arg1 + "pwd"));
	}

	@When("^I enter apimanager Sign-up for a new account Last name as \"([^\"]*)\"$")
	public void i_enter_apimanager_Sign_up_for_a_new_account_Last_name_as(String arg1) throws Throwable {
	    SignUpPage signupPage = new SignUpPage(driver);
		signupPage.enterLName(arg1);
	}

	@When("^I enter apimanager Sign-up for a new account First name as \"([^\"]*)\"$")
	public void i_enter_apimanager_Sign_up_for_a_new_account_First_name_as(String arg1) throws Throwable {
	    SignUpPage signupPage = new SignUpPage(driver);
		signupPage.enterFName(arg1);
	}

	@When("^I enter apimanager Sign-up for a new account Email as \"([^\"]*)\"$")
	public void i_enter_apimanager_Sign_up_for_a_new_account_Email_as(String arg1) throws Throwable {
	    SignUpPage signupPage = new SignUpPage(driver);
		signupPage.enterEmail(arg1);
	}

	@When("^I click on apimanager Sign-up for a new account submit button$")
	public void i_click_on_apimanager_Sign_up_for_a_new_account_submit_button() throws Throwable {
	    SignUpPage signupPage = new SignUpPage(driver);
		signupPage.clickSubmit();
	}

	@Then("^I should see the apimanager Sign-up for a new account success pop up with \"([^\"]*)\"\\.$")
	public void i_should_see_the_apimanager_Sign_up_for_a_new_account_success_pop_up_with(String arg1) throws Throwable {
	    SignUpPage signupPage = new SignUpPage(driver);
		Assert.assertTrue("Success message did not load properly", signupPage.isUserSignupSuccessMsg(arg1));
	}

	@When("^I click on apimanager Sign-up for a new account success pop up ok button$")
	public void i_click_on_apimanager_Sign_up_for_a_new_account_success_pop_up_ok_button() throws Throwable {
	    SignUpPage signupPage = new SignUpPage(driver);
		signupPage.clickOk();
		Thread.sleep(sleepTime);
	}

	@When("^I click on apimanager login$")
	public void i_click_on_apimanager_login() throws Throwable {
	    LoginPage loginPage = new LoginPage(driver);
		loginPage.clickLogInLink();
		Thread.sleep(sleepTime);
	}

	@Then("^I should see the apimanager \"([^\"]*)\" pop up$")
	public void i_should_see_the_apimanager_pop_up(String arg1) throws Throwable {
		 LoginPage loginPage = new LoginPage(driver);
		 Assert.assertTrue("Login pop up is not displayed",loginPage.isLoginDisplayed(arg1));
	}

	@When("^I enter apimanager Login username and password for \"([^\"]*)\"$")
	public void i_enter_apimanager_Login_username_and_password_for(String arg1) throws Throwable {
	    LoginPage loginPage = new LoginPage(driver);
		loginPage.enterLoginUserName(config.getValue(getEnvironment() + arg1 + "user"));
		loginPage.enterLoginPassword(config.getValue(getEnvironment() + arg1 + "pwd"));
	}

	@When("^I click on apimanager Login pop up login button$")
	public void i_click_on_apimanager_Login_pop_up_login_button() throws Throwable {
	    LoginPage loginPage = new LoginPage(driver);
		loginPage.clickLogInButton();
	}

	@Then("^I should see apimanager \"([^\"]*)\" at the top right corner of the page$")
	public void i_should_see_apimanager_at_the_top_right_corner_of_the_page(String arg1) throws Throwable {
	    LoginPage loginPage = new LoginPage(driver);
	    Thread.sleep(sleepTime);
		Assert.assertTrue("User Name did not show properly",loginPage.isUserName(config.getValue(getEnvironment() + arg1 + "user")));
	}

	@When("^I click on arrow after the apimanager username$")
	public void i_click_on_arrow_after_the_apimanager_username() throws Throwable {
	    LoginPage loginPage = new LoginPage(driver);
		loginPage.clickOnUserName();
	}

	@When("^I click on apimanager logout button$")
	public void i_click_on_apimanager_logout_button() throws Throwable {
	    LoginPage loginPage = new LoginPage(driver);
		loginPage.clickLogout();
	}
	
	@Then("^I should see the apimanager login as \"([^\"]*)\" and sign-up buttons as \"([^\"]*)\" at the top right corner of the page$")
	public void i_should_see_the_apimanager_login_as_and_sign_up_buttons_as_at_the_top_right_corner_of_the_page(String arg1, String arg2) throws Throwable {
	    LoginPage loginPage = new LoginPage(driver);
	    Thread.sleep(sleepTime);
		Assert.assertTrue("Login button did not show properly", loginPage.isLogin(arg1));
		Assert.assertTrue("Sign up did not show properly", loginPage.isSignUp(arg2));
	}
	
	@When("^I click on apimanager APIs module$")
	public void i_click_on_apimanager_APIs_module() throws Throwable {
	    HomePage homepage = new HomePage(driver);
	    homepage.clickApiLink();
   }

	@When("^I click on apimanager My Applications$")
	public void i_click_on_apimanager_My_Applications() throws Throwable {
		HomePage homepage = new HomePage(driver);
	    homepage.clickMyApplicationsLink();
	}

	@When("^I click on apimanager My Subscriptions$")
	public void i_click_on_apimanager_My_Subscriptions() throws Throwable {
		HomePage homepage = new HomePage(driver);
	    homepage.clickMySubscriptionsLink();
	}
	     
	@Then("^I should see the apimanager Subscriptions page header as \"([^\"]*)\"$")
	public void i_should_see_the_apimanager_Subscriptions_page_header_as(String arg1) throws Throwable {
	    SubscriptionsPage subpage = new SubscriptionsPage(driver);
	    Assert.assertTrue("Subscription page did not load properly",subpage.isSubscriptionHeaderDisplayed(arg1));   
	}

	@When("^I click on apimanager Manage$")
	public void i_click_on_apimanager_Manage() throws Throwable {
		HomePage homepage = new HomePage(driver);
	    homepage.clickManageLink();
	    
	}


	@When("^I click on apimanager Sandbox$")
	public void i_click_on_apimanager_Sandbox() throws Throwable {
		HomePage homepage = new HomePage(driver);
	    homepage.clickSandBoxLink();
	}
	
	@Then("^I should see \"([^\"]*)\" message$")
	public void i_should_see_message(String arg1) throws Throwable {
		SubscriptionsPage subscroptionpage = new SubscriptionsPage(driver);
		Assert.assertTrue("No subscription mismatched", subscroptionpage.isNoSubscriptionMsg(arg1));
	}
	
}
