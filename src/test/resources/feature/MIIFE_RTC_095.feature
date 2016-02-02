Feature: Validate Adding a range of numbers as Whitelist Numbers

@Smoke
Scenario Outline: Check if a range of numbers can be added to whitelist
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
Then I should see apimanager Manager APIwise Whitelist page header as "<whitelistPageHeader>"
When I click on whitelist subscriber drop box
And I select "<usertype>" as subscriber
And I click on whitelist application drop box
And I select "<appname>" as Application
And I click on whitelist API drop box
And I select "<API>" as whitelist API
And I select Whitelist numbers range radio button
And I enter "<MinNumber>" as Min Number
And I enter "<MaxNumber>" as Max Number
And I click on whitelist Upload Number List button
#System throwing an error, might need to re-write below step
Then I should see success pop up
When I click on apimanager Manager page Whitelist tab
And I select Upload White list number list radio button
And I click whitelist Add Number List button
Then I should see the pop up to enter the numbers as "<EnterNumberList>" 
When I enter the number list as "<NumberList>"
When I click on add number list pop up ok button
Then I should see success pop up


Examples:
| usertype|API |whitelistPageHeader|appname|MinNumber  |MaxNumber  |EnterNumberList                                    |NumberList             |
|LOGOUT   |USSD|APIwise Whitelist  |test1  |94778123450|94778123460|Please enter whitelist numbers Separated with comma|94778123412,94778123414|