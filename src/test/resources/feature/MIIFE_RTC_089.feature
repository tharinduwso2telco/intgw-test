Feature: Validate application status after the workflow is approved

@Smoke
Scenario Outline: Check if application status changed to ACTIVE once the workflow is approved
Given I am in apimanager
When I click on apimanager login
Then I should see the apimanager "Login" pop up
When I enter apimanager Login username and password for "<usertype>" 
And I click on apimanager Login pop up login button
Then I should see apimanager "<usertype>" at the top right corner of the page
When I click on apimanager Manage 
Then I should see the apimanager Manager page header as "Manager"
When I enter apimanager Manager page admin username credentials
And I click on apimanager Manager page login button
Then I should see the apimanager Manager Home page header as "Home"
And I should see apimanager Manager Home Billing Workflow Blacklist Whitelist tabs
When I click on apimanager Manager page Workflow tab
Then I should see apimanager Manager Approval Tasks page header as "Approval Tasks"
When I click on Application creation link
Then I should see created application "<AppName>" at the top of the Approval Tasks table
When I click on Application Details drop box for "<AppName>" row
And I select "<ApplicationDetails>" for "<AppName>" Application Details row
And I click Assign To Me button for "<AppName>" Application Details row
And I click on Start button for "<AppName>" Application Details row
And I select "<Action>" and click complete button for "<AppName>" Application Details row
Then I should see Enter aprrove/reject reasons pop up header as "Enter approve/reject reasons"
When I enter aprrove/reject reason as "Approved"
And click aprrove/reject reason ok button
Then I should not see the created application in Approval Tasks table as "<AppName>"
When I click on apimanager Manager admin
And I click on apimanager Manager logout button
Then I should see the apimanager Manager page header as "Manager"
When I enter apimanager Manager page operator username credentials
And I click on apimanager Manager page login button
Then I should see the apimanager Manager Home page header as "Home"
And I should see apimanager Manager Home Billing Workflow
When I click on apimanager Manager page Workflow tab
Then I should see apimanager Manager Approval Tasks page header as "Approval Tasks"
When I click on Application creation link
Then I should see created application "<AppName>" at the top of the Approval Tasks table
When I click on Start button for "<AppName>" Application Details row
And I select "<Action>" and click complete button for "<AppName>" Application Details row
Then I should see Enter aprrove/reject reasons pop up header as "Enter approve/reject reasons"
When I enter aprrove/reject reason as "Approved"
And click aprrove/reject reason ok button
Then I should not see the created application in Approval Tasks table as "<AppName>"
When I click on apimanager Manager dialogAdmin
And I click on apimanager Manager logout button
Then I should see the apimanager Manager page header as "Manager"
When I click on close window
Then I am in apimanager
When I click on apimanager My Applications
Then I should see the apimanager Application page header as "Applications"
And I should see the added Application Name as "<usertype>" _ "<Name>" and the "<New Status>" as status



Examples:
|usertype|AppName                      |ApplicationDetails |Action |status|New Status|
|LOGOUT  |AuxLogoutUser_AusTestingApp03|Unlimited          |Approve|READY |ACTIVE    |