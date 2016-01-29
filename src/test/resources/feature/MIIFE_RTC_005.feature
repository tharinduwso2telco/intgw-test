Feature: check if the logout feature works as expected

@Smoke
Scenario Outline: check if the logout feature works as expected
Given I am in apimanager
When I click on apimanager login
Then I should see the apimanager "Login" pop up
When I enter apimanager Login username and password for "<usertype>" 
And I click on apimanager Login pop up login button
Then I should see apimanager "<usertype>" at the top right corner of the page
When I click on apimanager Manage 
Then I should see the apimanager Manager page header as "Manager"
When I enter apimanager Manager page username and password for "<usertype>"
And I click on apimanager Manager page login button
Then I should see the apimanager Manager Home page header as "Home"
When I click on apimanager Manager 
And I click on apimanager Manager logout button
Then I should see the apimanager Manager page header as "Manager"
When I click on close window
And I click on apimanager Sandbox
Then I should see the Login in apimanager Sandbox page header as "Login"
When I enter apimanager Sandbox page username and password for "<usertype>"
And I click on apimanager Sandbox page login button
Then I should see the apimanager sandbox index page header as "Welcome"
When I click on apimanager Sandbox page
And I click on apimanager Sandbox logout button
Then I should see the Login in apimanager Sandbox page header as "Login"
When I click on close window
And I click on arrow after the apimanager username 
And I click on apimanager logout button 
Then I should see the apimanager login as "Login" and sign-up buttons as "Sign-up" at the top right corner of the page

Examples:
| usertype|
|LOGOUT   |

