Feature: Validate Monthly Invoice

# TC covering by this TC - MIIFE_RTC_111, MIIFE_RTC_121

@Smoke
Scenario Outline: Check if the data on the downloaded report and the report loaded on the UI are same on Monthly Invoice NB
Given I am in apimanger carbon login page
When I enter identity server username credentials
And I click on identity server sign in
Then I should see the ids Home page header as "WSO2 API Manager Home"
When I click on identity server Main tab
And I click on identity server Resources Browse link
Then I should see the identity server Resources Browse page header as "Browse"
#When I search rate card by providing "/_system/governance/apimgt/applicationdata/nb-rate-card.xml" location
#And I upload "nb-rate-card.xml" rate card file from "/NB/1/" location
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
When I click on Monthly Invoice NB menu item
Then I should see apimanager Manager Monthly Invoice page header as "<monthlyInvoicePageHeader>"
And I should check Monthly invoice is existing in "<filePath>" named as "<csvFile>" and "<excelFileName>" and delete
When I select "<year>" as Monthly Invoice Year
And I select "<month>" as Monthly Invoice Month
And I select "<serviceProvider>" as the Monthly Invoice service provider
And I click on generate button
When I click on Monthly Invoice Download report button
And I convert "<csvFile>" to "<excelFileName>" from "<filePath>" location
Then I validate "AutInvSP3_AutInvSP3_app2" "smsmessaging" and "Send SMS" for "Usage Charge" column with the repective value from downloaded file
#need discuss total amount validation since UI and excel report contains two different figures

Examples:
| usertype|apiTrafficPageHeader|monthlyInvoicePageHeader    |year|month|serviceProvider|csvFile				 |excelFileName				|filePath				 	 |
|QA17LOG  |Total API Traffic   |Monthly Invoice - Northbound|2016|March|AutInvSP3      |AutInvSP3-2016-3.csv |AutInvSP3-2016-3CVT.xlsx  |C:/Users/AUX-026/Downloads/ |

@Smoke
Scenario Outline: Check if the data on the downloaded report and the report loaded on the UI are same on Monthly Invoice SB
Given I am in apimanger carbon login page
When I enter identity server username credentials
And I click on identity server sign in
Then I should see the ids Home page header as "WSO2 API Manager Home"
When I click on identity server Main tab
And I click on identity server Resources Browse link
Then I should see the identity server Resources Browse page header as "Browse"
#When I search rate card by providing "/_system/governance/apimgt/applicationdata/sb-rate-card.xml" location
#And I upload "nb-rate-card.xml" rate card file from "/SB/1/" location
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
And I should check Monthly invoice is existing in "<filePath>" named as "<csvFile>" and "<excelFileName>" and delete
When I select "<year>" as Monthly Invoice Year
And I select "<month>" as Monthly Invoice Month
And I select "<serviceProvider>" as the Monthly Invoice service provider
And I click on generate button
When I click on Monthly Invoice Download report button
And I convert "<csvFile>" to "<excelFileName>" from "<filePath>" location
Then I validate "admin_payment_test1" "payment" "DIALOG" and "Charge" for "Usage Charge" column with the repective value from downloaded file

Examples:
| usertype|apiTrafficPageHeader|monthlyInvoicePageHeader    |year|month  |serviceProvider |csvFile			  |excelFileName		|filePath				 	 |
|QA17LOG  |Total API Traffic   |Monthly Invoice - Southbound|2016|January|All		      |__ALL__-2016-1.csv |__ALL__-2016-1.xlsx  |C:/Users/AUX-026/Downloads/ |
