Feature: Check the payment max level

  @Smoke
  Scenario Outline: Check if the payments are restricted to the max level set
    Given I am in apimanager
    When I click on apimanager login
    Then I should see the apimanager "Login" pop up
    When I enter apimanager Login username and password for "<usertype>"
    And I click on apimanager Login pop up login button
    Then I should see apimanager "<usertype>" at the top right corner of the page
    When I click on apimanager Sandbox
    Then I should see the Login in apimanager Sandbox page header as "Login"
    When I enter apimanager Sandbox page username and password for "<usertype>"
    And I click on apimanager Sandbox page login button
    Then I should see the apimanager sandbox index page header as "Welcome"
    When I click on numbers dropdown and select manage numbers
    Then I should see the manage numbers page header as "Manage Numbers"
    When I clear existing "<number>" from the list
    And I click on add new button in manage numbers page
    And I enter "<number>" as number
    And I enter "<description>" as number description
    And I enter "<balance>" as balance
    And I click on save button in under actions column
    Then I should see the "<number>" as added number in the numbers table
    When I click on API dropdown and select payment
    Then I should see payment page header as "Payment Parameters"
    When I select "<transactionStatus>" as transaction status
    And I enter "<maxPaymentAmount>" as max payment amount
    And I click save button in payment parameters page
    And I enter "<number>" as end user id
    And I select "<transactionOperationStatus>" as transaction operation status
    And I enter "<referenceCode>" as reference code
    And I enter "<requestDescription>" as the request description
    And I enter "<currency>" as currency
    And I enter "<amount>" as request amount
    And I enter request client correlator
    And I enter "<notifyURL>" as notify URL
    And I enter "<purchaseCategoryCode>" as purchase category code
    And I enter "<channel>" as channel
    And I enter "<taxAmount>" as tax amount
    And I click on send request button in payment parameters page
    And I get the error response payload
    And I validate the error response payload containing "The %1 operator charging limit for this user has been exceeded"

    Examples:
      | usertype | number      | description | balance | transactionStatus | transactionOperationStatus | referenceCode | requestDescription  | currency | amount | notifyURL                                        | purchaseCategoryCode | channel | taxAmount | maxPaymentAmount |
      | QA17LOG  | 94123123123 | testAuxenta | 1000.00 | Charged           | Charged                    | REF-12345     | Alien Invaders Game | USD      | 10.0   | http://localhost:8080/mifeapiserver/callback.jsp | Game                 | SMS     | 0.15      | 10.00            |
