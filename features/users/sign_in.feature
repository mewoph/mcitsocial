Feature: Sign In
	In order to allow users to access private content
	A validated user should be able to sign in

Scenario: User Is Not a Signed Up Individual and Logs In
	Given I am not a valid user
	When I sign in
	Then I should not be able to login succesfully
	And I should not have access to the private content

Scenario: User Signs In With Valid Credentials
	Given I am a valid user
	When I sign in 
	Then I should be able to login successfully
	And I should have access to the private content

Scenario: User Signs in With Incorrect Password
	Given I am a valid user
	When I sign in with the incorrect password
	Then I should see an error message
	And I should not have access to the private content

Scenario: User Signs In With Invalid Email
	Given I am a valid user
	When I sign in with an invalid email
	Then I should see an error message
	And I should not have access to the private content