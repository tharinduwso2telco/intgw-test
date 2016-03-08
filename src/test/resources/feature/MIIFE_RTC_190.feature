Feature: Validate token regeneration of a SP blacklisted user

@Smoke
Scenario Outline: Check if a user can regenerate a token of an application after SP blacklist
Given I am in apimanager
When I click on apimanager login
Then I should see the apimanager "Login" pop up
When I enter apimanager Login username and password for admin "<usertype>" 
And I click on apimanager Login pop up login button
Then I should see apimanager admin "<usertype>" at the top right corner of the page
When I click on apimanager Manage 
Then I should see the apimanager Manager page header as "Manager"
When I enter apimanager Manager page admin username credentials
And I click on apimanager Manager page login button
Then I should see the apimanager Manager Home page header as "Home"
And I should see apimanager Manager Home Billing Workflow Blacklist Whitelist tabs
When I click on apimanager Manager page Blacklist tab
Then I should see apimanager Manager APIwise Blacklist page header as "<blacklistPageHeader>"
When I click on SP Blacklist under Lists
Then I should see apimanager Manager SP Blacklist page header as "<SPBlacklistPageHeader>"
When I select "<appName>" as application to blacklist
And I click on SP Blacklist Blacklist button
Then I should see API Admin Module pop up header as "API Admin Module"
And I click on API Admin Module pop up ok button
Then I should see the SP Blacklist success message
When I click on close window
When I click on apimanager My Subscriptions
Then I should see the apimanager Subscriptions page header as "Subscriptions"
When I select created application "<appName>" from the dropdown for admin "<usertype>"
And I enter token validity of production as "<validity>"
And I click regenerate under apimanager Subscriptions page production
Then I should see "<validity>" as Token Validity of production
And I should see the regenerated Access Token of Production
When I enter token validity of sandbox as "<validity>"
And I click regenerate under apimanager Subscriptions page sandbox
Then I should see "<validity>" as Token Validity of sandbox
And I should see the regenerated Access Token of Sandbox


Examples:
| usertype|blacklistPageHeader |AddNumberAlert                |SPBlacklistPageHeader|appName                  |validity|
|Admin   |APIwise Blacklist   |Please enter subscriber number|SP Blacklist         |Aux_SPBlacklistApplication|-1      |














