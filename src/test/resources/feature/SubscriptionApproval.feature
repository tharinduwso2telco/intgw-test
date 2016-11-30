Feature: Operator Admin Approves created Subscriptions

@HUB-347
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
Then I should see created application "<appname>" at the top of the Approval Tasks table for "<usertype>"
And I should see the status of the application "<appname>" approval task as "READY" 
And I click Assign To Me button for "<appname>" Application Details row for "<usertype>"
Then I should see the status of the application "<appname>" approval task as "RESERVED" 

Examples:
|usertype |appname   |
|AdminUser|AppThree  |


@HUB-349
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
Then I should see created application "<appname>" at the top of the Approval Tasks table for "<usertype>"
When I click on Subscription Details drop box for "<appname>" row for "<usertype>"
And I select "<tiers>" for "<appname>" Application Details row for "<usertype>"
And I should see the status of the application "<appname>" approval task as "READY" 
And I click Assign To Me button for "<appname>" Application Details row for "<usertype>"
Then I should see the status of the application "<appname>" approval task as "RESERVED"
And I should see the selected throttling layer as "<tiers>" for "<appname>" Application
Examples:
|usertype |appname   |tiers    |
|AdminUser|AppSix    |Unlimited|

@HUB-350
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
Then I should see created application "<appname>" at the top of the Approval Tasks table for "<usertype>"
And I should see the status of the application "<appname>" approval task as "RESERVED" 
And I click on Start button for "<appname>" Application Details row for "<usertype>"
Then I should see the status of the application "<appname>" approval task as "IN_PROGRESS" 
Then I click on action dropdown of "<appname>" task
And I should see Action "<options>" of the "<appname>" task in the dropdown
Examples:
|usertype |appname |options        |
|AdminUser|AppSix  |Approve,Reject |


@HUB-351
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
Then I should see created application "<appname>" at the top of the Approval Tasks table for "<usertype>"
When I click on Subscription Details drop box for "<appname>" row for "<usertype>"
And I select "<tiers>" for "<appname>" Application Details row for "<usertype>"
And I should see the status of the application "<appname>" approval task as "RESERVED" 
And I click on Start button for "<appname>" Application Details row for "<usertype>"
Then I should see the status of the application "<appname>" approval task as "IN_PROGRESS"
And I should see the selected throttling layer as "<tiers>" for "<appname>" Application
Then I click on action dropdown of "<appname>" task
And I should see Action "<options>" of the "<appname>" task in the dropdown
Examples:
|usertype |appname |options        |tiers    |
|AdminUser|AppSix  |Approve,Reject |Unlimited|


@HUB-352
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
Then I should see created application "<appname>" at the top of the Approval Tasks table for "<usertype>"
When I click on Subscription Details drop box for "<appname>" row for "<usertype>"
And I select "<tiers>" for "<appname>" Application Details row for "<usertype>"
And I should see the status of the application "<appname>" approval task as "READY" 
And I click Assign To Me button for "<appname>" Application Details row for "<usertype>"
Then I should see the status of the application "<appname>" approval task as "RESERVED"
And I click on Start button for "<appname>" Application Details row for "<usertype>"
Then I should see the status of the application "<appname>" approval task as "IN_PROGRESS"
And I should see the selected throttling layer as "<tiers>" for "<appname>" Application
Then I click on action dropdown of "<appname>" task
And I should see Action "<options>" of the "<appname>" task in the dropdown
Examples:
|usertype |appname   |options        |tiers    |
|AdminUser|AppSix    |Approve,Reject |Premium  |


@HUB-353
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
Then I should see created application "<appname>" at the top of the Approval Tasks table for "<usertype>"
When I click on Subscription Details drop box for "<appname>" row for "<usertype>"
And I select "<olderTiers>" for "<appname>" Application Details row for "<usertype>"
And I should see the status of the application "<appname>" approval task as "READY" 
And I click Assign To Me button for "<appname>" Application Details row for "<usertype>"
And I should see the selected throttling layer as "<olderTiers>" for "<appname>" Application
Then I should see the status of the application "<appname>" approval task as "RESERVED"
And I select "<newTiers>" for "<appname>" Application Details row for "<usertype>"
And I click on Start button for "<appname>" Application Details row for "<usertype>"
Then I should see the status of the application "<appname>" approval task as "IN_PROGRESS"
And I should see the selected throttling layer as "<newTiers>" for "<appname>" Application
Then I click on action dropdown of "<appname>" task
And I should see Action "<options>" of the "<appname>" task in the dropdown
Examples:
|usertype |appname   |options        |olderTiers   |newTiers |
|AdminUser|AppSix    |Approve,Reject |Unlimited    |Premium  |


@HUB-342  @malshi
Scenario Outline: HUB-342 : Operator admin user approves task without applying throttling layer
#Given I am in hubmanager
Then I should see the apimanager Manager page header as "Manager"
When I enter apimanager Manager page admin username credentials
And I click on apimanager Manager page login button
Then I should see the apimanager Manager Home page header as "Home"
And I should see apimanager Manager Home Billing Workflow Blacklist Whitelist tabs
When I click on apimanager Manager page Workflow tab
Then I should see apimanager Manager Approval Tasks page header as "Approval Tasks"
And I click on subscriptions creation under tasks
Then I should see created application "<appname>" at the top of the Approval Tasks table for "<usertype>"
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
When I click on apimanager Application "<appName>"
Then I click on Application "<appName>" "Subscriptions" tab
Then I should see the API "<apiname>" status as "<status>" and Subscription Tier as "<tier>"
Examples:
|usertype |usertypeSP|appname |action  |status |tier    |
|AdminUser|APPCREATE |AppFive |Approve |ACTIVE |Large   |