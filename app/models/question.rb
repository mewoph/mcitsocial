# == Schema Information
#
# Table name: questions
#
#  id         :integer          not null, primary key
#  question   :string(255)
#  adder_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  company_id :integer
#

class Question < ActiveRecord::Base
  attr_accessible :question, :adder_id, :company_id
  belongs_to :company
end
