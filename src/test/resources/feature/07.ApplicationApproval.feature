Feature: Operator Admin Approves created Applications

@InternalGateway @ExternalGateway
Scenario Outline: HUB-335 : Operator admin user assigns a application task to himself without throttling layer application
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
Then I should see the status of the application "<appname>" approval task as "RESERVED" 
Examples:
|usertype |appname      |
|AdminUser|AuXTestAPPA  |

@InternalGateway @ExternalGateway
Scenario Outline: HUB-337 : Operator admin user assigns a application task to himself and applies throttling layer
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
When I click on Application Details drop box for "<appname>" row for "<usertype>"
And I select "<tiers>" for "<appname>" Application Details row for "<usertype>"
And I should see the status of the application "<appname>" approval task as "READY" 
And I click Assign To Me button for "<appname>" Application Details row for "<usertype>"
Then I should see the status of the application "<appname>" approval task as "RESERVED"
And I should see the selected throttling layer as "<tiers>" for "<appname>" Application
Examples:
|usertype |appname      |tiers    |
|AdminUser|AuXTestAPPB  |Unlimited|

@InternalGateway @ExternalGateway
Scenario Outline: HUB-338 : Operator admin user starts assigned task without applying throttling layer
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
And I should see the status of the application "<appname>" approval task as "RESERVED" 
And I click on Start button for "<appname>" Application Details row for "<usertype>"
Then I should see the status of the application "<appname>" approval task as "IN_PROGRESS" 
Then I click on action dropdown of "<appname>" task
And I should see Action "<options>" of the "<appname>" task in the dropdown
Examples:
|usertype |appname      |options        |
|AdminUser|AuXTestAPPA  |Approve,Reject |

@InternalGateway @ExternalGateway
Scenario Outline: HUB-339 : Operator admin user starts assigned task and applies throttling layer
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
When I click on Application Details drop box for "<appname>" row for "<usertype>"
And I select "<tiers>" for "<appname>" Application Details row for "<usertype>"
And I should see the status of the application "<appname>" approval task as "RESERVED" 
And I click on Start button for "<appname>" Application Details row for "<usertype>"
Then I should see the status of the application "<appname>" approval task as "IN_PROGRESS"
And I should see the selected throttling layer as "<tiers>" for "<appname>" Application
Then I click on action dropdown of "<appname>" task
And I should see Action "<options>" of the "<appname>" task in the dropdown
Examples:
|usertype |appname      |options        |tiers    |
|AdminUser|AuXTestAPPB  |Approve,Reject |Unlimited|

@InternalGateway @ExternalGateway
Scenario Outline: HUB-340 : Operator admin user starts assigned task without changing already applied throttling layer
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
When I click on Application Details drop box for "<appname>" row for "<usertype>"
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
|usertype |appname      |options        |tiers    |
|AdminUser|AuXTestAPPC  |Approve,Reject |Unlimited|

@InternalGateway @ExternalGateway
Scenario Outline: HUB-341 : Operator admin user starts assigned task and changes the existing throttling layer
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
When I click on Application Details drop box for "<appname>" row for "<usertype>"
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
|usertype |appname      |options        |olderTiers   |newTiers |
|AdminUser|AuXTestAPPD  |Approve,Reject |Unlimited    |Medium   |

@InternalGateway @ExternalGateway
Scenario Outline: HUB-342 : Operator admin user approves task without applying throttling layer
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

@InternalGateway @ExternalGateway
Scenario Outline: HUB-343 : Operator admin user approves task while applying throttling layer
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
And I should see the status of the application "<appname>" approval task as "RESERVED" 
And I click on Start button for "<appname>" Application Details row for "<usertype>"
Then I should see the status of the application "<appname>" approval task as "IN_PROGRESS"
When I click on Application Details drop box for "<appname>" row for "<usertype>"
And I select "<tier>" for "<appname>" Application Details row for "<usertype>"
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
|usertype |usertypeSP  |appname      |action  |status |tier        |
|AdminUser|APPCREATE   |AuXTestAPPB  |Approve |ACTIVE |Unlimited   |


@InternalGateway @ExternalGateway
Scenario Outline: HUB-344 : Operator admin user approves task without changing already applied throttling layer
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
When I click on Application Details drop box for "<appname>" row for "<usertype>"
And I select "<tier>" for "<appname>" Application Details row for "<usertype>"
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
|usertype |usertypeSP|appname         |action  |status |tier        |
|AdminUser|APPCREATE |AuXTestAPPC     |Approve |ACTIVE |Unlimited   |

@InternalGateway @ExternalGateway
Scenario Outline: HUB-345 : Operator admin user approves task and changes the previously applied throttling layer
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
When I click on Application Details drop box for "<appname>" row for "<usertype>"
And I select "<olderTier>" for "<appname>" Application Details row for "<usertype>"
And I should see the status of the application "<appname>" approval task as "RESERVED" 
And I click on Start button for "<appname>" Application Details row for "<usertype>"
Then I should see the status of the application "<appname>" approval task as "IN_PROGRESS"
And I select "<newTier>" for "<appname>" Application Details row for "<usertype>"
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
Then I should see the Application "<appname>" workflow status as "<status>" and Tier as "<newTier>"
Examples:
|usertype |usertypeSP|appname        |action  |status |olderTier   |newTier |
|AdminUser|APPCREATE |AuXTestAPPD    |Approve |ACTIVE |Unlimited   |Small   |

@InternalGateway @ExternalGateway
Scenario Outline: HUB-346 : Operator admin user rejects application approval task
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
When I enter aprrove/reject reason as "Reject"
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
|usertype |usertypeSP|appname        |action  |status   |tier    |
|AdminUser|APPCREATE |AuXTestAPPE    |Reject  |REJECTED |Default |