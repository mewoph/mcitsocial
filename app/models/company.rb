# == Schema Information
#
# Table name: companies
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Company < ActiveRecord::Base
  attr_accessible :name
  has_many :feedbacks


#TODO - add order to questions and comments

  scope :questions, lambda {
    feedbacks.where(:is_question => true)
  }

  scope :comments, lambda {
    feedbacks.where(:is_question => false)
  }

  def num_questions
  	count = 0
  	feedbacks.each do |f|
  		count += 1 if f.is_question
  	end
  	count
  end

  def num_comments
  	count = 0
  	feedbacks.each do |f|
  		count += 1 if not f.is_question
  	end
  	count
  end


end
