Feature: Check if self registered user can access only allowed modules on manage module

@Smoke
Scenario Outline: Check if self registered user can access only allowed modules on manage module
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
And I should see apimanager Manager Home and Billing tabs


Examples:
| usertype  |
|AGGRIGATOR |