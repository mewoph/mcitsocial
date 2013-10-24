FactoryGirl.define do
  factory :user do
  	first_name "Test"
  	last_name "Name"
  	bio "This is a bio"
  	matriculation_date "2013-12-10"
  	graduation_date "2013-12-14"
  	previous_work "Test work"
  	undergrad_major "Political Science"
  	undergrad_school "University of Awesome"
  	hometown "Pittsburgh"
		sequence(:email) {|n| "email#{n}@factory.com"}
		password 'please'
    password_confirmation 'please'
  end
end