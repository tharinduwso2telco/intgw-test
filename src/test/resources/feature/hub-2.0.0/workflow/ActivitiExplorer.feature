Feature: Bar file upload in Activiti-Explorer

@BarFileUpload
Scenario Outline: Activiti-Explorer bar file upload flow
  Given I am in activiti explorer
  And I enter ActivitiExplorer credentials
  And I click on ActivitiExplorer login button
  When I click on manage icon
  And I click on deplyments menu
  And I select upload new menu item
  Then I set bar file name as "<activityBarFile>"
  And I click on deplyments menu
  And I select upload new menu item
  Then I set bar file name as "<subscriptionFile>"

  Examples:
    |activityBarFile                        |subscriptionFile|
    |ApplicationCreationApprovalWorkflow.bar|SubscriptionCreationApprovalWorkflow.bar|



#  Given I am in apipublisher
#  When I provide apipublisher username and password for "<usertypePub>"

#When I enter ActivitiExplorer credentials
