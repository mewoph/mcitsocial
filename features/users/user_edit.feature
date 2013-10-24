Feature: Edit User Profile
	As a registered user 
	I want to be able to edit my profile
	So I can update information

Background: 
	Given the following users exist:
		| First Name | Last Name | Bio   | Is Current Student | Is Part Time | Matriculation Date | Graduation Date | Previous Work | Undergrad Major | Undergrad School | Hometown | 
		| Abeer      | Minhas    | MCIT Student | true | false  | 2010-08-05 | 2012-05-05 | Social Worker | Binghamton University | Political Science | Binghamton | 
		| Connor    | Liddic | Web Developer | true | false | 2010-08-05 | 2012-05-05 | Program Manager | Colgate University | Graphic Design | Albany | 

Scenario: I sign in and Edit My Account
	Given I am logged in as "Abeer"
	When I edit my profile information
	Then I should see a successful profile edited message
	And I should see the updated profile information
	And I should not see the old profile information

Scenario: User should not able to edit another user's page
	Given I am logged in as "Abeer"
	When I view "Connor"s profile page
	Then I should not be able to edit the page

