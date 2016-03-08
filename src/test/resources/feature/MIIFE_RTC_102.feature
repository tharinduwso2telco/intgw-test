Feature: Validate Transaction Log 


#MIIFE_RTC_111 is covered by this scenario
@Smoke
Scenario Outline: Check if Transaction Log is loaded accurately
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
When I click on apimanager Manager page Billing and Metering tab
Then I should see apimanager Manager Total API Traffic page header as "<apiiTrafficPageHeader>"
When I click on Transaction log menu item
Then I should see apimanager Manager Transaction Log page header as "<transactionLogPageHeader>"
And I should check transaction log is existing in "<path>" named as "<fileName>" and delete
When I enter "<fromDate>" as Transaction Log from date
And I enter "<toDate>" as Transaction Log to date
And I select "<operator>" as Transaction Log operator
And I select "<serviceProvider>" as the Transaction Log service provider
And I select "<API>" as Transaction Log API
And I select "<status>" as Transaction Log Status
And I click on Download report button
And I prepare the transaction log query using "<fromDate>" "<toDate>" "<operator>" and "<API>" parameters
Then I should see downloaded csv sheet with the "<path>" as path , "<fileName>" as the file name and "<excelFileName>" as the excel file name


Examples:
| usertype|apiiTrafficPageHeader|transactionLogPageHeader|fromDate  |toDate    |operator   |serviceProvider  |API     |status    |path                        |fileName                                       |excelFileName					   |
|LOGOUT   |Total API Traffic	|Transaction Log		 |2015-12-08|2016-03-04| DIALOG    |admin            |payment |Successful|C:/Users/AUX-026/Downloads/ |2015-12-08-2016-03-04-admin-DIALOG-payment.csv |AuxLogoutUser-DIALOG-AuxAppTest.xlsx|
