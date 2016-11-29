Feature: Operator Admin Approves created Subscriptions

@HUB-347 @pamodaM
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
When I click on Application Details drop box for "<appname>" row for "<usertype>"
And I select "<tiers>" for "<appname>" Application Details row for "<usertype>"
And I should see the status of the application "<appname>" approval task as "READY" 
And I click Assign To Me button for "<appname>" Application Details row for "<usertype>"
Then I should see the status of the application "<appname>" approval task as "RESERVED"
And I should see the selected throttling layer as "<tiers>" for "<appname>" Application
Examples:
|usertype |appname |tiers    |
|AdminUser|AppSix  |Unlimited|