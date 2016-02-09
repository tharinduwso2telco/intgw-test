Feature: Validate Subscription Creation

@Smoke
Scenario Outline: Check if subscriptions can be created
#prerequisites:1.an App in approved status has to exist 2.subscription approval should not be completed
Given I am in apipublisher
When I provide apipublisher username and password for "<usertype>"
And I click on apipublisher login button
Then I should see apipublisher username "<usertype>" at the top right corner of the page
When I search existing API "<apiName>" and delete it
And I click on apipublisher Add link
And I provide apipublisher Design name as "<apiName>"
And I provide apipublisher Design Context as "APIa"
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
Then I click on apipublisher Manage save & publish button
Given I am in apimanager
When I click on apimanager login
Then I should see the apimanager "Login" pop up
When I enter apimanager Login username and password for "<usertype>" 
And I click on apimanager Login pop up login button
Then I should see apimanager "<usertype>" at the top right corner of the page
When I click on the apimanager "<apiName>" api
Then I should see the apimanager APIs "<apiName>" status as "Published"
When I click on Applications dropdown
Then I should see "<appName>" Application for "<usertype>"
When I select "<appName>" for "<usertype>"
And I select operator as "<operator>"
And I click apimanager "<apiName>" API page subscribe button
Then I should see "Subscription Successful" on Subscription Successful pop up
When I click Go to My Subscription button
Then I should see the apimanager Subscriptions page header as "Subscriptions"
And I should see "<appName>" under Applications with Subscriptions for "<usertype>"
When I click on apimanager Manage 
Then I should see the apimanager Manager page header as "Manager"
When I enter apimanager Manager page admin username credentials
And I click on apimanager Manager page login button
Then I should see the apimanager Manager Home page header as "Home"
And I should see apimanager Manager Home Billing Workflow Blacklist Whitelist tabs
When I click on apimanager Manager page Workflow tab
Then I should see apimanager Manager Approval Tasks page
When I click on subscriptions creation under tasks
Then I should see created application "<appName>" at the top of the Approval Tasks table for "<usertype>"
When I click Assign To Me button for "<appName>" Application Details row for "<usertype>"
And I click on Start button for "<appName>" Application Details row for "<usertype>"
And I select "<Action>" and click complete button for "<appName>" Application Details row for "<usertype>"
Then I should see Enter aprrove/reject reasons pop up header as "aprrove/reject reasons"
When I enter aprrove/reject reason as "Approved"
And click aprrove/reject reason ok button
Then I should not see the created application in Approval Tasks table as "<appName>" for "<usertype>"
When I click on apimanager Manager admin
And I click on apimanager Manager logout button
Then I should see the apimanager Manager page header as "Manager"
When I enter apimanager Manager page operator username credentials
And I click on apimanager Manager page login button
Then I should see the apimanager Manager Home page header as "Home"
And I should see apimanager Manager Home Billing Workflow
When I click on apimanager Manager page Workflow tab
Then I should see apimanager Manager Approval Tasks page header as "Approval Tasks"
When I click on subscriptions creation under tasks
Then I should see created application "<appName>" at the top of the Approval Tasks table for "<usertype>"
When I click on Start button for "<appName>" Application Details row for "<usertype>"
And I select "<Action>" and click complete button for "<appName>" Application Details row for "<usertype>"
Then I should see Enter aprrove/reject reasons pop up header as "aprrove/reject reasons"
When I enter aprrove/reject reason as "Approved"
And click aprrove/reject reason ok button
Then I should not see the created application in Approval Tasks table as "<appName>" for "<usertype>"

Examples:
| usertype   |appName                  |Action |apiName                       |operator|prodEndpoint|sandEndpoint|
|SUBSCRIPTION|AuxSubscriptionTestingApp|Approve|AuxSubscriptionAppTest        |DIALOG  |auxProd     |auxSand|
