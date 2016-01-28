Feature: Check if apps are saved as SP in identity server after the token generation and API invocation are completed

@Smoke
Scenario Outline: Check if apps are saved as SP in identity server after the token generation and API invocation are completed
#J need to clarify whether have to include application creation steps here too
Given I am in apimanager
When I click on apimanager login
Then I should see the apimanager "Login" pop up
When I enter apimanager Login username as "<username>" and password as "<Password>" 
And I click on apimanager Login pop up login button
Then I should see apimanager "<username>" at the top right corner of the page
When I click on apimanager Manage 
Then I should see the apimanager Manager page header as "Manager"
When I enter apimanager Manager page admin username credentials
And I click on apimanager Manager page login button
Then I should see the apimanager Manager Home page header as "Home"
And I should see apimanager Manager Home Billing Workflow Blacklist Whitelist tabs
When I click on apimanager Manager page Workflow tab
Then I should see apimanager Manager Approval Tasks page header as "Approval Tasks"
When I click on Application creation link
Then I should see created application "<AppName>" at the top of the Approval Tasks table
When I click on Application Details drop box for "<AppName>" row
And I select "<Application Details>" for "<AppName>" Application Details row
And I click Assign To Me button for "<AppName>" Application Details row
And I click on Start button for "<AppName>" Application Details row
And I select "<Action>" and click complete button for "<AppName>" Application Details row
Then I should see Enter aprrove/reject reasons pop up header as "aprrove/reject reasons"
When I enter aprrove/reject reason as "Approved"
And click aprrove/reject reason ok button
Then I should not see the created application in Approval Tasks table as "<AppName>"
When I click on apimanager Manager admin
And I click on apimanager Manager logout button
Then I should see the apimanager Manager page header as "Manager"
When I enter apimanager Manager page operator username credentials
And I click on apimanager Manager page login button
Then I should see the apimanager Manager Home page header as "Home"
And I should see apimanager Manager Home Billing Workflow
When I click on apimanager Manager page Workflow tab
Then I should see apimanager Manager Approval Tasks page header as "Approval Tasks"
When I click on Application creation link
Then I should see created application "<AppName>" at the top of the Approval Tasks table
When I click on Start button for "<AppName>" Application Details row
And I select "<Action>" and click complete button for "<AppName>" Application Details row
Then I should see Enter aprrove/reject reasons pop up header as "aprrove/reject reasons"
When I enter aprrove/reject reason as "Approved"
And click aprrove/reject reason ok button
Then I should not see the created application in Approval Tasks table as "<AppName>"
When I click on apimanager Manager dialogAdmin
And I click on apimanager Manager logout button
Then I should see the apimanager Manager page header as "Manager"
When I click on close window
And I click on apimanager APIs module
Then I should see the apimanager APIs page header as "APIs"
When I click on the apimanager "<apiName>" api
Then I should see the apimanager APIs "<apiName>" status as "Published"
When I click on Applications dropdown
Then I should see "<AppName>" Application
When I select "<AppName>"
And I select "<operator>"
And I click apimanager "<APIName>" API page subscribe button
Then I should see "Subscription Successful" on Subscription Successful pop up
When I click Go to My Subscription button
Then I should see the apimanager Subscriptions page header as "Subscriptions"
And I should see "<AppName>" under Applications with Subscriptions
When I click on apimanager Manage 
Then I should see the apimanager Manager page header as "Manager"
When I enter apimanager Manager page admin username credentials
And I click on apimanager Manager page login button
Then I should see the apimanager Manager Home page header as "Home"
And I should see apimanager Manager Home Billing Workflow Blacklist Whitelist tabs
When I click on apimanager Manager page Workflow tab
Then I should see Enter aprrove/reject reasons pop up header as "aprrove/reject reasons"
When I click on subscriptions creation under tasks
Then I should see created application "<AppName>" at the top of the Approval Tasks table
When I click Assign To Me button for "<AppName>" Application Details row
And I click on Start button for "<AppName>" Application Details row
And I select "<Action>" and click complete button for "<AppName>" Application Details row
Then I should see Enter aprrove/reject reasons pop up header as "aprrove/reject reasons"
When I enter aprrove/reject reason as "Approved"
And click aprrove/reject reason ok button
Then I should not see the created application in Approval Tasks table as "<AppName>"
When I click on apimanager Manager admin
And I click on apimanager Manager logout button
Then I should see the apimanager Manager page header as "Manager"
When I enter apimanager Manager page operator username credentials
And I click on apimanager Manager page login button
Then I should see the apimanager Manager Home page header as "Home"
And I should see apimanager Manager Home Billing Workflow
When I click on apimanager Manager page Workflow tab
Then I should see apimanager Manager Approval Tasks page header as "Approval Tasks"
When I click on subscriptions creation under tasks
Then I should see created application "<AppName>" at the top of the Approval Tasks table
When I click Assign To Me button for "<AppName>" Application Details row
And I click on Start button for "<AppName>" Application Details row
And I select "<Action>" and click complete button for "<AppName>" Application Details row
Then I should see Enter aprrove/reject reasons pop up header as "aprrove/reject reasons"
When I enter aprrove/reject reason as "Approved"
And click aprrove/reject reason ok button
Then I should not see the created application in Approval Tasks table as "<AppName>"
When I click on apimanager Manager dialogAdmin 
And I click on apimanager Manager logout button
Then I should see the apimanager Manager page header as "Manager"
When I click on close window
Then I am in apimanager
When I click on apimanager My Subscriptions
Then I should see the apimanager Subscriptions page header as "Subscriptions"
When I enter token validity of production as "<validity>"
And I click generate under apimanager Subscriptions page production
Then I should see consumer Key of production
And I should see consumer Secret of production
When I enter token validity of sandbox as "<validity>"
And I click generate under apimanager Subscriptions page sandbox
Then I should see consumer Key of sandbox
And I should see consumer Secret of sandbox
When I close the browser
And I am in ids page
And I enter ids username credentials
And I click on ids sign in
Then I should see the ids Home page header as "WSO2 Identity Server Home"
When I click on ids Main tab
Then I should see ids Main menu "Service Providers" as the first item
When I click on ids Main List link
Then I should see "<AppName>" Application in Service Providers table
When I click on "<AppName>" edit link
Then I should see ids Service providers page header as "Service providers"
When I click on Inbound Authentication Configuration
And I click on OAuth/OpenID Connect Configuration
And I click on OAth client secret show button
Then I should see OAth client key
And I should see OAth client secret
When I click on Local and Outbound Authentication Configuration 
And I select Advanced Configuration
Then I should see Advanced Authentication Configuration for "<AppName>" page
When I click on Add Authentication Step
And I select LOA under Local Authenticators
And I click update
Then I should see ids Service providers page header as "Service providers"
When I click on Inbound Authentication Configuration
And I click on OAuth/OpenID Connect Configuration
And I click edit in Actions 
Then I should see View/Update application settings page header as "View/Update application"
When I click on Code
Then I should see "<Callback URL>" as call back url
When I click on Implicit
And I click on Password 
And I click on Client Credential 
And I click on Refresh Token 
And I click on SAML 
And I click on IWA-NTLM
And I click on View/Update application settings page update
Then I should see Application updated successfully pop up message as "Application updated successfully"


#J cannot delete app
Examples:
| username     |Password |AppName           |Application Details|Action |status|APIName           |operator|validity|Callback URL                                                     |
|AuxLogoutUser |1qaz2wsx@|AuxLogoutUserApp  |Unlimited          |Approve|READY |AuxTestAPI-1.0.0.1|DIALOG  |-1      |https://identity.qa.example.com/playground2/oauth2.jsp?reset=true|