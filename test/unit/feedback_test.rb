# == Schema Information
#
# Table name: feedbacks
#
#  id               :integer          not null, primary key
#  company_id       :integer
#  adder_id         :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  feedback_content :string(255)
#  is_question      :boolean
#

require 'test_helper'

class FeedbackTest < ActiveSupport::TestCase
   test "test make company collection method" do
   	f = Feedback.first 
   	expected_array = [ ['Microsoft', 1], ['Yahoo', 2]]
   	assert_equal(f.make_company_collection, expected_array)
   end
end
