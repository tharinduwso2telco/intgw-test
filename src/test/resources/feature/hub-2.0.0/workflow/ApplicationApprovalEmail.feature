Feature: Application Approval And Email

@Hub
Scenario Outline: HUB-1644 : Application Approve with all hub and opco admins approvals
  Given I am in apimanager
  When I click on apimanager login
  Then I should see the apimanager "Login" pop up
  When I enter apimanager Login username and password for "<usertype>"
  And I click on apimanager Login pop up login button
  Then I should see apimanager "<usertype>" at the top right corner of the page
  When I click on apimanager My Applications
  Then I should see the apimanager Application page header as "Applications"
  Then I click on apimanager Add Application
  And I enter "<appName>" as name and "<Description>" as Description
  And I click on Add button
  Then I should see the added Application name as "<appName>" and the "<status>" as status
  Then I click on apimanager logout button
  Given I am in mailinator
  When I search the mail for email "AdminMailinatorAccount"
  And I click on latest email
  Then I verify email hub level Application Approval values "<usertype>" "<appName>" "<Description>" "<Tier>"
  Given I am in mailinator
  When I search the mail for email "Operator1MailinatorAccount"
  And I click on latest email
  Then I verify email plugin level Application Approval values "<usertype>" "<appName>" "<Description>" "<Tier>"
  #And I close the browser
Examples:
|usertype |appName      |Description  |status  |Tier |
|APPCREATE|AuXTestAPPA	|AuXTestingAPP|INACTIVE|Default |



