Feature: Validate token regeneration

@Smoke
Scenario Outline: Check if tokens can be regenerated
#prerequisites:#14 should be completed
Given I am in apimanager
When I click on apimanager login
Then I should see the apimanager "Login" pop up
When I enter apimanager Login username and password for "<usertype>" 
And I click on apimanager Login pop up login button
Then I should see apimanager "<usertype>" at the top right corner of the page
When I click on apimanager My Subscriptions
Then I should see the apimanager Subscriptions page header as "Subscriptions"
When I select created application "<appName>" from the dropdown for "<usertype>"
And I should see the excisting Access Token of Production
And I should see the excisting Access Token of Sandbox
When I enter token validity of production as "<validity>"
And I click regenerate under apimanager Subscriptions page production
Then I should see "<validity>" as Token Validity of production
And I should see the regenerated Access Token of Production
And I should see the regenerated Access Token of production is different from the previous Access Token of production
When I enter token validity of sandbox as "<validity>"
And I click regenerate under apimanager Subscriptions page sandbox
Then I should see "<validity>" as Token Validity of sandbox
And I should see the regenerated Access Token of Sandbox
And I should see the regenerated Access Token of sandbox is different from the previous Access Token of sandbox



Examples:
|validity|usertype     |appName|
|3600    |SUBSCRIBERAPP|AuxTestingAppRTC_011|