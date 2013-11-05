# == Schema Information
#
# Table name: feedbacks
#
#  id               :integer          not null, primary key
#  adder_id         :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  company_id       :integer
#  feedback_content :string(255)
#  is_question      :boolean
#

class Feedback < ActiveRecord::Base
  attr_accessible :question, :adder_id, :company_id
  belongs_to :company
end
