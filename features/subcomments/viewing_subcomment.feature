Feature: Viewing SubComments
	Users should be able to view comments attached to questions and add them.

Background:
	Given the following companies exist:
	| name |
	| Microsoft| 
	And the following users exist:
	| First Name | Last Name | Bio   | Is Current Student | Is Part Time | Matriculation Date | Graduation Date | Previous Work | Undergrad Major | Undergrad School | Hometown | Email | Courses | Languages | Interests |
	| Abeer      | Minhas    | MCIT Student | true | false  | 2010-08-05 | 2012-05-05 | Social Worker | Binghamton University | Political Science | Binghamton | aminhas@seas.upenn.edu | "CIT596,CIT550" | "Java,Ruby" |  "MCIT social" |
	And the following feedbacks exist:
	| feedback_content 								| company_id | is_question | adder id | 
	| What is that? 								| 1 		 | true        | 1        |
	And the following comments exist:
	| comment | content_id | commenter_id |
	| "That is a test." |  1 |  1 |
	And the following sub_comments exist:
	| comment | content_id | commenter_id |
	| "I second that this is test." |  1 |  1 |
	| "But what type of test is it?" |  1 |  2 |
	| "That is a widget" |  2 |  1 |
	| "are you sure? it looks like a thingamabob" |  2 |  2 |

	Scenario: A Registered User can view the feedback show page and see subcomments
	Given I am a valid user that is logged in
	When I view a question show page
	Then I should see a list of all subcomments to answers

