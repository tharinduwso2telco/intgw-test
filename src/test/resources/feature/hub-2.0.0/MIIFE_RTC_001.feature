Feature: Sign Up Validation 

@Smoke @SignUp
Scenario Outline: Check if users can self register on the API Store
Given I am in identity server page
When I enter identity server username credentials
And I click on identity server sign in
And I click on identity server Main tab
And I click on identity server Configuration Users and Roles List link
And I click identity server User Management Users link
And I enter identity server Search Users to Enter user name pattern as "<usertype>" 
And I click on identity server Users search button
And I click delete existing username as "<usertype>"
Then I close the browser
Given I am in apimanager
When I click on apimanager sign-up button
Then I should see the apimanager sign-up for a new account form as "Create your Account"
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
Then I should see apimanager "<usertype>" at the top right corner of the page
When I click on arrow after the apimanager username 
And I click on apimanager logout button
Then I should see the apimanager login as "Sign In" and sign-up buttons as "Sign-up" at the top right corner of the page

Examples:
|usertype|LastName   |FirstName   |Email               |
|SIGNUP	 |AuxTestLast|AuxTestFirst|AuxTest123@gmail.com|

