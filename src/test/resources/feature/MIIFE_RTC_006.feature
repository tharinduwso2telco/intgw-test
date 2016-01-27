Feature: Create and Publish an API

@Smoke 
Scenario Outline: Check if the user is able to create api with a user with publisher role
Given I am in ids page
When I enter ids username credentials
And I click on ids sign in
Then I should see the ids Home page
When I click on ids Configuration tab
Then I should see ids Configuration menu
When I click on ids Configuration Users and Roles link
Then I should see ids User Management page
When I click ids User Management Users link
Then I should see ids User Management Users page
When I enter ids Search Users to Enter user name pattern as "<username>" 
And I click on ids Users search button
Then I should see the "<username>" on ids Users search area
When I click on ids Users view roles link and delete existing Publisher role from the user
And I click on ids Users assign roles link under "<username>"
Then I should see the ids List of roles page
When I enter ids Role list of users Enter role name pattern as "publisher"
And I click on ids List of roles search button
Then I should see ids List of roles search area as "<roleType>" 
When I click on ids List of roles "<roleType>" permissions link
Then I should see the ids permissions of the role page
And ids permissions of the role page Publish check box should be checked
When I click on ids Permissions of the role page create check box
And I click on ids Permissions of the role page update button
Then ids Role update success message should pop up "Role Internal/publisher updated successfully."
And I click on ids Role update success message ok button
When I checked the ids List of roles "<roleType>" check box
And I click on ids List of roles finish button
Then ids List of roles Role update success message should pop up "successfully."
When I click on List of roles Role update success message ok button
When I close the browser and reopen the browsers and navigate to apipublisher page
Given I am in apipublisher
When I provide apipublisher username as "<username>" and password as "<Password>"
And I click on apipublisher login button
Then I should see apipublisher username "<username>" at the top right corner of the page
When I click on apipublisher Add link
And I provide apipublisher Design name as "<apiName>"
And I provide apipublisher Design Context as "API"
And I provide apipublisher Design Version as "1.0.0.1"
And I provide apipublisher Design Provide URL pattern as "/aux/wso2tel"
And I click on apipublisher Design "Get" checkbox
And I click on apipublisher Design Add New Resources link
And I click on apipublisher Design new resources link "/aux/wso2tel"
And I provide apipublisher Design parameter name "auth"
And I click on apipublisher Design "Add Parameter" button
And I click on apipublisher Design Description +Empty link
And I provide apipublisher Design description as "authentication"
And I click on apipublisher Design submit description button
And I click on apipublisher Design Parameter Type query link
And I select apipublisher Design parameter type "body" from the dropdown
And I click on apipublisher Design submit parameter type button
And I click on apipublisher Design Data Type +Empty link
And I provide apipublisher Design data type as "String"
And I click on apipublisher Design submit data type button
And I click on apipublisher Design Required +Empty link
And I select "True" from the apipublisher Design Required dropdown
And I click on apipublisher Design submit Required button
And I click on apipublisher Design implement button
And I provide  apipublisher Implement endpoint type as "HTTP Endpoint"
And I provide apipublisher Implement production endpoint as "<prodEndpoint>"
And I provide apipublisher Implement sandbox endpoint as "<sandEndpoint>"
And I click on apipublisher apipublisher manage button
And I select "Bronze" as apipublisher Manage tier availability
And I click on apipublisher Manage save & publish button
Then I should see apipublisher production URL as "<prodEndpoint>"
And I should see apipublisher sandbox URL as "<sandEndpoint>"
And I should see apipublisher tier availability as "Default,Bronze"
When I close the browser and reopen the browsers and navigate to apimanager page
And I click on apimanager login
And I enter apimanager Login username as "<username>" and password as "<Password>" 
And I click on apimanager Login pop up login button
Then I should see apimanager "<username>" at the top right corner of the page
And I should see apimanager "<apiName>" api from the left pane
When I click on the apimanager "<apiName>" api
Then I should see the apimanager APIs "<apiName>" status as published

Examples:
| username|Password |apiName   |prodEndpoint |sandEndpoint |roleType		   |
|AutoTest1|1qaz2wsx@|AuxTestAPI|auxProd		 |auxSand	   |Internal/publisher |