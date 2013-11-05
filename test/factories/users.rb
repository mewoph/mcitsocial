FactoryGirl.define do
  factory :user do
  	first_name "Test"
  	last_name "Name"
  	bio "This is a bio"
  	matriculation_date "2013-12-10"
  	graduation_date "2013-12-14"
    is_current_student true
    is_parttime false
  	previous_work "Test work"
  	undergrad_major "Political Science"
  	undergrad_school "University of Awesome"
  	hometown "Pittsburgh"
		sequence(:email) {|n| "email#{n}@factory.com" }
		password 'something'
    password_confirmation 'something'
    languages "Java,Ruby,Rails"
    courses "CIT591,CIT592,CIT573"
    areas_of_interest "MCIT Social"
  end
end