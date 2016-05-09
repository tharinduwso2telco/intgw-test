Feature: Create and Publish an API

@dataCreation
Scenario Outline: Data creation part for the Create and Publish an API TC
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
| usertype|LastName   |FirstName   |Email               |
|PUBLISHER|AuxTestLast|AuxTestFirst|AuxTest123@gmail.com|

@Smoke
Scenario Outline: Check if the user is able to create api with a user with publisher role
Given I am in identity server page
When I enter identity server username credentials
And I click on identity server sign in
Then I should see the ids Home page header as "WSO2 API Manager Home"
When I click on identity server Main tab
#Then I should see ids Configuration menu with first item as "Users and Roles"
#When I click on identity server Configuration Users and Roles link
And I click on identity server Configuration Users and Roles List link
Then I should see ids Configuration menu with first item as "Users and Roles"
#Then I should see identity server User Management page header as "System User Store"
When I click identity server User Management Users link
Then I should see ids User Management Users page header as "Users"
When I enter identity server Search Users to Enter user name pattern as "<usertype>" 
And I click on identity server Users search button
Then I should see the "<usertype>" on ids Users search area
When I click on ids Users view roles link and delete existing Publisher role from the user
And I click on ids Users assign roles link under "<usertype>"
Then I should see the ids List of roles page table header as "Unassigned Roles"
When I enter ids Role list of users Enter role name pattern as "publisher"
And I click on ids List of roles search button
Then I should see ids List of roles search area as "<roleType>" 
When I click on ids List of roles "<roleType>" permissions link
Then I should see the ids permissions of the role page header as "Permissions of the Role"
And ids permissions of the role page Publish check box should be checked
When I click on ids Permissions of the role page create check box
And I click on ids Permissions of the role page update button
Then ids Role update success message should pop up "Role Internal/publisher updated successfully."
And I click on ids Role update success message ok button
When I checked the ids List of roles "<roleType>" check box
And I click on ids List of roles finish button
Then ids List of roles Role update success message should pop up "successfully."
When I click on List of roles Role update success message ok button
And I close the browser and reopen the browsers and navigate to apipublisher page
Given I am in apipublisher
When I provide apipublisher username and password for "<usertype>"
And I click on apipublisher login button
Then I should see apipublisher username "<usertype>" at the top right corner of the page
When I search existing API "<apiName>" and delete it
When I click on apipublisher Add link
And I click Design new API radio button
And I click Start Creating button
And I provide apipublisher Design name as "<apiName>"
And I provide apipublisher Design Context as "APICreation"
And I provide apipublisher Design Version as "1.0.0.1"
And I provide apipublisher Design Provide URL pattern as "/aux/wso2tel/"
And I click on apipublisher Design "Get" checkbox
And I click on Resource Add button
#And I provide apipublisher Design Provide Resource name as "apiCreation"
#And I click on apipublisher Design Add New Resources link
And I click on apipublisher Design new resources link "/aux/wso2tel/"
And I provide apipublisher Design parameter name "auth"
And I click on apipublisher Design "Add Parameter" button
And I click on apipublisher Design Description +Empty link
And I provide apipublisher Design description as "authentication"
And I click on apipublisher Design submit description button
And I click on apipublisher Design Parameter Type query link
And I select apipublisher Design parameter type "body" from the dropdown
And I click on apipublisher Design submit parameter type button
#And I click on apipublisher Design Data Type +Empty link
#And I provide apipublisher Design data type as "String"
#And I click on apipublisher Design submit data type button
#And I click on apipublisher Design Required +Empty link
#And I select "True" from the apipublisher Design Required dropdown
#And I click on apipublisher Design submit Required button
And I click on apipublisher Design implement button
And I click on Manage API link
And I provide  apipublisher Implement endpoint type as "HTTP Endpoint"
And I provide apipublisher Implement production endpoint as "<prodEndpoint>"
And I provide apipublisher Implement sandbox endpoint as "<sandEndpoint>"
And I click on apipublisher apipublisher manage button
And I select "Bronze" as apipublisher Manage tier availability
And I click on apipublisher Manage save & publish button
And I click on Go to Overview
Then I should see apipublisher production URL as "<prodEndpoint>"
And I should see apipublisher sandbox URL as "<sandEndpoint>"
And I should see apipublisher tier availability as "Bronze"
When I close the browser and reopen the browsers and navigate to apimanager page
And I click on apimanager login
And I enter apimanager Login username and password for "<usertype>" 
And I click on apimanager Login pop up login button
Then I should see apimanager "<usertype>" at the top right corner of the page
And I should see apimanager "<apiName>" api from the left pane
When I click on the apimanager "<apiName>" api
Then I should see the apimanager APIs "<apiName>" status as "Published"

Examples:
| usertype|apiName  		 |prodEndpoint   |sandEndpoint |roleType		   |
|PUBLISHER|AuxTestAPICreation|auxProd		 |auxSand	   |Internal/publisher |