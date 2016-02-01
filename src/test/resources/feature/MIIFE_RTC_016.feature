Feature: Validate token expiration

@Smoke
Scenario Outline: check if the token expires as expected
#prerequisites: #13 should be completed
Given I am in apimanager Subscriptions page
When I enter token validity of production as "<validity>"
And I click generate under apimanager Subscriptions page production
Then I should see consumer key and consumer secret of production
When I enter token validity of sandbox as "<validity>"
And I click generate under apimanager Subscriptions page sandbox
Then I should see consumer key and consumer secret of sandbox
# J validate expire

Examples:
|validity|
|1       |