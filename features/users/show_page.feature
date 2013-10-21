Feature: User Show Page
	As a registered user of the website
	I want to be able to view my profile information when I log in

	Background:
		Given the following users exist:
		|first_name   | last_name 	| bio	| is_current_student| is_parttime | matriculation_date| graduation_date | previous_work | undergrad_major | undergrad_school | hometown| email| 
		|Test1 | Student| This is a test | true | false| 2013-10-20 | 2013-12-20| Previous Work | Business | Drexel | Philly | test1@seas.upenn.edu| 
		|Anne2 | Test2| This is a different test | true | true | 2013-08-10 | 2014-03-10 | none | Engineering | Penn State | New York | test2@cis.upenn.edu|



		Scenario: Registered User can view profile
			Given I am signed in as "test1@seas.upenn.edu"
			When I view my profile page
			Then I should see my profile information 

		Scenario: Registered user cannot view another registered user's profile
			Given I am signed in as "test1@seas.upenn.edu"
			When I view my profile page
			Then I should not see another user's profile information

		Scenario: Unregistered user cannot view profile page
			Given I am not a valid user
			When I sign in
			And I view a profile show page
			Then I should not be able to access it



