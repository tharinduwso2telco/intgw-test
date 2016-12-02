Feature: Create and Publish an API

@HUB-195
Scenario Outline: HUB-195 : Hub administrator creates custom API for production
Given I am in apipublisher
When I provide apipublisher username and password for "<usertype>"
And I click on apipublisher login button
Then I should see apipublisher username "<usertype>" at the top right corner of the page
When I search existing API "<apiName>" "<version>" and delete it
When I click on apipublisher Add link
And I click Design new API radio button
And I click Start Creating button
And I provide apipublisher Design name as "<apiName>"
And I provide apipublisher Design Context as "TestProd"
And I provide apipublisher Design Version as "v1"
And I provide apipublisher Design Provide URL pattern as "/aux/wso2tel/"
And I click on apipublisher Design "Get" checkbox
And I click on Resource Add button
And I click on apipublisher Design implement button
And I click on Manage API link
When I provide apipublisher Implement endpoint type as "HTTP/REST Endpoint"
And I provide apipublisher Implement production endpoint as "<prodEndpoint>"
And I click on apipublisher apipublisher manage button
And I select "<tier>" as apipublisher Manage tier availability
And I click on apipublisher Manage save button
When I click on Go to Overview
Then I should see the status as "CREATED"

Examples:
| usertype|apiName   		 |version|prodEndpoint   |roleType		   |tier|
|PUBLISHER|TestProd     |v1     |auxProd		 |Internal/publisher |Unlimited,Default,Requestbased,Silver,Subscription,Gold,Premium,Bronze|

@HUB-196
Scenario Outline: HUB-196 : Hub administrator creates custom API for test purposes
Given I am in apipublisher
When I provide apipublisher username and password for "<usertype>"
And I click on apipublisher login button
Then I should see apipublisher username "<usertype>" at the top right corner of the page
When I search existing API "<apiName>" "<version>" and delete it
When I click on apipublisher Add link
And I click Design new API radio button
And I click Start Creating button
And I provide apipublisher Design name as "<apiName>"
And I provide apipublisher Design Context as "TestAPI"
And I provide apipublisher Design Version as "v1"
And I provide apipublisher Design Provide URL pattern as "/aux/wso2tel/"
And I click on apipublisher Design "Get" checkbox
And I click on Resource Add button
And I click on apipublisher Design implement button
And I click on Manage API link
When I provide apipublisher Implement endpoint type as "HTTP/REST Endpoint"
And I provide apipublisher Implement sandbox endpoint as "<sandEndpoint>"
And I click on apipublisher apipublisher manage button
And I select "<tier>" as apipublisher Manage tier availability
And I click on apipublisher Manage save button
When I click on Go to Overview
Then I should see the status as "CREATED"

Examples:
| usertype|apiName   |sandEndpoint |roleType		   |tier|
|PUBLISHER|AuxTestAPI|auxSand	   |Internal/publisher |Unlimited,Default,Requestbased,Silver,Subscription,Gold,Premium,Bronze|

@HUB-197
Scenario Outline: HUB-197 : Hub administrator directly publishes custom API for production
Given I am in apipublisher
When I provide apipublisher username and password for "<usertype>"
And I click on apipublisher login button
Then I should see apipublisher username "<usertype>" at the top right corner of the page
When I search existing API "<apiName>" "<version>" and delete it
When I click on apipublisher Add link
And I click Design new API radio button
And I click Start Creating button
And I provide apipublisher Design name as "<apiName>"
And I provide apipublisher Design Context as "NameProd"
And I provide apipublisher Design Version as "<version>"
And I provide apipublisher Design Provide URL pattern as "/aux/wso2tel/"
And I click on apipublisher Design "Get" checkbox
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
Then I should see the apimanager APIs page header as "APIs"
When I click on the apimanager "<apiName>" "<version>" api
Then I should see the apimanager APIs "<apiName>" status as "Published"
Examples:
| usertype|usertypeSP|apiName       |version|prodEndpoint |roleType		   |tier|
|PUBLISHER|APPCREATE |NameProdAPI|v1     |auxProd	   |Internal/publisher |Unlimited,Default,Requestbased,Silver,Subscription,Gold,Premium,Bronze|

@HUB-198
Scenario Outline: HUB-198 : Hub administrator directly publishes custom API for testing
Given I am in apipublisher
When I provide apipublisher username and password for "<usertype>"
And I click on apipublisher login button
Then I should see apipublisher username "<usertype>" at the top right corner of the page
When I search existing API "<apiName>" "<version>" and delete it
When I click on apipublisher Add link
And I click Design new API radio button
And I click Start Creating button
And I provide apipublisher Design name as "<apiName>"
And I provide apipublisher Design Context as "NameTest"
And I provide apipublisher Design Version as "<version>"
And I provide apipublisher Design Provide URL pattern as "/aux/wso2tel/"
And I click on apipublisher Design "Get" checkbox
And I click on Resource Add button
And I click on apipublisher Design implement button
And I click on Manage API link
When I provide apipublisher Implement endpoint type as "HTTP/REST Endpoint"
And I provide apipublisher Implement sandbox endpoint as "<sandEndpoint>"
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
Then I should see the apimanager APIs page header as "APIs"
When I click on the apimanager "<apiName>" "<version>" api
Then I should see the apimanager APIs "<apiName>" status as "Published"
Examples:
| usertype|usertypeSP|apiName   |version|sandEndpoint  |roleType		   |tier                                                                  |
|PUBLISHER|APPCREATE |NameTestAPI|v1     |auxSand	   |Internal/publisher |Unlimited,Default,Requestbased,Silver,Subscription,Gold,Premium,Bronze|

@HUB-199
Scenario Outline: HUB-199 : Hub administrator publishes already created custom API
Given I am in apipublisher
When I provide apipublisher username and password for "<usertype>"
And I click on apipublisher login button
Then I should see apipublisher username "<usertype>" at the top right corner of the page
Then I click on apipublisher API "<apiName>" "<version>"
When I click on Lifecycle tab
Then I should see the current state of the api as "CREATED"
And I click on "Require re-subscription when publish the API" check box
And I click on Publish button
Then I should see the current state of the api as "PUBLISHED"
Given I am in apimanager
When I click on apimanager login
Then I should see the apimanager "Login" pop up
When I enter apimanager Login username and password for "<usertypeSP>" 
And I click on apimanager Login pop up login button
Then I should see apimanager "<usertypeSP>" at the top right corner of the page
And I click on apimanager APIs module
Then I should see the apimanager APIs page header as "APIs"
When I click on the apimanager "<apiName>" "<version>" api
Then I should see the apimanager APIs "<apiName>" status as "Published"

Examples:
| usertype|usertypeSP|apiName      |version|
|PUBLISHER|APPCREATE |ProductionAPI|v1     |
