Feature: Viewing Questions
	Users should be able to see the questions index page, be able to filter on questions index page and be able to view an individual question

Background:
	Given the following companies exist:
	| Name |
	| Microsoft| 
	| Amazon| 
	And the following questions exist:
	| Question 													| Company |
	| How to reverse a linkedlist?			| Microsoft |
	| What is a hashmap? 								| Microsoft |
	| What is a heap? 									| Amazon | 
	| What is the number for SIGKILL? 	| Amazon | 

Scenario: A Registered User Can View A List Of Questions On The Questions Index Page
	Given I am a valid user that is logged in
	When I click on the questions tab
	Then I should see a list of all questions and the company name it belongs to

#TODO: Scenario: A Registered User Can Filter Questions

Scenario: 