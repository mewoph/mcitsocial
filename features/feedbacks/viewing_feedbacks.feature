Feature: Viewing Feedbacks
	Users should be able to see the feedbacks index page, be able to filter on feedbacks index page and be able to view an individual question

Background:
	Given the following companies exist:
	| name |
	| Microsoft| 
	| Amazon| 
	And the following users exist:
	| First Name | Last Name | Bio   | Is Current Student | Is Part Time | Matriculation Date | Graduation Date | Previous Work | Undergrad Major | Undergrad School | Hometown | Email | Courses | Languages | Interests |
	| Abeer      | Minhas    | MCIT Student | true | false  | 2010-08-05 | 2012-05-05 | Social Worker | Binghamton University | Political Science | Binghamton | aminhas@seas.upenn.edu | "CIT596,CIT550" | "Java,Ruby" |  "MCIT social" |
	And the following feedbacks exist:
	| feedback_content 								| company_id | is_question | adder id |
	| What is that? 								| 1          | true        | 1        |
	| Where am I? 									| 1          | true        | 1        |
	| What is this? 								| 2          | true        | 2        |
	| What is the meaning of life? 					| 2          | true        | 1        |       

Scenario: A Registered User Can View A List Of Feedbacks On The Feedbacks Index Page
	Given I am a valid user that is logged in
	When I click on the feedbacks tab
	Then I should see a list of all feedbacks and the company name it belongs to

#TODO: Scenario: A Registered User Can Filter Feedbacks

Scenario: 