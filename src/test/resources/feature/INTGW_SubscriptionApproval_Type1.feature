Feature: API Publisher Approves created Subscriptions Type 1

@InternalGatewayTypeOne 
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
Then I should see created subscription with "<appName>" and "<subscribeAPI>" at the top of the Approval Tasks table for "<usertypeAdmin>"
And I should see the status of the subscription "<appName>" "<subscribeAPI>" approval task as "READY"
And I click Assign To Me button for "<appName>" "<subscribeAPI>" Subscription Details row for "<usertypeAdmin>"
And I should see the status of the subscription "<appName>" "<subscribeAPI>" approval task as "RESERVED" 
And I click on Start button for "<appName>" "<subscribeAPI>" Subscription Details row for "<usertypeAdmin>"
Then I should see the status of the subscription "<appName>" "<subscribeAPI>" approval task as "IN_PROGRESS" 
And I select "<action>" and click complete button for "<appName>" "<subscribeAPI>" Subscription Details row for "<usertypeAdmin>"
Then I should see Enter aprrove/reject reasons pop up header as "Enter approve/reject reasons"
When I enter aprrove/reject reason as "Approve"
And click aprrove/reject reason ok button
Then I should not see created subscription with "<appName>" and "<subscribeAPI>" in the Approval Tasks table
Given I am in hubmanager
Then I should see the apimanager Manager page header as "Manager"
When I enter apimanager Manager page "<apiPublisherOne>" username credentials
And I click on apimanager Manager page login button
Then I should see the apimanager Manager Home page header as "Home"
And I should see apimanager Manager Home Billing Workflow Blacklist Whitelist tabs
When I click on apimanager Manager page Workflow tab
Then I should see apimanager Manager Approval Tasks page header as "Approval Tasks"
And I click on subscriptions creation under tasks
Then I should see created subscription with "<appName>" and "<subscribeAPI>" at the top of the Approval Tasks table for "<usertype>"
And I should see the status of the subscription "<appName>" "<subscribeAPI>" approval task as "READY"
And I click Assign To Me button for "<appName>" "<subscribeAPI>" Subscription Details row for "<usertype>"
And I should see the status of the subscription "<appName>" "<subscribeAPI>" approval task as "RESERVED" 
And I click on Start button for "<appName>" "<subscribeAPI>" Subscription Details row for "<usertype>"
Then I should see the status of the subscription "<appName>" "<subscribeAPI>" approval task as "IN_PROGRESS" 
Then I click on action dropdown of "<appName>" "<subscribeAPI>" task
And I should see Action "<options>" of the "<appName>" "<subscribeAPI>" task in the dropdown
Examples:
|usertypeAdmin|usertype |usertypeSP|apiPublisherOne|appName     |action |options        |subscribeAPI   |apiname   |version|
|AdminUser    |PUBLISHER|APPCREATE |apipublisherOne|AuXTestAPPA |Approve|Approve,Reject |WeatherAPI - v1|WeatherAPI|v1     |

@InternalGatewayTypeOne 
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
Then I should see created subscription with "<appName>" and "<subscribeAPI>" at the top of the Approval Tasks table for "<usertypeAdmin>"
And I should see the status of the subscription "<appName>" "<subscribeAPI>" approval task as "READY"
And I click Assign To Me button for "<appName>" "<subscribeAPI>" Subscription Details row for "<usertypeAdmin>"
And I should see the status of the subscription "<appName>" "<subscribeAPI>" approval task as "RESERVED" 
And I click on Start button for "<appName>" "<subscribeAPI>" Subscription Details row for "<usertypeAdmin>"
Then I should see the status of the subscription "<appName>" "<subscribeAPI>" approval task as "IN_PROGRESS" 
And I select "<action>" and click complete button for "<appName>" "<subscribeAPI>" Subscription Details row for "<usertypeAdmin>"
Then I should see Enter aprrove/reject reasons pop up header as "Enter approve/reject reasons"
When I enter aprrove/reject reason as "Approve"
And click aprrove/reject reason ok button
Then I should not see created subscription with "<appName>" and "<subscribeAPI>" in the Approval Tasks table
Given I am in hubmanager
Then I should see the apimanager Manager page header as "Manager"
When I enter apimanager Manager page "<apiPublisherOne>" username credentials
And I click on apimanager Manager page login button
Then I should see the apimanager Manager Home page header as "Home"
And I should see apimanager Manager Home Billing Workflow Blacklist Whitelist tabs
When I click on apimanager Manager page Workflow tab
Then I should see apimanager Manager Approval Tasks page header as "Approval Tasks"
And I click on subscriptions creation under tasks
Then I should see created subscription with "<appName>" and "<subscribeAPI>" at the top of the Approval Tasks table for "<usertype>"
And I should see the status of the subscription "<appName>" "<subscribeAPI>" approval task as "READY"
And I click Assign To Me button for "<appName>" "<subscribeAPI>" Subscription Details row for "<usertype>"
And I should see the status of the subscription "<appName>" "<subscribeAPI>" approval task as "RESERVED" 
And I click on Start button for "<appName>" "<subscribeAPI>" Subscription Details row for "<usertype>"
When I click on Subscription Details drop box for "<appName>" "<subscribeAPI>" row for "<usertype>"
And I select "<tiers>" for "<appName>" "<subscribeAPI>" Subscription Details row for "<usertype>"
Then I should see the status of the subscription "<appName>" "<subscribeAPI>" approval task as "IN_PROGRESS" 
Then I click on action dropdown of "<appName>" "<subscribeAPI>" task
And I should see Action "<options>" of the "<appName>" "<subscribeAPI>" task in the dropdown
Examples:
|usertypeAdmin|usertype |usertypeSP|apiPublisherOne|appName     |action |options        |subscribeAPI   |tiers    |apiname   |version|
|AdminUser    |PUBLISHER|APPCREATE |apipublisherOne|AuXTestAPPC |Approve|Approve,Reject |WeatherAPI - v1|Unlimited|WeatherAPI|v1     |

@InternalGatewayTypeOne 
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
Then I should see created subscription with "<appName>" and "<subscribeAPI>" at the top of the Approval Tasks table for "<usertype>"
When I click on Subscription Details drop box for "<appName>" "<subscribeAPI>" row for "<usertype>"
And I select "<tiers>" for "<appName>" "<subscribeAPI>" Subscription Details row for "<usertype>"
And I should see the status of the subscription "<appName>" "<subscribeAPI>" approval task as "RESERVED" 
And I click on Start button for "<appName>" "<subscribeAPI>" Subscription Details row for "<usertype>"
And I should see the selected throttling layer as "<tiers>" for "<appName>" "<subscribeAPI>" Subscription
Then I should see the status of the subscription "<appName>" "<subscribeAPI>" approval task as "IN_PROGRESS" 
Then I click on action dropdown of "<appName>" "<subscribeAPI>" task
And I should see Action "<options>" of the "<appName>" "<subscribeAPI>" task in the dropdown
Examples:
|usertype |apiPublisherOne|appName     |action |options        |subscribeAPI   |tiers    |
|PUBLISHER|apipublisherOne|AuXTestAPPC |Approve|Approve,Reject |WeatherAPI - v1|Unlimited|

@InternalGatewayTypeOne
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
Then I should see created subscription with "<appName>" and "<subscribeAPI>" at the top of the Approval Tasks table for "<usertype>"
When I click on Subscription Details drop box for "<appName>" "<subscribeAPI>" row for "<usertype>"
And I select "<olderTier>" for "<appName>" "<subscribeAPI>" Subscription Details row for "<usertype>"
And I should see the status of the subscription "<appName>" "<subscribeAPI>" approval task as "RESERVED" 
And I click on Start button for "<appName>" "<subscribeAPI>" Subscription Details row for "<usertype>"
And I should see the selected throttling layer as "<olderTier>" for "<appName>" "<subscribeAPI>" Subscription
And I select "<newTier>" for "<appName>" "<subscribeAPI>" Subscription Details row for "<usertype>"
Then I should see the status of the subscription "<appName>" "<subscribeAPI>" approval task as "IN_PROGRESS"
Then I click on action dropdown of "<appName>" "<subscribeAPI>" task
And I should see Action "<options>" of the "<appName>" "<subscribeAPI>" task in the dropdown
Examples:
|usertype |apiPublisherOne|appName     |action |options        |subscribeAPI   |olderTier|newTier |
|PUBLISHER|apipublisherOne|AuXTestAPPC |Approve|Approve,Reject |WeatherAPI - v1|Unlimited|Large   |

@InternalGatewayTypeOne
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
Then I should see created subscription with "<appName>" and "<subscribeAPI>" at the top of the Approval Tasks table for "<usertype>"
And I should see the status of the subscription "<appName>" "<subscribeAPI>" approval task as "RESERVED" 
And I click on Start button for "<appName>" "<subscribeAPI>" Subscription Details row for "<usertype>"
Then I should see the status of the subscription "<appName>" "<subscribeAPI>" approval task as "IN_PROGRESS" 
And I select "<action>" and click complete button for "<appName>" "<subscribeAPI>" Subscription Details row for "<usertype>"
Then I should see Enter aprrove/reject reasons pop up header as "Enter approve/reject reasons"
When I enter aprrove/reject reason as "Approve"
And click aprrove/reject reason ok button
Then I should not see created subscription with "<appName>" and "<subscribeAPI>" in the Approval Tasks table
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
Then I should see the API "<subscribeAPI>" status as "<status>" and Subscription Tier as "<tier>"
Examples:
|usertypeSP|usertype |apiPublisherOne|appName     |action |subscribeAPI   |tier  |status   |
|APPCREATE |PUBLISHER|apipublisherOne|AuXTestAPPA |Approve|WeatherAPI - v1|Bronze|UNBLOCKED|

@InternalGatewayTypeOne
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
Then I should see created subscription with "<appName>" and "<subscribeAPI>" at the top of the Approval Tasks table for "<usertype>"
And I should see the status of the subscription "<appName>" "<subscribeAPI>" approval task as "RESERVED" 
When I click on Subscription Details drop box for "<appName>" "<subscribeAPI>" row for "<usertype>"
And I select "<tiers>" for "<appName>" "<subscribeAPI>" Subscription Details row for "<usertype>"
And I click on Start button for "<appName>" "<subscribeAPI>" Subscription Details row for "<usertype>"
Then I should see the status of the subscription "<appName>" "<subscribeAPI>" approval task as "IN_PROGRESS"
And I select "<action>" and click complete button for "<appName>" "<subscribeAPI>" Subscription Details row for "<usertype>"
Then I should see Enter aprrove/reject reasons pop up header as "Enter approve/reject reasons"
When I enter aprrove/reject reason as "Approve"
And click aprrove/reject reason ok button
Then I should not see created subscription with "<appName>" and "<subscribeAPI>" in the Approval Tasks table
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
Then I should see the API "<subscribeAPI>" status as "<status>" and Subscription Tier as "<tier>"
Examples:
|usertypeSP|usertype |apiPublisherOne|appName     |action |subscribeAPI   |tiers  |status   |
|APPCREATE |PUBLISHER|apipublisherOne|AuXTestAPPC |Approve|WeatherAPI - v1|Premium|UNBLOCKED|

@InternalGatewayTypeOne 
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
Then I should see created subscription with "<appName>" and "<subscribeAPI>" at the top of the Approval Tasks table for "<usertypeAdmin>"
And I should see the status of the subscription "<appName>" "<subscribeAPI>" approval task as "READY"
And I click Assign To Me button for "<appName>" "<subscribeAPI>" Subscription Details row for "<usertypeAdmin>"
And I should see the status of the subscription "<appName>" "<subscribeAPI>" approval task as "RESERVED" 
And I click on Start button for "<appName>" "<subscribeAPI>" Subscription Details row for "<usertypeAdmin>"
Then I should see the status of the subscription "<appName>" "<subscribeAPI>" approval task as "IN_PROGRESS"  
And I select "<action>" and click complete button for "<appName>" "<subscribeAPI>" Subscription Details row for "<usertypeAdmin>"
Then I should see Enter aprrove/reject reasons pop up header as "Enter approve/reject reasons"
When I enter aprrove/reject reason as "Approve"
And click aprrove/reject reason ok button
Then I should not see created subscription with "<appName>" and "<subscribeAPI>" in the Approval Tasks table
Given I am in hubmanager
Then I should see the apimanager Manager page header as "Manager"
When I enter apimanager Manager page "<apiPublisherOne>" username credentials
And I click on apimanager Manager page login button
Then I should see the apimanager Manager Home page header as "Home"
And I should see apimanager Manager Home Billing Workflow Blacklist Whitelist tabs
When I click on apimanager Manager page Workflow tab
Then I should see apimanager Manager Approval Tasks page header as "Approval Tasks"
And I click on subscriptions creation under tasks
Then I should see created subscription with "<appName>" and "<subscribeAPI>" at the top of the Approval Tasks table for "<usertype>"
And I should see the status of the subscription "<appName>" "<subscribeAPI>" approval task as "READY"
And I click Assign To Me button for "<appName>" "<subscribeAPI>" Subscription Details row for "<usertype>"
When I click on Subscription Details drop box for "<appName>" "<subscribeAPI>" row for "<usertype>"
And I select "<tiers>" for "<appName>" "<subscribeAPI>" Subscription Details row for "<usertype>"
And I should see the status of the subscription "<appName>" "<subscribeAPI>" approval task as "RESERVED" 
And I click on Start button for "<appName>" "<subscribeAPI>" Subscription Details row for "<usertype>"
And I should see the selected throttling layer as "<tiers>" for "<appName>" "<subscribeAPI>" Subscription
Then I should see the status of the subscription "<appName>" "<subscribeAPI>" approval task as "IN_PROGRESS" 
And I select "<action>" and click complete button for "<appName>" "<subscribeAPI>" Subscription Details row for "<usertype>"
Then I should see Enter aprrove/reject reasons pop up header as "Enter approve/reject reasons"
When I enter aprrove/reject reason as "Approve"
And click aprrove/reject reason ok button
Then I should not see created subscription with "<appName>" and "<subscribeAPI>" in the Approval Tasks table
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
Then I should see the API "<subscribeAPI>" status as "<status>" and Subscription Tier as "<tier>"
Examples:
|usertypeAdmin|usertypeSP|usertype |apiPublisherOne|appName     |action |subscribeAPI   |tiers  |status   |apiname   |version|
|AdminUser    |APPCREATE |PUBLISHER|apipublisherOne|AuXTestAPPD |Approve|WeatherAPI - v1|Premium|UNBLOCKED|WeatherAPI|v1     |

@InternalGatewayTypeOne 
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
Then I should see created subscription with "<appName>" and "<subscribeAPI>" at the top of the Approval Tasks table for "<usertypeAdmin>"
And I should see the status of the subscription "<appName>" "<subscribeAPI>" approval task as "READY"
And I click Assign To Me button for "<appName>" "<subscribeAPI>" Subscription Details row for "<usertypeAdmin>"
And I should see the status of the subscription "<appName>" "<subscribeAPI>" approval task as "RESERVED" 
And I click on Start button for "<appName>" "<subscribeAPI>" Subscription Details row for "<usertypeAdmin>"
Then I should see the status of the subscription "<appName>" "<subscribeAPI>" approval task as "IN_PROGRESS" 
And I select "<action>" and click complete button for "<appName>" "<subscribeAPI>" Subscription Details row for "<usertypeAdmin>"
Then I should see Enter aprrove/reject reasons pop up header as "Enter approve/reject reasons"
When I enter aprrove/reject reason as "Approve"
And click aprrove/reject reason ok button
Then I should not see created subscription with "<appName>" and "<subscribeAPI>" in the Approval Tasks table
Given I am in hubmanager
Then I should see the apimanager Manager page header as "Manager"
When I enter apimanager Manager page "<apiPublisherOne>" username credentials
And I click on apimanager Manager page login button
Then I should see the apimanager Manager Home page header as "Home"
And I should see apimanager Manager Home Billing Workflow Blacklist Whitelist tabs
When I click on apimanager Manager page Workflow tab
Then I should see apimanager Manager Approval Tasks page header as "Approval Tasks"
And I click on subscriptions creation under tasks
Then I should see created subscription with "<appName>" and "<subscribeAPI>" at the top of the Approval Tasks table for "<usertype>"
And I should see the status of the subscription "<appName>" "<subscribeAPI>" approval task as "READY"
And I click Assign To Me button for "<appName>" "<subscribeAPI>" Subscription Details row for "<usertype>"
When I click on Subscription Details drop box for "<appName>" "<subscribeAPI>" row for "<usertype>"
And I select "<olderTier>" for "<appName>" "<subscribeAPI>" Subscription Details row for "<usertype>"
And I should see the status of the subscription "<appName>" "<subscribeAPI>" approval task as "RESERVED" 
And I click on Start button for "<appName>" "<subscribeAPI>" Subscription Details row for "<usertype>"
And I select "<newTier>" for "<appName>" "<subscribeAPI>" Subscription Details row for "<usertype>"
Then I should see the status of the subscription "<appName>" "<subscribeAPI>" approval task as "IN_PROGRESS" 
And I select "<action>" and click complete button for "<appName>" "<subscribeAPI>" Subscription Details row for "<usertype>"
Then I should see Enter aprrove/reject reasons pop up header as "Enter approve/reject reasons"
When I enter aprrove/reject reason as "Approve"
And click aprrove/reject reason ok button
Then I should not see created subscription with "<appName>" and "<subscribeAPI>" in the Approval Tasks table
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
Then I should see the API "<subscribeAPI>" status as "<status>" and Subscription Tier as "<newTier>"
Examples:
|usertypeAdmin|usertypeSP|usertype |apiPublisherOne|appName     |action |subscribeAPI   |olderTier|newTier  |status|apiname   |version|
|AdminUser    |APPCREATE |PUBLISHER|apipublisherOne|AuXTestAPPE |Approve|WeatherAPI - v1|Large    |Unlimited|ACTIVE|WeatherAPI|v1     |

@InternalGatewayTypeOne 
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
Then I should see created subscription with "<appName>" and "<subscribeAPI>" at the top of the Approval Tasks table for "<usertypeAdmin>"
And I should see the status of the subscription "<appName>" "<subscribeAPI>" approval task as "READY"
And I click Assign To Me button for "<appName>" "<subscribeAPI>" Subscription Details row for "<usertypeAdmin>"
And I should see the status of the subscription "<appName>" "<subscribeAPI>" approval task as "RESERVED" 
And I click on Start button for "<appName>" "<subscribeAPI>" Subscription Details row for "<usertypeAdmin>"
Then I should see the status of the subscription "<appName>" "<subscribeAPI>" approval task as "IN_PROGRESS" 
And I select "<action>" and click complete button for "<appName>" "<subscribeAPI>" Subscription Details row for "<usertypeAdmin>"
Then I should see Enter aprrove/reject reasons pop up header as "Enter approve/reject reasons"
When I enter aprrove/reject reason as "Approve"
And click aprrove/reject reason ok button
Then I should not see created subscription with "<appName>" and "<subscribeAPI>" in the Approval Tasks table
Given I am in hubmanager
Then I should see the apimanager Manager page header as "Manager"
When I enter apimanager Manager page "<apiPublisherOne>" username credentials
And I click on apimanager Manager page login button
Then I should see the apimanager Manager Home page header as "Home"
And I should see apimanager Manager Home Billing Workflow Blacklist Whitelist tabs
When I click on apimanager Manager page Workflow tab
Then I should see apimanager Manager Approval Tasks page header as "Approval Tasks"
And I click on subscriptions creation under tasks
Then I should see created subscription with "<appName>" and "<subscribeAPI>" at the top of the Approval Tasks table for "<usertype>"
And I should see the status of the subscription "<appName>" "<subscribeAPI>" approval task as "READY"
And I click Assign To Me button for "<appName>" "<subscribeAPI>" Subscription Details row for "<usertype>"
And I should see the status of the subscription "<appName>" "<subscribeAPI>" approval task as "RESERVED" 
And I click on Start button for "<appName>" "<subscribeAPI>" Subscription Details row for "<usertype>"
Then I should see the status of the subscription "<appName>" "<subscribeAPI>" approval task as "IN_PROGRESS" 
And I select "<action>" and click complete button for "<appName>" "<subscribeAPI>" Subscription Details row for "<usertype>"
Then I should see Enter aprrove/reject reasons pop up header as "Enter approve/reject reasons"
When I enter aprrove/reject reason as "Reject"
And click aprrove/reject reason ok button
Then I should not see created subscription with "<appName>" and "<subscribeAPI>" in the Approval Tasks table
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
Then I should see the API "<subscribeAPI>" status as "<status>" and Subscription Tier as "<tier>"
Examples:
|usertypeAdmin|usertypeSP|usertype |apiPublisherOne|appName     |actionAdmin|actionPub |subscribeAPI   |tier   |status  |apiname   |version|
|AdminUser    |APPCREATE |PUBLISHER|apipublisherOne|AuXTestAPPB |Approve    |Reject    |WeatherAPI - v1|Default|REJECTED|WeatherAPI|v1     |

@InternalGatewayTypeOne 
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
Given I am in apimanager
When I click on apimanager login
Then I should see the apimanager "Login" pop up
When I enter apimanager Login username and password for "<usertypeSP>" 
And I click on apimanager Login pop up login button
Then I should see apimanager "<usertypeSP>" at the top right corner of the page
And I click on apimanager APIs module
Then I should see the apimanager APIs page header as "APIs"
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
Then I should see created subscription with "<appName>" and "<subscribeAPI>" at the top of the Approval Tasks table for "<usertypeAdmin>"
And I should see the status of the subscription "<appName>" "<subscribeAPI>" approval task as "READY"
And I click Assign To Me button for "<appName>" "<subscribeAPI>" Subscription Details row for "<usertypeAdmin>"
And I should see the status of the subscription "<appName>" "<subscribeAPI>" approval task as "RESERVED" 
And I click on Start button for "<appName>" "<subscribeAPI>" Subscription Details row for "<usertypeAdmin>"
Then I should see the status of the subscription "<appName>" "<subscribeAPI>" approval task as "IN_PROGRESS" 
And I select "<action>" and click complete button for "<appName>" "<subscribeAPI>" Subscription Details row for "<usertypeAdmin>"
Then I should see Enter aprrove/reject reasons pop up header as "Enter approve/reject reasons"
When I enter aprrove/reject reason as "Approve"
And click aprrove/reject reason ok button
Then I should not see created subscription with "<appName>" and "<subscribeAPI>" in the Approval Tasks table
Given I am in hubmanager
Then I should see the apimanager Manager page header as "Manager"
When I enter apimanager Manager page "<apiPublisherOne>" username credentials
And I click on apimanager Manager page login button
Then I should see the apimanager Manager Home page header as "Home"
And I should see apimanager Manager Home Billing Workflow Blacklist Whitelist tabs
When I click on apimanager Manager page Workflow tab
Then I should see apimanager Manager Approval Tasks page header as "Approval Tasks"
And I click on subscriptions creation under tasks
Then I should see created subscription with "<appName>" and "<subscribeAPI>" at the top of the Approval Tasks table for "<usertype>"
And I should see the status of the subscription "<appName>" "<subscribeAPI>" approval task as "READY"
And I click Assign To Me button for "<appName>" "<subscribeAPI>" Subscription Details row for "<usertype>"
And I should see the status of the subscription "<appName>" "<subscribeAPI>" approval task as "RESERVED" 
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
Then I should not see created subscription with "<appName>" and "<subscribeAPI>" in the Approval Tasks table
Examples:
|usertypeAdmin|usertypeSP|usertype |apiPublisherOne|appName     |actionAdmin|subscribeAPI   |tier   |status  |apiname   |version|
|AdminUser    |APPCREATE |PUBLISHER|apipublisherOne|AuXTestAPPB |Approve    |YahooAPI - v1  |Default|ON_HOLD |YahooAPI  |v1     |

@InternalGatewayTypeOne 
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
Then I should see the apimanager APIs page header as "APIs"
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
Then I should see created subscription with "<appName>" and "<subscribeAPI>" at the top of the Approval Tasks table for "<usertypeAdmin>"
And I should see the status of the subscription "<appName>" "<subscribeAPI>" approval task as "READY"
And I click Assign To Me button for "<appName>" "<subscribeAPI>" Subscription Details row for "<usertypeAdmin>"
And I should see the status of the subscription "<appName>" "<subscribeAPI>" approval task as "RESERVED" 
When I click on Subscription Details drop box for "<appName>" "<subscribeAPI>" row for "<usertypeAdmin>"
And I select "<tiers>" for "<appName>" "<subscribeAPI>" Subscription Details row for "<usertypeAdmin>"
And I click on Start button for "<appName>" "<subscribeAPI>" Subscription Details row for "<usertypeAdmin>"
Then I should see the status of the subscription "<appName>" "<subscribeAPI>" approval task as "IN_PROGRESS" 
And I select "<action>" and click complete button for "<appName>" "<subscribeAPI>" Subscription Details row for "<usertypeAdmin>"
Then I should see Enter aprrove/reject reasons pop up header as "Enter approve/reject reasons"
When I enter aprrove/reject reason as "Approve"
And click aprrove/reject reason ok button
Then I should not see created subscription with "<appName>" and "<subscribeAPI>" in the Approval Tasks table
Given I am in hubmanager
Then I should see the apimanager Manager page header as "Manager"
When I enter apimanager Manager page "<apiPublisherOne>" username credentials
And I click on apimanager Manager page login button
Then I should see the apimanager Manager Home page header as "Home"
And I should see apimanager Manager Home Billing Workflow Blacklist Whitelist tabs
When I click on apimanager Manager page Workflow tab
Then I should see apimanager Manager Approval Tasks page header as "Approval Tasks"
And I click on subscriptions creation under tasks
Then I should see created subscription with "<appName>" and "<subscribeAPI>" at the top of the Approval Tasks table for "<usertype>"
And I should see the status of the subscription "<appName>" "<subscribeAPI>" approval task as "READY"
And I click Assign To Me button for "<appName>" "<subscribeAPI>" Subscription Details row for "<usertype>"
And I should see the status of the subscription "<appName>" "<subscribeAPI>" approval task as "RESERVED" 
And I click on Start button for "<appName>" "<subscribeAPI>" Subscription Details row for "<usertype>"
Then I should see the status of the subscription "<appName>" "<subscribeAPI>" approval task as "IN_PROGRESS" 
And I select "<action>" and click complete button for "<appName>" "<subscribeAPI>" Subscription Details row for "<usertype>"
Then I should see Enter aprrove/reject reasons pop up header as "Enter approve/reject reasons"
When I enter aprrove/reject reason as "Approve"
And click aprrove/reject reason ok button
Then I should not see created subscription with "<appName>" and "<subscribeAPI>" in the Approval Tasks table
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
Then I should see the API "<subscribeAPI>" status as "<status>" and Subscription Tier as "<tier>"
Examples:
|usertypeAdmin|usertypeSP|usertype |apiPublisherOne|appName     |action |subscribeAPI   |tier   |status|apiname |version|
|AdminUser    |APPCREATE |PUBLISHER|apipublisherOne|AuXTestAPPE |Approve|YahooAPI - v1  |Bronze |ACTIVE|YahooAPI|v1     |
