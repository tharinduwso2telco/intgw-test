Feature: Check if users can self register on the API Store

@Smoke
Scenario Outline: Check if users can self register on the API Store
Given I am in apimanager
When I click on apimanager sign-up button
Then I should see the apimanager sign-up for a new account form
When I enter apimanager Sign-up for a new account username as "<username>" 
And I enter apimanager Sign-up for a new account Password as "<Password>"
And I enter apimanager Sign-up for a new account Re-type password as "<RetypePword>"
And I enter apimanager Sign-up for a new account Last name as "<LastName>"
And I enter apimanager Sign-up for a new account First name as "<FirstName>"
And I enter apimanager Sign-up for a new account Email as "<Email>"
And I click on apimanager Sign-up for a new account submit button 
Then I should see the apimanager Sign-up for a new account success pop up with "User added successfully. You can now sign into the API store using the new user account".
When I click on apimanager Sign-up for a new account success pop up ok button
And I click on apimanager login
Then I should see the apimanager Login pop up
When I enter apimanager Login username as "<username>" and password as "<Password>" 
And I click on apimanager Login pop up login button
Then I should see apimanager "<username>" at the top right corner of the page
When I click on arrow after the apimanager username 
And I click on apimanager logout button 
Then I should see the apimanager login and sign-up buttons at the top right corner of the page

Examples:
| username     |Password |RetypePword|LastName|FirstName|Email|
|AuxTestUser006|1qaz2wsx@|1qaz2wsx@|AuxTestLast|AuxTestFirst|AuxTest123@gmail.com|

