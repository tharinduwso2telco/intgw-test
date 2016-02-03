Feature: Validate API traffic data

@Smoke
Scenario Outline: Check if all data are loaded for total API traffic
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
When I enter "<fromDate>" as Total API Traffic from date
And I enter "<toDate>" as Total API Traffic to date
And I click on Total API Traffic operator drop down
And I select "<operator>" as Total API Traffic operator
And I click on Total API Traffic service provider drop down
And I select "<serviceProvider>" as the Total API Traffic service provider
And I click on Total API Traffic Application drop down
And I select "<application>" as Total API Traffic application
And I click on Total API Traffic API drop down
And I select "<API>" as Total API Traffic API
And I click on generate button
#validate graph
Then I should see graphs


Examples:
| usertype|
|LOGOUT   |