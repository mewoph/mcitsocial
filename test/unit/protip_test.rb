# == Schema Information
#
# Table name: protips
#
#  id                 :integer          not null, primary key
#  adder_id           :integer
#  title              :string(255)
#  content            :text
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  category           :string(255)
#  cached_votes_total :integer          default(0)
#  cached_votes_score :integer          default(0)
#  cached_votes_up    :integer          default(0)
#

require 'test_helper'

class ProtipTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
