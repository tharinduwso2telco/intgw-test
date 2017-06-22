Feature: Create SP and Add New Application

#API Publisher Create and Publish an APIs

  @runnerAllsteps
  Scenario Outline: HUB API Create flow
    Given I am in apipublisher
    When I provide apipublisher username and password for "<usertypePub>"
    And I click on apipublisher login button
    Then I should see apipublisher username "<usertypePub>" at the top right corner of the page
    When I click on apipublisher Add link
    And I click Design new API radio button
    And I click Start Creating button
    And I provide apipublisher Design name as "<apiName>"
    And I provide apipublisher Design Context as "<context>"
    And I provide apipublisher Design Version as "<version>"
    And I click on apipublisher Design implement button
    And I click wildcard resource all message button
    And I click on Manage API link
    And I provide apipublisher Implement production endpoint as "<prodEndpoint>"
    And I provide apipublisher Implement sandbox endpoint as "<sandboxEndpoint>"
    And I click on apipublisher apipublisher manage button
    And I select "<ApiTier>" as apipublisher Manage tier availability
    And I click on apipublisher Manage save & publish button
    Then I should see api successfully published pop up with "Congratulations... What's Next?"
    When I click on pop up button Go to Overview
    Then I should see the status as "PUBLISHED"
    Examples:
      |usertypePub|apiName      |version|context        |prodEndpoint                   |sandboxEndpoint                |ApiTier                                                               |
      |PUBLISHER  |payment      |v1     |payment     |http://localhost:8281/payment/v1|http://localhost:8181/payment/v1|Unlimited,Default,Requestbased,Silver,Subscription,Gold,Premium,Bronze|
      |PUBLISHER  |ussd         |v1     |ussd        |http://localhost:8281/ussd/v1     |http://localhost:8181/ussd/v1|Unlimited,Default,Requestbased,Silver,Subscription,Gold,Premium,Bronze|
      |PUBLISHER  |location     |v1     |location     |http://localhost:8281/location/v1|http://localhost:8181/location/v1|Unlimited,Default,Requestbased,Silver,Subscription,Gold,Premium,Bronze|
      |PUBLISHER  |smsmessaging |v1     |smsmessaging|http://localhost:8281/smsmessaging/v1|http://localhost:8181/smsmessaging/v1|Unlimited,Default,Requestbased,Silver,Subscription,Gold,Premium,Bronze|
      |PUBLISHER  |credit       |v1     |credit      |http://localhost:8281/credit/v1|http://localhost:8181/credit/v1|Unlimited,Default,Requestbased,Silver,Subscription,Gold,Premium,Bronze|
      |PUBLISHER  |wallet       |v1     |wallet      |http://localhost:8281/wallet/v1|http://localhost:8181/wallet/v1|Unlimited,Default,Requestbased,Silver,Subscription,Gold,Premium,Bronze|
      |PUBLISHER  |provisioning |v1     |provisioning|http://localhost:8281/provisioning/v1|http://localhost:8181/provisioning/v1|Unlimited,Default,Requestbased,Silver,Subscription,Gold,Premium,Bronze|
      |PUBLISHER  |customerinfo |v1     |customerinfo|http://localhost:8281/customerinfo/v1|http://localhost:8181/customerinfo/v1|Unlimited,Default,Requestbased,Silver,Subscription,Gold,Premium,Bronze|

  Scenario Outline: Create SP and Add New Application
    Given I am in apimanager
    When I click on apimanager sign-up button
    Then I should see the apimanager sign-up for a new account form as "Create your Account"
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
    When I click on apimanager My Applications
    Then I should see the apimanager Application page header as "Applications"
    Then I click on apimanager Add Application
    And I enter "<appName>" as name and "<Description>" as Description
    And I click on Add button
    Then I should see the added Application name as "<appName>" and the "<status>" as status
    Examples:
      | usertype|LastName   |FirstName   |Email               |appName|Description  |status|
      |SP       |Rajith     |Sudarshana  |rajith@wso2telco.com|APPNAME|AuXTestingAPP|INACTIVE|

  Scenario Outline: Create Operator admin users
    Given I am in apimanager
    When I click on apimanager sign-up button
    Then I should see the apimanager sign-up for a new account form as "Create your Account"
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
    Examples:
      | usertype|LastName   |FirstName   |Email     |
      |OPERATOR1ADMIN|TestName1|AuxTestFirst2|ksrajith@gmail.com|
      |OPERATOR2ADMIN|TestName2|AuxTestFirst3|ksrajith@yahoo.com|


  Scenario Outline:Hub administrator creates user role with API creating permission
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
      |OPERATOR1-admin-role|Login|
      |OPERATOR2-admin-role|Login|


  Scenario Outline: Assign operator-admin-roles to operators
    Given I am in identity server page
    When I enter identity server username credentials
    And I click on identity server sign in
    Then I should see the ids Home page header as "WSO2 Identity Server Home"
    When I click on identity server Main tab
    And I click on identity server Configuration Users and Roles List link
    Then I should see ids Configuration menu with first item as "Users and Roles"
    When I click identity server User Management Users link
    Then I should see ids User Management Users page header as "Users"
    When I enter identity server Search Users to Enter user name pattern as "<usertype>"
    And I click on identity server Users search button
    Then I should see the "<usertype>" on ids Users search area
    And I click on ids Users assign roles link under "<usertype>"
    Then I should see the ids List of roles page table header as "Unassigned Roles"
    When I checked the ids List of roles "<roleType>" check box
    And I click on ids List of roles finish button
    Then ids List of roles Role update success message should pop up "successfully."
    When I click on List of roles Role update success message ok button

  Examples:
    |usertype      |roleType|
    |OPERATOR1ADMIN|OPERATOR1-admin-role|
    |OPERATOR2ADMIN|OPERATOR2-admin-role|


  Scenario Outline: Admin Approves the created application
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
  Examples:
    |usertypeAdmin|appName|action |AppTier|
    |AdminUser    |APPNAME|Approve|Unlimited|


  Scenario Outline: Operator Admin Approves the created application
    Given I am in hubmanager
    Then I should see the apimanager Manager page header as "Manager"
    When I enter apimanager Manager page login username and password for "<operatorAdmin>"
    And I click on apimanager Manager page login button
    Then I should see the apimanager Manager Home page header as "Home"
    When I click on apimanager Manager page Workflow tab
    Then I should see apimanager Manager Approval Tasks page header as "Approval Tasks"
    When I click on Application creation link
    Then I should see created application "<appName>" at the top of the Approval Tasks table for "<usertypeAdmin>"
    And I click Assign To Me button for "<appName>" Application Details row for "<usertypeAdmin>"
    Then I should see the status of the application "<appName>" approval task as "RESERVED"
    And I click on Start button for "<appName>" Application Details row for "<usertypeAdmin>"
    Then I should see the status of the application "<appName>" approval task as "IN_PROGRESS"
    And I select "<action>" and click complete button for "<appName>" Application Details row for "<usertypeAdmin>"
    Then I should see Enter aprrove/reject reasons pop up header as "Enter approve/reject reasons"
    When I enter aprrove/reject reason as "Approve"
    And click aprrove/reject reason ok button
    Then I should not see the created application in Approval Tasks table as "<appName>" for "<usertypeAdmin>"
  Examples:
    |operatorAdmin |usertypeAdmin|appName|action |
    |OPERATOR1ADMIN|AdminUser    |APPNAME|Approve|
    |OPERATOR2ADMIN|AdminUser    |APPNAME|Approve|


  Scenario Outline:  Admin approve the APIs
    #Login to store and subscribes to the apis
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
    Then I should search apimanager API "<apiName>"
    When I click on the apimanager "<apiName>" "<version>" api
    Then I should see the apimanager APIs "<apiName>" status as "Published"
    When I select operator as "<operators>"
    And I click on Applications dropdown
    Then I should see "<appName>" Application for "<usertypeSP>"
    And I select "<appName>" for "<usertypeSP>"
    And I click apimanager "<apiName>" API page subscribe button
    Then I should see "Subscription Awaiting Approval" on Subscription Successful pop up
    When I click Go to My Subscription button
    Then I should see the apimanager Application "<appName>" Subscriptions page header as "Subscriptions"
    Then I should see the "<apiName>" and "<version>" under Subscribed APIs

  Examples:
    |usertypeSP|apiName |version|appName |AppStatusAfterApprove|AppTier  |operators|
    |SP        |credit  |v1     |APPNAME |ACTIVE    |Unlimited|OPERATOR1,OPERATOR2|
    |SP        |wallet       |v1     |APPNAME |ACTIVE |Unlimited|OPERATOR1,OPERATOR2|
    |SP        |payment      |v1     |APPNAME |ACTIVE |Unlimited|OPERATOR1,OPERATOR2|
    |SP        |ussd         |v1     |APPNAME |ACTIVE |Unlimited|OPERATOR1,OPERATOR2|
    |SP        |customerinfo |v1     |APPNAME |ACTIVE |Unlimited|OPERATOR1,OPERATOR2|
    |SP        |smsmessaging |v1     |APPNAME |ACTIVE |Unlimited|OPERATOR1,OPERATOR2|
    |SP        |provisioning |v1     |APPNAME |ACTIVE |Unlimited|OPERATOR1,OPERATOR2|


#=========================upto this no issue====need check below================================================

#  Scenario Outline: Operator Admin Approves the created subscription
#    Given I am in hubmanager
#    Then I should see the apimanager Manager page header as "Manager"
#    When I enter apimanager Manager page login username and password for "<operatorAdmin>"
#    And I click on apimanager Manager page login button
#    Then I should see the apimanager Manager Home page header as "Home"
#    #And I should see apimanager Manager Home Billing Workflow Blacklist Whitelist tabs
#    When I click on apimanager Manager page Workflow tab
#    Then I should see apimanager Manager Approval Tasks page header as "Approval Tasks"
#    And I click on subscriptions creation under tasks
#    Then I should see created subscription with "<appName>" and "<apiName>" "<version>" at the top of the Approval Tasks table for "<usertypeAdmin>"
#    When I click on Subscription Details drop box for "<appName>" "<apiName>" "<version>" row for "<usertypeAdmin>"
#    And I select "<Subscriptiontiers>" for "<appName>" "<apiName>" "<version>" Subscription Details row for "<usertypeAdmin>"
#    And I should see the status of the subscription "<appName>" "<apiName>" "<version>" approval task as "READY"
#    And I click Assign To Me button for "<appName>" "<apiName>" "<version>" Subscription Details row for "<usertypeAdmin>"
#    And I should see the status of the subscription "<appName>" "<apiName>" "<version>" approval task as "RESERVED"
#    And I should see the selected throttling layer as "<Subscriptiontiers>" for "<appName>" "<apiName>" "<version>" Subscription
#    And I click on Start button for "<appName>" "<apiName>" "<version>" Subscription Details row for "<usertypeAdmin>"
#    Then I should see the status of the subscription "<appName>" "<apiName>" "<version>" approval task as "IN_PROGRESS"
#    And I select "<action>" and click complete button for "<appName>" "<apiName>" "<version>" Subscription Details row for "<usertypeAdmin>"
#    Then I should see Enter aprrove/reject reasons pop up header as "Enter approve/reject reasons"
#    When I enter aprrove/reject reason as "Approve"
#    And click aprrove/reject reason ok button
#    Then I should not see created subscription with "<appName>" and "<apiName>" "<version>" in the Approval Tasks table
###Login to store and check the status of the subscription
#    Given I am in apimanager
#    When I click on apimanager login
#    Then I should see the apimanager "Login" pop up
#    When I enter apimanager Login username and password for "<usertypeSP>"
#    And I click on apimanager Login pop up login button
#    Then I should see apimanager "<usertypeSP>" at the top right corner of the page
#    When I click on apimanager My Applications
#    Then I should see the apimanager Application page header as "Applications"
#    When I click on apimanager Application "<appName>"
#    Then I click on Application "<appName>" "Subscriptions" tab
#    Then I should see the API "<apiName>" "<version>" status as "<subscriptionStatus>" and Subscription Tier as "<Subscriptiontiers>"
#Examples:
#    |operatorAdmin|usertypePub|usertypeSP|usertypeAdmin|apiName   |version|context        |prodEndpoint                   |sandboxEndpoint                |roleType		   |ApiTier                                                               |LastName   |FirstName   |Email	            |appName        |Description  |AppStatusBeforeApprove|action |AppStatusAfterApprove|AppTier  |Subscriptiontiers|subscriptionStatus|
#    |OPERATOR1ADMIN|PUBLISHER  |Testss |AdminUser    |AuxProdAPI|v1     |APIProdCreation|http://localhost:8280/credit/v1|http://localhost:8181/credit/v1|Internal/publisher|Unlimited,Default,Requestbased,Silver,Subscription,Gold,Premium,Bronze|AuxTestLast|AuxTestFirst|AuxTest123@gmail.com|APPNAME  	|AuXTestingAPP|INACTIVE              |Approve|ACTIVE               |Unlimited|Premium          |UNBLOCKED         |
