Feature: Create API Versions

@InternalGateway @ExternalGateway 
Scenario Outline: HUB-214 : Hub administrator creates a new version of custom api
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
Examples:
| usertype|apiName       |olderVersion|newVersion|
|PUBLISHER|NameProdAPI   |v1          |v2        |

@InternalGateway @ExternalGateway
Scenario Outline: HUB-215 : Hub administrator publishes a new version of custom api
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
When I click on the apimanager "<apiName>" "<newVersion>" api
Then I should see the apimanager APIs "<apiName>" status as "Published"
Examples:
| usertype|usertypeSP|apiName       |olderVersion|newVersion|
|PUBLISHER|APPCREATE |NameTestAPI   |v1          |v2        |
|PUBLISHER|APPCREATE |TestSand      |v1          |v2        |