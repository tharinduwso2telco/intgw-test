Feature: Subscription Management for Custom API

# @HUB-1272 and @HUB-1275 have the same steps

### Data Preparation for Subscription Management Scenarios ###
@BeforeTest @InternalGateway @ExternalGateway 
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
|PUBLISHER|APPCREATE |APIProdTestA|v1     |auxProd	   |Internal/publisher |Unlimited,Default,Requestbased,Silver,Subscription,Gold,Premium,Bronze|
|PUBLISHER|APPCREATE |APIProdTestB|v1     |auxProd	   |Internal/publisher |Unlimited,Default,Requestbased,Silver,Subscription,Gold,Premium,Bronze|

@BeforeTest @InternalGateway @ExternalGateway 
Scenario Outline: Create versions of APIs needed for Subscription Management
Given I am in apipublisher
When I provide apipublisher username and password for "<usertype>"
And I click on apipublisher login button
Then I should see apipublisher username "<usertype>" at the top right corner of the page
Then I search API with "<apiName>"
Then I click on apipublisher API "<apiName>" "<olderVersion>"
Then I should see the status as "PUBLISHED"
When I click on create new version button
And I provide "<newVersion>"
And I click on Done button
Then I search API with "<apiName>"
Then I click on apipublisher API "<apiName>" "<newVersion>"
Then I should see the status as "CREATED"
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
Then I should search apimanager API "<apiName>"
When I click on the apimanager "<apiName>" "<newVersion>" api
Then I should see the apimanager APIs "<apiName>" status as "Published"
Examples:
| usertype|usertypeSP|apiName       |olderVersion|newVersion|
|PUBLISHER|APPCREATE |APIProdTestA  |v1          |v2        |
|PUBLISHER|APPCREATE |APIProdTestB  |v1          |v2        |


### Subscription Management for Custom API Scenarios ###
@InternalGateway @ExternalGateway
Scenario Outline: HUB-1272 : User subscribes to Custom API with single operator
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
| usertype |apiName      |version |appName       |
|APPCREATE |APIProdTestA |v1      |AuXTestAPPA   |
|APPCREATE |APIProdTestB |v1      |AuXTestAPPC   |
|APPCREATE |APIProdTestB |v1      |AuXTestAPPD   |

@InternalGateway @ExternalGateway
Scenario Outline: HUB-1274 : User subscribes to a newer version of Custom API with single operator, same application
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
And I should see "<apiName>" of the same "<olderVersion>" is listed under Subscribed APIs
Examples:
| usertype |apiName     |version |appName       |olderVersion |
|APPCREATE |APIProdTestA|v2      |AuXTestAPPA   |v1           |
|APPCREATE |APIProdTestB|v2      |AuXTestAPPD   |v1           |

@InternalGateway @ExternalGateway
Scenario Outline: HUB-1275 : User subscribes to a newer version of Custom API with single operator, different application
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
| usertype |apiName     |version |appName       |
|APPCREATE |APIProdTestA|v2      |AuXTestAPPB   |

@InternalGateway @ExternalGateway
Scenario Outline: HUB-1278 : User unsubscribe Custom API from fresh application
Given I am in apimanager
When I click on apimanager login
Then I should see the apimanager "Login" pop up
When I enter apimanager Login username and password for "<usertype>" 
And I click on apimanager Login pop up login button
Then I should see apimanager "<usertype>" at the top right corner of the page
When I click on apimanager My Applications
Then I should see the apimanager Application page header as "Applications"
When I click on apimanager Application "<appName>"
Then I should see the added Application name as "<appName>" and the "<status>" as status
When I click on Application "<appName>" "Subscriptions" tab
Then I should see the "<apiName>" and "<version>" under Subscribed APIs
When I unsubscribe existing "<apiName>" with "<version>"
Then I should see the confirm delete popup with "Confirm Delete"
And I click on confirm delete popup Yes button
Examples:
| usertype |apiName     |version |appName       |status   |
|APPCREATE |APIProdTestB|v1      |AuXTestAPPC   |APPROVED |

@InternalGateway @ExternalGateway
Scenario Outline: HUB-1279 : User unsubscribe older Custom API from fresh application where both older and new API versions exist
Given I am in apimanager
When I click on apimanager login
Then I should see the apimanager "Login" pop up
When I enter apimanager Login username and password for "<usertype>" 
And I click on apimanager Login pop up login button
Then I should see apimanager "<usertype>" at the top right corner of the page
When I click on apimanager My Applications
Then I should see the apimanager Application page header as "Applications"
When I click on apimanager Application "<appName>"
Then I should see the added Application name as "<appName>" and the "<status>" as status
When I click on Application "<appName>" "Subscriptions" tab
Then I should see the "<apiName>" and "<olderversion>" under Subscribed APIs
And I should see "<apiName>" of the same "<newerVersion>" is listed under Subscribed APIs
When I unsubscribe existing "<apiName>" with "<olderversion>"
Then I should see the confirm delete popup with "Confirm Delete"
And I click on confirm delete popup Yes button
Examples:
| usertype |apiName     |olderversion |newerVersion|appName       |status   |
|APPCREATE |APIProdTestA|v1           |v2          |AuXTestAPPA   |APPROVED |

@InternalGateway @ExternalGateway
Scenario Outline: HUB-1280 : User unsubscribe newer Custom API from fresh application where both older and new API versions exist
Given I am in apimanager
When I click on apimanager login
Then I should see the apimanager "Login" pop up
When I enter apimanager Login username and password for "<usertype>" 
And I click on apimanager Login pop up login button
Then I should see apimanager "<usertype>" at the top right corner of the page
When I click on apimanager My Applications
Then I should see the apimanager Application page header as "Applications"
When I click on apimanager Application "<appName>"
Then I should see the added Application name as "<appName>" and the "<status>" as status
When I click on Application "<appName>" "Subscriptions" tab
Then I should see the "<apiName>" and "<olderversion>" under Subscribed APIs
And I should see "<apiName>" of the same "<newerVersion>" is listed under Subscribed APIs
When I unsubscribe existing "<apiName>" with "<newerVersion>"
Then I should see the confirm delete popup with "Confirm Delete"
And I click on confirm delete popup Yes button
Examples:
| usertype |apiName     |olderversion |newerVersion|appName       |status   |
|APPCREATE |APIProdTestB|v1           |v2          |AuXTestAPPD   |APPROVED |

