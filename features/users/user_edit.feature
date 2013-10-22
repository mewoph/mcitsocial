Feature: Edit User Profile
	As a registered user 
	I want to be able to edit my profile
	So I can update information

Background: 
	Given the following users exist:
		| First Name | Last Name | Bio   | Is Current Student | Is Part Time | Matriculation Date | Graduation Date | Previous Work | Undergrad Major | Undergrad School | Hometown | Email | 
		| Abeer      | Minhas    | MCIT Student | true | false  | 2010-08-05 | 2012-05-05 | Social Worker | Binghamton University | Political Science | Binghamton | aminhas@seas.upenn.edu |
		| Connor    | Liddic | Web Developer | true | false | 2010-08-05 | 2012-05-05 | Program Manager | Colgate University | Graphic Design | Albany | cl@seas.upenn.edu | 

Scenario: I sign in and Edit My Account
	Given I am logged in
	When I edit my profile information
	Then I should see a successful profile edited message
	And I should see the updated profile information
	And I should not see the old profile information

