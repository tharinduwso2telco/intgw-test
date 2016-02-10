Feature: Application Creation for service provider

@Smoke
Scenario Outline: Check if the application creation works as expected for service provider
Given I am in apimanager
And I click on apimanager login
Then I should see the apimanager "Login" pop up
When I enter apimanager Login username and password for "<usertype>" 
And I click on apimanager Login pop up login button
Then I should see apimanager "<usertype>" at the top right corner of the page
When I click on apimanager My Applications
Then I should see the apimanager Application page header as "Applications"
And I should see the apimanager Application page Add New Application form header as "Add New Application"
When I clear existing "<name>" for "<usertype>"
And I enter "<name>" as name "<Callback URL>" as Callback URL and "<Description>" as Description
And I click on Add button
Then I should see the added Application name as "<usertype>" _ "<name>" Tier as "<Tier>" Status as "<status>" and Description as "<Description>"
When I click on apimanager My Subscriptions
Then I should see "<No subscriptions>" message
When I click on apimanager APIs module
Then I should see the apimanager APIs page header as "APIs"
When I click on the apimanager "<APIname>" api
Then I should see the apimanager APIs "<APIname>" status as "Published"
When I click on Applications dropdown
Then I should not see "<Appname>" Application


Examples:
| usertype|APIname 	  |name          |Callback URL                                                     |Description  |Tier   |status  |No subscriptions                                                                                                       |Appname                     |
|APPCREATE|AuxAppTest |AuxTestUser005|https://identity.qa.example.com/playground2/oauth2.jsp?reset=true|AuXTestAPI003|Default|INACTIVE|No subscriptions are created yet. To add a new subscription , select an API and subscribe to it from API listing page .|AuxTestUser005_AuXTestAPI003|
