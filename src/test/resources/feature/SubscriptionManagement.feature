Feature: Subscription Management for Custom API

# @HUB-1272 and @HUB-1275 have the same steps

@HUB-1272
Scenario Outline: HUB-1272 : User subscribes to Custom API with single operator
Given I am in apimanager
When I click on apimanager login
Then I should see the apimanager "Login" pop up
When I enter apimanager Login username and password for "<usertype>" 
And I click on apimanager Login pop up login button
Then I should see apimanager "<usertype>" at the top right corner of the page
And I click on apimanager APIs module
Then I should see the apimanager APIs page header as "APIs"
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
| usertype |apiName |version |appName       |
|APPCREATE |jenkins |v1      |AuxTestAPP1   |

@HUB-1274 
Scenario Outline: HUB-1274 : User subscribes to a newer version of Custom API with single operator, same application
Given I am in apimanager
When I click on apimanager login
Then I should see the apimanager "Login" pop up
When I enter apimanager Login username and password for "<usertype>" 
And I click on apimanager Login pop up login button
Then I should see apimanager "<usertype>" at the top right corner of the page
And I click on apimanager APIs module
Then I should see the apimanager APIs page header as "APIs"
When I click on the apimanager "<apiName>" "<version>" api
Then I should see the apimanager APIs "<apiName>" status as "Published"
When I click on Applications dropdown
Then I should see "<appName>" Application for "<usertype>"
When I select "<appName>" for "<usertype>"
And I click apimanager "<apiName>" API page subscribe button
Then I should see "Subscription Awaiting Approval" on Subscription Successful pop up
When I click Go to My Subscription button
Then I should see the apimanager Application "<appName>" Subscriptions page header as "Subscriptions"
Then I should see the "<version>" and "<apiName>" under Subscribed APIs
And I should see "<olderVersion>" of the same "<apiName>" is listed under Subscribed APIs
Examples:
| usertype |apiName |version |appName       |olderVersion |
|APPCREATE |jenkins |v2      |AuxTestAPP1   |v1           |

@HUB-1275 
Scenario Outline: HUB-1275 : User subscribes to a newer version of Custom API with single operator, different application
Given I am in apimanager
When I click on apimanager login
Then I should see the apimanager "Login" pop up
When I enter apimanager Login username and password for "<usertype>" 
And I click on apimanager Login pop up login button
Then I should see apimanager "<usertype>" at the top right corner of the page
And I click on apimanager APIs module
Then I should see the apimanager APIs page header as "APIs"
When I click on the apimanager "<apiName>" "<version>" api
Then I should see the apimanager APIs "<apiName>" status as "Published"
When I click on Applications dropdown
Then I should see "<appName>" Application for "<usertype>"
When I select "<appName>" for "<usertype>"
And I click apimanager "<apiName>" API page subscribe button
Then I should see "Subscription Awaiting Approval" on Subscription Successful pop up
When I click Go to My Subscription button
Then I should see the apimanager Application "<appName>" Subscriptions page header as "Subscriptions"
Then I should see the "<version>" and "<apiName>" under Subscribed APIs
Examples:
| usertype |apiName |version |appName       |
|APPCREATE |jenkins |v2      |AuXTestAPPJ   |

@HUB-1278 
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
Then I should see the "<version>" and "<apiName>" under Subscribed APIs
When I unsubscribe existing "<apiName>" with "<version>"
Then I should see the confirm delete popup with "Confirm Delete"
And I click on confirm delete popup Yes button
Examples:
| usertype |apiName |version |appName       |status   |
|APPCREATE |jenkins |v2      |AuXTestAPPJ   |APPROVED |

@HUB-1279 
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
Then I should see the "<olderversion>" and "<apiName>" under Subscribed APIs
And I should see "<newerVersion>" of the same "<apiName>" is listed under Subscribed APIs
When I unsubscribe existing "<apiName>" with "<olderversion>"
Then I should see the confirm delete popup with "Confirm Delete"
And I click on confirm delete popup Yes button
Examples:
| usertype |apiName |olderversion |newerVersion|appName       |status   |
|APPCREATE |jenkins |v1           |v2          |AuxTestAPP1   |APPROVED |

@HUB-1280
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
Then I should see the "<olderversion>" and "<apiName>" under Subscribed APIs
And I should see "<newerVersion>" of the same "<apiName>" is listed under Subscribed APIs
When I unsubscribe existing "<apiName>" with "<newerVersion>"
Then I should see the confirm delete popup with "Confirm Delete"
And I click on confirm delete popup Yes button
Examples:
| usertype |apiName |olderversion |newerVersion|appName       |status   |
|APPCREATE |jenkins |v1           |v2          |AuxTestAPP1   |APPROVED |

