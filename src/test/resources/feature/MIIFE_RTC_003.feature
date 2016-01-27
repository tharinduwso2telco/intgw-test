Feature: Check if the users can login to all the modules in API Manager without the aggrigator role

@Smoke
Scenario Outline: Check if the users can login to all the modules in API Manager without the aggrigator role
Given I am in apimanager
When I click on apimanager login
Then I should see the apimanager Login pop up
When I enter apimanager Login username as "<username>" and password as "<Password>" 
And I click on apimanager Login pop up login button
Then I should see apimanager "<username>" at the top right corner of the page
When I click on apimanager APIs module
Then I should see the apimanager APIs page 
When I click on apimanager My Applications
Then I should see the apimanager Application page
When I click on apimanager My Subscriptions
Then I should see the apimanager Subscriptions page
When I click on apimanager Manage 
Then I should see the apimanager Manager page
When I enter apimanager Manager page "<username>" as user name and "<Password>" as password
And I click on apimanager Manager page login button
Then I should see the apimanager Manager Home page
When I click on close window
And I am in apimanager
And I click on apimanager Sandbox
Then I should see the Login in apimanager Sandbox page
When I enter apimanager Sandbox page "<username>" as user name and "<Password>" as password
And I click on apimanager Sandbox page login button
Then I should see the apimanager sandbox index page

#J need to ask whether we can pass page names and modules as parameters

Examples:
| username          |Password |
|AuxWithoutAggregate|1qaz2wsx@|

#H Line 19 please revice step