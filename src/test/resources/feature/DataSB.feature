Feature: Validate Monthly Invoice

@Smoke
Scenario Outline: Check if Monthly Invoice Southbound is loaded with data accurately based on different charge type by uploading SB rate card1
Given I am in apimanger carbon login page
When I enter identity server username credentials
And I click on identity server sign in
Then I should see the ids Home page header as "WSO2 API Manager Home"
When I click on identity server Main tab
And I click on identity server Resources Browse link
Then I should see the identity server Resources Browse page header as "Browse"
When I search rate card by providing "/_system/governance/apimgt/applicationdata/sb-rate-card.xml" location
And I upload "sb-rate-card.xml" rate card file from "/SB/1/" location
When I close the browser
And I am in apimanager
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
When I click on Monthly Invoice SB menu item
Then I should see apimanager Manager Monthly Invoice page header as "<monthlyInvoicePageHeader>"
When I select "<year>" as Monthly Invoice Year
And I select "<month>" as Monthly Invoice Month
And I select "<serviceProvider>" as the Monthly Invoice service provider
And I click on generate button
And I write the SB UI table into a "sb1UITableBefore.xlsx" excel file in "/SB/1/" location


Examples:
| usertype|apiTrafficPageHeader|monthlyInvoicePageHeader     |year|month|serviceProvider|
|QA17LOG  |Total API Traffic   |Monthly Invoice - Southbound |2016|March|admin     |

#@Smoke
#Scenario Outline: Check if Monthly Invoice Northbound is loaded with data accurately based on different charge type by uploading NB rate card1
#Given I am in apimanger actvity manager login page
#When I enter apimanger actvity manager admin username credentials
#And I click on apimanger actvity manager sign in
#Then I should see the apimanger actvity manager Home page header as "WSO2 Business Activity Monitor Home"
#When I click on apimanger actvity manager Main tab
#And I click on the apimanger actvity manager Analytics List llink
#Then I should see apimanger actvity manager List page header as "Available Scripts"
##When I click on the apimanger actvity manager Available scripts execute button
#When I close the browser
#And I am in apimanager
#When I click on apimanager login
#Then I should see the apimanager "Login" pop up
#When I enter apimanager Login username and password for "<usertype>" 
#And I click on apimanager Login pop up login button
#Then I should see apimanager "<usertype>" at the top right corner of the page
#When I click on apimanager Manage 
#Then I should see the apimanager Manager page header as "Manager"
#When I enter apimanager Manager page admin username credentials
#And I click on apimanager Manager page login button
#Then I should see the apimanager Manager Home page header as "Home"
#And I should see apimanager Manager Home Billing Workflow Blacklist Whitelist tabs
#When I click on apimanager Manager page Billing and Metering tab
#Then I should see apimanager Manager Total API Traffic page header as "<apiTrafficPageHeader>"
#When I click on Monthly Invoice SB menu item
#Then I should see apimanager Manager Monthly Invoice page header as "<monthlyInvoicePageHeader>"
#When I select "<year>" as Monthly Invoice Year
#And I select "<month>" as Monthly Invoice Month
#And I select "<serviceProvider>" as the Monthly Invoice service provider
#And I click on generate button
#And I write the SB UI table into a "sb1UITableAfter.xlsx" excel file in "/SB/1/" location
#And I calculate the difference between SB "sb1UITableBefore.xlsx" and "sb1UITableAfter.xlsx" excel file from "/SB/1/" location and write it to "sb1BeforeAfterDif.xlsx"
#Then I validate SB invoice "sb1BeforeAfterDif.xlsx" records against "manuallyCalcDif.xlsx" from "/SB/1/" location
#
#Examples:
#| usertype|apiTrafficPageHeader|monthlyInvoicePageHeader     |year|month|serviceProvider|
#|QA17LOG  |Total API Traffic   |Monthly Invoice - Southbound |2016|January|All     |