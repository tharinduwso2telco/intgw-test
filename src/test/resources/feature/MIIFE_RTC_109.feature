Feature: Validate Performance Error Rates report

  @Smoke
  Scenario Outline: Check if Performance Error Rates report is loaded with data accurately
    Given I am in apimanager
    When I click on apimanager login
    Then I should see the apimanager "Login" pop up
    When I enter apimanager Login username and password for "<usertype>"
    And I click on apimanager Login pop up login button
    Then I should see apimanager "<usertype>" at the top right corner of the page
    When I click on apimanager Manage
    Then I should see the apimanager Manager page header as "Manager"
    When I enter apimanager Manager page admin username credentials
    And I click on apimanager Manager page login button
    Then I should see the apimanager Manager Home page header as "Home"
    And I should see apimanager Manager Home Billing Workflow Blacklist Whitelist tabs
    When I click on apimanager Manager page Billing and Metering tab
    Then I should see apimanager Manager Total API Traffic page header as "<apiTrafficPageHeader>"
    When I click on Performance Error Rates menu item
    Then I should see apimanager Manager Performance Error Rates page header as "<performanceErrorRatesPageHeader>"
    When I enter "<fromDate>" as Performance Error Rates from date
    And I enter "<toDate>" as Performance Error Rates to date
    And I select "<operator>" as Performance Error Rates operator
    And I select "<serviceProvider>" as the Performance Error Rates service provider
    And I select "<application>" as Performance Error Rates Application
    And I select "<API>" as Performance Error Rates API
    And I click on generate button
    Then I should see generated Performance Error Rates graph for "<fromDate>" "<toDate>" "<operator>" "<serviceProvider>" parameters


    Examples:
      | usertype | apiTrafficPageHeader | performanceErrorRatesPageHeader | fromDate   | toDate     | operator | serviceProvider | application | API |
      | QA17LOG  | Total API Traffic    | Performance Error Rates         | 2015-12-04 | 2016-06-09 | DIALOG   | admin           | All         | All |