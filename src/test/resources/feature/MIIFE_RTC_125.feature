Feature: Validate if apps are saved after the token generation and API invocation completed

#MIIFE_RTC_88, MIIFE_RTC_92 and MIIFE_RTC_85 is covered by this test 

@Smoke
Scenario Outline: Check if apps are saved as SP in identity server after the token generation and API invocation are completed
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
When I click on apimanager Manage 
#Then I should see the apimanager Manager page header as "Manager"
#When I enter apimanager Manager page admin username credentials
#And I click on apimanager Manager page login button
#Then I should see the apimanager Manager Home page header as "Home"
#And I should see apimanager Manager Home Billing Workflow Blacklist Whitelist tabs
#When I click on apimanager Manager page Workflow tab
#Then I should see apimanager Manager Approval Tasks page header as "Approval Tasks"
#When I click on Application creation link
#Then I should see created application "<appName>" at the top of the Approval Tasks table for "<usertype>"
#When I click on Application Details drop box for "<appName>" row for "<usertype>"
#And I select "<ApplicationDetails>" for "<appName>" Application Details row for "<usertype>"
#And I click Assign To Me button for "<appName>" Application Details row for "<usertype>"
#And I click on Start button for "<appName>" Application Details row for "<usertype>"
#And I select "<Action>" and click complete button for "<appName>" Application Details row for "<usertype>"
#Then I should see Enter aprrove/reject reasons pop up header as "Enter approve/reject reasons"
#When I enter aprrove/reject reason as "Approved"
#And click aprrove/reject reason ok button
#Then I should not see the created application in Approval Tasks table as "<appName>" for "<usertype>"
#When I click on apimanager Manager admin
#And I click on apimanager Manager logout button
#Then I should see the apimanager Manager page header as "Manager"
#When I enter apimanager Manager page operator username credentials
#And I click on apimanager Manager page login button
#Then I should see the apimanager Manager Home page header as "Home"
#And I should see apimanager Manager Home Billing Workflow
#When I click on apimanager Manager page Workflow tab
#Then I should see apimanager Manager Approval Tasks page header as "Approval Tasks"
#When I click on Application creation link
#Then I should see created application "<appName>" at the top of the Approval Tasks table for "<usertype>"
#When I click on Start button for "<appName>" Application Details row for "<usertype>"
#And I select "<Action>" and click complete button for "<appName>" Application Details row for "<usertype>"
#Then I should see Enter aprrove/reject reasons pop up header as "Enter approve/reject reasons"
#When I enter aprrove/reject reason as "Approved"
#And click aprrove/reject reason ok button
#Then I should not see the created application in Approval Tasks table as "<appName>" for "<usertype>"
#When I click on apimanager Manager dialogAdmin
#And I click on apimanager Manager logout button
#Then I should see the apimanager Manager page header as "Manager"
#When I click on close window
#And I click on apimanager APIs module
#Then I should see the apimanager APIs page header as "APIs"
#When I click on the apimanager "<apiName>" api
#Then I should see the apimanager APIs "<apiName>" status as "Published"
#When I click on Applications dropdown
#Then I should see "<appName>" Application for "<usertype>"
#When I select "<appName>" for "<usertype>"
#And I select operator as "<operator>"
#And I click apimanager "<APIName>" API page subscribe button
#Then I should see "Subscription Successful" on Subscription Successful pop up
#When I click Go to My Subscription button
#Then I should see the apimanager Subscriptions page header as "Subscriptions"
#And I should see "<appName>" under Applications with Subscriptions for "<usertype>"
#When I select created application "<appName>" from the dropdown for "<usertype>"
#And I enter token validity of production as "<validity>"
#And I click generate under apimanager Subscriptions page production
#Then I should see consumer Key of production
#And I should see consumer Secret of production
#When I enter token validity of sandbox as "<validity>"
#And I click generate under apimanager Subscriptions page sandbox
#Then I should see consumer Key of sandbox
#And I should see consumer Secret of sandbox
#When I click on apimanager Manage
#Then I should see the apimanager Manager page header as "Manager"
#When I enter apimanager Manager page admin username credentials
#And I click on apimanager Manager page login button
#Then I should see the apimanager Manager Home page header as "Home"
#And I should see apimanager Manager Home Billing Workflow Blacklist Whitelist tabs
#When I click on apimanager Manager page Workflow tab
#And I click on subscriptions creation under tasks
#Then I should see created application "<appName>" at the top of the Approval Tasks table for "<usertype>"
#When I click Assign To Me button for "<appName>" Application Details row for "<usertype>"
#And I click on Start button for "<appName>" Application Details row for "<usertype>"
#And I select "<Action>" and click complete button for "<appName>" Application Details row for "<usertype>"
#Then I should see Enter aprrove/reject reasons pop up header as "Enter approve/reject reasons"
#When I enter aprrove/reject reason as "Approved"
#And click aprrove/reject reason ok button
Then I should not see the created application in Approval Tasks table as "<appName>" for "<usertype>"
And I should see the updated record in subscription_rates_nb table for "<appNameInDB>"
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
Then I should see Enter aprrove/reject reasons pop up header as "Enter approve/reject reasons"
When I enter aprrove/reject reason as "Approved"
And click aprrove/reject reason ok button
Then I should not see the created application in Approval Tasks table as "<AppName>" for "<usertype>"
And I should see the updated record in subscription_rates table for "<appNameInDB>"


Examples:
|usertype|ApplicationDetails |Action |status|apiName	  |operator|validity|CallbackURL                                                      |Description |appName			|appNameInDB|
|QA17LOG  |Unlimited          |Approve|READY |test   |DIALOG  |-1      |https://identity.qa.example.com/playground2/oauth2.jsp?reset=true|AuXTestAPI  |AuxTestingAppRTC_025 |AutInvSP1_AuxTestingAppRTC_025|