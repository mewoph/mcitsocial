# == Schema Information
#
# Table name: companies
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class CompanyTest < ActiveSupport::TestCase
   test "test return correct number of questions" do
     company = Company.find(1)
     assert_equal(3, company.num_questions)
   end

   test "test return correct number of comments" do
     company = Company.find(1)
     assert_equal(2, company.num_comments)
   end

   test "test return zero comments" do
     company = Company.find(2)
     assert_equal(0, company.num_comments)
   end

end
