Feature: Protips View 
	As a registered user of the website
	I should be able to view all protips on the index page and a single protip on its show page

Background:
	Given the following users exist: 
		| First Name | Last Name | Bio   | Is Current Student | Is Part Time | Matriculation Date | Graduation Date | Previous Work | Undergrad Major | Undergrad School | Hometown | Email | Courses | Languages | Interests |
		| Abeer      | Minhas    | MCIT Student | true | false  | 2010-08-05 | 2012-05-05 | Social Worker | Binghamton University | Political Science | Binghamton | aminhas@seas.upenn.edu | "CIT596,CIT550" | "Java,Ruby" |  "MCIT social" |
		| Connor    | Liddic | Web Developer | true | false | 2010-08-05 | 2012-05-05 | Program Manager | Colgate University | Graphic Design | Albany | cl@seas.upenn.edu | "CIT598,CIT552" | "Ruby,Rails" | "MCIT" |

	Given the following protips exist: 
		| Adder First Name | Title |  Content           | Number of Upvotes | 
		| Abeer            | ABC | Don't be afraid          |  10               |
		| Connor           | CDE  | Be scared          | 3                 |
		| Abeer            | EFG  | Yesss          | 20                 |
	Given the following comments exist:
		| Protip     | Adder Name | Comment |
		| ABC        | Abeer      | NO      |
		| CDE        | Connor     | YES     |
		| ABC        | Connor     | AHH     |
		| EFG        | Abeer      | What?   | 

	Given I am a valid user that is logged in

Scenario: A Registered User can view the protips index page
	When I view the protips index page
	Then I should see all protips
	And I should see the number of upvotes on each protip
	And I should see the name of the user who posted each protip

Scenario: A Registed Can View The Protips Show Page
	When I view the protip with title "ABC"
	Then I should be able to view the content of "ABC"
	And I should see the name of the user who posted the protip "ABC"
	And I should be able to see the comments for "ABC"

Scenario: A Protip Show Page Should Only Show Its Own Comments And Content
	When I view the protip with title "ABC"
	Then I should not be able to see comments for "CDE"
	And I should not be able to see comments for "EFG"
	And I should not be able to see the content for "CDE"
	And I should not be able to see the content for "EFG"

Scenario: A Protip Index Page Should Be Ordered By Upvotes
	When I view the protips index page
	Then the protips should be ordered by number of upvotes
	And I should see "EFG" at the top of the index
	And I should see "CDE" at the bottom of the index






