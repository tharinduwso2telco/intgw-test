Feature: Check if the application creation works as expected for service provider

@Smoke
Scenario Outline: Check if the application creation works as expected for service provider
Given I am in ids page
When I enter ids username credentials
And I click on ids sign in
Then I should see the ids Home page header as "WSO2 Identity Server Home"
When I click on ids Main tab
Then I should see ids Main menu "Service Providers" as the first item
When I click on ids Main List link
Then I should not see "<AppName>" Application in Service Providers table
And I close the browser
When I am in apimanager
And I click on apimanager login
Then I should see the apimanager "Login" pop up
When I enter apimanager Login username as "<username>" and password as "<Password>" 
And I click on apimanager Login pop up login button
Then I should see apimanager "<username>" at the top right corner of the page
When I click on apimanager My Applications
Then I should see the apimanager Application page header as "Applications"
And I should see the apimanager Application page Add New Application form header as "Add New Application"
When I enter "<Name>" as Name "<Callback URL>" as Callback URL and "<Description>" as Description
And I click on Add button
Then I should see the added Application Name as "<username>" _ "<Name>" Tier as "<Tier>" Status as "<status>" and Description as "<Description>"
When I click on apimanager My Subscriptions
Then I should see "<No subscriptions>" message
When I click on apimanager APIs module
Then I should see the apimanager APIs page header as "APIs"
When I click on the apimanager "<apiName>" api
Then I should see the apimanager APIs "<apiName>" status as "Published"
When I click on Applications dropdown
Then I should not see "<AppName>" Application


Examples:
| username     |Password |APIName 			 |Name         |Callback URL                                                     |Description  |Tier   |status  |No subscriptions                                                                                                       |AppName                     |
|AuxTestUser002|1qaz2wsx@|AuxTestAPI-1.0.0.1 |AuXTestAPI003|https://identity.qa.example.com/playground2/oauth2.jsp?reset=true|AuXTestAPI003|Default|INACTIVE|No subscriptions are created yet. To add a new subscription , select an API and subscribe to it from API listing page .|AuxTestUser002_AuXTestAPI003|