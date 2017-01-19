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
|PUBLISHER|TestAPI   |v1      |0 Users           |


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
|PUBLISHER|AuxProdAPI   |v1      |0 Users           |


@InternalGateway @ExternalGateway
Scenario Outline: HUB-218 : Hub administrator deletes an API in published state with subscriptions
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
| usertype|apiName      |version |numOfSubscriptions|
|PUBLISHER|AuxTestAPI   |v1      |1 User            |


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
|PUBLISHER|TestAPI      |v2      |0 Users           |


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
|PUBLISHER|ProdAPI      |v2      |0 Users           |


@InternalGateway @ExternalGateway
Scenario Outline: HUB-221 : Hub administrator deletes a API version in published state with subscriptions
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
| usertype|apiName      |version |numOfSubscriptions|
|PUBLISHER|AuxTestAPI   |v2      |1 User            |