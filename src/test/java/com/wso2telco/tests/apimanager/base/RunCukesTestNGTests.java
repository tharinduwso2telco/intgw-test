package com.wso2telco.tests.apimanager.base;

import org.testng.annotations.Test;
import cucumber.api.CucumberOptions;
import cucumber.api.testng.AbstractTestNGCucumberTests;
import cucumber.api.testng.TestNGCucumberRunner;

//@RunWith(Cucumber.class)

@CucumberOptions(plugin = { "pretty","html:target/cucumber-html-report","json:target/cucumber-report.json" },
		 features = {
				// "src/test/resources/feature/test.feature"
				 "src/test/resources/feature/MIIFE_RTC_001.feature"
	//	"src/test/resources/feature/yalow/Authoring/"
		//"src/test/resources/feature/yalow/Authoring/"
		//"src/test/resources/feature/yalow/Authoring"

},

glue ={
		"com.wso2telco.tests.apimanager.base",
		"com.wso2telco.tests.apimanager.tests"
},
tags = {
	//"@MX-10491-5"
}

)
public class RunCukesTestNGTests extends AbstractTestNGCucumberTests {
	@Test()
	public void runCukes(){
	new TestNGCucumberRunner(getClass()).runCukes();
	}
}
