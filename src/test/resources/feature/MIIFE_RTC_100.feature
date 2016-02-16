Feature: Validate adding a whitelisted number as a Blabklisted number

@Smoke
Scenario Outline: Check if a number can be added as a black list number if the number is already added as a white list number
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
When I select "<usertype>" as subscriber
And I select "<appname>" as Application
And I select "<API>" as whitelist API
And I select Upload number Manually radio button
And I enter the "<WhiteListNumber>" as the number to whitelist
And I click whitelist page Upload Number button
Then I should see success pop up message as "<message>"
And I click on success pop up ok button
When I click on apimanager Manager page Blacklist tab
Then I should see apimanager Manager APIwise Blacklist page header as "<blacklistPageHeader>"
When I select "<BlackListAPI>" as blacklist API
And I click on Blacklisted subscribers Add New button
Then I should see add nember alert header as "<AddNumberAlert>"
When I enter the "<WhiteListNumber>" to blacklist
And I click add blacklist number alert ok button
Then I should see "<WhiteListNumber>" in blacklisted subscribers table

Examples:
| usertype|BlackListAPI |WhiteListNumber |whitelistPageHeader |appname|AddNumberAlert                |blacklistPageHeader |message|API|
|LOGOUT   |USSD|94123496679    |APIwise Whitelist   |AuxLogoutUser_AuxLogoutUserApp|Please enter subscriber number|APIwise Blacklist   |Whitelist Numbers Successfully Added to the system  |AuxAppTest|