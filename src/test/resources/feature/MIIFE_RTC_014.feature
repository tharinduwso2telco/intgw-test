Feature: Check if tokens can be generated

@Smoke
Scenario Outline: Check if tokens can be generated
#prerequisites: #13 should be completed
Given I am in apimanager
When I click on apimanager login
Then I should see the apimanager "Login" pop up
When I enter apimanager Login username and password for "<usertype>" 
And I click on apimanager Login pop up login button
Then I should see apimanager "<usertype>" at the top right corner of the page
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
Examples:
|validity|usertype     |
|-1      |SUBSCRIBERAPP|

