Feature: Create Publishers 

	@createPublishers
  Scenario Outline: Create Operator admin users
    Given I am in apimanager
    When I click on apimanager sign-up button
    Then I should see the apimanager sign-up for a new account form as "Create your Account"
    When I enter apimanager Sign-up for a new account username for "<usertype>"
    And I enter apimanager Sign-up for a new account Password for "<usertype>"
    And I enter apimanager Sign-up for a new account Re-type password for "<usertype>"
    And I enter apimanager Sign-up for a new account Last name as "<LastName>"
    And I enter apimanager Sign-up for a new account First name as "<FirstName>"
    And I enter apimanager Sign-up for a new account Email as "<Email>"
    And I click on apimanager Sign-up for a new account submit button
    Then I should see the apimanager Sign-up for a new account success pop up with "User added successfully. You can now sign into the API store using the new user account".
    When I click on apimanager Sign-up for a new account success pop up ok button
    Then I should see the apimanager "Login" pop up
    Examples:
      | usertype|LastName   |FirstName   |Email     |
      |PUBLISHER1ADMIN|TestName1|AuxTestFirst2|ksrajith@gmail.com|
      |PUBLISHER2ADMIN|TestName2|AuxTestFirst3|ksrajith@yahoo.com|
      |PUBLISHER3ADMIN|TestName3|AuxTestFirst3|ksrajith@yahoo.com|