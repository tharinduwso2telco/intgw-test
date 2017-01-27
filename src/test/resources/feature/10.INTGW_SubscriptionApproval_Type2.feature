Feature: API Publisher Approves created Subscriptions Type 2


### Data Preparation for Subscription Approval Scenarios ###
@BeforeTest @InternalGatewayTypeTwoSubscriptonApproval 
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
|PUBLISHER|APPCREATE |SubTestOne  |v1     |auxProd	   |Internal/publisher |Unlimited,Default,Requestbased,Silver,Subscription,Gold,Premium,Bronze|
|PUBLISHER|APPCREATE |SubTestTwo  |v1     |auxProd	   |Internal/publisher |Unlimited,Default,Requestbased,Silver,Subscription,Gold,Premium,Bronze|

@BeforeTest @InternalGatewayTypeTwoSubscriptonApproval 
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

@BeforeTest @InternalGatewayTypeTwoSubscriptonApproval 
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


### Subscription Approval Scenarios ### 
@InternalGatewayTypeTwoSubscriptonApproval 
Scenario Outline: DEP-INTGW-1416:Listing unassigned subscription tasks for all Publishers belonging to the same API publisher group
Given I am in apimanager
When I click on apimanager login
Then I should see the apimanager "Login" pop up
When I enter apimanager Login username and password for "<usertypeSP>" 
And I click on apimanager Login pop up login button
When I click on apimanager My Applications
When I click on apimanager Application "<appNameOne>"
When I click on Application "<appNameOne>" "Subscriptions" tab
Then I unsubscribe existing "<apinameOne>" with "<apiOneVersion>" if subscription exist
And I click on apimanager APIs module
Then I should search apimanager API "<apinameOne>"
When I click on the apimanager "<apinameOne>" "<apiOneVersion>" api
Then I should see the apimanager APIs "<apinameOne>" status as "Published"
When I click on Applications dropdown
Then I should see "<appNameOne>" Application for "<usertypeSP>"
When I select "<appNameOne>" for "<usertypeSP>"
And I click apimanager "<apinameOne>" API page subscribe button
Then I should see "Subscription Awaiting Approval" on Subscription Successful pop up
When I click on Stay on this page button
When I click on apimanager My Applications
When I click on apimanager Application "<appNameTwo>"
When I click on Application "<appNameTwo>" "Subscriptions" tab
Then I unsubscribe existing "<apinameTwo>" with "<apiTwoVersion>" if subscription exist
And I click on apimanager APIs module
Then I should search apimanager API "<apinameTwo>"
When I click on the apimanager "<apinameTwo>" "<apiTwoVersion>" api
Then I should see the apimanager APIs "<apinameTwo>" status as "Published"
When I click on Applications dropdown
Then I should see "<appNameTwo>" Application for "<usertypeSP>"
When I select "<appNameTwo>" for "<usertypeSP>"
And I click apimanager "<apinameTwo>" API page subscribe button
Then I should see "Subscription Awaiting Approval" on Subscription Successful pop up
When I click Go to My Subscription button
Given I am in hubmanager
Then I should see the apimanager Manager page header as "Manager"
When I enter apimanager Manager page "<apiPublisherOne>" username credentials
And I click on apimanager Manager page login button
Then I should see the apimanager Manager Home page header as "Home"
And I should see apimanager Manager Home Billing Workflow Blacklist Whitelist tabs
When I click on apimanager Manager page Workflow tab
Then I should see apimanager Manager Approval Tasks page header as "Approval Tasks"
And I click on subscriptions creation under tasks
Then I should see created subscription with "<appNameOne>" and "<apinameOne>" "<apiOneVersion>" at the top of the Approval Tasks table for "<usertype>"
And I should see the status of the subscription "<appNameOne>" "<apinameOne>" "<apiOneVersion>" approval task as "READY"
Then I should see created subscription with "<appNameTwo>" and "<apinameTwo>" "<apiTwoVersion>" at the top of the Approval Tasks table for "<usertype>"
And I should see the status of the subscription "<appNameTwo>" "<apinameTwo>" "<apiTwoVersion>" approval task as "READY"
Given I am in hubmanager
Then I should see the apimanager Manager page header as "Manager"
When I enter apimanager Manager page "<apiPublisherTwo>" username credentials
And I click on apimanager Manager page login button
Then I should see the apimanager Manager Home page header as "Home"
And I should see apimanager Manager Home Billing Workflow Blacklist Whitelist tabs
When I click on apimanager Manager page Workflow tab
Then I should see apimanager Manager Approval Tasks page header as "Approval Tasks"
And I click on subscriptions creation under tasks
Then I should see created subscription with "<appNameOne>" and "<apinameOne>" "<apiOneVersion>" at the top of the Approval Tasks table for "<usertype>"
And I should see the status of the subscription "<appNameOne>" "<apinameOne>" "<apiOneVersion>" approval task as "READY"
Then I should see created subscription with "<appNameTwo>" and "<apinameTwo>" "<apiTwoVersion>" at the top of the Approval Tasks table for "<usertype>"
And I should see the status of the subscription "<appNameTwo>" "<apinameTwo>" "<apiTwoVersion>" approval task as "READY"
Examples:
|usertype |usertypeSP|apiPublisherOne|apiPublisherTwo|appNameOne |appNameTwo |apinameOne|apiOneVersion|apinameTwo|apiTwoVersion|
|PUBLISHER|APPCREATE |apipublisherOne|apipublisherTwo|AuXTestAPPA|AuXTestAPPB|SubTestOne|v1           |SubTestTwo|v1           |

@InternalGatewayTypeTwoSubscriptonApproval 
Scenario Outline: DEP-INTGW-1406:API publisher assigns task by specifying throttling layer
Given I am in hubmanager
Then I should see the apimanager Manager page header as "Manager"
When I enter apimanager Manager page "<apiPublisherOne>" username credentials
And I click on apimanager Manager page login button
Then I should see the apimanager Manager Home page header as "Home"
And I should see apimanager Manager Home Billing Workflow Blacklist Whitelist tabs
When I click on apimanager Manager page Workflow tab
Then I should see apimanager Manager Approval Tasks page header as "Approval Tasks"
And I click on subscriptions creation under tasks
Then I should see created subscription with "<appName>" and "<publisherOneApi>" "<version>" at the top of the Approval Tasks table for "<usertype>"
When I click on Subscription Details drop box for "<appName>" "<publisherOneApi>" "<version>" row for "<usertype>"
And I select "<tiers>" for "<appName>" "<publisherOneApi>" "<version>" Subscription Details row for "<usertype>"
And I should see the status of the subscription "<appName>" "<publisherOneApi>" "<version>" approval task as "READY"
And I click Assign To Me button for "<appName>" "<publisherOneApi>" "<version>" Subscription Details row for "<usertype>"
And I should see the status of the subscription "<appName>" "<publisherOneApi>" "<version>" approval task as "RESERVED" 
And I should see the selected throttling layer as "<tiers>" for "<appName>" "<publisherOneApi>" "<version>" Subscription
Examples:
|usertype |apiPublisherOne|appName     |tiers    |publisherOneApi|version|
|PUBLISHER|apipublisherOne|AuXTestAPPA |Unlimited|SubTestOne     |v1     |

@InternalGatewayTypeTwoSubscriptonApproval 
Scenario Outline: DEP-INTGW-1405:API publisher assigns task without specifying throttling layer
Given I am in hubmanager
Then I should see the apimanager Manager page header as "Manager"
When I enter apimanager Manager page "<apiPublisherTwo>" username credentials
And I click on apimanager Manager page login button
Then I should see the apimanager Manager Home page header as "Home"
And I should see apimanager Manager Home Billing Workflow Blacklist Whitelist tabs
When I click on apimanager Manager page Workflow tab
Then I should see apimanager Manager Approval Tasks page header as "Approval Tasks"
And I click on subscriptions creation under tasks
Then I should see created subscription with "<appName>" and "<publisherTwoApi>" "<version>" at the top of the Approval Tasks table for "<usertype>"
And I should see the status of the subscription "<appName>" "<publisherTwoApi>" "<version>" approval task as "READY"
And I click Assign To Me button for "<appName>" "<publisherTwoApi>" "<version>" Subscription Details row for "<usertype>"
And I should see the status of the subscription "<appName>" "<publisherTwoApi>" "<version>" approval task as "RESERVED" 
Examples:
|usertype |apiPublisherTwo |appName     |tiers    |publisherTwoApi|version|
|PUBLISHER|apipublisherTwo |AuXTestAPPB |Unlimited|SubTestTwo     |v1     |

@InternalGatewayTypeTwoSubscriptonApproval 
Scenario Outline: DEP-INTGW-1417:Listing of Assigned subscription tasks only to the assigned publisher user
Given I am in hubmanager
Then I should see the apimanager Manager page header as "Manager"
When I enter apimanager Manager page "<apiPublisherOne>" username credentials
And I click on apimanager Manager page login button
Then I should see the apimanager Manager Home page header as "Home"
And I should see apimanager Manager Home Billing Workflow Blacklist Whitelist tabs
When I click on apimanager Manager page Workflow tab
Then I should see apimanager Manager Approval Tasks page header as "Approval Tasks"
And I click on subscriptions creation under tasks
Then I should see created subscription with "<appNameOne>" and "<publisherOneApi>" "<apiOneVersion>" at the top of the Approval Tasks table for "<usertype>"
And I should see the status of the subscription "<appNameOne>" "<publisherOneApi>" "<apiOneVersion>" approval task as "RESERVED" 
Given I am in hubmanager
Then I should see the apimanager Manager page header as "Manager"
When I enter apimanager Manager page "<apiPublisherTwo>" username credentials
And I click on apimanager Manager page login button
Then I should see the apimanager Manager Home page header as "Home"
And I should see apimanager Manager Home Billing Workflow Blacklist Whitelist tabs
When I click on apimanager Manager page Workflow tab
Then I should see apimanager Manager Approval Tasks page header as "Approval Tasks"
And I click on subscriptions creation under tasks
Then I should see created subscription with "<appNameTwo>" and "<publisherTwoApi>" "<apiTwoVersion>" at the top of the Approval Tasks table for "<usertype>"
And I should see the status of the subscription "<appNameTwo>" "<publisherTwoApi>" "<apiTwoVersion>" approval task as "RESERVED" 
Examples:
|usertype |apiPublisherOne|apiPublisherTwo|appNameOne |appNameTwo |publisherOneApi|apiOneVersion|publisherTwoApi|apiTwoVersion|
|PUBLISHER|apipublisherOne|apipublisherTwo|AuXTestAPPA|AuXTestAPPB|SubTestOne     |v1           |SubTestTwo     |v1           |

@InternalGatewayTypeTwoSubscriptonApproval 
Scenario Outline: DEP-INTGW-1394:API publisher starts assigned task without specifying throttling layer
Given I am in hubmanager
Then I should see the apimanager Manager page header as "Manager"
When I enter apimanager Manager page "<apiPublisherOne>" username credentials
And I click on apimanager Manager page login button
Then I should see the apimanager Manager Home page header as "Home"
And I should see apimanager Manager Home Billing Workflow Blacklist Whitelist tabs
When I click on apimanager Manager page Workflow tab
Then I should see apimanager Manager Approval Tasks page header as "Approval Tasks"
And I click on subscriptions creation under tasks
Then I should see created subscription with "<appName>" and "<publisherOneApi>" "<version>" at the top of the Approval Tasks table for "<usertype>"
And I should see the status of the subscription "<appName>" "<publisherOneApi>" "<version>" approval task as "RESERVED" 
And I click on Start button for "<appName>" "<publisherOneApi>" "<version>" Subscription Details row for "<usertype>"
Then I should see the status of the subscription "<appName>" "<publisherOneApi>" "<version>" approval task as "IN_PROGRESS" 
Then I click on action dropdown of "<appName>" "<publisherOneApi>" "<version>" task
And I should see Action "<options>" of the "<appName>" "<publisherOneApi>" "<version>" task in the dropdown
Examples:
|usertype |apiPublisherOne|appName     |options        |publisherOneApi|version|
|PUBLISHER|apipublisherOne|AuXTestAPPA |Approve,Reject |SubTestOne     |v1     |

@InternalGatewayTypeTwoSubscriptonApproval 
Scenario Outline: DEP-INTGW-1395:API publisher starts assigned task by specifying a throttling layer
Given I am in hubmanager
Then I should see the apimanager Manager page header as "Manager"
When I enter apimanager Manager page "<apiPublisherTwo>" username credentials
And I click on apimanager Manager page login button
Then I should see the apimanager Manager Home page header as "Home"
And I should see apimanager Manager Home Billing Workflow Blacklist Whitelist tabs
When I click on apimanager Manager page Workflow tab
Then I should see apimanager Manager Approval Tasks page header as "Approval Tasks"
And I click on subscriptions creation under tasks
Then I should see created subscription with "<appName>" and "<publisherTwoApi>" "<version>" at the top of the Approval Tasks table for "<usertype>"
And I should see the status of the subscription "<appName>" "<publisherTwoApi>" "<version>" approval task as "RESERVED" 
And I click on Start button for "<appName>" "<publisherTwoApi>" "<version>" Subscription Details row for "<usertype>"
When I click on Subscription Details drop box for "<appName>" "<publisherTwoApi>" "<version>" row for "<usertype>"
And I select "<tiers>" for "<appName>" "<publisherTwoApi>" "<version>" Subscription Details row for "<usertype>"
Then I should see the status of the subscription "<appName>" "<publisherTwoApi>" "<version>" approval task as "IN_PROGRESS" 
And I should see the selected throttling layer as "<tiers>" for "<appName>" "<publisherTwoApi>" "<version>" Subscription
Then I click on action dropdown of "<appName>" "<publisherTwoApi>" "<version>" task
And I should see Action "<options>" of the "<appName>" "<publisherTwoApi>" "<version>" task in the dropdown
Examples:
|usertype |apiPublisherTwo|appName    |options        |tiers    |publisherTwoApi|version|
|PUBLISHER|apipublisherTwo|AuXTestAPPB|Approve,Reject |Unlimited|SubTestTwo     |v1     |

@InternalGatewayTypeTwoSubscriptonApproval 
Scenario Outline: DEP-INTGW-1415:Listing of In-progress subscription tasks only to the assigned publisher user
Given I am in hubmanager
Then I should see the apimanager Manager page header as "Manager"
When I enter apimanager Manager page "<apiPublisherOne>" username credentials
And I click on apimanager Manager page login button
Then I should see the apimanager Manager Home page header as "Home"
And I should see apimanager Manager Home Billing Workflow Blacklist Whitelist tabs
When I click on apimanager Manager page Workflow tab
Then I should see apimanager Manager Approval Tasks page header as "Approval Tasks"
And I click on subscriptions creation under tasks
Then I should see created subscription with "<appNameOne>" and "<publisherOneApi>" "<apiOneVersion>" at the top of the Approval Tasks table for "<usertype>"
And I click on Start button for "<appNameOne>" "<publisherOneApi>" "<apiOneVersion>" Subscription Details row for "<usertype>"
Then I should see the status of the subscription "<appNameOne>" "<publisherOneApi>" "<apiOneVersion>" approval task as "IN_PROGRESS" 
Given I am in hubmanager
Then I should see the apimanager Manager page header as "Manager"
When I enter apimanager Manager page "<apiPublisherTwo>" username credentials
And I click on apimanager Manager page login button
Then I should see the apimanager Manager Home page header as "Home"
And I should see apimanager Manager Home Billing Workflow Blacklist Whitelist tabs
When I click on apimanager Manager page Workflow tab
Then I should see apimanager Manager Approval Tasks page header as "Approval Tasks"
And I click on subscriptions creation under tasks
Then I should see created subscription with "<appNameTwo>" and "<publisherTwoApi>" "<apiTwoVersion>" at the top of the Approval Tasks table for "<usertype>"
And I click on Start button for "<appNameTwo>" "<publisherTwoApi>" "<apiTwoVersion>" Subscription Details row for "<usertype>"
Then I should see the status of the subscription "<appNameTwo>" "<publisherTwoApi>" "<apiTwoVersion>" approval task as "IN_PROGRESS" 
Examples:
|usertype |apiPublisherOne|apiPublisherTwo|appNameOne |appNameTwo |publisherOneApi|apiOneVersion|publisherTwoApi|apiTwoVersion|
|PUBLISHER|apipublisherOne|apipublisherTwo|AuXTestAPPA|AuXTestAPPB|SubTestOne     |v1           |SubTestTwo     |v1           |

@InternalGatewayTypeTwoSubscriptonApproval  
Scenario Outline: DEP-INTGW-1407:Restriction of subscription task listing to the API publisher group
Given I am in apimanager
When I click on apimanager login
Then I should see the apimanager "Login" pop up
When I enter apimanager Login username and password for "<usertypeSP>" 
And I click on apimanager Login pop up login button
When I click on apimanager My Applications
When I click on apimanager Application "<appNameOne>"
When I click on Application "<appNameOne>" "Subscriptions" tab
Then I unsubscribe existing "<apiname>" with "<version>" if subscription exist
And I click on apimanager APIs module
Then I should search apimanager API "<apiname>"
When I click on the apimanager "<apiname>" "<version>" api
Then I should see the apimanager APIs "<apiname>" status as "Published"
When I click on Applications dropdown
Then I should see "<appNameOne>" Application for "<usertypeSP>"
When I select "<appNameOne>" for "<usertypeSP>"
And I click apimanager "<apiname>" API page subscribe button
Then I should see "Subscription Awaiting Approval" on Subscription Successful pop up
When I click Go to My Subscription button
Given I am in hubmanager
Then I should see the apimanager Manager page header as "Manager"
When I enter apimanager Manager page "<apiPublisherOne>" username credentials
And I click on apimanager Manager page login button
Then I should see the apimanager Manager Home page header as "Home"
And I should see apimanager Manager Home Billing Workflow Blacklist Whitelist tabs
When I click on apimanager Manager page Workflow tab
Then I should see apimanager Manager Approval Tasks page header as "Approval Tasks"
And I click on subscriptions creation under tasks
Then I should see created subscription with "<appNameOne>" and "<apiname>" "<version>" at the top of the Approval Tasks table for "<usertype>"
And I should see the status of the subscription "<appNameOne>" "<apiname>" "<version>" approval task as "READY"
Given I am in hubmanager
Then I should see the apimanager Manager page header as "Manager"
When I enter apimanager Manager page "<apiPublisherThree>" username credentials
And I click on apimanager Manager page login button
Then I should see the apimanager Manager Home page header as "Home"
And I should see apimanager Manager Home Billing Workflow Blacklist Whitelist tabs
When I click on apimanager Manager page Workflow tab
Then I should see apimanager Manager Approval Tasks page header as "Approval Tasks"
And I click on subscriptions creation under tasks
Then I should not see created subscription with "<appName>" and "<apiname>" "<version>" in the Approval Tasks table
Examples:
|usertype |usertypeSP|apiPublisherOne|apiPublisherThree|appNameOne |apiname   |version|
|PUBLISHER|APPCREATE |apipublisherOne|apipublisherThree|AuXTestAPPC|SubTestOne|v1     |

@InternalGatewayTypeTwoSubscriptonApproval 
Scenario Outline: DEP-INTGW-1396:API publisher starts assigned task without changing already applied throttling layer
Given I am in hubmanager
Then I should see the apimanager Manager page header as "Manager"
When I enter apimanager Manager page "<apiPublisherOne>" username credentials
And I click on apimanager Manager page login button
Then I should see the apimanager Manager Home page header as "Home"
And I should see apimanager Manager Home Billing Workflow Blacklist Whitelist tabs
When I click on apimanager Manager page Workflow tab
Then I should see apimanager Manager Approval Tasks page header as "Approval Tasks"
And I click on subscriptions creation under tasks
Then I should see created subscription with "<appName>" and "<publisherOneApi>" "<version>" at the top of the Approval Tasks table for "<usertype>"
When I click on Subscription Details drop box for "<appName>" "<publisherOneApi>" "<version>" row for "<usertype>"
And I select "<tiers>" for "<appName>" "<publisherOneApi>" "<version>" Subscription Details row for "<usertype>"
And I should see the status of the subscription "<appName>" "<publisherOneApi>" "<version>" approval task as "READY"
And I click Assign To Me button for "<appName>" "<publisherOneApi>" "<version>" Subscription Details row for "<usertype>"
And I should see the status of the subscription "<appName>" "<publisherOneApi>" "<version>" approval task as "RESERVED" 
And I click on Start button for "<appName>" "<publisherOneApi>" "<version>" Subscription Details row for "<usertype>"
Then I should see the status of the subscription "<appName>" "<publisherOneApi>" "<version>" approval task as "IN_PROGRESS" 
And I should see the selected throttling layer as "<tiers>" for "<appName>" "<publisherOneApi>" "<version>" Subscription
Then I click on action dropdown of "<appName>" "<publisherOneApi>" "<version>" task
And I should see Action "<options>" of the "<appName>" "<publisherOneApi>" "<version>" task in the dropdown
Examples:
|usertype |apiPublisherOne|appName    |options       |tiers   |publisherOneApi|version|
|PUBLISHER|apipublisherOne|AuXTestAPPC|Approve,Reject|Premium |SubTestOne     |v1     |

@InternalGatewayTypeTwoSubscriptonApproval  
Scenario Outline: DEP-INTGW-1397:API publisher user starts assigned task and changes the existing throttling layer
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
When I enter apimanager Manager page "<apiPublisherOne>" username credentials
And I click on apimanager Manager page login button
Then I should see the apimanager Manager Home page header as "Home"
And I should see apimanager Manager Home Billing Workflow Blacklist Whitelist tabs
When I click on apimanager Manager page Workflow tab
Then I should see apimanager Manager Approval Tasks page header as "Approval Tasks"
And I click on subscriptions creation under tasks
Then I should see created subscription with "<appName>" and "<apiname>" "<version>" at the top of the Approval Tasks table for "<usertype>"
When I click on Subscription Details drop box for "<appName>" "<apiname>" "<version>" row for "<usertype>"
And I select "<olderTiers>" for "<appName>" "<apiname>" "<version>" Subscription Details row for "<usertype>"
And I should see the status of the subscription "<appName>" "<apiname>" "<version>" approval task as "READY"
And I click Assign To Me button for "<appName>" "<apiname>" "<version>" Subscription Details row for "<usertype>"
And I should see the selected throttling layer as "<olderTiers>" for "<appName>" "<apiname>" "<version>" Subscription
And I should see the status of the subscription "<appName>" "<apiname>" "<version>" approval task as "RESERVED" 
And I click on Start button for "<appName>" "<apiname>" "<version>" Subscription Details row for "<usertype>"
And I select "<newTiers>" for "<appName>" "<apiname>" "<version>" Subscription Details row for "<usertype>"
Then I should see the status of the subscription "<appName>" "<apiname>" "<version>" approval task as "IN_PROGRESS"
And I should see the selected throttling layer as "<newTiers>" for "<appName>" "<apiname>" "<version>" Subscription
Then I click on action dropdown of "<appName>" "<apiname>" "<version>" task
And I should see Action "<options>" of the "<appName>" "<apiname>" "<version>" task in the dropdown
Examples:
|usertype |usertypeSP|apiPublisherOne|appName    |options        |olderTiers   |newTiers |apiname   |version|
|PUBLISHER|APPCREATE |apipublisherOne|AuXTestAPPD|Approve,Reject |Unlimited    |Premium  |SubTestOne|v1     |

@InternalGatewayTypeTwoSubscriptonApproval 
Scenario Outline: DEP-INTGW-1398:API publisher approves task without specifiying throttling layer
Given I am in hubmanager
Then I should see the apimanager Manager page header as "Manager"
When I enter apimanager Manager page "<apiPublisherOne>" username credentials
And I click on apimanager Manager page login button
Then I should see the apimanager Manager Home page header as "Home"
And I should see apimanager Manager Home Billing Workflow Blacklist Whitelist tabs
When I click on apimanager Manager page Workflow tab
Then I should see apimanager Manager Approval Tasks page header as "Approval Tasks"
And I click on subscriptions creation under tasks
Then I should see created subscription with "<appName>" and "<publisherOneApi>" "<version>" at the top of the Approval Tasks table for "<usertype>"
And I should see the status of the subscription "<appName>" "<publisherOneApi>" "<version>" approval task as "RESERVED" 
And I click on Start button for "<appName>" "<publisherOneApi>" "<version>" Subscription Details row for "<usertype>"
Then I should see the status of the subscription "<appName>" "<publisherOneApi>" "<version>" approval task as "IN_PROGRESS" 
And I select "<action>" and click complete button for "<appName>" "<publisherOneApi>" "<version>" Subscription Details row for "<usertype>"
Then I should see Enter aprrove/reject reasons pop up header as "Enter approve/reject reasons"
When I enter aprrove/reject reason as "Approve"
And click aprrove/reject reason ok button
Then I should not see created subscription with "<appName>" and "<publisherOneApi>" "<version>" in the Approval Tasks table
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
Then I should see the API "<publisherOneApi>" "<version>" status as "<status>" and Subscription Tier as "<tier>"
Examples:
|usertype |apiPublisherOne|usertypeSP  |appName      |action  |status    |tier   |publisherOneApi|version|
|PUBLISHER|apipublisherOne|APPCREATE   |AuXTestAPPD  |Approve |UNBLOCKED |Bronze |SubTestOne     |v1     |

@InternalGatewayTypeTwoSubscriptonApproval 
Scenario Outline: DEP-INTGW-1399:API publisher approves task by specifying a throttling layer
Given I am in hubmanager
Then I should see the apimanager Manager page header as "Manager"
When I enter apimanager Manager page "<apiPublisherOne>" username credentials
And I click on apimanager Manager page login button
Then I should see the apimanager Manager Home page header as "Home"
And I should see apimanager Manager Home Billing Workflow Blacklist Whitelist tabs
When I click on apimanager Manager page Workflow tab
Then I should see apimanager Manager Approval Tasks page header as "Approval Tasks"
And I click on subscriptions creation under tasks
Then I should see created subscription with "<appName>" and "<publisherOneApi>" "<version>" at the top of the Approval Tasks table for "<usertype>"
And I should see the status of the subscription "<appName>" "<publisherOneApi>" "<version>" approval task as "RESERVED"
When I click on Subscription Details drop box for "<appName>" "<publisherOneApi>" "<version>" row for "<usertype>"
And I select "<tier>" for "<appName>" "<publisherOneApi>" "<version>" Subscription Details row for "<usertype>" 
And I click on Start button for "<appName>" "<publisherOneApi>" "<version>" Subscription Details row for "<usertype>"
Then I should see the status of the subscription "<appName>" "<publisherOneApi>" "<version>" approval task as "IN_PROGRESS" 
And I select "<action>" and click complete button for "<appName>" "<publisherOneApi>" "<version>" Subscription Details row for "<usertype>"
Then I should see Enter aprrove/reject reasons pop up header as "Enter approve/reject reasons"
When I enter aprrove/reject reason as "Approve"
And click aprrove/reject reason ok button
Then I should not see created subscription with "<appName>" and "<publisherOneApi>" "<version>" in the Approval Tasks table
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
Then I should see the API "<publisherOneApi>" "<version>" status as "<status>" and Subscription Tier as "<tier>"
Examples:
|usertype |apiPublisherOne|usertypeSP  |appName      |action  |status    |tier      |publisherOneApi|version|
|PUBLISHER|apipublisherOne|APPCREATE   |AuXTestAPPC  |Approve |UNBLOCKED |Premium   |SubTestOne     |v1     |

@InternalGatewayTypeTwoSubscriptonApproval 
Scenario Outline: DEP-INTGW-1400:API publisher approves task without changing already applied throttling layer
Given I am in hubmanager
Then I should see the apimanager Manager page header as "Manager"
When I enter apimanager Manager page "<apiPublisherTwo>" username credentials
And I click on apimanager Manager page login button
Then I should see the apimanager Manager Home page header as "Home"
And I should see apimanager Manager Home Billing Workflow Blacklist Whitelist tabs
When I click on apimanager Manager page Workflow tab
Then I should see apimanager Manager Approval Tasks page header as "Approval Tasks"
And I click on subscriptions creation under tasks
Then I should see created subscription with "<appName>" and "<publisherTwoApi>" "<version>" at the top of the Approval Tasks table for "<usertype>"
When I click on Subscription Details drop box for "<appName>" "<publisherTwoApi>" "<version>" row for "<usertype>"
And I select "<olderTier>" for "<appName>" "<publisherTwoApi>" "<version>" Subscription Details row for "<usertype>"
And I should see the status of the subscription "<appName>" "<publisherTwoApi>" "<version>" approval task as "RESERVED" 
And I click on Start button for "<appName>" "<publisherTwoApi>" "<version>" Subscription Details row for "<usertype>"
And I should see the selected throttling layer as "<olderTier>" for "<appName>" "<publisherTwoApi>" "<version>" Subscription
Then I should see the status of the subscription "<appName>" "<publisherTwoApi>" "<version>" approval task as "IN_PROGRESS" 
And I select "<action>" and click complete button for "<appName>" "<publisherTwoApi>" "<version>" Subscription Details row for "<usertype>"
Then I should see Enter aprrove/reject reasons pop up header as "Enter approve/reject reasons"
When I enter aprrove/reject reason as "Approve"
And click aprrove/reject reason ok button
Then I should not see created subscription with "<appName>" and "<publisherOneApi>" "<version>" in the Approval Tasks table
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
Then I should see the API "<publisherTwoApi>" "<version>" status as "<status>" and Subscription Tier as "<olderTier>"
Examples:
|usertype |apiPublisherTwo|usertypeSP|appName        |action  |status    |olderTier   |publisherTwoApi|version|
|PUBLISHER|apipublisherTwo|APPCREATE |AuXTestAPPB    |Approve |UNBLOCKED |Unlimited   |SubTestTwo     |v1     |

@InternalGatewayTypeTwoSubscriptonApproval 
Scenario Outline: DEP-INTGW-1401:API publisher approves task and changes the previously applied throttling layer
Given I am in hubmanager
Then I should see the apimanager Manager page header as "Manager"
When I enter apimanager Manager page "<apiPublisherOne>" username credentials
And I click on apimanager Manager page login button
Then I should see the apimanager Manager Home page header as "Home"
And I should see apimanager Manager Home Billing Workflow Blacklist Whitelist tabs
When I click on apimanager Manager page Workflow tab
Then I should see apimanager Manager Approval Tasks page header as "Approval Tasks"
And I click on subscriptions creation under tasks
Then I should see created subscription with "<appName>" and "<publisherOneApi>" "<version>" at the top of the Approval Tasks table for "<usertype>"
When I click on Subscription Details drop box for "<appName>" "<publisherOneApi>" "<version>" row for "<usertype>"
And I select "<olderTier>" for "<appName>" "<publisherOneApi>" "<version>" Subscription Details row for "<usertype>"
And I should see the status of the subscription "<appName>" "<publisherOneApi>" "<version>" approval task as "RESERVED" 
And I select "<newTier>" for "<appName>" "<publisherOneApi>" "<version>" Subscription Details row for "<usertype>"
And I click on Start button for "<appName>" "<publisherOneApi>" "<version>" Subscription Details row for "<usertype>"
Then I should see the status of the subscription "<appName>" "<publisherOneApi>" "<version>" approval task as "IN_PROGRESS" 
And I select "<action>" and click complete button for "<appName>" "<publisherOneApi>" "<version>" Subscription Details row for "<usertype>"
Then I should see Enter aprrove/reject reasons pop up header as "Enter approve/reject reasons"
When I enter aprrove/reject reason as "Approve"
And click aprrove/reject reason ok button
Then I should not see created subscription with "<appName>" and "<publisherOneApi>" "<version>" in the Approval Tasks table
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
Then I should see the API "<publisherOneApi>" "<version>" status as "<status>" and Subscription Tier as "<newTier>"
Examples:
|usertype |apiPublisherOne|usertypeSP|appName        |action  |status    |olderTier   |newTier |publisherOneApi|version|
|PUBLISHER|apipublisherOne|APPCREATE |AuXTestAPPA    |Approve |UNBLOCKED |Unlimited   |Small   |SubTestOne     |v1     |

@InternalGatewayTypeTwoSubscriptonApproval  
Scenario Outline: DEP-INTGW-1402:API publisher rejects subscription approval task
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
|usertype |usertypeSP|apiPublisherOne|usertypeSP  |appName        |action  |status   |tier    |apiname   |version|
|PUBLISHER|APPCREATE |apipublisherOne|APPCREATE   |AuXTestAPPE    |Reject  |REJECTED |Default |SubTestOne|v1     |

@InternalGatewayTypeTwoSubscriptonApproval  
Scenario Outline: DEP-INTGW-1413:Task recreation for a resubscription
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
Then I should see the "<apiName>" and "<version>" under Subscribed APIs
When I unsubscribe existing "<apiName>" with "<version>"
Then I should see the confirm delete popup with "Confirm Delete"
And I click on confirm delete popup Yes button
When I click on apimanager APIs module
Then I should search apimanager API "<apiName>"
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
Given I am in hubmanager
Then I should see the apimanager Manager page header as "Manager"
When I enter apimanager Manager page "<apiPublisherOne>" username credentials
And I click on apimanager Manager page login button
Then I should see the apimanager Manager Home page header as "Home"
And I should see apimanager Manager Home Billing Workflow Blacklist Whitelist tabs
When I click on apimanager Manager page Workflow tab
Then I should see apimanager Manager Approval Tasks page header as "Approval Tasks"
And I click on subscriptions creation under tasks
Then I should see created subscription with "<appName>" and "<apiName>" "<version>" at the top of the Approval Tasks table for "<usertype>"
And I should see the status of the subscription "<appName>" "<apiName>" "<version>" approval task as "READY"
And I click Assign To Me button for "<appName>" "<apiName>" "<version>" Subscription Details row for "<usertype>"
And I should see the status of the subscription "<appName>" "<apiName>" "<version>" approval task as "RESERVED" 
And I click on Start button for "<appName>" "<apiName>" "<version>" Subscription Details row for "<usertype>"
Then I should see the status of the subscription "<appName>" "<apiName>" "<version>" approval task as "IN_PROGRESS" 
And I select "<action>" and click complete button for "<appName>" "<apiName>" "<version>" Subscription Details row for "<usertype>"
Then I should see Enter aprrove/reject reasons pop up header as "Enter approve/reject reasons"
When I enter aprrove/reject reason as "Approve"
And click aprrove/reject reason ok button
Then I should not see created subscription with "<appName>" and "<apiName>" "<version>" in the Approval Tasks table
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
Then I should see the API "<apiName>" "<version>" status as "<status>" and Subscription Tier as "<tier>"
Examples:
|usertypeSP|usertype |apiPublisherOne|appName      |action  |status    |tier    |apiName   |version|
|APPCREATE |PUBLISHER|apipublisherOne|AuXTestAPPC  |Approve |UNBLOCKED |Bronze  |SubTestOne|v1     |