Given I am a valid user that is logged inGiven I am a valid user that is logged inFeature: Protips View 
	As a registered user of the website
	I should be able to view all protips on the index page and a single protip on its show page

Background:
	Given the following users exist: 
		| First Name | Last Name | Bio   | Is Current Student | Is Part Time | Matriculation Date | Graduation Date | Previous Work | Undergrad Major | Undergrad School | Hometown | Email | Courses | Languages | Interests |
		| Abeer      | Minhas    | MCIT Student | true | false  | 2010-08-05 | 2012-05-05 | Social Worker | Binghamton University | Political Science | Binghamton | aminhas@seas.upenn.edu | "CIT596,CIT550" | "Java,Ruby" |  "MCIT social" |
		| Connor    | Liddic | Web Developer | true | false | 2010-08-05 | 2012-05-05 | Program Manager | Colgate University | Graphic Design | Albany | cl@seas.upenn.edu | "CIT598,CIT552" | "Ruby,Rails" | "MCIT" |

	Given the following protips exist: 
		| Adder First Name | Title |  Content        | Number of Upvotes | Category ID  |
		| Abeer            | ABC   | Don't be afraid |  10               | 1            | 
		| Connor           | CDE   | Be scared       | 3                 | 2            |
		| Abeer            | EFG   | Yesss           | 20                | 3            |
		| Abeer            | HIJ   | Something       |  55               | 1            | 
		| Connor           | JKL   | Thinking        | 300               | 1            |
		| Abeer            | LMO   | What            | 0                 | 3            |
	Given the following comments exist:
		| Protip     | Adder Name | Comment |
		| ABC        | Abeer      | NO      |
		| CDE        | Connor     | YES     |
		| ABC        | Connor     | AHH     |
		| EFG        | Abeer      | What?   | 

	

Scenario: A Registered User can view the protips index page
	Given I am a valid user that is logged in
	When I click on protips link in the nav bar
	Then I should see the four categories
	# Then I should see all protips
	# And I should see the number of upvotes on each protip
	# And I should see the name of the user who posted each protip

Scenario: A Registered Use Can View The Protips With Category "Philly Tips"
	Given I am a valid user that is logged in
	When I click on the protips link in the nav bar
	Then I should be able to click on the "Philly Tips" category 
	And I should be able to view all protips categorized as "Philly Tips"


Scenario: A Registered Use Can View The Protips With Category "Interview Tips"
	Given I am a valid user that is logged in
	When I click on the protips link in the nav bar
	Then I should be able to click on the "Interview Tips" category 
	And I should be able to view all protips categorized as "Interview Tips"

Scenario: A Registered Use Can View The Protips With Category "Penn Tips"
	Given I am a valid user that is logged in
	When I click on the protips link in the nav bar
	Then I should be able to click on the "Penn Tips" category 
	And I should be able to view all protips categorized as "Penn Tips"

Scenario: A Registered Can View The Protips Show Page
	Given I am a valid user that is logged in
	When I click on protips link in the nav bar
	And I click the protip with title "ABC"
	Then I should be able to view the content of "ABC"
	And I should see the name of the user who posted the protip "ABC"
	And I should be able to see the comments for "ABC"

Scenario: A Protip Show Page Should Only Show Its Own Comments And Content
	Given I am a valid user that is logged in
	When I view the protip with title "ABC"
	Then I should not be able to see comments for "CDE"
	And I should not be able to see comments for "EFG"
	And I should not be able to see the content for "CDE"
	And I should not be able to see the content for "EFG"

Scenario: A Protip Index Page Should Be Ordered By Upvotes
	Given I am a valid user that is logged in
	When I view the protips index page
	And I click on category "1"
	Then the protips should be ordered by number of upvotes
	And I should see "EFG" at the top of the index
	And I should see "CDE" at the bottom of the index

Scenario: An Unregistered User Should Not Be Able To View Protips
	Given I am an unregistered user
	Then I should not be able to view the protips index page
	And I should not be able to view the protips show page

Scenario: A Registered User Can Nagivate to Protip Adder's Profile Page
	Given I am a valid user that is logged in
	When I view the protips index page
	And I click on category "1"
	And I click on "Abeer Minhas" within the protip "ABC"
	Then I should see the profile of "Abeer"

Scenario: A Registered User Should See the Same Number of Protip Titles and of Adder Names
	Given I am a valid user that is logged in
	When I view the protips index page
	Then I should see equal number of protip titles and adder names







