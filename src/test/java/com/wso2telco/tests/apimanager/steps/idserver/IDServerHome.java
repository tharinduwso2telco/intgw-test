package com.wso2telco.tests.apimanager.steps.idserver;



import org.junit.Assert;

import com.wso2telco.identityserver.pageobjects.CarbonLeftNav;
import com.wso2telco.identityserver.pageobjects.carbon.CarbonHomePage;
import com.wso2telco.identityserver.pageobjects.carbon.CarbonLoginPage;
import com.wso2telco.identityserver.pageobjects.carbon.CarbonUserRoles;
import com.wso2telco.tests.apimanager.base.BasicTestObject;

import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;

public class IDServerHome extends BasicTestObject {
	
	@Given("^I am in identity server page$")
	public void i_am_in_identity_server_page() throws Throwable {
		if (driver==null){
			initialize();
			openBrowser();
			driver.get(config.getValue(getEnvironment() + "CarbonSiteName"));
		}	else {
			driver.close();
			initialize();
			openBrowser();
			driver.get(config.getValue(getEnvironment() + "CarbonSiteName"));
		}
	}
	
	@Given("^I am in apimanger carbon login page$")
	public void i_am_in_apimanger_carbon_login_page() throws Throwable {
		if (driver==null){
			initialize();
			openBrowser();
			driver.get(config.getValue(getEnvironment() + "ApiManagerCarbon"));
		}
	}

	@When("^I enter identity server username credentials$")
	public void i_enter_identity_server_username_credentials() throws Throwable {
		CarbonLoginPage carbonLogin = new CarbonLoginPage(driver);
		carbonLogin.setCarbonUsername(config.getValue(getEnvironment() + "AdminUserName"));
		carbonLogin.setCarbonPassword(config.getValue(getEnvironment() + "AdminPassword"));
	}

	@When("^I click on identity server sign in$")
	public void i_click_on_identity_server_sign_in() throws Throwable {
		CarbonLoginPage carbonLogin = new CarbonLoginPage(driver);
		carbonLogin.clickCarbonLogin();
		Thread.sleep(5000);
	}

	@Then("^I should see the ids Home page header as \"([^\"]*)\"$")
	public void i_should_see_the_ids_Home_page_header_as(String arg1) throws Throwable {
		CarbonHomePage carbonHome = new CarbonHomePage(driver);
		Assert.assertTrue("Home page did not load properly", carbonHome.isIDSHomeDisplayed(arg1));
	}

	@When("^I click on identity server Configuration tab$")
	public void i_click_on_identity_server_Configuration_tab() throws Throwable {
		CarbonHomePage carbonHome = new CarbonHomePage(driver);
		carbonHome.clickConfigure();
	}

	@When("^I click on Features")
	public void i_click_on_Features() throws Throwable{
		CarbonHomePage carbonHomePage = new CarbonHomePage(driver);
		carbonHomePage.clickFeature();
	}

	@When("^I click on Repository Management tab$")
	public void i_click_on_Repository_Management_tab() throws Throwable {
		CarbonHomePage carbonHome = new CarbonHomePage(driver);
		carbonHome.clickRepoMgt();
	}

	@When("^I click add repository button$")
	public void i_click_add_repository_button() throws Throwable {
		CarbonHomePage carbonHome = new CarbonHomePage(driver);
		carbonHome.clickAddRepo();
	}

	@When("^I set values for the repository name as \"([^\"]*)\" and url as \"([^\"]*)\"$")
	public void i_set_values_for_the_repository_as_and_url_as(String name, String url) throws Throwable {
		CarbonHomePage carbonHome = new CarbonHomePage(driver);
		carbonHome.setRepositoryValues(name, url);
	}

	@When("^I click Available Feature tab$")
	public void i_click_available_feature_tab() throws Throwable {
		CarbonHomePage carbonHome = new CarbonHomePage(driver);
		carbonHome.clickAvlblFeature();
	}

	@When("^I click find feature button$")
	public void i_click_find_feature_button() throws Throwable {
		CarbonHomePage carbonHome = new CarbonHomePage(driver);
		carbonHome.clickFindFeature();
	}

	@When("^I click api Key Manager button$")
	public void i_click_api_key_manager_button() throws Throwable {
		CarbonHomePage carbonHome = new CarbonHomePage(driver);
		carbonHome.clickApiKeyManager();
	}

	@When("^I click api Key Manager Version$")
	public void i_click_api_key_manager_version() throws Throwable {
		CarbonHomePage carbonHome = new CarbonHomePage(driver);
		carbonHome.clickApiKeyManagerVersion();
	}

	@When("^I tick api management$")
	public void i_tick_api_management() throws Throwable {
		CarbonHomePage carbonHome = new CarbonHomePage(driver);
		carbonHome.tickApiManagement();
	}

	@When("^I click install button$")
	public void i_click_install_button() throws Throwable {
		CarbonHomePage carbonHome = new CarbonHomePage(driver);
		carbonHome.clickInstall();
	}

	@When("^I continue install feature process label \"([^\"]*)\" and complete \"([^\"]*)\"")
	public void i_continue_install_feature_process_label_and_complete(String installing, String installComplete) throws Throwable {
		CarbonHomePage carbonHome = new CarbonHomePage(driver);
		carbonHome.installFeature(installing, installComplete);
	}

	@When("^I click on identity server Main tab$")
	public void i_click_on_identity_server_Main_tab() throws Throwable {
		CarbonHomePage carbonHome = new CarbonHomePage(driver);
		carbonHome.clickMain();
	}
	
	@When("^I click on identity server Configuration Users and Roles List link$")
	public void i_click_on_identity_server_Configuration_Users_and_Roles_List_link() throws Throwable {
		CarbonLeftNav leftNav = new CarbonLeftNav(driver);
		leftNav.clickUserRolesList();
	}

	@Then("^I should see ids Configuration menu with first item as \"([^\"]*)\"$")
	public void i_should_see_ids_Configuration_menu_with_first_item_as(String arg1) throws Throwable {
		CarbonUserRoles carbonUserRolePage = new CarbonUserRoles(driver);
		Assert.assertTrue("Configuration tab did not load properly", carbonUserRolePage.isConfigurePage(arg1));
	}

	@When("^I click on identity server Configuration Users and Roles link$")
	public void i_click_on_identity_server_Configuration_Users_and_Roles_link() throws Throwable {
		CarbonUserRoles carbonUserRolePage = new CarbonUserRoles(driver);
		carbonUserRolePage.clickUserRoles();
	}
	
	@Then("^I should see ids Main menu \"([^\"]*)\" as the first item$")
	public void i_should_see_ids_Main_menu_as_the_first_item(String arg1) throws Throwable {
		CarbonHomePage carbonHome = new CarbonHomePage(driver);
		Assert.assertTrue("Main menu did not load properly",carbonHome.isMenuListDisplayed(arg1));
	}
	
	@When("^I click on ids Main List link$")
	public void i_click_on_ids_Main_List_link() throws Throwable {
		CarbonHomePage carbonHome = new CarbonHomePage(driver);
		carbonHome.clickList();
	}
	
	@When("^I click on identity server Resources Browse link$")
	public void i_click_on_identity_server_Resources_Browse_link() throws Throwable {
		CarbonHomePage carbonHome = new CarbonHomePage(driver);
		carbonHome.clickBrowse();
	}
	  
	@When("^I click on identity server Configuration Users and Roles Add link$")
	public void i_click_on_identity_server_Configuration_Users_and_Roles_Add_link() throws Throwable {
		CarbonLeftNav leftNav = new CarbonLeftNav(driver);
		leftNav.clickUserRolesAdd();
	}
	
	@When("^I click identity server User Management Add New User link$")
	public void i_click_identity_server_User_Management_Add_New_User_link() throws Throwable {
		CarbonUserRoles carbonUserRolePage = new CarbonUserRoles(driver);
		carbonUserRolePage.clickAddNewUser();
	}
}

