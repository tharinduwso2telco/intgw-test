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
And I select "<operator>" as Total API Traffic operator
And I select "<serviceProvider>" as the Total API Traffic service provider
And I select "<application>" as Total API Traffic application
And I select "<API>" as Total API Traffic API
And I click on generate button
Then I should see the generated Total API Traffic pie chart for "<fromDate>" "<toDate>" "<operator>" "<serviceProvider>" parameters


Examples:
| usertype|apiTrafficPageHeader|fromDate  |toDate    |operator|serviceProvider|application|API|
|QA17LOG  |Total API Traffic   |2015-11-18|2015-12-23|DIALOG  |admin          |All        |All|