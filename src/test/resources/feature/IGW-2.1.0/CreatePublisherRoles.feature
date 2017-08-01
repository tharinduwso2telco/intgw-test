Feature: Create Publisher Roles

@createAPIPublisherRoles
  Scenario Outline:Hub administrator creates user role with API publishing permission
    Given I am in identity server page
    When I enter identity server username credentials
    And I click on identity server sign in
    Then I should see the ids Home page header as "WSO2 Identity Server Home"
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
      |role                |permissions |
      |PUBLISHER1ROLE|API|
      |PUBLISHER2ROLE|API|
      |PUBLISHER3ROLE|API|