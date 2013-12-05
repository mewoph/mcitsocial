Feature: Adding, Viewing, Upvoting Protips Comments
	Registered Users should be able to add comments to existing protips, to view comments, and to upvote comments

Background: 
	Given I am a valid user that is logged in
	Given I am on a protips show page

	Given the following users exist: 
		| First Name | Last Name | Bio   | Is Current Student | Is Part Time | Matriculation Date | Graduation Date | Previous Work | Undergrad Major | Undergrad School | Hometown | Email | Courses | Languages | Interests |
		| Abeer      | Minhas    | MCIT Student | true | false  | 2010-08-05 | 2012-05-05 | Social Worker | Binghamton University | Political Science | Binghamton | aminhas@seas.upenn.edu | "CIT596,CIT550" | "Java,Ruby" |  "MCIT social" |
		| Connor    | Liddic | Web Developer | true | false | 2010-08-05 | 2012-05-05 | Program Manager | Colgate University | Graphic Design | Albany | cl@seas.upenn.edu | "CIT598,CIT552" | "Ruby,Rails" | "MCIT" |

	Given the following protips exist: 
		| Adder First Name | Title |  Content        | Number of Upvotes | Category       |
		| Abeer            | ABC   | Don't be afraid |  10               | Philly Tips    | 
		| Connor           | CDE   | Be scared       | 3                 | Penn Tips      |
		| Abeer            | EFG   | Yesss           | 20                | Interview Tips |
		| Abeer            | HIJ   | Something       |  55               | Miscellaneous  | 
		| Connor           | JKL   | Thinking        | 300               | Penn Tips      |
		| Abeer            | LMO   | What            | 0                 | Philly Tips    |
	Given the following protip comments exist:
		| Protip     | Adder First Name | Comment | Number of Upvotes |
		| ABC        | Abeer            | comment1 |	10		      |
		| ABC        | Connor           | comment2 |	2 		      |
		| ABC        | Connor           | comment3 |	20 		      |
		| ABC        | Abeer            | comment4 |    47		      |

Scenario: A Registered User Can Add a New Comment To a Protip
	When I enter "ThisIsMyComment" in the comment field
	And I click submit comment
	Then I should see a success comment created message
	And I should see "ThisIsMyComment" on the protips show page
	And I should see "AdderName" along with the comment

Scenario: A Registered User Cannot Add a Blank Comment
	When I enter nothing in the comment field
	And I click submit comment
	Then I should see an comment adding error message

Scenario: A Registered User Can See All Comments for a Protip
	Then I should see all comments for the protip titled "ABC"
	And I should see the name of the user who posted each comment
	And I should see the date the comment was posted

Scenario: A Registered User Can See the Number of Upvotes a Comment Has
	Then I should see how many upvotes a comment for the protip has

Scenario: A Registered User Can See If She Has Upvoted a Comment
	Then I should see if I have upvoted a comment for the protip

Scenario: A Registered User Can Navigate to Comment Adder's Profile Page
	When I click on "Abeer Minhas" within the protip "ABC"
	Then I should see the profile of "Abeer"

Scenario: A Registered User Can Upvote a Comment
	When I click on the upvote link for a comment
	Then The number of upvotes for the comment should increase by one
	And I should see that I have upvoted the comment
	And The upvote link should turn into undo link

Scenario: A Registered User Can Undo a Comment
	When I click on the upvote link for a comment
	And I click on the undo link
	Then The number of upvotes for the comment should decrease by one
	And I should see the upvote link

Scenario: A Registered User Cannot Upvote More Than Once
	When I click on the upvote link for a comment
	Then I should not see the upvote link

Scenario: Comments Should Be Ordered by the Date Posted
	Then I should see the comment "comment1" as the first comment
	And I should see the comment "comment2" as the second comment
	And I should see the comment "comment3" as the third comment
	And I should see the comment "comment4" at the last comment

