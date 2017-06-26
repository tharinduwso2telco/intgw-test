Feature: Sign Up Validation 

@FeatureInstallation
Scenario Outline: Check if users can self register on the API Store
Given I am in identity server page
When I enter identity server username credentials
And I click on identity server sign in
And I click on identity server Configuration tab
Then I click on Features
When I click on Repository Management tab
And I click add repository button
And I set values for the repository name as "<Name>" and url as "<Url>"
When I click Available Feature tab
And I click find feature button
And I click api Key Manager button
Then I click api Key Manager Version
And I tick api management
When I click install button
Then I continue install feature process label "<step1>" and complete "<step2>"




Examples:
|usertype|LastName   |FirstName   |Email               |Name   |Url|step1|step2|
|SIGNUP	 |AuxTestLast|AuxTestFirst|AuxTest123@gmail.com|P2 Repo|http://product-dist.wso2.com/p2/carbon/releases/wilkes/|Installing|Installation Complete|

