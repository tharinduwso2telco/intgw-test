Feature: Sign Up Validation 

@FeatureInstallation
Scenario Outline: Check if users can self register on the API Store
Given I am in identity server page
When I enter identity server username credentials
And I click on identity server sign in
And I click on identity server Configuration tab
Then I click on Features
When I click on Repository Management


Examples:
|usertype|LastName   |FirstName   |Email               |
|SIGNUP	 |AuxTestLast|AuxTestFirst|AuxTest123@gmail.com|

