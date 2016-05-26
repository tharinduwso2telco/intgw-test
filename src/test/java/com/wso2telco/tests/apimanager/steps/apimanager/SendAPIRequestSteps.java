package com.wso2telco.tests.apimanager.steps.apimanager;

import com.wso2telco.apimanager.pageobjects.apihome.manager.ManagerPage;
import com.wso2telco.tests.apimanager.base.BasicTestObject;

import cucumber.api.java.en.Given;

public class SendAPIRequestSteps extends BasicTestObject {
	
	@Given("^I execute the \"([^\"]*)\" to send jmeter scripted API requests$")
	public void i_execute_the_to_send_jmeter_scripted_API_requests(String arg1) throws Throwable {
		ManagerPage managerpage = new ManagerPage(driver);
		String batFilePath = projectPath + config.getValue("batFilePath") + arg1;
		managerpage.sendAPIRequest(batFilePath);
	}

}
