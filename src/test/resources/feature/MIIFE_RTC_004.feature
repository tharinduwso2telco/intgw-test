Feature: Check if self registered user can access only allowed modules on manage module

@Smoke
Scenario Outline: Check if self registered user can access only allowed modules on manage module
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
And I should see apimanager Manager Home and Billing tabs


Examples:
| username     |Password |
|AuxTestUser   |1qaz2wsx@|