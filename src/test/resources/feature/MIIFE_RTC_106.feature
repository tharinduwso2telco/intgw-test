Feature: Validate Revenue Breakdown

@Smoke
Scenario Outline: Check if Revenue Breakdown SB is loaded with data accurately
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
When I click on Revenue Breakdown SB menu item
Then I should see apimanager Manager Revenue Breakdown page header as "<revenueBreakdownSBPageHeader>"
When I select "<year>" as Revenue Breakdown Year
And I select "<month>" as Revenue Breakdown Month
And I select "<operator>" as Revenue Breakdown operator
And I select "<serviceProvider>" as the Revenue Breakdown service provider
And I select "<application>" as Revenue Breakdown Application
And I click on generate button
Then I should see "smsmessaging" api count as "30.0" 
And I should see "location" api count as "0.0"
And I should see "payment" api count as "213.6"


Examples:
| usertype |year|month  |serviceProvider|operator|application|apiTrafficPageHeader|revenueBreakdownSBPageHeader|
|QA17LOG   |2016|January|All          |DIALOG|All|Total API Traffic|Revenue Breakdown - Southbound|


@Smoke
Scenario Outline: Check if Revenue Breakdown NB is loaded with data accurately
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
When I click on Revenue Breakdown NB menu item
Then I should see apimanager Manager Revenue Breakdown page header as "<revenueBreakdownNBPageHeader>"
When I select "<year>" as Revenue Breakdown Year
And I select "<month>" as Revenue Breakdown Month
And I select "<operator>" as Revenue Breakdown operator
And I select "<serviceProvider>" as the Revenue Breakdown service provider
And I select "<application>" as Revenue Breakdown Application
And I click on generate button
Then I should see "smsmessaging" api count as "30.0" 
And I should see "location" api count as "0.0"
And I should see "payment" api count as "213.6"


Examples:
| usertype|year|month|serviceProvider|operator|application|apiTrafficPageHeader|revenueBreakdownNBPageHeader|
|QA17LOG   |2016|March|admin|DIALOG|All|Total API Traffic|Revenue Breakdown - Northbound|