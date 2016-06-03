Feature: Sandbox API-SMS

@dataCreation
Scenario Outline: Data creation part for the Sandbox SMS user
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
When I close the browsers

Examples:
|usertype    |LastName   		|FirstName   		|Email               |
|SANDBOXSMS	 |AuxTestLastsms	|AuxTestFirstsms	|AuxTest123@auxel.com|

@dataCreation
Scenario Outline: Data creation part for the Sandbox SMS short code and numbers
Given I am in apimanager
When I click on apimanager Sandbox
Then I should see the Login in apimanager Sandbox page header as "Login"
When I enter apimanager Sandbox page username and password for "<usertype>"
And I click on apimanager Sandbox page login button
Then I should see the apimanager sandbox index page header as "Welcome"
When I click on numbers dropdown and select Sender Addresses
Then I should see the apimanager sandbox Sender Addresses page header as "Manage Sender Addresses"
When I clear existing Short codes "<ShortCode>"
And I click on Add New button
And I enter new short code "<ShortCode>"
And I enter description "<Description>"
And I click on save button in under actions column
Then I should see the "<ShortCode>" as added number in the numbers table 
When I click on numbers dropdown and select manage numbers
Then I should see the apimanager sandbox Manage Numbers page header as "Manage Numbers"
When I clear existing "<Number>" from the list
And I click on add new button in manage numbers page
And I enter "<Number>" as number
And I enter description "<DescriptionSMS>" 
And I enter "<Balance>" as balance
And I click on save button in under actions column
Then I should see the "<Number>" as added number in the numbers table
When I close the browsers

Examples:
|usertype  |ShortCode 	 |Description		 |Number	  |DescriptionSMS    |Balance |
|SANDBOXSMS|8899		 |Testing_short_code |94771111111 |Testing_Number_SMS|1000    |

@Smoke
Scenario Outline: Check if an SMS can be sent from the sandbox
Given I am in apimanager
When I click on apimanager Sandbox
Then I should see the Login in apimanager Sandbox page header as "Login"
When I enter apimanager Sandbox page username and password for "<usertype>"
And I click on apimanager Sandbox page login button
Then I should see the apimanager sandbox index page header as "Welcome"
When I click on API dropdown and select SMS api
Then I should see payment page header as "Send SMS to Application"
When I click on Send SMS link
And I Select "<ShortCode>" from the application dropdown
And I select "<Number>" from the Sender Address
And I set a SMS message
And I check send request table exists and note the table rows
And I click on SMS Send Request button
Then I validate the send request table last row for the updation
When I click on Settings button
Then I should see the page as "SMS Parameters"
When I select Delivery Status as "<deliveryStatus>"
And I select Notification Delay as "12"
And I select Max Notifications Allowed as "1200"
And I click on SMS parameters Save button
Then I validate Delivery Status as "<deliveryStatus>"
And I validate Notification Delay as "10"
And I validate Max Notifications Allowed as "1000"
When I set sender Address as "<ShortCode>"
And I set notify URL as "http://www.yoururl.here/notifications/DeliveryInfoNotification"
And I set callback Data as "doSomething()"
And I set random criteria
And I set random clientCorrelator
When I click on Send request in settings page
Then I validate SMS request payload
And I validate SMS response payload
And I validate table contains a row with correct SMS send data
When I close the browsers

Examples:
|usertype  |ShortCode 	 |Number	  |deliveryStatus		|
|SANDBOXSMS|8899		 |94771111111 |DeliveredToTerminal  |

@Smoke1
Scenario Outline: Check if an SMS can be retrieved
Given I am in apimanager
When I click on apimanager Sandbox
Then I should see the Login in apimanager Sandbox page header as "Login"
When I enter apimanager Sandbox page username and password for "<usertype>"
And I click on apimanager Sandbox page login button
Then I should see the apimanager sandbox index page header as "Welcome"
When I click on API dropdown and select SMS api
Then I should see payment page header as "Send SMS to Application"
When I click on Send SMS link
And I click on retrive SMS
Then I should see the retrive SMS page header as "SMS Retrieve"
When I Select registraionID as "<ShortCode>"
And I enter max Batch Size as "2"
And I click on Send Request button for retrive SMS
Then I validate the SMS retrive response payload
And I validate the SMS retrive response table
When I close the browsers

Examples:
|usertype  |ShortCode 	 |
|SANDBOXSMS|8899		 |

@Smoke2
Scenario Outline: Check if an SMS can be Delivery Subscriptions
Given I am in apimanager
When I click on apimanager Sandbox
Then I should see the Login in apimanager Sandbox page header as "Login"
When I enter apimanager Sandbox page username and password for "<usertype>"
And I click on apimanager Sandbox page login button
Then I should see the apimanager sandbox index page header as "Welcome"
When I click on API dropdown and select SMS api
Then I should see payment page header as "Send SMS to Application"
When I click on Delivery Subscriptions link
Then I should see the page delivery subscription page header as "Delivery Subscriptions"
When I enter filter criteria as "some-meaningful-filter-string"
And I enter notify URL as "http://www.yoururl.here/notifications/DeliveryInfoNotification"
And I enter callback data as "some-data-useful-to-the-requester"
And I enter random client correlator
And I click on delivery subscription send request button
Then I validate delivery subscription request payload
And I validate delivery subscription response payload
And I validate delivery subscription table
When I unsubscribe the delivery subscrption
Then I should not see the delivery subscribe on the subcription table
When I close the browsers

Examples:
|usertype  |ShortCode 	 |
|SANDBOXSMS|8899		 |
