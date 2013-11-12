# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users = User.create([{email: "User@user.com", first_name: "John", last_name: "Smith",
		is_current_student: true,
		bio: "A really awesome bio", matriculation_date: "2012-10-15",
		graduation_date: "2013-05-05", previous_work: "Test Dummy", 
		undergrad_major: "Computer Science", undergrad_school: "UPenn",
		hometown: "Philadelphia", password: 'something', 
		password_confirmation: 'something', areas_of_interest: "Ruby on Rails,Social Media", languages: "Java,Ruby,Puthon", 
		courses: "CIT590,CIT591,CIT592"}, 

		{email: "aminhas@seas.upenn.edu", first_name: "Abeer", last_name: "Minhas",
		is_current_student: true,
		bio: "MCIT Student", matriculation_date: "2010-08-05",
		graduation_date: "2012-05-05", previous_work: "Social Worker", 
		undergrad_major: "Political Science", undergrad_school: "Binghamton University",
		hometown: "Binghamton", password: 'something', 
		password_confirmation: 'something', areas_of_interest: "MCIT social", languages: "Java,Ruby", 
		courses: "CIT596,CIT550"},  

		{email: "cl@seas.upenn.edu", first_name: "Connor", last_name: "Liddic",
		is_current_student: false,
		bio: "Web Developer", matriculation_date: "2010-08-05",
		graduation_date: "2012-05-05", previous_work: "Program Manager ", 
		undergrad_major: "Graphic Design", undergrad_school: "Colgate University",
		hometown: "Albany", password: 'something', 
		password_confirmation: 'something', areas_of_interest: "MCIT", languages: "Ruby,Rails" , 
		courses: "CIT598,CIT552"},

		{email: "anfoster@seas.upenn.edu", first_name: "Anne", last_name: "Foster",
		is_current_student: false,
		bio: "MCIT Student", matriculation_date: "2010-08-05",
		graduation_date: "2012-12-20", previous_work: "Program Manager", 
		undergrad_major: "Business", undergrad_school: "Drexel University",
		hometown: "Philadelphia", password: 'something', 
		password_confirmation: 'something', areas_of_interest: "MCIT", languages: "Java,Rails" , 
		courses: "CIT550,CIT552, CIT573"}])

	companies = Company.create([{name: "Amazon"}, {name: "Microsoft"}, {name: "Apple"}])

	feedbacks = Feedback.create([{company_id: 1, adder_id: 1, feedback_content: "What is a linked list?", is_question: true}, 
								 {company_id: 2, adder_id: 2, feedback_content: "How do Hashmaps work?", is_question: true},
								 {company_id: 1, adder_id: 2, feedback_content: "If you would be a part of a Happy Meal which part would you be?", is_question: true},
								 {company_id: 3, adder_id: 3, feedback_content: "Don't wear a suit, they want everything to be casual", is_question: false},
								 {company_id: 3, adder_id: 1, feedback_content: "Describe a project you have worked on", is_question: true},
								 {company_id: 2, adder_id: 2, feedback_content: "Be sure to get there early, it is hard to find the right building", is_question: false},
								 {company_id: 1, adder_id: 1, feedback_content: "Interveiwer said they were looking to hire a lot of database people soon", is_question: false},
								 {company_id: 3, adder_id: 1, feedback_content: "Describe the difference between throw, throws and throwable in Java", is_question: true}])
	 
