Feature: Viewing Specific Feedback
	Users should be able to view a particular feedback and see the feedback content, the user who created it and and date of creation. 

Background:
	Given the following companies exist:
	| name |
	| Microsoft| 
	| Amazon| 
	And the following users exist:
	| First Name | Last Name | Bio   | Is Current Student | Is Part Time | Matriculation Date | Graduation Date | Previous Work | Undergrad Major | Undergrad School | Hometown | Email | Courses | Languages | Interests |
	| Abeer      | Minhas    | MCIT Student | true | false  | 2010-08-05 | 2012-05-05 | Social Worker | Binghamton University | Political Science | Binghamton | aminhas@seas.upenn.edu | CIT596,CIT550 | Java,Ruby |  MCIT social |
	And the following feedbacks exist:
	| feedback_content 								| company_id | is_question | adder id | 
	| What is that? 								| 1 		 | true        | 1        |
	| Where am I? 									| 1          | true        | 1        |
	| What is this? 								| 2          | true        | 1        |
	| What is the meaning of life? 					| 2          | true        | 1        |

	Scenario: A Registered User can view the feedback show page
	Given I am a valid user that is logged in
	When I view a question show page
	Then I should see the feedback information