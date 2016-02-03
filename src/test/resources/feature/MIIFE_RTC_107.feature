Feature: Validate Customer Care Reports

@Smoke
Scenario Outline: Check if Customer Care report is loaded with data accurately
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
When I click on Customer Care Reports menu item
Then I should see apimanager Manager Customer Care Reports page header as "<customerCareReportsPageHeader>"
When I enter "<fromDate>" as Customer Care Reports from date
And I enter "<toDate>" as Customer Care Reports to date
And I enter "<msisdn>" as Customer Care Reports MSISDN
And I click on Customer Care Reports operator drop down
And I select "<operator>" as Customer Care Reports operator
And I click on Customer Care Reports service provider drop down
And I select "<serviceProvider>" as the Customer Care Reports service provider
And I click on Customer Care Reports Application drop down
And I select "<application>" as Customer Care Reports Application
And I click on generate button
#validate graphs
Then I should see graphs


Examples:
| usertype|
|LOGOUT   |