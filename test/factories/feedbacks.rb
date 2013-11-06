FactoryGirl.define do
  factory :feedback do
  	feedback_content "Who are you?"
  	is_question true
  	adder_id 1
  	company_id 1
  end
end