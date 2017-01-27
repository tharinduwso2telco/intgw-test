Feature: Operator Admin Approves created Subscriptions

### Data Preparation for Subscription Approval Scenarios ###
@BeforeTest @ExternalGatewaySubscriptonApproval 
Scenario Outline: Create and Publish APIs needed for Subscription Management
Given I am in apipublisher
When I provide apipublisher username and password for "<usertype>"
And I click on apipublisher login button
Then I should see apipublisher username "<usertype>" at the top right corner of the page
When I click on apipublisher Add link
And I click Design new API radio button
And I click Start Creating button
And I provide apipublisher Design name as "<apiName>"
And I provide apipublisher Design Context as "ProdTest"
And I provide apipublisher Design Version as "<version>"
And I provide apipublisher Design Provide URL pattern as "/aux/wso2tel/"
And I click on apipublisher Design "get" checkbox
And I click on Resource Add button
And I click on apipublisher Design implement button
And I click on Manage API link
When I provide apipublisher Implement endpoint type as "HTTP/REST Endpoint"
And I provide apipublisher Implement production endpoint as "<prodEndpoint>"
And I click on apipublisher apipublisher manage button
And I select "<tier>" as apipublisher Manage tier availability
And I click on apipublisher Manage save & publish button
Then I should see api successfully published pop up with "Congratulations... What's Next?"
When I click on pop up button Go to Overview
Then I should see the status as "PUBLISHED"
Given I am in apimanager
When I click on apimanager login
Then I should see the apimanager "Login" pop up
When I enter apimanager Login username and password for "<usertypeSP>" 
And I click on apimanager Login pop up login button
Then I should see apimanager "<usertypeSP>" at the top right corner of the page
And I click on apimanager APIs module
Then I should search apimanager API "<apiName>"
When I click on the apimanager "<apiName>" "<version>" api
Then I should see the apimanager APIs "<apiName>" status as "Published"
Examples:
| usertype|usertypeSP|apiName     |version|prodEndpoint |roleType		   |tier                                                                  |
|PUBLISHER|APPCREATE |SubTestA    |v1     |auxProd	   |Internal/publisher |Unlimited,Default,Requestbased,Silver,Subscription,Gold,Premium,Bronze|

@BeforeTest @ExternalGatewaySubscriptonApproval  
Scenario Outline: User creates an application 
Given I am in apimanager
When I click on apimanager login
Then I should see the apimanager "Login" pop up
When I enter apimanager Login username and password for "<usertype>" 
And I click on apimanager Login pop up login button
Then I should see apimanager "<usertype>" at the top right corner of the page
When I click on apimanager My Applications
Then I should see the apimanager Application page header as "Applications"
Then I click on apimanager Add Application
And I enter "<appName>" as name and "<Description>" as Description
And I click on Add button
Then I should see the added Application name as "<appName>" and the "<status>" as status
Examples:
|usertype |appName      |Description  |status  |
|APPCREATE|AuXTestAPPA	|AuXTestingAPP|INACTIVE|
|APPCREATE|AuXTestAPPB	|AuXTestingAPP|INACTIVE|
|APPCREATE|AuXTestAPPC	|AuXTestingAPP|INACTIVE|
|APPCREATE|AuXTestAPPD	|AuXTestingAPP|INACTIVE|
|APPCREATE|AuXTestAPPE	|AuXTestingAPP|INACTIVE|

@BeforeTest @ExternalGatewaySubscriptonApproval  
Scenario Outline: Application Approval
Given I am in hubmanager
Then I should see the apimanager Manager page header as "Manager"
When I enter apimanager Manager page admin username credentials
And I click on apimanager Manager page login button
Then I should see the apimanager Manager Home page header as "Home"
And I should see apimanager Manager Home Billing Workflow Blacklist Whitelist tabs
When I click on apimanager Manager page Workflow tab
Then I should see apimanager Manager Approval Tasks page header as "Approval Tasks"
When I click on Application creation link
Then I should see created application "<appname>" at the top of the Approval Tasks table for "<usertype>"
And I should see the status of the application "<appname>" approval task as "READY" 
And I click Assign To Me button for "<appname>" Application Details row for "<usertype>"
And I should see the status of the application "<appname>" approval task as "RESERVED" 
And I click on Start button for "<appname>" Application Details row for "<usertype>"
Then I should see the status of the application "<appname>" approval task as "IN_PROGRESS" 
And I select "<action>" and click complete button for "<appname>" Application Details row for "<usertype>"
Then I should see Enter aprrove/reject reasons pop up header as "Enter approve/reject reasons"
When I enter aprrove/reject reason as "Approve"
And click aprrove/reject reason ok button
Then I should not see the created application in Approval Tasks table as "<appname>" for "<usertype>"
Given I am in apimanager
When I click on apimanager login
Then I should see the apimanager "Login" pop up
When I enter apimanager Login username and password for "<usertypeSP>" 
And I click on apimanager Login pop up login button
Then I should see apimanager "<usertypeSP>" at the top right corner of the page
When I click on apimanager My Applications
Then I should see the apimanager Application page header as "Applications"
Then I should see the Application "<appname>" workflow status as "<status>" and Tier as "<tier>"
Examples:
|usertype |usertypeSP  |appname      |action  |status |tier    |
|AdminUser|APPCREATE   |AuXTestAPPA  |Approve |ACTIVE |Large   |
|AdminUser|APPCREATE   |AuXTestAPPB  |Approve |ACTIVE |Large   |
|AdminUser|APPCREATE   |AuXTestAPPC  |Approve |ACTIVE |Large   |
|AdminUser|APPCREATE   |AuXTestAPPD  |Approve |ACTIVE |Large   |
|AdminUser|APPCREATE   |AuXTestAPPE  |Approve |ACTIVE |Large   |

@BeforeTest @ExternalGatewaySubscriptonApproval  
Scenario Outline: User subscribes to Custom API
Given I am in apimanager
When I click on apimanager login
Then I should see the apimanager "Login" pop up
When I enter apimanager Login username and password for "<usertype>" 
And I click on apimanager Login pop up login button
Then I should see apimanager "<usertype>" at the top right corner of the page
And I click on apimanager APIs module
Then I should search apimanager API "<apiName>"
When I click on the apimanager "<apiName>" "<version>" api
Then I should see the apimanager APIs "<apiName>" status as "Published"
When I click on Applications dropdown
Then I should see "<appName>" Application for "<usertype>"
When I select "<appName>" for "<usertype>"
And I click apimanager "<apiName>" API page subscribe button
Then I should see "Subscription Awaiting Approval" on Subscription Successful pop up
When I click Go to My Subscription button
Then I should see the apimanager Application "<appName>" Subscriptions page header as "Subscriptions"
Then I should see the "<apiName>" and "<version>" under Subscribed APIs
Examples:
| usertype |apiName  |version |appName       |
|APPCREATE |SubTestA |v1      |AuXTestAPPA   |
|APPCREATE |SubTestA |v1      |AuXTestAPPB   |
|APPCREATE |SubTestA |v1      |AuXTestAPPC   |
|APPCREATE |SubTestA |v1      |AuXTestAPPD   |
|APPCREATE |SubTestA |v1      |AuXTestAPPE   |


### Subscription Approval Scenarios ### 
@ExternalGatewaySubscriptonApproval  
Scenario Outline: HUB-347 : Operator admin user assigns a subscription task to himself without throttling layer subscription
Given I am in hubmanager
Then I should see the apimanager Manager page header as "Manager"
When I enter apimanager Manager page admin username credentials
And I click on apimanager Manager page login button
Then I should see the apimanager Manager Home page header as "Home"
And I should see apimanager Manager Home Billing Workflow Blacklist Whitelist tabs
When I click on apimanager Manager page Workflow tab
Then I should see apimanager Manager Approval Tasks page header as "Approval Tasks"
And I click on subscriptions creation under tasks
Then I should see created subscription with "<appname>" and "<subscribeAPI>" "<version>" at the top of the Approval Tasks table for "<usertype>"
And I should see the status of the subscription "<appname>" "<subscribeAPI>" "<version>" approval task as "READY"
And I click Assign To Me button for "<appname>" "<subscribeAPI>" "<version>" Subscription Details row for "<usertype>"
And I should see the status of the subscription "<appname>" "<subscribeAPI>" "<version>" approval task as "RESERVED" 
Examples:
|usertype |appname    |subscribeAPI|version|
|AdminUser|AuXTestAPPA|SubTestA    |v1     |

@ExternalGatewaySubscriptonApproval  
Scenario Outline: HUB-349 : Operator admin user assigns a subscription task to himself and applies throttling layer 
Given I am in hubmanager
Then I should see the apimanager Manager page header as "Manager"
When I enter apimanager Manager page admin username credentials
And I click on apimanager Manager page login button
Then I should see the apimanager Manager Home page header as "Home"
And I should see apimanager Manager Home Billing Workflow Blacklist Whitelist tabs
When I click on apimanager Manager page Workflow tab
Then I should see apimanager Manager Approval Tasks page header as "Approval Tasks"
And I click on subscriptions creation under tasks
Then I should see created subscription with "<appname>" and "<subscribeAPI>" "<version>" at the top of the Approval Tasks table for "<usertype>"
And I should see the status of the subscription "<appname>" "<subscribeAPI>" "<version>" approval task as "READY"
And I click Assign To Me button for "<appname>" "<subscribeAPI>" "<version>" Subscription Details row for "<usertype>"
When I click on Subscription Details drop box for "<appname>" "<subscribeAPI>" "<version>" row for "<usertype>"
And I select "<tiers>" for "<appname>" "<subscribeAPI>" "<version>" Subscription Details row for "<usertype>"
And I should see the status of the subscription "<appname>" "<subscribeAPI>" "<version>" approval task as "RESERVED" 
And I should see the selected throttling layer as "<tiers>" for "<appname>" "<subscribeAPI>" "<version>" Subscription
Examples:
|usertype |appname    |tiers    |subscribeAPI |version|
|AdminUser|AuXTestAPPB|Unlimited|SubTestA     |v1     |

@ExternalGatewaySubscriptonApproval  
Scenario Outline: HUB-350 : Operator admin user starts assigned task without applying throttling layer
Given I am in hubmanager
Then I should see the apimanager Manager page header as "Manager"
When I enter apimanager Manager page admin username credentials
And I click on apimanager Manager page login button
Then I should see the apimanager Manager Home page header as "Home"
And I should see apimanager Manager Home Billing Workflow Blacklist Whitelist tabs
When I click on apimanager Manager page Workflow tab
Then I should see apimanager Manager Approval Tasks page header as "Approval Tasks"
And I click on subscriptions creation under tasks
Then I should see created subscription with "<appname>" and "<subscribeAPI>" "<version>" at the top of the Approval Tasks table for "<usertype>"
And I should see the status of the subscription "<appname>" "<subscribeAPI>" "<version>" approval task as "RESERVED" 
And I click on Start button for "<appname>" "<subscribeAPI>" "<version>" Subscription Details row for "<usertype>"
Then I should see the status of the subscription "<appname>" "<subscribeAPI>" "<version>" approval task as "IN_PROGRESS"
Then I click on action dropdown of "<appname>" "<subscribeAPI>" "<version>" task
And I should see Action "<options>" of the "<appname>" "<subscribeAPI>" "<version>" task in the dropdown
Examples:
|usertype |appname    |options        |subscribeAPI |version|
|AdminUser|AuXTestAPPA|Approve,Reject |SubTestA     |v1     |


@ExternalGatewaySubscriptonApproval 
Scenario Outline: HUB-351 : Operator admin user starts assigned task and applies throttling layer
Given I am in hubmanager
Then I should see the apimanager Manager page header as "Manager"
When I enter apimanager Manager page admin username credentials
And I click on apimanager Manager page login button
Then I should see the apimanager Manager Home page header as "Home"
And I should see apimanager Manager Home Billing Workflow Blacklist Whitelist tabs
When I click on apimanager Manager page Workflow tab
Then I should see apimanager Manager Approval Tasks page header as "Approval Tasks"
And I click on subscriptions creation under tasks
Then I should see created subscription with "<appname>" and "<subscribeAPI>" "<version>" at the top of the Approval Tasks table for "<usertype>"
And I should see the status of the subscription "<appname>" "<subscribeAPI>" "<version>" approval task as "RESERVED" 
When I click on Subscription Details drop box for "<appname>" "<subscribeAPI>" "<version>" row for "<usertype>"
And I select "<tiers>" for "<appname>" "<subscribeAPI>" "<version>" Subscription Details row for "<usertype>"
And I click on Start button for "<appname>" "<subscribeAPI>" "<version>" Subscription Details row for "<usertype>"
Then I should see the status of the subscription "<appname>" "<subscribeAPI>" "<version>" approval task as "IN_PROGRESS"
And I should see the selected throttling layer as "<tiers>" for "<appname>" "<subscribeAPI>" "<version>" Subscription
Then I click on action dropdown of "<appname>" "<subscribeAPI>" "<version>" task
And I should see Action "<options>" of the "<appname>" "<subscribeAPI>" "<version>" task in the dropdown
Examples:
|usertype |appname      |options        |tiers    |subscribeAPI |version|
|AdminUser|AuXTestAPPB  |Approve,Reject |Unlimited|SubTestA     |v1     |


@ExternalGatewaySubscriptonApproval 
Scenario Outline: HUB-352 : Operator admin user starts assigned task without changing already applied throttling layer
Given I am in hubmanager
Then I should see the apimanager Manager page header as "Manager"
When I enter apimanager Manager page admin username credentials
And I click on apimanager Manager page login button
Then I should see the apimanager Manager Home page header as "Home"
And I should see apimanager Manager Home Billing Workflow Blacklist Whitelist tabs
When I click on apimanager Manager page Workflow tab
Then I should see apimanager Manager Approval Tasks page header as "Approval Tasks"
And I click on subscriptions creation under tasks
Then I should see created subscription with "<appname>" and "<subscribeAPI>" "<version>" at the top of the Approval Tasks table for "<usertype>"
When I click on Subscription Details drop box for "<appname>" "<subscribeAPI>" "<version>" row for "<usertype>"
And I select "<tiers>" for "<appname>" "<subscribeAPI>" "<version>" Subscription Details row for "<usertype>"
And I should see the status of the subscription "<appname>" "<subscribeAPI>" "<version>" approval task as "READY"
And I click Assign To Me button for "<appname>" "<subscribeAPI>" "<version>" Subscription Details row for "<usertype>"
And I should see the status of the subscription "<appname>" "<subscribeAPI>" "<version>" approval task as "RESERVED" 
And I click on Start button for "<appname>" "<subscribeAPI>" "<version>" Subscription Details row for "<usertype>"
Then I should see the status of the subscription "<appname>" "<subscribeAPI>" "<version>" approval task as "IN_PROGRESS"
And I should see the selected throttling layer as "<tiers>" for "<appname>" "<subscribeAPI>" "<version>" Subscription
Then I click on action dropdown of "<appname>" "<subscribeAPI>" "<version>" task
And I should see Action "<options>" of the "<appname>" "<subscribeAPI>" "<version>" task in the dropdown
Examples:
|usertype |appname        |options        |tiers    |subscribeAPI |version|
|AdminUser|AuXTestAPPC    |Approve,Reject |Premium  |SubTestA     |v1     |


@ExternalGatewaySubscriptonApproval 
Scenario Outline: HUB-353 : Operator admin user starts assigned task and changes the existing throttling layer
Given I am in hubmanager
Then I should see the apimanager Manager page header as "Manager"
When I enter apimanager Manager page admin username credentials
And I click on apimanager Manager page login button
Then I should see the apimanager Manager Home page header as "Home"
And I should see apimanager Manager Home Billing Workflow Blacklist Whitelist tabs
When I click on apimanager Manager page Workflow tab
Then I should see apimanager Manager Approval Tasks page header as "Approval Tasks"
And I click on subscriptions creation under tasks
Then I should see created subscription with "<appname>" and "<subscribeAPI>" "<version>" at the top of the Approval Tasks table for "<usertype>"
When I click on Subscription Details drop box for "<appname>" "<subscribeAPI>" "<version>" row for "<usertype>"
And I select "<olderTiers>" for "<appname>" "<subscribeAPI>" "<version>" Subscription Details row for "<usertype>"
And I should see the status of the subscription "<appname>" "<subscribeAPI>" "<version>" approval task as "READY"
And I click Assign To Me button for "<appname>" "<subscribeAPI>" "<version>" Subscription Details row for "<usertype>"
And I should see the selected throttling layer as "<olderTiers>" for "<appname>" "<subscribeAPI>" "<version>" Subscription
And I should see the status of the subscription "<appname>" "<subscribeAPI>" "<version>" approval task as "RESERVED" 
And I click on Start button for "<appname>" "<subscribeAPI>" "<version>" Subscription Details row for "<usertype>"
Then I should see the status of the subscription "<appname>" "<subscribeAPI>" "<version>" approval task as "IN_PROGRESS"
And I select "<newTiers>" for "<appname>" "<subscribeAPI>" "<version>" Subscription Details row for "<usertype>"
And I click on Start button for "<appname>" "<subscribeAPI>" "<version>" Subscription Details row for "<usertype>"
Then I should see the status of the subscription "<appname>" "<subscribeAPI>" "<version>" approval task as "IN_PROGRESS"
And I should see the selected throttling layer as "<newTiers>" for "<appname>" "<subscribeAPI>" "<version>" Subscription
Then I click on action dropdown of "<appname>" "<subscribeAPI>" "<version>" task
And I should see Action "<options>" of the "<appname>" "<subscribeAPI>" "<version>" task in the dropdown
Examples:
|usertype |appname       |options        |olderTiers   |newTiers |subscribeAPI |version|
|AdminUser|AuXTestAPPD   |Approve,Reject |Unlimited    |Premium  |SubTestA     |v1     |


@ExternalGatewaySubscriptonApproval  
Scenario Outline: HUB-354 : Operator admin user approves task without applying throttling layer
Given I am in hubmanager
Then I should see the apimanager Manager page header as "Manager"
When I enter apimanager Manager page admin username credentials
And I click on apimanager Manager page login button
Then I should see the apimanager Manager Home page header as "Home"
And I should see apimanager Manager Home Billing Workflow Blacklist Whitelist tabs
When I click on apimanager Manager page Workflow tab
Then I should see apimanager Manager Approval Tasks page header as "Approval Tasks"
And I click on subscriptions creation under tasks
Then I should see created subscription with "<appname>" and "<subscribeAPI>" "<version>" at the top of the Approval Tasks table for "<usertype>"
And I should see the status of the subscription "<appname>" "<subscribeAPI>" "<version>" approval task as "RESERVED" 
And I click on Start button for "<appname>" "<subscribeAPI>" "<version>" Subscription Details row for "<usertype>"
Then I should see the status of the subscription "<appname>" "<subscribeAPI>" "<version>" approval task as "IN_PROGRESS"
And I select "<action>" and click complete button for "<appname>" "<subscribeAPI>" "<version>" Subscription Details row for "<usertype>"
Then I should see Enter aprrove/reject reasons pop up header as "Enter approve/reject reasons"
When I enter aprrove/reject reason as "Approve"
And click aprrove/reject reason ok button
Then I should not see created subscription with "<appname>" and "<subscribeAPI>" "<version>" in the Approval Tasks table
Given I am in apimanager
When I click on apimanager login
Then I should see the apimanager "Login" pop up
When I enter apimanager Login username and password for "<usertypeSP>" 
And I click on apimanager Login pop up login button
Then I should see apimanager "<usertypeSP>" at the top right corner of the page
When I click on apimanager My Applications
Then I should see the apimanager Application page header as "Applications"
When I click on apimanager Application "<appname>"
Then I click on Application "<appname>" "Subscriptions" tab
Then I should see the API "<subscribeAPI>" "<version>" status as "<status>" and Subscription Tier as "<tier>"
Examples:
|usertype |usertypeSP|appname     |action  |status    |tier     |subscribeAPI |version|
|AdminUser|APPCREATE |AuXTestAPPA |Approve |UNBLOCKED |Bronze   |SubTestA     |v1     |  


@ExternalGatewaySubscriptonApproval 
Scenario Outline: HUB-355 :  Operator admin user approves task while applying throttling layer
Given I am in hubmanager
Then I should see the apimanager Manager page header as "Manager"
When I enter apimanager Manager page admin username credentials
And I click on apimanager Manager page login button
Then I should see the apimanager Manager Home page header as "Home"
And I should see apimanager Manager Home Billing Workflow Blacklist Whitelist tabs
When I click on apimanager Manager page Workflow tab
Then I should see apimanager Manager Approval Tasks page header as "Approval Tasks"
And I click on subscriptions creation under tasks
Then I should see created subscription with "<appname>" and "<subscribeAPI>" "<version>" at the top of the Approval Tasks table for "<usertype>"
And I should see the status of the subscription "<appname>" "<subscribeAPI>" "<version>" approval task as "RESERVED" 
And I click on Start button for "<appname>" "<subscribeAPI>" "<version>" Subscription Details row for "<usertype>"
Then I should see the status of the subscription "<appname>" "<subscribeAPI>" "<version>" approval task as "IN_PROGRESS"
When I click on Subscription Details drop box for "<appname>" "<subscribeAPI>" "<version>" row for "<usertype>"
And I select "<tier>" for "<appname>" "<subscribeAPI>" "<version>" Subscription Details row for "<usertype>"
And I select "<action>" and click complete button for "<appname>" "<subscribeAPI>" "<version>" Subscription Details row for "<usertype>"
Then I should see Enter aprrove/reject reasons pop up header as "Enter approve/reject reasons"
When I enter aprrove/reject reason as "Approve"
And click aprrove/reject reason ok button
Then I should not see created subscription with "<appname>" and "<subscribeAPI>" "<version>" in the Approval Tasks table
Given I am in apimanager
When I click on apimanager login
Then I should see the apimanager "Login" pop up
When I enter apimanager Login username and password for "<usertypeSP>" 
And I click on apimanager Login pop up login button
Then I should see apimanager "<usertypeSP>" at the top right corner of the page
When I click on apimanager My Applications
Then I should see the apimanager Application page header as "Applications"
When I click on apimanager Application "<appname>"
Then I click on Application "<appname>" "Subscriptions" tab
Then I should see the API "<subscribeAPI>" "<version>" status as "<status>" and Subscription Tier as "<tier>"
Examples:
|usertype |usertypeSP|appname     |action  |status    |tier        |subscribeAPI |version|
|AdminUser|APPCREATE |AuXTestAPPB |Approve |UNBLOCKED |Unlimited   |SubTestA     |v1     |


@ExternalGatewaySubscriptonApproval 
Scenario Outline: HUB-356 : Operator admin user approves task without changing already applied throttling layer
Given I am in hubmanager
Then I should see the apimanager Manager page header as "Manager"
When I enter apimanager Manager page admin username credentials
And I click on apimanager Manager page login button
Then I should see the apimanager Manager Home page header as "Home"
And I should see apimanager Manager Home Billing Workflow Blacklist Whitelist tabs
When I click on apimanager Manager page Workflow tab
Then I should see apimanager Manager Approval Tasks page header as "Approval Tasks"
And I click on subscriptions creation under tasks
Then I should see created subscription with "<appname>" and "<subscribeAPI>" "<version>" at the top of the Approval Tasks table for "<usertype>"
When I click on Subscription Details drop box for "<appname>" "<subscribeAPI>" "<version>" row for "<usertype>"
And I select "<tier>" for "<appname>" "<subscribeAPI>" "<version>" Subscription Details row for "<usertype>"
And I should see the status of the subscription "<appname>" "<subscribeAPI>" "<version>" approval task as "RESERVED" 
And I click on Start button for "<appname>" "<subscribeAPI>" "<version>" Subscription Details row for "<usertype>"
Then I should see the status of the subscription "<appname>" "<subscribeAPI>" "<version>" approval task as "IN_PROGRESS"
And I select "<action>" and click complete button for "<appname>" "<subscribeAPI>" "<version>" Subscription Details row for "<usertype>"
Then I should see Enter aprrove/reject reasons pop up header as "Enter approve/reject reasons"
When I enter aprrove/reject reason as "Approve"
And click aprrove/reject reason ok button
Then I should not see created subscription with "<appname>" and "<subscribeAPI>" "<version>" in the Approval Tasks table
Given I am in apimanager
When I click on apimanager login
Then I should see the apimanager "Login" pop up
When I enter apimanager Login username and password for "<usertypeSP>" 
And I click on apimanager Login pop up login button
Then I should see apimanager "<usertypeSP>" at the top right corner of the page
When I click on apimanager My Applications
Then I should see the apimanager Application page header as "Applications"
When I click on apimanager Application "<appname>"
Then I click on Application "<appname>" "Subscriptions" tab
Then I should see the API "<subscribeAPI>" "<version>" status as "<status>" and Subscription Tier as "<tier>"
Examples:
|usertype |usertypeSP|appname       |action  |status    |tier        |subscribeAPI |version|
|AdminUser|APPCREATE |AuXTestAPPC   |Approve |UNBLOCKED |Unlimited   |SubTestA     |v1     |


@ExternalGatewaySubscriptonApproval 
Scenario Outline: HUB-357 : Operator admin user approves task and changes the previously applied throttling layer
Given I am in hubmanager
Then I should see the apimanager Manager page header as "Manager"
When I enter apimanager Manager page admin username credentials
And I click on apimanager Manager page login button
Then I should see the apimanager Manager Home page header as "Home"
And I should see apimanager Manager Home Billing Workflow Blacklist Whitelist tabs
When I click on apimanager Manager page Workflow tab
Then I should see apimanager Manager Approval Tasks page header as "Approval Tasks"
And I click on subscriptions creation under tasks
Then I should see created subscription with "<appname>" and "<subscribeAPI>" "<version>" at the top of the Approval Tasks table for "<usertype>"
When I click on Subscription Details drop box for "<appname>" "<subscribeAPI>" "<version>" row for "<usertype>"
And I select "<olderTier>" for "<appname>" "<subscribeAPI>" "<version>" Subscription Details row for "<usertype>"
And I should see the status of the subscription "<appname>" "<subscribeAPI>" "<version>" approval task as "RESERVED" 
And I click on Start button for "<appname>" "<subscribeAPI>" "<version>" Subscription Details row for "<usertype>"
Then I should see the status of the subscription "<appname>" "<subscribeAPI>" "<version>" approval task as "IN_PROGRESS"
And I select "<newTier>" for "<appname>" "<subscribeAPI>" "<version>" Subscription Details row for "<usertype>"
And I select "<action>" and click complete button for "<appname>" "<subscribeAPI>" "<version>" Subscription Details row for "<usertype>"
Then I should see Enter aprrove/reject reasons pop up header as "Enter approve/reject reasons"
When I enter aprrove/reject reason as "Approve"
And click aprrove/reject reason ok button
Then I should not see created subscription with "<appname>" and "<subscribeAPI>" "<version>" in the Approval Tasks table
Given I am in apimanager
When I click on apimanager login
Then I should see the apimanager "Login" pop up
When I enter apimanager Login username and password for "<usertypeSP>" 
And I click on apimanager Login pop up login button
Then I should see apimanager "<usertypeSP>" at the top right corner of the page
When I click on apimanager My Applications
Then I should see the apimanager Application page header as "Applications"
When I click on apimanager Application "<appname>"
Then I click on Application "<appname>" "Subscriptions" tab
Then I should see the API "<subscribeAPI>" "<version>" status as "<status>" and Subscription Tier as "<tier>"
Examples:
|usertype |usertypeSP|appname       |action  |status    |olderTier   |newTier |subscribeAPI |version|
|AdminUser|APPCREATE |AuXTestAPPD   |Approve |UNBLOCKED |Unlimited   |Gold    |SubTestA     |v1     |


@ExternalGatewaySubscriptonApproval 
Scenario Outline: HUB-358 : Operator admin user rejects subscription approval task
Given I am in hubmanager
Then I should see the apimanager Manager page header as "Manager"
When I enter apimanager Manager page admin username credentials
And I click on apimanager Manager page login button
Then I should see the apimanager Manager Home page header as "Home"
And I should see apimanager Manager Home Billing Workflow Blacklist Whitelist tabs
When I click on apimanager Manager page Workflow tab
Then I should see apimanager Manager Approval Tasks page header as "Approval Tasks"
And I click on subscriptions creation under tasks
Then I should see created subscription with "<appname>" and "<subscribeAPI>" "<version>" at the top of the Approval Tasks table for "<usertype>"
And I should see the status of the subscription "<appname>" "<subscribeAPI>" "<version>" approval task as "READY"
And I click Assign To Me button for "<appname>" "<subscribeAPI>" "<version>" Subscription Details row for "<usertype>"
And I should see the status of the subscription "<appname>" "<subscribeAPI>" "<version>" approval task as "RESERVED" 
And I click on Start button for "<appname>" "<subscribeAPI>" "<version>" Subscription Details row for "<usertype>"
Then I should see the status of the subscription "<appname>" "<subscribeAPI>" "<version>" approval task as "IN_PROGRESS"
And I select "<action>" and click complete button for "<appname>" "<subscribeAPI>" "<version>" Subscription Details row for "<usertype>"
Then I should see Enter aprrove/reject reasons pop up header as "Enter approve/reject reasons"
When I enter aprrove/reject reason as "Reject"
And click aprrove/reject reason ok button
Then I should not see created subscription with "<appname>" and "<subscribeAPI>" "<version>" in the Approval Tasks table
Given I am in apimanager
When I click on apimanager login
Then I should see the apimanager "Login" pop up
When I enter apimanager Login username and password for "<usertypeSP>" 
And I click on apimanager Login pop up login button
Then I should see apimanager "<usertypeSP>" at the top right corner of the page
When I click on apimanager My Applications
Then I should see the apimanager Application page header as "Applications"
When I click on apimanager Application "<appname>"
Then I click on Application "<appname>" "Subscriptions" tab
Then I should see the API "<subscribeAPI>" "<version>" status as "<status>" and Subscription Tier as "<tier>"
Examples:
|usertype |usertypeSP|appname     |action  |status   |tier    |subscribeAPI |version|
|AdminUser|APPCREATE |AuXTestAPPE |Reject  |REJECTED |Default |SubTestA     |v1     |


@ExternalGatewaySubscriptonApproval  
Scenario Outline: HUB-645 : SP unsubscribe API from application before approval
Given I am in apimanager
When I click on apimanager login
Then I should see the apimanager "Login" pop up
When I enter apimanager Login username and password for "<usertypeSP>" 
And I click on apimanager Login pop up login button
Then I should see apimanager "<usertypeSP>" at the top right corner of the page
When I click on apimanager My Applications
When I click on apimanager Application "<appname>"
When I click on Application "<appname>" "Subscriptions" tab
Then I unsubscribe existing "<apiname>" with "<version>" if subscription exist
And I click on apimanager APIs module
Then I should search apimanager API "<apiname>"
When I click on the apimanager "<apiname>" "<version>" api
Then I should see the apimanager APIs "<apiname>" status as "Published"
When I click on Applications dropdown
Then I should see "<appname>" Application for "<usertypeSP>"
When I select "<appname>" for "<usertypeSP>"
And I click apimanager "<apiname>" API page subscribe button
Then I should see "Subscription Awaiting Approval" on Subscription Successful pop up
When I click Go to My Subscription button
Then I should see the apimanager Application "<appname>" Subscriptions page header as "Subscriptions"
Then I should see the API "<apiname>" "<version>" status as "<status>" and Subscription Tier as "<tier>"
Given I am in hubmanager
Then I should see the apimanager Manager page header as "Manager"
When I enter apimanager Manager page admin username credentials
And I click on apimanager Manager page login button
Then I should see the apimanager Manager Home page header as "Home"
And I should see apimanager Manager Home Billing Workflow Blacklist Whitelist tabs
When I click on apimanager Manager page Workflow tab
Then I should see apimanager Manager Approval Tasks page header as "Approval Tasks"
And I click on subscriptions creation under tasks
Then I should see created subscription with "<appname>" and "<apiname>" "<version>" at the top of the Approval Tasks table for "<usertype>"
And I should see the status of the subscription "<appname>" "<apiname>" "<version>" approval task as "READY"
Given I am in apimanager
When I click on apimanager login
Then I should see the apimanager "Login" pop up
When I enter apimanager Login username and password for "<usertypeSP>" 
And I click on apimanager Login pop up login button
Then I should see apimanager "<usertypeSP>" at the top right corner of the page
When I click on apimanager My Applications
Then I should see the apimanager Application page header as "Applications"
When I click on apimanager Application "<appname>"
When I click on Application "<appname>" "Subscriptions" tab
Then I should see the "<apiname>" and "<version>" under Subscribed APIs
When I unsubscribe existing "<apiname>" with "<version>"
Then I should see the confirm delete popup with "Confirm Delete"
And I click on confirm delete popup Yes button
Given I am in hubmanager
Then I should see the apimanager Manager page header as "Manager"
When I enter apimanager Manager page admin username credentials
And I click on apimanager Manager page login button
Then I should see the apimanager Manager Home page header as "Home"
And I should see apimanager Manager Home Billing Workflow Blacklist Whitelist tabs
When I click on apimanager Manager page Workflow tab
Then I should see apimanager Manager Approval Tasks page header as "Approval Tasks"
And I click on subscriptions creation under tasks
Then I should see created application "<appname>" is removed from the Approval Tasks table for "<usertype>"

Examples:
|usertype |usertypeSP|appname     |status   |tier    |apiname    |version|
|AdminUser|APPCREATE |AuXTestAPPA |ON_HOLD  |Default |SubTestA   |v1     |
