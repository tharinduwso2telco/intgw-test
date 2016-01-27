Feature: Check if tokens can be regenerated

@Smoke
Scenario Outline: Check if tokens can be regenerated
#prerequisites:#14 should be completed
Given I am in apimanager Subscriptions page
When I enter token validity of production as "<validity>"
And I click regenerate under apimanager Subscriptions page production
Then I should see "<validity>" as Token Validity of production
When I enter token validity of sandbox as "<validity>"
And I click regenerate under apimanager Subscriptions page sandbox
Then I should see "<validity>" as Token Validity of sandbox

Examples:
|validity|
|3600    |