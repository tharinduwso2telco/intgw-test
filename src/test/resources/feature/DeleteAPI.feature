Feature: Delete APIs 

@InternalGateway @ExternalGateway
Scenario Outline: HUB-216 : Hub administrator deletes an API in created state
Given I am in apipublisher
When I provide apipublisher username and password for "<usertype>"
And I click on apipublisher login button
Then I should see apipublisher username "<usertype>" at the top right corner of the page
Then I search API with "<apiName>"
Then I should see API "<apiName>" "<version>" with "CREATED" state
Then I should see API "<apiName>" "<version>" with "<numOfSubscriptions>" Subscriptions
Then I delete API "<apiName>" "<version>"
Examples:
| usertype|apiName   |version |numOfSubscriptions|
|PUBLISHER|TestProd  |v1      |0 Users           |


@InternalGateway @ExternalGateway
Scenario Outline: HUB-217 : Hub administrator deletes an API in published state without subscriptions
Given I am in apipublisher
When I provide apipublisher username and password for "<usertype>"
And I click on apipublisher login button
Then I should see apipublisher username "<usertype>" at the top right corner of the page
Then I search API with "<apiName>"
Then I should see API "<apiName>" "<version>" with "PUBLISHED" state
Then I should see API "<apiName>" "<version>" with "<numOfSubscriptions>" Subscriptions
Then I delete API "<apiName>" "<version>"
Examples:
| usertype|apiName      |version |numOfSubscriptions|
|PUBLISHER|NameProdAPI  |v1      |0 Users           |


@InternalGateway @ExternalGateway
Scenario Outline: HUB-218 : Hub administrator deletes an API in published state with subscriptions
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
When I click on Applications dropdown
Then I should see "<appName>" Application for "<usertypeSP>"
When I select "<appName>" for "<usertypeSP>"
And I click apimanager "<apiName>" API page subscribe button
Then I should see "Subscription Awaiting Approval" on Subscription Successful pop up
And I click Go to My Subscription button
Given I am in apipublisher
When I provide apipublisher username and password for "<usertype>"
And I click on apipublisher login button
Then I should see apipublisher username "<usertype>" at the top right corner of the page
Then I search API with "<apiName>"
Then I should see API "<apiName>" "<version>" with "PUBLISHED" state
Then I should see API "<apiName>" "<version>" with "<numOfSubscriptions>" Subscriptions
Then I delete API "<apiName>" "<version>"
Then I should see the apipublisher error popup with "API Publisher - Error"
And I click on apipublisher error popup ok button
Examples:
| usertype|usertypeSP|apiName      |version |numOfSubscriptions|appName     |
|PUBLISHER|APPCREATE |NameTestAPI  |v1      |1 User            |AuXTestAPPA |


@InternalGateway @ExternalGateway
Scenario Outline: HUB-219 : Hub administrator deletes a new version of an API in created state
Given I am in apipublisher
When I provide apipublisher username and password for "<usertype>"
And I click on apipublisher login button
Then I should see apipublisher username "<usertype>" at the top right corner of the page
Then I search API with "<apiName>"
Then I should see API "<apiName>" "<version>" with "CREATED" state
Then I should see API "<apiName>" "<version>" with "<numOfSubscriptions>" Subscriptions
Then I delete API "<apiName>" "<version>"
Examples:
| usertype|apiName      |version |numOfSubscriptions|
|PUBLISHER|NameProdAPI  |v2      |0 Users           |


@InternalGateway @ExternalGateway
Scenario Outline: HUB-220 : Hub administrator deletes a new version of API in published state without subscriptions
Given I am in apipublisher
When I provide apipublisher username and password for "<usertype>"
And I click on apipublisher login button
Then I should see apipublisher username "<usertype>" at the top right corner of the page
Then I search API with "<apiName>"
Then I should see API "<apiName>" "<version>" with "PUBLISHED" state
Then I should see API "<apiName>" "<version>" with "<numOfSubscriptions>" Subscriptions
Then I delete API "<apiName>" "<version>"
Examples:
| usertype|apiName      |version |numOfSubscriptions|
|PUBLISHER|NameTestAPI  |v2      |0 Users           |


@InternalGateway @ExternalGateway
Scenario Outline: HUB-221 : Hub administrator deletes a API version in published state with subscriptions
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
When I click on Applications dropdown
Then I should see "<appName>" Application for "<usertypeSP>"
When I select "<appName>" for "<usertypeSP>"
And I click apimanager "<apiName>" API page subscribe button
Then I should see "Subscription Awaiting Approval" on Subscription Successful pop up
And I click Go to My Subscription button
Given I am in apipublisher
When I provide apipublisher username and password for "<usertype>"
And I click on apipublisher login button
Then I should see apipublisher username "<usertype>" at the top right corner of the page
Then I search API with "<apiName>"
Then I should see API "<apiName>" "<version>" with "PUBLISHED" state
Then I should see API "<apiName>" "<version>" with "<numOfSubscriptions>" Subscriptions
Then I delete API "<apiName>" "<version>"
Then I should see the apipublisher error popup with "API Publisher - Error"
And I click on apipublisher error popup ok button
Examples:
| usertype|usertypeSP|apiName      |version |numOfSubscriptions|appName     |
|PUBLISHER|APPCREATE |TestSand     |v2      |1 User            |AuXTestAPPA |