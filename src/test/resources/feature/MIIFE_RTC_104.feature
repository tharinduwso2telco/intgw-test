Feature: Validate Monthly Invoice


@Smoke
Scenario Outline: Check if Monthly Invoice is loaded with data accurately based on different charge type
Given I am in apimanger carbon login page
When I enter identity server username credentials
And I click on identity server sign in
Then I should see the ids Home page header as "WSO2 API Manager Home"
When I click on identity server Main tab
And I click on identity server Resources Browse link
Then I should see the identity server Resources Browse page header as "Browse"
When I search rate card by providing "/_system/governance/apimgt/applicationdata/rate-card.xml" location
Then I should be able to search rate card
When I click on rate card display as text link
When I close the browser
And I am in apimanager
When I click on apimanager login
Then I should see the apimanager "Login" pop up
When I enter apimanager Login username and password for "<usertype>" 
And I click on apimanager Login pop up login button
Then I should see apimanager "<usertype>" at the top right corner of the page
When I click on apimanager Manage 
Then I should see the apimanager Manager page header as "Manager"
When I enter apimanager Manager page admin username credentials
And I click on apimanager Manager page login button
Then I should see the apimanager Manager Home page header as "Home"
And I should see apimanager Manager Home Billing Workflow Blacklist Whitelist tabs
When I click on apimanager Manager page Billing and Metering tab
Then I should see apimanager Manager Total API Traffic page header as "<apiTrafficPageHeader>"
When I click on Monthly Invoice menu item
Then I should see apimanager Manager Monthly Invoice page header as "<monthlyInvoicePageHeader>"
When I select "<year>" as Monthly Invoice Year
And I select "<month>" as Monthly Invoice Month
And I select "<serviceProvider>" as the Monthly Invoice service provider
And I click on generate button
Then I should see the generated Billing Summary of Monthly Invoice


Examples:
| usertype|apiTrafficPageHeader|monthlyInvoicePageHeader|year|month|serviceProvider|
|LOGOUT   |Total API Traffic|Monthly Invoice|2015|November|admin|


#MIIFE_RTC_105
Scenario Outline: Check if Monthly Invoice is loaded with data accurately based on different charge type
Given I am in apimanager
When I click on apimanager login
Then I should see the apimanager "Login" pop up
When I enter apimanager Login username and password for "<usertype>" 
And I click on apimanager Login pop up login button
Then I should see apimanager "<usertype>" at the top right corner of the page
When I click on apimanager Manage 
Then I should see the apimanager Manager page header as "Manager"
When I enter apimanager Manager page admin username credentials
And I click on apimanager Manager page login button
Then I should see the apimanager Manager Home page header as "Home"
And I should see apimanager Manager Home Billing Workflow Blacklist Whitelist tabs
When I click on apimanager Manager page Billing and Metering tab
Then I should see apimanager Manager Total API Traffic page header as "<apiTrafficPageHeader>"
When I click on Monthly Invoice menu item
Then I should see apimanager Manager Monthly Invoice page header as "<monthlyInvoicePageHeader>"
When I select "<year>" as Monthly Invoice Year
And I select "<month>" as Monthly Invoice Month
And I select "<serviceProvider>" as the Monthly Invoice service provider
And I click on generate button
Then I should see the generated Billing Summary of Monthly Invoice


Examples:
| usertype|apiTrafficPageHeader|monthlyInvoicePageHeader|year|month|serviceProvider|
|LOGOUT   |Total API Traffic|Monthly Invoice|2015|November|admin|


