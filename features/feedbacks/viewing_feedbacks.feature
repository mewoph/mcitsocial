Feature: Viewing Feedbacks
	Users should be able to see the feedbacks index page, be able to filter on feedbacks index page and be able to view an individual question

Background:
	Given the following companies exist:
	| Name |
	| Microsoft| 
	| Amazon| 
	And the following feedbacks exist:
	| feedback_content 								| company_id | is_question | adder_id |
	| What is that? 								| 1 | true | 1 |
	| Where am I? 									| 1 | true | 2 |
	| What is this? 								| 2 | true | 2 | 
	| What is the meaning of life? 					| 2 | true | 1 | 
	| MCIT Rocks!									| 2 | false| 1 | 
	| MCIT Social is better then Facebook! 		    | 2 | false| 2 | 
	| A very constructive comment					| 2 | false| 1 | 

Scenario: A Registered User Can View A List Of Feedbacks On The Feedbacks Index Page
	Given I am a valid user that is logged in
	When I click on the feedbacks tab
	Then I should see a list of all feedbacks and the company name it belongs to


#TODO: Scenario: A Registered User Can Filter Feedbacks

Scenario: 