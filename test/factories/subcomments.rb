FactoryGirl.define do
  factory :subcomment do
  	commenter_id 1
    comment "This is a subcomment"
    content_id 1
  end
end