Feature: User Show Page
	As a registered user of the website
	I want to be able to view my profile information when I log in

Background: 
	Given the following users exist:
		| First Name | Last Name | Bio   | Is Current Student | Is Part Time | Matriculation Date | Graduation Date | Previous Work | Undergrad Major | Undergrad School | Hometown | Email | Courses | Languages | Interests |
		| Abeer      | Minhas    | MCIT Student | true | false  | 2010-08-05 | 2012-05-05 | Social Worker | Binghamton University | Political Science | Binghamton | aminhas@seas.upenn.edu | CIT596,CIT550 | Java,Ruby |  MCIT social |
		| Connor    | Liddic | Web Developer | true | false | 2010-08-05 | 2012-05-05 | Program Manager | Colgate University | Graphic Design | Albany | cl@seas.upenn.edu | CIT598,CIT552 | Ruby,Rails | MCIT |


		Scenario: Registered User can view profile
			Given I am logged in as "Abeer"
			When I view my profile page
			Then I should see my profile information 

		Scenario: Registered user can view another registered users profile
			Given I am logged in as "Abeer"
			When I view "Connor"s profile page
			Then I should see "Connor"s profile information

		Scenario: Unregistered user cannot view profile page
			Given I am not a valid user
			When I sign in
			And I view a profile show page
			Then I should not be able to access a profile show page

		Scenario: A registered user has the edit button on own profile page
			Given I am logged in as "Connor"
			When I view my profile page
			Then I should see the edit profile button

		Scenario: A registered user does not have the edit button on another users profile page
			Given I am logged in as "Connor"
			When I view "Abeer"s profile page
			Then I should not see the edit profile button

		Scenario: A registered user should be able to click own link on user index page and see own profile
			Given I am logged in as "Connor"
			When I view user index page
			Then I should see a link to my profile




