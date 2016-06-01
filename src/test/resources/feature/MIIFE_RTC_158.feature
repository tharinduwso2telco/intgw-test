Feature: Sandbox API-USSD

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
|usertype    	|LastName   		|FirstName   		|Email               |
|SANDBOXUSSD	|AuxTestLastUSSD    |AuxTestFirstUSSD   |AuxTest123@abc.com  |



@Smoke
Scenario Outline:
Given I am in apimanager
When I click on apimanager login
Then I should see the apimanager "Login" pop up
When I enter apimanager Login username and password for "<usertype>" 
And I click on apimanager Login pop up login button
When I click on apimanager Sandbox
Then I should see the Login in apimanager Sandbox page header as "Login"
When I enter apimanager Sandbox page username and password for "<usertype>"
And I click on apimanager Sandbox page login button
Then I should see the apimanager sandbox index page header as "Welcome"
##Creating number
#When I click on numbers dropdown and select manage numbers
#Then I should see the manage numbers page header as "Manage Numbers"
#When I clear existing "<Number>" from the list
#And I click on add new button in manage numbers page
#And I enter "<Number>" as number
#And I enter "<Description>" as number description
#And I enter "<Balance>" as balance
#And I click on save button in under actions column
#Then I should see the "<Number>" as added number in the numbers table
##Create short code
#When I click on numbers dropdown and select Sender Addresses
#Then I should see the apimanager sandbox Sender Addresses page header as "Manage Sender Addresses"
#When I clear existing Short codes "<ShortCode>"
#And I click on Add New button
#And I enter new short code "<ShortCode>"
#And I enter description "<Description>"
#And I click on save button in under actions column
#Then I should see the "<ShortCode>" as added number in the numbers table 
#MIIFE_RTC_158 Check if the USSD Send Request works as expected from the Sandbox
When I click on Api drop down and select USSD
Then I should see the USSD parameter page as "USSD Send"
When I enter USSD parameter page address "<NmberParameter>"
And I enter USSD parameter page shortcode "<ShortCode>"
And I enter USSD parameter page outboundUSSDMessage "<UssdMSG>"
And I enter USSD parameter page clientCorrelator "<clientCode>"
And I enter USSD parameter page callbackData "<callbackData>"
And I enter USSD parameter page notifyURL "<notifyURL>"
And I enter USSD parameter page keyword "<keyword>"
And I enter USSD parameter page ussdAction "<ussdAction>"
When I click USSD parameter page send request button
And I get the request payload
And I get the response payload
Then I validate the request payload for USSD api
Then I validate the response payload for USSD api
Then I validate table contains a row with correct USSD send data
When I close the browsers



Examples:
|usertype 	|Number      |Description|Balance|ShortCode|UssdMSG|clientCode|callbackData                     |notifyURL                                       |keyword|ussdAction|NmberParameter|
|SANDBOXUSSD|94774562876 |Test number|1000   |77755    |Hello!!|1289      |some-data-useful-to-the-requester|http://localhost:8080/mifeapiserver/callback.jsp|1234   |mtinit    |tel:+94774562876|


