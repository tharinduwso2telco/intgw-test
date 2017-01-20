Feature: Operator Admin Approves created Subscriptions

@ExternalGateway
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
Then I should see created subscription with "<appname>" and "<subscribeAPI>" at the top of the Approval Tasks table for "<usertype>"
And I should see the status of the subscription "<appname>" "<subscribeAPI>" approval task as "READY"
And I click Assign To Me button for "<appname>" "<subscribeAPI>" Subscription Details row for "<usertype>"
And I should see the status of the subscription "<appname>" "<subscribeAPI>" approval task as "RESERVED" 
Examples:
|usertype |appname    |subscribeAPI   |
|AdminUser|AuXTestAPPA|WeatherAPI - v1|

@ExternalGateway
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
Then I should see created subscription with "<appname>" and "<subscribeAPI>" at the top of the Approval Tasks table for "<usertype>"
And I should see the status of the subscription "<appname>" "<subscribeAPI>" approval task as "READY"
And I click Assign To Me button for "<appname>" "<subscribeAPI>" Subscription Details row for "<usertype>"
When I click on Subscription Details drop box for "<appname>" "<subscribeAPI>" row for "<usertype>"
And I select "<tiers>" for "<appname>" "<subscribeAPI>" Subscription Details row for "<usertype>"
And I should see the status of the subscription "<appname>" "<subscribeAPI>" approval task as "RESERVED" 
And I should see the selected throttling layer as "<tiers>" for "<appname>" "<subscribeAPI>" Subscription
Examples:
|usertype |appname    |tiers    |subscribeAPI   |
|AdminUser|AuXTestAPPB|Unlimited|WeatherAPI - v1|

@ExternalGateway
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
Then I should see created subscription with "<appname>" and "<subscribeAPI>" at the top of the Approval Tasks table for "<usertype>"
And I should see the status of the subscription "<appname>" "<subscribeAPI>" approval task as "RESERVED" 
And I click on Start button for "<appname>" "<subscribeAPI>" Subscription Details row for "<usertype>"
Then I should see the status of the subscription "<appname>" "<subscribeAPI>" approval task as "IN_PROGRESS"
Then I click on action dropdown of "<appname>" "<subscribeAPI>" task
And I should see Action "<options>" of the "<appname>" "<subscribeAPI>" task in the dropdown
Examples:
|usertype |appname    |options        |subscribeAPI   |
|AdminUser|AuXTestAPPA|Approve,Reject |WeatherAPI - v1|


@ExternalGateway
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
Then I should see created subscription with "<appname>" and "<subscribeAPI>" at the top of the Approval Tasks table for "<usertype>"
And I should see the status of the subscription "<appname>" "<subscribeAPI>" approval task as "RESERVED" 
When I click on Subscription Details drop box for "<appname>" "<subscribeAPI>" row for "<usertype>"
And I select "<tiers>" for "<appname>" "<subscribeAPI>" Subscription Details row for "<usertype>"
And I click on Start button for "<appname>" "<subscribeAPI>" Subscription Details row for "<usertype>"
Then I should see the status of the subscription "<appname>" "<subscribeAPI>" approval task as "IN_PROGRESS"
And I should see the selected throttling layer as "<tiers>" for "<appname>" "<subscribeAPI>" Subscription
Then I click on action dropdown of "<appname>" "<subscribeAPI>" task
And I should see Action "<options>" of the "<appname>" "<subscribeAPI>" task in the dropdown
Examples:
|usertype |appname      |options        |tiers    |subscribeAPI   |
|AdminUser|AuXTestAPPB  |Approve,Reject |Unlimited|WeatherAPI - v1|


@ExternalGateway
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
Then I should see created subscription with "<appname>" and "<subscribeAPI>" at the top of the Approval Tasks table for "<usertype>"
When I click on Subscription Details drop box for "<appname>" "<subscribeAPI>" row for "<usertype>"
And I select "<tiers>" for "<appname>" "<subscribeAPI>" Subscription Details row for "<usertype>"
And I should see the status of the subscription "<appname>" "<subscribeAPI>" approval task as "READY"
And I click Assign To Me button for "<appname>" "<subscribeAPI>" Subscription Details row for "<usertype>"
And I should see the status of the subscription "<appname>" "<subscribeAPI>" approval task as "RESERVED" 
And I click on Start button for "<appname>" "<subscribeAPI>" Subscription Details row for "<usertype>"
Then I should see the status of the subscription "<appname>" "<subscribeAPI>" approval task as "IN_PROGRESS"
And I should see the selected throttling layer as "<tiers>" for "<appname>" "<subscribeAPI>" Subscription
Then I click on action dropdown of "<appname>" "<subscribeAPI>" task
And I should see Action "<options>" of the "<appname>" "<subscribeAPI>" task in the dropdown
Examples:
|usertype |appname        |options        |tiers    |subscribeAPI   |
|AdminUser|AuXTestAPPC    |Approve,Reject |Premium  |WeatherAPI - v1|


@ExternalGateway
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
Then I should see created subscription with "<appname>" and "<subscribeAPI>" at the top of the Approval Tasks table for "<usertype>"
When I click on Subscription Details drop box for "<appname>" "<subscribeAPI>" row for "<usertype>"
And I select "<olderTiers>" for "<appname>" "<subscribeAPI>" Subscription Details row for "<usertype>"
And I should see the status of the subscription "<appname>" "<subscribeAPI>" approval task as "READY"
And I click Assign To Me button for "<appname>" "<subscribeAPI>" Subscription Details row for "<usertype>"
And I should see the selected throttling layer as "<olderTiers>" for "<appname>" "<subscribeAPI>" Subscription
And I should see the status of the subscription "<appname>" "<subscribeAPI>" approval task as "RESERVED" 
And I click on Start button for "<appname>" "<subscribeAPI>" Subscription Details row for "<usertype>"
Then I should see the status of the subscription "<appname>" "<subscribeAPI>" approval task as "IN_PROGRESS"
And I select "<newTiers>" for "<appname>" "<subscribeAPI>" Subscription Details row for "<usertype>"
And I click on Start button for "<appname>" "<subscribeAPI>" Subscription Details row for "<usertype>"
Then I should see the status of the subscription "<appname>" "<subscribeAPI>" approval task as "IN_PROGRESS"
And I should see the selected throttling layer as "<newTiers>" for "<appname>" "<subscribeAPI>" Subscription
Then I click on action dropdown of "<appname>" "<subscribeAPI>" task
And I should see Action "<options>" of the "<appname>" "<subscribeAPI>" task in the dropdown
Examples:
|usertype |appname       |options        |olderTiers   |newTiers |subscribeAPI   |
|AdminUser|AuXTestAPPD   |Approve,Reject |Unlimited    |Premium  |WeatherAPI - v1|


@ExternalGateway
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
Then I should see created subscription with "<appname>" and "<subscribeAPI>" at the top of the Approval Tasks table for "<usertype>"
And I should see the status of the subscription "<appname>" "<subscribeAPI>" approval task as "RESERVED" 
And I click on Start button for "<appname>" "<subscribeAPI>" Subscription Details row for "<usertype>"
Then I should see the status of the subscription "<appname>" "<subscribeAPI>" approval task as "IN_PROGRESS"
And I select "<action>" and click complete button for "<appname>" "<subscribeAPI>" Subscription Details row for "<usertype>"
Then I should see Enter aprrove/reject reasons pop up header as "Enter approve/reject reasons"
When I enter aprrove/reject reason as "Approve"
And click aprrove/reject reason ok button
Then I should not see created subscription with "<appname>" and "<subscribeAPI>" in the Approval Tasks table
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
Then I should see the API "<subscribeAPI>" status as "<status>" and Subscription Tier as "<tier>"
Examples:
|usertype |usertypeSP|appname     |action  |status    |tier     |subscribeAPI      |
|AdminUser|APPCREATE |AuXTestAPPA |Approve |UNBLOCKED |Bronze   |WeatherAPI - v1   |    


@ExternalGateway
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
Then I should see created subscription with "<appname>" and "<subscribeAPI>" at the top of the Approval Tasks table for "<usertype>"
And I should see the status of the subscription "<appname>" "<subscribeAPI>" approval task as "RESERVED" 
And I click on Start button for "<appname>" "<subscribeAPI>" Subscription Details row for "<usertype>"
Then I should see the status of the subscription "<appname>" "<subscribeAPI>" approval task as "IN_PROGRESS"
When I click on Subscription Details drop box for "<appname>" "<subscribeAPI>" row for "<usertype>"
And I select "<tier>" for "<appname>" "<subscribeAPI>" Subscription Details row for "<usertype>"
And I select "<action>" and click complete button for "<appname>" "<subscribeAPI>" Subscription Details row for "<usertype>"
Then I should see Enter aprrove/reject reasons pop up header as "Enter approve/reject reasons"
When I enter aprrove/reject reason as "Approve"
And click aprrove/reject reason ok button
Then I should not see created subscription with "<appname>" and "<subscribeAPI>" in the Approval Tasks table
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
Then I should see the API "<subscribeAPI>" status as "<status>" and Subscription Tier as "<tier>"
Examples:
|usertype |usertypeSP|appname     |action  |status    |tier        |subscribeAPI   |
|AdminUser|APPCREATE |AuXTestAPPB |Approve |UNBLOCKED |Unlimited   |WeatherAPI - v1|  


@ExternalGateway
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
Then I should see created subscription with "<appname>" and "<subscribeAPI>" at the top of the Approval Tasks table for "<usertype>"
When I click on Subscription Details drop box for "<appname>" "<subscribeAPI>" row for "<usertype>"
And I select "<tier>" for "<appname>" "<subscribeAPI>" Subscription Details row for "<usertype>"
And I should see the status of the subscription "<appname>" "<subscribeAPI>" approval task as "RESERVED" 
And I click on Start button for "<appname>" "<subscribeAPI>" Subscription Details row for "<usertype>"
Then I should see the status of the subscription "<appname>" "<subscribeAPI>" approval task as "IN_PROGRESS"
And I select "<action>" and click complete button for "<appname>" "<subscribeAPI>" Subscription Details row for "<usertype>"
Then I should see Enter aprrove/reject reasons pop up header as "Enter approve/reject reasons"
When I enter aprrove/reject reason as "Approve"
And click aprrove/reject reason ok button
Then I should not see created subscription with "<appname>" and "<subscribeAPI>" in the Approval Tasks table
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
Then I should see the API "<subscribeAPI>" status as "<status>" and Subscription Tier as "<tier>"
Examples:
|usertype |usertypeSP|appname       |action  |status    |tier        |subscribeAPI    |
|AdminUser|APPCREATE |AuXTestAPPC   |Approve |UNBLOCKED |Unlimited   |WeatherAPI - v1 |  


@ExternalGateway
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
Then I should see created subscription with "<appname>" and "<subscribeAPI>" at the top of the Approval Tasks table for "<usertype>"
When I click on Subscription Details drop box for "<appname>" "<subscribeAPI>" row for "<usertype>"
And I select "<olderTier>" for "<appname>" "<subscribeAPI>" Subscription Details row for "<usertype>"
And I should see the status of the subscription "<appname>" "<subscribeAPI>" approval task as "RESERVED" 
And I click on Start button for "<appname>" "<subscribeAPI>" Subscription Details row for "<usertype>"
Then I should see the status of the subscription "<appname>" "<subscribeAPI>" approval task as "IN_PROGRESS"
And I select "<newTier>" for "<appname>" "<subscribeAPI>" Subscription Details row for "<usertype>"
And I select "<action>" and click complete button for "<appname>" "<subscribeAPI>" Subscription Details row for "<usertype>"
Then I should see Enter aprrove/reject reasons pop up header as "Enter approve/reject reasons"
When I enter aprrove/reject reason as "Approve"
And click aprrove/reject reason ok button
Then I should not see created subscription with "<appname>" and "<subscribeAPI>" in the Approval Tasks table
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
Then I should see the API "<subscribeAPI>" status as "<status>" and Subscription Tier as "<tier>"
Examples:
|usertype |usertypeSP|appname       |action  |status    |olderTier   |newTier |subscribeAPI    |
|AdminUser|APPCREATE |AuXTestAPPD   |Approve |UNBLOCKED |Unlimited   |Gold    |WeatherAPI - v1 |  


@ExternalGateway
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
Then I should see created subscription with "<appname>" and "<subscribeAPI>" at the top of the Approval Tasks table for "<usertype>"
And I should see the status of the subscription "<appname>" "<subscribeAPI>" approval task as "READY"
And I click Assign To Me button for "<appname>" "<subscribeAPI>" Subscription Details row for "<usertype>"
And I should see the status of the subscription "<appname>" "<subscribeAPI>" approval task as "RESERVED" 
And I click on Start button for "<appname>" "<subscribeAPI>" Subscription Details row for "<usertype>"
Then I should see the status of the subscription "<appname>" "<subscribeAPI>" approval task as "IN_PROGRESS"
And I select "<action>" and click complete button for "<appname>" "<subscribeAPI>" Subscription Details row for "<usertype>"
Then I should see Enter aprrove/reject reasons pop up header as "Enter approve/reject reasons"
When I enter aprrove/reject reason as "Reject"
And click aprrove/reject reason ok button
Then I should not see created subscription with "<appname>" and "<subscribeAPI>" in the Approval Tasks table
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
Then I should see the API "<subscribeAPI>" status as "<status>" and Subscription Tier as "<tier>"
Examples:
|usertype |usertypeSP|appname     |action  |status   |tier    |subscribeAPI    |
|AdminUser|APPCREATE |AuXTestAPPE |Reject  |REJECTED |Default |WeatherAPI - v1 | 


@ExternalGateway 
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
Then I should see the API "<subscribeAPI>" status as "<status>" and Subscription Tier as "<tier>"
Given I am in hubmanager
Then I should see the apimanager Manager page header as "Manager"
When I enter apimanager Manager page admin username credentials
And I click on apimanager Manager page login button
Then I should see the apimanager Manager Home page header as "Home"
And I should see apimanager Manager Home Billing Workflow Blacklist Whitelist tabs
When I click on apimanager Manager page Workflow tab
Then I should see apimanager Manager Approval Tasks page header as "Approval Tasks"
And I click on subscriptions creation under tasks
Then I should see created subscription with "<appname>" and "<subscribeAPI>" at the top of the Approval Tasks table for "<usertype>"
And I should see the status of the subscription "<appname>" "<subscribeAPI>" approval task as "READY"
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
|usertype |usertypeSP|appname     |status   |tier    |apiname    |version|subscribeAPI   |
|AdminUser|APPCREATE |AuXTestAPPA |ON_HOLD  |Default |WeatherAPI |v1     |WeatherAPI - v1|
