Feature: Validate Revenue Breakdown

@Smoke
Scenario Outline: Check if Revenue Breakdown is loaded with data accurately
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
When I click on Revenue Breakdown menu item
Then I should see apimanager Manager Revenue Breakdown page header as "<revenueBreakdownPageHeader>"
When I click on Monthly Invoice Year drop down
And I select "<year>" as Monthly Invoice Year
And I click on Monthly Invoice Month drop down
And I select "<month>" as Monthly Invoice Month
And I click on Revenue Breakdown operator drop down
And I select "<operator>" as Revenue Breakdown operator
And I click on Revenue Breakdown service provider drop down
And I select "<serviceProvider>" as the Revenue Breakdown service provider
And I click on Revenue Breakdown Application drop down
And I select "<application>" as Revenue Breakdown Application
And I click on generate button
#validate graphs
Then I should see graphs


Examples:
| usertype|
|LOGOUT   |