Feature: Validate if apps are saved after the token generation and API invocation completed

#MIIFE_RTC_88, MIIFE_RTC_92, MIIFE_RTC_93 and MIIFE_RTC_85, MIIFE_RTC_086 are covered by this test 

@dataCreation
Scenario Outline: Data creation part for the apps are saved after the token generation and API invocation completed TC
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
| usertype  |LastName   |FirstName   |Email               |
|LOGOUT		|AuxTestLast|AuxTestFirst|AuxTest123@gmail.com|

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
Then I should see the apimanager Manager page header as "Manager"
When I enter apimanager Manager page admin username credentials
And I click on apimanager Manager page login button
Then I should see the apimanager Manager Home page header as "Home"
And I should see apimanager Manager Home Billing Workflow Blacklist Whitelist tabs
When I click on apimanager Manager page Workflow tab
Then I should see apimanager Manager Approval Tasks page header as "Approval Tasks"
When I click on Application creation link
Then I should see created application "<appName>" at the top of the Approval Tasks table for "<usertype>"
When I click on Application Details drop box for "<appName>" row for "<usertype>"
And I select "<ApplicationDetails>" for "<appName>" Application Details row for "<usertype>"
And I click Assign To Me button for "<appName>" Application Details row for "<usertype>"
And I click on Start button for "<appName>" Application Details row for "<usertype>"
And I select "<Action>" and click complete button for "<appName>" Application Details row for "<usertype>"
Then I should see Enter aprrove/reject reasons pop up header as "Enter approve/reject reasons"
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
When I click on Application creation link
Then I should see created application "<appName>" at the top of the Approval Tasks table for "<usertype>"
When I click Assign To Me button for "<appName>" Application Details row for "<usertype>"
And I click on Start button for "<appName>" Application Details row for "<usertype>"
And I select "<Action>" and click complete button for "<appName>" Application Details row for "<usertype>"
Then I should see Enter aprrove/reject reasons pop up header as "Enter approve/reject reasons"
When I enter aprrove/reject reason as "Approved"
And click aprrove/reject reason ok button
Then I should not see the created application in Approval Tasks table as "<appName>" for "<usertype>"
When I click on apimanager Manager dialogAdmin
And I click on apimanager Manager logout button
Then I should see the apimanager Manager page header as "Manager"
When I click on close window
And I click on apimanager APIs module
Then I should see the apimanager APIs page header as "APIs"
When I click on the apimanager "<apiName>" api
Then I should see the apimanager APIs "<apiName>" status as "Published"
When I click on Applications dropdown
Then I should see "<appName>" Application for "<usertype>"
When I select "<appName>" for "<usertype>"
And I select operator as "<operator>"
And I click apimanager "<APIName>" API page subscribe button
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
And I click on subscriptions creation under tasks
Then I should see created application "<appName>" at the top of the Approval Tasks table for "<usertype>"
When I click Assign To Me button for "<appName>" Application Details row for "<usertype>"
And I click on Start button for "<appName>" Application Details row for "<usertype>"
And I select "<Action>" and click complete button for "<appName>" Application Details row for "<usertype>"
Then I should see Enter aprrove/reject reasons pop up header as "Enter approve/reject reasons"
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
When I click Assign To Me button for "<appName>" Application Details row for "<usertype>"
And I click on Start button for "<appName>" Application Details row for "<usertype>"
And I select "<Action>" and click complete button for "<appName>" Application Details row for "<usertype>"
Then I should see Enter aprrove/reject reasons pop up header as "Enter approve/reject reasons"
When I enter aprrove/reject reason as "Approved"
And click aprrove/reject reason ok button
Then I should not see the created application in Approval Tasks table as "<AppName>" for "<usertype>"
When I click on apimanager Manager dialogAdmin 
And I click on apimanager Manager logout button
Then I should see the apimanager Manager page header as "Manager"
When I click on close window
#Then I am in apimanager
When I click on apimanager My Subscriptions
Then I should see the apimanager Subscriptions page header as "Subscriptions"
When I select created application "<appName>" from the dropdown for "<usertype>"
And I enter token validity of production as "<validity>"
And I click generate under apimanager Subscriptions page production
Then I should see consumer Key of production
And I should see consumer Secret of production
When I enter token validity of sandbox as "<validity>"
And I click generate under apimanager Subscriptions page sandbox
Then I should see consumer Key of sandbox
And I should see consumer Secret of sandbox
#When I close the api manager 
#And I am in identity server page
#And I enter identity server username credentials
#And I click on identity server sign in
#Then I should see the ids Home page header as "WSO2 Identity Server Home"
#When I click on identity server Main tab
#Then I should see ids Main menu "Service Providers" as the first item
#When I click on ids Main List link
#Then I should see "<appName>" Application in Service Providers table for "<usertype>"
#When I click on "<appName>" edit link for "<usertype>"
#Then I should see ids Service providers page header as "Service Providers"
#When I click on Inbound Authentication Configuration
#And I click on OAuth/OpenID Connect Configuration
#And I click on OAth client secret show button
#Then I should see OAth client key
#And I should see OAth client secret
#When I click on Local and Outbound Authentication Configuration 
#And I select Advanced Configuration
#Then I should see Advanced Authentication Configuration for "<appName>" page for "<usertype>"
#When I click on Add Authentication Step
#And I select "LOA" under Local Authenticators
#And I click update
#Then I should see ids Service providers page header as "Service Providers"
#When I click on Inbound Authentication Configuration
#And I click on OAuth/OpenID Connect Configuration
#And I click edit in Actions 
#Then I should see View/Update application settings page header as "View/Update application settings"
#When I click on Code
#Then I should see "<Callback URL>" as call back url
#When I click on Implicit
#And I click on Password 
#And I click on Client Credential 
#And I click on Refresh Token 
#And I click on SAML 
#And I click on IWA-NTLM
#And I click on View/Update application settings page update
#Then I should see Application updated successfully pop up message as "Application updated successfully"

Examples:
|usertype|ApplicationDetails |Action |status|apiName	  |operator|validity|CallbackURL                                                      |Description |appName				 |
|LOGOUT  |Unlimited          |Approve|READY |location     |DIALOG  |-1      |https://identity.qa.example.com/playground2/oauth2.jsp?reset=true|AuXTestAPI  |AuxTestingAppRTC_086 |

