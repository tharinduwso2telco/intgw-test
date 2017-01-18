Feature: End to end flow of Internal Gateway Type 2


Scenario Outline: Internal Gateway flow
#API Publisher Create and Publish an API
Given I am in apipublisher
When I provide apipublisher username and password for "<usertypePub>"
And I click on apipublisher login button
Then I should see apipublisher username "<usertypePub>" at the top right corner of the page
When I search existing API "<apiName>" "<version>" and delete it
When I click on apipublisher Add link
And I click Design new API radio button
And I click Start Creating button
And I provide apipublisher Design name as "<apiName>"
And I provide apipublisher Design Context as "<context>"
And I provide apipublisher Design Version as "<version>"
And I provide apipublisher Design Provide URL pattern as "/aux/wso2tel/"
And I click on apipublisher Design "Get" checkbox
And I click on Resource Add button
And I click on apipublisher Design implement button
And I click on Manage API link
When I provide apipublisher Implement endpoint type as "HTTP/REST Endpoint"
And I provide apipublisher Implement production endpoint as "<prodEndpoint>"
And I provide apipublisher Implement sandbox endpoint as "<sandEndpoint>"
And I click on apipublisher apipublisher manage button
And I select "<ApiTier>" as apipublisher Manage tier availability
And I click on apipublisher Manage save & publish button
Then I should see api successfully published pop up with "Congratulations... What's Next?"
When I click on pop up button Go to Overview
Then I should see the status as "PUBLISHED"
#Service Provider Sign up to API store
Given I am in apimanager
When I click on apimanager sign-up button
Then I should see the apimanager sign-up for a new account form as "Create your Account"
When I enter apimanager Sign-up for a new account username for "<usertypeSP>"
And I enter apimanager Sign-up for a new account Password for "<usertypeSP>"
And I enter apimanager Sign-up for a new account Re-type password for "<usertypeSP>"
And I enter apimanager Sign-up for a new account Last name as "<LastName>"
And I enter apimanager Sign-up for a new account First name as "<FirstName>"
And I enter apimanager Sign-up for a new account Email as "<Email>"
And I click on apimanager Sign-up for a new account submit button 
Then I should see the apimanager Sign-up for a new account success pop up with "User added successfully. You can now sign into the API store using the new user account".
When I click on apimanager Sign-up for a new account success pop up ok button
Then I should see the apimanager "Login" pop up
When I enter apimanager Login username and password for "<usertypeSP>"
And I click on apimanager Login pop up login button
Then I should see apimanager "<usertypeSP>" at the top right corner of the page
#Create an Application
When I click on apimanager My Applications
Then I should see the apimanager Application page header as "Applications"
Then I click on apimanager Add Application
And I enter "<appName>" as name and "<Description>" as Description
And I click on Add button
Then I should see the added Application name as "<appName>" and the "<AppStatusBeforeApprove>" as status
#Operator Admin Approves the created application
Given I am in hubmanager
Then I should see the apimanager Manager page header as "Manager"
When I enter apimanager Manager page admin username credentials
And I click on apimanager Manager page login button
Then I should see the apimanager Manager Home page header as "Home"
And I should see apimanager Manager Home Billing Workflow Blacklist Whitelist tabs
When I click on apimanager Manager page Workflow tab
Then I should see apimanager Manager Approval Tasks page header as "Approval Tasks"
When I click on Application creation link
Then I should see created application "<appName>" at the top of the Approval Tasks table for "<usertypeAdmin>"
When I click on Application Details drop box for "<appName>" row for "<usertypeAdmin>"
And I select "<AppTier>" for "<appName>" Application Details row for "<usertypeAdmin>"
And I should see the status of the application "<appName>" approval task as "READY" 
And I click Assign To Me button for "<appName>" Application Details row for "<usertypeAdmin>"
Then I should see the status of the application "<appName>" approval task as "RESERVED"
And I should see the selected throttling layer as "<AppTier>" for "<appName>" Application
And I click on Start button for "<appName>" Application Details row for "<usertypeAdmin>"
Then I should see the status of the application "<appName>" approval task as "IN_PROGRESS"
And I select "<action>" and click complete button for "<appName>" Application Details row for "<usertypeAdmin>"
Then I should see Enter aprrove/reject reasons pop up header as "Enter approve/reject reasons"
When I enter aprrove/reject reason as "Approve"
And click aprrove/reject reason ok button
Then I should not see the created application in Approval Tasks table as "<appName>" for "<usertypeAdmin>"
#Login to store and check the status of the application
Given I am in apimanager
When I click on apimanager login
Then I should see the apimanager "Login" pop up
When I enter apimanager Login username and password for "<usertypeSP>" 
And I click on apimanager Login pop up login button
Then I should see apimanager "<usertypeSP>" at the top right corner of the page
When I click on apimanager My Applications
Then I should see the apimanager Application page header as "Applications"
Then I should see the Application "<appName>" workflow status as "<AppStatusAfterApprove>" and Tier as "<AppTier>"
#Service Provider Subscribe an API
And I click on apimanager APIs module
When I click on the apimanager "<apiName>" "<version>" api
Then I should see the apimanager APIs "<apiName>" status as "Published"
When I click on Applications dropdown
Then I should see "<appName>" Application for "<usertypeSP>"
When I select "<appName>" for "<usertypeSP>"
And I click apimanager "<apiName>" API page subscribe button
Then I should see "Subscription Awaiting Approval" on Subscription Successful pop up
When I click Go to My Subscription button
Then I should see the apimanager Application "<appName>" Subscriptions page header as "Subscriptions"
Then I should see the "<apiName>" and "<version>" under Subscribed APIs
#API Publisher Approves the created subscription
Given I am in hubmanager
Then I should see the apimanager Manager page header as "Manager"
When I enter apimanager Manager page "<apiPublisherOne>" username credentials
And I click on apimanager Manager page login button
Then I should see the apimanager Manager Home page header as "Home"
And I should see apimanager Manager Home Billing Workflow Blacklist Whitelist tabs
When I click on apimanager Manager page Workflow tab
Then I should see apimanager Manager Approval Tasks page header as "Approval Tasks"
And I click on subscriptions creation under tasks
Then I should see created subscription with "<appName>" and "<apiName&version>" at the top of the Approval Tasks table for "<usertypePub>"
And I should see the status of the subscription "<appName>" "<apiName&version>" approval task as "READY"
And I click Assign To Me button for "<appName>" "<apiName&version>" Subscription Details row for "<usertypePub>"
When I click on Subscription Details drop box for "<appName>" "<apiName&version>" row for "<usertypePub>"
And I select "<Subscriptiontiers>" for "<appName>" "<apiName&version>" Subscription Details row for "<usertypePub>"
And I should see the status of the subscription "<appName>" "<apiName&version>" approval task as "RESERVED"
And I should see the selected throttling layer as "<Subscriptiontiers>" for "<appName>" "<apiName&version>" Subscription
And I click on Start button for "<appName>" "<apiName&version>" Subscription Details row for "<usertypePub>"
Then I should see the status of the subscription "<appName>" "<apiName&version>" approval task as "IN_PROGRESS" 
And I select "<action>" and click complete button for "<appName>" "<apiName&version>" Subscription Details row for "<usertypePub>"
Then I should see Enter aprrove/reject reasons pop up header as "Enter approve/reject reasons"
When I enter aprrove/reject reason as "Approve"
And click aprrove/reject reason ok button
Then I should not see created subscription with "<appName>" and "<apiName&version>" in the Approval Tasks table
#Login to store and check the status of the subscription
Given I am in apimanager
When I click on apimanager login
Then I should see the apimanager "Login" pop up
When I enter apimanager Login username and password for "<usertypeSP>" 
And I click on apimanager Login pop up login button
Then I should see apimanager "<usertypeSP>" at the top right corner of the page
When I click on apimanager My Applications
Then I should see the apimanager Application page header as "Applications"
When I click on apimanager Application "<appName>"
Then I click on Application "<appName>" "Subscriptions" tab
Then I should see the API "<apiName&version>" status as "<subscriptionStatus>" and Subscription Tier as "<Subscriptiontiers>"

Examples:
|usertypePub|usertypeSP|usertypeAdmin|apiPublisherOne|apiName   |version|context  |prodEndpoint |sandEndpoint|roleType		      |ApiTier                                                               |LastName   |FirstName   |Email	           |appName         |Description  |AppStatusBeforeApprove|action |AppStatusAfterApprove|AppTier  |Subscriptiontiers|subscriptionStatus|apiName&version|
|PUBLISHER  |APPCREATE |AdminUser    |apipublisherOne|AuxAPI    |v1     |auxapi   |auxProd	    |auxSand	 |Internal/publisher  |Unlimited,Default,Requestbased,Silver,Subscription,Gold,Premium,Bronze|AuxTestLast|AuxTestFirst|AuxTest123@gmail.com|AuXTestAPPM1	|AuXTestingAPP|INACTIVE              |Approve|ACTIVE               |Unlimited|Premium          |UNBLOCKED         |AuxAPI - v1    |

