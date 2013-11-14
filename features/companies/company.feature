Feature: Viewing and Creating Companies
	Users should be able to see a list of companies, view a
	company from the list, or add a company if it does not exist

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

Scenario: A Registered User Can View A List of Companies
	Given I am a valid user that is logged in
	When I click on the companies tab
	Then I should see a list of all existing companies

Scenario: A Registered User Can View A Company
	Given I am a valid user that is logged in
	When I view the company "Microsoft"
	Then I should see all of "Microsoft"s company information

Scenario: A Registered User Can Add a Company If It Does not Exist
	Given I am a valid user that is logged in
	When I create the company "Facebook"
	Then I should see a successful company created message
	And I should be redirected to "Facebook"s show page
	And I should be able to view "Facebook" on the company index page

Scenario: A Registered User Cannot Add A Company That Already Exists
	Given I am a valid user that is logged in
	When I create the company "Microsoft"
	Then I should see a failure to create a company message
	And I should be redirected to "Microsoft"s show page

Scenario: A Registered User Can View All Feedbacks Of A Company
	Given I am a valid user that is logged in
	When I view the company "Microsoft"
	Then I should be able to view all of "Microsoft"s feedbacks
	And I should not be able to view any other companies feedbacks

Scenario: An Unregistered User Cannot View A Companies Information
	Given I am an unregistered user
	When I view the company "Microsoft"
	Then I should see a message saying you must sign i
	And I should not see "Microsoft"s information

Scenario: An Unregistered User Cannot View The List Of Companies
	Given I am an unregistered user
	When I view the companies index page
	Then I should see a message saying you must sign in
	And I should not see any of the companies names

Scenario: A registered user can view questions and comments diveded by type
	Given I am an unregistered user
	When I view the company "Microsoft"
	Then I should see "3" comments and "2" questions

Scenario: A registered user can view questions and comments diveded by type
	Given I am an unregistered user
	When I view the company "Microsoft"
	Then I should see all questions in question section

Scenario: A registered user can view questions and comments diveded by type
	Given I am an unregistered user
	When I view the company "Microsoft"
	Then I should see all comments in comments section
	
#TODO: Testing pagination or load more 
