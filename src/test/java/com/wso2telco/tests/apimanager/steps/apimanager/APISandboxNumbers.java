package com.wso2telco.tests.apimanager.steps.apimanager;

import org.junit.Assert;

import com.wso2telco.apimanager.pageobjects.apihome.sandbox.SandBoxPage;
import com.wso2telco.apimanager.pageobjects.apihome.sandbox.SandboxNumbers;
import com.wso2telco.tests.apimanager.base.BasicTestObject;
import com.wso2telco.tests.util.data.SandBoxValues;

import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;

public class APISandboxNumbers extends BasicTestObject {
	
	@Then("^I should see the apimanager sandbox Manage Numbers page header as \"([^\"]*)\"$")
	public void i_should_see_the_apimanager_sandbox_Manage_Numbers_page_header_as(String arg1) throws Throwable {
		SandboxNumbers sandboxNumbers = new SandboxNumbers(driver);
		Assert.assertTrue("Sandbox Manage numbers page did not load properly", sandboxNumbers.isSansboxManageNumberPage(arg1));
	}
	
	@When("^I clear existing \"([^\"]*)\" from the list$")
	public void i_clear_existing_from_the_list(String arg1) throws Throwable {
		SandboxNumbers sandboxNumbers = new SandboxNumbers(driver);
		sandboxNumbers.clearExistingNumber(arg1);
		Thread.sleep(sleepTime);
	}
	
	@When("^I click on add new button in manage numbers page$")
	public void i_click_on_add_new_button_in_manage_numbers_page() throws Throwable {
		SandboxNumbers sandbox = new SandboxNumbers(driver);
		sandbox.clickOnAddNewNumber();
	}
	
	@When("^I enter \"([^\"]*)\" as number$")
	public void i_enter_as_number(String arg1) throws Throwable {
		SandboxNumbers sandbox = new SandboxNumbers(driver);
		sandbox.enterNumber(arg1);
	}
	
	@When("^I click on save button in under actions column$")
	public void i_click_on_save_button_in_under_actions_column() throws Throwable {
		SandboxNumbers sandbox = new SandboxNumbers(driver);
		sandbox.clickSaveNumber();
		Thread.sleep(sleepTime);
	}

	@Then("^I should see the error message \"([^\"]*)\"$")
	public void i_should_see_the_error_message(String arg1) throws Throwable {
		SandboxNumbers sandbox = new SandboxNumbers(driver);
		Assert.assertTrue("Incorrect Error message", sandbox.isErrorMsg(arg1));
	}

	@When("^I enter description after error msg \"([^\"]*)\"$")
	public void i_enter_description_after_error_msg(String arg1) throws Throwable {
		SandboxNumbers sandbox = new SandboxNumbers(driver);
		sandbox.enterDisAfetrErrorMsg(arg1);
	}
	
	@When("^I clear the balance$")
	public void i_clear_the_balance() throws Throwable {
		SandboxNumbers sandbox = new SandboxNumbers(driver);
		sandbox.clearBalance();
	}
	
	@Then("^I should see the \"([^\"]*)\" as added number in the numbers table$")
	public void i_should_see_the_as_added_number_in_the_numbers_table(String arg1) throws Throwable {
		SandboxNumbers sandboxNumbers = new SandboxNumbers(driver);
		Assert.assertTrue("Number did not show properly", sandboxNumbers.isNumberAvailable(arg1));
	}
	
	@When("^I click \"([^\"]*)\" edit button to edit number$")
	public void i_click_edit_button_to_edit_number(String arg1) throws Throwable {
		SandboxNumbers sandbox = new SandboxNumbers(driver);
		sandbox.clickEditbtnNumber(arg1);
	}
	
	@When("^I edit \"([^\"]*)\" as number$")
	public void i_edit_as_number(String arg1) throws Throwable {
		SandboxNumbers sandbox = new SandboxNumbers(driver);
		sandbox.editNumber(arg1);
	}
	
	@When("^I enter description \"([^\"]*)\"$")
	public void i_enter_description(String arg1) throws Throwable {
		SandBoxPage sandbox = new SandBoxPage(driver);
		sandbox.enterDescription(arg1);  
	}

	@When("^I enter \"([^\"]*)\" as balance$")
	public void i_enter_as_balance(String arg1) throws Throwable {
		SandboxNumbers sandbox = new SandboxNumbers(driver);
		SandBoxValues sandboxValues = new SandBoxValues();
		sandbox.enterBalance(arg1);
		sandboxValues.setBalance(arg1);
	}

	@When("^I click on Edit save button in under actions column and raw \"([^\"]*)\"$")
	public void i_click_on_Edit_save_button_in_under_actions_column_and_raw(String arg1) throws Throwable {
		SandboxNumbers sandbox = new SandboxNumbers(driver);
		sandbox.clickEditSavebtn(arg1);
		Thread.sleep(sleepTime);
	}

	@Then("^I should not see the \"([^\"]*)\" as added number in the numbers table$")
	public void i_should_not_see_the_as_added_number_in_the_numbers_table(String arg1) throws Throwable {
		SandboxNumbers sandboxNumbers = new SandboxNumbers(driver);
		Assert.assertTrue("Number did not show properly", !sandboxNumbers.isNumberAvailable(arg1));
	}
	
	@Then("^I should see the apimanager sandbox Sender Addresses page header as \"([^\"]*)\"$")
	public void i_should_see_the_apimanager_sandbox_Sender_Addresses_page_header_as(String arg1) throws Throwable {
		SandboxNumbers sandboxNumbers = new SandboxNumbers(driver);
		Thread.sleep(sleepTime);
	    Assert.assertTrue("Sandbox Manage Sender Addresses page did not load properly", sandboxNumbers.isSandboxWelcome(arg1));
	   
	}

	@When("^I clear existing Short codes \"([^\"]*)\"$")
	public void i_clear_existing_Short_codes(String arg1) throws Throwable {
		SandboxNumbers sandbox = new SandboxNumbers(driver);
		sandbox.clearExistingShortCodes(arg1);;
		Thread.sleep(sleepTime);
	}
	
	@When("^I click on Add New button$")
	public void i_click_on_Add_New_button() throws Throwable {
		SandboxNumbers sandbox = new SandboxNumbers(driver);
		sandbox.clickAddNewShortCodebtn();
	}
	
	@When("^I enter new short code \"([^\"]*)\"$")
	public void i_enter_new_short_code(String arg1) throws Throwable {
		SandboxNumbers sandbox = new SandboxNumbers(driver);
		sandbox.addNewShortCode(arg1);
	}
	
	@When("^I click \"([^\"]*)\" edit button$")
	public void i_click_edit_button(String arg1) throws Throwable {
		SandboxNumbers sandbox = new SandboxNumbers(driver);
		sandbox.clickEditbtnShortCode(arg1);
	}
	
	@When("^I click on Edit save button in under actions column and short code \"([^\"]*)\"$")
	public void i_click_on_Edit_save_button_in_under_actions_column_and_short_code(String arg1) throws Throwable {
		SandboxNumbers sandbox = new SandboxNumbers(driver);
		sandbox.clickEditSavebtnShortCode(arg1);
		Thread.sleep(sleepTime);
	}

}
