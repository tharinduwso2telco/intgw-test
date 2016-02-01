Feature: Validate Adding Whitelist Numbers

@Smoke
Scenario Outline: Check if a number can be added to whitelist
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
When I click on apimanager Manager page Whitelist tab
Then I should see apimanager Manager APIwise Whitelist page header as "<whitelist pageHeader>"
When I click on whitelist subscriber drop box
And I select "<usertype>" as subscriber
And I select "<appname>" as Application
And I select "<API>" as whitelist API
And I select Whitelist numbers range radio button
And I enter "<Min Number>" as Min Number
And I enter "<Max Number>" as Max Number
And I click on whitelist Upload Number List button
Then I should see success pop up


Examples:
| usertype|API |whitelist pageHeader|appname|Min Number |Max Number |
|LOGOUT   |USSD|APIwise Whitelist   |test1  |94778123450|94778123460|