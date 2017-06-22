package com.wso2telco.tests.apimanager.steps.mailinator;

import com.wso2telco.apimanager.pageobjects.mailinator.MailinatorHomePage;
import com.wso2telco.apimanager.pageobjects.mailinator.MailinatorMailPage;
import com.wso2telco.tests.apimanager.base.BasicTestObject;

import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import org.junit.Assert;


/**
 * Created by mahesh on 5/24/17.
 */
public class MailinatorStep extends BasicTestObject{

    @Given("^I am in mailinator$")
    public void i_am_in_mailinator() throws Throwable {
        // Write code here that turns the phrase above into concrete actions
        if (driver == null) {
            initialize();
            openBrowser();
            driver.get(config.getValue("mailinatorsite"));
        } else {
            driver.close();
            initialize();
            openBrowser();
            driver.get(config.getValue("mailinatorsite"));
        }

    }

    @When("^I search the mail for email \"([^\"]*)\"$")
    public void i_search_the_mail_for_email(String arg1) throws Throwable {
        // Write code here that turns the phrase above into concrete actions
        MailinatorHomePage mailinatorHomePage = new MailinatorHomePage(driver);
        MailinatorMailPage mailinatorMailPage =mailinatorHomePage.getEmailForUserAccount(config.getValue(getEnvironment()+arg1));
    }

    @When("^I click on latest email$")
    public void i_click_on_latest_email() throws Throwable {
        // Write code here that turns the phrase above into concrete actions
        MailinatorMailPage mailinatorMailPage = new MailinatorMailPage(driver);
        mailinatorMailPage.clickFirstMail();

    }

   /* @Then("^I verify email hub level Application Approval$")
    public void i_verify_email_hub_level_Application_Approval() throws Throwable {
        // Write code here that turns the phrase above into concrete actions
        MailinatorMailPage mailinatorMailPage = new MailinatorMailPage(driver);
        Assert.assertEquals("Mail Title validation fails","Application Approval Request",mailinatorMailPage.getMailTitle());
        Assert.assertEquals("Applcation user validation fails","mahesh",mailinatorMailPage.getApplicationUser());
        Assert.assertEquals("Applcation Name validation fails","TestAuto",mailinatorMailPage.getApplicationName());
        Assert.assertEquals("Applcation Tier validation fails","Default",mailinatorMailPage.getApplicationTier() );
        Assert.assertEquals("Applcation Description validation fails","des",mailinatorMailPage.getApplicationDescription() );

    }*/

    @Then("^I verify email hub level Application Approval values \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\"$")
    public void i_verify_email_hub_level_Application_Approval_values(String arg1, String arg2, String arg3, String arg4) throws Throwable {
        // Write code here that turns the phrase above into concrete actions

        MailinatorMailPage mailinatorMailPage = new MailinatorMailPage(driver);
        Assert.assertEquals("Mail Title validation fails","Application Approval Request",mailinatorMailPage.getMailTitle());
        Assert.assertEquals("Applcation user validation fails",config.getValue(getEnvironment() + arg1 + "user"),mailinatorMailPage.getApplicationUser());
        Assert.assertEquals("Applcation Name validation fails",config.getValue(arg2),mailinatorMailPage.getApplicationName());
        Assert.assertEquals("Applcation Description validation fails",arg3,mailinatorMailPage.getApplicationDescription() );
        Assert.assertEquals("Applcation Tier validation fails",arg4,mailinatorMailPage.getApplicationTier() );

    }

    @Then("^I verify email plugin level Application Approval values \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\"$")
    public void i_verify_email_plugin_level_Application_Approval_values(String arg1, String arg2, String arg3, String arg4) throws Throwable {
        // Write code here that turns the phrase above into concrete actions
        MailinatorMailPage mailinatorMailPage = new MailinatorMailPage(driver);
        Assert.assertEquals("Mail Title validation fails","Application Approval Request",mailinatorMailPage.getMailTitle());

    }


}
