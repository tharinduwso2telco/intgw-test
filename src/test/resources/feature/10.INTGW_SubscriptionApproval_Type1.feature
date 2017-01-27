Feature: API Publisher Approves created Subscriptions Type 1

### Data Preparation for Subscription Approval Scenarios ###
@BeforeTest @InternalGatewayTypeOneSubscriptonApproval  
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
|PUBLISHER|APPCREATE |SubTestB    |v1     |auxProd	   |Internal/publisher |Unlimited,Default,Requestbased,Silver,Subscription,Gold,Premium,Bronze|

@BeforeTest @InternalGatewayTypeOneSubscriptonApproval 
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

@BeforeTest @InternalGatewayTypeOneSubscriptonApproval 
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

@BeforeTest @InternalGatewayTypeOneSubscriptonApproval 
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
|APPCREATE |SubTestB |v1      |AuXTestAPPA   |
|APPCREATE |SubTestB |v1      |AuXTestAPPB   |
|APPCREATE |SubTestB |v1      |AuXTestAPPC   |
|APPCREATE |SubTestB |v1      |AuXTestAPPD   |
|APPCREATE |SubTestB |v1      |AuXTestAPPE   |


### Subscription Approval Scenarios ### 
@InternalGatewayTypeOneSubscriptonApproval  
Scenario Outline: DEP-INTGW-658:API publisher starts assigned task without applying throttling layer
Given I am in apimanager
When I click on apimanager login
Then I should see the apimanager "Login" pop up
When I enter apimanager Login username and password for "<usertypeSP>" 
And I click on apimanager Login pop up login button
When I click on apimanager My Applications
When I click on apimanager Application "<appName>"
When I click on Application "<appName>" "Subscriptions" tab
Then I unsubscribe existing "<apiname>" with "<version>" if subscription exist
And I click on apimanager APIs module
Then I should search apimanager API "<apiname>"
When I click on the apimanager "<apiname>" "<version>" api
Then I should see the apimanager APIs "<apiname>" status as "Published"
When I click on Applications dropdown
Then I should see "<appName>" Application for "<usertypeSP>"
When I select "<appName>" for "<usertypeSP>"
And I click apimanager "<apiname>" API page subscribe button
Then I should see "Subscription Awaiting Approval" on Subscription Successful pop up
When I click Go to My Subscription button
Given I am in hubmanager
Then I should see the apimanager Manager page header as "Manager"
When I enter apimanager Manager page admin username credentials
And I click on apimanager Manager page login button
Then I should see the apimanager Manager Home page header as "Home"
And I should see apimanager Manager Home Billing Workflow Blacklist Whitelist tabs
When I click on apimanager Manager page Workflow tab
Then I should see apimanager Manager Approval Tasks page header as "Approval Tasks"
And I click on subscriptions creation under tasks
Then I should see created subscription with "<appName>" and "<apiname>" "<version>" at the top of the Approval Tasks table for "<usertypeAdmin>"
And I should see the status of the subscription "<appName>" "<apiname>" "<version>" approval task as "READY"
And I click Assign To Me button for "<appName>" "<apiname>" "<version>" Subscription Details row for "<usertypeAdmin>"
And I should see the status of the subscription "<appName>" "<apiname>" "<version>" approval task as "RESERVED" 
And I click on Start button for "<appName>" "<apiname>" "<version>" Subscription Details row for "<usertypeAdmin>"
Then I should see the status of the subscription "<appName>" "<apiname>" "<version>" approval task as "IN_PROGRESS" 
And I select "<action>" and click complete button for "<appName>" "<apiname>" "<version>" Subscription Details row for "<usertypeAdmin>"
Then I should see Enter aprrove/reject reasons pop up header as "Enter approve/reject reasons"
When I enter aprrove/reject reason as "Approve"
And click aprrove/reject reason ok button
Then I should not see created subscription with "<appName>" and "<apiname>" "<version>" in the Approval Tasks table
Given I am in hubmanager
Then I should see the apimanager Manager page header as "Manager"
When I enter apimanager Manager page "<apiPublisherOne>" username credentials
And I click on apimanager Manager page login button
Then I should see the apimanager Manager Home page header as "Home"
And I should see apimanager Manager Home Billing Workflow Blacklist Whitelist tabs
When I click on apimanager Manager page Workflow tab
Then I should see apimanager Manager Approval Tasks page header as "Approval Tasks"
And I click on subscriptions creation under tasks
Then I should see created subscription with "<appName>" and "<apiname>" "<version>" at the top of the Approval Tasks table for "<usertype>"
And I should see the status of the subscription "<appName>" "<apiname>" "<version>" approval task as "READY"
And I click Assign To Me button for "<appName>" "<apiname>" "<version>" Subscription Details row for "<usertype>"
And I should see the status of the subscription "<appName>" "<apiname>" "<version>" approval task as "RESERVED" 
And I click on Start button for "<appName>" "<apiname>" "<version>" Subscription Details row for "<usertype>"
Then I should see the status of the subscription "<appName>" "<apiname>" "<version>" approval task as "IN_PROGRESS" 
Then I click on action dropdown of "<appName>" "<apiname>" "<version>" task
And I should see Action "<options>" of the "<appName>" "<apiname>" "<version>" task in the dropdown
Examples:
|usertypeAdmin|usertype |usertypeSP|apiPublisherOne|appName     |action |options        |apiname   |version|
|AdminUser    |PUBLISHER|APPCREATE |apipublisherOne|AuXTestAPPA |Approve|Approve,Reject |SubTestB  |v1     |

@InternalGatewayTypeOneSubscriptonApproval  
Scenario Outline: DEP-INTGW-659:API publisher starts assigned task and applies throttling layer
Given I am in apimanager
When I click on apimanager login
Then I should see the apimanager "Login" pop up
When I enter apimanager Login username and password for "<usertypeSP>" 
And I click on apimanager Login pop up login button
When I click on apimanager My Applications
When I click on apimanager Application "<appName>"
When I click on Application "<appName>" "Subscriptions" tab
Then I unsubscribe existing "<apiname>" with "<version>" if subscription exist
And I click on apimanager APIs module
Then I should search apimanager API "<apiname>"
When I click on the apimanager "<apiname>" "<version>" api
Then I should see the apimanager APIs "<apiname>" status as "Published"
When I click on Applications dropdown
Then I should see "<appName>" Application for "<usertypeSP>"
When I select "<appName>" for "<usertypeSP>"
And I click apimanager "<apiname>" API page subscribe button
Then I should see "Subscription Awaiting Approval" on Subscription Successful pop up
When I click Go to My Subscription button
Given I am in hubmanager
Then I should see the apimanager Manager page header as "Manager"
When I enter apimanager Manager page admin username credentials
And I click on apimanager Manager page login button
Then I should see the apimanager Manager Home page header as "Home"
And I should see apimanager Manager Home Billing Workflow Blacklist Whitelist tabs
When I click on apimanager Manager page Workflow tab
Then I should see apimanager Manager Approval Tasks page header as "Approval Tasks"
And I click on subscriptions creation under tasks
Then I should see created subscription with "<appName>" and "<apiname>" "<version>" at the top of the Approval Tasks table for "<usertypeAdmin>"
And I should see the status of the subscription "<appName>" "<apiname>" "<version>" approval task as "READY"
And I click Assign To Me button for "<appName>" "<apiname>" "<version>" Subscription Details row for "<usertypeAdmin>"
And I should see the status of the subscription "<appName>" "<apiname>" "<version>" approval task as "RESERVED" 
And I click on Start button for "<appName>" "<apiname>" "<version>" Subscription Details row for "<usertypeAdmin>"
Then I should see the status of the subscription "<appName>" "<apiname>" "<version>" approval task as "IN_PROGRESS" 
And I select "<action>" and click complete button for "<appName>" "<apiname>" "<version>" Subscription Details row for "<usertypeAdmin>"
Then I should see Enter aprrove/reject reasons pop up header as "Enter approve/reject reasons"
When I enter aprrove/reject reason as "Approve"
And click aprrove/reject reason ok button
Then I should not see created subscription with "<appName>" and "<apiname>" "<version>" in the Approval Tasks table
Given I am in hubmanager
Then I should see the apimanager Manager page header as "Manager"
When I enter apimanager Manager page "<apiPublisherOne>" username credentials
And I click on apimanager Manager page login button
Then I should see the apimanager Manager Home page header as "Home"
And I should see apimanager Manager Home Billing Workflow Blacklist Whitelist tabs
When I click on apimanager Manager page Workflow tab
Then I should see apimanager Manager Approval Tasks page header as "Approval Tasks"
And I click on subscriptions creation under tasks
Then I should see created subscription with "<appName>" and "<apiname>" "<version>" at the top of the Approval Tasks table for "<usertype>"
And I should see the status of the subscription "<appName>" "<apiname>" "<version>" approval task as "READY"
And I click Assign To Me button for "<appName>" "<apiname>" "<version>" Subscription Details row for "<usertype>"
And I should see the status of the subscription "<appName>" "<apiname>" "<version>" approval task as "RESERVED" 
And I click on Start button for "<appName>" "<apiname>" "<version>" Subscription Details row for "<usertype>"
When I click on Subscription Details drop box for "<appName>" "<apiname>" "<version>" row for "<usertype>"
And I select "<tiers>" for "<appName>" "<apiname>" "<version>" Subscription Details row for "<usertype>"
Then I should see the status of the subscription "<appName>" "<apiname>" "<version>" approval task as "IN_PROGRESS" 
Then I click on action dropdown of "<appName>" "<apiname>" "<version>" task
And I should see Action "<options>" of the "<appName>" "<apiname>" "<version>" task in the dropdown
Examples:
|usertypeAdmin|usertype |usertypeSP|apiPublisherOne|appName     |action |options        |tiers    |apiname   |version|
|AdminUser    |PUBLISHER|APPCREATE |apipublisherOne|AuXTestAPPC |Approve|Approve,Reject |Unlimited|SubTestB  |v1     |

@InternalGatewayTypeOneSubscriptonApproval  
Scenario Outline: DEP-INTGW-660:API publisher starts assigned task without changing already applied throttling layer
Given I am in hubmanager
Then I should see the apimanager Manager page header as "Manager"
When I enter apimanager Manager page "<apiPublisherOne>" username credentials
And I click on apimanager Manager page login button
Then I should see the apimanager Manager Home page header as "Home"
And I should see apimanager Manager Home Billing Workflow Blacklist Whitelist tabs
When I click on apimanager Manager page Workflow tab
Then I should see apimanager Manager Approval Tasks page header as "Approval Tasks"
And I click on subscriptions creation under tasks
Then I should see created subscription with "<appName>" and "<subscribeAPI>" "<version>" at the top of the Approval Tasks table for "<usertype>"
When I click on Subscription Details drop box for "<appName>" "<subscribeAPI>" "<version>" row for "<usertype>"
And I select "<tiers>" for "<appName>" "<subscribeAPI>" "<version>" Subscription Details row for "<usertype>"
And I should see the status of the subscription "<appName>" "<subscribeAPI>" "<version>" approval task as "RESERVED" 
And I click on Start button for "<appName>" "<subscribeAPI>" "<version>" Subscription Details row for "<usertype>"
And I should see the selected throttling layer as "<tiers>" for "<appName>" "<subscribeAPI>" "<version>" Subscription
Then I should see the status of the subscription "<appName>" "<subscribeAPI>" "<version>" approval task as "IN_PROGRESS" 
Then I click on action dropdown of "<appName>" "<subscribeAPI>" "<version>" task
And I should see Action "<options>" of the "<appName>" "<subscribeAPI>" "<version>" task in the dropdown
Examples:
|usertype |apiPublisherOne|appName     |action |options        |subscribeAPI |version|tiers    |
|PUBLISHER|apipublisherOne|AuXTestAPPC |Approve|Approve,Reject |SubTestB     |v1     |Unlimited|

@InternalGatewayTypeOneSubscriptonApproval 
Scenario Outline: DEP-INTGW-661:API publisher user starts assigned task and changes the existing throttling layer
Given I am in hubmanager
Then I should see the apimanager Manager page header as "Manager"
When I enter apimanager Manager page "<apiPublisherOne>" username credentials
And I click on apimanager Manager page login button
Then I should see the apimanager Manager Home page header as "Home"
And I should see apimanager Manager Home Billing Workflow Blacklist Whitelist tabs
When I click on apimanager Manager page Workflow tab
Then I should see apimanager Manager Approval Tasks page header as "Approval Tasks"
And I click on subscriptions creation under tasks
Then I should see created subscription with "<appName>" and "<subscribeAPI>" "<version>" at the top of the Approval Tasks table for "<usertype>"
When I click on Subscription Details drop box for "<appName>" "<subscribeAPI>" "<version>" row for "<usertype>"
And I select "<olderTier>" for "<appName>" "<subscribeAPI>" "<version>" Subscription Details row for "<usertype>"
And I should see the status of the subscription "<appName>" "<subscribeAPI>" "<version>" approval task as "RESERVED" 
And I click on Start button for "<appName>" "<subscribeAPI>" "<version>" Subscription Details row for "<usertype>"
And I should see the selected throttling layer as "<olderTier>" for "<appName>" "<subscribeAPI>" "<version>" Subscription
And I select "<newTier>" for "<appName>" "<subscribeAPI>" "<version>" Subscription Details row for "<usertype>"
Then I should see the status of the subscription "<appName>" "<subscribeAPI>" "<version>" approval task as "IN_PROGRESS"
Then I click on action dropdown of "<appName>" "<subscribeAPI>" "<version>" task
And I should see Action "<options>" of the "<appName>" "<subscribeAPI>" "<version>" task in the dropdown
Examples:
|usertype |apiPublisherOne|appName     |action |options        |subscribeAPI |version|olderTier|newTier |
|PUBLISHER|apipublisherOne|AuXTestAPPC |Approve|Approve,Reject |SubTestB     |v1     |Unlimited|Large   |

@InternalGatewayTypeOneSubscriptonApproval 
Scenario Outline: DEP-INTGW-662:API publisher approves task without applying throttling layer
Given I am in hubmanager
Then I should see the apimanager Manager page header as "Manager"
When I enter apimanager Manager page "<apiPublisherOne>" username credentials
And I click on apimanager Manager page login button
Then I should see the apimanager Manager Home page header as "Home"
And I should see apimanager Manager Home Billing Workflow Blacklist Whitelist tabs
When I click on apimanager Manager page Workflow tab
Then I should see apimanager Manager Approval Tasks page header as "Approval Tasks"
And I click on subscriptions creation under tasks
Then I should see created subscription with "<appName>" and "<subscribeAPI>" "<version>" at the top of the Approval Tasks table for "<usertype>"
And I should see the status of the subscription "<appName>" "<subscribeAPI>" "<version>" approval task as "RESERVED" 
And I click on Start button for "<appName>" "<subscribeAPI>" "<version>" Subscription Details row for "<usertype>"
Then I should see the status of the subscription "<appName>" "<subscribeAPI>" "<version>" approval task as "IN_PROGRESS" 
And I select "<action>" and click complete button for "<appName>" "<subscribeAPI>" "<version>" Subscription Details row for "<usertype>"
Then I should see Enter aprrove/reject reasons pop up header as "Enter approve/reject reasons"
When I enter aprrove/reject reason as "Approve"
And click aprrove/reject reason ok button
Then I should not see created subscription with "<appName>" and "<subscribeAPI>" "<version>" in the Approval Tasks table
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
Then I should see the API "<subscribeAPI>" "<version>" status as "<status>" and Subscription Tier as "<tier>"
Examples:
|usertypeSP|usertype |apiPublisherOne|appName     |action |subscribeAPI |version|tier  |status   |
|APPCREATE |PUBLISHER|apipublisherOne|AuXTestAPPA |Approve|SubTestB     |v1     |Bronze|UNBLOCKED|

@InternalGatewayTypeOneSubscriptonApproval 
Scenario Outline: DEP-INTGW-663:API publisher approves task while applying throttling layer
Given I am in hubmanager
Then I should see the apimanager Manager page header as "Manager"
When I enter apimanager Manager page "<apiPublisherOne>" username credentials
And I click on apimanager Manager page login button
Then I should see the apimanager Manager Home page header as "Home"
And I should see apimanager Manager Home Billing Workflow Blacklist Whitelist tabs
When I click on apimanager Manager page Workflow tab
Then I should see apimanager Manager Approval Tasks page header as "Approval Tasks"
And I click on subscriptions creation under tasks
Then I should see created subscription with "<appName>" and "<subscribeAPI>" "<version>" at the top of the Approval Tasks table for "<usertype>"
And I should see the status of the subscription "<appName>" "<subscribeAPI>" "<version>" approval task as "RESERVED" 
When I click on Subscription Details drop box for "<appName>" "<subscribeAPI>" "<version>" row for "<usertype>"
And I select "<tiers>" for "<appName>" "<subscribeAPI>" "<version>" Subscription Details row for "<usertype>"
And I click on Start button for "<appName>" "<subscribeAPI>" "<version>" Subscription Details row for "<usertype>"
Then I should see the status of the subscription "<appName>" "<subscribeAPI>" "<version>" approval task as "IN_PROGRESS"
And I select "<action>" and click complete button for "<appName>" "<subscribeAPI>" "<version>" Subscription Details row for "<usertype>"
Then I should see Enter aprrove/reject reasons pop up header as "Enter approve/reject reasons"
When I enter aprrove/reject reason as "Approve"
And click aprrove/reject reason ok button
Then I should not see created subscription with "<appName>" and "<subscribeAPI>" "<version>" in the Approval Tasks table
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
Then I should see the API "<subscribeAPI>" "<version>" status as "<status>" and Subscription Tier as "<tier>"
Examples:
|usertypeSP|usertype |apiPublisherOne|appName     |action |subscribeAPI |version|tiers  |status   |
|APPCREATE |PUBLISHER|apipublisherOne|AuXTestAPPC |Approve|SubTestB     |v1     |Premium|UNBLOCKED|

@InternalGatewayTypeOneSubscriptonApproval  
Scenario Outline: DEP-INTGW-664:API publisher approves task without changing already applied throttling layer
Given I am in apimanager
When I click on apimanager login
Then I should see the apimanager "Login" pop up
When I enter apimanager Login username and password for "<usertypeSP>" 
And I click on apimanager Login pop up login button
When I click on apimanager My Applications
When I click on apimanager Application "<appName>"
When I click on Application "<appName>" "Subscriptions" tab
Then I unsubscribe existing "<apiname>" with "<version>" if subscription exist
And I click on apimanager APIs module
Then I should search apimanager API "<apiname>"
When I click on the apimanager "<apiname>" "<version>" api
Then I should see the apimanager APIs "<apiname>" status as "Published"
When I click on Applications dropdown
Then I should see "<appName>" Application for "<usertypeSP>"
When I select "<appName>" for "<usertypeSP>"
And I click apimanager "<apiname>" API page subscribe button
Then I should see "Subscription Awaiting Approval" on Subscription Successful pop up
When I click Go to My Subscription button
Given I am in hubmanager
Then I should see the apimanager Manager page header as "Manager"
When I enter apimanager Manager page admin username credentials
And I click on apimanager Manager page login button
Then I should see the apimanager Manager Home page header as "Home"
And I should see apimanager Manager Home Billing Workflow Blacklist Whitelist tabs
When I click on apimanager Manager page Workflow tab
Then I should see apimanager Manager Approval Tasks page header as "Approval Tasks"
And I click on subscriptions creation under tasks
Then I should see created subscription with "<appName>" and "<apiname>" "<version>" at the top of the Approval Tasks table for "<usertypeAdmin>"
And I should see the status of the subscription "<appName>" "<apiname>" "<version>" approval task as "READY"
And I click Assign To Me button for "<appName>" "<apiname>" "<version>" Subscription Details row for "<usertypeAdmin>"
And I should see the status of the subscription "<appName>" "<apiname>" "<version>" approval task as "RESERVED" 
And I click on Start button for "<appName>" "<apiname>" "<version>" Subscription Details row for "<usertypeAdmin>"
Then I should see the status of the subscription "<appName>" "<apiname>" "<version>" approval task as "IN_PROGRESS"  
And I select "<action>" and click complete button for "<appName>" "<apiname>" "<version>" Subscription Details row for "<usertypeAdmin>"
Then I should see Enter aprrove/reject reasons pop up header as "Enter approve/reject reasons"
When I enter aprrove/reject reason as "Approve"
And click aprrove/reject reason ok button
Then I should not see created subscription with "<appName>" and "<apiname>" "<version>" in the Approval Tasks table
Given I am in hubmanager
Then I should see the apimanager Manager page header as "Manager"
When I enter apimanager Manager page "<apiPublisherOne>" username credentials
And I click on apimanager Manager page login button
Then I should see the apimanager Manager Home page header as "Home"
And I should see apimanager Manager Home Billing Workflow Blacklist Whitelist tabs
When I click on apimanager Manager page Workflow tab
Then I should see apimanager Manager Approval Tasks page header as "Approval Tasks"
And I click on subscriptions creation under tasks
Then I should see created subscription with "<appName>" and "<apiname>" "<version>" at the top of the Approval Tasks table for "<usertype>"
And I should see the status of the subscription "<appName>" "<apiname>" "<version>" approval task as "READY"
And I click Assign To Me button for "<appName>" "<apiname>" "<version>" Subscription Details row for "<usertype>"
When I click on Subscription Details drop box for "<appName>" "<apiname>" "<version>" row for "<usertype>"
And I select "<tiers>" for "<appName>" "<apiname>" "<version>" Subscription Details row for "<usertype>"
And I should see the status of the subscription "<appName>" "<apiname>" "<version>" approval task as "RESERVED" 
And I click on Start button for "<appName>" "<apiname>" "<version>" Subscription Details row for "<usertype>"
And I should see the selected throttling layer as "<tiers>" for "<appName>" "<apiname>" "<version>" Subscription
Then I should see the status of the subscription "<appName>" "<apiname>" "<version>" approval task as "IN_PROGRESS" 
And I select "<action>" and click complete button for "<appName>" "<apiname>" "<version>" Subscription Details row for "<usertype>"
Then I should see Enter aprrove/reject reasons pop up header as "Enter approve/reject reasons"
When I enter aprrove/reject reason as "Approve"
And click aprrove/reject reason ok button
Then I should not see created subscription with "<appName>" and "<apiname>" "<version>" in the Approval Tasks table
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
Then I should see the API "<apiname>" "<version>" status as "<status>" and Subscription Tier as "<tier>"
Examples:
|usertypeAdmin|usertypeSP|usertype |apiPublisherOne|appName     |action |tiers  |status   |apiname   |version|
|AdminUser    |APPCREATE |PUBLISHER|apipublisherOne|AuXTestAPPD |Approve|Premium|UNBLOCKED|SubTestB  |v1     |

@InternalGatewayTypeOneSubscriptonApproval  
Scenario Outline: DEP-INTGW-665:API publisher approves task and changes the previously applied throttling layer
Given I am in apimanager
When I click on apimanager login
Then I should see the apimanager "Login" pop up
When I enter apimanager Login username and password for "<usertypeSP>" 
And I click on apimanager Login pop up login button
When I click on apimanager My Applications
When I click on apimanager Application "<appName>"
When I click on Application "<appName>" "Subscriptions" tab
Then I unsubscribe existing "<apiname>" with "<version>" if subscription exist
And I click on apimanager APIs module
Then I should search apimanager API "<apiname>"
When I click on the apimanager "<apiname>" "<version>" api
Then I should see the apimanager APIs "<apiname>" status as "Published"
When I click on Applications dropdown
Then I should see "<appName>" Application for "<usertypeSP>"
When I select "<appName>" for "<usertypeSP>"
And I click apimanager "<apiname>" API page subscribe button
Then I should see "Subscription Awaiting Approval" on Subscription Successful pop up
When I click Go to My Subscription button
Given I am in hubmanager
Then I should see the apimanager Manager page header as "Manager"
When I enter apimanager Manager page admin username credentials
And I click on apimanager Manager page login button
Then I should see the apimanager Manager Home page header as "Home"
And I should see apimanager Manager Home Billing Workflow Blacklist Whitelist tabs
When I click on apimanager Manager page Workflow tab
Then I should see apimanager Manager Approval Tasks page header as "Approval Tasks"
And I click on subscriptions creation under tasks
Then I should see created subscription with "<appName>" and "<apiname>" "<version>" at the top of the Approval Tasks table for "<usertypeAdmin>"
And I should see the status of the subscription "<appName>" "<apiname>" "<version>" approval task as "READY"
And I click Assign To Me button for "<appName>" "<apiname>" "<version>" Subscription Details row for "<usertypeAdmin>"
And I should see the status of the subscription "<appName>" "<apiname>" "<version>" approval task as "RESERVED" 
And I click on Start button for "<appName>" "<apiname>" "<version>" Subscription Details row for "<usertypeAdmin>"
Then I should see the status of the subscription "<appName>" "<apiname>" "<version>" approval task as "IN_PROGRESS" 
And I select "<action>" and click complete button for "<appName>" "<apiname>" "<version>" Subscription Details row for "<usertypeAdmin>"
Then I should see Enter aprrove/reject reasons pop up header as "Enter approve/reject reasons"
When I enter aprrove/reject reason as "Approve"
And click aprrove/reject reason ok button
Then I should not see created subscription with "<appName>" and "<apiname>" "<version>" in the Approval Tasks table
Given I am in hubmanager
Then I should see the apimanager Manager page header as "Manager"
When I enter apimanager Manager page "<apiPublisherOne>" username credentials
And I click on apimanager Manager page login button
Then I should see the apimanager Manager Home page header as "Home"
And I should see apimanager Manager Home Billing Workflow Blacklist Whitelist tabs
When I click on apimanager Manager page Workflow tab
Then I should see apimanager Manager Approval Tasks page header as "Approval Tasks"
And I click on subscriptions creation under tasks
Then I should see created subscription with "<appName>" and "<apiname>" "<version>" at the top of the Approval Tasks table for "<usertype>"
And I should see the status of the subscription "<appName>" "<apiname>" "<version>" approval task as "READY"
And I click Assign To Me button for "<appName>" "<apiname>" "<version>" Subscription Details row for "<usertype>"
When I click on Subscription Details drop box for "<appName>" "<apiname>" "<version>" row for "<usertype>"
And I select "<olderTier>" for "<appName>" "<apiname>" "<version>" Subscription Details row for "<usertype>"
And I should see the status of the subscription "<appName>" "<apiname>" "<version>" approval task as "RESERVED" 
And I click on Start button for "<appName>" "<apiname>" "<version>" Subscription Details row for "<usertype>"
And I select "<newTier>" for "<appName>" "<apiname>" "<version>" Subscription Details row for "<usertype>"
Then I should see the status of the subscription "<appName>" "<apiname>" "<version>" approval task as "IN_PROGRESS" 
And I select "<action>" and click complete button for "<appName>" "<apiname>" "<version>" Subscription Details row for "<usertype>"
Then I should see Enter aprrove/reject reasons pop up header as "Enter approve/reject reasons"
When I enter aprrove/reject reason as "Approve"
And click aprrove/reject reason ok button
Then I should not see created subscription with "<appName>" and "<apiname>" "<version>" in the Approval Tasks table
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
Then I should see the API "<apiname>" "<version>" status as "<status>" and Subscription Tier as "<newTier>"
Examples:
|usertypeAdmin|usertypeSP|usertype |apiPublisherOne|appName     |action |olderTier|newTier  |status|apiname   |version|
|AdminUser    |APPCREATE |PUBLISHER|apipublisherOne|AuXTestAPPE |Approve|Large    |Unlimited|ACTIVE|SubTestB  |v1     |

@InternalGatewayTypeOneSubscriptonApproval  
Scenario Outline: DEP-INTGW-666:API publisher rejects subscription approval task
Given I am in apimanager
When I click on apimanager login
Then I should see the apimanager "Login" pop up
When I enter apimanager Login username and password for "<usertypeSP>" 
And I click on apimanager Login pop up login button
When I click on apimanager My Applications
When I click on apimanager Application "<appName>"
When I click on Application "<appName>" "Subscriptions" tab
Then I unsubscribe existing "<apiname>" with "<version>" if subscription exist
And I click on apimanager APIs module
Then I should search apimanager API "<apiname>"
When I click on the apimanager "<apiname>" "<version>" api
Then I should see the apimanager APIs "<apiname>" status as "Published"
When I click on Applications dropdown
Then I should see "<appName>" Application for "<usertypeSP>"
When I select "<appName>" for "<usertypeSP>"
And I click apimanager "<apiname>" API page subscribe button
Then I should see "Subscription Awaiting Approval" on Subscription Successful pop up
When I click Go to My Subscription button
Given I am in hubmanager
Then I should see the apimanager Manager page header as "Manager"
When I enter apimanager Manager page admin username credentials
And I click on apimanager Manager page login button
Then I should see the apimanager Manager Home page header as "Home"
And I should see apimanager Manager Home Billing Workflow Blacklist Whitelist tabs
When I click on apimanager Manager page Workflow tab
Then I should see apimanager Manager Approval Tasks page header as "Approval Tasks"
And I click on subscriptions creation under tasks
Then I should see created subscription with "<appName>" and "<apiname>" "<version>" at the top of the Approval Tasks table for "<usertypeAdmin>"
And I should see the status of the subscription "<appName>" "<apiname>" "<version>" approval task as "READY"
And I click Assign To Me button for "<appName>" "<apiname>" "<version>" Subscription Details row for "<usertypeAdmin>"
And I should see the status of the subscription "<appName>" "<apiname>" "<version>" approval task as "RESERVED" 
And I click on Start button for "<appName>" "<apiname>" "<version>" Subscription Details row for "<usertypeAdmin>"
Then I should see the status of the subscription "<appName>" "<apiname>" "<version>" approval task as "IN_PROGRESS" 
And I select "<action>" and click complete button for "<appName>" "<apiname>" "<version>" Subscription Details row for "<usertypeAdmin>"
Then I should see Enter aprrove/reject reasons pop up header as "Enter approve/reject reasons"
When I enter aprrove/reject reason as "Approve"
And click aprrove/reject reason ok button
Then I should not see created subscription with "<appName>" and "<apiname>" "<version>" in the Approval Tasks table
Given I am in hubmanager
Then I should see the apimanager Manager page header as "Manager"
When I enter apimanager Manager page "<apiPublisherOne>" username credentials
And I click on apimanager Manager page login button
Then I should see the apimanager Manager Home page header as "Home"
And I should see apimanager Manager Home Billing Workflow Blacklist Whitelist tabs
When I click on apimanager Manager page Workflow tab
Then I should see apimanager Manager Approval Tasks page header as "Approval Tasks"
And I click on subscriptions creation under tasks
Then I should see created subscription with "<appName>" and "<apiname>" "<version>" at the top of the Approval Tasks table for "<usertype>"
And I should see the status of the subscription "<appName>" "<apiname>" "<version>" approval task as "READY"
And I click Assign To Me button for "<appName>" "<apiname>" "<version>" Subscription Details row for "<usertype>"
And I should see the status of the subscription "<appName>" "<apiname>" "<version>" approval task as "RESERVED" 
And I click on Start button for "<appName>" "<apiname>" "<version>" Subscription Details row for "<usertype>"
Then I should see the status of the subscription "<appName>" "<apiname>" "<version>" approval task as "IN_PROGRESS" 
And I select "<action>" and click complete button for "<appName>" "<apiname>" "<version>" Subscription Details row for "<usertype>"
Then I should see Enter aprrove/reject reasons pop up header as "Enter approve/reject reasons"
When I enter aprrove/reject reason as "Reject"
And click aprrove/reject reason ok button
Then I should not see created subscription with "<appName>" and "<apiname>" "<version>" in the Approval Tasks table
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
Then I should see the API "<apiname>" "<version>" status as "<status>" and Subscription Tier as "<tier>"
Examples:
|usertypeAdmin|usertypeSP|usertype |apiPublisherOne|appName     |actionAdmin|actionPub |tier   |status  |apiname   |version|
|AdminUser    |APPCREATE |PUBLISHER|apipublisherOne|AuXTestAPPB |Approve    |Reject    |Default|REJECTED|SubTestB  |v1     |

@InternalGatewayTypeOneSubscriptonApproval  
Scenario Outline: DEP-INTGW-667:SP unsubscribe API from application before approval
Given I am in apimanager
When I click on apimanager login
Then I should see the apimanager "Login" pop up
When I enter apimanager Login username and password for "<usertypeSP>" 
And I click on apimanager Login pop up login button
When I click on apimanager My Applications
When I click on apimanager Application "<appName>"
When I click on Application "<appName>" "Subscriptions" tab
Then I unsubscribe existing "<apiname>" with "<version>" if subscription exist
And I click on apimanager APIs module
Then I should search apimanager API "<apiname>"
When I click on the apimanager "<apiname>" "<version>" api
Then I should see the apimanager APIs "<apiname>" status as "Published"
When I click on Applications dropdown
Then I should see "<appName>" Application for "<usertypeSP>"
When I select "<appName>" for "<usertypeSP>"
And I click apimanager "<apiname>" API page subscribe button
Then I should see "Subscription Awaiting Approval" on Subscription Successful pop up
When I click Go to My Subscription button
Then I should see the apimanager Application "<appName>" Subscriptions page header as "Subscriptions"
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
Then I should see created subscription with "<appName>" and "<apiname>" "<version>" at the top of the Approval Tasks table for "<usertypeAdmin>"
And I should see the status of the subscription "<appName>" "<apiname>" "<version>" approval task as "READY"
And I click Assign To Me button for "<appName>" "<apiname>" "<version>" Subscription Details row for "<usertypeAdmin>"
And I should see the status of the subscription "<appName>" "<apiname>" "<version>" approval task as "RESERVED" 
And I click on Start button for "<appName>" "<apiname>" "<version>" Subscription Details row for "<usertypeAdmin>"
Then I should see the status of the subscription "<appName>" "<apiname>" "<version>" approval task as "IN_PROGRESS" 
And I select "<action>" and click complete button for "<appName>" "<apiname>" "<version>" Subscription Details row for "<usertypeAdmin>"
Then I should see Enter aprrove/reject reasons pop up header as "Enter approve/reject reasons"
When I enter aprrove/reject reason as "Approve"
And click aprrove/reject reason ok button
Then I should not see created subscription with "<appName>" and "<apiname>" "<version>" in the Approval Tasks table
Given I am in hubmanager
Then I should see the apimanager Manager page header as "Manager"
When I enter apimanager Manager page "<apiPublisherOne>" username credentials
And I click on apimanager Manager page login button
Then I should see the apimanager Manager Home page header as "Home"
And I should see apimanager Manager Home Billing Workflow Blacklist Whitelist tabs
When I click on apimanager Manager page Workflow tab
Then I should see apimanager Manager Approval Tasks page header as "Approval Tasks"
And I click on subscriptions creation under tasks
Then I should see created subscription with "<appName>" and "<apiname>" "<version>" at the top of the Approval Tasks table for "<usertype>"
And I should see the status of the subscription "<appName>" "<apiname>" "<version>" approval task as "READY"
And I click Assign To Me button for "<appName>" "<apiname>" "<version>" Subscription Details row for "<usertype>"
And I should see the status of the subscription "<appName>" "<apiname>" "<version>" approval task as "RESERVED" 
Given I am in apimanager
When I click on apimanager login
Then I should see the apimanager "Login" pop up
When I enter apimanager Login username and password for "<usertypeSP>" 
And I click on apimanager Login pop up login button
Then I should see apimanager "<usertypeSP>" at the top right corner of the page
When I click on apimanager My Applications
Then I should see the apimanager Application page header as "Applications"
When I click on apimanager Application "<appName>"
When I click on Application "<appName>" "Subscriptions" tab
Then I should see the "<apiname>" and "<version>" under Subscribed APIs
When I unsubscribe existing "<apiname>" with "<version>"
Then I should see the confirm delete popup with "Confirm Delete"
And I click on confirm delete popup Yes button
Given I am in hubmanager
Then I should see the apimanager Manager page header as "Manager"
When I enter apimanager Manager page "<apiPublisherOne>" username credentials
And I click on apimanager Manager page login button
Then I should see the apimanager Manager Home page header as "Home"
And I should see apimanager Manager Home Billing Workflow Blacklist Whitelist tabs
When I click on apimanager Manager page Workflow tab
Then I should see apimanager Manager Approval Tasks page header as "Approval Tasks"
And I click on subscriptions creation under tasks
Then I should not see created subscription with "<appName>" and "<apiname>" "<version>" in the Approval Tasks table
Examples:
|usertypeAdmin|usertypeSP|usertype |apiPublisherOne|appName     |actionAdmin|tier   |status  |apiname   |version|
|AdminUser    |APPCREATE |PUBLISHER|apipublisherOne|AuXTestAPPB |Approve    |Default|ON_HOLD |SubTestB  |v1     |

@InternalGatewayTypeOneSubscriptonApproval  
Scenario Outline: DEP-INTGW-1289:Subscription task get approved with thorttling layer which is selected by operator admin
Given I am in apimanager
When I click on apimanager login
Then I should see the apimanager "Login" pop up
When I enter apimanager Login username and password for "<usertypeSP>" 
And I click on apimanager Login pop up login button
When I click on apimanager My Applications
When I click on apimanager Application "<appName>"
When I click on Application "<appName>" "Subscriptions" tab
Then I unsubscribe existing "<apiname>" with "<version>" if subscription exist
And I click on apimanager APIs module
Then I should search apimanager API "<apiname>"
When I click on the apimanager "<apiname>" "<version>" api
Then I should see the apimanager APIs "<apiname>" status as "Published"
When I click on Applications dropdown
Then I should see "<appName>" Application for "<usertypeSP>"
When I select "<appName>" for "<usertypeSP>"
And I click apimanager "<apiname>" API page subscribe button
Then I should see "Subscription Awaiting Approval" on Subscription Successful pop up
When I click Go to My Subscription button
Given I am in hubmanager
Then I should see the apimanager Manager page header as "Manager"
When I enter apimanager Manager page admin username credentials
And I click on apimanager Manager page login button
Then I should see the apimanager Manager Home page header as "Home"
And I should see apimanager Manager Home Billing Workflow Blacklist Whitelist tabs
When I click on apimanager Manager page Workflow tab
Then I should see apimanager Manager Approval Tasks page header as "Approval Tasks"
And I click on subscriptions creation under tasks
Then I should see created subscription with "<appName>" and "<apiname>" "<version>" at the top of the Approval Tasks table for "<usertypeAdmin>"
And I should see the status of the subscription "<appName>" "<apiname>" "<version>" approval task as "READY"
And I click Assign To Me button for "<appName>" "<apiname>" "<version>" Subscription Details row for "<usertypeAdmin>"
And I should see the status of the subscription "<appName>" "<apiname>" "<version>" approval task as "RESERVED" 
When I click on Subscription Details drop box for "<appName>" "<apiname>" "<version>" row for "<usertypeAdmin>"
And I select "<tiers>" for "<appName>" "<apiname>" "<version>" Subscription Details row for "<usertypeAdmin>"
And I click on Start button for "<appName>" "<apiname>" "<version>" Subscription Details row for "<usertypeAdmin>"
Then I should see the status of the subscription "<appName>" "<apiname>" "<version>" approval task as "IN_PROGRESS" 
And I select "<action>" and click complete button for "<appName>" "<apiname>" "<version>" Subscription Details row for "<usertypeAdmin>"
Then I should see Enter aprrove/reject reasons pop up header as "Enter approve/reject reasons"
When I enter aprrove/reject reason as "Approve"
And click aprrove/reject reason ok button
Then I should not see created subscription with "<appName>" and "<apiname>" "<version>" in the Approval Tasks table
Given I am in hubmanager
Then I should see the apimanager Manager page header as "Manager"
When I enter apimanager Manager page "<apiPublisherOne>" username credentials
And I click on apimanager Manager page login button
Then I should see the apimanager Manager Home page header as "Home"
And I should see apimanager Manager Home Billing Workflow Blacklist Whitelist tabs
When I click on apimanager Manager page Workflow tab
Then I should see apimanager Manager Approval Tasks page header as "Approval Tasks"
And I click on subscriptions creation under tasks
Then I should see created subscription with "<appName>" and "<apiname>" "<version>" at the top of the Approval Tasks table for "<usertype>"
And I should see the status of the subscription "<appName>" "<apiname>" "<version>" approval task as "READY"
And I click Assign To Me button for "<appName>" "<apiname>" "<version>" Subscription Details row for "<usertype>"
And I should see the status of the subscription "<appName>" "<apiname>" "<version>" approval task as "RESERVED" 
And I click on Start button for "<appName>" "<apiname>" "<version>" Subscription Details row for "<usertype>"
Then I should see the status of the subscription "<appName>" "<apiname>" "<version>" approval task as "IN_PROGRESS" 
And I select "<action>" and click complete button for "<appName>" "<apiname>" "<version>" Subscription Details row for "<usertype>"
Then I should see Enter aprrove/reject reasons pop up header as "Enter approve/reject reasons"
When I enter aprrove/reject reason as "Approve"
And click aprrove/reject reason ok button
Then I should not see created subscription with "<appName>" and "<apiname>" "<version>" in the Approval Tasks table
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
Then I should see the API "<apiname>" "<version>" status as "<status>" and Subscription Tier as "<tier>"
Examples:
|usertypeAdmin|usertypeSP|usertype |apiPublisherOne|appName     |action |tier   |status|apiname |version|
|AdminUser    |APPCREATE |PUBLISHER|apipublisherOne|AuXTestAPPE |Approve|Bronze |ACTIVE|SubTestB|v1     |
