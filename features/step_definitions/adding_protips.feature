Feature: Adding Protips
	Registered Users should be able to add protips

Background: 
	Given I am a valid user that is logged in

Scenario: A Registered User Can Navigate to Create Protip Page
	When I click on protips link in the nav bar
	And I click on add protips link
	Then I should be able to enter protips title
	And I should be able to enter protips content


Scenario: A Registered User Can Create a New Protip
	When I create a protip with title "ABC" and content "DEF"
	And I click create protip button
	Then I should see a success protip created message
	And I should see the protip show page with the title "ABC" and content "DEF" and my name as adder name
	And I should see the protip with the title "ABC" on the protips index page

Scenario: A Registered User Can Cancel Protip Creation
	When I click on protips link in the nav bar
	And I click on add protips link	
	And I click cancel button
	Then I should be redirected back to protips index page

Scenario: A Registered User Cannot Successfully Create a Protip Without Title
	When I create a protip with content "ABC" and with no title
	Then I should see an error message
	And the protip with content "ABC" should not exist

Scenario: A Registered User Cannot Successfully Create A Protip Without Content
	When I create a protip with title "ABC" and with no content
	Then I should see an error message
	And the protip with title "ABC" should not exist



