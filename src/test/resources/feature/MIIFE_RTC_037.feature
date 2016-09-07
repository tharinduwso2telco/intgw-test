Feature: Validate invoking Location API with a black list msisdn

  @Smoke
  Scenario Outline: Check if Location API can be invoked with a black list msisdn
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
    When I click on apimanager Manager page Blacklist tab
    Then I should see apimanager Manager APIwise Blacklist page header as "<blacklistPageHeader>"
    When I clear existing "<BlackListNumber>"
    And I select "<API>" as blacklist API
    And I click on Blacklisted subscribers Add New button
    Then I should see add nember alert header as "<AddNumberAlert>"
    When I enter the "<BlackListNumber>" to blacklist
    Then I click add blacklist number alert ok button

    Examples:
      | usertype | API  | BlackListNumber | blacklistPageHeader | AddNumberAlert                 |
      | LOGOUT   | USSD | 94123456898     | APIwise Blacklist   | Please enter subscriber number |

