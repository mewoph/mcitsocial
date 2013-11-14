Feature: Viewing and Creating Companies
	Users should be able to see a list of companies, view a
	company from the list, or add a company if it does not exist

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
	| What is that? 								  | 1          | true        | 1        |
 	| Where am I? 									  | 1          | true        | 1        |
	| What is this? 								  | 1          | false       | 2        |
	| What is the meaning of life? 	  | 1          | true        | 1        |
	| Another question 								| 2          | true        | 2        |
	| Yet Another Question        	  | 2          | true        | 1        |

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
	And I should not be able to view "Amazon"s feedbacks

Scenario: An Unregistered User Cannot View A Companies Information
	Given I am an unregistered user
	When I view the company "Microsoft"
	Then I should see a login required message
	And I should not see "Microsoft"s information

Scenario: An Unregistered User Cannot View The List Of Companies
	Given I am an unregistered user
	When I view the companies index page
	Then I should see a login required message
	And I should not see any of the companies names

Scenario: A registered user can view questions and comments diveded by type
	Given I am a valid user that is logged in
	When I view the company "Microsoft"
	Then I should see "1" comments and "3" questions

Scenario: A registered user can view questions and comments diveded by type
	Given I am a valid user that is logged in
	When I view the company "Microsoft"
	Then I should see all of "Microsoft"s questions in the question section

Scenario: A registered user can view questions and comments diveded by type
	Given I am a valid user that is logged in
	When I view the company "Microsoft"
	Then I should see all of "Microsoft"s comments in the comments section