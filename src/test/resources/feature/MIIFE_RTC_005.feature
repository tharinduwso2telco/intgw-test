Feature: check if the logout feature works as expected

@Smoke
Scenario Outline: check if the logout feature works as expected
Given I am in apimanager
When I click on apimanager login
Then I should see the apimanager Login pop up
When I enter apimanager Login username as "<username>" and password as "<Password>" 
And I click on apimanager Login pop up login button
Then I should see apimanager "<username>" at the top right corner of the page
When I click on apimanager Manage 
Then I should see the apimanager Manager page
When I enter apimanager Manager page "<username>" as user name and "<Password>" as password
And I click on apimanager Manager page login button
Then I should see the apimanager Manager Home page
When I click on apimanager Manager "<username>" 
And I click on apimanager Manager logout button
Then I should see the apimanager Manager page
When I click on close window
And I click on apimanager Sandbox
Then I should see the Login in apimanager Sandbox page
When I enter apimanager Sandbox page "<username>" as user name and "<Password>" as password
And I click on apimanager Sandbox page login button
Then I should see the apimanager sandbox index page
When I click on apimanager Sandbox page "<username>"
And I click on apimanager Sandbox logout button
Then I should see the Login in apimanager Sandbox page
When I click on close window
And I click on arrow after the apimanager username 
And I click on apimanager logout button 
Then I should see the apimanager login and sign-up buttons at the top right corner of the page

Examples:
| username     |Password |
|AuxLogoutUser |1qaz2wsx@|

