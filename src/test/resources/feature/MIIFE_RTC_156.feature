Feature: Sandbox API-LBS

@Smoke
Scenario Outline: Check if coordinates can be saved for LBS API in Sandbox
Given I am in apimanager
When I click on apimanager Sandbox
Then I should see the Login in apimanager Sandbox page header as "Login"
When I enter apimanager Sandbox page username and password for "<usertype>"
And I click on apimanager Sandbox page login button
Then I should see the apimanager sandbox index page header as "Welcome"
When I click on numbers dropdown and select manage numbers
Then I should see the manage numbers page header as "Manage Numbers"
When I clear existing "<number>" from the list
And I click on add new button in manage numbers page
And I enter "<number>" as number
And I enter "<description>" as number description
And I enter "<balance>" as balance
And I click on save button in under actions column
Then I should see the "<number>" as added number in the numbers table 
When I click on API dropdown and select location api
Then I should see payment page header as "Location"
When I set Altitude as "<altitude>"
And I set Latitude as "<latitude>"
And I set Longitude as "<longitude>"
And I select Location Retrieval Status "<retrievalStatus>"
And I click save button
And I click on API dropdown and select location api
Then I validate Altitude as "<altitude>"
And I validate Latitude as "<latitude>"
And I valdaite Longitude as "<longitude>"
And I Valdiate Location Retrieval Status "<retrievalStatus>"
When I set adress as "<number>"
And I set requested accuracy "<requestedAccuracy>"
And I click on Send Request button
And I validate the response payload for location api

Examples:
|usertype |number		|description |balance |altitude |latitude |longitude |retrievalStatus |requestedAccuracy |
|SANDBOXNO|94771231231  |testAuxenta |1000.00 |12		|12		  |12		 |Retrieved		  |1000				 |