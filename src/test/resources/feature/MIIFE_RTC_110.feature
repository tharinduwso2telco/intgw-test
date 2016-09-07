Feature: Validate report access for each user

  @Smoke
  Scenario Outline: Check if the user can access only those reports which they have permission
    Given I am in apimanager
    When I click on apimanager login
    Then I should see the apimanager "Login" pop up
    When I enter apimanager Login username and password for "<usertype>"
    And I click on apimanager Login pop up login button
    Then I should see apimanager "<usertype>" at the top right corner of the page
    When I click on apimanager Manage
    Then I should see the apimanager Manager page header as "Manager"
    When I enter apimanager Manager page login username and password for "<usertype>"
    And I click on apimanager Manager page login button
    Then I should see the apimanager Manager Home page header as "Home"
    When I click on apimanager Manager page Billing and Metering tab
    Then I should see Total API Traffic as "Total API Traffic" under apimanager Manager Usage Reports
    And I should see Transaction Log as "Transaction Log" under apimanager Manager Usage Reports
    And I should see Operator API Traffic as "Operator API Traffic" under apimanager Manager Usage Reports
    And I should see Monthly Invoice as "Monthly Invoice" under apimanager Manager Usage Reports
    And I should see Cost Breakdown as "Cost Breakdown" under apimanager Manager Usage Reports
    And I should see API Response Times as "API Response Times" under apimanager Manager Performance Reports
    When I click on apimanager Manager username
    Then I click on apimanager Manager logout button
    When I enter apimanager Manager page login username and password for "<CustomerCareuser>"
    And I click on apimanager Manager page login button
    Then I should see the apimanager Manager Home page header as "Home"
    When I click on apimanager Manager page Billing and Metering tab
    Then I should see Customer care reports as "Customer Care" under apimanager Manager Usage Reports
    When I click on apimanager Manager username
    Then I click on apimanager Manager logout button
    When I enter apimanager Manager page admin username credentials
    And I click on apimanager Manager page login button
    Then I should see the apimanager Manager Home page header as "Home"
    When I click on apimanager Manager page Billing and Metering tab
    Then I should see Total API Traffic as "Total API Traffic" under apimanager Manager Usage Reports
    And I should see Transaction Log as "Transaction Log" under apimanager Manager Usage Reports
    And I should see Operator API Traffic as "Operator API Traffic" under apimanager Manager Usage Reports
    And I should see Monthly Invoice as "Monthly Invoice" under apimanager Manager Usage Reports
    And I should see Revenue Breakdown as "Revenue Breakdown" under apimanager Manager Usage Reports
    And I should see Customer Care as "Customer Care" under apimanager Manager Usage Reports
    And I should see API Response Times as "API Response Times" under apimanager Manager Performance Reports
    And I should see Performance Error Rates as "Performance Error Rates" under apimanager Manager Performance Reports
    And I should see TPS Summary as "TPS Summary" under apimanager Manager Performance Reports
    When I click on apimanager Manager username
    Then I click on apimanager Manager logout button
    When I enter apimanager Manager page operator username credentials
    And I click on apimanager Manager page login button
    Then I should see the apimanager Manager Home page header as "Home"
    When I click on apimanager Manager page Billing and Metering tab
    Then I should see Total API Traffic as "Total API Traffic" under apimanager Manager Usage Reports
    And I should see Transaction Log as "Transaction Log" under apimanager Manager Usage Reports
    And I should see Customer Care as "Customer Care" under apimanager Manager Usage Reports
    And I should see API Response Times as "API Response Times" under apimanager Manager Performance Reports
    And I should see Performance Error Rates as "Performance Error Rates" under apimanager Manager Performance Reports
    And I should see TPS Summary as "TPS Summary" under apimanager Manager Performance Reports





    Examples:
      | usertype | Aggregatoruser | CustomerCareuser |
      | LOGOUT   | AGGRIGATOR     | CUSTOMERCARE     |
