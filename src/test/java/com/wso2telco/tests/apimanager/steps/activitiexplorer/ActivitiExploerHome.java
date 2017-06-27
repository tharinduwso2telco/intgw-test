package com.wso2telco.tests.apimanager.steps.activitiexplorer;

import com.wso2telco.apimanager.pageobjects.activitiexplorer.ActivitiExplorerHomePage;
import com.wso2telco.tests.apimanager.base.BasicTestObject;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.When;
import org.openqa.selenium.By;

/**
 * Created by ksrajith on 6/27/17.
 */
public class ActivitiExploerHome extends BasicTestObject {

    @Given("^I am in activiti explorer$")
    public void i_am_in_activiti_explorer() throws Throwable {
        if(driver == null){
            initialize();
            openBrowser();
            driver.get(config.getValue(getEnvironment() + "ActivitiExplorerUrl"));
        } else {
            driver.close();
            initialize();
            openBrowser();
            driver.get(config.getValue(getEnvironment() + "ActivitiExplorerUrl"));
        }
    }

    @When("^I enter ActivitiExplorer credentials$")
    public void i_enter_activitiExplorer_credentials() throws Throwable {
        ActivitiExplorerHomePage activitiExplorerHomePage = new ActivitiExplorerHomePage(driver);
        activitiExplorerHomePage.setActExpUsername(config.getValue(getEnvironment() + "ActExpUserName"));
        activitiExplorerHomePage.setActExpPassword(config.getValue(getEnvironment() + "ActExpPassword"));

    }

    @When("^I click on ActivitiExplorer login button$")
    public void i_click_on_ActivitiExplorer_login_button() throws Throwable {
        ActivitiExplorerHomePage actExpHome = new ActivitiExplorerHomePage(driver);
        actExpHome.clickLogin();
    }

    @When("^I click on manage icon$")
    public void i_click_on_manage_icon() throws Exception {
        ActivitiExplorerHomePage actExpHome = new ActivitiExplorerHomePage(driver);
        actExpHome.clickManageIcon();
    }

    @When("^I click on deplyments menu$")
    public void i_click_on_deplyments_menu() throws Exception {
        ActivitiExplorerHomePage actExpHome = new ActivitiExplorerHomePage(driver);
        actExpHome.clickDeploymentMenu();
    }

    @When("^I select upload new menu item$")
    public void i_select_upload_new_menu_item() throws Exception {
        ActivitiExplorerHomePage actExpHome = new ActivitiExplorerHomePage(driver);
        actExpHome.clickMenuItemUploadNew();
    }

    @When("^I set bar file name as \"([^\"]*)\"$")
    public void I_set_bar_file_name_as(String fileName) throws Exception {

        if (System.getProperty("barFileLocation") != null) {
            config.setValue(environment+"barFileLocation",System.getProperty("barFileLocation"));
        }
        ActivitiExplorerHomePage actExpHome = new ActivitiExplorerHomePage(driver);
        actExpHome.uploadBarFile(config.getValue(environment+"barFileLocation")+fileName);
    }


}
