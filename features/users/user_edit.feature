Feature: Edit User Profile
	As a registered user 
	I want to be able to edit my profile
	So I can update information

Background: 
	Given the following users exist:
		| First Name | Last Name | Bio   | Is Current Student | Is Part Time | Matriculation Date | Graduation Date | Previous Work | Undergrad Major | Undergrad School | Hometown | Email | Courses | Languages | Interests |
		| Abeer      | Minhas    | MCIT Student | true | false  | 2010-08-05 | 2012-05-05 | Social Worker | Binghamton University | Political Science | Binghamton | aminhas@seas.upenn.edu | CIT 596,CIT 550 | Java,Ruby |  MCIT social |
		| Connor    | Liddic | Web Developer | true | false | 2010-08-05 | 2012-05-05 | Program Manager | Colgate University | Graphic Design | Albany | cl@seas.upenn.edu | CIT 598,CIT 552 | Ruby,Rails | MCIT |

Scenario: User should not able to edit another user's page
	Given I am logged in as "Abeer"
	When I view "Connor"s profile page
	Then I should not be able to edit "Connor"s page

