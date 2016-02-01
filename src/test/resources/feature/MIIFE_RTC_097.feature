Feature: Validate Adding Blacklist Numbers

@Smoke
Scenario Outline: Check if a number can be added to blacklist
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
When I click on apimanager Manager page Blacklist tab
Then I should see apimanager Manager APIwise Blacklist page header as "<blacklist pageHeader>"
When I click on API dropbox
And I select "<API>" as blacklist API
And I click on Blacklisted subscribers Add New button
Then I should see add nember alert header as "<AddNumber Alert>"
When I enter the "<BlackList Number>" to blacklist
And I click add blacklist number alert ok button
Then I should see "<BlackList Number>" in blacklisted subscribers table

Examples:
| usertype|API |BlackList Number|blacklist pageHeader|AddNumber Alert               |
|LOGOUT   |USSD|94123456898     |APIwise Blacklist   |Please enter subscriber number|

