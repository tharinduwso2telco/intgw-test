Feature: Workflow test cases

@Smoke
Scenario Outline: Check if the system validates if comments are entered for workflow tasks
Given I am in apimanager
When I click on apimanager login
Then I should see the apimanager "Login" pop up
When I enter apimanager Login username and password for "<usertype>" 
And I click on apimanager Login pop up login button
Then I should see apimanager "<usertype>" at the top right corner of the page
When I click on apimanager My Applications
And I clear existing "<appName>" for "<usertype>"
And I enter "<appName>" as name "<CallbackURL>" as Callback URL and "<Description>" as Description
And I click on Add button
Then I should see the added Application name as "<usertype>" _ "<appName>" Tier as "<Tier>" Status as "<status>" and Description as "<Description>"
When I click on apimanager Manage
Then I should see the apimanager Manager page header as "Manager"
When I enter apimanager Manager page admin username credentials
And I click on apimanager Manager page login button
Then I should see the apimanager Manager Home page header as "Home"
When I click on apimanager Manager page Workflow tab
When I click on Application creation link
Then I should see created application "<appName>" at the top of the Approval Tasks table for "<usertype>"
When I click on Application Details drop box for "<appName>" row for "<usertype>"
And I select "<ApplicationDetails>" for "<appName>" Application Details row for "<usertype>"
And I click Assign To Me button for "<appName>" Application Details row for "<usertype>"
And I click on Start button for "<appName>" Application Details row for "<usertype>"
And I select "<Action>" and click complete button for "<appName>" Application Details row for "<usertype>"
Then I should see Enter aprrove/reject reasons pop up header as "Enter approve/reject reasons"
When click aprrove/reject reason ok button
Then I should see a pop message "Comments can not be empty"
When I click the ok button of warning message popup
And I select "<ActionReject>" and click complete button for "<appName>" Application Details row for "<usertype>"
Then I should see Enter aprrove/reject reasons pop up header as "Enter approve/reject reasons"
When I enter aprrove/reject reason as "Reject"
And click aprrove/reject reason ok button
Then I should not see the created application in Approval Tasks table as "<appName>" for "<usertype>"
When I click on apimanager Manager admin
And I click on apimanager Manager logout button
Then I should see the apimanager Manager page header as "Manager"
When I click on close window
And I click on apimanager My Applications
Then I should see the added Application name as "<usertype>" _ "<appName>" Tier as "<TierAfter>" Status as "<statusReject>" and Description as "<Description>"
And I close the browsers

Examples:
| usertype|appName       |CallbackURL                                                      |Description  |Tier   |status  |Action |ApplicationDetails |ActionReject |statusReject|TierAfter|
|LOGOUT   |RTC087_APP002 |https://identity.qa.example.com/playground2/oauth2.jsp?reset=true|WorkflowTC   |Default|INACTIVE|Approve|Unlimited          |Reject		|REJECTED	 |Default  |
