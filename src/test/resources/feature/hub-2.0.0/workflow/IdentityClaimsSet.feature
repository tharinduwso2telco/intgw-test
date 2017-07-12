Feature: Match claims in mig with hub 

@matchClaimsinMigwithHub
Scenario Outline: Match claims in mig with hub
Given I am in identity server page
When I enter identity server username credentials
And I click on identity server sign in
Then I should see the ids Home page header as "WSO2 Identity Server Home"
When I click on identity server Main tab
And I click on identity server Configuration Claims List link
And I click on wso2 org claims link
And I click on Email edit link
And I select claim required box
And I click on claim update
Then I should see the ids Home page header as "Available Claims for http://wso2.org/claims"
When I click on First Name edit link
And I select claim required box
And I click on claim update
Then I should see the ids Home page header as "Available Claims for http://wso2.org/claims"
When I click on Last Name edit link
And I select claim required box
And I click on claim update
Then I should see the ids Home page header as "Available Claims for http://wso2.org/claims"
When I click shutdown or restart link
And I click on graceful restart link
And I click on yes
And I click on ok




Examples:
|page|LastName   |FirstName   |Email               |Name   |Url|step1|step2|
|WSO2 Identity Server Home	 |AuxTestLast|AuxTestFirst|AuxTest123@gmail.com|P2 Repo|http://product-dist.wso2.com/p2/carbon/releases/wilkes/|Installing|Installation Complete|

