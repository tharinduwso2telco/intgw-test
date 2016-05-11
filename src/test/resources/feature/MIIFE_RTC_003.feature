Feature: Login Valdation of a user without the aggrigator role

@dataCreation
Scenario Outline: Data creation part for user without the aggrigator role
Given I am in apimanager
When I click on apimanager sign-up button
Then I should see the apimanager sign-up for a new account form as "Sign - Up for a New Account"
When I enter apimanager Sign-up for a new account username for "<usertype>" 
And I enter apimanager Sign-up for a new account Password for "<usertype>"
And I enter apimanager Sign-up for a new account Re-type password for "<usertype>"
And I enter apimanager Sign-up for a new account Last name as "<LastName>"
And I enter apimanager Sign-up for a new account First name as "<FirstName>"
And I enter apimanager Sign-up for a new account Email as "<Email>"
And I click on apimanager Sign-up for a new account submit button 
Then I should see the apimanager Sign-up for a new account success pop up with "User added successfully. You can now sign into the API store using the new user account".
When I click on apimanager Sign-up for a new account success pop up ok button
Then I should see the apimanager "Login" pop up
When I enter apimanager Login username and password for "<usertype>" 
And I click on apimanager Login pop up login button

Examples:
|usertype         |LastName   |FirstName   |Email               |
|WITHOUTAGGRIGATOR|AuxTestLast|AuxTestFirst|AuxTest123@gmail.com|

@Smoke
Scenario Outline: Check if the users can login to all the modules in API Manager without the aggrigator role
Given I am in apimanager
When I click on apimanager login
Then I should see the apimanager "Login" pop up
When I enter apimanager Login username and password for "<usertype>" 
And I click on apimanager Login pop up login button
Then I should see apimanager "<usertype>" at the top right corner of the page
When I click on apimanager APIs module
Then I should see the apimanager APIs page header as "APIs"
When I click on apimanager My Applications
Then I should see the apimanager Application page header as "Applications"
When I click on apimanager My Subscriptions
Then I should see the apimanager Subscriptions page header as "Subscriptions"
When I click on apimanager Manage 
Then I should see the apimanager Manager page header as "Manager"
When I enter apimanager Manager page username and password for "<usertype>"
And I click on apimanager Manager page login button
Then I should see the apimanager Manager Home page header as "Home"
When I click on close window
And I am in apimanager
And I click on apimanager Sandbox
Then I should see the Login in apimanager Sandbox page header as "Login"
When I enter apimanager Sandbox page username and password for "<usertype>"
And I click on apimanager Sandbox page login button
Then I should see the apimanager sandbox index page header as "Welcome"


Examples:
| usertype        |
|WITHOUTAGGRIGATOR|