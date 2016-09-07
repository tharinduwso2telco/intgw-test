Feature: Create inidan node data

  @Smoke
  Scenario Outline: Create application and approve it
    Given I am in apimanager
    When I click on apimanager login
    And I enter apimanager Login username and password for "<usertype>"
    And I click on apimanager Login pop up login button
    And I click on apimanager My Applications
    And I clear existing "<appName>" for "<usertype>"
    And I enter "<appName>" as name "<CallbackURL>" as Callback URL and "<Description>" as Description
    And I click on Add button
    When I click on apimanager Manage
    Then I should see the apimanager Manager page header as "Manager"
    When I enter apimanager Manager page admin username credentials
    And I click on apimanager Manager page login button
    And I click on apimanager Manager page Workflow tab
    And I click on Application creation link
    Then I should see created application "<appName>" at the top of the Approval Tasks table for "<usertype>"
    When I click on Application Details drop box for "<appName>" row for "<usertype>"
    And I select "<ApplicationDetails>" for "<appName>" Application Details row for "<usertype>"
    And I click Assign To Me button for "<appName>" Application Details row for "<usertype>"
    And I click on Start button for "<appName>" Application Details row for "<usertype>"
    And I select "<Action>" and click complete button for "<appName>" Application Details row for "<usertype>"
    And I enter aprrove/reject reason as "Approved"
    And click aprrove/reject reason ok button
    And I click on apimanager Manager admin
    And I click on apimanager Manager logout button
  # No operator admins. Instead of operator admin execute the query
  #Then I should see the apimanager Manager page header as "Manager"
  #When I enter apimanager Manager page operator username credentials
  #And I click on apimanager Manager page login button
  #And I should see apimanager Manager Home Billing Workflow
  #And I click on apimanager Manager page Workflow tab
  #And I click on Application creation link
  #And I click on Start button for "<appName>" Application Details row for "<usertype>"
  #And I select "<Action>" and click complete button for "<appName>" Application Details row for "<usertype>"
  #And I enter aprrove/reject reason as "Approved"
  #And click aprrove/reject reason ok button
  #And I click on apimanager Manager dialogAdmin
  #And I click on apimanager Manager logout button
  #When I close the browsers
  #And I update the database operator application table for "<appName>"

    Examples:
      | usertype   | ApplicationDetails | Action  | CallbackURL                                              | Description | appName           |
      | DATACREATE | Unlimited          | Approve | http://jenkins.wso2telco.com:9763/playground2/oauth2.jsp | AuXTestAPI  | DataCreateUser001 |

  @Smoke
  Scenario Outline: Subscribe APIs
    Given I am in apimanager
    When I click on apimanager login
    And I enter apimanager Login username and password for "<usertype>"
    And I click on apimanager Login pop up login button
    And I click on apimanager APIs module
    And I click on the apimanager "<apiName>" api
    And I click on Applications dropdown
    And I select "<appName>" for "<usertype>"
    And I select operator as "<operator>"
    And I click apimanager "<APIName>" API page subscribe button
    Then I should see "Subscription Successful" on Subscription Successful pop up
    And I click Go to My Subscription button


    Examples:
      | usertype   | apiName      | appName           | operator |
      | DATACREATE | Authorize    | DataCreateUser001 | DIALOG   |
      | DATACREATE | authorizecpi | DataCreateUser001 | DIALOG   |
      | DATACREATE | authorizemnv | DataCreateUser001 | DIALOG   |
      | DATACREATE | token        | DataCreateUser001 | DIALOG   |
      | DATACREATE | tokencpi     | DataCreateUser001 | DIALOG   |
      | DATACREATE | tokenmnv     | DataCreateUser001 | DIALOG   |

  @Smoke
  Scenario Outline: Subscribtion approval
    Given I am in apimanager
    When I click on apimanager Manage
    Then I should see the apimanager Manager page header as "Manager"
    When I enter apimanager Manager page admin username credentials
    And I click on apimanager Manager page login button
    And I click on apimanager Manager page Workflow tab
    And I click on subscriptions creation under tasks
    And  I approve admin subscriptions for "<appName>" of for "<usertype>" by giving "<ApplicationDetails>" and "Approved" as comment
    And I click on apimanager Manager admin
    And I click on apimanager Manager logout button
  # comment due to no operator admin. Execute the DB query
  #Then I should see the apimanager Manager page header as "Manager"
  #When I enter apimanager Manager page operator username credentials
  #And I click on apimanager Manager page login button
  #And I click on apimanager Manager page Workflow tab
  #And I click on subscriptions creation under tasks
  #And I approve operator subscriptions for "<appName>" of for "<usertype>" by giving "<ApplicationDetails>" and "Approved" as comment
  #And I click on apimanager Manager dialogAdmin
  #And I click on apimanager Manager logout button
    When I click on close window
    Then I am in apimanager
    When I click on apimanager My Subscriptions
    And I enter apimanager Login username and password for "<usertype>"
    And I click on apimanager Login pop up login button
    Then I should see the apimanager Subscriptions page header as "Subscriptions"
    When I select created application "<appName>" from the dropdown for "<usertype>"
    And I enter token validity of production as "<validity>"
    And I click generate under apimanager Subscriptions page production
    Then I should see consumer Key of production
    And I should see consumer Secret of production
    When I enter token validity of sandbox as "<validity>"
    And I click generate under apimanager Subscriptions page sandbox
    Then I should see consumer Key of sandbox
    And I should see consumer Secret of sandbox
    When I write generated productions keys to the "<file>" and sheet name as "keys" for "<appName>" "<usertype>"

    Examples:
      | usertype   | appName           | ApplicationDetails | validity | file                                         |
      | DATACREATE | DataCreateUser001 | Unlimited          | -1       | /src/test/resources/config/data/appKeys.xlsx |

  @Smoke
  Scenario Outline: Carbon confi
    Given I am in identity server page
    When I enter identity server username credentials
    And I click on identity server sign in
    And I click on identity server Main tab
    And I click on ids Main List link
    And I click on "<appName>" edit link for "<usertype>"
    And I click on Inbound Authentication Configuration
    And I click on OAuth/OpenID Connect Configuration
    And I click on OAth client secret show button
    And I click on Local and Outbound Authentication Configuration
    And I select Advanced Configuration
    Then I should see Advanced Authentication Configuration for "<appName>" page for "<usertype>"
    When I click on Add Authentication Step
    And I select "LOA" under Local Authenticators
    And I click update
    Then I should see ids Service providers page header as "Service Providers"
    When I click on Inbound Authentication Configuration
    And I click on OAuth/OpenID Connect Configuration
    And I click edit in Actions
    Then I should see View/Update application settings page header as "View/Update application settings"
    When I click on Code
    Then I should see "<CallbackURL>" as call back url
    When I click on Implicit
    And I click on Password
    And I click on Client Credential
    And I click on Refresh Token
    And I click on SAML
    And I click on IWA-NTLM
    And I click on View/Update application settings page update
    Then I should see Application updated successfully pop up message as "Application updated successfully"

    Examples:
      | usertype   | appName           | CallbackURL                                              |
      | DATACREATE | DataCreateUser001 | http://jenkins.wso2telco.com:9763/playground2/oauth2.jsp |