Feature: environment configuration

@config
Scenario Outline: Upload NB rate card
Given I am in apimanger carbon login page
When I enter identity server username credentials
And I click on identity server sign in
Then I should see the ids Home page header as "<PageHeader>"
When I click on identity server Main tab
And I click on identity server Resources Browse link
Then I should see the identity server Resources Browse page header as "Browse"
When I search rate card by providing "/_system/governance/apimgt/applicationdata/nb-rate-card.xml" location
And I upload "nb-rate-card.xml" rate card file from "/NB/1/" location
When I close the browser

Examples:
|PageHeader|
|WSO2 API Manager Home|

@config
Scenario Outline: Upload SB rate card
Given I am in apimanger carbon login page
When I enter identity server username credentials
And I click on identity server sign in
Then I should see the ids Home page header as "<PageHeader>"
When I click on identity server Main tab
And I click on identity server Resources Browse link
Then I should see the identity server Resources Browse page header as "Browse"
When I search rate card by providing "/_system/governance/apimgt/applicationdata/sb-rate-card.xml" location
And I upload "sb-rate-card.xml" rate card file from "/SB/1/" location
When I close the browser

Examples:
|PageHeader|
|WSO2 API Manager Home|

@config
Scenario Outline: Upload SB rate card
Given I am in apimanger carbon login page
When I enter identity server username credentials
And I click on identity server sign in
Then I should see the ids Home page header as "<PageHeader>"
When I click on identity server Main tab
And I click on identity server Resources Browse link
Then I should see the identity server Resources Browse page header as "Browse"
When I search rate card by providing "/_system/governance/apimgt/applicationdata/workflow-extensions.xml" location
And I upload "workflow-extensions.xml" rate card file from "/workflow/" location
When I close the browser

Examples:
|PageHeader|
|WSO2 API Manager Home|

@Smoke
Scenario Outline: Upload zip Files
Given I am in apimanger actvity manager login page
When I enter apimanger actvity manager admin username credentials
And I click on apimanger actvity manager sign in
Then I should see the apimanger actvity manager Home page header as "<PageHeader>"
When I click on apimanger actvity manager Main tab
And I click on the apimanger actvity manager Human Tasks Add link
Then I should see apimanger actvity manager Human Tasks Add page header as "New HumanTask Package"
When I select the new human task package folder from "" as "file.zip"
And I click on new human task upload button
#Then I validate the uploaded file
When I close the browser

Examples:
|PageHeader|
|WSO2 Business Process Server Home|