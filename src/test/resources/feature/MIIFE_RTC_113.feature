Feature: Validate Monthly Invoice


@Smoke
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
Then I should see apimanager Manager Total API Traffic page header as "<apiiTrafficPageHeader>"
When I click on Monthly Invoice menu item
Then I should see apimanager Manager Monthly Invoice page header as "<monthlyInvoicePageHeader>"
When I click on Monthly Invoice Year drop down
And I select "<year>" as Monthly Invoice Year
And I click on Monthly Invoice Month drop down
And I select "<month>" as Monthly Invoice Month
And I click on Monthly Invoice service provider drop down
And I select "<serviceProvider>" as the Monthly Invoice service provider
And I click on generate 
#validate graphs
Then I should see the generated Billing Summary of Monthly Invoice
When I click on Monthly Invoice Download report button
#validate downloaded report
Then I should see the downloaded report of Monthly Invoice
#validate report and graph



Examples:
| usertype|
|LOGOUT   |
