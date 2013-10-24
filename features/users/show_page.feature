Feature: User Show Page
	As a registered user of the website
	I want to be able to view my profile information when I log in

	Background:
		Given the following users exist:
		| First Name | Last Name | Bio   | Is Current Student | Is Part Time | Matriculation Date | Graduation Date | Previous Work | Undergrad Major | Undergrad School | Hometown | Email | 
		| Abeer      | Minhas    | MCIT Student | true | false  | 2010-08-05 | 2012-05-05 | Social Worker | Binghamton University | Political Science | Binghamton | aminhas@seas.upenn.edu |
		| Connor    | Liddic | Web Developer | true | false | 2010-08-05 | 2012-05-05 | Program Manager | Colgate University | Graphic Design | Albany | cl@seas.upenn.edu | 


		Scenario: Registered User can view profile
			Given I am signed in as "Abeer"
			When I view my profile page
			Then I should see my profile information 

		Scenario: Registered user cannot view another registered user's profile
			Given I am signed in as "Abeer"
			When I view my profile page
			Then I should not see another users profile information

		Scenario: Unregistered user cannot view profile page
			Given I am not a valid user
			When I sign in
			And I view a profile show page
			Then I should not be able to access a profile show page




