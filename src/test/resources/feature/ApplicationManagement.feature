Feature: Application Management of service provider

@InternalGateway @ExternalGateway
Scenario Outline: HUB-59 : User creates an application by filling all mandatory information
Given I am in apimanager
When I click on apimanager login
Then I should see the apimanager "Login" pop up
When I enter apimanager Login username and password for "<usertype>" 
And I click on apimanager Login pop up login button
Then I should see apimanager "<usertype>" at the top right corner of the page
When I click on apimanager My Applications
Then I should see the apimanager Application page header as "Applications"
Then I click on apimanager Add Application
And I enter "<appName>" as name and "<Description>" as Description
And I click on Add button
Then I should see the added Application name as "<appName>" and the "<status>" as status
Examples:
|usertype |appName      |Description  |status  |
|APPCREATE|AuXTestAPPA	|AuXTestingAPP|INACTIVE|


@InternalGateway @ExternalGateway
Scenario Outline: HUB-60 : User is not able to create an application without providing application name
Given I am in apimanager
When I click on apimanager login
Then I should see the apimanager "Login" pop up
When I enter apimanager Login username and password for "<usertype>" 
And I click on apimanager Login pop up login button
Then I should see apimanager "<usertype>" at the top right corner of the page
When I click on apimanager My Applications
Then I should see the apimanager Application page header as "Applications"
Then I click on apimanager Add Application
And I enter "<appName>" as name and "<Description>" as Description
And I click on Add button
Then I should see the Application Name validation failure prompt with "Application Name"
Examples:
|usertype |appName      |Description  |status  |
|APPCREATE|             |AuXTestingAPP|INACTIVE|

@InternalGateway @ExternalGateway
Scenario Outline: HUB-64 : User deletes created application
Given I am in apimanager
When I click on apimanager login
Then I should see the apimanager "Login" pop up
When I enter apimanager Login username and password for "<usertype>" 
And I click on apimanager Login pop up login button
Then I should see apimanager "<usertype>" at the top right corner of the page
When I click on apimanager My Applications
Then I should see the apimanager Application page header as "Applications"
When I delete existing "<appName>"
Then I should see the confirm delete popup with "Confirm Delete"
And I click on confirm delete popup Yes button
Examples:
|usertype |appName      |Description  |status  |
|APPCREATE|AuXTestAPPA	|AuXTestingAPP|INACTIVE|

@InternalGateway @ExternalGateway
Scenario Outline: HUB-65 : User creates an application by the same name as previously deleted
Given I am in apimanager
When I click on apimanager login
Then I should see the apimanager "Login" pop up
When I enter apimanager Login username and password for "<usertype>" 
And I click on apimanager Login pop up login button
Then I should see apimanager "<usertype>" at the top right corner of the page
When I click on apimanager My Applications
Then I should see the apimanager Application page header as "Applications"
When I delete existing "<appName>"
Then I should see the confirm delete popup with "Confirm Delete"
And I click on confirm delete popup Yes button
Then I should see the apimanager Application page header as "Applications"
Then I click on apimanager Add Application
And I enter "<appName>" as name and "<Description>" as Description
And I click on Add button
Then I should see the added Application name as "<appName>" and the "<status>" as status
Examples:
|usertype |appName      |Description  |status  |
|APPCREATE|AuxTestAPPA	|AuXTestingAPP|INACTIVE|

@InternalGateway @ExternalGateway
Scenario Outline: HUB-66 : User is not able to create an application with the same name as previously created application
Given I am in apimanager
When I click on apimanager login
Then I should see the apimanager "Login" pop up
When I enter apimanager Login username and password for "<usertype>" 
And I click on apimanager Login pop up login button
Then I should see apimanager "<usertype>" at the top right corner of the page
When I click on apimanager My Applications
Then I should see the apimanager Application page header as "Applications"
Then I click on apimanager Add Application
And I enter "<appName>" as name and "<Description>" as Description
And I click on Add button
Then I should see the added Application name as "<appName>" and the "<status>" as status
When I click on Application List link
Then I should see the apimanager Application page header as "Applications"
Then I click on apimanager Add Application
And I enter "<appName>" as name and "<Description>" as Description
And I click on Add button
Then I should see the Duplicate Application error pop up with "API Store - Error"
#Then I should see the Duplicate Application error pop up with "A duplicate application already exists by the name - ""<appName>"
And I click on Duplicate Application error pop up Ok button
Examples:
|usertype |appName      |Description  |status  |
|APPCREATE|AuXTestAPPB	|AuXTestingAPP|INACTIVE|


@InternalGateway @ExternalGateway
Scenario Outline: HUB-67 : User is not able to edit application once created
Given I am in apimanager
When I click on apimanager login
Then I should see the apimanager "Login" pop up
When I enter apimanager Login username and password for "<usertype>" 
And I click on apimanager Login pop up login button
Then I should see apimanager "<usertype>" at the top right corner of the page
When I click on apimanager My Applications
Then I should see the apimanager Application page header as "Applications"
Then I click on apimanager Add Application
And I enter "<appName>" with random number as name and "<Description>" as Description
And I click on Add button
Then I should see the added Application name as "<appName>" and the "<status>" as status
When I click on Application List link
Then I should see the apimanager Application page header as "Applications"
When I enter "<appName>" with random number in search field
Then I should see there is no editable field for "<appName>"
Examples:
|usertype |appName      |Description  |status  |
|APPCREATE|AuXTestAPPC	|AuXTestingAPP|INACTIVE|
