package com.wso2telco.apimanager.base;
import org.junit.runner.RunWith;

import cucumber.api.CucumberOptions;
import cucumber.api.junit.Cucumber;

@RunWith(Cucumber.class)

@CucumberOptions(plugin = { "pretty","html:target/cucumber-html-report","json:target/cucumber-report.json" },
		 features = {

		"src/test/resources/feature/LOA3-USSDPIN.feature"
				
},
glue={
		"com.wso2telco.mobileconnect.base",
		"com.wso2telco.mobileconnect.steps"
},
tags = //"@smoke"
{
		"@Smoke" 
}
)
public class RunCukesTest {

}
