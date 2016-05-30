Feature: Sandbox API-Numbers

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
When I click on numbers dropdown and select manage numbers
Then I should see the apimanager sandbox Manage Numbers page header as "Manage Numbers"
When I clear existing "<Number1>" from the list
When I clear existing "<Number2>" from the list
#MIIFE_RTC_168 Check if number can be added and
#MIIFE_RTC_171 Check if required fields are validate
When I click on add new button in manage numbers page
When I enter "<Number1>" as number
And I click on save button in under actions column
Then I should see the error message "Value is required!" 
When I enter description after error msg "<Description1>"
And I clear the balance
And I click on save button in under actions column
Then I should see the error message "Value is required!"
When I enter "<Balance1>" as balance after error msg
And I click on save button in under actions column
Then I should see the "<Number1>" as added number in the numbers table 
#MIIFE_RTC_169 Check if number can be edited
When I click "<Number1>" edit button to edit number
When I edit "<Number2>" as number 
And I enter description "<Description2>" 
When I enter "<Balance2>" as balance
And I click on Edit save button in under actions column and raw "<Number1>" 
Then I should see the "<Number2>" as added number in the numbers table 
#MIIFE_RTC_172 Check if duplicate number are validated
When I click on add new button in manage numbers page
When I enter "<Number2>" as number
And I enter description "<Description2>"
When I enter "<Balance2>" as balance
And I click on save button in under actions column
Then I should see the error message "Number already exists!" 
#MIIFE_RTC_170 Check if number can be deleted
When I clear existing "<Number2>" from the list
Then I should not see the "<Number2>" as added number in the numbers table 



Examples:
|usertype |Number1	  |Number2    |Description1      |Description2      |Balance1|Balance2|
|SANDBOXNO|94771799673|94776414986|Testing short code|TESTING SHORT CODE|1000    |2000    |

