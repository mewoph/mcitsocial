# == Schema Information
#
# Table name: sub_comments
#
#  id           :integer          not null, primary key
#  commenter_id :integer
#  comment      :string(255)
#  content_id   :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'test_helper'

class SubCommentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
