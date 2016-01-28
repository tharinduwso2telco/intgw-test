Feature: Check if tokens can be regenerated

@Smoke
Scenario Outline: Check if tokens can be regenerated
#prerequisites:#14 should be completed
Given I am in apimanager
When I click on apimanager login
Then I should see the apimanager "Login" pop up
When I enter apimanager Login username as "<username>" and password as "<Password>" 
And I click on apimanager Login pop up login button
Then I should see apimanager "<username>" at the top right corner of the page
When I click on apimanager My Subscriptions
Then I should see the apimanager Subscriptions page header as "Subscriptions"
When I enter token validity of production as "<validity>"
And I click regenerate under apimanager Subscriptions page production
Then I should see "<validity>" as Token Validity of production
When I enter token validity of sandbox as "<validity>"
And I click regenerate under apimanager Subscriptions page sandbox
Then I should see "<validity>" as Token Validity of sandbox

Examples:
|validity|username      |Password |
|3600    |AuxTestUser002|1qaz2wsx@|