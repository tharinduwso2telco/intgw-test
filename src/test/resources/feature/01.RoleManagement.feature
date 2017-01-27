Feature: User Roles creation

 
Scenario Outline: HUB-52 : Hub administrator creates user role with API creating permission
Given I am in identity server page
When I enter identity server username credentials
And I click on identity server sign in
Then I should see the ids Home page header as "WSO2Telco Hub Home"
When I click on identity server Main tab
And I click on identity server Configuration Users and Roles List link
Then I should see ids Configuration menu with first item as "Users and Roles"
When I click identity server User Management Roles link
Then I should see ids User Management Roles page header as "Roles"
When I clear existing aggrigator role "<role>"
And I click on ids User Management Roles add new role link
Then I should see ids User Management Add Role page header as "Step 1 : Enter role details"
When I enter ids Add Role role name as "<role>"
And I click on ids Add Role next button
Then I should see ids Add Role Select permission to Add Role page header as "Step 2 : Select permissions to add to Role"
Then I select role "<permissions>" to Add Role
When I click on ids Add Role Select permission to Add Role next button
Then I should see ids Add Role Select Users to Add Role page header as "Step 3 : Select users to add to Role"
And I click on ids Select Users to Add Role Finish
Then I should see ids Add User Success pop up message as "WSO2 Carbon"
And I click on Success pop up message Ok button
Examples:
|role   |permissions |
|Creator|Login,Create|


Scenario Outline: HUB-53 : Hub administrator creates user role with API publishing permission
Given I am in identity server page
When I enter identity server username credentials
And I click on identity server sign in
Then I should see the ids Home page header as "WSO2Telco Hub Home"
When I click on identity server Main tab
And I click on identity server Configuration Users and Roles List link
Then I should see ids Configuration menu with first item as "Users and Roles"
When I click identity server User Management Roles link
Then I should see ids User Management Roles page header as "Roles"
When I clear existing aggrigator role "<role>"
And I click on ids User Management Roles add new role link
Then I should see ids User Management Add Role page header as "Step 1 : Enter role details"
When I enter ids Add Role role name as "<role>"
And I click on ids Add Role next button
Then I should see ids Add Role Select permission to Add Role page header as "Step 2 : Select permissions to add to Role"
Then I select role "<permissions>" to Add Role
When I click on ids Add Role Select permission to Add Role next button
Then I should see ids Add Role Select Users to Add Role page header as "Step 3 : Select users to add to Role"
And I click on ids Select Users to Add Role Finish
Then I should see ids Add User Success pop up message as "WSO2 Carbon"
And I click on Success pop up message Ok button
Examples:
|role               |permissions                           |
|hub-unit1-publisher|Login,Create,Publish,Govern,Governance|
|hub-unit2-publisher|Login,Create,Publish,Govern,Governance|
|hub-unit3-publisher|Login,Create,Publish,Govern,Governance|



Scenario Outline: HUB-54 : Hub administrator creates user role with operator administrator permission
Given I am in identity server page
When I enter identity server username credentials
And I click on identity server sign in
Then I should see the ids Home page header as "WSO2Telco Hub Home"
When I click on identity server Main tab
And I click on identity server Configuration Users and Roles List link
Then I should see ids Configuration menu with first item as "Users and Roles"
When I click identity server User Management Roles link
Then I should see ids User Management Roles page header as "Roles"
When I clear existing aggrigator role "<role>"
And I click on ids User Management Roles add new role link
Then I should see ids User Management Add Role page header as "Step 1 : Enter role details"
When I enter ids Add Role role name as "<role>"
And I click on ids Add Role next button
Then I should see ids Add Role Select permission to Add Role page header as "Step 2 : Select permissions to add to Role"
Then I select role "<permissions>" to Add Role
When I click on ids Add Role Select permission to Add Role next button
Then I should see ids Add Role Select Users to Add Role page header as "Step 3 : Select users to add to Role"
And I click on ids Select Users to Add Role Finish
Then I should see ids Add User Success pop up message as "WSO2 Carbon"
And I click on Success pop up message Ok button
Examples:
|role         |permissions         |
|OperatorAdmin|All Permissions     |