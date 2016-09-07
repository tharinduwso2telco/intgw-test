Feature: Validate the reports which can be seen to customer care user

  @Smoke
  Scenario Outline: Check if the users with customer care role can view the data on the reports
    Given I am in apimanager
    And I click on apimanager login
    Then I should see the apimanager "Login" pop up
    When I enter apimanager Login username and password for "<usertype>"
    And I click on apimanager Login pop up login button
    Then I should see apimanager "<usertype>" at the top right corner of the page
    When I click on apimanager Manage
    Then I should see the apimanager Manager page header as "Manager"
    When I enter apimanager Manager page username and password for "<usertype>"
    And I click on apimanager Manager page login button
    Then I should see the apimanager Manager Home page header as "Home"
    When I click on apimanager Manager page Billing and Metering tab
    Then I should see apimanager Manager Customer Care Reports page header as "<customerCareReportsPageHeader>"
    When I enter "<fromDate>" as Customer Care Reports from date
    And I enter "<toDate>" as Customer Care Reports to date
    And I enter "<msisdn>" as Customer Care Reports MSISDN
    And I select "<application>" as Customer Care Reports Application
    And I click on generate button
    When I prepare the OPERATOR_API_TRAFFIC query using "<fromDate>" "<toDate>" and "<application>" parameters
    Then I should see the generated Customer Care Report


    Examples:
      | usertype     | roleName                  | apiTrafficPageHeader | customerCareReportsPageHeader | fromDate   | toDate     | msisdn | application |
      | CUSTOMERCARE | celcom-customer-care-role | Total API Traffic    | Customer Care Reports         | 2016-01-01 | 2016-02-14 |        | All         |