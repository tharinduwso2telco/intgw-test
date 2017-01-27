Feature: Validate Key Management for Applications

### Data Preparation for Key Management Scenarios ###
@BeforeTest @InternalGateway @ExternalGateway 
Scenario Outline: User subscribes to Custom API
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
|APPCREATE |APIProdTestA |v1      |AuXTestAPPB   |
|APPCREATE |APIProdTestB |v1      |AuXTestAPPC   |
|APPCREATE |APIProdTestB |v2      |AuXTestAPPD   |
|APPCREATE |APIProdTestB |v1      |AuXTestAPPE   |


### Key Management Scenarios ###
@InternalGateway @ExternalGateway 
Scenario Outline: HUB-141 : User generates production keys for an application that has single subscription
Given I am in apimanager
When I click on apimanager login
Then I should see the apimanager "Login" pop up
When I enter apimanager Login username and password for "<usertype>" 
And I click on apimanager Login pop up login button
Then I should see apimanager "<usertype>" at the top right corner of the page
When I click on apimanager My Applications
Then I should see the apimanager Application page header as "Applications"
And I should see "One" Subscription for "<appName>"
When I click on apimanager Application "<appName>"
Then I should see the added Application name as "<appName>" and the "<status>" as status
When I click Production Keys tab
Then I click generate under apimanager Subscriptions page production
Then I should see consumer Key of production
And I should see consumer Secret of production
And I should see access token of production
Then I should see "<validity>" as Token Validity of production
Examples:
|usertype |appName    |status  |validity|
|APPCREATE|AuXTestAPPA|APPROVED|3600    |

@InternalGateway @ExternalGateway 
Scenario Outline: HUB-142 : User generates production keys for an application that has multiple subscriptions
Given I am in apimanager
When I click on apimanager login
Then I should see the apimanager "Login" pop up
When I enter apimanager Login username and password for "<usertype>" 
And I click on apimanager Login pop up login button
Then I should see apimanager "<usertype>" at the top right corner of the page
When I click on apimanager My Applications
Then I should see the apimanager Application page header as "Applications"
And I should see "more than one" Subscription for "<appName>"
When I click on apimanager Application "<appName>"
Then I should see the added Application name as "<appName>" and the "<status>" as status
When I click Production Keys tab
And I click generate under apimanager Subscriptions page production
Then I should see consumer Key of production
And I should see consumer Secret of production
And I should see access token of production
Then I should see "<validity>" as Token Validity of production
Examples:
|usertype |appName    |status  |validity |
|APPCREATE|AuXTestAPPB|APPROVED|3600     |

@InternalGateway @ExternalGateway 
Scenario Outline: HUB-143 : User generates production keys for app with multiple subscriptions of older and newer API versions
Given I am in apimanager
When I click on apimanager login
Then I should see the apimanager "Login" pop up
When I enter apimanager Login username and password for "<usertype>" 
And I click on apimanager Login pop up login button
Then I should see apimanager "<usertype>" at the top right corner of the page
When I click on apimanager My Applications
Then I should see the apimanager Application page header as "Applications"
And I should see "more than one" Subscription for "<appName>"
When I click on apimanager Application "<appName>"
Then I should see the added Application name as "<appName>" and the "<status>" as status
When I click on Application "<appName>" "Subscriptions" tab
Then I should see the "<olderversion>" and "<apiName>" under Subscribed APIs
And I should see "<newerVersion>" of the same "<apiName>" is listed under Subscribed APIs
When I click Production Keys tab
And I click generate under apimanager Subscriptions page production
Then I should see consumer Key of production
And I should see consumer Secret of production
And I should see access token of production
Then I should see "<validity>" as Token Validity of production
Examples:
|usertype |appName    |status  |apiName     |olderversion|newerVersion|validity |
|APPCREATE|AuXTestAPPD|APPROVED|APIProdTestB|v1          |v2          |3600     |

@InternalGateway @ExternalGateway 
Scenario Outline: HUB-144 : User generates production keys for app with customized expiration time
Given I am in apimanager
When I click on apimanager login
Then I should see the apimanager "Login" pop up
When I enter apimanager Login username and password for "<usertype>" 
And I click on apimanager Login pop up login button
Then I should see apimanager "<usertype>" at the top right corner of the page
When I click on apimanager My Applications
Then I should see the apimanager Application page header as "Applications"
And I should see "One" Subscription for "<appName>"
When I click on apimanager Application "<appName>"
Then I should see the added Application name as "<appName>" and the "<status>" as status
When I click Production Keys tab
When I enter token validity of production as "<validity>"
Then I click generate under apimanager Subscriptions page production
Then I should see consumer Key of production
And I should see consumer Secret of production
And I should see access token of production
Then I should see "<validity>" as Token Validity of production
Examples:
|usertype |appName    |status  |validity|
|APPCREATE|AuXTestAPPC|APPROVED|5000    |

@InternalGateway @ExternalGateway 
Scenario Outline: HUB-145 : User generates production keys for an application with infinite expiration time
Given I am in apimanager
When I click on apimanager login
Then I should see the apimanager "Login" pop up
When I enter apimanager Login username and password for "<usertype>" 
And I click on apimanager Login pop up login button
Then I should see apimanager "<usertype>" at the top right corner of the page
When I click on apimanager My Applications
Then I should see the apimanager Application page header as "Applications"
And I should see "One" Subscription for "<appName>"
When I click on apimanager Application "<appName>"
Then I should see the added Application name as "<appName>" and the "<status>" as status
When I click Production Keys tab
When I enter token validity of production as "<validity>"
Then I click generate under apimanager Subscriptions page production
Then I should see consumer Key of production
And I should see consumer Secret of production
And I should see access token of production
Then I should see "<validity>" as Token Validity of production
Examples:
|usertype |appName    |status  |validity|
|APPCREATE|AuXTestAPPE|APPROVED|-1      |

