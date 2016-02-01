Feature: Check if subscriptions can be created

@Smoke
Scenario Outline: Check if subscriptions can be created
#prerequisites:1.an App in approved status has to exist 2.subscription approval should not be completed
Given I am in apimanager
When I click on apimanager login
Then I should see the apimanager "Login" pop up
When I enter apimanager Login username and password for "<usertype>" 
And I click on apimanager Login pop up login button
Then I should see apimanager "<usertype>" at the top right corner of the page
When I click on the apimanager "<APIName>" api
Then I should see the apimanager APIs "<APIName>" status as "Published"
When I click on Applications dropdown
Then I should see "<AppName>" Application
When I select "<AppName>"
And I select "<operator>" as operator
And I click apimanager "<APIName>" API page subscribe button
Then I should see "Subscription Successful" on Subscription Successful pop up
When I click Go to My Subscription button
Then I should see the apimanager Subscriptions page header as "Subscriptions"
And I should see "<AppName>" under Applications with Subscriptions
When I click on apimanager Manage 
Then I should see the apimanager Manager page header as "Manager"
When I enter apimanager Manager page admin username credentials
And I click on apimanager Manager page login button
Then I should see the apimanager Manager Home page header as "Home"
And I should see apimanager Manager Home Billing Workflow Blacklist Whitelist tabs
When I click on apimanager Manager page Workflow tab
Then I should see apimanager Manager Approval Tasks page
When I click on subscriptions creation under tasks
Then I should see created application "<AppName>" at the top of the Approval Tasks table
When I click Assign To Me button for "<AppName>" Application Details row
And I click on Start button for "<AppName>" Application Details row
And I select "<Action>" and click complete button for "<AppName>" Application Details row
Then I should see Enter aprrove/reject reasons pop up header as "aprrove/reject reasons"
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
Then I should see apimanager Manager Approval Tasks page
When I click on subscriptions creation under tasks
Then I should see created application "<AppName>" at the top of the Approval Tasks table
When I click on Start button for "<AppName>" Application Details row
And I select "<Action>" and click complete button for "<AppName>" Application Details row
Then I should see Enter aprrove/reject reasons pop up header as "aprrove/reject reasons"
When I enter aprrove/reject reason as "Approved"
And click aprrove/reject reason ok button
Then I should not see the created application in Approval Tasks table as "<AppName>"

Examples:
| usertype    |AppName                        |Action |APIName           |operator|
|SUBSCRIBERAPP|AuxTestUser002_AuxTestAppTest13|Approve|AuxTestAPI-1.0.0.1|DIALOG  |
