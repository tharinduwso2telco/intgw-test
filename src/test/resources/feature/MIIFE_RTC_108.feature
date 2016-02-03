Feature: Validate API Response Times

@Smoke
Scenario Outline: Check if API Response Times report is loaded with data accurately
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
Then I should see apimanager Manager Total API Traffic page header as "<apiiTrafficPageHeader>"
When I click on API Response Times menu item
Then I should see apimanager Manager API Response Times page header as "<apiResponseTimesPageHeader>"
When I enter "<fromDate>" as API Response Times from date
And I enter "<toDate>" as API Response Times to date
And I click on API Response Times operator drop down
And I select "<operator>" as API Response Times operator
And I click on API Response Times service provider drop down
And I select "<serviceProvider>" as the API Response Times service provider
And I click on API Response Times Application drop down
And I select "<application>" as API Response Times Application
And I click on API Response Times generate button
Then I should see the generated API Response Times graphs


Examples:
| usertype|
|LOGOUT   |