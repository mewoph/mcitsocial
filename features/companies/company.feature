Feature: Viewing and Creating Companies
	Users should be able to see a list of companies, view a
	company from the list, or add a company if it does not exist

Background:
	Given the following companies exist:
	| name |
	| Microsoft| 
	| Amazon| 
	And the following questions exist:
	| question 										| company |
	| What is that? 								| Microsoft |
	| Where am I? 									| Microsoft |
	| What is this? 								| Amazon | 
	| What is the meaning of life? 					| Amazon | 

Scenario: A Registered User Can View A List of Companies
	Given I am a valid user that is logged in
	When I click on the companies tab
	Then I should see a list of all existing companies

Scenario: A Registered User Can View A Company
	Given I am a valid user that is logged in
	When I view the company "Microsoft"
	Then I should see all of "Microsoft"s company information

Scenario: A Registered User Can Add a Company If It Doesn't Exist
	Given I am a valid user that is logged in
	When I create the company "Facebook"
	Then I should be see a successful company created message
	And I should be redirected to "Facebook"s show page
	And I should be able to view "Facebook" on the company index page

Scenario: A Registered User Cannot Add A Company That Already Exists
	Given I am a valid user that is logged in
	When I create the company "Microsoft"
	Then I should see a failure to create a company message
	And I should be redirected to "Microsoft"s show page

Scenario: A Registered User Can View All Questions Of A Company
	Given I am a valid user that is logged in
	When I view the company "Microsoft"
	Then I should be able to view all of "Microsoft"s questions
	And I should not be able to view any other companies questions

Scenario: An Unregistered User Cannot View A Companies Information
	Given I am an unregistered user
	When I view the company "Microsoft"
	Then I should see an error message
	And I should not see "Microsoft"s information

Scenario: An Unregistered User Cannot View The List Of Companies
	Given I am an unregistered user
	When I view the the companies index page
	Then I should see an error message
	And I should not see any of the companies name
	
#TODO: Testing pagination or load more 
