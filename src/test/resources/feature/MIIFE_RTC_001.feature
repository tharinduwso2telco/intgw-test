Feature: Check if users can self register on the API Store

#Background:
@Smoke
Scenario Outline: Check if users can self register on the API Store
Given I am in ids page
When I enter ids username credentials
And I click on ids sign in
And I click on ids Configuration tab
And I click on ids Configuration Users and Roles link
And I click ids User Management Users link
And I enter ids Search Users to Enter user name pattern as "<usertype>" 
And I click on ids Users search button
And I click delete existing username as "<usertype>"
Then I close the browser
Given I am in apimanager
And I click on apimanager sign-up button
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
#And I click on apimanager login
Then I should see the apimanager "Login" pop up
When I enter apimanager Login username and password for "<usertype>" 
And I click on apimanager Login pop up login button
Then I should see apimanager "<usertype>" at the top right corner of the page
When I click on arrow after the apimanager username 
And I click on apimanager logout button
Then I should see the apimanager login as "Login" and sign-up buttons as "Sign-up" at the top right corner of the page

Examples:
|usertype|LastName   |FirstName   |Email               |
|SIGNUP	 |AuxTestLast|AuxTestFirst|AuxTest123@gmail.com|

