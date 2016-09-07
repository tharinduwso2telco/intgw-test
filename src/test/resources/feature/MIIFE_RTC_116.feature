Feature: Publisher Subscription table data validation using given credentials

  @Smoke
  Scenario Outline: Check if self registered user can access only allowed modules on manage module
    Given I am in apipublisher
    Then I should see the apipublisher page "API Publisher" label
    When I enter the credentials to login "<usertype>"
    And I click on apipublisher login button
    Then I should see the apipublisher "All APIs" label
    And I click on MyApis Subscriptions link
    Then I should see the apipublisher_subscription page "Subscriptions" label
    And I validate the table content for "<usertype>","<appname>" and "<api>"

    Examples:
      | usertype   | userName | password | appname      | api                        |
      | AGGRIGATOR | admin    | admin    | admin_smsApp | smsmessaging-v1location-v2 |