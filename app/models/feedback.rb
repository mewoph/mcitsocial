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
  attr_accessible :id, :adder_id, :company_id, :feedback_content, :is_question
  belongs_to :company
  validates :feedback_content, :presence => {:message => "Feedback cannot be blank."}
  validates :is_question, :inclusion => {:in => [true, false], :message => "Must pick either interview question or comment."}
  paginates_per 5
  
  def adder_name
  	user = User.find(adder_id)
  	user.full_name
  end

  def get_company_name(id)
    Company.find(id).name 
  end

  def get_created_time
  	created_at.strftime('%b %d, %Y')
  end

  def make_company_collection
    collection = Array.new
    Company.all.each do |company|
      collection.push([company.name, company.id])
    end
    collection
  end

end
