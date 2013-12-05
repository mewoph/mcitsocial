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
  attr_accessible :id, :adder_id, :company_id, :feedback_content, :is_question, :created_at
  belongs_to :company
  validates :company_id, :presence => {:message => "Please select a company."}
  validates :feedback_content, :presence => {:message => "Feedback cannot be blank."}
  validates :is_question, :inclusion => {:in => [true, false], :message => "Must pick either interview question or comment."}
  paginates_per 10
  
  searchable do #can only search text fields on solr, so need to convert out string fields to text
  	text :feedback_content
  	string  :sort_feedback_content do
      feedback_content.downcase.gsub(/^(an?|the)/, '')
    end
    boolean :is_question
    time :created_at
  end

  def count_responses
    count = Comment.where(:content_id => id).count
    if count == 1
      return count.to_s + " Response"
    else
      return count.to_s + " Responses"
    end
  end

  def adder_name
  	User.find(adder_id)
  end

  def get_company_name(id)
    Company.find(id).name 
  end

  def get_sub_comments(id)
    SubComment.where(:content_id => id)
  end

  def get_created_time
  	created_at.strftime('%b %d, %Y')
  end

  def make_company_collection
    collection = Array.new
    companies = Company.order(:name)
    companies.each do |company|
      collection.push([company.name, company.id])
    end
    collection
  end

end
