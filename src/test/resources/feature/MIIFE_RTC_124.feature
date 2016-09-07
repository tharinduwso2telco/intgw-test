Feature: Validate Monthly Invoice data for Operator

  @Smoke
  Scenario Outline: Check if the system will show only Southbound data for the Operator
    Given I am in apimanger carbon login page
  #When I enter identity server username credentials
  #And I click on identity server sign in
  #Then I should see the ids Home page header as "WSO2 API Manager Home"
  #When I click on identity server Main tab
  #And I click on identity server Resources Browse link
  #Then I should see the identity server Resources Browse page header as "Browse"
  #When I search rate card by providing "/_system/governance/apimgt/applicationdata/sb-rate-card.xml" location
  #And I upload "sb-rate-card.xml" rate card file from "/SB/" location
    When I close the browser
    And I am in apimanager
    When I click on apimanager login
    Then I should see the apimanager "Login" pop up
    When I enter apimanager Login username and password for "<usertype>"
    And I click on apimanager Login pop up login button
    Then I should see apimanager "<usertype>" at the top right corner of the page
    When I click on apimanager Manage
    Then I should see the apimanager Manager page header as "Manager"
    When I enter apimanager Manager page operator username credentials
    And I click on apimanager Manager page login button
    Then I should see the apimanager Manager Home page header as "Home"
    And I should see apimanager Manager Home Billing Workflow
    When I click on apimanager Manager page Billing and Metering tab
    Then I should see apimanager Manager Total API Traffic page header as "<apiTrafficPageHeader>"
    And I should see Monthly Invoice menu item only for SB
    When I click on Monthly Invoice SB menu item
    Then I should see apimanager Manager Monthly Invoice page header as "<monthlyInvoicePageHeader>"
  #When I select "<year>" as Monthly Invoice Year
  #And I select "<month>" as Monthly Invoice Month
  #And I select "<serviceProvider>" as the Monthly Invoice service provider
    When I click on generate button
    Then I validate "admin_payment_test1" "payment" "DIALOG" and "Charge" for "Usage Charge" value as "Rs 213.60"
    And I validate total amount for "Usage Charge" column value as "Rs 243.60"


    Examples:
      | usertype | apiTrafficPageHeader | monthlyInvoicePageHeader     | year | month | serviceProvider |
      | QA17LOG  | Total API Traffic    | Monthly Invoice - Southbound | 2016 | March | AutInvSP3       |

