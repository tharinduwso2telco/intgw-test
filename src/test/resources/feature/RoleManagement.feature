Feature: User Roles creation

@HUB52
Scenario Outline: HUB-52 : Hub administrator creates user role with API creating permission
Given I am in identity server page
When I enter identity server username credentials
And I click on identity server sign in
Then I should see the ids Home page header as "WSO2 API Manager Home"
When I click on identity server Main tab
And I click on identity server Configuration Users and Roles List link
Then I should see ids Configuration menu with first item as "Users and Roles"

When I click identity server User Management Roles link
Then I should see ids User Management Roles page header as "Roles"
When I clear existing aggrigator role
And I click on ids User Management Roles add new role link
Then I should see ids User Management Add Role page header as "Step 1 : Enter role details"
When I enter ids Add Role role name as "aggrigator"
And I click on ids Add Role next button
Then I should see ids Add Role Select permission to Add Role page header as "Step 2 : Select permissions to add to Role"
When I click on ids Add Role Select permission to Add Role next button
Then I should see ids Add Role Select Users to Add Role page header as "Step 3 : Select users to add to Role"
When I enter ids Select Users to Add Role user name pattern as "<usertype>"
And I click on ids Select Users to Add Role search
And I select ids Select Users to Add Role "<usertype>" check box

Then I should see ids Add Role Success pop up message as "Role PRIMARY/aggrigator is added successfully."
Examples:
| usertype  |LastName   |FirstName   |Email	|Country	|Land_Phone |
|LOGOUT	|AuxTestLast|AuxTestFirst|AuxTest123@gmail.com|Srilanka|2324434|