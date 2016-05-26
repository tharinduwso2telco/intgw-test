Feature: Sandbox-ShortCode

@dataCreation
Scenario Outline: Data creation part for the Sandbox API-Numbers
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
|usertype    |LastName   		|FirstName   		|Email               |
|SANDBOXNO	 |AuxTestLastsndbxno|AuxTestFirstsndbxno|AuxTest123@gmail.com|


@Smoke
Scenario Outline: 
Given I am in apimanager
When I click on apimanager Sandbox
Then I should see the Login in apimanager Sandbox page header as "Login"
When I enter apimanager Sandbox page username and password for "<usertype>"
And I click on apimanager Sandbox page login button
Then I should see the apimanager sandbox index page header as "Welcome"
When I click on numbers dropdown and select Sender Addresses
Then I should see the apimanager sandbox Sender Addresses page header as "Manage Sender Addresses"
When I clear existing Short codes "<ShortCode1>"
And I clear existing Short codes "<ShortCode2>"
#MIIFE_RTC_173 Check if short-code can be added and
#MIIFE_RTC_176 Check if required fields are validate
And I click on Add New button
And I enter new short code "<ShortCode1>"
And I click on save button in under actions column
Then I should see the error message "Value is required!" 
When I enter description after error msg "<Description1>"
And I click on save button in under actions column
Then I should see the "<ShortCode1>" as added number in the numbers table 
#MIIFE_RTC_174 Check if short-code can be edited
When I click edit button
And I enter new short code "<ShortCode2>"
And I enter description "<Description2>"
And I click on Edit save button in under actions column
Then I should see the "<ShortCode2>" as added number in the numbers table 
#MIIFE_RTC_177 Check if duplicate shortcode are validated
When I click on Add New button
And I enter new short code "<ShortCode2>"
And I enter description "<Description2>"
And I click on save button in under actions column
Then I should see the error message "Shortcode already exists!" 
#MIIFE_RTC_175 Check if short-code can be deleted
When I clear existing Short codes "<ShortCode2>"
Then I should not see the "<ShortCode2>" as added number in the numbers table 

Examples:
|usertype |ShortCode1|ShortCode2|Description1		|Description2	   |
|SANDBOXNO|7755		 |7788		|Testing short code |TESTING SHORT CODE|
